Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F35ADC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=; b=Uxklb3zmVMxfZBXQQ8DTVeIFwm
	tQlRAAoJS5cEfvojZWdhN7KYIclMNs7A7delYmdLm98VQTmwOodllVR59JORfUd+rtoHIfkX92BnC
	oqHNLQzqwwC3NpFnET/dwMRininSO5u7Dchd0NC3zyIjBm0QR97FJ2nV2H9aKKXCDENkgLog0LZ44
	LBoJKhbqs+j1i5EGHpdxR4nK4XMqDHjvTHKIb7nLUQUyxVYrtgBGnqDMVEK3bhSzWz5/UEDMFeSfE
	PxiDxv7D8QIepIzLxW9zpqGzN/mmUrHEInK8nZ/JDZ/L0OawvP/6zg7O43k4DQ9iQcMNu0j8t54lW
	EKo9D2Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3jr-00000005igu-3hdy;
	Tue, 24 Jun 2025 13:31:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yg-00000005h5O-2Bns
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Jun 2025 13:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=; b=jXF+XSHqzi1Rwn36Hf47t/YPgl
	svrLVRSd/y6/GtlZOdNUm5tfq/+3vq/jN922pB57xioOaTUZWtPWa1sM2lHb0NlTGk66IE7aHgW2v
	LWqcpTVk5dzzDxDgH6jT5NbRTnDosDDbyzZmTPGzvwJXzjiB7CCVZZZt2Fpn3OSQUQ7F49R3NIDqr
	etiE1oiNcjZX+MVDg++r7IdumBQuHwH/P3+MxqzpAh1zhYeADsi/OtaU+cEI0WWPLR2sb5B4d0cqN
	o7xwMJA5lGL4poYs1zHXJaAaNXg0dUO7ThfT+uJKgriJ93mchneTfKgp4geBqH1AwYGOhIaignLkn
	5NdbBkrg==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3Yd-00000005RbW-376F
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:19:29 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3a589d99963so5200754f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771165; x=1751375965; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=;
        b=2wCJtJA1d/mk8Z17T2AXv9u1DalV9w4R3aENcYLzC0ewst/NxkFY+NZU+1xJjKu+MU
         +zHYOwisxVKALJEtdKKet6qTsZbF9/kyF8iaTDa2JjkrCXK5y9HKDjf3ceTbwBKA4Z87
         EbjOlutEFiwRdXFeZ1LCPR0Ts2UkSz5R7qGW1eMwKT872+Uwjq/REBb4Uosf+cRoH3Au
         6u7PErAQ/50U0LyHgU2OMYCuqZD/BIRBvlnXK2yTpAy45S6SR1ZBD8m8hFRJ6oNW7SfV
         0ivKon4QpfgF58stig4DUYPLUju4kWArCzXJjqtDmQ7SUd8y4CqNmF8CYTyqUkuBsyNe
         GvHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771165; x=1751375965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h8MhLQAkcHIjciDwXBy0xiLsqhDE1FYLFev5f6oWs14=;
        b=SkpEJOIVUBxJ33dVJ9euM/KH2kuOeW2QEwSA4YzXGLsCRqMxLJkGbFM03wnfu2mmvE
         1PoVnj684XvNcAmwhxV5gV2GJlBBWW/9GkwHjutaqDo6H8qngPHHBVj1PgoHDqM6+kgm
         BMXsg5+PcRWG4KdkBuBGCPXu80H0ErUz632RPQQVgbRpHdx3sIGB1aEp7qghjfebLLIB
         gis21xTM/wrPHFCnBfoPFGTYVWjSbdGw3lLAwpwT6A7CV26dbywy+Oho9NgkYpYvD0kF
         38G/zi0rtAVJFqfiW7cOpI/OwcbgF/9EHcVM9SgtrQO8qk4j3hYtv7VXJcDGHKhs/mP4
         kh1g==
X-Forwarded-Encrypted: i=1; AJvYcCXI9pFpUbqhH385RtfR64Bt/9+aECRagM0eGSQbfTUk6aKUoqE0dO0Uv4Efz3r3/fcmYVfO0MwXaKFmRjyAs9Fe@lists.infradead.org
X-Gm-Message-State: AOJu0YxkSAOJspqf/Sb3E0mW6cgIz4VbUFLY4N/rFx5o6s7JoY8gGPBW
	IQjKyEBrU43LCfghKy3OSNmgalIpGMTWxhi9mQf/TGsngQBpvB2zNR7UMB//ZFkoLoI=
