Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686CCCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B84jNTg7Yo8n7BGFGvQ15A/U09IRq0iw+ObZ/DfjbTI=; b=T6sPmcqEOfDwxa4gdHSaGSle6Y
	JM8at0jjaEfvcouPPJgEfW7VtHhtcNoef//wD23kaSPCbDq9pERA51BAn8EG/hEG6omqhYZn9TkeP
	b5UgoFAF3Kz9slelVYVNYpllKbWuc2xhRhJFjargeihJWqps5CtlOEvAuXuiAPY+2JjANuJyjqloQ
	BtQpbZmnuweNufcO1Bou5TMm486dwf6Q9m+25Bra4tIZBLg64Dn6Ak60GwQo0OLfWp2BZ1sJ2Vjd/
	GNXwwxauxMvTAiSPWST/4EoH6HRlMAZgHYxAvaErygeD56rxObmNsdj+QibeJeDCALlNUbhpTpR0+
	jHNDaN0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVx-00000006Tt7-1Fk2;
	Thu, 09 Oct 2025 15:25:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6sVv-00000006Tr1-0qFl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 15:25:08 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b456d2dc440so176906766b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Oct 2025 08:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760023505; x=1760628305; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B84jNTg7Yo8n7BGFGvQ15A/U09IRq0iw+ObZ/DfjbTI=;
        b=sYQbS+Z978DYYPR5zar4IzulnDeHs5NK7JJ1+Uniqp4v/FFyNUKR6vK9JqeU5ABe0c
         fPwlo0ZtUGhIuz2SC+zzucs75baHEPknTfyQhqxhcZNjKFftizTRY+7m8Kn87kYMF2Fh
         u0SD114M6FCn+tStX94Ef0Qcdy40hlrIZP2J1YP/on5I9+WGbzmF2wuuo4JV1yf0e+x6
         yWAsmCGkpAuk/G6LHTDayE5HCNInRhDHsYfuOHmYMPgy3FvWk4bP2RVdq0FszekSYkLV
         sq/99AAVlLN9n8jPfatU58IZgxtyYvxvO03esDA4VLshPRkBawEtyJOqBaU6FAN2N+VF
         yaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760023505; x=1760628305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B84jNTg7Yo8n7BGFGvQ15A/U09IRq0iw+ObZ/DfjbTI=;
        b=q71905CANbm4ifcVy4RG8+GeqS10Gui9qXMbUvsu6ic7GdSFjS1XA2J5+nE5SzWnmq
         v6JjjjudmA1fId3LD/yL6NBLF30Nm5atQVKNIir5ZgGoWuYVpSQpuER8QXXqq1lhqNUW
         4/1KJnV27GRX2BNkqJtRfmRY6AWCCn0jXwO1WhGLEAOZpHMJ0i+Fp6U99HZT5Jkn6khZ
         uSVOghbtb+SEnt400HKvIutGUzNLJcqiifkCpWz/OHZmmEJE94wIs8YbKnNpuTqQGXFB
         i//7NKTAZrhD6jtUni3lAG0m57OsnXrEZTr3vr3uRdYSaC0rSmLArNy1mJmzATuQ427F
         hZbA==
X-Forwarded-Encrypted: i=1; AJvYcCWY1fSwk9jqiZO5cfxVsAZZgpUqE1Tbw+Qy+xdp8MLOPcD40xT4QbHDRr+Hoj6oeeG/6yjQmFZ6r/wCsiBdD7Od@lists.infradead.org
X-Gm-Message-State: AOJu0YwVoG7TTil8ESwn4M0wlPADs5A75MSMW1rGhLGLS0UHNsi8ogtr
	tX1VIMQiURyfm68hL8hiLNj6E+2JNetIxomZilTvq8kLORdIr6Iv6DwWe89IZSoJiUQ=
X-Gm-Gg: ASbGnctiArqwtx9mzN7JNjZuBmPmK/uQvSNLY4T3Ep0Q1zDqC/H7rplf4XB+ubMFutK
	PJbbNRlF8O8FyaNxvY5MZmoBQ6WZrHqMJcdn9YtbKpSqB/hdas9IY5cb5OTt9h5dOH3xWiBU7C/
	6x+O+UdcRJ2XGy4kc1jWoCSzfadk8hGxD1XpG9W/6i5UNomVAHE6FvZV1vjKtyc3gDIYh7dbiVk
	FzSSsKg+5rw6MdKxpwl0DxFPm3iS6RVfwzcn5tFArngIW0AYufDmea72c4+lrlc5dXl6TCl3Bgo
	qt5yHtjY88LzLDzA6xk1A2qnFyb0u5WjAWLb/pXcEJeBHNVPMDQNxrngc8pv9UsS180yYl/fH7F
	o9ix+lTWuaxO+r0x4kdd2NABK5m/AIt2RAfa2YqqEHFUSCfjWLQgoEa1Nq0tQauJHxXcYp6sSrK
	kugQoSgxeZvFFWmA3S21Ejt6L3HvuJmcwUNkTfJnf7
X-Google-Smtp-Source: AGHT+IG4E2/BkqY+k6KCaob1FvNFhboNdxx7lEaSwbr4nblUCdc4u24xC8dmKvD/tTwPIY9VM74oUA==
X-Received: by 2002:a17:907:6d19:b0:b45:60ad:daff with SMTP id a640c23a62f3a-b50aa99e0f1mr827465866b.28.1760023505329;
        Thu, 09 Oct 2025 08:25:05 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b36fsm1908967566b.62.2025.10.09.08.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 08:25:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 09 Oct 2025 16:25:03 +0100
Subject: [PATCH v2 01/10] dt-bindings: power: samsung: add google,gs101-pd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251009-gs101-pd-v2-1-3f4a6db2af39@linaro.org>
References: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
In-Reply-To: <20251009-gs101-pd-v2-0-3f4a6db2af39@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_082507_255981_8C1A978E 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

Add support for the Google gs101 version of the Exynos power domains. A
new compatible is needed because register fields have changed.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 Documentation/devicetree/bindings/power/pd-samsung.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index 9c2c51133457112ca0098c043e123f0a02fa1291..c35c9cb0115d79e5c36142da2c2a5dd30cd2ad47 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -19,6 +19,7 @@ allOf:
 properties:
   compatible:
     enum:
+      - google,gs101-pd
       - samsung,exynos4210-pd
       - samsung,exynos5433-pd
 

-- 
2.51.0.710.ga91ca5db03-goog


