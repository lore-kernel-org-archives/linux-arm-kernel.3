Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145DDE77180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 01:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sUmnsMlb6+J2z+CZq/V8Utz5Q8oJwF2bHLJE2t/SHA=; b=YOHLWtH+K+7AwP6qyNdazLh6Q/
	syIrVfHXGlUeRbNmB5kFE88Zw0l83D/MaoRNCEKoXlG4oNc4MjgDz9PZ2e2u7tylwe+HnF0HsuJvO
	ZCQqblarKi8jDBDxNh61dpscea2VC9d+B9byoRM/RPEfS6vNlnpmj2qPulfm/twuaA1eMzKuQurqq
	U2BaWsG2+2P+Z+Ov7J/UebSJrV7x1raUm1KnBPu0izXRHgcq9m58oTtpoOUgKwJDitRwxYlq8yq8y
	adAFPWD9CmPc4CeepMG/NRletwH+ksEjqlw6bVMOEHon18x5mDJdYtAcbgdCVhmgZJ1xDgn3HLAt1
	P9TK731w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp75-00000009qOL-1ABP;
	Tue, 10 Dec 2024 01:32:35 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKp51-00000009prv-3deJ;
	Tue, 10 Dec 2024 01:30:28 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6d87ab49423so49438826d6.0;
        Mon, 09 Dec 2024 17:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733794226; x=1734399026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5sUmnsMlb6+J2z+CZq/V8Utz5Q8oJwF2bHLJE2t/SHA=;
        b=OQq5cmxEsisnTo66N4MK6r3f6XGqT8Qarnln/KIY+N6X4F3SQDROy3elWlinvP9Uc4
         rJDGmAF3ipJDQ9zWFTkj5wkBQTMCmzCVWSqgTDlriLUe1/MAtRLY2ikVZw4lVJygBE5A
         d2yvW7vmAuZwTlr+z9jXh+tKE3JlXSVuWl6DCdQpHstmzdkfpRLJEYgdaI/NbC0WD0eL
         tRuskhYEN5RQoDmrmMIqeWGgE+B4Fz27lNJ5l5B7Ae2YrENMxIYY+Vp9NEcWNW2ZozzD
         +5f0qyCN2Qi5UMOYYmTHv8mS0hWcv1ayGr2+CFVcq3TihzTxyCEQ7yfafxGVK+6HwzXm
         1yDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733794226; x=1734399026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5sUmnsMlb6+J2z+CZq/V8Utz5Q8oJwF2bHLJE2t/SHA=;
        b=YY82Se2+I6KOCV82J2S/CD2Jf/wkdRc3pwzKeK5YQqToU62L3AsLSHBUHIDNgMqgva
         5SvxOkjWfA8n7ZzkPMR4EUPSb9gUxhAxKhFhqb/fr3CeQl1MKCUfrrs4xqJQVgeOXJDL
         fdZzLpOXYOpVvrUrRRiVWiiewXiXIY1ul07cEncvkk4UnBmdqI+uGTWTYSkTyuJ/ghiX
         kRFR39T3WBIDNbeRJ0I3fGqVSMP0AoQaWo/CD9/f6PoNdHb9WDhIGm29LC3gW7tCLwI4
         baiIisE0AiAHUPWU/ckSLS1oS2pBlY+wa8hnZsIk9tZLhAU4xscK/jRyhKW0BPz8Xfh4
         O5Vg==
X-Forwarded-Encrypted: i=1; AJvYcCVU12Iud63yN3cDq59HkFGbDcCqyUXrs7CB5bk3pioZz/0fZj+2DqkajVMgWlV7bQFC4Rk6xliuQG5t8l63317A@lists.infradead.org, AJvYcCXKRtAZrHbmksuC/OEWDE9lk+9E5fWisnXbaWiCouSe1D2awP9lNdAtMm3vetYKtm259Upy3eNQevWDOLFTYpI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7O+kEjyGUS0poeI6AKi3N0gxFUQ5FIAxsGV94SrT/rusurpKp
	x8kwAJ7OEG069XTbjT6UyftkWZ519vFsZJQRdnvbtbtv87b9EjgV
X-Gm-Gg: ASbGncvKAeeQX+MAIlvolqKuH3vhp5mIcGnyqh2k0wAgtn8Nw8k9TSEJtHOJHzuJRHp
	FL8bB9d40pGskzvdTodanYguY2DFDP/uaMQOVqy7lwfWVbUYqiXP7k2MyUvOOZqSnkEgFaofvvz
	N279+EyILQWVpu2elF9YS12y6Limwd5SPzX7+DFtqWdu08ot/KgvMlbZ8L3K8ToZCXww+Op+Pht
	fD/8J9FxbQZilPethpZzTVR9iadahMEBpXY6snWU+O09JwMjyD/snpeXhIUCM9tlA==
X-Google-Smtp-Source: AGHT+IE1D13JutVol/zUpThGrVNHALTvBXJmh1Qc3SYE16zwA1SMBc6vR4AEEi2kPGJtGcjxoFLleg==
X-Received: by 2002:a05:6214:23c6:b0:6d8:960e:5785 with SMTP id 6a1803df08f44-6d91e314427mr51513186d6.13.1733794226579;
        Mon, 09 Dec 2024 17:30:26 -0800 (PST)
