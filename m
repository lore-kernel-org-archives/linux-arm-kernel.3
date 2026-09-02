Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F61DC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 13:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aijYbYyh0GYERanA0MNAQuC04tkRJrLzY82fVV+zmsc=; b=iyFN5Lqbhj0iMXYtgGj7pzp4Bm
	vW6AXL+EgQt+s7reJSy/zknTtIULd9u3B8rBh12K3gKNYaI4bstW1UysKEHow+H9bP6tmBlPRyn/S
	xhxUUy4j+tL4rx1U5FbSJgT+PyLchztsRKyytb123BEbUJbT3k8qYdoZ1iNBF/5NfcBKQ3HMfmMWp
	d7JPuI4of2cYTIxWOnBrJnbF3lt7cToxiU52kqcLA7iy4zBPbmX0cft7V3cpdEcIG+D7QpNQWpoYW
	Y9bV3npZLXwUmOHrg/dbL5WGezIGqktj/x/2vtP0b2W3+mUC1RKslelgrddBYgZ7QwvQ03wg7g+Yn
	a8V6NHdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khH-0000000El5C-37yz;
	Wed, 02 Sep 2026 13:08:11 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1khG-0000000El3C-0SPw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 13:08:11 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4843e9c5960so1080906f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 06:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788354488; x=1788959288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aijYbYyh0GYERanA0MNAQuC04tkRJrLzY82fVV+zmsc=;
        b=KEayWhQJNqmZvwG/XgO5xSGaDBvxQRKNO3yLG1Yye2r6HzLE699eiK1T5Dy2ngkv+W
         IewmprVKohy1C7HjI8GCeOEOzAsPQqfACMGOgk3PVaVxG2b1PJlWHTsq7HeZRlXzUz5V
         uz0IGhO3zRRl+9qljVwSL/Xly8KfsqStHlDKpbOglKefD4YFuBtdeV9Mt/I1WkdaSJA5
         qpwPR3Iy+Up4IIkMI4AVu5HU4XWNZ/NBwpLPsflhfq49Luzt6vWMl3uwavjzFSWFMycw
         ZYtq2BxDYajeGn1F3qzBcsm0WHwuOFjbH+RvnIG/TxReOvG2Di5hh0rBFnSgxburR9JI
         hCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788354488; x=1788959288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aijYbYyh0GYERanA0MNAQuC04tkRJrLzY82fVV+zmsc=;
        b=odn6cBAzQxzctT+20IJhq9/T2Ax5DsInAYBjjLGI+q8zFzEryVoXfTd+FS5IZFhMEh
         0ZHVY3Tyb8NWcA6YL/PiBCJTnC49pS7/QM3hVSE4DIU9Kv0bqzQvlbvbRTGlFqHt1BB5
         MCfARpHXjc5piN4Dh/P47C1c625lge4sn6l2EgsFk8YBg7WJ0+dNeGYjCBbRxIRwrbLP
         c0B8r5ykAQoK7SgSQJHYkgLEjBnJCmRgzPHsMBpvo1AxUfXmAuPWX34zJPd/wfzHnMh+
         j9StaguEa/wItrX60eL++vGXIEn+9O8s14wBvtrVvkSV78IV/lnn0nJd8amQcZuCnAqG
         LFwg==
X-Forwarded-Encrypted: i=1; AKwUvByygLCBRjuz+pss9cbkcZteagWv4RqqC5ZIVftGaQe8IC+VJchIzauEo7FUN8d6xdwIDuGsyz+UtBSsktHCyr6p@lists.infradead.org
X-Gm-Message-State: AFuF++lXpd47h67t6X9j9sQH9eMnpXCX/mRIAJRyW8iv1vvCfdCB2t5j
	yx2GiB+ROHf4cNJZkr1W2JDaEWzqvubzCzvtmo6/lDMUF19s0q6rWA2n3/IxiquYeBs=
X-Gm-Gg: AYBFou31ufJ3AN+VjFvkrj5LpvidJt/NIwyMm6+4bdhvxk4FY22oqiqKmyrh9pFzG+2
	KxEE9uW7qDi3gjQbV9+RLExFdbAGPiZCvgLQiLKE6z9kHMSPrqKtGyzY7+9/CWhwrjBFnS9jifd
	NrrdfsSDckKF9P9+1y1hEG0XTbOHAFHw6rKW4dmH0PWFKlOOsbkeqc7MDNaYCB//bqUtaNyuqFG
	vmcKTgb+C/lsjNvFVegJAz2BoS8jw8qt2WaIKu9Qu0JqGNblBiS9ijjlDOA0HysRgHZh7tUhatI
	TIygLwiIPa+oA+dBfEQDttcdavqbEHnW1siccJdc9ah7ncPen3RkQ++n2Vz9azw/x4VCynWZvhS
	qFPU2ykiydQ6G18dDMDww7RAxlO36f17HdtRoKznLvwAsPompgi5oL1xlapUS3uvQD/ozsJWtTa
	jtVOhiO9EfokXdN3EWDL4fkmmIfaqSrcKmqxC+M4+oJorxDFKhnTDKfp2GtxzqhUztHn1wjXKVA
	b59ZavIGsXo5U4YzGafUJFCmfrYyDjZHQfm924rjA==
