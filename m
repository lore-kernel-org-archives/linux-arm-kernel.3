Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3801DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 00:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jc2UE2akxQAzjNr5wziIui7yUcuJEuqdgN0QuQVwvGI=; b=zSxVABHFxMn6aaVbmGVeWvLuMy
	xnbOwsZfCTncEn+392Y1NpW56Lgp3tSCsBJLKYQH11Zg66/nowxmQG0KXmZJEOtNusKtRIS9onLzr
	xgWTDeQ6lXGsxUthlt7LOV5PdNoRhllpa7e1SPVaxKRtALdykzC45SOiowrwn6wnDcgE6k4s2Hha4
	Q20LD4GB71cBPrroasWhLDwTtjtJuAs+EBFt+xAxyFjOKlIbAgOoIzuYi1/3RIT2raxsVzsewTRVQ
	GzNZMUGCyBLISDqkCiHfJ4D9jkaTtyeuFJVSPFVKIPoemDFS2QM+dNiaBGVGU6lc+DVGF/YAfkIf6
	c/9mgliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZh-00000000n9T-0Q8V;
	Wed, 13 May 2026 00:35:45 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMxZe-00000000n8C-0OAZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 00:35:43 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-2ee1054627bso5166898eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 17:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=usp.br; s=usp-google; t=1778632541; x=1779237341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jc2UE2akxQAzjNr5wziIui7yUcuJEuqdgN0QuQVwvGI=;
        b=KLPJk/UVi5rdJzibhI6Nx6qD/avRXHgVE9LdJcH+4TG00Iv4HTujk5ucq1F6E1s8hh
         i/OqkSKMFrSXCt5OBbfaFDXac2qpc47ezgphohzyyGCQJn9yxV/XDxV16UTkVQmlLoCw
         u7SHQXNOXTbVC/XzJFeBhuAMsJd2JRX2iHLzGBv+IDLcnMpIwVbQKpR0ly9wmz9jDb+5
         UcsZAeo1lJCwZaorwTV1VOm64DCQcyvgWTEYY8xl3VdW3Zm2hQUmt1ItcD7/CqYEBgII
         SbQWAQGv7ICgCfcH70ULruRFK0HDSdJASYY0rF1qMzMs7Rn0HPHM9QA9aEmVvSqNlvct
         7QFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778632541; x=1779237341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jc2UE2akxQAzjNr5wziIui7yUcuJEuqdgN0QuQVwvGI=;
        b=PVzb3gXgS0WckuYJClKrAXCmCevjFTgiNXf4+QFw9wbzSM38j5ODVCBlKpxh1+L8Mc
         iqFXOdK19pyPnOs1qPWqtcIgOZAzRKGPG12oQzF23C+A+CgqNkA/s2OhGPEpv6zB2By/
         ObcdQK4SlP/bLUMKTRCIsScyluAaH28pjAIW+ULv0tlNFftbpHiwdmrJ/x+h16JUghoA
         WYkiAwGGiFLJtdAToX6Yssotzwyx8avnduCofuQCM3ZdWQPJZCo6N70Z3T2U8DGqyUiD
         tNORc3oFqyAdIask6ufVR3P+hgXHjL3o1T8WBAhVV2hRSJ9nPiVLeWgo50sSLYf//1/y
         AaGQ==
X-Forwarded-Encrypted: i=1; AFNElJ/mvy3hPrWXfrp8rOKIVyeQspfVD7le/t+JecANrsv7XiHGNMdfsuDxJJZKE1JCpjOVFpx1GqjHKfQWIpfM8cj9@lists.infradead.org
X-Gm-Message-State: AOJu0YxCajqQkTKO1OS/4n/evfD6IKCN3JaBMRotPc51N/wu19hJVOiY
	wU7UQ5/60dqvVXEjRll7R8DwRP3s7uvp9k6WHemo8BFIYvqLh7J/rzAAe1b0j5IJASA=
X-Gm-Gg: Acq92OHNHAsyLJ63DbB+l7LrrMMOeCq7jtRrohLqKdTzukCASxwIgLKeC7DdedbCIEq
	xKtQIcLra0YYUqxoLhNt711Ewtk1uvErPr+NlOtp+si9rLfBSssh6lpqABnf4wKww7cI8B12vmp
	FTmVm+Yiw50l6APawb1UNIYB7EoEOFcy4TULsPaIaXJriEjImU6VKob23AJg7p7xzuoqYpuIU9A
	XAIP0DZkL3UlO8Do5p2ifXF7LxXP7XX3r5M2xemT+IvCzJBDLin9WFYIOhADplZ/mGCSVxXY7dl
	kSNgqQu6NCtjpHV1LsqSYAjJlwdLhU9d4MCbxK3k9YjGRyHMjOFYVn2nbev8W7QxZrHnc5wQidI
	+kT4UFDDCWZmGpZf3+Z510dcJMrJRZI2FoP0aQxtWExMpXiMTZTgE/Df61/LwhKKPKFt9fRKSgk
	EZdrNEzJogv8ey68BbGzh75TzkH5NPxdrz8KWPwxZZLCZXXeT0DsPmaPNkFdn8K/rKksXgI94hD
	oT/GcuFD/n1xL8mHOumqtBV4tLRpkForeiFphZcv0br03b/
