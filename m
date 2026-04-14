Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF93ED7B8F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaFMZ05oqoCy3XWg3+SgdosFrFG8OPbj74rwzw8gq5o=; b=gJpuytG4GBz/clEQBLUvK6UmIm
	yQ2GQgIxIwELT6IGt43fH7IzFBpAVHf5cRDEV6LBTxg9koOOjP335830iaxSIegOo8pDOu059U64I
	wAf2e8JzzBHkGJpyOE5tUFiwVYCYCiYmqkmQMGyVBzHpd4u22XrcgJqsQbGwNFc6SqS/0GuCHhGUO
	XOYpcbZhZmfnLAZnEvrXxVt6o+vNlk+xobcii+BO6RL7+bFkxGoai/9dkvpOqvlOIoUYclt7Fx7tS
	daWquTOT7st/Vm6YAIPrO7u1MZYOltZLlfPOCV3wH95CslxAb+USZxgB1ZD+bYup03sDO1GRHeEV4
	80nvKXPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6l-0000000H3bX-0HXk;
	Tue, 14 Apr 2026 09:30:59 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCa6i-0000000H3ad-3cXT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:30:58 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-2c156c4a9efso7348905eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1776159056; x=1776763856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oaFMZ05oqoCy3XWg3+SgdosFrFG8OPbj74rwzw8gq5o=;
        b=HEFJpWHs4xHPdHSFECr/zrb2L6qFSo8yeedz30rgKvANHFPjV+zseLaGTT5+T6WNpM
         vnrhuJRQYqmzd2uaWalGkAI/mY5rzkOfMq1K9Qc5QHp90D6GmCWNdYX/w1aTktczAC9M
         9m7O4oxW2Y6GBzYJnPd35lV32WkEV1QJ2F0wtPE13dPUqnhmIvzXtCzIS6CPU7z0QgS/
         PC8ka3sP6Yv5KxgGSOd3o7+IiLjRdY5oqmD5hCavX3Ko72YqITWEuFGLpFZKoT3/KpHM
         BpupdN4d9dlbKfJjuurSMe0qC2b/IFWSAnYEkmE9iCAsuEW54YUXoIqeO1de27Bt/5Ww
         wX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776159056; x=1776763856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oaFMZ05oqoCy3XWg3+SgdosFrFG8OPbj74rwzw8gq5o=;
        b=Ktpx+UV+iA1jnKZdbgW80Rh2bnWpjLuhafiVWfPswkIsbkOx3B5VmzYwCi0UmdnAGp
         OcUwD3cVfrt1K1bj4/ii/uvWQ4oaZMfC+CEwhulfyOvzRq64h1gWJoNA9daUy9WdXziq
         +7YvSZzxtQDCa/dce+ckSt4jzyDQAVYxKjO0sIsXhYgZYTY+v+j/8tIlpFLvazu+FpJE
         P7q5SuLYK6vFZ0G86lXX47dFpDPtROoCQYmJpGyHECivK9JqfpeND2ZOm202ucjVZigN
         g5x7bRMtaywH4tAyOkFykuBQaBlE6jgwpOLB19zG7bE9pSt3xn3hgt2jnH5YbRduSHGo
         RJkw==
X-Forwarded-Encrypted: i=1; AFNElJ93D+bD1579Sa/Tntvja/ZL9I9vyfNY0npAcMs7LD7FcfuQ633Xq0IfpoRAvCkpIxfv/8gpeHQh7wWLZVHrI91a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6WvzunqE73NuarHKPCO+P490xqSVwb4gBmz/G9Z9KJaGqe5Wz
	KzO9dFkp0x+768Qm7DLcipLIJS5gNuZkXwB34JQjSSRB3bACY116GDCw3dfNoeZIiu4=