Received: from master-x64.sparksnet ([204.111.53.234])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8f429a79csm36834346d6.72.2024.12.09.17.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 17:30:26 -0800 (PST)
From: Peter Geis <pgwipeout@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Peter Geis <pgwipeout@gmail.com>,
	Caesar Wang <wxt@rock-chips.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Finley Xiao <finley.xiao@rock-chips.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Kevin Hilman <khilman@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH 1/6] pmdomain: rockchip: fix rockchip_pd_power error handling
Date: Tue, 10 Dec 2024 01:30:05 +0000
Message-Id: <20241210013010.81257-2-pgwipeout@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241210013010.81257-1-pgwipeout@gmail.com>
References: <20241210013010.81257-1-pgwipeout@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_173027_903600_137932B8 
X-CRM114-Status: GOOD (  12.47  )
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

The calls rockchip_pd_power makes to rockchip_pmu_set_idle_request lack
any return error handling, causing device drivers to incorrectly believe
the hardware idle requests succeed when they may have failed. This leads
to software possibly accessing hardware that is powered off and the
subsequent SError panic that follows.

Add error checking and return errors to the calling function to prevent
such crashes.

gst-launch-1.0 videotestsrc num-buffers=2000 ! v4l2jpegenc ! fakesink
Setting pipeline to PAUSED ...er-x64
Pipeline is PREROLLING ...
Redistribute latency...
rockchip-pm-domain ff100000.syscon:power-controller: failed to get ack on
domain 'hevc', val=0x98260, idle = 0
SError Interrupt on CPU2, code 0x00000000bf000002 -- SError
CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+ #54
Hardware name: Firefly roc-rk3328-cc (DT)
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
lr : device_run+0xb0/0x128
sp : ffff800082143a20
x29: ffff800082143a20 x28: 0000000000000140 x27: 0000000000000000
x26: ffff582c47a313e8 x25: ffff582c53e95000 x24: ffff582c53e92800
x23: ffff582c5bbe0000 x22: 0000000000000000 x21: ffff582c47a31080
x20: ffffa0d78cfa4168 x19: ffffa0d78cfa4168 x18: ffffb755b0519000
x17: 000000040044ffff x16: 00500072b5503510 x15: a7a6a5a4a3a29a99
x14: 989796959493928a x13: 0000000051eb851f x12: 00000000000000ff
x11: ffffa0d78d812880 x10: ffffa0d78d7fbca0 x9 : 000000000000003f
x8 : 0000000000000063 x7 : 000000000000003f x6 : 0000000000000040
x5 : ffff80008010d000 x4 : ffffa0d78cfa4168 x3 : ffffa0d78cfbfdd8
x2 : ffff80008010d0f4 x1 : 0000000000000020 x0 : 0000000000000140
Kernel panic - not syncing: Asynchronous SError Interrupt
CPU: 2 UID: 0 PID: 804 Comm: videotestsrc0:s Not tainted 6.12.0-rc5+ #54
Hardware name: Firefly roc-rk3328-cc (DT)
Call trace:
dump_backtrace+0xa0/0x128
show_stack+0x20/0x38
dump_stack_lvl+0xc8/0xf8
dump_stack+0x18/0x28
panic+0x3ec/0x428
nmi_panic+0x48/0xa0
arm64_serror_panic+0x6c/0x88
do_serror+0x30/0x70
el1h_64_error_handler+0x38/0x60
el1h_64_error+0x7c/0x80
rockchip_vpu2_jpeg_enc_run+0x168/0xbc8
device_run+0xb0/0x128
v4l2_m2m_try_run+0xac/0x230
v4l2_m2m_ioctl_streamon+0x70/0x90
v4l_streamon+0x2c/0x40
__video_do_ioctl+0x194/0x400
video_usercopy+0x10c/0x808
video_ioctl2+0x20/0x80
v4l2_ioctl+0x48/0x70
__arm64_sys_ioctl+0xb0/0x100
invoke_syscall+0x50/0x120
el0_svc_common.constprop.0+0x48/0xf0
do_el0_svc+0x24/0x38
el0_svc+0x38/0x100
el0t_64_sync_handler+0xc0/0xc8
el0t_64_sync+0x1a8/0x1b0
SMP: stopping secondary CPUs
Kernel Offset: 0x20d70c000000 from 0xffff800080000000
PHYS_OFFSET: 0xffffa7d3c0000000
CPU features: 0x00,00000090,00200000,0200421b
Memory Limit: none
---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Fixes: 7c696693a4f5 ("soc: rockchip: power-domain: Add power domain driver")
Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---

 drivers/pmdomain/rockchip/pm-domains.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/rockchip/pm-domains.c
index cb0f93800138..57e8fa25d2bd 100644
--- a/drivers/pmdomain/rockchip/pm-domains.c
+++ b/drivers/pmdomain/rockchip/pm-domains.c
@@ -590,14 +590,18 @@ static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_on)
 			rockchip_pmu_save_qos(pd);
 
 			/* if powering down, idle request to NIU first */
-			rockchip_pmu_set_idle_request(pd, true);
+			ret = rockchip_pmu_set_idle_request(pd, true);
+			if (ret < 0)
+				return ret;
 		}
 
 		rockchip_do_pmu_set_power_domain(pd, power_on);
 
 		if (power_on) {
 			/* if powering up, leave idle mode */
-			rockchip_pmu_set_idle_request(pd, false);
+			ret = rockchip_pmu_set_idle_request(pd, false);
+			if (ret < 0)
+				return ret;
 
 			rockchip_pmu_restore_qos(pd);
 		}
-- 
2.39.5


