Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B62EE20A3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LkO0ZDFXsTERryZDi+Xw4hkZo9DKWHuedNYRkbdXlU0=; b=LZ/Jmm2sX7dHQf
	DOI8c8zqRtIwZ0XM9SnBHOB3jEHwdyMSGaW9KdLvjS4/osCNOO9S7xObjh7jclbVW2GC40VV8SvI9
	Z3tMwSV1wtIWjvLeS0vUM2oUlE6JtGKNG0hLFuaExYUmfVyQnzcpN+rdhuPZ2qy5QE8KLstEELNMl
	IBi4xcG0ARMqC1VndjmWseBmQxK0LXnUUeLCRfk74D3+8EE5VSCi+6B68RDO358coL+rRHpM9PFcc
	TLP5S5pfKpLPF1Sdho2cSFvq8zlOqysgAUgEiE3NRsVhZcr62OXO1aNcAxwycLwGzubg6hfeQLMQY
	ggIkKCaBLIhw1PRu8LXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM4t-0000000BNUa-01yZ;
	Fri, 06 Feb 2026 13:40:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM4q-0000000BNTl-2Ddm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:40:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-48329eb96a7so867475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 05:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385251; x=1770990051; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LkO0ZDFXsTERryZDi+Xw4hkZo9DKWHuedNYRkbdXlU0=;
        b=RnbTRTWAOMLHJKxinZmfDa9a8CMJYg676ckkSQ0fok8IE31A/JEIGk9bLfJFsv9rNf
         bYaCmguMS78cxE+965BfSN549cfov9kSQc5chVYrD3juuZuarh5fsBU1iq5KcZbIN9fY
         yKGZkDjYo7YJ9aO9FEdnPEwMksv/rJav5/lItMwIcJdRh0oV69p0JwcK4PGxpU6hVhl4
         fCB4b/qFfsgH85R+53O5/E7TUiIe7aiFmUisQJB/BZl3ZwiwVjP/CmWUHG4cDSXpe/z+
         ybhBuusagSRZl+bSEq4JNTj3guY3JlOEuN11GsIRDcLK9vUNx6520qbWbLLSA2cySCyo
         5Obw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385251; x=1770990051;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LkO0ZDFXsTERryZDi+Xw4hkZo9DKWHuedNYRkbdXlU0=;
        b=ZcWboZAXcZM0w1oIKC+BY/l5VlEG2xr3WZmoqTMJ0yG5YlQlG6Drml/cPVCBudmgm6
         fRT0UVcj4A6o7E00gjwNfBPFxPRKm9BtjryCvVpn0N1bC+yk6yXXyqsAzKjw3BMC1vin
         5ciMQQC7JYbMzmNYigfF0AkGTV4t5icEyXRwm02NZZgKvrjE/lZEJyGx4TBstxtvC9LX
         2i9t+EgsURpnhBvUI6DqnhhsDeXJ5R2khw7oXZlFGPneZ6gsHvYXQyLIBn45ARk8Lvhy
         rGVZPcREzLwL0s2tVoMDVDo/yzM3kYRyNIqfOq6t0kr49lcBBDXm9iOD/tSJLV+pR2pX
         WvZg==
X-Forwarded-Encrypted: i=1; AJvYcCVv3GfR2mPU+htGA7tGg7qTt1gDkUnHcPb6GAqeH1nUmCV8w9g/b1Y3I/wTnuZC7gOKV1h/0vq9BGl7Sdc2pK/K@lists.infradead.org
X-Gm-Message-State: AOJu0YzsdH0ggoYYJtph6oRP0XsUWrucP/kA0OE0N47ndSHIL2ExLRDY
	vpAu+e4jX1xxLXydaSZ7StfBGAXEkZNxn0v0ejSuvr/a1A04udNxLJ2A1iasd/VwiGk=
X-Gm-Gg: AZuq6aJfrzjBr3nQXKjOKMheZ1t9Luk7I+ZfdC4dPyNguNrSWgdpKr+IEVi0kQMp+4V
	IpwrV0Tc6ozSiS4rAjli4gqR49xd0fuWCOs7s0Z3wEq5fgx0LPNvfh/sdu/SDyL8AUTQqHpk/2G
	GjV5J8q3XPh8rkg+BOwYkhBBSuEIMleVfLTVaMQI0PY+Z6umNKafoTp3xyj50eYj4KOMzQJh1bK
	xGYABkMQOr9EhrXmC1bwR4aLOOCOzuUp9o3qW9cfnaEvNJlu0dgpzFwonycchc+GeACchaotpXa
	wS703t2Jmgxkz4CocNW96Ogbk4RCGs0+FYVuxA8l4zjEYi1iMK35hIHz3xm6a8bZJ2h6CxE6wwe
	BLshDZmne3nZ4r3Wwkz2+DXwUIwBLgEbjS+igUXVXNOcNHfjLGcIZoJuIFeY6HWS8hMNQr44NPi
	ShR08oYNAmdwj7HV6f
X-Received: by 2002:a05:600c:8b61:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-48320966711mr32154065e9.23.1770385250573;
        Fri, 06 Feb 2026 05:40:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206b8bbbsm81547395e9.3.2026.02.06.05.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:40:50 -0800 (PST)
Date: Fri, 6 Feb 2026 16:40:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, Neil Armstrong <neil.armstrong@linaro.org>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] phy: apple: Add Apple Type-C PHY
Message-ID: <aYXvX1bYOXtYCgfC@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_054052_608007_A7C7DDCC 
X-CRM114-Status: UNSURE (   8.47  )
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

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Sven Peter,

Commit 8e98ca1e74db ("phy: apple: Add Apple Type-C PHY") from Dec 14,
2025 (linux-next), leads to the following Smatch static checker
warning:

	drivers/phy/apple/atc.c:2209 atcphy_map_resources()
	warn: 'resources[i]->addr' isn't an ERR_PTR

drivers/phy/apple/atc.c
    2191 static int atcphy_map_resources(struct platform_device *pdev, struct apple_atcphy *atcphy)
    2192 {
    2193         struct {
    2194                 const char *name;
    2195                 void __iomem **addr;
    2196                 struct resource **res;
    2197         } resources[] = {
    2198                 { "core", &atcphy->regs.core, &atcphy->res.core },
    2199                 { "lpdptx", &atcphy->regs.lpdptx, NULL },
    2200                 { "axi2af", &atcphy->regs.axi2af, &atcphy->res.axi2af },
    2201                 { "usb2phy", &atcphy->regs.usb2phy, NULL },
    2202                 { "pipehandler", &atcphy->regs.pipehandler, NULL },
    2203         };
    2204         struct resource *res;
    2205 
    2206         for (int i = 0; i < ARRAY_SIZE(resources); i++) {
    2207                 res = platform_get_resource_byname(pdev, IORESOURCE_MEM, resources[i].name);
    2208                 *resources[i].addr = devm_ioremap_resource(&pdev->dev, res);
--> 2209                 if (IS_ERR(resources[i].addr))

This is checking the wrong variable.  The * is missing.
if (IS_ERR(*resources[i].addr)) {

    2210                         return dev_err_probe(atcphy->dev, PTR_ERR(resources[i].addr),
    2211                                              "Unable to map %s regs", resources[i].name);
    2212 
    2213                 if (resources[i].res)
    2214                         *resources[i].res = res;
    2215         }
    2216 
    2217         return 0;
    2218 }

regards,
dan carpenter

