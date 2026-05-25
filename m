Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D17FCD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 13:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0RMJjAHWqyWy9+AJ9H06yOL2LwCm6J9B8UqN1UPs2w=; b=RLsI+kg3TSKAH8KHF1EkYAayXi
	zkYXAIOmNQM58dHSiUx3vTOhQMWo5aK8k+esHIzTgVL2iMeb5awTg/Ui5D60V48Cmu5LlpCvtG+Al
	z7/FTOuQakRHpaerfaJZrqCQizmiAm/EGnxOQiqlWAe8IK7DMJdMINsXVVKDNPdfHAvD1i/G0ELyY
	+GSKQBdI82/syregTsGNp3TvKG+r1IGQ9TNIgOfF01zqJnoRNWo7CKJBMtZFUiSJXrGci23VT45OV
	MSE0b6gNPTVv/AHGOGNoxVF+DFMfV3LB/WT12id2YN75+NTUArhtvaU/doPZIIy0XJe2RmwmPoicr
	R2v+4CvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVTP-0000000HKRk-3VVc;
	Mon, 25 May 2026 13:36:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRVTN-0000000HKRX-3Hau
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 13:36:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CEDF3600BB
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 13:36:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852531F000E9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 13:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716160;
	bh=u0RMJjAHWqyWy9+AJ9H06yOL2LwCm6J9B8UqN1UPs2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VSUwKD/ub+SbB3wLR882TGC1/3wQU54et45+hGMHTTjjq9pFHM+9BOIQv5zC9XXye
	 EoWULDZ3RTjFAPybkKY8nI3tpbiOuo0VCPuze01vLviuSR0aaU4jITw0TRASFA17jL
	 QFWSHX+dqAFvsQRA3ZqAUNxEhiABHmS5s1XkcjE7efrnQxRGuU/LdZ1Wfiy4IN+Sne
	 lLRFojBKT2hKLX4Wb6MT/iwWG2kuq1BDGgv4llI09fEjTLKwTGcWM/4oijja93wwsL
	 mBjXPa9PnE0uR6n5CXIZ7bBVXEGQQZd5HxCdu5t55lx3GrtYGqO9BLOTd1/yq4EfXv
	 YRlhUGINKWg6w==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a877510541so10540821e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 06:36:00 -0700 (PDT)
X-Gm-Message-State: AOJu0Yw+a50laJBvIaQhr4qf+OdHno+u2fJ9fLPdAz889VD7B3B6T7fR
	drARm1Hgrl/gs26x7HmWjC3FQ26BTQ1/OiCR543tgQ4xDwhNfiGXS8uaNagQYy7/N7bIIMSA9t1
	1t8HRH52uSy/RI9DGZbJ2tYg4oBrMN0M=
X-Received: by 2002:a05:6512:3b0c:b0:5a4:19df:db1 with SMTP id
 2adb3069b0e04-5aa323955bbmr4291220e87.15.1779716159284; Mon, 25 May 2026
 06:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260523000839.430550-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260523000839.430550-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 15:35:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=QxG=e62aOBXCzuud-nMEKtiUd-6_iUAudB0DJRWJwzw@mail.gmail.com>
X-Gm-Features: AVHnY4LDI6vxBXLqwE84v0ki3A2Awopm667wN_NRC27OvkeJ-A9wL0KQy7uuB6s
Message-ID: <CAD++jL=QxG=e62aOBXCzuud-nMEKtiUd-6_iUAudB0DJRWJwzw@mail.gmail.com>
Subject: Re: [PATCH] ARM: mm: fix kexec and hibernation with CONFIG_CPU_TTBR0_PAN
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	bcm-kernel-feedback-list@broadcom.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Kees Cook <kees@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Florian,

thanks for digging in and finding this!

On Sat, May 23, 2026 at 2:08=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> Commit 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0
> page table walks disablement") implemented PAN for LPAE kernels by
> setting TTBCR.EPD0 on every kernel entry, disabling TTBR0 page-table
> walks while running in kernel mode. The commit correctly updated
> cpu_suspend() in arch/arm/kernel/suspend.c, but missed two other code
> paths that switch the CPU to the identity mapping before jumping to
> low-PA (TTBR0-range) physical addresses:
>
> 1. setup_mm_for_reboot() in arch/arm/mm/idmap.c, used by the kexec
>    reboot path. With TTBCR.EPD0 still set, the subsequent branch to
>    the identity-mapped cpu_v7_reset causes a PrefetchAbort because the
>    TTBR0 page-table walk needed to resolve the identity-mapped address
>    is disabled. This manifests as a hard hang or "bad PC value" panic
>    on LPAE kernels booted on CPUs that strictly enforce EPD0 for
>    instruction fetch (e.g. Cortex-A53 in AArch32 mode) while the same
>    image may accidentally work on Cortex-A15 due to microarchitectural
>    differences in EPD0 enforcement.
>
> 2. arch_restore_image() in arch/arm/kernel/hibernate.c, which calls
>    cpu_switch_mm(idmap_pgd, &init_mm) directly without going through
>    setup_mm_for_reboot(), leaving TTBCR.EPD0 set while the identity
>    mapping is active.
>
> Fix both sites by calling uaccess_save_and_enable() before switching
> to the identity mapping, mirroring what the original commit did for
> cpu_suspend().
>
> Fixes: 7af5b901e847 ("ARM: 9358/2: Implement PAN for LPAE by TTBR0 page t=
able walks disablement")
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Assisted-by: Cursor:claude-sonnet-4.6
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Please put this patch into Russell's patch tracker.

Yours,
Linus Walleij

