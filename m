Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73ECEC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 11:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKte3VgudbHc3RjluDFuTdUTJFhTrJEHbiUVWp/kvpI=; b=JR+R3cCtSLgY9wSYkrI0r8TOT5
	+Zti/zwOZf0MKWPZhWVWreewOv6Ok29r2KFa4KdSR+y5dbsTnDF5oEopqNhJEvaVTOnnaTEqlwyEH
	4cj8cyx/rYNPw4eCDrMWTxOK0oi1VAW5xKcIcP6Rxa+KlvQDFk8mkWXGb8Q0on5gb6oYPQx0bznpK
	zaJgrnS9ZXhE76mr+VNj22cHLpFzudhE7bjd3ycOae6EotfyHC1QKmdZGP15yHO3X/W1LsBUO+ifd
	oaS1/EHVFNK9yVIA2NBKGMqBWO7Y52vL/R2c92UR1sSYFfRol0o1nu4fTmSVMT1KVqjDJO/InVu+i
	JOwpSfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBuDX-00000007CFA-0LeQ;
	Mon, 05 May 2025 11:42:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBu8j-00000007BSN-32FD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 11:37:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso24735365e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 04:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746445060; x=1747049860; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oKte3VgudbHc3RjluDFuTdUTJFhTrJEHbiUVWp/kvpI=;
        b=ahr2QRIY2nzrlUxMdqnCQogI5lGr7BTMsYOpK9SINgAYxLWqmzHxMArjsYzVowR5UW
         81KZSh2klkibm3IVxQkrdkUCmzJ8TeEZNGlTXCXXO55Z5PSP5iDQYrbSEULn4lzo8fxL
         2b+7jEmtnrI9lCxILxl+Sg6h+KT/q0ACC8h+aslGpxWNJYnnPtUSzhy80wQNZ6hrOe10
         eX98P7FhzJjiuJnFOO+xEwtzluXDX4IKjgzDvbw6nsYL4HQNoRQLbKdlWEcrdZsdHEBR
         Kw5cDdl8A4fqhtfhYLXXfKvZyZJ8tbUpngDgYS0H0rLVn3Sw6IdklC/FuWTGLC0BnSGy
         Wq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746445060; x=1747049860;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKte3VgudbHc3RjluDFuTdUTJFhTrJEHbiUVWp/kvpI=;
        b=MXUhzHgrCPMCexPxaB8iBMfbPkob09DGlrv4Au/U6qhNglxbq36OSuIfQGUT6svFr1
         C0GM/8ismOl11FGaIkdiYCEYb2Y1KSSshy/ioD6RKjPaqoeElXRyXEfF8/XM96neKa8h
         anJwn9ZQYehMTw0SPsrdntO/1PzTWV1E03RwZW5XgkI5W474fj0ohFhEi26CTGNlLst1
         UvgwOt3QvsmeNzeIp9B83t7HeLgCPXzgiW08B3vWKNXWMe8rqrt+5/JUgOIBJhCNM4pT
         Cku+9zrQTpupkanYYHpBdjqMM7oQ6QylMycFi4DS2mKPtyTVsLDV7uCeMsyM/3CcmV2l
         ke/g==
X-Forwarded-Encrypted: i=1; AJvYcCXlAzI97GdDVzw/mlvUKV8UYerWxecF/JtOdSasKqksGzPlmhGGHwLJGD3YhsUIRVBwt22juPgQ/QG4/0NnedA+@lists.infradead.org
X-Gm-Message-State: AOJu0YyVIM4M60VXZ19oUQRX6ydMVew6aEJSIY9ZYb9Sd8SUWUfnRFxC
	rmFGdsof2oOrLX6CIU7nu7GZz8FuSMZl+r8DQiywKR0Kk6nAnoJ5x2njsY7XdpE=
X-Gm-Gg: ASbGncuob5FZvXcpylORYcLbuUQZx/hjS3GMxZ01IezY/0BmBYrlATx1tI16lULf57/
	Uvp7xnv8Xvjd3Gco0JJMwu7fPR8pJBZdNfM1P+mO1ZCmtY5tT0z6cGpABS1SAhZYUBa6EMaya4v
	+1l3pJk7Fko+URGaiPMuAiLRoVqrN2eP38xnCzRocp84Aw/LVcHp32cUfuebL/0DQxrKzaR38v0
	buYG/WLnG+t9gMoY6BExkVsOCayN11b3bdJy9YTKCuq9zrbTxutOsK1cPk2/cU6PcXVOhCedDlc
	qH0IR29iOS1d5OJYU3A+1QauPixu/HMSoVnJH9P6ITqWEg==
