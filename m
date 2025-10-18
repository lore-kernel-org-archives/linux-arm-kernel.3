Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22FCCD1A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 17:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fTMTmXdQcRic/7O3wI4ilcIkNahM7H+SFceh2d7cSug=; b=RL6OLJkQz4IRYp95+YJ7TInt8h
	JrXj1kCR8UPTs9Xw6yjetXdWiZ+sabq8w6SVjdlzdKRv3ygnxWHiMOUrTpmFkG68H7xcJo67rcXd8
	D4HnLjqcHk/20J6kVWi1XIXWJNiXtVyR69iHPd3/dQRklu1EM/x7ptqMooC+EVGF1ZBr9v5vSmn+i
	V8nS0c+Vg0u1pXENm0fIjlNuyMzNNUxzJ2HO+4FYqVh4dOt8EBDO1QbHMYyYk8c9R+iBepVgcYl+0
	dUBiMTa5EPk0d5navratUn7J92qNfqn1guqGCjSy7/Putf0FpgtosnBIAQnzeObenuum/nfYsgr4z
	mIHmMuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbI-0000000ADDD-0PaV;
	Sat, 18 Oct 2025 17:20:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAbE-0000000ADB9-0T14
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 17:20:13 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b3ce040db85so46633566b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 10:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760808010; x=1761412810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTMTmXdQcRic/7O3wI4ilcIkNahM7H+SFceh2d7cSug=;
        b=F0tq2QWDnBihlHrAst5mUHa5XiSGJZroRRALs6L2k8MaUWouIuGSS2/Dmz8ef4Nl2a
         16Li8MEcuZzS3+HpE+OTbUOOPNuE87d4gJG+bzB0Me3FKrk4R55LE+k/ba2Zfm6+V91K
         JkVLvbUqhZrDOn3tGxFtYTIPDU8b07cws0BQh2zmvJynqs6qPcc3SvCJGfBqN9QvktvO
         2+sDQyLX5DPhFPIwUnWZTm+1q7WFVrPibmAwfkrTA1LfpI5sGQvN6/8uydMsJYMsRdg4
         VxQSVxkN3kKvAadCVjE0c+UjKvgAqx9e5RthKuToViOAzs69JgTI1mhdoVInUXnNoRS5
         ukyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760808010; x=1761412810;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fTMTmXdQcRic/7O3wI4ilcIkNahM7H+SFceh2d7cSug=;
        b=r0zwjp4E+9IDK0FAae3VDvOJplMTaLTXNa4pccbuGqnoxeKoqNBfkpddLOG8Cp3gmx
         83ly0rAAB3qjWaD2N/kEcqGLa+cBukCKJkSl+O0/V8LaTjEEbf5vEDt3Sn3ilI5M6qCD
         tmOIQz2Kopt/eF/No4CyYxB662O2iwhPyz3CJ3eVp2cKccwUAZ/B+mKLYHnQgT0LbCFB
         Oa/v1SVKaeeEj30b/ZR7ggXX3ZQjYhaDKSK+5PmmDqV0MbkTD5KLBMLom5wkYzT3Hns3
         Lrj5V6VxC0AhgwjBT2124KXhY3HkthoIc+/RZaOSjmOO3z3ZtFpKtNNTjKOaW/tumIzE
         U8gA==
X-Forwarded-Encrypted: i=1; AJvYcCW23CYLmPLyIqTRKm8HvZ4dFIk9wFlKtR7phZj48ifByrBAHh6fzvCPI3eqE7mfufdje8lkdknF9Oybp9z043u5@lists.infradead.org
X-Gm-Message-State: AOJu0YzWB4GvFcZnU/z/4wj+AF4YeYep27Z8Vx/JEXWuA7WwY+eVPztE
	3RtUXUG3RpL8JNqIvfMWxLE1bFzQSB2zO9DDyzsQ0/J2EyeQIsGHrKSyQIXTbrr2A/w=
X-Gm-Gg: ASbGnctiZ0yrU658tcTvXTDl1O5tSy+HcZPI+Nmmmcfll6Y3Q7FzEMihLMgB1BkxK/l
	y5jfCo7BoDKWhWBpHxTXcBLN955jnvhPmiraelgLuU8XdmherAScPLaCumVRUhVr5p4bvmseABA
	Ivq0O0JoGOWyEmSsvkY0vtHrs3L/7aTNVHbf5W3TW9aPPu9iweVRjy26SGeccuS7YLKUy+t3Zij
	o/nSpKKdTKaks9ZkHtOOEWClBkikAFkEPTY5XayEhSr2RZhoOfIWylm7pu7xois9ESTagsr3jO2
	ePMN8LZpa1kFH5kd47jUr9lLihIJY4PyIuxwu4U0xYa9EBZtsncqJjt4k5CiOtd8SI/LbE9b9tr
	5YoOv1pJWouBqNQ6biMBwvBPZDfmiT/nb/Z1MaQOpD8JbmySRxDtLQbyDgz2hUikUo51FJGglAa
	aW/YOtoF6U50VFBEyHvUsg0PKtoSc=
X-Google-Smtp-Source: AGHT+IFbTirHyIN+XM2fk1IJ2nHqbjUwUwjp9X1pcQvNQEQRFLlqsHZZnLK9IZT+t3DpLgig2ZlJ/Q==
X-Received: by 2002:a17:907:3da9:b0:b2b:c145:ab8a with SMTP id a640c23a62f3a-b6472352847mr489805466b.3.1760808010183;
        Sat, 18 Oct 2025 10:20:10 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e7da2bc7sm280666466b.16.2025.10.18.10.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 10:20:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
References: <20250928-exynos7870-drm-dts-v3-0-bb7d8e570860@disroot.org>
 <20250928-exynos7870-drm-dts-v3-1-bb7d8e570860@disroot.org>
Subject: Re: (subset) [PATCH v3 1/6] dt-bindings: samsung: exynos-sysreg:
 add exynos7870 sysregs
Message-Id: <176080800894.47136.16568266339840675495.b4-ty@linaro.org>
Date: Sat, 18 Oct 2025 19:20:08 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_102012_159210_EC2BC249 
X-CRM114-Status: UNSURE (   6.58  )
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


On Sun, 28 Sep 2025 23:26:35 +0530, Kaustabh Chakraborty wrote:
> Add sysreg compatible strings for the Exynos7870 SoC. Two sysregs are
> added, used for the SoC MIPI PHY's CSIS and DSIM blocks.
> 
> 

Applied, thanks!

[1/6] dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      https://git.kernel.org/krzk/linux/c/3abd9b087a4cd7430cec2080c67e7a94fd7a44b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


