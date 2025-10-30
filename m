Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE5E6CCF9F5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=; b=1w5BKcB4rxjm+ST3I6l4fryQ/N
	SVZ6vCMGRSOuzx+16xRT/CyTyBIvs3AfX6pdMyqQlO7+G3S246HL1VsdKjf7FlM+ii++dxcTmDALR
	spSAalZAko3ffZOpNv49gXcLFE0yux9xyxGjwCwlpDCh5B5oL+wz5hail2rDApg6fU9kd5pIEfd3r
	AvubMHQSl3RJ00xNBhDOMjJkhTaDOoM2ycRzAtzdSInI03oF75a3aKYNIA83DUu7xcIXAIgqU4C5J
	pED8yF77xPs5SvhKU2C/X+KFsfKdGvfU4c6IVLkPQQKh8mUkSeaUQTsRrAY8d/AGJwR0mBWj7HTKr
	UhiIGaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvx-00000003rNW-49wn;
	Thu, 30 Oct 2025 09:27:05 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEOvv-00000003rMH-2skT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:27:04 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso7583285e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 02:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761816422; x=1762421222; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=;
        b=JRQeC8+a+zOc4XWKwnoAkuowAv8zMFCGNJXBUxEvYRxIJHQH5vz7B7hhEOnWBkrkVg
         6PECWPxigd8xE71jLnuJewqg1bOC0xjQe2IE+m1gaiPmK+CXGxecFpGeL2iezIIsAGHd
         /htDZADWElctZn32lpU1skWj8WiMzsTiHPv4YsN66rKixfOSDYwvMB41Eu9zsLobLnOH
         kOvGzgAzRqpZJrn26iUsHOp78DFA2MyYaKisqxSLi8u/52vus+GF3tUkibXmquOR98C7
         ot0kijOe1w7hu5AXnhXkAp48Lo8etMkXrrUhPZ+dmKPs+5XMEKD1x+g59a/uOb8mHeQ6
         9D8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816422; x=1762421222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f2nbBjY1ngedAQK32AIlHILlTX4360hWS/5AwjBnjIw=;
        b=rnEaiDR7FJB35SPbyqNDuHE7jR+G7EiEDSPbQuceTBqaSK4JJ8T1sVGvZGv8f0p4Ac
         zUKReDjFFq+wdoW3lScWfVGDIzfdt+b1tn060UBt0BcnftfYj14uFbKt7D4Bp/RviCkN
         Go78GEugxOynL+srYG57J3cTbR06hhWwRnccZnr73x0KVCBXTdHLWCwfiKX5aVyr/9j8
         YpsGJN3pO45xYeRItILu7QuaKpJUvZM4+0miiiPPX2QIlY4ettMMdHz1K8KQHJ8MLZS4
         4XfXKdEJhEchEuXmW+CcOoaW1YdxbmARW1xO4V21eyAhxjmXGrLbI6c9k5d9lvI169K4
         DrdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyw+Y9lyZgXj3AemEVX0vBQnM94brJvwBUsRScWd9W/kv8hIzaarMwzuLrGOmcPXt5vv7EP9LCQSDakaW74nIY@lists.infradead.org
X-Gm-Message-State: AOJu0YxdrIp+MxxTS+/FhBcUoJSv5hcDXWdDZkcmjDIeCNC4ekuCurRh
	ul3NfZDuEHUpli8UVBSmutgSnRG9RRbaxx7GuOqgDawGmSbhfCA+13AgmGuarlgJTVw=
X-Gm-Gg: ASbGnctbyT+S1SBzl6NMD0akrGF76RLq1zXYGES8HZu1JCREF8grAG3BlNQkbM3AlR/
	331QONG+kzn+sZg+OBpAm1MrLs5FDwmH6alMdmybqbzdOXPn/9cpOnOmLxNKAZcBkPpWRxbXF//
	z8vkDpKxSk3othps8kKGuxROa60gXk0mREHsEger1NmjqMU+wVOQF4LXNM7M0O72gT7U8o5SAgr
	L9GM1dBpj3xkEUlWTeKqE5/sPvfUiiWf99f95EVymlna1VZOwb1JYCRjWoOTw1rMV27ta4SAjtf
	GDLz2apomgbeLJYD6Z4ZRZ5psveM0ZnytkoR7sZiCIw+lSXjSFSnBIdwj+E+hUs0m8sRxck//gv
	LzYU9xML7bCzHy4ITrJO2LgU2pCsUs6RcGsFCzjircRkETvTBJbIyc4PjEXpaqx6CYHFvE8pABz
	HdgcV0QDcY
X-Google-Smtp-Source: AGHT+IGXRhetBmDY0UqanhzjhdwbjEaOqJ9qlQPU7v66jN4giQVF3G2msZickY+kz8JV5cPNKrQRJw==
X-Received: by 2002:a05:600c:3b85:b0:475:e007:bae0 with SMTP id 5b1f17b1804b1-47726736870mr19689495e9.16.1761816421828;
        Thu, 30 Oct 2025 02:27:01 -0700 (PDT)
Received: from localhost ([2001:4090:a245:8496:49da:2c07:5e9a:7fb9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429952cbb20sm30827543f8f.18.2025.10.30.02.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 02:27:01 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Thu, 30 Oct 2025 10:26:08 +0100
Subject: [PATCH v9 1/3] firmware: ti_sci: Remove constant 0 function
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-topic-am62-partialio-v6-12-b4-v9-1-074f55d9c16b@baylibre.com>
References: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
In-Reply-To: <20251030-topic-am62-partialio-v6-12-b4-v9-0-074f55d9c16b@baylibre.com>
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
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkxmfdtWEfXP9w89uvlp5cdTLK/Wv7ogG2Pgev4jq9/HL
 Reb/n3c01HKwiDGxSArpsjSmRia9l9+57HkRcs2w8xhZQIZwsDFKQATme3GyPCNQ1tN82iyZ73v
 jWNzbKccmanrVxogL9h9eLajouDzvL8M/wtdOpWEmQSvRqQF7PqkEZG3+rp3+Y2Q5d9SCl+Wzmd
 KYwQA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_022703_747321_66DD24DF 
X-CRM114-Status: GOOD (  12.14  )
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


