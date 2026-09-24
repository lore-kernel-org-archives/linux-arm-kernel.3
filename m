Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B0CBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TngWDJhbDA5h95PrbeC4iYdDqTWn3YG4eVau/z7v+KM=; b=F/UBZGdXV+rweqZQceDXtigJzs
	vbrq7kejNbNlqXz8iGekfob4ByDN0xIGXbk/hERb1zN98S2cnX43krQDoLp1USpBSkLPBZJMXodOR
	cF2uCYmXLnJ+hYB3D2RUHOUIoVu0SBZA3wwpwGChZ07nGajybNuwt+tKfa5ap3+7ue9TQ+IJeB+Id
	Zys7kV9YBi46UGolg37CcQ1Di2icyKPBU4ID3Sujocxrpxtc+LB5fsS/1Jsu9ewoxlJpoZrxV/CcX
	BWLJ8KhpgFjSFfAJrtSi2Nghp4nLKGeH7Jp40qHoEqrESpVCPUOJKIbW0z06wPvRaWeksgveph1Vd
	0GDEjXsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lvV-0000000BWBp-0JDz;
	Thu, 24 Sep 2026 16:04:01 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lvO-0000000BW9T-2jGb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:03:57 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso45495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 09:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffroot-co-za.20251104.gappssmtp.com; s=20251104; t=1790265833; x=1790870633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TngWDJhbDA5h95PrbeC4iYdDqTWn3YG4eVau/z7v+KM=;
        b=quNIs84bcKd5xIICIkegFtu3bRfUg9J9XdaoqDKJtIdKylhTpIwm2UJ/lQPe9h+1BB
         csSXkpMAOHBYa3gcrsmhb5K+H/ng8lVsLtJus/fqZFw1AVo16StYkgSe1YwBl3ahXoTj
         P4jbSamKEpsuZLVuZiKXqHFddDvbAfS2X8SsOVnp7eThThzN0fqtzOmvTqW1DYyI+JlM
         /uXw95T4n6q0qWtBCkrgMT8WrzF7wfTVlKAyZR0pIsy2VjSSL2Inqt/x6IDTr6jlQ1pc
         Yx6ixDaeAsQ5XCTOT6kS7ejDYTWSh4D3AAxLoMzBWygpfhFiIoVKq0hv+L4tNqrRwV98
         21PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790265833; x=1790870633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TngWDJhbDA5h95PrbeC4iYdDqTWn3YG4eVau/z7v+KM=;
        b=geXAO/J7CtjVnURMY86WCPXvuXWJBH5WB09sqrEUBmoLX4X2TZ+VSip54RO63WJdOq
         luRRLf91SmTMU87gfLBHkYUuNZdbYXIYEKM3FWZBcvi7C5C7Hs287ogdb/Rk80XI1XUk
         MjUfAY9IqbyS7agAQ5umBXtW/4grArakwNurWU/VhzYdUF8fqev7LS3lAdk6yEUBeO/w
         SqP8IQZgUfr77xx/DpLgZbNrslbGBZoKXVpdXgkCKQu2qsdA9w4C5HyGIn6W5E44r/8H
         mUFB/7tvm4N8ySn0mhSV/rhWeRntPKpnlCvxy/JsZGDkL7efSE7Uv2sGke4hrrEP1t3b
         copA==
X-Forwarded-Encrypted: i=1; AKwUvBzDysy6Iw4FY6nBvSj0jxCDQBt20+VH3WG0VZHsxV99TGQkNJSOgOd1+WBihJC2fbl0IdqcEutzTTwfWEM0NOh6@lists.infradead.org
X-Gm-Message-State: AFuF++nB07jKAWWa4fX9Ue7BbJeurpHdC0K4sRSv8B7GFou430pip3Zt
	sytRgtfmyyya8eH5oxaqclTje6HSRn0ovqkv4j2X/UTsrR5kao1BIAuqGCxA9YRGAxw=