X-Gm-Gg: AeBDieuZiwmRnPkAHG+cp7ZnsmqrI4CM4SZqmkvP+KGOYmSGo7Y2+Gu88LP/mVynk1Z
	7NdAQgRKsEfEH16gGcSbx3FKRudDYdKtq9uwdjinWW6xNNAhw0Yq2csdUQGY6sPH0XcGgYt/jsW
	tW3l8IH8VtX3BVdv2FuBb6FXbSwy7eU0bVuGud4MdpNCUHqPTZ5XGPBoc9DFl7UIpV3c191pQsV
	9XZVcS3ORI7aW7g13ohl/U2JhKwEF8Dlv2UoF4SxqfS1oNTBShXEzjP4zEqedNNicJZQuwySOwp
	HFxq7Y3EluEyOZjxdp4f64pUOcA3QivwRwjLFI0LXGHbKDTaYrj6G617BB5jseTHLmLp/GEWOOh
	9nnfpkut7kLQClezY2qfw3dfADk6Bc7qc8/a2PVybSw1Reg+5qUHLqhQPRoKhUEMjluwlCLG8R7
	XUAkgPy9X50/jY+2L9+3bPMRvWkZxoFTxint2R5k+0HMUwjE7NdnygaTRtpReQhNELYn9rFbXy4
	0FUBfbgUWLwhKMPR6tDn1FtyaIlStgPEpQW1Dzgt9GRnr1k05hsD6Cro/2e
X-Received: by 2002:a05:7300:6d05:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-2dd8ac2d269mr350220eec.11.1776159055830;
        Tue, 14 Apr 2026 02:30:55 -0700 (PDT)
Received: from gui-host.Dlink ([177.33.104.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562db6ac8sm20327599eec.26.2026.04.14.02.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 02:30:55 -0700 (PDT)
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
Subject: [PATCH 3/3] iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach
Date: Tue, 14 Apr 2026 06:29:30 -0300
Message-ID: <20260414093018.7153-4-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260414093018.7153-1-guilherme.bozi@usp.br>
References: <20260414093018.7153-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_023056_911849_9B93B54D 
X-CRM114-Status: GOOD (  16.66  )
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

Replace multiple open-coded switch statements that map between
scan_index, alarm bits, and register offsets with a centralized
table-driven approach.

Introduce a struct-based alarm_map to describe the relationship
between scan indices and alarm offsets, and add a helper to
translate scan_index to event IDs. This removes duplicated logic
across ams_get_alarm_offset(), ams_event_to_channel(), and
ams_get_alarm_mask().

The new approach improves maintainability, reduces code size,
and makes it easier to extend or modify alarm mappings in the
future, while preserving existing behavior.

Signed-off-by: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
---
 drivers/iio/adc/xilinx-ams.c | 163 +++++++++++++----------------------
 1 file changed, 60 insertions(+), 103 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 1d84310b61a9..d5ed2e787641 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -102,6 +102,7 @@
 #define AMS_PS_SEQ_MASK			GENMASK(21, 0)
 #define AMS_PL_SEQ_MASK			GENMASK_ULL(59, 22)
 
+#define AMS_ALARM_INVALID		-1
 #define AMS_ALARM_TEMP			0x140
 #define AMS_ALARM_SUPPLY1		0x144
 #define AMS_ALARM_SUPPLY2		0x148
@@ -763,9 +764,51 @@ static int ams_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+struct ams_alarm_map {
+	enum ams_ps_pl_seq scan_index;
+	int base_offset;
+};
+
+/*
+ * Array index matches enum ams_alarm_bit.
+ * Entries with base_offset == AMS_ALARM_INVALID are unused/invalid
+ * (e.g. RESERVED) and must be skipped.
+ */
+static const struct ams_alarm_map alarm_map[] = {
+	[AMS_ALARM_BIT_TEMP] = { AMS_SEQ_TEMP, AMS_ALARM_TEMP },
+	[AMS_ALARM_BIT_SUPPLY1] = { AMS_SEQ_SUPPLY1, AMS_ALARM_SUPPLY1 },
+	[AMS_ALARM_BIT_SUPPLY2] = { AMS_SEQ_SUPPLY2, AMS_ALARM_SUPPLY2 },
+	[AMS_ALARM_BIT_SUPPLY3] = { AMS_SEQ_SUPPLY3, AMS_ALARM_SUPPLY3 },
+	[AMS_ALARM_BIT_SUPPLY4] = { AMS_SEQ_SUPPLY4, AMS_ALARM_SUPPLY4 },
+	[AMS_ALARM_BIT_SUPPLY5] = { AMS_SEQ_SUPPLY5, AMS_ALARM_SUPPLY5 },
+	[AMS_ALARM_BIT_SUPPLY6] = { AMS_SEQ_SUPPLY6, AMS_ALARM_SUPPLY6 },
+	[AMS_ALARM_BIT_RESERVED] = { 0, AMS_ALARM_INVALID },
+	[AMS_ALARM_BIT_SUPPLY7] = { AMS_SEQ_SUPPLY7, AMS_ALARM_SUPPLY7 },
+	[AMS_ALARM_BIT_SUPPLY8] = { AMS_SEQ_SUPPLY8, AMS_ALARM_SUPPLY8 },
+	[AMS_ALARM_BIT_SUPPLY9] = { AMS_SEQ_SUPPLY9, AMS_ALARM_SUPPLY9 },
+	[AMS_ALARM_BIT_SUPPLY10] = { AMS_SEQ_SUPPLY10, AMS_ALARM_SUPPLY10 },
+	[AMS_ALARM_BIT_VCCAMS] = { AMS_SEQ_VCCAMS, AMS_ALARM_VCCAMS },
+	[AMS_ALARM_BIT_TEMP_REMOTE] = { AMS_SEQ_TEMP_REMOTE, AMS_ALARM_TEMP_REMOTE }
+};
+
+static int ams_scan_index_to_event(int scan_index)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(alarm_map); i++) {
+		if (alarm_map[i].base_offset == AMS_ALARM_INVALID)
+			continue;
+
+		if (alarm_map[i].scan_index == scan_index)
+			return i;
+	}
+
+	return -EINVAL;
+}
+
 static int ams_get_alarm_offset(int scan_index, enum iio_event_direction dir)
 {
-	int offset;
+	int offset, event;
 
 	if (scan_index >= AMS_PS_SEQ_MAX)
 		scan_index -= AMS_PS_SEQ_MAX;
@@ -779,36 +822,11 @@ static int ams_get_alarm_offset(int scan_index, enum iio_event_direction dir)
 		offset = 0;
 	}
 
