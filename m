Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54514C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 14:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TjEcikoo6DSPkHDkOpmkpqUSlM//3uPYTFXI+t8fY4=; b=GF/MUAZ6wf4pzXPpR0IjfHqABq
	6Vn6JPRirJ9FrMX7O11KW9YXtSV/A9/eFfJofNqdKqOSwXTB9A6TzRWTsabF4mPvSD8QLIv3a74tv
	nl1e08c+xvD72z+Hr73LRjfB6elWCZVpYOTcCZBfK1Gnb7IzI7SVr8NQXyFZWlrDKmvnfxMVPrZ35
	z5IlZol80uhhyx7h5XYqt8JBFvQ9b+DVzi5nHScwldXi7bubpyKuipbQO11Ek66WPtKtFHr1rLAH4
	w0uhiuX5hBpUjvOS10gusQfmedpI8IIS7RpGman97f0LqNwDja2jO1gN5QQff8nMNdKVL0ShMBrx7
	doxn8OTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QYA-0000000DNfP-3FYm;
	Thu, 17 Apr 2025 14:49:10 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5QBZ-0000000DImM-3BM4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 14:25:51 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-54af20849adso887785e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Apr 2025 07:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744899948; x=1745504748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TjEcikoo6DSPkHDkOpmkpqUSlM//3uPYTFXI+t8fY4=;
        b=DoJfIv+Pr0+gw6K01WUdS9xEftK3d6ME0Jb9ySF+sIIuStOcHrHvSIPX4l78/6fJ9t
         YgVVe55mMXs3lzDFMV0hR6Berhf1PeOQNVfb4L7OSTOkyaBMPTcv2vea/4NYz5sYdEa2
         bHAnlxI6TnubehNMnC8Jp3WyDdaiW5X2HW1gKuvZ76lEjmgIJKGx//St0AOPMx61S0Pq
         BtXi/6th7fWsepDQTpj6neAWTcn1R+0keNXgjOgj6SUgEuhV9wa7iFfRpj/EeoyDRseM
         L///1Y1yO/GzQN5BDu8+FAqImgR8S0TsHrCg0tDINvsy9zIHDYuyKOXO0wPa0FETYd5j
         +0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744899948; x=1745504748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TjEcikoo6DSPkHDkOpmkpqUSlM//3uPYTFXI+t8fY4=;
        b=B/r3Dr7tj7bRHsNe+Iwl/XB3llKN7SPKGMX7DjXujKLhxLt6U11dOWzrMCNxJP2MHK
         US36RxmJPXCqRWGDh+a9uf2fCBSRn4ngosF9ly3absD2UYeOljphGEzjgMePynbGvesh
         pIDQr3mOOwfm99CAWbZmR1TRKDDAxsJoE5gU8Q/EgJO/tS5m23zgdx+ztqxMsN6XAEsb
         EUmedPXhc2Y/yvDNCRk/iVYgS0TwGvUmBjSpcK5jI6HmJL+qYW8a8hoTFgwXI2v4kD/Z
         8lprx1/DQQPkK5UeNOoywo27IQstw62F9yF+tbLpyhRO87BwFFGBaZ19t30C7jUZm9VS
         dT7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVS5yFvbkaSRSXhfZyQK0qAR0914eW1syWqEbKgh0EDPoE9VqtXg0RD4x3g6tI4D9j9lr0bg7Z1DuzfnvSwYMI6@lists.infradead.org
X-Gm-Message-State: AOJu0YxX8/+AUvj9v8BrTciZnXO5Fcruecvnhg+5Cm398aRjVX1wSMxX
	DVXUwlhzr+tO/x/avWJpiHO/TZEDx0tyI31u3VKjJRi9MyeMgNVnQpRh3fsTJ/GUdewbTHqN3bf
	y
X-Gm-Gg: ASbGnctkQrZg4FpIGwgzuAX4Shy2omDecShdQLhA7qAoR4ewFDJ2AXJtyUzw69TOsfD
	JjLyeI0du+OCylC0eX2WVZEi4vsSPon8tqAyS3GOcv/VfJjBVJe6nOxQdSiQp4WkvqChCojk96h
	7NKRaVAbYuo6Z5XYq+5IVbM0DhspHicYq1DKr1GOJ59FSyHYCJ95EWtPEext2KEtPaeLpvSFR5D
	K05m+4PsC4zIe/hW3GDPlsXh5WhDlTdtvcRPN6td5oeUndtKUGAz9O+LIC8/cmRKn09hyppe2WM
	6guXkxAodVKXBeifhIpF9XFw92vqvWDDTac4slU8K88o4CRuoFrktgi4+JarPpmbLQSe0GjGKK0
	WBMU4o8ZOJbktWmc=
X-Google-Smtp-Source: AGHT+IHqso8NP2mkjGd2codcc9AYXMx3rITJMfiumhfwHLFCKjgzoXmRta3CnFxIynd4smfXKHkXFg==
X-Received: by 2002:a05:6512:3e01:b0:54b:117f:686f with SMTP id 2adb3069b0e04-54d6dc1df78mr5182e87.28.1744899948235;
        Thu, 17 Apr 2025 07:25:48 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d65e43647sm370096e87.58.2025.04.17.07.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 07:25:47 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] pmdomain: core: Default to use of_genpd_sync_state() for genpd providers
Date: Thu, 17 Apr 2025 16:25:08 +0200
Message-ID: <20250417142513.312939-11-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417142513.312939-1-ulf.hansson@linaro.org>
References: <20250417142513.312939-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_072549_810671_0DFD5CF3 
X-CRM114-Status: GOOD (  11.25  )
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

Unless the typical platform driver that act as genpd provider, has its own
->sync_state() callback implemented let's default to use
of_genpd_sync_state().

More precisely, while adding a genpd OF provider let's assign the
->sync_state() callback, in case the fwnode has a device and its driver/bus
doesn't have the ->sync_state() set already. In this way the typical
platform driver doesn't need to assign ->sync_state(), unless it has some
additional things to manage beyond genpds.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9c5a77bf59d2..695d7d9e5582 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2671,6 +2671,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
 
 	if (!dev)
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
+	else if (!dev_has_sync_state(dev))
+		dev_set_drv_sync_state(dev, of_genpd_sync_state);
 
 	device_set_node(&genpd->dev, fwnode);
 
@@ -2740,6 +2742,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 	if (!dev)
 		sync_state = true;
+	else if (!dev_has_sync_state(dev))
+		dev_set_drv_sync_state(dev, of_genpd_sync_state);
 
 	for (i = 0; i < data->num_domains; i++) {
 		genpd = data->domains[i];
-- 
2.43.0


