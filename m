Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA59C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 00:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLpTjFW7p6ghiYRblP02dy0kbs1t/nRG9KfdA64BMng=; b=UO6aqyxWYtNjLcAnZ1K4BFo4ea
	8iuPxIT9KA8MPHBf9DAGKFOn0hytnlswy3zhTfvp/WpfsetVW2mz5n2fXk4kOYJNiL0vIkfKUl/IW
	MB28c2zts8ftwaQXhoRufuB/JPGlCuhHeL4gYZx3olfG2jQzyBxUStnl9BsQH00ubyY8d/brzCJOH
	XHz5Qrx93uYo1wQqHOkbeqD+ZWWbsYPwFPJkYLZo5mGEOKwQC08WAzr8jxnAS1SmUDlAIdcO9ju5K
	sBR7gUVY3Ft9Y2Tn+8CbCH74vMi7gAolCvvcMhalmiES8I7pFkDoBpmLFTFvQTtakiqfepTiOqTv0
	CetWwkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qLi-00000007b71-0IG4;
	Wed, 16 Apr 2025 00:09:54 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4qEL-00000007Zco-1AyC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 00:02:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2264aefc45dso91939925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761737; x=1745366537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLpTjFW7p6ghiYRblP02dy0kbs1t/nRG9KfdA64BMng=;
        b=TN8TKfGC2Rt0upfphsZlFFLZoYllbvn1oJPc+SuOk4cS7XLl+/hN1WNkYuhqFdmeqw
         6wJd4W1WhFTvwzSS8fZuarCUGbcRstPdLAUfiBlsxEzV/YJvNrFevIWkTIc54I37hiLI
         ZuNA+1/bxBRMEHJxQhcBG5Ogfg01sdv5OOitg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761737; x=1745366537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLpTjFW7p6ghiYRblP02dy0kbs1t/nRG9KfdA64BMng=;
        b=qW6P3wfI92C1mGMAknbnSP3lSpGNuhQoFZWCP+EDw2ViHxU3UZyYLXVb6d1EWY9mOT
         DZqgzBclTaS31yYa18K91qT1txLjIRxsaZ+1jSuZHzLiZ6/EwYKS6b1twFHcIxywgpI7
         LHNTwwzxpLa+hUYgN73HyEcRWC98jiAJ8BE1fnw0gh4gekx80Cxbtc7o5LNVqeudG414
         KREbe7w71ZhwZkyxYJ2JPwuntHzrwZKQFOColFg6AOonG8t6iXtTIiJbT9ASqUINVuTu
         /OQ9JlwkvP2gWio0OxoXhnYBNp+ceEtERtg8kBnP6ZVFKafh9YogpbasIMQ+j1JoPUiT
         DWDg==
X-Forwarded-Encrypted: i=1; AJvYcCUsTTdc6HDZdbF9ijtNsqhwEtqoKb5fCUddM7z7ceUpWSlamuMfYCkBDNIiVRbGVtF43L/PlCvndBea7oCA7dbj@lists.infradead.org
X-Gm-Message-State: AOJu0Yydcnc4mQ+S+q3+2ohMQV7I5flpexN9Z64/yelEx1THMp62b0BV
	qWQb9zsxOC2901DHpBINbKnY2dCkDXo7Kkedetl+OjzDvAbdLVIkwTizZnra8A==
X-Gm-Gg: ASbGncvy9LROhrmIkFGSQnfSVaZxm51ZMuEgrPbASuwVvoSYTO9heOJg8vHxmWQqZpS
	LLDEG1XluPW3wkTv9/kuabEm9pSNBAUZvc1AH24SEXPVoXK9jAUrcniKHz9vnXRiKoTfLgEJwjw
	86pZ9fEJMvdzv9MnM57MBBA9fdvViblqqV+zaGbPge3lOSPwEoJQyfE86h/sJ6i2kYkODRF+KZR
	a1h35OtZ7+lZO+x2EFqG5PTfQdDO02HvPePkPY4dZnlVjrWk64CYJsP8s46EJzGHnRMdsxSqoG6
	KNgrG4zpw++p78bp6ttwxnbEQFRDgidVwlejtEdx7cE686TJvZQyEZsEeyCO2nKvfVFkJtf5poi
	CSg==
X-Google-Smtp-Source: AGHT+IFgDSfSzHJQGblYKtBgX+uGjROsnXUma1oaTnVLcJEUU+QM71Xipmk/uC+evcJTJfTYjoWWzQ==
X-Received: by 2002:a17:902:d585:b0:223:536d:f67b with SMTP id d9443c01a7336-22c31a86b22mr19203715ad.38.1744761736701;
        Tue, 15 Apr 2025 17:02:16 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-308613b3849sm196331a91.38.2025.04.15.17.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:16 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 3/7] platform/chrome: cros_ec_typec: Support EC mode entry