-	switch (scan_index) {
-	case AMS_SEQ_TEMP:
-		return AMS_ALARM_TEMP + offset;
-	case AMS_SEQ_SUPPLY1:
-		return AMS_ALARM_SUPPLY1 + offset;
-	case AMS_SEQ_SUPPLY2:
-		return AMS_ALARM_SUPPLY2 + offset;
-	case AMS_SEQ_SUPPLY3:
-		return AMS_ALARM_SUPPLY3 + offset;
-	case AMS_SEQ_SUPPLY4:
-		return AMS_ALARM_SUPPLY4 + offset;
-	case AMS_SEQ_SUPPLY5:
-		return AMS_ALARM_SUPPLY5 + offset;
-	case AMS_SEQ_SUPPLY6:
-		return AMS_ALARM_SUPPLY6 + offset;
-	case AMS_SEQ_SUPPLY7:
-		return AMS_ALARM_SUPPLY7 + offset;
-	case AMS_SEQ_SUPPLY8:
-		return AMS_ALARM_SUPPLY8 + offset;
-	case AMS_SEQ_SUPPLY9:
-		return AMS_ALARM_SUPPLY9 + offset;
-	case AMS_SEQ_SUPPLY10:
-		return AMS_ALARM_SUPPLY10 + offset;
-	case AMS_SEQ_VCCAMS:
-		return AMS_ALARM_VCCAMS + offset;
-	case AMS_SEQ_TEMP_REMOTE:
-		return AMS_ALARM_TEMP_REMOTE + offset;
-	default:
+	event = ams_scan_index_to_event(scan_index);
+	if (event < 0 || alarm_map[event].base_offset == AMS_ALARM_INVALID)
 		return 0;
-	}
+
+	return alarm_map[event].base_offset + offset;
 }
 
 static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
@@ -821,49 +839,13 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 		scan_index = AMS_PS_SEQ_MAX;
 	}
 
