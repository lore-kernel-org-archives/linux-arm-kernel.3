Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B909E7716E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 01:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jvGV4uV7dd9ya0e1OrNzeXExW0G1jrTQiEOMfyJbCNQ=; b=J2ojy132nAI9D95zDYMfjt7Tmf
	DEgpmYoYBSIpIkQ3cHgBnBXMoEpsALYItnZhx8mLbdHdG4/ev2714h5UZix28qWQ0v+UFGk9Uc+Qa
	iemKJNClIhhzeqDz5JMZrFOYzBbohj1Pq1OjK4+cO5P4jgA+pAeppLnXgfPBuMf2xi2eiPBwVVvX8
	UP+2eSpeVv7XXTHq+kF4BXHsJf+y1t8TXARgH/6CAggEmr40ujVjPWF2F1hf6Br2CbSM6E962CdKm
	iXHhfAknCdybZDBYihDyq5XRYA/C16avryWYaVER3VRNzcGsWT8gW1zvdVuAgaG6gsb5We7UuW0Vm
	8R42r42g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJN4n-00000000CFF-2FY2;
	Fri, 06 Dec 2024 01:24:13 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJN3m-00000000CAr-2gQb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 01:23:11 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-46679337c24so11810831cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 17:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733448188; x=1734052988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jvGV4uV7dd9ya0e1OrNzeXExW0G1jrTQiEOMfyJbCNQ=;
        b=hlxcK6/kdo4dt5A2IubG981l3qvyy/SsA7HvHTUcaHYwRAHO46WE5Tax5hLW9uTICY
         MflfcVAo097GBiQeCaOKCVwHjnOZVdsk8TX1ootU+vZgwgHFhDlsnYmJv1WhaWmGcIt5
         GKqMK00cZr+oKtKWpmDoCxFVYIC7/dkSI8z/rttLEtcbsgNzSZ/WxkTHHODOdzD90AqD
         CWoXo0e5BFMvuIRkgi772CVRmSa//P2K/GIUN1GNmAa3egvbirGzUV6XsvpKW3C/z9Jt
         Q8avrQVRFncfcQGaSHm/KaVHw0KyD3j7GWMhX29uhm0QcnNFpgsz1AdqeAE0gwiMCv+4
         9Q8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733448188; x=1734052988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvGV4uV7dd9ya0e1OrNzeXExW0G1jrTQiEOMfyJbCNQ=;
        b=NPBxCv+WeyckvFYtFOAXR6iyMMSp/VCVg6HIi8CdtfC8oRN6jakaWTHQrrSUWynzdG
         M3vLy5HoTIlp2I+4FKpdZ/7QPNGzezY4f031sFn8wADizCqWkV72WUtiN1RttYcY+zhv
         /bPh5aDOUfEjY4Q2CD/kB9WkoTuy2zOrjMyceQFgiGecRDW5UotEJcdgbo+F/NZ7KcMB
         etFuJm3HvxLef2JE/2t1FuRW/rjJZBCWouf2e2MvLMzIE3Q4IZcyEQtgwqy9y9tcGZfw
         uKy3D51uVGXdgeyRk5KKbdo9LbK6CdnhPs8cQQPAclhqSb1GGiGGb3UUcBbE2YinX3Q/
         WCCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqmMeA4tIhXQ5/WtBQh8EHXyG5kuUl2/KpbT1y6pD18pWKRBdHRIt4f1K04ogY8+6BupkyoL74awLVzego9UD7@lists.infradead.org
X-Gm-Message-State: AOJu0YxfQ1vIOqqzd6SlkUt3RGWnwMLRgx2cZhN6DnZZq7ErTswRZ7fa
	nNMG2a0PKRvzpQ6zBw6bRpOoXAxIxA0BE/1RCrdi05rB89+lhe9e
X-Gm-Gg: ASbGnctMQ+q7aoTm5y7wa7ImmfrkPHfy6cDI8UCLn9giAogaP8I+e8aWDLdm01HOiuF
	cwrv/LFNM7Sk2MuSN5OkrhSH+t0JOdLGwNnHAyvADFe4buTmZVMnqpymUu/eRHzS6xjYrVaRQsE
	kJ+url2XB6hWIvmdlQ3c112xVKiNqvyQ3/thKPQQupOS2UzahZr0/i87dGgtXtuG8QzkVMkmKI0
	oKzQXjrn10FxXc6V2yDyPfq2cIBlHCoRRYGgjmhU5e2rqp6pIXlyTaIEjFmQw==
X-Google-Smtp-Source: AGHT+IHK+wEHEpKWNH9K1+ZII620j8IfRKrpZnPMtL3z9CL/V1j63cap8ccn1cWykpj5ec/jt9vrgQ==
X-Received: by 2002:ac8:5d12:0:b0:461:1fc4:1016 with SMTP id d75a77b69052e-46734cbf6b3mr19416161cf.7.1733448188457;
        Thu, 05 Dec 2024 17:23:08 -0800 (PST)
Received: from localhost.localdomain ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467296d4d42sm14619631cf.32.2024.12.05.17.23.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 17:23:07 -0800 (PST)
From: Mingwei Zheng <zmw12306@gmail.com>
To: fabrice.gasnier@foss.st.com,
	ukleinek@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hierry.reding@gmail.com,
	lee@kernel.org
Cc: linux-pwm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mingwei Zheng <zmw12306@gmail.com>,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH V2] pwm: stm32-lp: Add check for clk_enable()
Date: Thu,  5 Dec 2024 20:26:05 -0500
Message-Id: <20241206012605.2877412-1-zmw12306@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_172310_706711_5237E168 
X-CRM114-Status: GOOD (  11.74  )
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

Add check for the return value of clk_enable() to catch the potential
error.

Fixes: e70a540b4e02 ("pwm: Add STM32 LPTimer PWM driver")
Signed-off-by: Mingwei Zheng <zmw12306@gmail.com>
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
Changelog:

v1 -> v2

1. Move int ret declaration into if block.
---
 drivers/pwm/pwm-stm32-lp.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 989731256f50..f09d097d6284 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -167,8 +167,12 @@ static int stm32_pwm_lp_get_state(struct pwm_chip *chip,
 	regmap_read(priv->regmap, STM32_LPTIM_CR, &val);
 	state->enabled = !!FIELD_GET(STM32_LPTIM_ENABLE, val);
 	/* Keep PWM counter clock refcount in sync with PWM initial state */
-	if (state->enabled)
-		clk_enable(priv->clk);
+	if (state->enabled) {
+		int ret = clk_enable(priv->clk);
+
+		if (ret)
+			return ret;
+	}
 
 	regmap_read(priv->regmap, STM32_LPTIM_CFGR, &val);
 	presc = FIELD_GET(STM32_LPTIM_PRESC, val);
-- 
2.34.1


