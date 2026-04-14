Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1693EF9D0DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=; b=wgeFNY5sbBS9G6iALTYHDyc4Rb
	tHRxfHJnzNFoVEuCqS4EphLAWXwdLyJ2Izv4ngmq2B8OuJO/sTjNqHvHWe6Lx+Mvnz0Uaw81x4gfl
	gq1tcjH1Z0yCMpSBZdoL9sz7KJSfnAOfaFagTSZ58+ajueBo+TZnqZOb8kx4r3FeG5azIpodSx5Q5
	IHeTo4cvzOCl7vmxbXMAGlxNUsnR3gxlCO7HAFncFY8BSFdzM4Gm2dcWMaOcw2xaJZ8f3TqhJz5nr
	4sDvXv232H6CQ0V2telkopok1TwKu6AdAly4aiOScB8ecmdg0tH+tAWSEuWPjYfmQ/kmsEMbkYEmW
	BQ5EVj1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTj-00000000IfR-0vWh;
	Tue, 14 Apr 2026 22:43:31 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCmTg-00000000Ieg-3oPp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 22:43:30 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2d52c7f92b1so5455549eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 15:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776206608; x=1776811408; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=;
        b=hrke8dWhQNrkKUDkDrzgE/+FaRmmoU1R+sm6FJiiFqnMCYw+wSQ5FCVSBEMhBaqfT2
         jqrS9DtUyTFrMw71U1WVinwGJuKWcDk6g3/u3MoOnLIM5wIboQT5uL6095KEkQuslhmK
         u9fwBsQ19usoymcMkhbIhKMxvcLuIZhZPeEIeVKDEDmspe8eRYdn2SIPl04fUQPITATZ
         aXwyEqM/miexQE8ygiJmrWkVFNq0et6ltOZM0G8dQPtRx2tzVHn64qGW71D4kBrpGmIy
         u6MYkZvTAGu0Abv14tsfqriNdn/oCZdrgZfp6nWsDqB8iZ6rRT9JHqILQzaKPokqm84x
         JS7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776206608; x=1776811408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rj8k2pIm7AGjb+3hd5/bWIIgB52x4pA/wcxJmlNMSMU=;
        b=sIU4WgI+GGVwt87tBDYChAIhVHR0Hd5rvx20l/Pafd4Dloobuaz0xCBjz2tqa586Rm
         YOZMEsRzF/XLlKMw3cdweYUM+NLPxhEyyYN9zuBhgfDKX4BV87XtW862g+z+S5e2W1y6
         O0veSCVCV+WInf0N3fNlvnK4eaxwqvrSWN9e4NumwKc7l/WBnSbr4uUfJH6VGMzaXSS+
         zv98GkLhFL1B8aXm7/D4do4MZXGa4S8+Hxd/DVI6ZUGdv7Gjd0gueqRTCVQT5GfpEMYL
         4U3jpb30o8uibXLFzBb/fLDk1SD8EVeierwA+xJkNLaUL+ltLNR/WaZk5Fj/dOqobZcJ
         5P2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+2BPabhNtMy5AdNDrjxHFjTIkyarbYD7zFeVuBXNdNCQ/wsCd+ZKkas90CL5wOQR6glYXgxB1zE8Oepw4U6OFS@lists.infradead.org
X-Gm-Message-State: AOJu0YwsD66CacuqF8GPK2eloWlF6fs5aHrTXf90gUMzyoPATHg6OgDO
	zDXjwRWrZVaVBW4WWbJnMgrH3b8MLAXQr9/yqXvpikxATk3JG2hzkxQTt4UNogEujK0=
X-Gm-Gg: AeBDietDSybZUX0cNQ2aG+ZWBVETTzVsyz+uglZ3bL4kT/4O6K+jNh6BuiYEd1MlRrL
	I12m+Ctvy2CZfZdKzot7MQECyATgsSBM/tKwBgDh6QAbd3SaSUfjAUEFjA1NcNuPWIkWFPJ3HDq
	djUluPKz/ZaxXcrl1wleejp1NwY2VySfuDHorjFAZXfUAQP0wEFkeWiXt2PKkuj1H3awSRjzqzw
	ULJwfLo4uuDqkq1eR0KGtQG3RtSZOF5H6MWVkhGRacqUmwD/i4rnLkVU/ckiPfAt6WHTjWSEqYa
	xkpF6y2UzsvG4XOjabnnM9SxdUyVe662ai0gLaRO+SOZMkwJE9OB9xTjH0UV3OJuZiXX48c1lba
	azt7UZ6u8L3PG+9IpBvlrt7ryb7+Im/KMnHC4wJxlw3+xmMm3w/zNZf2X4WhVfINigb9GeTmP5y
	DZ1xksRLlw5MZRM72UxXCWpFVuRBcYCldrDugJp+MvK4nnAtocXo26Uz0tvQ82cu02XKxOwJUgR
	Ls5MdRPWIP7DhzCfSn0SJ7qxq4uKPK8XteyxG3dZk4uJhQhJw==
X-Received: by 2002:a05:693c:80c1:b0:2d9:6f2f:9f6f with SMTP id 5a478bee46e88-2d96f2fd124mr3002666eec.24.1776206608051;
        Tue, 14 Apr 2026 15:43:28 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2dd32dc2827sm4650361eec.23.2026.04.14.15.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 15:43:27 -0700 (PDT)
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
Subject: [PATCH v3 2/3] iio: adc: xilinx-ams: use guard(mutex) for automatic locking
Date: Tue, 14 Apr 2026 19:40:34 -0300
Message-ID: <20260414224245.8493-3-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414224245.8493-1-guilherme.bozi@usp.br>
References: <20260414224245.8493-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_154328_948429_B189FF95 
X-CRM114-Status: GOOD (  12.36  )
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
index 6191cd1b29a5..70a1f97f6dad 100644
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


