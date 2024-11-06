Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A58CD59F48
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 15:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePljbFwMTWesJ64DIIpthfcMve/F0zAPiwxHYPY7Vg0=; b=JVpWrb36WGHLhGVrFVuLGqlHUe
	9uJV09t/UKXSunY2DnNsaX9p8XoqqEPpRpbu7ZYrNhn9LKYVjUwG/g33zYhgLc8bomWfepSQT5CAm
	ceAVPZDymE8BOk5Iuh3j6FqjKhgLFoooYULvXeaMjXbZlssrpsLn1AY2LIkXY5uW1YExKk1Y+F7KG
	n6CJhhsxftfeagK5vm+jHvwdsKc1EFyO/vUtvNlaauRXiBbZoo6fFFR5Dqkbu6yTugKnohc+TtqdI
	Ql5dpKTWWp9AkTZ3uv6NFaM86ETGCWIBglpgC/DUFhNzFoP+hK3b37J6JbccakRJBdeyA4Ts8ypqx
	dCBH6S1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iQk-00000003v2q-1xzP;
	Wed, 06 Nov 2024 15:58:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8iLg-00000003uBf-2ZSY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 15:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B64F95C58B1;
	Wed,  6 Nov 2024 15:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEFF0C4CEC6;
	Wed,  6 Nov 2024 15:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730908415;
	bh=yHMCAoudXN5fnku5pcgH+aefArhypCR1gh8Jsd4QJUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aiVcTwUQPVlSnGn6+iH2YTgeRtApTaXlCAA+UcDAJjN+PkNK6Hg830auxRrH8KBF8
	 SVSnKS0hQQqFxIXBbPNvmAIBSHJqpnWDg5FWWzNhHjXQBXj3cmdZvbCMPkiuEgSzVo
	 TpJ2zbq+MuqVxH3l9ONKe/yN0NVogthDaNeZGCsrLPJ8noLB8NABGDGieOHzPH/ZA/
	 2eMMfD33GhwmxgDQFoBu9ARfScCWPHorDjQJWLKJFN/c2kBkP4qfRYPgX6rHsGZ3Wz
	 XXibRTB/qyCHT9T0uUx67IOgXsQmbnbR0WdihTdFiEB1edGGpPw9a7jS55mmg19LL0
	 VK/L/dLSeXCcw==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] perf: Switch back to struct platform_driver::remove()
Date: Wed,  6 Nov 2024 15:53:24 +0000
Message-Id: <173090258078.3747718.1416591219243529975.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241027180313.410964-2-u.kleine-koenig@baylibre.com>
References: <20241027180313.410964-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_075336_712086_3040F3CD 
X-CRM114-Status: GOOD (  10.43  )
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

On Sun, 27 Oct 2024 19:03:14 +0100, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/perf to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: Switch back to struct platform_driver::remove()
      https://git.kernel.org/will/c/845fd2cbedaf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