X-Gm-Gg: ASbGnct9U2GCkmVGAWj1Nwi9O9yhfxOkAMUKYReWfJ3y1EQ3/x069Gb6rh6PLNh6HBf
	r2K3e6Tr5hf1WokxYzGnqEAnJ/vcuHUD9sIKnli9tFQE1BmlhGn424dbNuY4rmo3sr13u6GCedy
	0/V2v1JdX18GGhC60lrzpIIh7Pfspy7srBtXppfYCbhW/hrTlhdSv+k12ugSgkHYxW6NYl6c6mI
	Yz6CI+UxWbY9ZJU1tKyG6TcHnVckIYas+G6CgI5V77HYjbfl5zoh15JzpoixpDERcWMYOdmU9rV
	TpQe6CN7R/6vUSoUI503zAAKVBMd8QwKXEeccD0bIMnJDca08myjv4c=
X-Google-Smtp-Source: AGHT+IFpR3OgJhahPgRYBa1gyCbLYGTqM0deNU1EOekJG+yRN2EdJeLYcRO6UimDHtLaFLkUJxhOOg==
X-Received: by 2002:a05:6000:4906:b0:3a4:f661:c3e0 with SMTP id ffacd0b85a97d-3a6d12e6a3emr12875157f8f.45.1750771164792;
        Tue, 24 Jun 2025 06:19:24 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd74asm141302195e9.22.2025.06.24.06.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:19:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 24 Jun 2025 15:19:13 +0200
Subject: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 patches@opensource.cirrus.com, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1610;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=CicxjQH60h+01gOTn3o1Z3t/Z3AKnZL5tqmvJoexSio=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoWqXXMsfVEhgOPAMUlt3aOG42wfz2dAxjfjfWm
 vW5S89INwaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFql1wAKCRARpy6gFHHX
 crI3D/9MQVWF3IxDKPp8bpUK4M3WZ7ecjW7QXbTbRwiNgNQKGjBGDdCILPxKDj+TB/jIDo/Au36
 eKEMjX0RXCG3OKYAFOzG3zt9jYQlLZtp5I2QHIasRtrOtkq6dRrSE1jIYSm0QHoyd+YX6em4+B/
 2ggCtYCABT/SCGHBt4bVrNW+1AkiWa4QuNmQiaUrMGNU5xinXvg4JYHB6l32pj6Yd9CM2RKOprA
 gfqmSxoXbf8d9K9/pEe0mFaINPdwap9u60KV6IBhFMTXC2K8NvXsjrhz9JAevfkwnLCCY2yOwwh
 WrbX33AJOldJeNHB828mlc3Jh6duTXszjKzd6fo1RlfwDsnUbvxwSo+5VZfgmIp77XMK9RG+rL/
 R9siNRm69f+JftdOURhL1tcduGh6HeYpmZsmsf+jUjOqqf/8NuX9TeXkkpy/moZspj7Ca1zMB94
 1iZV1GsANFay/4vMc9w+qVAbBP8Y3I/Gluz2vLfyiugexHW8IBipihQEucNhX2lksD7uJ5zwRbS
 FKyanwd06NrJivQWgD/kvk1btGBgW/jE+1raVNo70kyTvvgpktS0Y0AbPpqJRIquAo9tO7AeC1a
 +16Yq5moVSnLx9IVYPYkUv8ivKsqG3XtCJ5+ClB8k3oyb4nNpe7YDFh4OzwlZGAia/zHbtzWJYX
 pWZIXVFjjYZp/gg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_141928_062671_9E60F925 
X-CRM114-Status: GOOD (  15.68  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
module, let's add support for getting the relevant values from generic
device properties. "label" is a semi-standardized property in some GPIO
drivers so let's go with it. There's no standard "base" property, so
let's use the name "gpio-mmio,base" to tie it to this driver
specifically. The number of GPIOs will be retrieved using
gpiochip_get_ngpios() so there's no need to look it up in the software
node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-mmio.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpio/gpio-mmio.c b/drivers/gpio/gpio-mmio.c
index ffe6b6f6cc9b1e9341e1c42cf8fee917e0147bf3..8108aa8e6b86ae3d0b520a0f22a09689ab1d9bc5 100644
--- a/drivers/gpio/gpio-mmio.c
+++ b/drivers/gpio/gpio-mmio.c
@@ -737,6 +737,9 @@ MODULE_DEVICE_TABLE(of, bgpio_of_match);
 static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *flags)
 {
 	struct bgpio_pdata *pdata;
+	const char *label;
+	unsigned int base;
+	int ret;
 
 	if (!dev_fwnode(dev))
 		return NULL;
@@ -753,6 +756,14 @@ static struct bgpio_pdata *bgpio_parse_fw(struct device *dev, unsigned long *fla
 	if (device_property_read_bool(dev, "no-output"))
 		*flags |= BGPIOF_NO_OUTPUT;
 
+	ret = device_property_read_string(dev, "label", &label);
+	if (!ret)
+		pdata->label = label;
+
+	ret = device_property_read_u32(dev, "gpio-mmio,base", &base);
+	if (!ret && base <= INT_MAX)
+		pdata->base = base;
+
 	return pdata;
 }
 

-- 
2.48.1


