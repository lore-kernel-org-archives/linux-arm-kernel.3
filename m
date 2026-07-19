Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A6E2C4451B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1U4XlFDnYXrurhy3P+gmuMmaOpCiuKFSkl/ypZyvgd0=; b=2toCUheXfwEAoL4kBMQwdsl0Tf
	hvTgEjP1lmaEcCta1wZB9ieH5on9LAQQbcEmgj9iBfJr5hU+2QMuo32nD1Zv3hP4oNUQ5YqcDXhmx
	XJ9j5rQnHl6srjEEhGQMVVI8T3d1TzRgVx9EXyv3i0gW2j4I/6Rc7+4ODQcbyup7pwas+QntqVRO3
	ORRzYyD+v5PaKbLWuB88yoK8GiO9vP+Aiwtk1s/aBpIMOnYBS+ZTyjmQoSjUA/BzZU1CJoREpHx4C
	HlIUy6KrWamKhm2HMLKqJqdBKtVtepdTKD1uTpGABGTvlS82tsfuMnVedYQS8nRBMc3HpVs179Sk4
	jEu3dXvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGi-000000056JF-1DyH;
	Sun, 19 Jul 2026 15:17:28 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlTGc-000000056H0-0y6A
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 15:17:23 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5b0f19bea2fso5255133e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 08:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784474240; x=1785079040; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1U4XlFDnYXrurhy3P+gmuMmaOpCiuKFSkl/ypZyvgd0=;
        b=Gjr2k0AOg2q6fl/RGqwdK2vI8GavK67zg1vIrsmcbunADSpBwqdfmr/jtF9jejbdG9
         Us6wD/V1YFhaeJRmDELCk6HJveFzkEmvEIWFTRqPUrI/YA2fv2bWpmoycl0gN7R5wsK3
         2QuUq4R0NRO0Zj2WoOxhOAd0eJ0+J4QyQEzj7YhkGzmYfjyb0/3WJZMI3Lvuj9sFDdNL
         ayf0NIlZDIwJSonWEB4Y4BieK0PY48588DUM/IU0EbVpb4uivQ5UaCJNavOLcLofGYUr
         7nGlSWjgEaIgvtjyx09mJcRtII23z4yMYn1Z+7QWGRrV0YY7gUvuT00fhBvnehM8PBcs
         RMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784474240; x=1785079040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1U4XlFDnYXrurhy3P+gmuMmaOpCiuKFSkl/ypZyvgd0=;
        b=h00qjtMKmu3eme5wq9EzWJ084ZDeAltCGE3Pg9YB6+fgJjWupfdUN9PpRhuPg/6Rjs
         HM+vL7W4030wehY5g26GhTuuaQc0kAI0tP9V1rj24MfvfqW9tSSoiF4CZXsl3Q9wHO6o
         Qzb2CKNt2B9PUprIYMa64VVhjlZ1/rnuT/wGyMh5mkwkTICDkqhYm4sEQIyzhKsI8e+M
         aBWEF5SC6Z0psp009vNtXPPfMLaACJw9ATh4fiNVA0Lo/GLXlD3K4LDhxne/2Rxhmqar
         UvWL0mGKg9t2Y+/n0nbZyXbunv85Hci0N2d9SO05SeWRRSv03vDdFWa0pP24ahvH32Pv
         +koA==
X-Forwarded-Encrypted: i=1; AHgh+Ro27+vpZ6lfXfeNMwjG1pypt1QeFi63lgYNuCNnBHYscF+KO+A/+3aJBMdSpkC2mM33CRisxtqUDk6Ry5AfKj4l@lists.infradead.org
X-Gm-Message-State: AOJu0YwaZwpI0q0ylp9UwpKVvDNw6DHboBamQ+JaSh+GkzftnjSUYIxB
	wTwQaEjToXFpI6qSsxVLW+u4UHaLLxRpOj08+OlWwJdCOiMwmFfqI6X2kSfwhm1sA6c=
X-Gm-Gg: AfdE7cmnZjX0dXNMyhdg3/OR7lu1lmYRUwF55WvLo5tNC7lJ5DuMzvjSUkBEV2HD364
	vAMZQ8Kf+OuR+KU/pUwox44XRZQQrqKhyKSa1GNi4bDAr1+CdtCgBa1uXMZsKiRFtdo736q7b4b
	+pEgjN+TunVao+9NZq9Rvo4k7zR34RIPPXeDMZ9kw4rs2RxcZdZzTHDe9t3BwT8AwOoHttx9tL6
	+hLAnGorgHY+zAlgdiYj4zH1VmEa/ar2dUOKChTteitkLwuDSe5S0VNxWk7cj/q64Niwusf97Vj
	E0N1OGfXQYxq2b+f6C5vhqleltFjk71/8lQqfhrLBexIaqJlSAekoKpTn5axqKcTO2keIbYkCfy
	MNt5blCBkabDML6qS/WZLu4a6DVZ7vBJXBbWfAs1ZJMMGBzrO9e9/YpWQ8DKkspbFbZnU1VLbrc
	10U2F9d7yXcRMo3NSGq5KAlF6MkiM6V0hmXLCg4BVwYyeuwZEmZL+7KGkD3g==
