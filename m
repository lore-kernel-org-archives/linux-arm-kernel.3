Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEEC9CD0424
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 22:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jt7YiDCywn6pYyTWeWllvr8jjBbiVlGPLg10vWe4nUg=; b=wlYF4RwRORl5+4lgbrcBUkQcim
	d7RwZcJ0Wm/JFJ6Jgbb12vI1+N0w1WWWdj4I8klK9SQyalVDeCJGfrXVIzzodyb/scXjBegLF6XTo
	t98EVKS7lMOF5DMluF/+bL/1yeo9KSRMSiufiit7mnp9o5vjhIBp0gOWulwZVQSzp6v8jnsw/5kAK
	xsQVL4egAtN7mqeIedrTlWF6SwnDn4O1jQwG8pBcMKqnTMCkI8ZJNTrkqEqRPcqEERbrSuFeQLCdB
	Ui7ZLU2CeRAoBioOQtv8No54NB6XVdoIjurCyEbNlD89VbHe4JiN+Zo+DRzdMzowadyVynTmx0zN1
	bEtkORUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXY-0000000CD1H-1aoA;
	Mon, 05 Jan 2026 22:59:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vctXW-0000000CCz1-3OY5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 22:59:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F41A860144;
	Mon,  5 Jan 2026 22:59:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2DFC19424;
	Mon,  5 Jan 2026 22:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767653945;
	bh=0EsaXgqqpmOSYRjimpQeYsK2n0KiWjDF7ZngGi0fb6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A0/06ytFx96DMxTEJTbErPGErNbj9hSCVeLeWdsqV4AlNAEy3xnyJIm5ALlCcQLYc
	 QKxYJc9e1E34B6cdq9ei6HxWilhmcNBH9JPFZO2+safy/HXVYxv+QwSP4JSkWNgiyD
	 9+ObCDA4qq0epgTV1pYDk0yCbOEqpD5jCWWwHiF9PIci18qtWeTFIk6YeLuslPSpAq
	 Y+t6dUyDvGOxVGQlwuK6kcF+G/SAPWjMoJsW6IkDLEPBQfUdKKeOvZFzT697afFxFS
	 fU3wbpQk9s4Cp1s/uGSnbzdXNgR/cmGpAXkcCwGwdxG8v53+7VkiaiwyeKiREoRpHL
	 J5UlFWaWhVwXg==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wangzhou1@hisilicon.com,
	shenjian15@huawei.com,
	linuxarm@huawei.com
Subject: Re: [PATCH] arm64: Add support for TSV110 Spectre-BHB mitigation
Date: Mon,  5 Jan 2026 22:58:28 +0000
Message-ID: <176764727038.1448075.15030241284048815190.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251227092448.732059-1-yangjinqian1@huawei.com>
References: <20251227092448.732059-1-yangjinqian1@huawei.com>
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

On Sat, 27 Dec 2025 17:24:48 +0800, Jinqian Yang wrote:
> The TSV110 processor is vulnerable to the Spectre-BHB (Branch History
> Buffer) attack, which can be exploited to leak information through
> branch prediction side channels. This commit adds the MIDR of TSV110
> to the list for software mitigation.
> 
> 

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: Add support for TSV110 Spectre-BHB mitigation
      https://git.kernel.org/arm64/c/e3baa5d4b361

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

