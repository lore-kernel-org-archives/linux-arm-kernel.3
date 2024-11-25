Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7787D59D62
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6RinLSGQwKcpR3iJx4C3zUCImBYudJVrxxiLyN7aRrE=; b=gfO/OppPkcTYX/eg5V1l2Mj4xg
	FvPvJ9mwaHIz2owDaSYSC+XoUKceMoNvvFoI080/DFlDgouOGzmSnB/IFoeU5w9L4+15/tDqhFzkE
	MQvKaOKht1daLEKsHzF/9SSW5/MTXsc3x3JhGLNAFyVBBkuAnYMOfB4jevDFFhpYkEAHsnItyTT4r
	lszC9eu3dFi8RqaYqahJqrS/9KhRL3F9+FGY7JYiO4dR0EqbaQBee6ZTlnC59/JMXRo9OECIvljn0
	ERYDUkihSKlt0bCispsNIw7SuV0osmNLjm+DwhIBwRYJM9141d6HedC7twMKGyvZ+9NZSs7GsNZ09
	QXp/P+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeYo-00000008wYm-10s1;
	Mon, 25 Nov 2024 19:15:50 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFeW7-00000008w8f-0bW9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 19:13:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 769E0A41903;
	Mon, 25 Nov 2024 19:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E31C4CECE;
	Mon, 25 Nov 2024 19:13:00 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Namhyung Kim <namhyung@kernel.org>
Cc: Stephane Eranian <eranian@google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] perf/arm-cmn: Ensure port and device id bits are set properly
Date: Mon, 25 Nov 2024 19:12:58 +0000
Message-Id: <173256196647.1188888.6538951137157343141.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121001334.331334-1-namhyung@kernel.org>
References: <20241121001334.331334-1-namhyung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_111303_242837_C92582C7 
X-CRM114-Status: UNSURE (   7.97  )
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

On Wed, 20 Nov 2024 16:13:34 -0800, Namhyung Kim wrote:
> The portid_bits and deviceid_bits were set only for XP type nodes in
> the arm_cmn_discover() and it confused other nodes to find XP nodes.
> Copy the both bits from the XP nodes directly when it sets up a new
> node.
> 
> 

Applied to arm64 (for-next/fixes), thanks!

[1/1] perf/arm-cmn: Ensure port and device id bits are set properly
      https://git.kernel.org/arm64/c/dfdf714fed55

-- 
Catalin


