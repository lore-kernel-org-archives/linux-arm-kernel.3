Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D71CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B39IJ+XWXT40oXnxSi3w//eJpYlaFUdn5FoedhvPszU=; b=v7/VkDUzPJHePfWFovzvN1S06T
	uHZo/uxWtOI0Q/xPfuSWL699/dE1clph0l3fYx/p2I1ZyV0/0x0Blv755/N7GNXsYKKqxEfdL3DR9
	KDevehtcPJd1MheqHOjybUq0rBCTRRgNur5wkQ4NZpzFw0eZpPEtjmWkGKSLm0VIl0WZcSuhBybQJ
	/hg3NSalFBdTvLw5YGSJensIcVGgl0uvX6WWC/tb2caOp5JHrYjuBP2oXs71gsxgqnRIrkOOvhfWp
	5FJSfnooFAZBHHKEpJswkBE9hLy+zeWC2xv9K9W1hOkFyzOgBhi48aqYXVbYICz5ebGPY18HyEmUk
	NeQgV+8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRMU-00000000WxT-3BSN;
	Fri, 07 Nov 2025 18:39:02 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHRMS-00000000Wwn-3siy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 18:39:02 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-63b9da57cecso1840984a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 10:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762540738; x=1763145538; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B39IJ+XWXT40oXnxSi3w//eJpYlaFUdn5FoedhvPszU=;
        b=T2mu8KwcarwKHh9H00g3/UitIakOUJuHHzzOfD0pTSl6mcPCsQZ9xh2cBvH4mjzQMH
         MZ8HNmMfyL7k0I2+rUonTNbb2N8mc5qsZ32MJ4t3eETqZXraLU9K1rzlPLzuaYnr2/qd
         VNMNNup7LkwUSeMdT37MRUB1A7L0+jHq/mJT7NTPKs8oe5cqUxY7KFGjOcdOegw24srA
         MsqxRLq5jtiHL0d7eur007GCXFrOS9d8xFXvIO2CpcqyaTwtekOxABKw+AeRed4Eg69y
         SjvmECrktbD1YwyfHCUKDdN1MF+7E5GWYlTXnUYqNxLQ3oMvdVOYPLOYXn2bK/49tBb5
         +xFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762540738; x=1763145538;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B39IJ+XWXT40oXnxSi3w//eJpYlaFUdn5FoedhvPszU=;
        b=ThvdOc8SBiPwjGOx2WtsbxLyU3fDwjSqjU17yowRbJvvrskwlRyLoUaiNgegPAYZef
         pVUPSHyE6rv4Jpq7M8PolGIR0H/DLC9mhVFMVe0YUpEqpVIOfTbc6rsocVOI3XBzZF9k
         ZhO8+EXLq0ZUg4hElHA1CywN1e+kSf+ZR022Y0AT7+PFZTBLOXAb2w8FnOfwUW2rNYHV
         7trs9dY6/fboHf6bRVN7xliwE5ndnzrkkBhmwtI+HxwTtXSzcdg9eR8ZigPFoG60L1fk
         hLgI9Ia5VPGK9KfXkzK+l+GbMQoOczEIagoFTYFTvE/oc1r5meTDQ0okIAxzKmbBJnFb
         o+QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWM1OONnEWWHHVostfVY9CE59BdT1bK5mbTaSzPklZSjscpN2cD2iW+Shx8Hez6hM0AFBB3ogKZJ/uQRXdB6a8@lists.infradead.org
X-Gm-Message-State: AOJu0YwhY8KeJggKrR6pgnzyhykzALtdy6edIRkyf1thZgA78cUxesL1
	Fkhxjt42F1365k+fTlSkonKacqda9ZrzNytAggh66w3WIbeX46HpST9HyH2+BSChLa4SYLft51s
	3QXV49FDU/xW6nbknR9Goa+PgPzvGdQA=
X-Gm-Gg: ASbGncvRZrMYRauTCRske7SXCycXmpp/enJd8qM6EBPzx1BQrVnV046p7VVVQbp3VX8
	urxG5RvNpR4tOITINyfMVFR8nGQ9p2sO89n8C0CSqNp292AD3DbxqQkTgFhKVDbucFM7XDDB9BS
	KCxUhzmzMaXaHZviJKI7iKv6HDbO7og4y3vIECbJyXt2ToaanUO7mYoe39VPN8CH46IAmKS46X6
	jV5I5vv0zd33YJLxyHoj8Z/gKoAi924u3vHUbRvR7SgqW08BfbE6yVfU/xrOQ==
X-Google-Smtp-Source: AGHT+IEfC9/xtwBnqad9fFzSxPyCtmWduH1ctIXk+JsraeDvSWpIui7wG4K8ICg2nk/D1ExwgrKzSF5XdugPxj2RBuI=
X-Received: by 2002:a05:6402:1450:b0:640:464a:56ce with SMTP id
 4fb4d7f45d1cf-6415dc006e1mr29283a12.2.1762540738335; Fri, 07 Nov 2025
 10:38:58 -0800 (PST)