-	switch (event) {
-	case AMS_ALARM_BIT_TEMP:
-		scan_index += AMS_SEQ_TEMP;
-		break;
-	case AMS_ALARM_BIT_SUPPLY1:
-		scan_index += AMS_SEQ_SUPPLY1;
-		break;
-	case AMS_ALARM_BIT_SUPPLY2:
-		scan_index += AMS_SEQ_SUPPLY2;
-		break;
-	case AMS_ALARM_BIT_SUPPLY3:
-		scan_index += AMS_SEQ_SUPPLY3;
-		break;
-	case AMS_ALARM_BIT_SUPPLY4:
-		scan_index += AMS_SEQ_SUPPLY4;
-		break;
-	case AMS_ALARM_BIT_SUPPLY5:
-		scan_index += AMS_SEQ_SUPPLY5;
-		break;
-	case AMS_ALARM_BIT_SUPPLY6:
-		scan_index += AMS_SEQ_SUPPLY6;
-		break;
-	case AMS_ALARM_BIT_SUPPLY7:
-		scan_index += AMS_SEQ_SUPPLY7;
-		break;
-	case AMS_ALARM_BIT_SUPPLY8:
-		scan_index += AMS_SEQ_SUPPLY8;
-		break;
-	case AMS_ALARM_BIT_SUPPLY9:
-		scan_index += AMS_SEQ_SUPPLY9;
-		break;
-	case AMS_ALARM_BIT_SUPPLY10:
-		scan_index += AMS_SEQ_SUPPLY10;
-		break;
-	case AMS_ALARM_BIT_VCCAMS:
-		scan_index += AMS_SEQ_VCCAMS;
-		break;
-	case AMS_ALARM_BIT_TEMP_REMOTE:
-		scan_index += AMS_SEQ_TEMP_REMOTE;
-		break;
-	default:
-		break;
-	}
+	if (event < 0 || event >= ARRAY_SIZE(alarm_map))
+		return NULL;
+
+	if (alarm_map[event].base_offset == AMS_ALARM_INVALID)
+		return NULL;
+
+	scan_index += alarm_map[event].scan_index;
 
 	for (i = 0; i < dev->num_channels; i++)
 		if (dev->channels[i].scan_index == scan_index)
@@ -877,43 +859,18 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 
 static int ams_get_alarm_mask(int scan_index)
 {
-	int bit = 0;
+	int bit = 0, event;
 
 	if (scan_index >= AMS_PS_SEQ_MAX) {
 		bit = AMS_PL_ALARM_START;
 		scan_index -= AMS_PS_SEQ_MAX;
 	}
 
-	switch (scan_index) {
-	case AMS_SEQ_TEMP:
-		return BIT(AMS_ALARM_BIT_TEMP + bit);
-	case AMS_SEQ_SUPPLY1:
-		return BIT(AMS_ALARM_BIT_SUPPLY1 + bit);
-	case AMS_SEQ_SUPPLY2:
-		return BIT(AMS_ALARM_BIT_SUPPLY2 + bit);
-	case AMS_SEQ_SUPPLY3:
-		return BIT(AMS_ALARM_BIT_SUPPLY3 + bit);
-	case AMS_SEQ_SUPPLY4:
-		return BIT(AMS_ALARM_BIT_SUPPLY4 + bit);
-	case AMS_SEQ_SUPPLY5:
-		return BIT(AMS_ALARM_BIT_SUPPLY5 + bit);
-	case AMS_SEQ_SUPPLY6:
-		return BIT(AMS_ALARM_BIT_SUPPLY6 + bit);
-	case AMS_SEQ_SUPPLY7:
-		return BIT(AMS_ALARM_BIT_SUPPLY7 + bit);
-	case AMS_SEQ_SUPPLY8:
-		return BIT(AMS_ALARM_BIT_SUPPLY8 + bit);
-	case AMS_SEQ_SUPPLY9:
-		return BIT(AMS_ALARM_BIT_SUPPLY9 + bit);
-	case AMS_SEQ_SUPPLY10:
-		return BIT(AMS_ALARM_BIT_SUPPLY10 + bit);
-	case AMS_SEQ_VCCAMS:
-		return BIT(AMS_ALARM_BIT_VCCAMS + bit);
-	case AMS_SEQ_TEMP_REMOTE:
-		return BIT(AMS_ALARM_BIT_TEMP_REMOTE + bit);
-	default:
+	event = ams_scan_index_to_event(scan_index);
+	if (event < 0)
 		return 0;
-	}
+
+	return BIT(event + bit);
 }
 
 static int ams_read_event_config(struct iio_dev *indio_dev,
-- 
2.47.3


