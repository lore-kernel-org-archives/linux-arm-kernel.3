Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D80FD5F99
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5TS2/VKVyUdq2KA9lPz5OLVvEFHblHBqRgRRSos+joo=; b=zQAN6IqMZbiYvKMZCmPBAXj1FD
	CDKlaOYDuXYSNCCOFkRD4Rcz7RrGnAxJeDv9X7068EEzdfMuxdBU4YVfp2KJ3H54MsS2nkis1isIc
	qWS+fsT8WsNaIMySjmodFrgUwb8yLaj9ep2S4xz9YZRaOlrPtlTN9FzXssImLwj7WUALsrjDefENb
	EUIPSHkSr0N6S7usVdZOWe4zv80fy8/NC3UhhfMNt/04Uo6SDIfC+0JxiBxMe70wFOIHRplZHiCuM
	CUWegd0g0bopClDTwlK0IYEmuveG5HlIdLVKqjuG0Xle46FsAKsXTMHztWekaVozKjTVlsa1jCDV+
	Ek0cFK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOvg-00000008ZfA-3Waf;
	Wed, 08 Apr 2026 09:10:32 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOve-00000008ZeM-2W1i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:10:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-43cfde3c3f3so5770333f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 02:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639429; x=1776244229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5TS2/VKVyUdq2KA9lPz5OLVvEFHblHBqRgRRSos+joo=;
        b=VxSg6yZN3WDkZxCE8i/N5BlJCbkpC3XF8zdO2bEO9dcsvZDpL0xHrjHCoxN3QPaxUf
         1MwyLC/gOb9ZMRPKNDyWxhvdpinOi3q7UptMFCcKuyJX+cIrS5Z8EQhPOn6F/a3UepdL
         RtHg+YvUnY5G2TNSFfHbQCz/S4PSwWXGGmk7IrZb/drSg819OtzM/K44WyGx7OwC6He9
         w58ObvmElCg9SoyPpe+QbmYEPsFgTd6u80+G+0JcttmBHy6mJ8NGvm94ld7a5TEfP9f9
         TMi+NeRXCPDsXE1h4VehsIkBxh1i5Ew32ShlbllpYigDLckcgXcLJkBLAwqu63dN4ddU
         BX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639429; x=1776244229;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5TS2/VKVyUdq2KA9lPz5OLVvEFHblHBqRgRRSos+joo=;
        b=DERvslAspo0cn6R9IUh2gPOPvsic/VzuxbMUhMz3IUC1mXPfZ7BtJt9SN+7YbcFPLz
         549eqF6v3qVYpodws29Dgetj/kyGMQvDgZa2TdqXBQDYSN541O6vh63eoi9EbO13kpuZ
         O5Tt5T9lJS3FS+/XG1J2UGDwRR5nVN7BFc93ZLKfbL0FLg0gwsjTg5ChxfS8GWrWHf81
         JqYLpwKuxDsPPW8xSdLRdmXjyz64RB5neqzGYLU2Q4Z2iPRjUN2jZvYk6YWjDLWPiLUB
         U959RnSlEqG4hjtI94axMRh8gMMlceSYv7TXymFqE4QlbiaR5FHekKn9KJ1dqBEdVuoa
         mlTA==
X-Gm-Message-State: AOJu0YxZ1lCH1XScvl3CuWUWzfn2MBppFn7g0dRr3qsH/Pq1PX3I60zU
	RGGx24+MLFVIouBZuFzjU9i+lxwubZW7tgwfcGjO26Jml5OtcHjQuWqS1W2dk1QaoYU=
X-Gm-Gg: AeBDieva7fJtgBV1aADRZOKIAMuomK7W/XSDPaA+jOplMpLzWc6RwDJMn063gEdCyE3
	8iqp10AB+BYIZAbvAtDG/FFHTYHNCorYzTnui8a0CPa4S/W3ZHo8/GE12bkZ8cFl3HylEOJMi8E
	bcjGKUFaMMxI1YTc+u7s4CtDazktxrw5GDi2p2jw0lk1tAvDrPKnC9ETDRlc6lNVP//03EV/3d7
	yvrzylpgBhKz40eE07HMfwDqf4Nzy5rPYc4CP4QtDWw7qjRddCyDrQHjlYhCX9fAHdV9efjZR5f
	T2pqLQgV0MbHdxglae/exTB/XfFuNmtltZULiITdu74VGz5Bwvu9cuaYEvAYy9V2QcHOmRp0tf2
	sKgzC4SSNaVQEaN1Rd+yvg2Z45r/TWm353VfdOgOlCOX3j1nwHVZ5QFFH+DMdOVkfV2cbC67eYj
	Yw99Z7JNqJTMOoydov6r98CBCBWkMbOavn+K8tgVqKaJ3R
