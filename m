Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F2A112588E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=; b=UC1EjhMlJJR2Og3CPH5Wo+w9/w
	D1vBQyL4D6XweSi3BLUdUHSqUUI0IM1PeDUP1O87qdBUdUM/me9dG6MT5XOmFbkW9AqKfUJYUBiTR
	wybHZT6hvXNt1gIJFIAIJ6yZbYSQ+6T5YYRDZEThWFsUtY2nZuq/Z1cIPtp7owxpZyswhz1kUIQ/y
	qIoxUrDHGaPQdQtC7QPIuP77xdGY7nwP8dUT5Hp7wh/HhBnyHUAW6LZ9AGoCZRfpt7g+oGAZuB2Uy
	4DHxE7i2i9RQeAYlH430Z8H2aC5DZBkDX1Zy16pRt6RY59bzxJdXe2gFy8eIkJhaeQ2sPZ1iQw10D
	N1ELFPGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0POX-0000000CMyB-0fJ4;
	Wed, 11 Mar 2026 19:39:01 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0POV-0000000CMxI-1PmI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 19:39:00 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48534237460so1994075e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 12:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257937; x=1773862737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=TykKEGAuMLoBxSJEeNT9E11aQrLDL1bHg4z6bbjI8KWCF8MDo5T2UO/c0fBtoIZB4p
         LwrTA6xwOsr+6U9K6r8wNQ6lnXeK+uSZ29b8PTUXR8pYRHVt1rkNq47Pw9rWat7htTjE
         0AADG26z++fcR4Pwj50FhtxjSRgNQQlRKI37E2kUMgFdr7w/ZgprXcutuXW0CTwjLQpH
         qvCfyg5lSqUUq8UQnEVFXd8UHIx2R0axpyKU/T1tzeAIfjbdOVCLnOtiA2rwNet4zwOJ
         n+UUOTUxLm+kBazCYpXsc+s1qBMqhc6XL0bfBcEDpOC8S6/GzYNecF3dg4UT9svxa2uo
         DcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257937; x=1773862737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CaxwIwvIcGgO9P9X/34fCDqJsPmK1yqw1P6zBQb93s=;
        b=DB5bukaVtxzm9sgSxTPQF1OVpurgEh4+u/CkK95BJjjD0DOv2Rro2Kyd9SJxBRQxKP
         /ipfGjAr2vR9rtubl9IhzVdm05wPztkcqX+TNoGXgxvdnkDFfnsmoHWd2Wssc9vGFAwY
         2sWvPDFdSntkgjt7qMkXBy8Ciat6UfCijnSNXBAh4TMgr/bLGdWjn6pQcv1dzL6zbQR1
         kzo3/bbcmtojgSOyxhnuBT4BKCNBQCUNT4YCpmS56FsrY5TzE3aNEVQDhuyyCembMyf7
         NL6QHlvPKmWx2ykunxDL8gVnpJhUPs9U1l1mycEQJbNhlApAnD7ZGVQZ6CD6onugc2Eh
         esOg==
X-Forwarded-Encrypted: i=1; AJvYcCWExt6sPMBvbS8IuP7EV+DCUh6o6jhxKbMWlqz3J4U+1H7x6Ct+8yqNzamD4xG49deSsbgfCsdA+c76G+5HNidA@lists.infradead.org
X-Gm-Message-State: AOJu0YzlyNEh110z4V9ZQWsqxEcoSyxvqKGh1/MDOqGEmg51lTJrcZWx
	56EyKW7W3ivL3EQlIkfUoFyEnDJxHpZFXXbzArPs5Ae/Z42k5lNsOxU6JIoxisQ4yds=
X-Gm-Gg: ATEYQzyAZZh+R4Pbafgp3EYzxELboPzx9ADnSUqb+VWoErf4Owj+YG4DtHRNevB9EOw
	4YIJZ42zhzTMBqKflTBCg4sABZHoacN6wTh7rhnW53hYvJd7zSMJPe0qW6y+XTiHChzlImZMxzs
	PU9gyUK9I/pbfB8mXBN2PSthdX+aG6HUnweYgXTpXPhzCssJvclhB8G0VQh0knEa58kqpEWrSqZ
	o0W3uNLHewi+oPcSp7/qJg0OfFaw2PFE6PiHfyAePo7JNF1vTfMIsIvNZWZtjVQlNLqMLcCuJbv
	IjwPz4UIdfWhZKmUHYjh8VuBWGmNO2rTaTBhl7eoYq+KHtglA3ipw7I2M62rLXMnPPcyAeqT5TF
	s00LWMmGAzQRDcI8Tv0PKvaBnDcAoFkm8GRKpFGrCjKq4ULI4cHcJnKN1JBy6xDUDfW6AMt3anT
	dmhfOVyCc2zaER1katEwrafgvfYdxxzZSWPKZsHOA=
X-Received: by 2002:a05:600c:c4b7:b0:485:304a:58cd with SMTP id 5b1f17b1804b1-4854b0a4a4cmr64000115e9.4.1773257937205;
        Wed, 11 Mar 2026 12:38:57 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm1460894f8f.24.2026.03.11.12.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:56 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:38:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Linus Walleij <linusw@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 4/7] pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
Message-ID: <b24c7b023c84ec14cfa7e49352e834262e3fefb5.1773150895.git.dan.carpenter@linaro.org>
References: <cover.1773150895.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1773150895.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_123859_390584_8C8E26D7 
X-CRM114-Status: GOOD (  13.92  )
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

The PIN_CONFIG_PERSIST_STATE setting ensures that the pin state persists
across a sleep or controller reset.  The SCMI spec does not have an
equivalent command to this so just ignore it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-scmi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index de8c113bc61d..f22be6b7b82a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -361,7 +361,7 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 				    unsigned long *configs,
 				    unsigned int num_configs)
 {
-	int i, ret;
+	int i, cnt, ret;
 	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
 	enum scmi_pinctrl_conf_type config_type[SCMI_NUM_CONFIGS];
 	u32 config_value[SCMI_NUM_CONFIGS];
@@ -377,17 +377,21 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	cnt = 0;
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		if (param == PIN_CONFIG_PERSIST_STATE)
+			continue;
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		cnt++;
 	}
 
-	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, num_configs,
+	ret = pinctrl_ops->settings_conf(pmx->ph, pin, PIN_TYPE, cnt,
 					 p_config_type,  p_config_value);
 	if (ret)
 		dev_err(pmx->dev, "Error parsing config %d\n", ret);
-- 
2.51.0


