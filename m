Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D53CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=; b=yolISsCu+vnYj0sVNYKraEkKKe
	p0aUsSSOVQyv+3OOZG1Bzfps7u5YcAas6RPi3VSy3iddryvjguVKvDlVZPu0xCFp6jL47v4moXsZe
	y1z5Pi9/THpagHzGI1h+5dv5rR5jVb6aiWeSBOjk5ZbvgGoZFKnwoNNI/r1EqoPEeL7KVYDaldKlp
	dPBddFq/7J7H7fc3bL5uqWgFfZfWq5OmWUdgTCtQHZ5vLmHVdmJLiE1OfBW6T+xsGdaQzc6FlsNrb
	XKcimHeVFVcLudYpx7tnaIzed8HmRo9n0itgmdg+r+6Wi9SeQ5KVaVgDCj4GToHbGRsiW7T7fkWPI
	PeDH+LCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xyD-00000008DVB-0i8Q;
	Wed, 01 Oct 2025 14:38:17 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xyA-00000008DTc-2WAR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:38:15 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-afcb78ead12so1312310366b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1759329493; x=1759934293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=;
        b=zbNVxA587uZbD+ztdNGfcLAkSM6Sf8F0JslBgQvofIKTsMUtzUuE6ljoeX4h0uyvuy
         cZsG3vJXXU+pP5Ac0VSP+U+lakLuBveWrPlq6JuHewwyPR4rLnGwweB+NEQXVG5bBalk
         aAAYyptT4J2cQng/CTS5/T07FxoAGMvfuxY+dU5vzAcwvOBC9RDD0t09oiG2aIgjBag0
         TdAeBy2JHvpjyknhZYwckIGBrs+TPplLgAgHCA9za+yZhDlgQioyQ/vFlnNigf7e2lqa
         1L1VXOxV1k8/+7zvIBn/YL5WMmQi02mW2FUpF8qvQPLF5eK9lWtBR+50zLIB5FzbtP4G
         FR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759329493; x=1759934293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=;
        b=AqZzFr8FbrOe+GW2kLVX0glWg1XleBEYCz/BgU+CsL5QGcQZiNMZgNN3u//vE1BZBM
         gnGA5sSTK+7ebO3UVx/FH+KQaCfTn+n/W+GrIu5lASF0D8E9TYAD3y2DxJzCW5z2QyRZ
         pMziol6HH0FB9552cJ/OwlWDkNx0PkM59dGNgrIyDxGVCjrHappdhKu0PBhlEUpZ1B71
         LorUGlE/GmZumerm4RFFWCjSAv2efXokB4+ZNM9fyHbgqYj7M6/AHeKNtSnUm1VNwg19
         //gCOO3OSJGrQihF7F2U6RD9zzfhbJYElUaCp05i6U9imT/wLkGBEZzZRubS0Ak09LM2
         4ETA==
X-Forwarded-Encrypted: i=1; AJvYcCVQtzU0baJr8oiBRMDOiZ50FXbH3vTFu1AT457N70LCp/Up2h53Hk+JgCcDfOytELPHME8JE6ir/u9iLcw10cep@lists.infradead.org
X-Gm-Message-State: AOJu0YyPX/YmhfkqBCHo/1lxOWu5jjuzNlPx6Qy+yir4alO9tarzXfyE
	CRDNRBppingDzAB85Eqa59X6g0SC+CwhRt0ua+nbrvi43MHm6EgfOU6o0woAcNZtTsw=