X-Received: by 2002:a05:6000:4913:b0:47f:90df:4ec6 with SMTP id ffacd0b85a97d-48488deed8cmr9806707f8f.6.1788354488335;
        Wed, 02 Sep 2026 06:08:08 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72b5bsm6385800f8f.4.2026.09.02.06.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 06:08:06 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 02 Sep 2026 17:07:52 +0400
Subject: [PATCH v2 1/4] nvmem: rockchip-otp: Serialize reads
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-rk3576-otp-cpuid-mac-v2-1-e4b7fe2ab13f@flipper.net>
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090; i=alchark@flipper.net;
 h=from:subject:message-id; bh=qiqsPxlbHv2Ud+rite1LTKKz01hObwxA2+aJF+2hat8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTNkN8s8+inzp11M5ymXJWy4XpYf/i/8cxf1m5/mQXsh
 aRs1jIrdExkYRDjYrAUU2SZ+22J7VQjvlm7PDy+wsxhZQIZIi3SwAAELAx8uYl5pUY6Rnqm2oZ6
 hkY6xjpGDFycAjDVE2cxMmzmnWlzfMcxzYX7rp1SnBL6gWnV0bVu6Yzf/5yOzFGoZLFkZFjpfeI
 Uf5NNt0u8iMEtAZGLW++d6WzISLG1divjZuR4xgQA
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_060810_182939_FBE58188 
X-CRM114-Status: GOOD (  19.03  )
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

The OTP controller is driven through a single set of registers holding a
state machine which has to be stepped through for every word read, yet
nothing keeps two readers out of each other's way. Concurrent reads
interleave, and the outcome is either a reader bailing out:

  rockchip-otp 2a580000.otp: timeout during read setup

or, worse, one of them silently taking delivery of the other's data.

Reading two cells in parallel from userspace on RK3576 reproduces both
within 150 iterations - 53 read errors and 9 corrupted results, the latter
either losing their first word or, in one case, ending in the two bytes
which belong to the other reader's cell - whereas the same reads issued
sequentially never fail. Concurrency is not hypothetical here, as six
thermal sensors source their trim values from the OTP and reach the driver
straight from asynchronous driver probing.

Guard the read path with a mutex. Reads are the only way into the hardware,
as the driver registers no write callback, and they always run in process
context, so a plain mutex spanning the whole clock-enable, read,
clock-disable sequence is enough.

Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
Cc: stable@vger.kernel.org
Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/nvmem/rockchip-otp.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
index 2c0feb036f3f..f8a8c7cece98 100644
--- a/drivers/nvmem/rockchip-otp.c
+++ b/drivers/nvmem/rockchip-otp.c
@@ -12,6 +12,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/nvmem-provider.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
@@ -80,6 +81,8 @@ struct rockchip_otp {
 	void __iomem *base;
 	struct reset_control *rst;
 	const struct rockchip_data *data;
+	/* Serializes access to the OTP controller state machine */
+	struct mutex mutex;
 	struct clk_bulk_data clks[];
 };
 
@@ -272,10 +275,12 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 	if (!otp->data || !otp->data->reg_read)
 		return -EINVAL;
 
+	mutex_lock(&otp->mutex);
+
 	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
 	if (ret < 0) {
 		dev_err(otp->dev, "failed to prepare/enable clks\n");
-		return ret;
+		goto unlock;
 	}
 
 	offset += otp->data->read_offset;
@@ -308,6 +313,9 @@ static int rockchip_otp_read(void *context, unsigned int offset,
 err:
 	clk_bulk_disable_unprepare(otp->data->num_clks, otp->clks);
 
+unlock:
+	mutex_unlock(&otp->mutex);
+
 	return ret;
 }
 
@@ -431,6 +439,11 @@ static int rockchip_otp_probe(struct platform_device *pdev)
 
 	otp->data = data;
 	otp->dev = dev;
+
+	ret = devm_mutex_init(dev, &otp->mutex);
+	if (ret)
+		return ret;
+
 	otp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(otp->base))
 		return dev_err_probe(dev, PTR_ERR(otp->base),

-- 
2.54.0


