Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22688C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=; b=Od9cLbxVWpJpvw5Q0m2bqlBhhn
	4G+JcIyOudRyJfhuL+Abf2xEIyrt8OzAmux3nj/84/5zNHhPJ/TnAMDxJ5hISfR8Qpcxn60igKcOd
	dXYdzO1oCdXztjdywHReTZNVxFDHW7ivnvMiQf2JryzkUA+bc3/dnhHc9rERRgdN+J3O29i/W9/Gb
	iag6QZptGWuC7JTW4u5wF/q36DPIZvJZxKLy+QWGbHmeyy2NcGqtwnfaid1rabW2YrNGh7NgQPkZH
	xQDo6B7zD4v3IWU1O7+NsnOc8AGoTfeUpSPpmw/189yHbyw2NGiJOd5CSrGsykxW3pKkQQ9gk41Ia
	x9E53/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZwd-0000000FflB-3sjA;
	Sun, 20 Jul 2025 19:43:35 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZru-0000000FfHv-3ZKu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:38:44 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6159e23a6dbso687287eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040322; x=1753645122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=tWRCo+avTbUJYO7gekklLmTbOQ6c9WhmD2eFRcNl3aLkj733lmW8hyrWcMzqs40p7+
         9A3YF5xTSZXU2g6aE90SK+/vZCYaGD7/5CMVALfq/+BpxtPJ3/CT75R4RtvhAIesGcJ8
         SXNRTqxkPGOc82nYiW6n3fHM7GSPjG2bZ7tclJVMWPPapsk+0W2pWAgG1bhK18tqfxPM
         5FyUXoTTspdFsePatu0YQim5rvDob/tWcJm98Lti57y4ihzcVsl8hc8hQkTigbK7gbwo
         N2HZg661YWi5ggNLDYIQmSyqG4qtw2/tG6r9m0p0o5x1e7Q1BdgMta+A9kTkS0PKRS61
         HVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040322; x=1753645122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X8e0Rkt8jdkgvftQKNoZRYfHGuTcfUv00gpyykQyZ5M=;
        b=NKqXXfJioE46OlwSc39zV/MlGLMD5KZUUaO7k/EoJ9WaRc9sspusL8tKZ/sA4Th9hC
         3iAjWWoqGqgzPafyXvmh6rFE7YAsEXHtuUqgB/IwkSAazejknFK1XSxlvLVEQ20r18tl
         OdcwMQjFHJADG7HdekFX5XH/xoCgQMsoPW8g1QH93Z2O3TfqE8fm0PXjsT8OurjFNqc1
         30IDB4PTkH6LaLy0mLStSP93eR6j11YebR4kDyotpVRDhiyIUHi5T51/GFjy/LuOTWdj
         I5Y9CY8D1mYmpzrWR3k2cUz9wqvZfZfipEfWienmAW7slslpf6XlH5ILZsnCUbt0fTvl
         DPGw==
X-Forwarded-Encrypted: i=1; AJvYcCWQOra1rV4AUh/SNt9ic868oHL5wjfwqWWMcOH4ugf6yCgmQZs83exXAxgi92+87E6IYt0PmG0ioU9//h9CvNJL@lists.infradead.org
X-Gm-Message-State: AOJu0YwvgJBb/EuhncEROTQ6emMjNnOxocQ64+YteH/0tLxad6WMH8KC
	JtOKaYS40qC3H27dY59DNvKvnSwrwxlvxOHGLXzdl0k9DQ/6rMXAJJ26Rnoot+ekDrA=
X-Gm-Gg: ASbGncsVuvmI8vudRStV6e53LIMoHOOMreEhyDcxIsAHYB0IMHqpalRysUabeVqg1Kz
	/DPIBfS17WusZSAUyQm6TyCIOKdZX0A38HDTeB5yMzJPIMZjT0sWuIqmzV9mQOaFhTer49Cg1Yk
	0QgXtq4mFs4GGhHTbrf1y2Wu6SLw6vL1NcDp8+xfPOLcpQBmAOBQYrQHRmWYX3e/opbtDv9uSma
	97jfH57lfp0/sZcaLzqD+hxmmGS3E4BCW5G/V8y9sYlGSYdOROPOof2N3l7ZBdnX/feUWvJnh30
	HgEH1t37eLXGsFR2MRo56PWCw10oo2EkK90JfsmvEYRWbN4VLdPBzMmpRBQT7HLs05yUnIY9RR0
	5LPMhe7IaB4A=
X-Google-Smtp-Source: AGHT+IGeTlhYB9KS9TF9xSDd7VU5hXZEme07PjGtrxZBrvFLIeMvThRyC/+06//IuEU+tzOyCgkyAA==
X-Received: by 2002:a05:6808:3c4b:b0:41c:d19f:27a7 with SMTP id 5614622812f47-41d031f1b44mr15123791b6e.8.1753040321954;
        Sun, 20 Jul 2025 12:38:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd10c2058sm1777647b6e.2.2025.07.20.12.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:38:40 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:38:35 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 1/7] firmware: arm_scmi: move boiler plate code into
 the get info functions
Message-ID: <7a47cf3d-05e1-4702-87ef-cb7f36f03149@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123842_892703_02A071CC 
X-CRM114-Status: GOOD (  17.69  )
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

I removed the check for if "pi->nr_groups == 0" because if that were the
case then "selector >= pi->nr_groups" would already be true.  It already
was not checked for pins so this makes things a bit more uniform.

I also removed the check for if (!pin) since pin is an offset into the
middle of an array and can't be NULL.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
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
2.47.2


