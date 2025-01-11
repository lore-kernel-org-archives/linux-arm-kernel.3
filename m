Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8353E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 18:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wj0vaQkEs5xJl4pAen9qgeha8m1m7A5Rzf7Lm9ycX6o=; b=e1uUxuNHqa+NzCZA+9fuovlmUp
	iIgd1zI6w6y8aJrwmKHIlDWl08A+afxuZAQuOpWHIrs5SJ+CtPEzRhY5uN4F0E+nRd4RcoR6c7z1g
	oNb0nChTAR1fMr52H0Pfn4zlga/jtDnUMNwpd8ae6D/j/x7kYa6tImUJ2mjfzs8ye0cVtMErN3OZO
	53t5vlyfYTcyEOSO01A2CvtAQMm+3k8jOq1h4s3xGqk7d1kbiS0SjRNsgzQvnHxgknXCbhrRzAdQj
	86XGzqwPKQi7JBGFT+vKWUMYCEMMYOGSlTmqFsRw84i16rg+h29FJjzq3XpKCibDBpn2vHoNO2bN+
	CCQdOrFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgY2-00000001Gms-1fWB;
	Sat, 11 Jan 2025 18:49:26 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWgS4-00000001FdJ-1muC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 18:43:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-436246b1f9bso4361405e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 11 Jan 2025 10:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736620995; x=1737225795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wj0vaQkEs5xJl4pAen9qgeha8m1m7A5Rzf7Lm9ycX6o=;
        b=vtIn6nZlGYXGd1JNqVxM24gmrzPGZ2pRul4YG+Qlspx1Y2Cj7QHltpoA/8prOQOSWP
         fmGusdFUd6arJa4bZ/NiGq0owxPkUlSHvtmkAhEDtD4YgN4u3M//NAjn0sh9+dF36WF1
         tEjaFKR7SAlXuof1VmV88owZr8Vyq7VkBAMyuHhH0G5AhVVwzKMpc4us5MDgzhrsrulS
         5dPqRaq3aI0JTkbWsiSSj25veDC8fXL25dWHmqK8ODIUafjr/SSKqlf567lciRKYBe+2
         Qh1hguLfsnZ/6cXI88LAP/Djy4ONasIIgV8PV8YKGx/PCqHSTjayirLkc/4letPJN1EX
         FisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736620995; x=1737225795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wj0vaQkEs5xJl4pAen9qgeha8m1m7A5Rzf7Lm9ycX6o=;
        b=QqbUIO4D8ZJHf6rnYV3IIpvX1s1orPBDikOI2f7mhr2348HyaS0AceOw4ABP9F+qbF
         cz7pzwNlDLjepzGuGffz/McCYFFRjegf8VoRY19Fn+BxvswU+4stcGIU5u5dCnCB3qkN
         MZ3FdwxAU+XU4O/f6/OyEyDnItqqYUx0qa0bXVDMSd7Qbfnhr5BfItwlBiYub29+ZmUN
         L18A4nJ1qIKjikKqkuKdsNe9dyMc8b0pbsJL8ZTUMlJOtPoEsUQNzycjiH5vJ79Z6oBY
         1BisHsZbZvO6sSToPyOSJSainwjAcHKyLj1jXb8gASEiZg3kqzllJ5RqRLUOJgKDkpVO
         65Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVL5UooO3UZsfwUtLUF9YPFQ4AVA235Pzsw9FKCIPTBxpyGY24wB69dzN0pVkn2rfaiGnI0CDlmEoIXUmKzENVD@lists.infradead.org
X-Gm-Message-State: AOJu0YwiBzZE+SNzEmuID+VSmMnEtRc43m64DnYlaL5hLixHUInwqr9I
	zImyv2UAvHA5HU4Zi47vleHLFbuLb4vjvVDOIaGT7/jTqlvHVhmyJaYJDZhA2h4=
X-Gm-Gg: ASbGncuym/DhA5xlsAoFhu+EI1XQvr9K5CIiVaWV/8jZMUmUL4md6gUjIhvDybAadVB
	79zMpIUPyk7psaLl/PU87wWHzkwjqIOKpA72jUHBVvOWm560nOprfs7zvUBoJR1WMRDcnvcsLIM
	h17AYeszdhGnD9UurJWsYo7ESqFv9jdCU29EoXu3WwPNIAx8Ybq+duBI5yrKhv7F+CqNE//8n/J
	Vi4JZo5K2/4NRz0pSTeGOsGQFGc3wfS4CB4yL+iLQUuUj0jrLb621U9XKAl7US91wvWUZgm
