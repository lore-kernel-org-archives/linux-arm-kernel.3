Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40477CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 18:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVPZWOGdHWtR2CVlcFx2tpHqGVjK2aNUkDrR5qAHZKk=; b=kVAPZ7+ff2z0oIPWRikmcCedDS
	0EnzDyOKaT6TOLGVzQlni3WQgv6AtSvgRJUxl6/53RdzYUGSblvyYrg0XGjx/H8Y1bGSW6ywZbYy3
	D6xRZjbegOCY493PgbOIToMdriSQ1mSFcs8enali0jxKlVdhzi4VWStqHYSSDOy/APs1rMnwlVWSx
	LxQHK3YacqCKToimFYYllW7mipQn1Yo5esKrQoE5w0Y/Ou64euy86MXUTgzqLMAiZORSQ4/6jlhCe
	HG6Vw0whgySuZMsT00kAc7lH69ZQbUrjLAQF//oWd53yy684BPaGK2RPiQKHC487JEebXYD26xCKk
	7fTz3hEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcXe-0000000Axjw-09gY;
	Thu, 13 Nov 2025 18:59:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJcXd-0000000Axjh-1b0Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 18:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72B7460122;
	Thu, 13 Nov 2025 18:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B540C19422;
	Thu, 13 Nov 2025 18:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763060372;
	bh=F2bQ+XQbUaZUjs1Xt96NSZK8kaysy6fQf97pHBE+eg4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ub15V7pUcvO+3uAssuTCicljpioc/2ci0kxHfB9FgcYYG8Vr/O6nTlKxyn4uBMj5h
	 pqwHRcg5K1ErpGqAfarnqGEpibqHA0VShpwAzzJoPO3MozNBY3MAaeA3CzqzX5zSFG
	 XsrC87Cgn6++MUBpOVKNDEI6TfzlTOqscs8S06s8faeFtVrDbCgRLjXoPm1pVekpG9
	 YcQBbUpIMIkKeqEzn0ndVi1eAR3yzFmd4pEOLZBooFXmEiAzILGII3uvqb5uWlywD3
	 byeR88k1p4iH9Fi806zQyfSdkGt7QfNc7x/QKkD9imOOk6+S1C1+aBmeU3OozArAUg
	 ZWod8/0AHdD3g==
From: Catalin Marinas <cmarinas@kernel.org>
To: ryan.roberts@arm.com,
	dev.jain@arm.com,
	cl@gentwo.org,
	will@kernel.org,
	Yang Shi <yang@os.amperecomputing.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v2 PATCH] arm64: mm: make linear mapping permission update more robust for patial range
Date: Thu, 13 Nov 2025 18:59:18 +0000
Message-ID: <176306032241.2459767.8275191874359460210.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251023204428.477531-1-yang@os.amperecomputing.com>
References: <20251023204428.477531-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Thu, 23 Oct 2025 13:44:28 -0700, Yang Shi wrote:
> The commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
> permissions for vmalloc_huge mappings") made permission update for
> partial range more robust. But the linear mapping permission update
> still assumes update the whole range by iterating from the first page
> all the way to the last page of the area.
> 
> Make it more robust by updating the linear mapping permission from the
> page mapped by start address, and update the number of numpages.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: mm: make linear mapping permission update more robust for patial range
      https://git.kernel.org/arm64/c/37cb0aab9068

-- 
Catalin


