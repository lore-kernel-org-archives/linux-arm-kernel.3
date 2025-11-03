Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A06CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PPrnykW9RcTv8SXmC4oIff7zEg9zUe3KhDF23k6GnlE=; b=G79ZQdOkev80vMaL0luNVXBKYG
	MMsr6mGg0d/XxpK9uKIQCS/77AGd1YR5Am88PMO9cpjVPrHL+zog/RC8+W825T/D2+hXmD4tvgIZA
	XNRRsBXUCWh3kvumUCukhUzUpsc5ND0KQ+e+nw9PdENqpCWJb18DcmXVTQdz+ZoH/wGP9b0iOXrZ4
	4VaEDSEBB9QDNI5povxsnPGsOTjqnS1YEbV75eGHkxm/Kzi9s3jjmO3Z+wkhLGX04rXUXRN2Seqen
	9Um9HuNE/4vEdU1FJ27RowFTP3dUbsQOJIWzcov0nZqaWK4OMKuB1UgwIM8SNtxJ85btChgsmDjqT
	JvV32hvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttZ-00000009qZq-19A4;
	Mon, 03 Nov 2025 12:42:49 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFttX-00000009qWn-0U8d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 12:42:48 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6409e985505so2681584a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 04:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762173765; x=1762778565; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPrnykW9RcTv8SXmC4oIff7zEg9zUe3KhDF23k6GnlE=;
        b=u3e3MX3OEWwM9hKeJpaxnIMuqXRPde51QYxxVnGqhcXFOhgWkBuheMPQZS8nW9cJ26
         W/rYDSjMtmU3gxELW7l5y/I8Ne3nM8JS7ErNmFcau79F/zOAK5OH+05fMtmTD+xuuGRS
         t3dJgzl7OvuB3//iLEkSxEkLwf/qMkHgiGOu/ZYaXmV03y16qtqVlCuza9XJv55rV86Y
         NTZFd9EcttjPIvJliPY7o4m3pxhixTM0Y2h0Nkk8NtvY8gERIHvpufhTjTobjJsVhzGO
         8wmLPw0okm0uASBuHDCPAtKUVLgZvnWJVYihnGGtCwGUJtW6OKFP1N+FLfejGGkui5m2
         MwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762173765; x=1762778565;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPrnykW9RcTv8SXmC4oIff7zEg9zUe3KhDF23k6GnlE=;
        b=PIpa6ASNPZKBWSJtCSTpesWwaFARm4pgYXiubfuKTuS3dyrbDSo8aypwXmcuy3L3sx
         dgGug19hRNpHMSTgV4jQ/h4fuWWNGxyNPfJUmDDjCuMCTDn+Muyr0a1z6YLrlvG4xqZN
         3pN7CKoqORlcKodZI4VQbTuU7uHwqfwNvlRdkDT35Moyn5UcKMehObv6uoC4l5r38KjL
         hPk6KsXSsGsN1K/eUTWpZc1MXic2u5s6l49/AoHOwHUljEbHRcmyJ8R4GSjRJUwHr91V
         kXhb0NFNb1mKSDisxsd/vTZOmBtpgYaE1je5O7eBsJLJqsaZKbGizuxIdRZ7ocoH22bX
         kFlg==
X-Forwarded-Encrypted: i=1; AJvYcCUEBbzjYxP3yrZnYH3BA4xvNCx4Y/y4BuVqP8g/e7lL4mKdXyh5CpDitxQo3gKvh/3/CVnKKiaR7L6oOOj6VmhU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe5dDO6sDEfyKfQyRiNfb41AZ5HjCwhJ/Hp89lv/gG8fT1EXDS
	cxwPDuaGZlNIkxzz7o/mqb74Ppjau12T0VxNN9r0UNnDdx3r6hscli09p1mMYuIBvio=