Date: Tue, 15 Apr 2025 17:02:03 -0700
Message-ID: <20250416000208.3568635-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_170217_335244_93321242 
X-CRM114-Status: GOOD (  16.96  )
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

Support ChromeOS EC firmwares that don't support AP mode entry. Check
that the mode has been entered by querying the EC and reject mode entry
attempts if the EC hasn't already entered the mode requested. This
allows us to bind the DP altmode driver on devices that don't support AP
mode entry, i.e. most ChromeOS devices where the EC controls mode entry.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_altmode.c | 112 +++++++++++++------
 1 file changed, 75 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index c2d9c548b5e8..97ca4cfabbc0 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -58,31 +58,50 @@ static void cros_typec_altmode_work(struct work_struct *work)
 static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
-	struct ec_params_typec_control req = {
-		.port = adata->port->port_num,
-		.command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
-	};
+	struct cros_ec_device *ec = adata->port->typec_data->ec;
+	unsigned int port = adata->port->port_num;
 	int svdm_version;
 	int ret;
 
 	if (!adata->ap_mode_entry) {
-		dev_warn(&alt->dev,
-			 "EC does not support AP driven mode entry\n");
-		return -EOPNOTSUPP;
+		struct ec_response_usb_pd_mux_info resp;
+		struct ec_params_usb_pd_mux_info req = {
+			.port = port,
+		};
+		uint8_t flags;
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			flags = USB_PD_MUX_DP_ENABLED;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			flags = USB_PD_MUX_TBT_COMPAT_ENABLED;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_USB_PD_MUX_INFO,
+				  &req, sizeof(req), &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
+
+		if (!(resp.flags & flags))
+			return -EINVAL;
+	} else {
+		struct ec_params_typec_control req = {
+			.port = port,
+			.command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
+		};
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			req.mode_to_enter = CROS_EC_ALTMODE_DP;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			req.mode_to_enter = CROS_EC_ALTMODE_TBT;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_TYPEC_CONTROL, &req, sizeof(req), NULL, 0);
+		if (ret < 0)
+			return ret;
 	}
 
-	if (adata->sid == USB_TYPEC_DP_SID)
-		req.mode_to_enter = CROS_EC_ALTMODE_DP;
-	else if (adata->sid == USB_TYPEC_TBT_SID)
-		req.mode_to_enter = CROS_EC_ALTMODE_TBT;
-	else
-		return -EOPNOTSUPP;
-
-	ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
-			  &req, sizeof(req), NULL, 0);
-	if (ret < 0)
-		return ret;
-
 	svdm_version = typec_altmode_get_svdm_version(alt);
 	if (svdm_version < 0)
 		return svdm_version;
@@ -97,31 +116,52 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
-	return ret;
+
+	return 0;
 }
 
 static int cros_typec_altmode_exit(struct typec_altmode *alt)
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
-	struct ec_params_typec_control req = {
-		.port = adata->port->port_num,
-		.command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
-	};
+	struct cros_ec_device *ec = adata->port->typec_data->ec;
+	unsigned int port = adata->port->port_num;
 	int svdm_version;
 	int ret;
 
 	if (!adata->ap_mode_entry) {
-		dev_warn(&alt->dev,
-			 "EC does not support AP driven mode exit\n");
-		return -EOPNOTSUPP;
+		struct ec_response_usb_pd_mux_info resp;
+		struct ec_params_usb_pd_mux_info req = {
+			.port = port,
+		};
+		uint8_t flags;
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			flags = USB_PD_MUX_DP_ENABLED;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			flags = USB_PD_MUX_TBT_COMPAT_ENABLED;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_USB_PD_MUX_INFO,
+				  &req, sizeof(req), &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
+
+		if (resp.flags & flags)
+			return -EINVAL;
+	} else {
+		struct ec_params_typec_control req = {
+			.port = port,
+			.command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
+		};
+
+		ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
+				  &req, sizeof(req), NULL, 0);
+
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
-			  &req, sizeof(req), NULL, 0);
-
-	if (ret < 0)
-		return ret;
-
 	svdm_version = typec_altmode_get_svdm_version(alt);
 	if (svdm_version < 0)
 		return svdm_version;
@@ -136,7 +176,8 @@ static int cros_typec_altmode_exit(struct typec_altmode *alt)
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
-	return ret;
+
+	return 0;
 }
 
 static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
@@ -254,9 +295,6 @@ static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
 
-	if (!adata->ap_mode_entry)
-		return -EOPNOTSUPP;
-
 	if (adata->sid == USB_TYPEC_DP_SID)
 		return cros_typec_displayport_vdm(alt, header, data, count);
 
-- 
https://chromeos.dev