X-Gm-Gg: AYBFou2WRScntPK1f00Qw9R6JmcT2h3CkR53tT9jiTiC2GjEZmCarb0jBwkbJkAKiG2
	Ml91EVOEgR8iC3aCkzPXqGnCRt46u1f/+kea+BHan6i7ycm2+9+ulWLoR54nNHd4XrrWMisxY7O
	QwaujS3GSPV+aCUOIOPtFMJJgH8g4oSd+HUuoWSx60YCi9opJfCbQCVU1tNOQcA8BcLnSgYF9Se
	C9oyYxauYHUJAFl5r5CFCq6TBik+3XosVANWLyP+hy+ZouwBLMmrP98VLkbeOVApe0k1SHARmn2
	elf0gRq5r1eiS+8L4220J0Y27PcodzXeKaFUUiqfcHpb1clvP/WWkPKUnwz9iYiWHIbLwLrmN4C
	Zc+qRL1gI+qwuQU+1BjJoe4d8EDigxky8T5WB0vxv5y4mlQzHfr2o97BAoJK49gyjd15lAmt0Fk
	yHGcwcPC5Qog2gEwuth65qATvrH3/YBN2NJn50qQ8lOOKkUP41U9q6/rfsKonKHHlhU69R/1iwW
	pKSRBQcEP/mY3norXwuTGWNW/qrE4cuU4Rn
X-Received: by 2002:a05:600d:644e:10b0:49f:e3d4:4c1f with SMTP id 5b1f17b1804b1-49fe7b62d1bmr33379555e9.8.1790265832549;
        Thu, 24 Sep 2026 09:03:52 -0700 (PDT)
