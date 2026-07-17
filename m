Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02DEC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=; b=N8M89qio9/bVpbRAdJTg6dhh/N
	Bz7A9uITcj7ZoLVn1ahqmXKNQwZ18lNn7MCNbJZhux6ngRcefXyZerk5Prfb1TZZ2uuOqvrgerI6h
	H36MA1UvtmnoUvYGiKuCMLK30kkOulHIvOTb+2X2vU7uiFtDor/E5QFSlQbGm1gCf69KUzNOGDZLE
	hX4OtCYlqRGT8dzedcCEdP6yJ0lUZIItFcyGNJlzIno9qEvVzOpwLCZ8hN3giVp2iXQ2Vvr8dNvx1
	ixotELP9XDs0pVGnkrLYepOCGUHvt8yurQ/xVEi9K/P65yaeNDK2CDfcy7xDuzNHv+dl06K8mqtNo
	NZybs3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTp-00000001Jm1-338M;
	Fri, 17 Jul 2026 06:55:29 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcTl-00000001Jct-1EmG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 06:55:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493f6de72faso8928715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 23:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271323; x=1784876123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=EWtFKS0lvarg2adMbzkkNS324U1TzdBxtes/OE9BKCD1W5zBAv5xvMlPdx5EmBoB/I
         6u06iAx2NtxRZOTTROJyiVTSTzcrQUPlX12Ju5iCWEP6PR/H3q3XIwZ/FgYAxiJn2G6O
         X7MqxgzER8jm5vQP6XXlqcSUohdNYuLyIq/PPPZVPcJMIzgcdO/0SynZXsP7YauQlQEB
         uKrGGoXWt775pY8mWKuFRRVqitSPGq08wt2fzTFPXiO/s6WIpTNs6AZQ5iUQhjjenO6g
         no48Koi8eXWmg5k0MNDabFMmvn1ZwcK8Fh567AgpCdt0+FBxF2up4eWcr6VCIOcYbOtT
         jhkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271323; x=1784876123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZdXEh1+v5JoWmC/SQYTMdZgOF636AdT6/MfmObt9bDU=;
        b=WdN4VKfQ7AHXHmIBIgJYlepMKGNdfYOL84jp4104jLT8RQh1pQqIOlZPcQLrXikbrh
         KFHKnwBWuKW8vWtTD3i7nAkV23pJZkpVvUPEJzgWcyl4fUxaYlnIhoIUWOo2ftB+Oa2e
         ZlefJ8QcaFV3+IlLfO7t6XLvQUK2c48WQ1YbTSc4/EuTMM2QqeFJJQ7uhINOTjXyrsmA
         PtMhvE69hC/GoJsDwJxWA+ELt9lHWFmEveKv0jGmPn9B9LdGHEP0hA/Ink2ET+PnRqsC
         WaRlWaR/pQPHuNzFGfljIoeJy0HyA0n3o26wsdvxPMbUm07jvlZdof9+Kjs8ads2DxfF
         QvMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRsE5/BpJOdoNiG0cGLPejS26Vce6Bz2iZJo1MKmKefaqDRvDwPgYaWNV+mzFwojxP3/FIWV1Q9jAHtIXGFwiC@lists.infradead.org
X-Gm-Message-State: AOJu0YxuMlJo6n9oO9rwmQ7BsEF6nAZsxs7wqRlcAgDWZlX3jsfeTBBb
	3jx8ketP1xPvzfFElrBFF6z+dVSMrYPAAE2w44sOdHD9/TGgstVJ3yw3
X-Gm-Gg: AfdE7clQ3lvwoLM/wecoJ7IkjvEzg89jUrrTpcFpX5MaA4XcFqNRvU5w5ejbZjW4EFH
	ZKeoV3LB3t9wuj2v34llhcNh/00WKirjN79yb1SXNyPnxbPSF8xQzWqF0iZPot5md7S8eGT6lb6
	/u5RpJC/9wDZLPsaAqY0fS5uNFTf6+WmiunTlwgAjofm1W+6MtQWxiqkAERuL+Ku9OmiZnTfuBj
	4UVlj6xEP0NaZaIbTvkqCMM24Yp77PhCLOXvPFBhjdjKUuA1hsjGRiDC1BEekvi5F5EcBtiGFF3
	XVn3hIdwoykGhJojwIjUYdHmd1aA7lyTyrt+giswkELH9LJjYGg/HoG4A8RCXTSbqmt6jbZwY8G
	wj/IgNxcK1e2JZKvNY9ldhKSLA1kt4koVgHXkfzsXgEyC0WmW86zkRDdGzzvw8/D3HbeKV7oTZi
	g6jM0FHiTmQUN51/z69UPXC5OFaPHsIebzB4xpBA1Ji7uJFrEj+1j1bUqlOxfkBqIpc0DAYg==
X-Received: by 2002:a05:600c:a210:b0:493:c566:7bd6 with SMTP id 5b1f17b1804b1-4954a341bcdmr7407915e9.18.1784271323320;
        Thu, 16 Jul 2026 23:55:23 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-495499f3f99sm24260835e9.0.2026.07.16.23.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 23:55:22 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Saravana Kannan <saravanak@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v9 08/12] of: property: fw_devlink: Add support for "pcs-handle"
Date: Fri, 17 Jul 2026 08:54:08 +0200
Message-ID: <20260717065448.1498335-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260717065448.1498335-1-ansuelsmth@gmail.com>
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_235525_354774_F0242704 
X-CRM114-Status: GOOD (  11.46  )
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

Add support for parsing PCS binding so that fw_devlink can
enforce the dependency with Ethernet port.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..91c3e3931fa6 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1415,6 +1415,7 @@ DEFINE_SIMPLE_PROP(access_controllers, "access-controllers", "#access-controller
 DEFINE_SIMPLE_PROP(pses, "pses", "#pse-cells")
 DEFINE_SIMPLE_PROP(power_supplies, "power-supplies", NULL)
 DEFINE_SIMPLE_PROP(mmc_pwrseq, "mmc-pwrseq", NULL)
+DEFINE_SIMPLE_PROP(pcs_handle, "pcs-handle", "#pcs-cells")
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1571,6 +1572,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_interrupt_map, },
 	{ .parse_prop = parse_access_controllers, },
+	{ .parse_prop = parse_pcs_handle, },
 	{ .parse_prop = parse_regulators, },
 	{ .parse_prop = parse_gpio, },
 	{ .parse_prop = parse_gpios, },
-- 
2.53.0


