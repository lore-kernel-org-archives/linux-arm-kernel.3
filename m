Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B224C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 15:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jMN3WBwV3KB4v9bEDXkBGlhmHx1HUQvcapjqufTDqM=; b=EznktiKwhj7dHPUenLWsg8NBiF
	ayjjccSkd/oNorGUJ6jkmqBa5mSHEkRw2Op+aYTrdBE+B52qzy39/cvgtVqTlFwuJHZqFXGzMGb4l
	7VfhHmwE2FESP4O4H92kxcsfczzLrySG538ycJpC8dGGP54TAAJXXWBD7MdqnuoW4+uf192Vi1e71
	aDWKWCRvyNniAUr84nWCtFM+6+QwHuRHP1blPLogUyhp0T/a98xk06vixW5qXcGS/pj+MhmrgQaHz
	KJV9JZxUUhuuQNSQ+pZkLHwN3BBFG99qOn/5206E6ah9z9seCBXy6fGxgeRhifyL0LqnNP2tERyzP
	TlijCcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyP-0000000GTMd-2CSr;
	Wed, 12 Aug 2026 15:34:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuAyJ-0000000GTKU-10i2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 15:34:32 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso1028256a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786548866; x=1787153666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/jMN3WBwV3KB4v9bEDXkBGlhmHx1HUQvcapjqufTDqM=;
        b=b4dV9cBN1FO6BBxFgt2wIYRZRmQrFuoC9RoJvhkTLnESx68IRDB+uoX/oaVIFWyjEU
         1SMnZJBeyTlcxFYRoAmpDs/efEF0I3atHbHV0q3j12OV/DQ3heU+3uNFk1oPBAwJljz9
         vVBzTS1EuncNKDUNmiUUM5ILxd0ZPFK5SbRb78ZxZvggj4Om53jNgTZEGSzy6WpeHCw+
         khZqM1jt0UF7X9n9PNWgeBHUWoD2rusU/F1CmoYu66gbDifsjs/zicE+1HkuSvaE+MJc
         wEg0AAtGAnfA7Vu3jmMXTHz/BYcmcwEw28XPgJ6ZcdXea7dvD5u1Pg76jZRmdPHUbePo
         vIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548866; x=1787153666;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/jMN3WBwV3KB4v9bEDXkBGlhmHx1HUQvcapjqufTDqM=;
        b=Mt+Y1af/yO4+7Sd65GlqfgxVJ37H7uesrXzk/c+Ns24d0gouN0u+7g5G1o5CVKPrLN
         dPL0KP8jIj/dLVJwuZzSXT/Js63RqccWIRHgzCgJQUJhwY1aWo0UnbkuQP/k15ES0EHW
         J9oZBvzmopn0zFDdtknyrijkatrCqZdru2uWKxBkc/vqtF1Uib1eWCIOKOYg1hgYUG4x
         TePMEf74nnYd7G+7puG5byOREt8xln07f+aTXDUct+Ynmn8kUUqVFqbEyBF6l6AgOsUQ
         bYdAFrBl326sPmYdWfJHQ6LiD/uQWwvIuQP3VNW5drncUbKnhZFiDfRO2PGV3ZbVZ+cU
         lc4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Qy4GGpCGkvancAZweRpUhaAHuroq3jZuQpo0mHzAy7koqso2Ax+8waYTVN3Aj0E1t7xAdC5Vm15FuN/RiDJg@lists.infradead.org
X-Gm-Message-State: AOJu0YzhaGNmTazHZqaiu9VEgnMVlmVmEdEUrMTrJlYGY6D646Os+kJV
	xashIYndAYcg7ELxVBI48XjtJKdBqHkA4SzIwuhlwUeNviuqjKZnpHw=
