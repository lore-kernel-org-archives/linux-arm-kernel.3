Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E99C54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 11:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVF4mkeG431UaBjqsM0k0WtN0kGDgCLNowxClYevd/M=; b=JZp/AHdjXonidGXL4sbtYChR7B
	HgEKNTpd9/ewMX8FykH/BhfbVDA3sp89s4rNJ3591jPQSTjsf20y1QtPA+dDkzr6XatFsE7skKudX
	nCV1X1AxbkLG2u/UJmKGwYBGsOFM52re250PCEqnX/bS4X376pdDwzaf2SgGk797ewg1TANrAaacb
	nimCtEzQUisi7QZL/IUto6LqnMFtTmCKdSWkpC2Yo8vZp7uRMDxk0A3Oy0q7rXcRuHnALnq8qGha2
	oTuh48b2Nf2s6Xrs+wPFqXIk/j+I3O9NXsQ95b2A8P66J7AIzPAhnQ5DUWkD3FA3Cj/u5V2Px+CN/
	n5hcOJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofms-000000052si-0Z7M;
	Tue, 28 Jul 2026 11:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofmd-000000052ol-28I7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 11:15:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9162860AAD;
	Tue, 28 Jul 2026 11:15:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7491F000E9;
	Tue, 28 Jul 2026 11:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237338;
	bh=xVF4mkeG431UaBjqsM0k0WtN0kGDgCLNowxClYevd/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GcNFcxaVq8q99R3jJK+nVtOR/0Sr//p0Cc6v1f9FuDMh1e3cW0sZGjtHkIo4Ve2sH
	 NWvNo2evGes9zLHviNLnPGfzxBAFutwLhTXgKfAFiktKonywkex6DrN3ZV4EEsCRHA
	 nEHHY/prRZlqUmX8YYmKfyzvFEswhxc0GpXDPKvqHrUH2BXxb5HqybL4FSOhoJw/MU
	 cCG2ASyqx2SIdwCOA+Bkhuk5n9hp6MeYSs4G1W4XOaozQ4bnaLswOrlIzAyPlMddnA
	 pI4hmmbMIv0dSrY4nIS0+wYcvKOXwUtQF0JCQExtJDhgyRpIJZ5eGb4IL99THlF/1M
	 dQmiEcW5tI0CA==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	James Morse <james.morse@arm.com>,
	Liu Song <liusong@linux.alibaba.com>,
	shechenglong <shechenglong@xfusion.com>,
	Jonathan Marek <jonathan@marek.ca>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] arm64: proton-pack: Restore the nospectre_bhb command-line option
Date: Tue, 28 Jul 2026 12:15:25 +0100
Message-ID: <178523456585.2480895.13455325016626613930.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260726182253.6939-1-kmehltretter@gmail.com>
References: <20260726182253.6939-1-kmehltretter@gmail.com>
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

On Sun, 26 Jul 2026 20:22:53 +0200, Karl Mehltretter wrote:
> Commit 7f1635737823 ("arm64: proton-pack: Fix hard lockup due to print in
> scheduler context") moved the "mitigation disabled" printks into
> spectre_print_disabled_mitigations(). For spectre-v2 and spectre-v4 only
> the pr_info_once() calls were removed, but for spectre-bhb the whole
> branch went with the print:
> 
>   -   } else if (cpu_mitigations_off() || __nospectre_bhb) {
>   -           pr_info_once("spectre-bhb mitigation disabled ...\n");
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: proton-pack: Restore the nospectre_bhb command-line option
      https://git.kernel.org/arm64/c/2f6fc0612607

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