MIME-Version: 1.0
From: Philippe Simons <simons.philippe@gmail.com>
Date: Fri, 7 Nov 2025 19:38:47 +0100
X-Gm-Features: AWmQ_bkHIOfF7n3QsiGcjLcgrQEkuEHG2jnWo9Mn_6nLZ3uw5-9DHQVVGAeOO4w
Message-ID: <CADomA4-WZJbuBV=WEmeKDHvtT4o47k90=2jSWSj8Tdmb+6iJTg@mail.gmail.com>
Subject: Kernel ooops in CCU on H700
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_103900_983054_1463C052 
X-CRM114-Status: UNSURE (   8.71  )
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

I'm having a kernel oops during boot on H700, and I think it's also
happening on H616.
It seems to be related to interaction with panfrost freq.
Kernel oops doesn't prevent the GPU from working, at least I'm able to
bring wayland,
but sometimes the GPU seems to hang later, unclear what triggers it,
and there are no ooops...

Here is the kernel log

[   12.293156] ------------[ cut here ]------------
[   12.293185] WARNING: CPU: 0 PID: 904 at
drivers/clk/sunxi-ng/ccu_common.c:38
ccu_helper_wait_for_lock.part.0+0x78/0xa0
[   12.293221] Modules linked in: hci_uart btrtl bluetooth
rocknix_singleadc_joypad
[   12.293254] CPU: 0 UID: 0 PID: 904 Comm: gpu_overclock Tainted: G
     W           6.17.7 #1 PREEMPT
[   12.293266] Tainted: [W]=WARN
[   12.293271] Hardware name: Anbernic RG40XX H (DT)
[   12.293277] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   12.293285] pc : ccu_helper_wait_for_lock.part.0+0x78/0xa0
[   12.293297] lr : ccu_helper_wait_for_lock.part.0+0x4c/0xa0
[   12.293308] sp : ffff800082b93760
[   12.293312] x29: ffff800082b93760 x28: ffff00000a761140 x27: 0000000000000000
[   12.293327] x26: 0000000000000000 x25: ffff000003616fa0 x24: 0000000000000000
[   12.293341] x23: ffff800082b93800 x22: 0000000000000002 x21: 00000002dc980343
[   12.293354] x20: 0000000010000000 x19: 0000000028002201 x18: 0000000000000000
[   12.293368] x17: 0000000000000000 x16: 0000000000000000 x15: 24cab3646a9395e6
[   12.293381] x14: 0000000000000000 x13: ffff00000a7611c0 x12: 000000000000b67e
[   12.293395] x11: 00000000000000c0 x10: 0000000000000a80 x9 : ffff800082b93610
[   12.293409] x8 : ffff00000a761c20 x7 : ffff00000a7611c0 x6 : 0000000000000001
[   12.293423] x5 : 00000001f7251325 x4 : 0000000000000002 x3 : 000000000001706f
[   12.293436] x2 : 0003c6685f2db0e6 x1 : 0000000000001b84 x0 : 00000002dc993b76
[   12.293451] Call trace:
[   12.293456]  ccu_helper_wait_for_lock.part.0+0x78/0xa0 (P)
[   12.293471]  ccu_pll_notifier_cb+0x50/0x80
[   12.293483]  srcu_notifier_call_chain+0x70/0xc0
[   12.293498]  __clk_notify+0x8c/0xd0
[   12.293511]  clk_change_rate+0xd8/0x2a0
[   12.293520]  clk_core_set_rate_nolock+0x198/0x2f0
[   12.293529]  clk_set_rate+0x38/0x150
[   12.293537]  _opp_config_clk_single+0x30/0xa0
[   12.293553]  _set_opp+0x134/0x4d0
[   12.293561]  dev_pm_opp_set_rate+0x1a8/0x2b0
[   12.293569]  panfrost_devfreq_target+0x3c/0x60
[   12.293582]  devfreq_set_target+0x90/0x190
[   12.293595]  devfreq_update_target+0xc0/0xe0
[   12.293605]  qos_max_notifier_call+0x30/0x70
[   12.293617]  blocking_notifier_call_chain+0x6c/0xa0
[   12.293628]  pm_qos_update_target+0xd0/0x110
[   12.293639]  freq_qos_apply+0x3c/0x80
[   12.293648]  apply_constraint+0x88/0x150
[   12.293660]  __dev_pm_qos_update_request+0x7c/0xe0
[   12.293671]  dev_pm_qos_update_request+0x38/0x60
[   12.293681]  max_freq_store+0x70/0xe0
[   12.293692]  dev_attr_store+0x18/0x30
[   12.293706]  sysfs_kf_write+0x7c/0xa0
[   12.293717]  kernfs_fop_write_iter+0x130/0x200
[   12.293731]  vfs_write+0x244/0x370
[   12.293743]  ksys_write+0x70/0x110
[   12.293752]  __arm64_sys_write+0x1c/0x30
[   12.293762]  invoke_syscall+0x48/0x110
[   12.293776]  el0_svc_common.constprop.0+0x40/0xe0
[   12.293788]  do_el0_svc+0x1c/0x30
[   12.293798]  el0_svc+0x30/0xf0
[   12.293813]  el0t_64_sync_handler+0xa0/0xf0
[   12.293822]  el0t_64_sync+0x198/0x19c
[   12.293833] ---[ end trace 0000000000000000 ]---