X-Google-Smtp-Source: AGHT+IEgQ2kmvDjquNKG+AlhhBrFBkbkp03G3W97BEk+O8YtzxGREh5AbJQUtjEqUzBOaf89aKK5Bw==
X-Received: by 2002:a05:600c:3c90:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-441c48bdfdamr60684065e9.14.1746445060102;
        Mon, 05 May 2025 04:37:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2b44474sm178310645e9.29.2025.05.05.04.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 04:37:39 -0700 (PDT)
Date: Mon, 5 May 2025 14:37:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/7] firmware: arm_scmi: add is_gpio() function
Message-ID: <de456bd70a3e092a6379f548ce35e38253ff97b1.1746443762.git.dan.carpenter@linaro.org>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746443762.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_043741_761796_B8972077 
X-CRM114-Status: GOOD (  19.06  )
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

Parse the GPIO response in scmi_pinctrl_attributes(), set the gpio
flag, and create an is_gpio() function pointer so that it can be queried.

In SCMI only functions and pins have a GPIO flag so that's why groups are
not handled here.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/firmware/arm_scmi/pinctrl.c | 38 ++++++++++++++++++++++++++---
 include/linux/scmi_protocol.h       |  2 ++
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index d18c2d248f04..f842bf7fe628 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -28,6 +28,7 @@
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
 #define RETURNED(x)		le32_get_bits((x), GENMASK(11, 0))
@@ -107,6 +108,7 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -114,6 +116,7 @@ struct scmi_function_info {
 struct scmi_pin_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool gpio;
 };
 
 struct scmi_pinctrl_info {
@@ -189,7 +192,7 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
+				   u32 selector, char *name, bool *gpio,
 				   u32 *n_elems)
 {
 	int ret;
@@ -217,6 +220,8 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 
 	ret = ph->xops->do_xfer(ph, t);
 	if (!ret) {
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
@@ -610,7 +615,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      NULL, &group->nr_pins);
 	if (ret)
 		return ret;
 
@@ -679,6 +684,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
 	struct scmi_function_info *func;
+	bool gpio;
 	int ret;
 
 	if (selector >= pi->nr_functions)
@@ -689,7 +695,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &gpio, &func->nr_groups);
 	if (ret)
 		return ret;
 
@@ -698,6 +704,7 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return -ENODATA;
 	}
 
+	func->gpio = gpio;
 	func->groups = kmalloc_array(func->nr_groups, sizeof(*func->groups),
 				     GFP_KERNEL);
 	if (!func->groups)
@@ -763,6 +770,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
 	struct scmi_pin_info *pin;
+	bool gpio;
 	int ret;
 
 	if (selector >= pi->nr_pins)
@@ -772,10 +780,12 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, &gpio,
+				      NULL);
 	if (ret)
 		return ret;
 
+	pin->gpio = gpio;
 	pin->present = true;
 	return 0;
 }
@@ -815,9 +825,29 @@ static int scmi_pinctrl_name_get(const struct scmi_protocol_handle *ph,
 	}
 }
 
+static int scmi_pinctrl_is_gpio(const struct scmi_protocol_handle *ph,
+				u32 selector,
+				enum scmi_pinctrl_selector_type type)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
+
+	if (type == PIN_TYPE)
+		return pi->pins[selector].gpio;
+	if (type == FUNCTION_TYPE)
+		return pi->functions[selector].gpio;
+
+	return -EINVAL;
+}
+
 static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.count_get = scmi_pinctrl_count_get,
 	.name_get = scmi_pinctrl_name_get,
+	.is_gpio = scmi_pinctrl_is_gpio,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.mux_set = scmi_pinctrl_mux_set,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816..b4ad32067fc4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -792,6 +792,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*name_get)(const struct scmi_protocol_handle *ph, u32 selector,
 			enum scmi_pinctrl_selector_type type,
 			const char **name);
+	int (*is_gpio)(const struct scmi_protocol_handle *ph, u32 selector,
+		       enum scmi_pinctrl_selector_type type);
 	int (*group_pins_get)(const struct scmi_protocol_handle *ph,
 			      u32 selector, const unsigned int **pins,
 			      unsigned int *nr_pins);
-- 
2.47.2