X-Received: by 2002:a05:6512:3409:b0:5ae:b7ca:33ec with SMTP id 2adb3069b0e04-5b28f8550admr2242374e87.9.1784474239934;
        Sun, 19 Jul 2026 08:17:19 -0700 (PDT)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e26e5fsm1835096e87.80.2026.07.19.08.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 08:17:18 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Sun, 19 Jul 2026 16:59:44 +0200
Subject: [PATCH v12 1/7] i2c: core: add callback to change bus frequency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-i2c-mux-v12-1-a5010d623a57@gmail.com>
References: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
In-Reply-To: <20260719-i2c-mux-v12-0-a5010d623a57@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Peter Rosin <peda@lysator.liu.se>, 
 Peter Rosin <peda@lysator.liu.se>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=QuvLqztu7n4x7VS9RDk6Xi06jDDy2Ub0BO7TJXiOzLc=;
 b=kA0DAAoBiIBOb1ldUjIByyZiAGpc6najychFUf1agn36NniRGFSMFQTWS59H+RmRjFSDFoFh8
 okCMwQAAQoAHRYhBAVRoui2bLVNZMEsZYiATm9ZXVIyBQJqXOp2AAoJEIiATm9ZXVIyTIAQAMqm
 oQTG/BYiPkxnvB1hjpW5LPGujoqnOYiOZ7JZG1+ZmTAIb7as+ULc4C181rfnZFBZI60dg0hJW3C
 T2NgUzSnILXybiQJQ3oC78FNNtSSsSZUaUGwoWGRwUPk4IZ2Rp948QRpT30tQOcvh/POr3/ZPFE
 RQ0at3I31K61u1ZEvyhB45ivjNr9nnKNyUYbM6SgDh9c39fPxEdhdpdQmlQwzfTiVB19+URLGdB
 FoYMx28SDUNsSsBkQzJOe3BQsymLGMIyBZZcH9a9cmke2K3TMuPfLe1PfwqvWq5x02sANaWvv0W
 CDpVvXE8ojEaN/AmtJZeKe9XLqD7cTBG7UroIpCP0L2qG9LkUuavgNGiRKOzJ2eOstao5aXvkmC
 sa+mDEeLTWWqHgjN7kE0kuF8L52hjZa9Lmu9GC1eScm+nOIHwyUfoCiRQBrj2DdwGeywj+gxkRa
 Y7Xok1QrGlWhgNdcmMbR+qAfEIjQ5K7XTaQhixXl6MApMffiocgLC9w2/jz9D5hWPtjEsXMSGTN
 XNRv2jTNrVAHG0MXqUrAOXgXn9cCcrpG0GXDCef9sSiKyqS2pzL4FtcHQN6jRtLNz/MaOaP0URd
 7hGDFryHH7YviZQhD2/BFly/wvZtpI6ik3d5TDx1z/e4sl1XiV0JRXO5PaWVNivNM2090xJZzpl
 lzdrH
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_081722_298465_596EC790 
X-CRM114-Status: GOOD (  15.04  )
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

All devices on the same I2C bus share the same clock line and the bus
frequency has therefor be chosen so that all attached devices are able
to tolarate that clock rate. IOW, the bus speed must be set for the
slowest attached device.

With I2C multiplexers/switches on the other hand, it would be possible
to have different "domains" that runs with different speeds.

Prepare for such a feature by provide an optional callback function to
change bus frequency.

As a side effect, several bus drivers keep the bus speed in a
private structure and can now have this value stored in a uniform way
instead.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 include/linux/i2c.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c..b3b0d16b4ddd 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -729,6 +729,9 @@ struct i2c_adapter_quirks {
 /*
  * i2c_adapter is the structure used to identify a physical i2c bus along
  * with the access algorithms necessary to access it.
+ *
+ * @set_clk_freq: Set clock frequency for the adapter. Returns the actual set frequency.
+ *      This function is optional.
  */
 struct i2c_adapter {
 	struct module *owner;
@@ -742,6 +745,8 @@ struct i2c_adapter {
 	struct rt_mutex mux_lock;
 
 	int timeout;			/* in jiffies */
+	u32 clock_Hz;			/* bus clock speed */
+	int (*set_clk_freq)(struct i2c_adapter *adap, u32 clock_Hz); /* Optional */
 	int retries;
 	struct device dev;		/* the adapter device */
 	unsigned long locked_flags;	/* owned by the I2C core */

-- 
2.54.0


