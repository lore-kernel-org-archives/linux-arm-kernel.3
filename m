Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36799ED7B9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 10:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C3My74YzchJ5b5u6cPS4kfn7rpF3jGLClMpdesSqRBE=; b=0asuXRImqbRG0j+PCIrcqrwNWX
	vwHsXLuRgktAhMFO1zWFfKgreIZNchzFHbAj7Jyv2Kfy0SpRWf8wJJYR7wQZjPbWFOIb1+dStVj7A
	9bSoS2mhR4P0JU7EFYTPoDoFmpqZoBw8q0knd/aBAnJDa4SDN7DA/jBgMMS46OgVD+zfZo3Sg2oBr
	XadsJEvKMWESVC/S04cOxToaQtnTS1bVI7sj9krRfWMoTgPsxMmLf7FEDWXlcWBPFcsmhqTfhJgmc
	3lmBr3Zih0eCuTEgL/h7IL5RPfX4XJJuDAenwzrYfcdtFanvQpDOJE0eGoNNO4L5kfg/SgY4AsE68
	rLEXvfJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5h-0000000H9bX-2SuQ;
	Tue, 14 Apr 2026 10:33:57 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCb5c-0000000H9VI-1wEz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 10:33:53 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2d868d014a5so2166352eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776162831; x=1776767631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3My74YzchJ5b5u6cPS4kfn7rpF3jGLClMpdesSqRBE=;
        b=Gwn9eWWHLaYGUydldJnxuLeaQ/KVzp13N1hT4tlgIz7qEQzhEyc8kzAzm1wRstmWXr
         BsPkORO2/Nvk1A+eJZhOuig8sPZPZiRULwRrFBCZZNaTJGN8XbzupSfxRweXsN9cArmv
         mpXWDgSjkPYySKx70feUrT9tsujnLMYxFORRMwD8yjv2qWRWHdcUI4eJS8jPJ+5NE6pj
         Iw1EygxkabqZM1lMB5u+NYtP9HcwmMq/Tst2FWQxdTIytU2qCgoCLS/5OcdibWnIJU/p
         8Fhb+S1OLbQcLv9trB9pFJkAtzU1RijXS/gK+7jaOdF8VXdC+ZUw0mpYhZiK2jKpC4fe
         6b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162831; x=1776767631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3My74YzchJ5b5u6cPS4kfn7rpF3jGLClMpdesSqRBE=;
        b=dKvpF5yyYqhMyDmjyj8PMGr4QcU7jypNL/K9ZcjkaobbODu+c1vYInpG15VIxNBA4o
         ON/SupAXMcQwJkzlNWME6EeJKd3B3Dy0zn0CBn7+u4yQPyXG+lx5/zLT0BbRD4Bkrm5U
         3qL3L46hDusOkxKh5lx0w6nrwRLltueTvLALbdjQwrl4fDpvO0dam/Fo+TItcFGqZjyT
         hmD23TsRCH3vAntfxi9k1aD3qfIH7GVV9tPpQcR6R+OOiLBdd+WStPeEN0xh5bAi8Yv4
         EXpx0TkYLDKHeiy+PIkXOMaF9D6KTH99ZkE9v2slUAAAJydVAnFsi9UvxpSZeZYUjL8U
         /KhA==
X-Forwarded-Encrypted: i=1; AFNElJ+uNWddthfv7L5ONwsv2aiKTyRRYnd2mglxvJhbK1I1m2s8oIlp8r9lZdiPUZRL/S8Babid602x+5QPf2pYb5V/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2VFCrm+xDG/yVCuoJAkPNS/dMOkGrs0hVDmTct8zgEKZjSqI/
	w7cschOlCp68aShe1d9Yv2nTfsLl4K+9NKmgIjooWCl5PvFu1IRdVL+pP97vCaLsVTI=
X-Gm-Gg: AeBDietznA5X8EstoAVEbYD+A0SxwAYFiFhBVyjv8zHabPvwPjC1gxOgdqKpprHzDem
	pHwEcz2qjaOzaMHJjFKFmvHrB/x3D4Rsef/FEDmwxM+ugCnUo8Li6ICJi/nAm900h7pj6EL6CbX
	PJYtRnd3+S8wtnb3haWsd2Ye+64X/sX1lKVoDX/EfUDTDBsEAPBeL0/aGQcBxm+KYQP+dsyi/Sa
	dpZj+jnGEPLRc1KO0qR3misXfHgKUaiWW+TSRGc9qbbN40FyOTAWXCYS21SmosucOOLSK2X5DpD
	PLeA7Lal7V/9/xE1sB8S/bDVotOOtfjStyJ0rjq4oseu5y4Laas7N9VNIyGx6B+ptUSDp56tYPV
	Rg0MWeprE008jYeHF3tjz2bwmykaEtea6hDSF+b3FrmKjthH51k3qlAao4xlkMs5l3pUYmyrkmx
	qgABmSJEA/J0b2NsaUU8JdepvLoSa7SL/Ykny1w1EBaG16bzSZKBHgH+vp6y9dGw9V5BEXyuydO
	TQuy+/QCQCDuKiFZ73j7rGXxe39366IeIKU2N/GrSrOXWpaAX7xwdUBXZd0