X-Received: by 2002:a05:7300:7241:b0:2ee:7b2e:8a3e with SMTP id 5a478bee46e88-2ff936311e3mr3474885eec.1.1778632541186;
        Tue, 12 May 2026 17:35:41 -0700 (PDT)
Received: from gui-host.Dlink ([177.140.77.53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f91004b6a2sm18471381eec.0.2026.05.12.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 17:35:40 -0700 (PDT)
From: Guilherme Ivo Bozi <guilherme.bozi@usp.br>
To: anand.ashok.dumbre@xilinx.com,
	andy@kernel.org,
	conall.ogriofa@amd.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	manish.narani@xilinx.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	salih.erim@amd.com
Cc: Guilherme Ivo Bozi <guilherme.bozi@usp.br>,
	Jonathan.Cameron@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org
Subject: [PATCH v4 3/3] iio: adc: xilinx-ams: refactor alarm mapping to table-driven approach
Date: Tue, 12 May 2026 21:31:52 -0300
Message-ID: <20260513003503.339418-4-guilherme.bozi@usp.br>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513003503.339418-1-guilherme.bozi@usp.br>
References: <20260513003503.339418-1-guilherme.bozi@usp.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_173542_142777_3BB2C13D 
X-CRM114-Status: GOOD (  17.18  )
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
 drivers/iio/adc/xilinx-ams.c | 161 +++++++++++++----------------------
 1 file changed, 58 insertions(+), 103 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 70a1f97f6dad..d38c4401dfce 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -102,6 +102,7 @@
 #define AMS_PS_SEQ_MASK			GENMASK(21, 0)
 #define AMS_PL_SEQ_MASK			GENMASK_ULL(59, 22)
 
+#define AMS_ALARM_NONE			0x000 /* not a real offset */
 #define AMS_ALARM_TEMP			0x140
 #define AMS_ALARM_SUPPLY1		0x144
 #define AMS_ALARM_SUPPLY2		0x148
@@ -763,9 +764,49 @@ static int ams_read_raw(struct iio_dev *indio_dev,
 	}
 }
 
+struct ams_alarm_map {
+	enum ams_ps_pl_seq scan_index;
+	unsigned int base_offset;
+};
+
+/*
+ * Array index matches enum ams_alarm_bit.
+ * Entries with base_offset == AMS_ALARM_NONE are unused/invalid
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
+	[AMS_ALARM_BIT_RESERVED] = { 0, AMS_ALARM_NONE },
+	[AMS_ALARM_BIT_SUPPLY7] = { AMS_SEQ_SUPPLY7, AMS_ALARM_SUPPLY7 },
+	[AMS_ALARM_BIT_SUPPLY8] = { AMS_SEQ_SUPPLY8, AMS_ALARM_SUPPLY8 },
+	[AMS_ALARM_BIT_SUPPLY9] = { AMS_SEQ_SUPPLY9, AMS_ALARM_SUPPLY9 },
+	[AMS_ALARM_BIT_SUPPLY10] = { AMS_SEQ_SUPPLY10, AMS_ALARM_SUPPLY10 },
+	[AMS_ALARM_BIT_VCCAMS] = { AMS_SEQ_VCCAMS, AMS_ALARM_VCCAMS },
+	[AMS_ALARM_BIT_TEMP_REMOTE] = { AMS_SEQ_TEMP_REMOTE, AMS_ALARM_TEMP_REMOTE },
+};
+
+static int ams_scan_index_to_event(int scan_index)
+{
+	for (unsigned int i = 0; i < ARRAY_SIZE(alarm_map); i++) {
+		if (alarm_map[i].base_offset == AMS_ALARM_NONE)
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
@@ -779,36 +820,11 @@ static int ams_get_alarm_offset(int scan_index, enum iio_event_direction dir)
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
+	if (event < 0 || alarm_map[event].base_offset == AMS_ALARM_NONE)
 		return 0;
-	}
+
+	return alarm_map[event].base_offset + offset;
 }
 
 static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
@@ -821,49 +837,13 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
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
+	if (event >= ARRAY_SIZE(alarm_map))
+		return NULL;
+
+	if (alarm_map[event].base_offset == AMS_ALARM_NONE)
+		return NULL;
+
+	scan_index += alarm_map[event].scan_index;
 
 	for (i = 0; i < dev->num_channels; i++)
 		if (dev->channels[i].scan_index == scan_index)
@@ -877,43 +857,18 @@ static const struct iio_chan_spec *ams_event_to_channel(struct iio_dev *dev,
 
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