X-Gm-Gg: ASbGnctpmyaq1VFmvkc5ycTc/DSoDWndjJe2Wi6v7qhl7FDbWBR0zzJEHDgyzGlHQ8c
	ASUcuplPVf6q2wugBxWNYqa+WtByfA8WKiHaj8IsW3mSLenfSSB2TOU/Ucqxep7NORPh1g4cTUq
	WpjhgDWum4cR+p2geUDWeK3JNL78/s5MHTk69Rezno8D6xYT8mQRrr+fFbG9pnblJO0iXIp/2Hb
	qtogpC3AZSIzcDnY47kq9CVW+ViL6HFS2OxJWy6cz9UBs14mw3G8tmf0iXhgy9kGoE1S8nd421F
	xvdTvf0sbmuQSMn/omnxdxrMD6Seu1kIz1knDHuscT+HJN3neCksuGWK2YerK0zjNsA3gogFxay
	QAGSsj1idblHXTT44vcCFyG5byrJb4olQY9euAca2beDK
X-Google-Smtp-Source: AGHT+IFq8ZndNY94ug4Vncfn6GMH3AJectm8OrQgKj3dtrGm9CswRsXpRhsooX03/jVdbWn1ILmXPQ==
X-Received: by 2002:a17:907:9487:b0:b3f:ccac:af47 with SMTP id a640c23a62f3a-b46e8894979mr402428366b.31.1759329492716;
        Wed, 01 Oct 2025 07:38:12 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b3f57c9c2e2sm629872966b.68.2025.10.01.07.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:38:12 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Wed, 01 Oct 2025 16:37:38 +0200
Subject: [PATCH v8 1/3] firmware: ti_sci: Remove constant 0 function
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251001-topic-am62-partialio-v6-12-b4-v8-1-76a742605110@baylibre.com>
References: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
In-Reply-To: <20251001-topic-am62-partialio-v6-12-b4-v8-0-76a742605110@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209; i=msp@baylibre.com;
 h=from:subject:message-id; bh=KhR7mlGuLILLgbABDE8JZr+5vkedHPIY9RgeGmUDVFM=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhoy7NvuKNpSGHnlyR/7Vs+1t0ywXXX4aJS6VUflv4RERQ
 ROHn2uWdpSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEVj1jZFhanJD0/IWUTKWO
 9Yx6JSUli88rX6ndKk74cPhXq0O00VuG/0GXvZN+bzy6Vee2gZ2VFNtaNtbd8y/s9mF0s/MN52k
 UYAAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_073814_658085_DE36DD09 
X-CRM114-Status: GOOD (  13.01  )
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

ti_sci_cmd_prepare_sleep takes three arguments ctx_lo, ctx_hi and
debug_flags which are always 0 for the caller. Remove these arguments as
they are basically unused.

Signed-off-by: Markus Schneider-Pargmann (TI.com) <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 49fd2ae01055d0f425062147422471f0fd49e4bd..24ab392b4a5d0460153de76fe382371e319d8f2e 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -1661,14 +1661,10 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
  * ti_sci_cmd_prepare_sleep() - Prepare system for system suspend
  * @handle:		pointer to TI SCI handle
  * @mode:		Device identifier
- * @ctx_lo:		Low part of address for context save
- * @ctx_hi:		High part of address for context save
- * @debug_flags:	Debug flags to pass to firmware
  *
  * Return: 0 if all went well, else returns appropriate error value.
  */
-static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
-				    u32 ctx_lo, u32 ctx_hi, u32 debug_flags)
+static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode)
 {
 	struct ti_sci_info *info;
 	struct ti_sci_msg_req_prepare_sleep *req;
@@ -1696,9 +1692,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
 	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
 	req->mode = mode;
-	req->ctx_lo = ctx_lo;
-	req->ctx_hi = ctx_hi;
-	req->debug_flags = debug_flags;
+	req->ctx_lo = 0;
+	req->ctx_hi = 0;
+	req->debug_flags = 0;
 
 	ret = ti_sci_do_xfer(info, xfer);
 	if (ret) {
@@ -3689,8 +3685,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
 			 * internal use and can be 0
 			 */
 			return ti_sci_cmd_prepare_sleep(&info->handle,
-							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED,
-							0, 0, 0);
+							TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED);
 		} else {
 			/* DM Managed is not supported by the firmware. */
 			dev_err(info->dev, "Suspend to memory is not supported by the firmware\n");

-- 
2.51.0


