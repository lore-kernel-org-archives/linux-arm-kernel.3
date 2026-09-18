Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A409AC982DD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GF57Guc/hEoVR1W9U/7839FvcxFLrW5Z7yneN/laqwY=; b=gFWtWvKQJ5NIWxQm78SGBzBgxU
	B0MZVkGniaySlMSol22R011iBUPyO0bsxLXMtaSAHnoO5mNIUaxRp5RNJ3Xr9kUOr8oSAzUkPEUdD
	tqkYSoXeenjmz0wlCk6HKP7MlNn6LTfIDFPukTnpTZNiwvrF7VMNWxkoueBuH3rNHAgtJT/9wkxiE
	yWqcxoIx9GeO/UTuZRrgqsfNvJjLfbpiDwZrl1p5WNAb10alWr6Wdbx29IwDK1L2SSZ4G/NkRrXIn
	pJsq2nvd8nJRevRyBiQxysmNpWxJuX+v5jIA+stULySA1hy+y6a6DlPOUHooBSuatimzrqxJpuR1k
	1WDGddnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Xhj-0000000EMgI-2KNb;
	Fri, 18 Sep 2026 12:28:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XhW-0000000EMcd-0xDe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 12:28:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 786BE60A89;
	Fri, 18 Sep 2026 12:28:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB0A1F00898;
	Fri, 18 Sep 2026 12:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789734501;
	bh=GF57Guc/hEoVR1W9U/7839FvcxFLrW5Z7yneN/laqwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aavxnDm3rLFcdc2xDDtdRHhWAkkn7ROT0+84yG6Q0r1tqZQkC8NNmYieKrOnZhOgJ
	 r7obWAvVm9jfF2yObC61EHeJ5I8YFL6pXuLcu0G9ri2VKMANMM914vGlN0vcu6BgjJ
	 6ePy4bH4JivPjNbWt6Unug5Ot45RmMrkAWJzI4JAHFoXHi+nRgjuDXpAD2MnhVfOmg
	 9fjg/RpM/DUNo8sR6wTPYB8bRlYBLz361d9E97CFMtAHGTFztPRlJCK9lnL0C+M3qk
	 MX+LmyaQsQEBrPC5nBhbWbB7UXQ1ReX9dNHfghvU2ar606E3E/xsbLT3BssLxJ9JPV
	 itc4mogiZzE6Q==
From: Will Deacon <will@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH RESEND] arm64: Add override for WFxT
Date: Fri, 18 Sep 2026 13:28:07 +0100
Message-ID: <178973022288.2321839.7112827418351546215.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
References: <20260911-idreg-override-wfxt-v1-1-7917636741f3@cyberchaos.dev>
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

On Fri, 11 Sep 2026 19:02:10 +0200, Yureka Lilian wrote:
> Add an override for WFxT support within ID_AA64ISAR2_EL1 to allow
> it to be disabled using the new arm64.nowfxt command line parameter.
> 
> This accompanies the idle=nop param introduced in a previous patch
> series [1] in dealing with misbehaving WFI and WFIT instructions on
> Apple Silicon SoCs, and eases debugging of other quirky WFxT
> implementations.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: Add override for WFxT
      https://git.kernel.org/arm64/c/baaa9b126b87

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

