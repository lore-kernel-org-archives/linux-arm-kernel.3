Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E5CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28LMzmOlKg+KTnmCehGJ4yq2NWfrmOTiYLvi3XZto1U=; b=nHBa8kFxxEIvST1kbw79FNVKxD
	fEltaEtc/MSd1ASwdwVkElPP7A7jPu97cgcuV0n53qPka10yTsFaPGtDZcG7SjnXsPk7nT7KrRwL7
	sbbmBdvfXrWU3D6GmlBm7jNSSBEJUute41UniZhJPsirNs1c5DlzocEctYMplivRdqo2DzPctYHG8
	CBpWtEvOV7sNCivhb96Q8j6CBceIkxEOocCP4jcgbutCx50fAZLAIDEc75l1VYA4qBkwJq/IY+f84
	L2gKStWkkHDNCzl+AvEeP9y0fJ2LazSLxtQzhKprZ+ZEaJOkHQRNbxalqw1VvMJ7F+CqZQo6Re6+7
	uoY7S0Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOxE-0000000ECw6-1B6i;
	Mon, 27 Oct 2025 15:16:16 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDOxA-0000000ECvY-1N0x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:16:16 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-475dd559b0bso30622185e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761578170; x=1762182970; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28LMzmOlKg+KTnmCehGJ4yq2NWfrmOTiYLvi3XZto1U=;
        b=isqWRsMVJJ5HSTADkEspr4LwcL3TU9nIdF2gR0QqbqEFXP+S2oKOS0KuaT2eEOAozy
         n4tLU1WMHganjoW6678vp2V0QltDzCrwBAZllRKB+HcxrQhSyCIe/5ZI00b4v4sRePCN
         /BgWNSLkBB+ff3fzRcBx5kAi0mnexFHQoiCvUhj+xtKhTJ3MEx9hPCa+rgZc29e5kK0s
         /LPd/clct3qMmtfla/aLvJwXeFaCzS7tr3mcy1KE6sepMolfx9DnZ5kY7GvvaqpGfxuU
         8EeBpcgWAN/YQC8rsB4DpjA9AGyClpBsbSoqADJsRe9kwJaAfLV9xEn5hO76UcqWQ53N
         yeVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761578170; x=1762182970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28LMzmOlKg+KTnmCehGJ4yq2NWfrmOTiYLvi3XZto1U=;
        b=w34Y/u/koFjl4i/DQtCcZF+H61yyG1jOI0Tg9zHmIvmMkohcyLeLKyS28dlGON64vu
         +BibzQjm0KepdQzxxDhSCyA2IgIZ9+9dk9yVQrBV6/KyLalfCIsbmO8wJPI95W2e3sf+
         tQQhndT9YKUsoLxuQVM9UuGUP0dY5NMFS3INnbIaAuOPKOV3d+z5Gj3W/uh10nVMHwBJ
         XjatWCCcdJetyNIFZcBrzsh3ITZorYKsSCkkAVrGQrSAwBo7VBMRUthHMj+GcYcN9v5R
         +IFjVzU/avcOtgMLUpVdU58/IfFxoH5MJMvnXVQA/02ICr52z5EKS9bTKLLVSOyNDhhJ
         Cn7g==
X-Forwarded-Encrypted: i=1; AJvYcCVMng5t4Bx8PT6Dx2yIOkCCqNEtMqupQEqfX+iTQoxiCLdNO6Np4HE4peXRmNQ76MV8UruJ9uYGQXxuKg33kqjR@lists.infradead.org
X-Gm-Message-State: AOJu0YwY8lfL+M6ggbGlVIwboh9J0v5rw1hSO1hrmZQVFWvl0ksc0omb
	3l26QbtigJLImdbIuoKh+tG7PH6SZHPkOYTUGkx50/zHhllYhOYFNbHdmvFhukpUuXY=
X-Gm-Gg: ASbGncus8zLs8cqR5TzXMkbavYZok90djOXqbaqfUAbnEAnw4hcZxcHmtUE1Astq01L
	b56l5Dn9cmYYSOc6Z7tm/yVmMzh4/EW6WJ3UotsF5AwGxqF7Z0naV6q7txulhWV9ydWkrk/nCab
	emVEKE30byTk8o4nGcCR38+C9Km0bCUE4oS4VYB+e+Xfmo4XgJV3qop5mv80jsrRmuYgpboY0By
	qtX/nQkqqLJwQJk0hIzoi5cSwnnbgVPWjR7xAEoMljD+kRKw+OCK69j/ISXcrJZuOklO5KKHteo
	pX7nxbypLRbQrizXwnbuMt/VLY3pKwCXDtpp6aaTzZtY6l5fIoy3ZieC7zGPssrSnvGZ4lI3Um1
	WW0w34YrunZxrjlJlB6GRx4Z3VXXZrQK8k9ZGFXoXV2btCR3l4Hywrqddh/fk0BGUaC3TBSm1Wx
	gdceCyXqI7c8PkKVJ+
