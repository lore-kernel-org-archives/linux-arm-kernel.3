Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F97C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=; b=Hk0yG1ePaGinlzrezotPOztZ2M
	UyKI3WR23bYikpLIbegRYh3vQLpMi6LgvL2Pe0rPBqqMt5kxNY8hn2f/72KBRRz7YEVgz4stAy0Lh
	gM+EGTqGnKdXq7lNdhzdjX8DbZBDftHxNn1KCeMkHC53tnGFq+Z/1+raFVkbVW2p3aK6YwI62ceHZ
	/DVol2GsfsH2yrIWWwcgmrGYiLM9gNoyXQUeEfJUlboEJUQvWlabWRwdofhTwh/04ml0GHCKHZDYU
	LOgay7haAMO4hdbYyWvFkn4MmO3RZrQOyxDjRaGMb3mhOyqbzpzw9RVVdvGjUevznJlmWMjMfl3VZ
	IhNXSEgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAyA-00000008pEs-40kE;
	Wed, 16 Jul 2025 22:51:22 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucAtR-00000008oeX-0s9J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 22:46:30 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-2eff5d1c7efso333359fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752705988; x=1753310788; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=NdhSSP98002X076xQCG2QfbZ9FtoY7PvOz9cyoWIU1Tw74Y7decXboN9SOidE0hejh
         b9VIxTzZVa6XEMt8UWqADxQLgpxjA4kdcMrPKkNfJ7Jh9jl1Mg9FVnMA4+X/C8p+hEMM
         5G3VZ3L+uzuugB4rMrghtmcbX2Pd870ieuKQS+u1qZf28GQddwHyiETbLgB6pzb7wO6d
         kPxtgC6gJfRIJPulGzKu1Q/etpFiGEJgceISAT7Zg4qeCJn1M7FS3LCHv6zOWNuwsMoz
         QKd+cVg0ZmNY7ga5amkBWcDWp9V3zSsqtGQXqJCRwv7azY0vSZME1MYnonPJCmiRYz/a
         pU/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752705988; x=1753310788;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LiiyQhkDqEe/y4fMk89A/2LpiKkeCtnb83PrX3E9ODQ=;
        b=Ou0EU9JVhGq99Q4MxaMK+A6DhNSfK3R/xtPAthnwVUSJVn1g+x1d0/oKdehYKyovQy
         LFUphiljTb1/NHxyn8PCLsGyYHlJeUfE60GY+bqFIDnsIBJ7YpDHcy5FUjyt0Ku0AIMF
         alDI1Z0rajs3DYrbBQeidjnMT2dTFrly2XkFCkkc6+bEgKT3FN04ZjTWW5JExYXSt70R
         6CygiZIw/vLSgfnmkw67Olmj/FkvKv4XHtNLLsXIYyIW0Jq0NXjhrTE60LqrTKJNkvY0
         eXVMwq6JK2ksZlp/NJtIyItVbeyjGkytp5y7XD8SBwyVNeefggeIScWIVlT5czrca8gk
         CF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW3jfYzmYT3GIPgIL6pHqVKphpqgG04uHnmMiUR+EaXlZBxQUcUnLxAq8CEpwz+uDn0zRlItYSc6wfOWyOUgLxO@lists.infradead.org
X-Gm-Message-State: AOJu0Yx99xBTaD+PDEza5U0OYXSw0VFzrORaYZD3jgAPrFOcKAC/nVmF
	38lFtnHlFYuSNO+YcdxbI//Z+rUXCcmHUmljIbFJ6Bq09kKWu4sohRGnRkg3UyaKn3Y=
X-Gm-Gg: ASbGncuSGv1ojEarguvdxHzl1o/cZ5SR05VyeNnt9aBq423R7y8P4LdRZsV56eA435d
	IyIBw7BrcQ8U7UxqwhUGgcohlOvic8EewnMI3nbSMCMH4hv3QOdCOz/00nnRcSSHk1qUpnGQjCM
	yyg3EUtBiEVRUuvNLvWoggCnzGlHptHT26I2JN4ilxLdDUrkGD5hE9FqXnRGd+VIKx3IYIdAf27
	ybghLsoKf0c0cooWHWNEq3cEjWo2e0GenVbKQdDNo6Yc5pR8QHKsyo76eqRCDr1P+yVg07E/ElC
	Bj0dJB5snCVJbwj7M/UnfIWOVTdaY16yU6/Yn2mawG2bCOhY0QFdZ58CNE3pSuidcNEI43R79t6
	75jnmhAgfooaM+lygdu1fYhU2o5dFug==
X-Google-Smtp-Source: AGHT+IFOGaMrw9AqIgbXe/jwkCHgKj22Wqht7XROv3FQmVROEgsFQIi2GM+MArU/0+grsGQkVTtJVQ==
X-Received: by 2002:a05:6870:e412:b0:2ff:a860:3402 with SMTP id 586e51a60fabf-2ffb229c2b2mr3886783fac.12.1752705988172;
        Wed, 16 Jul 2025 15:46:28 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:3f28:4161:2162:7ea2])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11681bcdsm3928163fac.32.2025.07.16.15.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 15:46:27 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:46:26 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] usb: chipidea: imx: Add a missing blank line
Message-ID: <36d1c961-319e-4457-bdc1-69f8b6bed33e@sabinyo.mountain>
References: <cover.1752703107.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1752703107.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_154629_246280_797D3768 
X-CRM114-Status: GOOD (  10.99  )
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

Fix a checkpatch warning:
CHECK: Please use a blank line after function/struct/union/enum declarations

Reported-by: Xu Yang <xu.yang_2@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 0b8b980409bc..3d20c5e76c6a 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -1118,6 +1118,7 @@ static int usbmisc_imx6sx_power_lost_check(struct imx_usbmisc_data *data)
 	else
 		return 0;
 }
+
 static int usbmisc_s32g_power_lost_check(struct imx_usbmisc_data *data)
 {
 	return 1;
-- 
2.47.2