X-Received: by 2002:a05:6000:420f:b0:43b:490a:db51 with SMTP id ffacd0b85a97d-43d292d51camr29919094f8f.24.1775639428466;
        Wed, 08 Apr 2026 02:10:28 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c54bdsm57690680f8f.16.2026.04.08.02.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:10:28 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
References: <20260331-fix-aml-t7-null-reset-v1-0-eb95b625234c@aliel.fr>
Subject: Re: (subset) [PATCH 0/2] Fix Amlogic T7 null reset ops and DT
 required property
Message-Id: <177563942766.3408542.9299972787072286481.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:10:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_021030_687237_F10262F2 
X-CRM114-Status: GOOD (  14.41  )
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

Hi,

On Tue, 31 Mar 2026 16:24:03 +0200, Ronald Claveau wrote:
> 1. As reset is required for MMC DT, this patch series aims to add the currently missing required driver ops.
> 
> Whithout this patch the following kernel null error appears:
> 
> [    0.459197] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    0.459978] Mem abort info:
> [    0.460324]   ESR = 0x0000000096000004
> [    0.460791]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.461471]   SET = 0, FnV = 0
> [    0.461830]   EA = 0, S1PTW = 0
> [    0.462220]   FSC = 0x04: level 0 translation fault
> [    0.462722] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    0.462826] Data abort info:
> [    0.462829]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.462842] Mem abort info:
> [    0.462849]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.462859]   ESR = 0x0000000096000004
> [    0.462865]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.462874]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.462882] [0000000000000000] user address but active_mm is swapper
> [    0.462890]   SET = 0, FnV = 0
> [    0.462901] Internal error: Oops: 0000000096000004 [#1]  SMP
> [    0.462909]   EA = 0, S1PTW = 0
> [    0.462917] Modules linked in:
> [    0.462925]   FSC = 0x04: level 0 translation fault
> [    0.462932]
> [    0.462939] Data abort info:
> [    0.462951] CPU: 4 UID: 0 PID: 90 Comm: kworker/u34:3 Not tainted 7.0.0-rc4-next-20260319 #41 PREEMPT
> [    0.463920]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    0.463927] Hardware name: Khadas VIM4 (DT)
> [    0.463940]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    0.463951] Workqueue: async async_run_entry_fn
> [    0.464277]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    0.464286]
> [    0.464294] [0000000000000000] user address but active_mm is swapper
> [    0.464304] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.465935] pc : reset_control_reset+0x48/0x1d0
> [    0.466409] lr : reset_control_reset+0x38/0x1d0
> [    0.479907] sp : ffff800083943b60
> [    0.479911] x29: ffff800083943b60 x28: 0000000000000000 x27: 0000000000000000
> [    0.479926] x26: ffff80008310a9c0 x25: 0000000000000000 x24: ffff000100372005
> [    0.481212] x23: ffff0001003a4000 x22: ffff000100fee988 x21: 0000000000000000
> [    0.482976] x20: ffff00023f00a788 x19: ffff000100fee980 x18: 0000000000000006
> [    0.483865] x17: 64656c62616e655f x16: 7469647561206465 x15: ffff800083943530
> [    0.484753] x14: 0000000000000000 x13: 000000000000022d x12: 0000000000002000
> [    0.485642] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
> [    0.486530] x8 : ffff00023efd8a40 x7 : fffffffffffffe70 x6 : ffff00023efd89e0
> [    0.487418] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
> [    0.488307] x2 : ffff000102002488 x1 : ffff8000822248c0 x0 : 0000000000000000
> [    0.489196] Call trace:
> [    0.489500]  reset_control_reset+0x48/0x1d0 (P)
> [    0.490062]  __device_reset+0xc8/0xfc
> [    0.490517]  meson_mmc_probe+0xe8/0x3d4
> [    0.490994]  platform_probe+0x5c/0x98
> [    0.491448]  really_probe+0xbc/0x298
> [    0.491892]  __driver_probe_device+0x78/0x12c
> [    0.492434]  driver_probe_device+0xd4/0x164
> [    0.492954]  __device_attach_driver+0xb8/0x140
> [    0.493507]  bus_for_each_drv+0x84/0xe0
> [    0.493983]  __device_attach_async_helper+0xac/0xd0
> [    0.494590]  async_run_entry_fn+0x34/0xe0
> [    0.495089]  process_one_work+0x158/0x29c
> [    0.495587]  worker_thread+0x18c/0x308
> [    0.496053]  kthread+0x11c/0x128
> [    0.496453]  ret_from_fork+0x10/0x20
> [    0.496904] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003)
> [    0.497661] ---[ end trace 0000000000000000 ]---
> [    0.498234] Internal error: Oops: 0000000096000004 [#2]  SMP
> [    0.498935] Modules linked in:
> [    0.499319] CPU: 1 UID: 0 PID: 88 Comm: kworker/u34:1 Tainted: G      D             7.0.0-rc4-next-20260319 #41 PREEMPT
> [    0.500669] Tainted: [D]=DIE
> [    0.501025] Hardware name: Khadas VIM4 (DT)
> [    0.501547] Workqueue: async async_run_entry_fn
> [    0.502109] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    0.502975] pc : reset_control_reset+0x48/0x1d0
> [    0.503538] lr : reset_control_reset+0x38/0x1d0
> [    0.504102] sp : ffff800083903b60
> [    0.504513] x29: ffff800083903b60 x28: 0000000000000000 x27: 0000000000000000
> [    0.505402] x26: ffff000100059028 x25: 0000000000000000 x24: ffff000100372005
> [    0.506290] x23: ffff000100ec9400 x22: ffff0001003f6e08 x21: 0000000000000000
> [    0.507178] x20: ffff00023f00b440 x19: ffff0001003f6e00 x18: 00000000ffffffff
> [    0.508067] x17: 0000000000000000 x16: 0000000000000000 x15: ffff8000839037e0
> [    0.508955] x14: 0000000000000000 x13: 0000000000000290 x12: 0000000000002000
> [    0.509843] x11: ffff00023efdc754 x10: ffff00023efdc740 x9 : 0000000000000000
> [    0.510732] x8 : ffff00023efd8bc0 x7 : fffffffffffffe70 x6 : ffff00023efd8b60
> [    0.511620] x5 : 0000000000000001 x4 : 0000000000000000 x3 : 0000000000000001
> [    0.512508] x2 : ffff000102002488 x1 : ffff800082224a40 x0 : 0000000000000000
> [    0.513397] Call trace:
> [    0.513700]  reset_control_reset+0x48/0x1d0 (P)
> [    0.514263]  __device_reset+0xc8/0xfc
> [    0.514718]  meson_mmc_probe+0xe8/0x3d4
> [    0.515195]  platform_probe+0x5c/0x98
> [    0.515650]  really_probe+0xbc/0x298
> [    0.516094]  __driver_probe_device+0x78/0x12c
> [    0.516636]  driver_probe_device+0xd4/0x164
> [    0.517156]  __device_attach_driver+0xb8/0x140
> [    0.517709]  bus_for_each_drv+0x84/0xe0
> [    0.518185]  __device_attach_async_helper+0xac/0xd0
> [    0.518792]  async_run_entry_fn+0x34/0xe0
> [    0.519290]  process_one_work+0x158/0x29c
> [    0.519788]  worker_thread+0x18c/0x308
> [    0.520254]  kthread+0x11c/0x128
> [    0.520655]  ret_from_fork+0x10/0x20
> [    0.521103] Code: f9400262 2a0003f5 b4000902 f9400040 (f9400003)
> [    0.521860] ---[ end trace 0000000000000000 ]---
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[2/2] arm64: dts: amlogic: t7: Fix missing required reset property
      https://git.kernel.org/amlogic/c/98da3e91a6157d2833af356620665a9734d26133

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


