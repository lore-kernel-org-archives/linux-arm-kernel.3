Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F83BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Jul 2025 19:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=; b=A/s2ecU/u/Xd6ddhHUb/QjC8SO
	aUnl/+n1TzE24bAZib0aM+dPrMGmdmjK4LrCXIJxKWah0ilwQo/xZBOuv15yf6+toaguVK9sEisZH
	IrLdhUFpDwqFPP3un1yn9sxRLLsgijNYL4IvpnAA2PdA2wZT02anCFaI2V9FgSXExHjM+pqDIKD8r
	WNcMvQKRhs/jxFso73nXjXXiikniOd84WVjdaubiEF8a7fImM3GWEAtmtZ73WUedM0RqytbdF7Ec5
	AEeYpgyO6t5z1lxEosRbSefDjWSpYEbDQbBxtHWAj3y15HQil0PqEfNNhnmpTrnJoT0uAlLmW542u
	Eef++Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uda8U-0000000FgMo-2xUB;
	Sun, 20 Jul 2025 19:55:50 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udZsT-0000000FfOe-1iPJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Jul 2025 19:39:18 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-41d826eb310so918727b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 12:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753040356; x=1753645156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=CH4k6rEWCdhOnIoa0BvrosXUFEkw3ug3zr8LIa8+RoBSqrNWUEm6rtcBoIcABVd1qo
         TE4YnQaw0k+rWWcVKlPAlJOW+wRHw9zQlK+w0kD959OrRU/eaJccrbOXtC/Qcg29qfzw
         nPF6pb6K1xHdZGCysCebFxOjuyB3u2PP6eF7aWZvo141MYUrWGvNkO1mcCb1JTzzTK7M
         ifkVFW+S8bvYeBAdtW2HcBFSHYj9mcLx4DS9rtfCTtgv2oJq/PIWytDZ+mRljCU938UT
         w28ZNLG3RhbHP7X5wCYaiHPB2drKAlJrl4D2HXTS5OVBWcDuXQgMXhI0r2OcqRGUBPmv
         lRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753040356; x=1753645156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qmI92MLlIBwFrbUrwXTt/2+OJ1ahYjNp50nlsYvpao=;
        b=X6ljtcM6ntByEpJ2trKe2mVjGzqOQz6DYXCoodUZTwS65po1mzrCKYx5RB80WBV/uh
         vRhTjc9DcfdJ/xFKs8LRtuV1TJFwJpbjoUUYOr+DRH3uHpi7c6pqbsVz3Gl0BXMywEB0
         6tsWhRUL5IjkxvXNFxd2cTtEYJDHYDwRddHDujezxbzkvR3RiS/97RIdQu9rUYZTWAKf
         HoBck4xa1uN+6bNDIr0kRiCfgUJxDgt5t8fpRwStkqmyhObs7jYGy6wazTZC7mEAIksK
         2FjPg4vMGUqzAxcW0eRvNoU4Q0iKNeZadGjn3/V5cfwKROKUIzyAtRjfziQmOXSNHrJj
         LBDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGyrKrEmTNgIaAoLq6g9qpOSRFMYgMVFDvsjGq4gqLE6elkIqNiusaHtQC3DAMlH84+f8baZsOfszdHd1M98XB@lists.infradead.org
X-Gm-Message-State: AOJu0Yx59neSapOhNWVwIbNxI8A5T6qSquKKkVlm8E2FBivdpUlhY3hs
	uCPq/8cfDGryc8H+i7YyWK4yMj04E7yKXqF6+Ulg6ajjzBGlF/srJozn6J7fSUwnkMI=
X-Gm-Gg: ASbGncvdYL+AA7zoxeOHxJtXGZXN0JHOYINW+AfTFN3++RGSdF0ejm1kvaqNd88SRLP
	0tiY19LwVktTjfIzGfLSqNVj0rFJnFn+Pl9Iw+XExs+DGME/N4nL6DK/M6gZQyz+ufWNuy8tY7K
	Oq+dVgyOZvFa1kP3saSU4v16LTzrI0Y9ENrBEzsQkO5GAVtmiUVHHTmcOL6Etr0y5waWRGDfKaD
	jhG6VUj6B9sQIwfYZ+PCaYVd27vY/7Tu2wAwnWHWQuvoyVeLOTLnkdwPNwnGYQyt2ySeErrMry8
	5nYd/j/LXvk4tz6U9PE5Pmb4Wm6yC88OR3Wxr1GDSh8ayCiBhjNZ+/XeqbW6CgqF3FU1TTKsAaI
	34x/nxpuQae4=
X-Google-Smtp-Source: AGHT+IHdyoPC+reGPO2928s8eY4VkIUqzrYH+Trvh6vGBElbMDvsyr9bGCnwye0zSGLIyzetZNTdGw==
X-Received: by 2002:a05:6808:10c5:b0:3f8:3eeb:1192 with SMTP id 5614622812f47-41f98e4cbc4mr6102894b6e.27.1753040356463;
        Sun, 20 Jul 2025 12:39:16 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::1fec])
        by smtp.gmail.com with UTF8SMTPSA id 5614622812f47-41fd19b3e74sm2025039b6e.15.2025.07.20.12.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 12:39:15 -0700 (PDT)
Date: Sun, 20 Jul 2025 14:39:13 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Simek <michal.simek@amd.com>,
	Sudeep Holla <sudeep.holla@arm.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC v2 7/7] pinctrl-scmi: remove unused struct member
Message-ID: <27a80ed0-65a3-4a41-994e-9c2d3bb76b54@sabinyo.mountain>
References: <cover.1753039612.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1753039612.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_123917_445177_7FD15838 
X-CRM114-Status: GOOD (  11.26  )
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

The ->nr_pins is not used so delete that.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 9a947ced0df7..372fa67589fb 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -45,7 +45,6 @@ struct scmi_pinctrl {
 	struct pinfunction *functions;
 	unsigned int nr_functions;
 	struct pinctrl_pin_desc *pins;
-	unsigned int nr_pins;
 	struct gpio_chip *gc;
 };
 
-- 
2.47.2


