Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC4DFB5173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Apr 2026 23:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=928edzxFlqN/Z48RQN0M8E84sJTAtb1fJmgV5h9KVWw=; b=b2bDSnbnFpkD0lzPKuDsyCZ4Af
	iFhkGgDbCdTUC/yZHVdJCzi2f37Rks9UA28hClYOLwrCpcIAQkDbhEI8VpwSBJxsti6+zqxdLs28E
	GzGmNc3u3Vd866X+OiTICgW9Vra0DoXXcEoLRJhRKHfjmp9xszhsVN7kPJJM8sd+ks9hz7h3J3lM2
	6Yg92bhrIQjab/rQ9MihCmNIVgpB0NM346zw5QO1lDqp9vd9FShzrkX7mzBU4BYt/B5SsDFEdUJ49
	nZcvNUFM6wrXtBdV3o9ys5D5eAmIpkw3KVT2hIj/BPTZfo3V9UJQrqbMsEeTS1bvQefz4TYOLdixO
	+GmgYp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tmj-00000005dqM-2iui;
	Mon, 06 Apr 2026 23:55:13 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tmg-00000005dpW-2iU1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Apr 2026 23:55:12 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so28295645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Apr 2026 16:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20251104.gappssmtp.com; s=20251104; t=1775519709; x=1776124509; darn=lists.infradead.org;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=928edzxFlqN/Z48RQN0M8E84sJTAtb1fJmgV5h9KVWw=;
        b=zJKh3ul5AhOKXzx6FHia7OhzC4emE34hvV4vIuKrt3ltGIMftiTBX26kBBFszls/RV
         tUIkF+//jJplTR8Vl2ydm7imIsr4dtQgsTgLXHaPR7byKvwYyu3EuHFsIlHc2llhqy+V
         kvi0GmpLPo8i7umS/axqt8CQonhCETBh+9RImR877m6pf/MJY0Sohba4bIB/3PD8do6i
         gEUcnTfPK3R6jpVkspzdxE+eFtP5k1DcBUxc0lVQMp614+O3K9/V7tu6tYgAw9o5o/w2
         F5yKShDNu2suIPjX0jn/5qCpdwr0kqzPyBvyuE/Uq8f5l26TsyOjBnZL4iFOs+4VdyIl
         2tkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775519709; x=1776124509;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=928edzxFlqN/Z48RQN0M8E84sJTAtb1fJmgV5h9KVWw=;
        b=mnf9RVYieLyj3jm9Y04ijledTQN8VLBni0t8taRqDZyxWzewTgs3SOMIFdEPeWcdvO
         1xHpuuUhe8qtEJr5oXah0SRd8u2KvoF76H21DGjmvddfgZ2YmunyxWEgQwJ9H6oeMzVB
         3jiJR7mh26GZDQsnk8jQufNrKNN/xRoidFKqWIINgdjghGapTyX9Jmm0HeNWV74xZFFQ
         HFhmFislzeMZuW9B+kC9IYC0CRWxI/BNto9+UgJYG+Ezb89l/C9uGRBG2i4dpYbioTKz
         Mx3yYnLIGK8lH7gZqCkIY8Mm1MLUee9DuE942tthR0TXnFBjLqBDooQv2opIsznvl4av
         Wwpg==
X-Forwarded-Encrypted: i=1; AJvYcCXXL+YWIi4sbQQxo+UJ26DezfPnbYpkF1PiX20iRDeIJGB06UHOHUMVsXaDxOU7rhWfIyHFF2KtaoqsLp8NZF3C@lists.infradead.org
X-Gm-Message-State: AOJu0YxWh2ZYyuUXJKDI6a6hf8JLH9FkuULZ3r9Ruzn8g4ugUSypqTPZ
	rFe9yoaNR2v/ctaFJJ5kOe1P5+HQ6qeEyBUt7DaFeEfKjwzLo07dALNk8dgfW32WvcU=