X-Gm-Gg: ASbGncuuh2vIpzHhAJIO8THyVbrvDX/mVT8OGRirS7rLLYEbF8R+tfS1VOrDkMcLvaQ
	uLHXZde1N9daL1wb4v6AtXh9dPHEx53fMn/jArK1lTQuXz/z1igV+cwwNVwWROKccYEGerPEHYp
	gU3RNzOlDsQp/ANUZ3lgPL05rEihyZgRCzksUvM9UxDgjg+n77vDfDo3NqPA+gSurkl4IUjBxJE
	rXPJjwGSDEzJ2v68+Mi4fekxyyH9lxlVdtNbbFZJ7HvBybOma/bnAN35B6MNvo16eV72LUymShH
	jF8jTsNPjEdzrJnw99wbeR7iufOjil8TIjdS8k8m3If+7dSRNe2FI75y2MPhMkkgj1qE6CygGvy
	BU0aqvN11rG2zQxwxjnxEdT9VaKB249pC7Ykwt7HQRihp10R+k5SS+3JxUsjr2tYPz2lpIXk=
X-Google-Smtp-Source: AGHT+IEt2sGyB8OGmSAirfMXRL4rXymXxxnigXWQMbloi64CMl+rBW5jNMGAdVjLMSOzt2Z2+JBIlg==
X-Received: by 2002:a17:907:60cd:b0:b3b:110c:d343 with SMTP id a640c23a62f3a-b70701061c7mr1219796166b.8.1762173765217;
        Mon, 03 Nov 2025 04:42:45 -0800 (PST)
Received: from localhost ([2001:4090:a247:830a:fe22:a8:f29a:a5c3])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b70bd65ca39sm348853066b.26.2025.11.03.04.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 04:42:44 -0800 (PST)
From: "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
Date: Mon, 03 Nov 2025 13:42:21 +0100
Subject: [PATCH v10 3/3] firmware: ti_sci: Remove constant 0 function
 arguments
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251103-topic-am62-partialio-v6-12-b4-v10-3-0557e858d747@baylibre.com>
References: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
In-Reply-To: <20251103-topic-am62-partialio-v6-12-b4-v10-0-0557e858d747@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "Markus Schneider-Pargmann (TI.com)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2722; i=msp@baylibre.com;
 h=from:subject:message-id; bh=9WWZRj95x1PsEyZywEyr4mp9AG5VR4rGO6uiOLlvg2k=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhkyOxdZ7NE5/fPheUGmV3Z/0nr0a4lOcNDdtrst6dE+iI
 5rzgu6ljlIWBjEuBlkxRZbOxNC0//I7jyUvWrYZZg4rE8gQBi5OAZjIMz2G/+lzd76tzC2pOXVi
 14eD3gfTM6epTn4ZKz5hxcdT513ypIIZ/tfuLI4p25z+VE9ng/P5tUrJc1ZvqXbXUq8I0eOXn1B
 mxAAA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_044247_183112_362E09CE 
X-CRM114-Status: GOOD (  13.62  )
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
 drivers/firmware/ti_sci.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 811507ded63ac784ad6c6ad77b2f827768f3f3c7..023c603ae58cb5df176c66eec429bd0b4037b798 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -1664,14 +1664,10 @@ static int ti_sci_cmd_clk_get_freq(const struct ti_sci_handle *handle,
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
 	u32 msg_flags = mode == TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO ?
 			TI_SCI_FLAG_REQ_GENERIC_NORESPONSE :
@@ -1702,9 +1698,9 @@ static int ti_sci_cmd_prepare_sleep(const struct ti_sci_handle *handle, u8 mode,
 
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
@@ -3729,7 +3725,7 @@ static int ti_sci_sys_off_handler(struct sys_off_data *data)
 
 	dev_info(info->dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
 
-	ret = ti_sci_cmd_prepare_sleep(handle, TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO, 0, 0, 0);
+	ret = ti_sci_cmd_prepare_sleep(handle, TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO);
 	if (ret) {
 		dev_err(info->dev,
 			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n",
@@ -3768,8 +3764,7 @@ static int ti_sci_prepare_system_suspend(struct ti_sci_info *info)
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


