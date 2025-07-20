Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE01C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgyhAHdNttgB7UCXQ5eGMG7hG2NbXpPfSEfjq5gWiJg=; b=RJr67FdjdX3vqqyE3d73JStLMA
	IbCOF66c2VFbQD6u4oY74LNo001icGzj4EVNRd3pb6+BxdjRHxkyvZ/h0zLs7XfvY2POTn7aNyaUM
	xqSsVoFsrIB4H/B2wYOq9Ed7BqPkLyfXvGK4whWI2zURIbB8TcHHt8936PH0kSoC4Vh6OO3Vw0Ltm
	DyY4R1rWKpkAVEjrfeMv0OtGQ2TwEITgEMzI//gfQ6+nV8KZRYE6twyVlImAcmRjqGMxCl4K0TYL/
	2Ct4FD09uOupyyEbSDq8qeE3kVgniDoo0QcAZ60IomwUjBHaoLSEDkRg7izzb7XvIoeaMSW3nxKdw
	GHjw3erw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda67-0000000FgGH-3kf6;
	Sun, 20 Jul 2025 19:53:23 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZsO-0000000FfNU-2JRr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:39:13 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-73e82d2e99bso1228539a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040352; x=1753645152; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RgyhAHdNttgB7UCXQ5eGMG7hG2NbXpPfSEfjq5gWiJg=;
        b=LBmW8sLo/gZ9XMxvrLOKt1KGfbatFC+CgIve7UXSmRRSfNSvpQVAaXaNaXSaXX43Xo
         BbT8hTcm006zmAKq0j4bkgjPzw5mJt8G5TuKACMnZ/gFKi25Evee9WIHivnWqiF77Ra+
         O4kkydT+YFBX+tQStqasCRNYa0/9gCn74I5KIeb6oD9i6yN63ElPstzO2UOh2kIdnelk
         88bRbRD1u5584oTv35f4iXIGkn+eR6w9RzIox2y4E7vgYTM28N2vgPrM1qT0aiNuu/DA
         +f+LKOlm98bzkAagPR7R0HittkFSYWrV/ZW+6yLo0a1/k2UuFTKeQHZmJ20DK0gOE8X5
         6XSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040352; x=1753645152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RgyhAHdNttgB7UCXQ5eGMG7hG2NbXpPfSEfjq5gWiJg=;
        b=ZoSNrjOBHyaqkJOgvQiMHaSXZ7bad8c91h0zeu8onEl2vbgsyazI6DexdYc1a2UbYg
         s722LsMUr2ib9zFkfxriAb6yBgyTDqskn0n0LWTI19tV3ec7ecR0VFaLvWkRt6Z3cmes
         5arKUibhf8/O08qEuySzmt7ESN/FbuFFGWU+F3HiLnVKYqbXaVMXTIHAGilbFEvmhH1L
         Db4ZuY+DixHRAh3XpCmK3IX/ptb+I+6QQulS5HCN2sf3FESCoGlUmH8KIydVRwklz9ld
         KZbM4aAWE5M1zYjJBcyyt5rqcEVbde3mTVT0m42KlodHbWU3FU8SJ5SbRxrOPGNavDLd
         Bo+w==
X-Forwarded-Encrypted: i=1; AJvYcCUwP9tsEl7MffrfTyrY5NPUyeaFYiXQ7/a4BBtm6j9Rxez0jHWUnH6ahxMoiRskaifKwF+94hBWHO5e22UvQMEl@lists.infradead.org
X-Gm-Message-State: AOJu0YwPAAbFUp0f8gk942dLLaQxcvEZ5BNVs/wiMoLDuEtkdgV8qYcV
	mSQk7ZJ/rO5ZfN7orV9RTxZHQgsEMtrLxkfIaHpaI2ldI5z6la92vMXTtDD7ySRyBuk=
X-Gm-Gg: ASbGncvB00Cy5//iKnKGYki6Lv5AFBg2ZFKYfMiHEQirSwHLkU9jMLNFhtS3LV+pAYz
	JCILVCS78USk7x3ZT5AXBetDW0knLxTNO2VOPJDj3NDyOMh27QRJDmyiG3o3w+/rABxaJJ645Jb
	l9MJ65/AqEQKioVDZb1INPy034iykOUkQi2FOai4sxztBHMSxF+rkGAen9WcAX3U8cbcfXKb18n
	wlpteH9Ja2EDNf6TmpjdpsJWbPKAlEMOXJ1AEtzLuwrOl3zjEp314IK4FvtzVx9vyTRRSeAuiyt
	MGNKzuoWKOsxrF20CKRzbOdmAuJScZ4DQ/nKgM6YHuXd4Jj2UU2QRYIWfwy4PP2rU27Zi1Y+Sut
	sttWBN/PTyNo=
X-Google-Smtp-Source: AGHT+IHy8h8fAxy3bWPzzT5SaTNbVxExyHntma33sNuNiRQHREjvH7p9NCon9z5dH6T2S3oJqW8IpQ==
X-Received: by 2002:a05:6830:6b4a:b0:73a:d3f6:8b22 with SMTP id 46e09a7af769-73e81090c46mr6599365a34.11.1753040351644;
        Sun, 20 Jul 2025 12:39:11 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e8354c8f1sm2296368a34.4.2025.07.20.12.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:11 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:09 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 5/7] pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS
 support
Message-ID: <bbe178af-62d9-4ac1-b089-09a7ab14d36b@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123912_590317_331489D4 
X-CRM114-Status: GOOD (  11.34  )
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

The argument for PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS is supposed to
be expressed in terms of ohms.  But the pinctrl-scmi driver was
implementing it the same as PIN_CONFIG_OUTPUT and writing either a
zero or one to the pin.

The SCMI protocol doesn't have an support configuration type so just
delete this code instead of fixing it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index d1f2f971cd96..fba0a3a2fc10 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -262,9 +262,6 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_OUTPUT_ENABLE:
 		*type = SCMI_PIN_OUTPUT_MODE;
 		break;
-	case PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS:
-		*type = SCMI_PIN_OUTPUT_VALUE;
-		break;
 	case PIN_CONFIG_POWER_SOURCE:
 		*type = SCMI_PIN_POWER_SOURCE;
 		break;
-- 
2.47.2