X-Received: by 2002:a05:7300:e828:b0:2ca:7eb4:3e0f with SMTP id 5a478bee46e88-2d586699913mr8843833eec.5.1776162831581;
        Tue, 14 Apr 2026 03:33:51 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d90ae89e49sm8735499eec.31.2026.04.14.03.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 03:33:50 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: Salih Erim <salih.erim@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Michal Simek <michal.simek@amd.com>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v2 2/3] iio: adc: xilinx-ams: use guard(mutex) for automatic locking
Date: Tue, 14 Apr 2026 07:29:18 -0300
Message-ID: <20260414103316.18455-3-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414103316.18455-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
 <20260414103316.18455-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_033352_518435_5B1657D6 
X-CRM114-Status: GOOD (  12.27  )
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

Replace open-coded mutex_lock()/mutex_unlock() pairs with
guard(mutex) to simplify locking and ensure proper unlock on
all control flow paths.

This removes explicit unlock handling, reduces boilerplate,
and avoids potential mistakes in error paths while keeping
the behavior unchanged.

Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/xilinx-ams.c | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index f364e69a5a0d..1d84310b61a9 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -720,22 +720,20 @@ static int ams_read_raw(struct iio_dev *indio_dev,
 	int ret;
 
 	switch (mask) {
-	case IIO_CHAN_INFO_RAW:
-		mutex_lock(&ams->lock);
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&ams->lock);
 		if (chan->scan_index >= AMS_CTRL_SEQ_BASE) {
 			ret = ams_read_vcc_reg(ams, chan->address, val);
 			if (ret)
-				goto unlock_mutex;
+				return ret;
 			ams_enable_channel_sequence(indio_dev);
 		} else if (chan->scan_index >= AMS_PS_SEQ_MAX)
 			*val = readl(ams->pl_base + chan->address);
 		else
 			*val = readl(ams->ps_base + chan->address);
 
-		ret = IIO_VAL_INT;
-unlock_mutex:
-		mutex_unlock(&ams->lock);
-		return ret;
+		return IIO_VAL_INT;
+	}
 	case IIO_CHAN_INFO_SCALE:
 		switch (chan->type) {
 		case IIO_VOLTAGE:
@@ -939,7 +937,7 @@ static int ams_write_event_config(struct iio_dev *indio_dev,
 
 	alarm = ams_get_alarm_mask(chan->scan_index);
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	if (state)
 		ams->alarm_mask |= alarm;
@@ -948,8 +946,6 @@ static int ams_write_event_config(struct iio_dev *indio_dev,
 
 	ams_update_alarm(ams, ams->alarm_mask);
 
-	mutex_unlock(&ams->lock);
-
 	return 0;
 }
 
@@ -962,15 +958,13 @@ static int ams_read_event_value(struct iio_dev *indio_dev,
 	struct ams *ams = iio_priv(indio_dev);
 	unsigned int offset = ams_get_alarm_offset(chan->scan_index, dir);
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	if (chan->scan_index >= AMS_PS_SEQ_MAX)
 		*val = readl(ams->pl_base + offset);
 	else
 		*val = readl(ams->ps_base + offset);
 
-	mutex_unlock(&ams->lock);
-
 	return IIO_VAL_INT;
 }
 
@@ -983,7 +977,7 @@ static int ams_write_event_value(struct iio_dev *indio_dev,
 	struct ams *ams = iio_priv(indio_dev);
 	unsigned int offset;
 
-	mutex_lock(&ams->lock);
+	guard(mutex)(&ams->lock);
 
 	/* Set temperature channel threshold to direct threshold */
 	if (chan->type == IIO_TEMP) {
@@ -1005,8 +999,6 @@ static int ams_write_event_value(struct iio_dev *indio_dev,
 	else
 		writel(val, ams->ps_base + offset);
 
-	mutex_unlock(&ams->lock);
-
 	return 0;
 }
 
-- 
2.47.3