X-Google-Smtp-Source: AGHT+IFkdUd7VDoNBV8ocBwBMK7rs6FdwNt8/W12AAqlsigJ8QUMOV8NnmmD5VdugurJ8kLk5KPd8w==
X-Received: by 2002:a05:600c:3ca0:b0:436:17f4:9b3b with SMTP id 5b1f17b1804b1-436e270729bmr58969015e9.6.1736620994797;
        Sat, 11 Jan 2025 10:43:14 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436f9bc6b9bsm205885e9.22.2025.01.11.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 10:43:14 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 11 Jan 2025 19:42:52 +0100
Subject: [PATCH 4/5] remoteproc: keystone: Use
 syscon_regmap_lookup_by_phandle_args
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250111-b4-syscon-phandle-args-remoteproc-v1-4-73ed6fafa1e3@linaro.org>
References: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
In-Reply-To: <20250111-b4-syscon-phandle-args-remoteproc-v1-0-73ed6fafa1e3@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=U1lpQENfUy62bKJcih/Uez8/c/JkobPMvDaQfWStUtU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBngru0T07FNjrF45YdoyIyJ1321KdY1szRRaMcz
 awXkyq3kByJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ4K7tAAKCRDBN2bmhouD
 1/y/D/9Wp1pomIMLnGfNlycKgEqkDLs1RC8JXV8VmnlFsO/F/uAK8zuzhbnzwYpcUyYhtvvtvxx
 DPqHgkEvgWB6c9+6paOQ62wZ5tR2FFXbZNdwSLAd+J24sEpjCU3ndi/CJI2zz1soIn4qTCGNc8/
 Mp0+omFvxrzBQlFcuBhYTSjDPbuKaMszNOWme3yxA3ML9DTNQYs+mQVIxFRE1ro1Mn4dy38xnm/
 yF7RPpE4VKP1SA/5T8iGXzM5PLFxXYmCbl92fg7geryPjIDMAeYuWe9HAasEA3DPuzMp+3Dtp5g
 InuAOkuCoYpwHdqhQ5fZfaWDazKGgpcOsLBJJQuvjadJDhf4qYbEbCXDVbjJzgvsfXGf09QwTAu
 VvA+QJ0CL78fuxrvpchTNwnmVidiaY8q7vkhjTL0qNIVg3VZ8ybNqoKR5s7qIQF9du+jqWx0Po0
 3CKfa9DF+PJcIoi0nP6sm8Y+aC04iLDecYPLQKWQUDhXLYnAv/uQNv7XxBhWi2VGcSV0ticidg8
 BfwMX0BLA+sgJ+SvlHOJ2t1zQNKSWUDWk5/8QKYH/1GPgOODY3grkMJK17SrMDVv077HwMl9uvp
 tKbvfdKBlfbTROPOXl9vq6zyqAKfuv/4rGL1JMDcWjD4d0tKJNH3ja92Mq3dvKGYn2MQQdUBqnC
 NxtVbmuq8+MwGjA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_104316_471406_DB7E22CC 
X-CRM114-Status: GOOD (  11.55  )
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

Use syscon_regmap_lookup_by_phandle_args() which is a wrapper over
syscon_regmap_lookup_by_phandle() and getting the argument.  Except
simpler code this annotates within one line that given phandle has
arguments, so grepping for code would be easier.

There is also no real benefit in printing errors on missing syscon
argument, because this is done just too late: runtime check on
static/build-time data.  Dtschema and Devicetree bindings offer the
static/build-time check for this already.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/keystone_remoteproc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
index 83c8e568f7ce3ec3ca3a534d2566f6437e9d403a..7b41b4547fa803fe19d5e5e6b1a8c8c4e5760632 100644
--- a/drivers/remoteproc/keystone_remoteproc.c
+++ b/drivers/remoteproc/keystone_remoteproc.c
@@ -341,17 +341,11 @@ static int keystone_rproc_of_get_dev_syscon(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
-	ksproc->dev_ctrl =
-		syscon_regmap_lookup_by_phandle(np, "ti,syscon-dev");
+	ksproc->dev_ctrl = syscon_regmap_lookup_by_phandle_args(np, "ti,syscon-dev",
+								1, &ksproc->boot_offset);
 	if (IS_ERR(ksproc->dev_ctrl))
 		return PTR_ERR(ksproc->dev_ctrl);
 
-	if (of_property_read_u32_index(np, "ti,syscon-dev", 1,
-				       &ksproc->boot_offset)) {
-		dev_err(dev, "couldn't read the boot register offset\n");
-		return -EINVAL;
-	}
-
 	return 0;
 }
 

-- 
2.43.0


