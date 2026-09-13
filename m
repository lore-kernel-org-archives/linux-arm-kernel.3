Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E70C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 22:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHFmaO+kDb8wMPnqE7UfVX7wmIXcuui9FuHVD6Z8w4w=; b=hFi1dll0eh7s6WUkq1y4y/YipG
	zoVE/8yuGuzG+aeo5j2ypRf06xDwJ6B8u9LYt23n9DepBX621OL4Uzu30N922IwsfSNYFuDRSwaOb
	nhCNRR/qhV8lp9VQ1KIChpFIZog83EaaRM9KVRDzgUaY+m9VrO0vbtHgbHJfBqWDDICcLoEx3NwGA
	lrZIIzk+4qirkhmsI2oddvmrrNwjJLbdukB/Y+sPSwvv6eL+owy9NTjH71Fn1RX845S4GdFvjP9Go
	x2dv25c/DnCIQjtGkOJApFdU2+Exjm3YnyYn90OuSHNLq/n/bqZMEpVyuK+nGGMaTk0dPmPRdlvDU
	J/ClSTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5spj-00000002559-2RU4;
	Sun, 13 Sep 2026 22:37:59 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5spg-0000000254V-29lo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 22:37:57 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-936623c6dd3so394670085a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789339075; x=1789943875; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DHFmaO+kDb8wMPnqE7UfVX7wmIXcuui9FuHVD6Z8w4w=;
        b=odmV3Kj/PUEYyNJVy9rLNm7yVbKfePotKfYFMpUWjvQ3GWdxQp7yc1BWRP5AI6wWA6
         q1drYuVe1JDPv5/y2rRUnY85DwlKmxJLZDiD2Kaw98LPy8OAYv0X9CVcNKZBsfB8pB2l
         ioHz4A2eEIDIaFtlK9b1L9in0c2ld2k7B/08j7nPLO1y2e5rYC+GzvaJZP7FqZqx5CyW
         RBI2EMJPlyxKGsBmBB5yQAwlg35+UmvdNImY+Ys2PixWs+Lo6gvkBhFNi1xVUuTFNWsW
         9U/iApdg4lt/ToKi3uRx1L4eMMYioIujPTlJIQ4IpNNeYYeu+ubaVV0EGt0ZR21IT97F
         dAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339075; x=1789943875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DHFmaO+kDb8wMPnqE7UfVX7wmIXcuui9FuHVD6Z8w4w=;
        b=SHnEjbPI9C5PXIQGDZqQykmY56+vsdJ9vF5wbMp3LvoqdyNa4DOXqPk5Ii4rk6qzPf
         SwXUHsWK//gvqGym4vIMjaw6JeQW9h4WHWhn47KoYPqYPy94JDkj35Cvbi5oz+VqR/vM
         h5mzK9AwTIFrFi5Q01wvzadOMJR0ZmH1umJzndndnV+BgCNTU94u0JWPA2k/H72LsqpW
         K+/uc9g1ch60kNZPyv1358/2G2i7D8xnoVgeyM5gH6H91sgwf+NmelGcvNvFPgL6W3na
         8WMsMVG+36QHVZ7yWWuA6+7dcjxBO6JUyqh8Co2AuFBa1d7jdS5PAizhmqrfM4T5uIOQ
         wQmw==
X-Forwarded-Encrypted: i=1; AKwUvBxqu/7GkBQPUBluPqyQcS52AjYmWBNBjomnHJXiV6ATSlCOU8F7hhor/ACN8H9WTzOkqZsXqooWZHx8IkR5B5Ak@lists.infradead.org
X-Gm-Message-State: AFuF++kkVD3khyRKVwGgm5H4dhc6R5KatRVljKU/fj10ibmMdRCzbWEl
	GihozBTBJi2v+qoANHHloVR83G/EnSLAbrwkjb31rMmILVwtT8q/l1s=
X-Gm-Gg: AYBFou098DUdlnhhAAYOu5NCY7wbUuim69dOUKyFEn6A8vukCW/Xn+B/ASa676S/FJi
	UmnngTv/b+mD0T0b0g6IC1I9mE4yADUsq3r9dsCjq0pp7kOEPD1mUMVoCqxzewonnpfob5/31st
	aWyyMBkDke8NFRdDdybfCkBjBCJ5W2CCn4FbOtNGclgwj8UBuTJna/2ncYN8w70SjC/99WmbpWK
	QBYUvo3SvfNvVxCVG4QFm2S0pybtwiuU0jxlhWjS98AeEa/JvuQ3uryRKlwrvvQRQq4ktquEyUa
	x1t2G0vnOPBFCHeVKxoQVRQy+Fjz97Mb2RMswYAa90nx/I/uSY+vu4OkuOq69l+iemlT4ZbSHwz
	zdteLh2lFiOYvrziAP2F3WHFOY7cklFotqx6/J8OkS00WS7VwY9O28521ALEZdjVpCWGa6R1lMw
	1VuOo1mBT5d7rNJZZTYAr4i/35T6pzN7erXtYF5Tt8+0c4QdKM8t/PN9zMUZwQnsgmq2WuOBTaL
	4+IWQkssbboXGyGsIVhnj/3LV1RiUjkqfUwjUTcl/rJlTbY6NyRmdWRagDffe9sES9eKXr+5eQZ
	nrIkah6FIOKe9tRcaChwUyH4KRiu3yvlaQ==
X-Received: by 2002:a05:620a:2708:b0:93a:133a:310b with SMTP id af79cd13be357-93a1870eb4amr396136385a.26.1789339075060;
        Sun, 13 Sep 2026 15:37:55 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45cbf2sm79361056d6.17.2026.09.13.15.37.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 15:37:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: stern@rowland.harvard.edu
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/3] usb: ohci-exynos: Disable controller wakeup on removal
Date: Sun, 13 Sep 2026 18:37:32 -0400
Message-ID: <20260913223732.92882-4-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260913223732.92882-1-mhun512@gmail.com>
References: <20260913223732.92882-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_153756_561916_A67DC506 
X-CRM114-Status: GOOD (  10.69  )
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

When OHCI reports remote-wakeup capability, a successful wakeup enable
leaves a source attached after driver unbind: usb_remove_hcd() does not
disable controller wakeup.

Disable it after usb_remove_hcd() to balance the enable.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 62194244cf87 ("USB: Add Samsung Exynos OHCI diver")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/usb/host/ohci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/ohci-exynos.c b/drivers/usb/host/ohci-exynos.c
index cc5cb09..86ff7a0 100644
--- a/drivers/usb/host/ohci-exynos.c
+++ b/drivers/usb/host/ohci-exynos.c
@@ -194,6 +194,7 @@ static void exynos_ohci_remove(struct platform_device *pdev)
 	pdev->dev.of_node = exynos_ohci->of_node;
 
 	usb_remove_hcd(hcd);
+	device_wakeup_disable(hcd->self.controller);
 
 	exynos_ohci_phy_disable(&pdev->dev);
 