Received: from dev-ag.figment.co.za ([192.145.132.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm75591605e9.13.2026.09.24.09.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:03:51 -0700 (PDT)
From: Andrew Gaylard <ag@ffroot.co.za>
To: linux-gpio@vger.kernel.org
Cc: linusw@kernel.org,
	wellslutw@gmail.com,
	dvorkin@tibbo.com,
	linux-arm-kernel@lists.infradead.org,
	Andrew Gaylard <ag@ffroot.co.za>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: sunplus: fix kernel-doc parameter descriptions in sppctl.c
Date: Thu, 24 Sep 2026 18:03:44 +0200
Message-ID: <20260924160344.109727-1-ag@ffroot.co.za>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_090354_735762_2A62CE63 
X-CRM114-Status: GOOD (  17.21  )
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

Add missing parameter descriptions to kernel-doc comments for
sppctl_func_set(), sppctl_gmx_set(), sppctl_first_get(),
sppctl_master_get(), and sppctl_fully_pinmux_conv(), fixing all
W=1 kernel-doc warnings in this file.

Improve the phrasing of some the other comments in this file, while
we're at it.

The warnings for sppctl_func_set() (@val) and sppctl_gmx_set() (@pctl)
were newly introduced by commit 7dcf87d2dbbe ("pinctrl: fix
PINCTRL_SPPCTL=m"); the rest were pre-existing.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609240204.VHoUp5qw-lkp@intel.com/
Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
---
 drivers/pinctrl/sunplus/sppctl.c | 45 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/sunplus/sppctl.c b/drivers/pinctrl/sunplus/sppctl.c
index 67e036d66245..8a3fb9b56597 100644
--- a/drivers/pinctrl/sunplus/sppctl.c
+++ b/drivers/pinctrl/sunplus/sppctl.c
@@ -149,27 +149,30 @@ static inline u32 sppctl_prep_moon_reg_and_offset(unsigned int offset, u32 *reg_
 
 /**
  * sppctl_func_set() - Set pin of fully-pinmux function.
+ * @pctl: SP7021 pinctrl driver data
+ * @func: function number of the pinmux pin
+ * @val:  value to write to the control-field
  *
- * Mask-fields and control-fields of fully-pinmux function of SP7021 are
- * arranged as shown below:
+ * Mask-fields and control-fields of the fully-pinmux function of
+ * SP7021 are arranged like this:
  *
  *  func# | register |  mask-field  | control-field
  * -------+----------+--------------+---------------
  *    0   | base[0]  |  (22 : 16)   |   ( 6 : 0)
  *    1   | base[0]  |  (30 : 24)   |   (14 : 8)
  *    2   | base[1]  |  (22 : 16)   |   ( 6 : 0)
- *    3   | baeg[1]  |  (30 : 24)   |   (14 : 8)
+ *    3   | base[1]  |  (30 : 24)   |   (14 : 8)
  *    :   |    :     |      :       |       :
  *
- * where mask-fields are used to protect control-fields from write-in
- * accidentally. Set the corresponding bits in the mask-field before
- * you write a value into a control-field.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Control-fields are used to set where the function pin is going to
  * be routed to.
  *
- * Note that mask-fields and control-fields of even number of 'func'
- * are located at bits (22:16) and (6:0), while odd number of 'func's
+ * Note that mask-fields and control-fields of even number 'func's
+ * are located at bits (22:16) and (6:0), while odd number 'func's
  * are located at bits (30:24) and (14:8).
  */
 static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
@@ -206,9 +209,14 @@ static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
 
 /**
  * sppctl_gmx_set() - Set pin of group-pinmux.
+ * @pctl:    SP7021 pinctrl driver data
+ * @reg_off: register offset from the base register
+ * @bit_off: bit offset within the register
+ * @bit_sz:  size of the control-field in bits
+ * @val:     value to write to the control-field
  *
- * Mask-fields and control-fields of group-pinmux function of SP7021 are
- * arranged as shown below:
+ * Mask-fields and control-fields of the group-pinmux function of
+ * SP7021 are arranged like this:
  *
  *  register |  mask-fields | control-fields
  * ----------+--------------+----------------
@@ -217,9 +225,9 @@ static void sppctl_func_set(struct sppctl_pdata *pctl, u8 func, u8 val)
  *  base[2]  |  (31 : 24)   |   (15 : 0)
  *     :     |      :       |       :
  *
- * where mask-fields are used to protect control-fields from write-in
- * accidentally. Set the corresponding bits in the mask-field before
- * you write a value into a control-field.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Control-fields are used to set where the function pin is going to
  * be routed to. A control-field consists of one or more bits.
@@ -242,6 +250,8 @@ static void sppctl_gmx_set(struct sppctl_pdata *pctl, u8 reg_off, u8 bit_off, u8
 
 /**
  * sppctl_first_get() - get bit of FIRST register.
+ * @chip:   GPIO chip data
+ * @offset: pin offset within the GPIO chip
  *
  * There are 4 FIRST registers. Each has 32 control-bits.
  * Totally, there are 4 * 32 = 128 control-bits.
@@ -271,6 +281,8 @@ static int sppctl_first_get(struct gpio_chip *chip, unsigned int offset)
 
 /**
  * sppctl_master_get() - get bit of MASTER register.
+ * @chip:   GPIO chip data
+ * @offset: pin offset within the GPIO chip
  *
  * There are 8 MASTER registers. Each has 16 mask-bits and 16 control-bits.
  * Upper 16-bit of MASTER registers are mask-bits while lower 16-bit are
@@ -285,9 +297,9 @@ static int sppctl_first_get(struct gpio_chip *chip, unsigned int offset)
  *     :      |      :      |      :
  *  master[7] | (127 : 112) | (127 : 112)
  *
- * where mask-bits are used to protect control-bits from write-in
- * accidentally. Set the corresponding mask-bit before you write
- * a value into a control-bit.
+ * where each mask-field protects its control-field from accidental
+ * writes. Set the corresponding bits in the mask-field when writing a
+ * value into a control-field.
  *
  * Each control-bit sets type of a GPIO pin when FIRST bit is 1.
  *   0: a IOP pin
@@ -679,6 +691,7 @@ static int sppctl_get_function_groups(struct pinctrl_dev *pctldev, unsigned int
 
 /**
  * sppctl_fully_pinmux_conv - Convert GPIO# to fully-pinmux control-field setting
+ * @offset: GPIO pin number to convert
  *
  * Each fully-pinmux function can be mapped to any of GPIO 8 ~ 71 by
  * settings its control-field. Refer to following table:
-- 
2.53.0


