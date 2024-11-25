Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6B2D59D65
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3mBNcQYC8XVooGqU36uLdQcRs9nkmn6+6KYbKN0CvQA=; b=oAncTAnXyYZW3cNA2SB/oooOfW
	CVeoyZaHdoegjzIemj+QsEPzP5QVJ5+aiRbq0chgpR+MU5h2RwQp23Vlg5FeYNCWBeMufpXyLuRXT
	oJMNP03C2W0Qg/xaGB5XNl6MRsJ9jn/dguaO0hIDKqdaSVvfcYURevkLFbsmHeDufBBHn28vYwyJn
	KpPBmumo3E4x1lBYNmw/cVEwwlN8Ih9CGc1Ws9Obqse5ZjsnyN/4y2MgBWTpjMzbvVZbhdpEBUXyK
	LKEE+waKD8ypLiIqcMrwbFw+lZ6h2un52vF/4B5uw9djOUoDv5+UM1GJxkmcPAPeiD6+oVJ4E9uMJ
	EJpj3Cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeWx-00000008wHs-19uY;
	Mon, 25 Nov 2024 19:13:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeVz-00000008w6r-2eGs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CECBBA4191E;
	Mon, 25 Nov 2024 19:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85486C4CED2;
	Mon, 25 Nov 2024 19:12:51 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	Chun-Tse Shao <ctshao@google.com>
Cc: Will Deacon <will@kernel.org>,
	Greg Thelen <gthelen@google.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Tuan Phan <tuanphan@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
Date: Mon, 25 Nov 2024 19:12:49 +0000
Message-Id: <173256196647.1188888.266499753445785167.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241108050806.3730811-1-ctshao@google.com>
References: <20241108050806.3730811-1-ctshao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111255_768668_8C5BC8D4 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, 08 Nov 2024 05:08:05 +0000, Chun-Tse Shao wrote:
> Same as
> https://lore.kernel.org/all/20240514180050.182454-1-namhyung@kernel.org/,
> we should skip `for_each_sibling_event()` for group leader since it
> doesn't have the ctx yet.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] perf/arm-smmuv3: Fix lockdep assert in ->event_init()
      https://git.kernel.org/arm64/c/02a55f274301

-- 
Catalin


