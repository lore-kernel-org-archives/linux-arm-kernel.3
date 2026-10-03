Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565C2CA5FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 02:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+EW4bm8zGhjto/gOgllrAPGZ/GDCT9qZVoKlj9f+rw=; b=kn25S1HWprcJwwf9qW1LnjO+ku
	61f5K4b+PfmLmxk6JkFA5O0tmG46XH+qnxjtnXAotA4SMUMaiUPAokLmTxA8mw2lQr8hdDKwHvNKD
	M1lZFJCQSnxRZ/2gHCLx7JvHgKhnGFa79dYWtqiYi6XkPMkEekNym/Hh018tQA/KmxUjSOhJughn1
	rqa5oWKB10e0DxVOzBtJG6eZj6fBpOcKRJ2ZlOJszIthoxNdV3V/c39MrfnoUSE5NIXnP8/vNgyKy
	DH8bL+58p8kpQepBH6XGCvmzTPH0/wV72or5sCndj7uGELCYtyRg3ZhTNYY6sUqna3T5dyp17Amr1
	1sTCejiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCprd-0000000Cx9u-3uYU;
	Sat, 03 Oct 2026 02:52:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCprb-0000000Cx8I-2pfe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 02:52:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C38C51764;
	Fri,  2 Oct 2026 19:52:34 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 200F73F763;
	Fri,  2 Oct 2026 19:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790995958; bh=h4wLZ7w5xNm1k2H6+gYt3YSwNI1J7rn9VKAd2u4Zx0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rkWuhNWGg5LkN8AbUZ071o4abMjLAW6zgtraLrxerSDY0CAzvXD8O8l3EzqhQ6xSG
	 Kd3XtEPNFHWQrLF89BvZ6w1TX/oUjgXNwJwVIO4fgkWBJAh0cxYC0pT/q8xM8C0IK1
	 uzKQ25SHk8Jufi1VRG1ICgYUN1RJUYKAs2EHxfew=
From: Yeoreum Yun <yeoreum.yun@arm.com>
Date: Sat, 03 Oct 2026 03:52:14 +0100
Subject: [PATCH RESEND v13 02/14] coresight: etm4x: prohibit modifying
 cntr_val while session is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-separate_etm_cfg_v2-v13-2-5d8a29aead95@arm.com>
References: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
In-Reply-To: <20261003-separate_etm_cfg_v2-v13-0-5d8a29aead95@arm.com>
To: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rt-devel@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=yeoreum.yun@arm.com;
 h=from:subject:message-id; bh=h4wLZ7w5xNm1k2H6+gYt3YSwNI1J7rn9VKAd2u4Zx0U=;
 b=owEB7QES/pANAwAKAW3Vw9FaxTEzAcsmYgBqwG3j8k3aLxVvd4p8PHBPLVkHTB2K+TBaCY+4M
 sxPUfpVI4uJAbMEAAEKAB0WIQQtg+CS3QUzuFh1pJ1t1cPRWsUxMwUCasBt4wAKCRBt1cPRWsUx
 M0F/DACavIOKNdHhmLqUTGuqB4sVQMX9WPIJItOEdkj+BPSxS/jq3Itpmg21n1mHsqxxnnfAm23
 pw6cBcFk1V24uIEQ9Kj1XUwJlmyz6JPNfFry4a/zK51NB8f6bOnToaY05y+zoj0Ep2YlBHF+SLI
 +bGctDeqFWpowL7imah4yldVDJ4L4/JdYh6pxqCdyXjOR5ta+TFllM56KIu091/RfU8XRmrOyge
 SlDcLewOMSRIRtuH0rui7bWFvvMXwjhkImMg8929erDqTiMMinbC1JGe4/GXoxIcssbHwfCGbfq
 RpnXnt/Jd2sSUjEjgB4GDzMZGEv/TN5Miqn+DWOAtVVJ7SB8Cv0dSJQsndFyUT76IsSyFQQ+oik
 KzTsEPH7dlZLoz9+I+TgpvJnw3Kqe0TQ25VcCpjIzBbsl5amL+taGp15jLNWfqbqKMUkUJv8ht3
 6ZbHeJZOz6iqAvw5hWtIo6MOexd2Tr3qdf38dzuCoWctTlF00tBkU6J0SurAooRF3zoUA=
X-Developer-Key: i=yeoreum.yun@arm.com; a=openpgp;
 fpr=2D83E092DD0533B85875A49D6DD5C3D15AC53133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_195239_838496_6B2574E1 
X-CRM114-Status: GOOD (  11.77  )
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

cntr_val is overwritten with the values read from the corresponding
registers by etm4_disable_hw() when the session is disabled.

This means that any changes to these values made while the session is
enabled would be lost when the session is disabled.

Therefore, prohibit modifying cntr_val while the session is enabled.

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@arm.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
index 4945d577ceab..863bab9c2e27 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
@@ -1615,6 +1615,9 @@ static ssize_t cntr_val_store(struct device *dev,
 		return -EINVAL;
 	if (val > ETM_CNTR_MAX_VAL)
 		return -EINVAL;
+	if (IS_ERR_OR_NULL(drvdata->csdev) ||
+	    coresight_get_mode(drvdata->csdev))
+		return -EBUSY;
 
 	raw_spin_lock(&drvdata->spinlock);
 	idx = config->cntr_idx;

-- 
2.43.0