X-Google-Smtp-Source: AGHT+IF2Q+U4P39LMqUNYJRoBXTbX3H+nbIPvbSIsonN/qYyyF3APhKrFIUh2pTy2NcU3nGppP4j3Q==
X-Received: by 2002:a05:600c:3103:b0:471:1717:411 with SMTP id 5b1f17b1804b1-475d2ec5e4cmr85126425e9.24.1761578170439;
        Mon, 27 Oct 2025 08:16:10 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-475dd4924e2sm142618495e9.8.2025.10.27.08.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 08:16:09 -0700 (PDT)
Date: Mon, 27 Oct 2025 18:16:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: move boiler plate code into the get info
 functions
Message-ID: <287b5302f583e3535d50617ec3b0856e38253171.1761576798.git.dan.carpenter@linaro.org>
References: <cover.1761576798.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1761576798.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_081612_430352_00A7BB58 
X-CRM114-Status: GOOD (  18.02  )
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

This code to check whether the selector is valid and if the item has
already been recorded in the array can be moved to the
scmi_pinctrl_get_function_info() type functions.  That way it's in
one place instead of duplicated in each of the callers.

Remove the check for if "pi->nr_groups == 0" because if that were the
case then "selector >= pi->nr_groups" would already be true.  It already
was not checked for the pin case so this makes things a bit more uniform.

Also remove the check for if (!pin) since pin is an offset into the
middle of an array and can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
---
I had sent this as an RFC earlier.  It can just go in by itself.

https://lore.kernel.org/all/aDmpD9qz-4RUXvFq@pluto/

 drivers/firmware/arm_scmi/pinctrl.c | 108 +++++++++++++---------------
 1 file changed, 48 insertions(+), 60 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 3855c98caf06..d18c2d248f04 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -596,11 +596,19 @@ static int scmi_pinctrl_pin_free(const struct scmi_protocol_handle *ph, u32 pin)
 }
 
 static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
-				       u32 selector,
-				       struct scmi_group_info *group)
+				       u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_group_info *group;
 	int ret;
 
+	if (selector >= pi->nr_groups)
+		return -EINVAL;
+
+	group = &pi->groups[selector];
+	if (group->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
 				      &group->nr_pins);
 	if (ret)
@@ -632,21 +640,14 @@ static int scmi_pinctrl_get_group_name(const struct scmi_protocol_handle *ph,
 				       u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->groups[selector].name;
 
@@ -658,21 +659,14 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 				       u32 *nr_pins)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!pins || !nr_pins)
 		return -EINVAL;
 
-	if (selector >= pi->nr_groups || pi->nr_groups == 0)
-		return -EINVAL;
-
-	if (!pi->groups[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_group_info(ph, selector,
-						  &pi->groups[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_group_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*pins = pi->groups[selector].group_pins;
 	*nr_pins = pi->groups[selector].nr_pins;
@@ -681,11 +675,19 @@ static int scmi_pinctrl_group_pins_get(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
-					  u32 selector,
-					  struct scmi_function_info *func)
+					  u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_function_info *func;
 	int ret;
 
+	if (selector >= pi->nr_functions)
+		return -EINVAL;
+
+	func = &pi->functions[selector];
+	if (func->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
 				      &func->nr_groups);
 	if (ret)
@@ -716,21 +718,14 @@ static int scmi_pinctrl_get_function_name(const struct scmi_protocol_handle *ph,
 					  u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->functions[selector].name;
 	return 0;
@@ -742,21 +737,14 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 				 const u32 **groups)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!groups || !nr_groups)
 		return -EINVAL;
 
-	if (selector >= pi->nr_functions || pi->nr_functions == 0)
-		return -EINVAL;
-
-	if (!pi->functions[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_function_info(ph, selector,
-						     &pi->functions[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*groups = pi->functions[selector].groups;
 	*nr_groups = pi->functions[selector].nr_groups;
@@ -771,13 +759,19 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 }
 
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
-				     u32 selector, struct scmi_pin_info *pin)
+				     u32 selector)
 {
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	struct scmi_pin_info *pin;
 	int ret;
 
-	if (!pin)
+	if (selector >= pi->nr_pins)
 		return -EINVAL;
 
+	pin = &pi->pins[selector];
+	if (pin->present)
+		return 0;
+
 	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
 	if (ret)
 		return ret;
@@ -790,20 +784,14 @@ static int scmi_pinctrl_get_pin_name(const struct scmi_protocol_handle *ph,
 				     u32 selector, const char **name)
 {
 	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
 
 	if (!name)
 		return -EINVAL;
 
-	if (selector >= pi->nr_pins)
-		return -EINVAL;
-
-	if (!pi->pins[selector].present) {
-		int ret;
-
-		ret = scmi_pinctrl_get_pin_info(ph, selector, &pi->pins[selector]);
-		if (ret)
-			return ret;
-	}
+	ret = scmi_pinctrl_get_pin_info(ph, selector);
+	if (ret)
+		return ret;
 
 	*name = pi->pins[selector].name;
 
-- 
2.51.0


