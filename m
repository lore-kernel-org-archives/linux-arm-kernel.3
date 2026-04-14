Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B141ED7B94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLYpSTtxjJcxt6f4zYCIirPQgRpG54kMZdNT9vSr7Io=; b=d1CkPuf1MvO1pdTfpAZBSEmVQp
	oTPYRXWfwkZg1lnP4DZCX25vjwaMurZ77I+8ZUFOZx7p10TRiqjS1l6xakf4Dprn9zI8OMrhnhCYt
	CssLBlEdckN7vb6OcA/ylmiz0nOhpmy0UUV7nVKeQ1vLwnJEeXtYgvDTKPKrWkljrlljAlSgcIJO4
	2mFgaGy0bv81C1oXMk1vKSIi2rNliXiC2+o9IgCVMLr0FyfHNXcoIiTNhJ762hxSakJmRQRzmo7DJ
	giwYMj0IXwZds0w+fQ2fVMrUjaSIbK5pdxGN7CkW7xTjKvZEPJbwt7AtsOSbuJ+Zy7ivX+RTz7cF7
	vZb/e5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6f-0000000H3Z5-0P47;
	Tue, 14 Apr 2026 09:30:53 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6d-0000000H3YY-0UHz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:30:52 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c15849aa2cso6182527eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776159050; x=1776763850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HLYpSTtxjJcxt6f4zYCIirPQgRpG54kMZdNT9vSr7Io=;
        b=pAIL9Nmz8TimnSMC84mcRNl+RNTdA3JNWjLxu7TvVA+udjcfFRLJEHiP/x/LtpTPjR
         cRNA4/6VsbkJR7HWblBj6Huy+UuOl1Vjz6XZ6C/m2vAFEJxr+IkyDY5Lm+Dqh3OlHKEr
         EIUX9MRrJE5aShXfs/pOuSiDfbI1D8a1jBEbjkbB4lCzPiyPCXttOUPy9kCmOXVDT7iK
         X7vd5bGlo9RKOXfgUdBqBvsmDgvoAOfEbXH+dmXGGc8d5SBxr21eHF1/naYuokqacjjd
         lT4JUTOU30FKGxBbttgzUXUgQZRjbOHUIkS/hYpCUupdNY3qNx5h7arCf6wr/ycEA2yO
         WWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159050; x=1776763850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HLYpSTtxjJcxt6f4zYCIirPQgRpG54kMZdNT9vSr7Io=;
        b=gjJ0k5O4O2lG30PCegjMAMbqhInOg+YJsYc7FsOT8mfPC99+2Wu9oEgzzZXXS4xqxd
         I3TISv4i/KdEhuzyRK6p4eaekTF3QH42HeqfnDbnVCa7yiEjb+IY99DiNdsBJbMeoF0/
         t0k2r/7tcC5FqipimN1QqSWev6fBmL4/7B9xOVvzZpM2Bn83jp4NDp9vSTGm05T3GaAG
         04iRbVA3t7b1gngtNJUepakd2UZMcBnAa/kSzofOTtzscxC5fBBYgLnCjroWkAEMuISB
         DE+yoSM37RCFCEYHqD/yExadV+mdVhTm2svJNLzrECvT2Y+m6zLaupPWH8QK2Ih4A4It
         MbkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9WQxskNmZsBGdxngAIo9y2PSjZXLKCdmTw5ZT3EcqDNsJFX6fPF/TeyGEsUWb19pJmk4/PIydQCPVjtiuaNqYl@lists.infradead.org
X-Gm-Message-State: AOJu0YwQry9F7V6Ib1HAIVALtOEtiTugiXtnNilX+vNKnDg8HG24MpmN
	iMbzKKs5n1TC+gPOkriOw/SwtKci1ZcH++Cv8UyhbKP9QNr8qKWC5ng9KtQBnnoZAJM=
X-Gm-Gg: AeBDiesQbzIpV2I1GChQValZfzsjyQCqw7dowtwqzu3dA7Jmoyqxvv6kutsqI5uge9P
	YaZwHbGrhcLbhNF1cMMua+xcgydmtCHmLhn6/oqPP6CzFICZII+X6YW23XDjh59Zp7968JAT/uW
	5ej84zn81nG1laliKKqXMqZGAFWrExrTW1xWHM6+y3peMyuvnMR7r8MQva+tVTSUxLAPgxYfyK7
	4XNl8ZCPvJR8oVJ4xpMvuTLOvU+TVPq6FUGphDQv8rWHSQn8oLzok3MSQVyl8kpWXX3jNmqP8Pf
	pHfNdZMA91RPsjDjOP5IpMw6st32LUxhUeJ/XSnmHWMQz822lKm3d3cpzNxc9WRCkSYOXoULYOa
	x1CA+31EN/Lmr2Ukr6j2a+9uwkXntyjSVsdNEOS+PNaAYqDT4y8dtHWXqwSKxNqN4gH5b483S8K
	VxffpJV6Zs9CrmAUkBGY7tj88ao7mSyY5aOkEX0N/ZYURodg7mNJrkfQH2Cfu+tbnWDmlhIoEi9
	UtzsO4yf8IxHbf0pl3/RNEO3qqejbYThdYuCU9QtfgUZ+qS7A==
X-Received: by 2002:a05:7300:2156:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2d5832e2f63mr9521823eec.0.1776159050147;
        Tue, 14 Apr 2026 02:30:50 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm20327599eec.26.2026.04.14.02.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:30:49 -0700 (PDT)
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
	Guilherme Ivo Bozi <guilherme.bozi@usp.br>
Subject: [PATCH 2/3] iio: adc: xilinx-ams: use guard(mutex) for automatic locking
Date: Tue, 14 Apr 2026 06:29:29 -0300
Message-ID: <20260414093018.7153-3-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414093018.7153-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023051_159980_AA9C6C79 
X-CRM114-Status: GOOD (  12.25  )
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


