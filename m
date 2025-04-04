Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40FCC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jJkY/rj+UDur6IhWIRiqvOf7fRgwOlEqOQiYwibJQko=; b=HFUe5rh5XS7qdLdU79qGULJtyf
	nQK6H9eWsbKzD4PEDnBIvdaTeSVJM8CJ3zjua4SLenWwNwLBsgrSXW0TwHiA9aw8HoWpKfFsUkw+Q
	7KpRKBQq8h1A73bcAnM4HsgUGEVnU3ZBm2CGMCw7aq7ZAd/YPOtQt4VBZfgptXE+76q1kJrK0N/+E
	ehIrjf00fNw1vuarZVkV8ru88HOTP3DWRGo1swPmFiDsIHCk66RdS5gZWh3O4Bug6Mo4OJYe/fgnv
	Fp2ZKOed9otcbhu8oWe6AhyXE9tMBgcqd9VPe37Os/CMCZWu10G/x3u6Q/2rrmKQ6cQCyM8/jOx6b
	/C94Tmgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hsz-0000000BxlQ-0YVM;
	Fri, 04 Apr 2025 14:19:09 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hrD-0000000Bxb5-30AJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:17:20 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so2443594a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743776238; x=1744381038; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJkY/rj+UDur6IhWIRiqvOf7fRgwOlEqOQiYwibJQko=;
        b=nDEtJgrJL7Kw+epuFNw7whySbJ8EISzu5u8X8fa4PmNw1Ar+y9y/sY0pqHfdJSazsZ
         qelbv89Lf0SWwEaABmjPo1AJduoHspxZYIWzsflnAUT9kbi4Nemo9EyGAx02R3spA0q/
         DbrTPV+qaew+GQFOcwmpeENqKdTWeOAHuAs0UWaAlgK1tlIQfCJwPQzw18QylHtuM14U
         g0E48SGGEyF2oltJKu3iYLKgmW8QYiBOmx+qYe01tT6JA2ai+gAvOlZF/Pum/aM/wmXK
         2TQjN9T/aBV6XSWa6RoexU0VV3bOTk0W/P/dP9QZEouT2QPMMt+pWTxLYU2UY0dMPCeD
         j2AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743776238; x=1744381038;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJkY/rj+UDur6IhWIRiqvOf7fRgwOlEqOQiYwibJQko=;
        b=BdSfzRjgLgw8jKY6PTeHwLYpgzHZJ3S113pTGRMXu+9HlpmGSyeYY2FIwapC45Pd2/
         z9328qYtj1WZs1pUD8wle9XMT/GQK8jSJ15YrfqUGAqFEZTB6QpkrcseJ4Ix30Sakm96
         YrWpWWNa9j0sICgU7fi8UX7b9eATnqDuQCVEesjMA8cChWcXAu8lmjQtAeXxIys+jDeU
         O2TAeWdEG03C/2Lz9udxpvyeOGCVz0UyXcYN+kKdKvSWFUdkcYM0v/EvL3MoYMlzJHxU
         v95ubboxXPZghTi7aj/SsyXTuBL5CEPmMTHYYImF648e5Bj0BqZVBdmZn73IFQ34F1Op
         TIbw==
X-Forwarded-Encrypted: i=1; AJvYcCUtO0L4FNleFHA9g8RWjeItgNWHjJyBxSLMMN2/p9uNfqQqzTZlJI0cxDng5aFUTRod5Ckwy+0o06yYnXqRA8cZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxY8Rx/Tv6IHel9Uqp6r3vREHtfIClHDQkNhEUpoXl7VqCKl6G5
	FyD6TOaJZTkS5k1YBP4zu6L06FduCZLRZt+Dj8eshCTyk7ztTqnC
X-Gm-Gg: ASbGnct7CjmfkS/jbNyczFz9rQbBuTj77aGXs8CUwKkR/xbPcmqmrVO4FCAPo9GEmqc
	nsiRT0tDdRkKfoplelpQvhcOualq58NT038rGnnvtniqVRSAeGDCUbXTdWULMfmEDsaWth7hXOt
	mY2j5GdEE4cQgRpc301X2uztzjmLvkUf9zcJAkPCoJGaU0l3NAyzUZHIhkqNaV/CFSP+2xCysGV
	WbeFHgah71qT5pOjYFxa2q+a66r/p9l47Ao/ezBZHLiWqrepZM0oo7hn3hbguIAWC2pmVMOnJgH
	o+J74Qt0IKlyY5LzTfsd87SHGXXys80nFraji+GXud0=
X-Google-Smtp-Source: AGHT+IGq9BLsszWtOE+3T1GWMl1g2khKbvr87Eb9IDtheXW5uB6Qt8lknEwKp1TWBl0CEPIqeeafWA==
X-Received: by 2002:a17:90b:524f:b0:2ea:712d:9a82 with SMTP id 98e67ed59e1d1-306a498bfbbmr5106652a91.29.1743776238250;
        Fri, 04 Apr 2025 07:17:18 -0700 (PDT)
Received: from hiago-nb ([2804:1b3:a7c2:fdb9:802:4e79:d42a:3b39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca1f40fsm3693825a91.4.2025.04.04.07.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:17:17 -0700 (PDT)
Date: Fri, 4 Apr 2025 11:17:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] Kernel reboots unexpectdely on i.MX8X when Cortex-M4 is
 running and it was started by U-Boot bootaux
Message-ID: <20250404141713.ac2ntcsjsf7epdfa@hiago-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_071719_751608_D582E6F9 
X-CRM114-Status: GOOD (  13.68  )
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

#regzbot introduced: 4f6c983261

Hi Peng and all,

Commit 4f6c9832613b ("genpd: imx: scu-pd: initialize is_off according to
HW state") introduced a regression where the Kernel reboots unexpectedly
(without any warnings, crashes or errors) when the Cortex-M4 was loaded
and running by U-Boot, using the bootaux command:

# load mmc 0:2 ${loadaddr} /home/root/hello_world.bin
# bootaux ${loadaddr} 0
# boot

This is a simple hello world binary that prints a message into the
M40.UART0 pin (demo from NXP MCUXpresso).

Before this commit, everything worked as expected, Linux boots fine and
the HMP core keeps running and printing messages to the UART. After the
commit, the kernel reboots at the beggining of the boot process. The
only relevant message is printed by U-Boot after reset:

"Reset cause: SCFW fault reset"

This commit was bisectabled, the same device tree, u-boot version, and
SCFW versions were used. Reverting this commit fixes the issues.

For testing purposes, I created the following patch which also fixes the
issue:

diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 38f3cdd21042..0477b3fb4991 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -539,6 +539,9 @@ imx_scu_add_pm_domain(struct device *dev, int idx,
                return NULL;
        }

+       if (strstr("cm40", sc_pd->name) != NULL)
+               is_off = true;
+
        ret = pm_genpd_init(&sc_pd->pd, NULL, is_off);
        if (ret) {
                dev_warn(dev, "failed to init pd %s rsrc id %d",


Test Environment:
- Hardware: Colibri iMX8DX 1GB with Colbiri Evaluation Board.
- U-Boot Version: 2024.04
- U-Boot Build info:
	SCFW 83624b99, SECO-FW c9de51c0, IMX-MKIMAGE 4622115c, ATF 7c64d4e

The issue is not present on: v6.5

The real root cause is still unclear to me. Anybody has any ideas? I am
happy to share more details if needed.

Cheers,
Hiago.