X-Gm-Gg: AR+sD12joPferC99cmoWx9z2/qcW+FufwdXL+dpFycDaAXtIVUHplexfJpv3NKWimpR
	8hF2zJhIg0n/uEhCdmIfOyL9BZomaqVoPD/D2AB+mg1BeX29h8BlE16MOENeU35CdEBRtVu2KeF
	qdEzPOAtxW39vEqD/2hAJss9OQ9iOJfk+W9PsnFTYThf1OzgVwWjwUPhhefA7fNwRBX/5j7BecX
	idFVlGvSY/CbHaYOk0pN0nCxw9qo6y6UVNRiWijyqM+cVXr3FlR2umXhiGx7OBt7mnTXXQNRsHs
	GtR/whSpoqyCIB/VVyOEPueOox4+KyzRB4/MvFnWgL/EJ6t0f7Aiovni4vc3zxlQ2kXAT0+LWC0
	81Ukt8/W67GkiRdqGYsym4vf1Jq1pGXkdOxS2YPPb+HhW9a7wkk2tOPzUoqPv4uLYEbawMZcZCk
	xdOUlXdz6ORTbGk1oPgcphcAKEb2re2TKkea9sRjtRvAewERd208Ss3eam8D04wXr+kv+Kf7TAS
	gy80YoDWma/drSRBvxvEf0b
X-Received: by 2002:a17:90b:580b:b0:381:28e0:6259 with SMTP id 98e67ed59e1d1-39301490293mr7234944a91.9.1786548865759;
        Wed, 12 Aug 2026 08:34:25 -0700 (PDT)
Received: from at-Standard-PC-Q35-ICH9-2009.. ([14.97.72.18])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31dba3e9791sm7160804eec.0.2026.08.12.08.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:34:25 -0700 (PDT)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: 
Cc: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	Sebastian Reichel <sre@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH] debug
Date: Wed, 12 Aug 2026 11:34:06 -0400
Message-ID: <20260812153411.1159-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_083427_279277_28E56117 
X-CRM114-Status: GOOD (  12.94  )
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

Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
---
 drivers/acpi/sbshc.c                | 11 +++++++++--
 drivers/power/supply/macsmc-power.c |  2 ++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/sbshc.c b/drivers/acpi/sbshc.c
index 6bf5c5de5b89..a919be8bff05 100644
--- a/drivers/acpi/sbshc.c
+++ b/drivers/acpi/sbshc.c
@@ -207,6 +207,7 @@ int acpi_smbus_register_callback_global(smbus_alarm_callback callback, void *con
 
 	struct acpi_smb_hc *hc = READ_ONCE(global_hc);
 
+	pr_warn("registered callback\n");
 	mutex_lock(&hc->lock);
 	hc->callback = callback;
 	hc->context = context;
@@ -233,6 +234,7 @@ EXPORT_SYMBOL_GPL(acpi_smbus_unregister_callback_global);
 
 static inline void acpi_smbus_callback(void *context)
 {
+	pr_warn("acpi_smbus_callback\n");
 	struct acpi_smb_hc *hc = context;
 	if (hc->callback)
 		hc->callback(hc->context);
@@ -243,15 +245,20 @@ static int smbus_alarm(void *context)
 	struct acpi_smb_hc *hc = context;
 	union acpi_smb_status status;
 	u8 address;
-	if (smb_hc_read(hc, ACPI_SMB_STATUS, &status.raw))
+	pr_warn("smbus_alarm called\n");
+	if (smb_hc_read(hc, ACPI_SMB_STATUS, &status.raw)) {
+		pr_err("smbus_alarm: cant read status\n");
 		return 0;
+	}
 	/* Check if it is only a completion notify */
 	if (status.fields.done && status.fields.status == SMBUS_OK) {
 		hc->done = true;
 		wake_up(&hc->wait);
 	}
-	if (!status.fields.alarm)
+	if (!status.fields.alarm) {
+		pr_err("no alarm\n");
 		return 0;
+	}
 	mutex_lock(&hc->lock);
 	smb_hc_read(hc, ACPI_SMB_ALARM_ADDRESS, &address);
 	status.fields.alarm = 0;
diff --git a/drivers/power/supply/macsmc-power.c b/drivers/power/supply/macsmc-power.c
index d4614fd728c5..8fb3694ddc58 100644
--- a/drivers/power/supply/macsmc-power.c
+++ b/drivers/power/supply/macsmc-power.c
@@ -927,6 +927,8 @@ static void macsmc_power_acpi_callback(void *context)
 {
 	struct macsmc_power *power = context;
 
+	dev_warn(power->dev, "got interrupt\n");
+
 	power_supply_changed(power->batt);
 	power_supply_changed(power->ac);
 }
-- 
2.43.0