X-Gm-Gg: AeBDieskXNuJEY/MgVy1LdorSW4ah6kGbYYl3Ag3lsBMc1ro81rOUg4JBwmkY/NvEzn
	fTCsPxRQNo80NRuExDBV137gSe0N491xV3TKqAjYVIBZNRgyTBH0Giysr+Y+uoGraVs//azNrXh
	blfqmZmNoERDIaVvhsPxX0tJ9QdvbhVOkxbdAERxzViWS+QWzEO85TXljf0uKsjzvz1MChDpf8F
	Hmxwvded5rDMw1T+JWXF0MOS6kHyL2paK3jYnPwd2C/W60bfdAzXopgMgWA/amSvXNUnQnjNkZe
	vZu7LVyhV04N2xyASBxQn7LyFi4ztyHTitVAmXbzQQsUuaYqDpVu0R8S9hFJHweyd+XhKsLs6Op
	uQFE2yxwCYDbq+3CHu4IuyVQ3GQOFshy3k/tgjU4EJAs4im+V8SIVCwBBVQQa6NDFRKrniTxAQK
	KNdipizVnEeOMrHddIyb7YYfi+/PXbhVHZY9NlLBGOdmtFThjYgGjhwntCS0ZpkpwQf+xWuVIk
X-Received: by 2002:a17:903:2f08:b0:2b0:67fa:dbf8 with SMTP id d9443c01a7336-2b2817e97b9mr152039645ad.41.1775519709263;
        Mon, 06 Apr 2026 16:55:09 -0700 (PDT)
Received: from claude-dev ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbc58sm155836415ad.78.2026.04.06.16.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:55:08 -0700 (PDT)
Date: Mon, 6 Apr 2026 23:55:07 +0000
From: Daniel Bozeman <daniel@orb.net>
To: shawn.lin@rock-chips.com, finley.xiao@rock-chips.com, jonas@kwiboo.se,
	ulf.hansson@linaro.org, heiko@sntech.de, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
Message-ID: <adRH235mv00OdOsb@claude-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <693c6c27-6ff2-4ab0-994f-3821e5ffcec8@kwiboo.se>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
 <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
 <693c6c27-6ff2-4ab0-994f-3821e5ffcec8@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_165510_966898_5904C80A 
X-CRM114-Status: GOOD (  10.23  )
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

Hi Jonas,

Thanks for digging into this and identifying the GENPD_FLAG_NO_STAY_ON
connection.

I tested on your next-20260403-rk3528 branch (7.0-rc6) with the
NanoPi Zero2.

Your conditional NO_STAY_ON patch alone results in a NULL pointer
dereference crash in run_timer_softirq during boot:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  CPU: 3 PID: 0 Comm: swapper/3
  pc : run_timer_softirq+0x258/0x2c4
  Call trace:
   run_timer_softirq+0x258/0x2c4
   handle_softirqs+0x18c/0x1d0
   __do_softirq+0x10/0x18
   ...
   do_idle+0x94/0xa0

The crash is caused by the EPROBE_DEFER teardown in
rockchip_pm_domain_probe(). When PD_GPU's clock lookup returns
-EPROBE_DEFER, the entire controller probe fails and tears down
all successfully registered domains. This corrupts timer state
and crashes in run_timer_softirq on the next tick I think.

Adding the following on top of your fix results in a clean boot
with USB working:

  for_each_available_child_of_node_scoped(np, node) {
      error = rockchip_pm_add_one_domain(pmu, node);
      if (error) {
          if (error == -EPROBE_DEFER) {
              dev_dbg(dev, "skipped node %pOFn, ...\n", node);
              continue;
          }
          ...

This skips domains that defer and continues registering the rest.
Skipped domains have NULL entries in the provider, causing their
consumers to defer until the clock dependency is available.

I also tested on 6.12 with backported RK3528 support (OpenWrt).
There, GENPD_FLAG_NO_STAY_ON does not exist, but marking idle-only
domains with GENPD_FLAG_ALWAYS_ON prevents the genpd_power_off
crash. The EPROBE_DEFER fix is needed there as well -- without it,
the probe teardown/retry produces a timer warning in __run_timers.

Test results on NanoPi Zero2:

7.0-rc6 (next-20260403-rk3528):
- Your NO_STAY_ON fix only: crash in run_timer_softirq
- Your NO_STAY_ON fix + EPROBE_DEFER skip: clean boot, USB works

6.12 with backported RK3528 support (OpenWrt):
- GENPD_FLAG_ALWAYS_ON only: boots with __run_timers warning
- GENPD_FLAG_ALWAYS_ON + EPROBE_DEFER skip: clean boot

