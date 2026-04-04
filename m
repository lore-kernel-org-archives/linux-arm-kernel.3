Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34DAE63FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZcFkwtelNvbHrpmOVful4dZyoIYvTSSe4AGBuE0+FU=; b=4gTAcAQ+Ph1KMKf8R1q90JHPoO
	O1/PG/9VYE9PfIm9TlMGmn/QhfDhss/s4rFchZvJkXKuiUvsg2N3VJ7w/yQLauC7L4iSMYUmRsEPO
	TEfeNJDh8swcRg7POZyjB+QhvQcE7e95sW+ke/0D5oD2/afREZm8zdCobSgrqn+JnOlomuthMX0rl
	twoPrKEsXcrJbXD7Au4gy37d5Nvk4HhOnJCYee1u0hqcfvdD+w33m39cgyMc6gXFOwtFgjg34GDhA
	hyiowaOkWZDpYO/h+WT5Fp8CJqtxhSTO3z2zAvIqIVrb1oIdsV3fFD47xFTmwVivmxcRYHZmJsztx
	/rGnx87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w99hH-00000003nUv-2sLR;
	Sat, 04 Apr 2026 22:42:31 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w99hE-00000003nU8-0M84
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 22:42:30 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-35da01fc0baso1974461a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 04 Apr 2026 15:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20251104.gappssmtp.com; s=20251104; t=1775342546; x=1775947346; darn=lists.infradead.org;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7ZcFkwtelNvbHrpmOVful4dZyoIYvTSSe4AGBuE0+FU=;
        b=wpFTq+P1jBlWp8RLJkHXUrB6woqGNvL5dmmbwFr72BOhOJQTqQx1w/sZfnxr4KLFr2
         u7GoSl6cxC84XzfpHNdz/Dx0ujhx6rj+vZDcfDg/pZ5w2bnKJBPjGlTWHo8YhdlnFVma
         ryPt8SOBxIi4JFwO1vDbR+QA7MT1xlNouCfdRJy95EcrwIdpi0JH+Bg0mJkmUt46LD4f
         IZM34AvcHWemZ/Hnu3vvagXEw3Yx2VN6O+BrjQdbbbEsznaX2C+LeYmavqD9WjfnRjmK
         9TksY/q1N3u12DCpdUEHdTnf1HKzz3t3WGTonJ6PIHhDGq/vvvVS4sXb1pkvPUuTRyxu
         hWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775342546; x=1775947346;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7ZcFkwtelNvbHrpmOVful4dZyoIYvTSSe4AGBuE0+FU=;
        b=Kqi19aR3iVl1snV9Sbf1ay55IDPxDUBohjXS0V8UtyOY3oXSo/8Is1CgjUFBGais/P
         Z6XmQCqqehBPckiydMC7Wy+20Kdu9axOUSOZ3wVBHK0N4NxH1ROuIdeAPAVbczxRyUg+
         FcoOwaejDCQmhA0c3aHsnBAvxMkYEovS6CxWk+F8zouyKfr9a0xvHgZTf3QESz1RSJ55
         P/DBkGlyOmJJC9sLTjaRgp6skUB7JINiAe+GxS4YDWbNk1IPbwxvU5tvc79rVFxdGpXZ
         em+3uRUk/JdX/UE1ukHy+fhjFTuR6IiByTZIccSSLLzQSCMS8smCiBTCcbGxENnEURfZ
         RJ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWwQrh/CYM0MXXhC/cHFMFmYHifLSdl5UfiKHURfObLvmXJposKghjJI5v9qGc9XRYXmXNXdMqG3vYOzs29ECR2@lists.infradead.org
X-Gm-Message-State: AOJu0YwVHum4wI/QSbYzjie0jTvyJRpoummo06lm2LUuKjGIhEw+e1yZ
	pRd18ICpw5H/h28I3bHi4Nf2RRm/tMy04i+WwfTo6aEyrLrI4QQSflUPKl1shSavi+M=
X-Gm-Gg: AeBDieskxL8EMW/xfUEmweRX+nHoddZakueSKf75W3spCLlF8hOWqxK9CL4jrEcSFxx
	hBqGYIEj5eys0gxojzMxjpaN6+9mX2JozTONyIklNa/0zrApud6O7agzfgEduZlNc98GkD43drX
	su/E9U5FVQMAUb8nIgQfIpCKx87rUEfTMx+YKgee1GjF+ndc4Ll9BYy25LyKI0WY1Yxdy59UQzO
	E05Hgpcv9N9y4c49XxIRhi/SMUC38J2oHbYeq2sTS1rRNGEtsEKTCL40pWbiCAmwjKCgnVSk771
	msvrOEjY85+i3vykbnaE+XZsh2QleCVPaTGnKW6ljo6Uj0cUWJwZFETUuXj/rtJbgJda0x/j2tc
	XeCrIf8cAMDurTrWmjyy11AkDuZDSYG64+zM9rrS2BE42rbHjEe2TpEleG0Tv+2lzDeJzWbRHb/
	Xt5Mw2/2WX9My6XGs/UNr2nRGRws79jC13Lrm0RO7dI+Dvz37HIiz6g1eQWJ96ZVzArbeSZS43
X-Received: by 2002:a17:90b:2d10:b0:35d:a9bb:1e33 with SMTP id 98e67ed59e1d1-35de685ecf3mr7280003a91.11.1775342546534;
        Sat, 04 Apr 2026 15:42:26 -0700 (PDT)
Received: from claude-dev ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd367c142sm9424108a91.11.2026.04.04.15.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 15:42:26 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:42:25 +0000
From: Daniel Bozeman <daniel@orb.net>
To: shawn.lin@rock-chips.com, finley.xiao@rock-chips.com, jonas@kwiboo.se,
	ulf.hansson@linaro.org, heiko@sntech.de, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
Message-ID: <adGT0TZb1BASubCL@claude-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
 <f1b9a97a-f1f9-0757-5dc7-33960318be61@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_154228_385522_8F66A30D 
X-CRM114-Status: UNSURE (   8.46  )
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

Further testing with NO kernel patches and fw_devlink=strict
reveals both crashes happening simultaneously on different
CPUs:

  CPU1 (genpd_power_off_work_fn):
  pc : regmap_mmio_read32le+0x8/0x20
  Workqueue: pm genpd_power_off_work_fn

  CPU2 (deferred_probe_work_func):
  pc : clk_gate_endisable+0xa8/0x130
  Workqueue: events_unbound deferred_probe_work_func

  Kernel panic - not syncing: Asynchronous SError Interrupt

This shows there are perhaps two independent issues:

1. genpd tries to power off idle-only domains and crashes
   in rockchip_pmu_set_idle_request (the regmap read at
   PMU offset 0x1120 faults)

2. GPIO4 probes while PD_RKVENC is not registered (power
   domain controller tore down due to PD_GPU EPROBE_DEFER)
   and crashes in clk_gate_endisable

Both crashes occur in the unpatched kernel. Previously we
only observed crash #2 because it appeared first in serial
output, but maybe they're racing on different CPUs?

I also tested removing all pm_qos from all idle-only
domains (PD_VO, PD_RKVENC, PD_VPU). Crash #1 still
occurs. Because it is in rockchip_pmu_set_idle_request,
not in QoS save/restore?

fw_devlink=strict does not prevent either crash.

