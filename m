Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B68BC5DF83
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 10:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=; b=Ai/3aq0j/Zy4A8c8yoKXbk6sZC
	q83vfss1kKLigmBYPjrg2WSU6QRzZkpGMnyImCy2t9oX5S8uNf70L7VMNtP7EoMmVtkXi4s80wYZD
	jmQcij2KUSsO54Q+B7oRaPrKS1DF5Dpc+lj+PZhtVMW99weSmB/dwoYuN+8ChRWdagIrWn3ZAwStY
	RfQwVs4kXbQ+meZUCMsnncJHqSvbHySmqHmf1qM2SFOnRIi71RPLRnGESoOS3ZD8bCdelfpeRpgxY
	ziCj66dBRJ/MoXBL8d/B1EjLjXFTzXXNVd8TppiSuS2htkl/yyFViHeCDSfRRChrzMC6JAZw340v8
	u7A4jKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6k-00000007ijj-1JDx;
	Tue, 18 Aug 2026 10:31:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwH6h-00000007igF-0GkL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 10:31:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493b966dd74so29945655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Aug 2026 03:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1787049105; x=1787653905; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=GDqbRHunSfEKvSjeistkktfcIVAf0ssv/fey0LfSUvk3w4Hz9IRf5d6YUuM3zIONSd
         xxj7rxnEJHRTETuDE3s/6UJ1rPEmchXZB3kJSs9OT2DYdrZXvNj7Z39ajsOyhttENXVj
         X4Hcm2hJpPGA9V+b/gZQNs9eTGlHYoKNOEoF67HZ6uDV75WGgGnaL37O0T0LYImTdgkm
         Sc7mi/WeC9ube9oQsZhNkv12g77uEa0w+u2EnCPieq5tCRVBiPWYwFr7u9ZAII/y5Wjw
         /y9kBaE5Ti1ipuxV1LMI3zXVy+2o/njMXiRHexVviggzTqvQ1Ck6ipPMxYlHWgbJhfzS
         0wVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787049105; x=1787653905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SehFAIGV4EScw1eNaWWBsUyEtfJAkEOaG1RHubt8kHo=;
        b=c4crOmyvkhCyl+kQBWpoEfLHilhi8FU1u8x7nZ7zHhuN1NEjvfEC6rLxklrVzbKYtn
         XJrIw/Hu+jCE+NyLy8i7yUVNsN4ZYaQnkjTUf5XYh/DpSVOLeWQG8YYXUEMqmBp2BcOa
         JubLRJi2qwAd1vgXkbPWOqTRn610aNIPQ5prBuekO9mn5iaC2cM5yaMTY+cOtkBh2g9I
         PsswywD2FEcqvEYpO8JZK77SJR8ZPuP1Clg3jqPKYHA+bygjLXAgtLZAfNcpr5mKhZRr
         uXUT6kXNnKuhpx5dCfx8kz3tsxLgxdHf5c+m/knd/KROjKmReMS9ufCh7ZVwNrrr5JYD
         JVqw==
X-Forwarded-Encrypted: i=1; AHgh+RqLjtbhcrbu2ss2W6NVbKxvp5BJZqb7+EoG+/GaewHioMJcpgSq32hUu9Lwlxuv/8nKHTXtyl8NrKjfq1+WLnXS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6R9FUspU2uMidiosTAjHHXcBJ+kCmPBSTKgS42adYag0GE0E3
	0uQT1AXL/3Q2TKg9029P2qDf7GxOpEkDU3dZdGWMYmY70AmCR6rItM7muCG+z9wIUNA=
X-Gm-Gg: AR+sD13xdL3h8krNwyyssWOVcXr+uiv36GwgIFSdbs1m6MuTIXoL7FmRIIsf1QcRlSp
	V7C+tNEe3P9ZbEMOKzRy5/fqyjhTEEUj1DXrkM0DMxQpDFDI6IWIAfeeBAeYMBUcUdBcPZ5Nd/P
	cYOo7TCwciocPoMy5weTxi/cCB6wKmSk9lI8wWRrLVvafBy3HzLKSewPCYbleEZ9c8idMxe7VM4
	tDRrEJSxPhkSb4uJmLnNuUld9br8qVBbnWjMa+wGQ9idpY2ZLFv6O23QhLj2Pw6ch2dWZd86MGs
	kaM5hC5BdCpY2/3xuRbE37IU4BNOMaeSl6fSNrUTAxtckrKgXMirS+/vpPmTsMhSIfY1AyUWjZe
	lyqeLESqPQKDQSldmm01ecja2D6gjRBOm6bvCWBdEUQJPx8MB6KWHOJGpE2ZBQI6SYvB4shPHS0
	TgWGewFvbJAUq7mc+ErpPaCmrsijxFdtelzkE3XMqzr5OpXhA+y/16+IK1NRWR0QPM75duBiI+F
	wZMlT8bamDdzuTrpbWciALd6HibwqrSTD/fPJHAPb0crFiw9HZPht2broD0
X-Received: by 2002:a05:600c:3049:b0:499:781e:25fc with SMTP id 5b1f17b1804b1-4998792e359mr338967655e9.3.1787049105086;
        Tue, 18 Aug 2026 03:31:45 -0700 (PDT)
Received: from [127.0.0.2] ([188.111.3.154])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499960988c6sm246025575e9.0.2026.08.18.03.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:31:44 -0700 (PDT)
From: =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
Date: Tue, 18 Aug 2026 10:29:15 +0000
Subject: [PATCH v6 2/6] serial: 8250_aspeed_vuart: add aspeed,ast2600-vuart
 compatible string
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260818-aspeed-driver-v6-v6-2-fd7cc0b338ea@9elements.com>
References: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
In-Reply-To: <20260818-aspeed-driver-v6-v6-0-fd7cc0b338ea@9elements.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 devicetree@vger.kernel.org, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <git@gregoirelayet.com>, 
 Tan Siewert <tan.siewert@9elements.com>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 mfd@lists.linux.dev, andrew@lunn.ch, jacky_chou@aspeedtech.com, 
 yh_chung@aspeedtech.com, ninad@linux.ibm.com, anirudhsriniv@gmail.com, 
 =?utf-8?q?Gr=C3=A9goire_Layet?= <gregoire.layet@9elements.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_033147_132868_298E7275 
X-CRM114-Status: GOOD (  11.77  )
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

Make the driver compatible with the ast2600-vuart.
Enable specific configuration for the AST2600.

Reviewed-by: Tan Siewert <tan.siewert@9elements.com>
Signed-off-by: Grégoire Layet <gregoire.layet@9elements.com>
---
 drivers/tty/serial/8250/8250_aspeed_vuart.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_aspeed_vuart.c b/drivers/tty/serial/8250/8250_aspeed_vuart.c
index 26fc0464f1cc..6afa2f4057e1 100644
--- a/drivers/tty/serial/8250/8250_aspeed_vuart.c
+++ b/drivers/tty/serial/8250/8250_aspeed_vuart.c
@@ -560,6 +560,7 @@ static void aspeed_vuart_remove(struct platform_device *pdev)
 static const struct of_device_id aspeed_vuart_table[] = {
 	{ .compatible = "aspeed,ast2400-vuart" },
 	{ .compatible = "aspeed,ast2500-vuart" },
+	{ .compatible = "aspeed,ast2600-vuart" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, aspeed_vuart_table);

-- 
2.54.0


