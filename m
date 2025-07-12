Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139CDC83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 21:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=; b=YK18b7Q8PY59WU/hFaMVBPKD3Z
	0gzmQzZsGz5lIVK8NAkF9yP0MciL/V5OgN83uFy6twI8gfqa5spq5EW+oAEzsxVVdPRiKYKje+vkt
	PVi5HAASbuhFz8p+ER3HjnlSZDQLX3wqPNzZjccS0iUzI+Rmk1nVPYAgnGiNtJ+NFy5G1iDnTG7n3
	bQT27PB3bPCcWd0R+D7lYlNTLelnbAtsMJBi3D8jIRPkYLG3CBratgVvQ8ltDAw39iKNMBo4n6nCN
	IKmFB8Kc43VU/XVNXDON3Fh0/q6US1lpa8w4erVzi/LHCa7r1cNAyaUvu1o7oLXLzkdtKmrenGyke
	ZU/mwMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahYT-0000000H22j-3JpY;
	Sat, 12 Jul 2025 21:14:45 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uahOw-0000000H1Dc-30z8;
	Sat, 12 Jul 2025 21:04:55 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so2810228b3a.0;
        Sat, 12 Jul 2025 14:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752354294; x=1752959094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=;
        b=jHyrfn0tvegO6cXbXPMK7Bbkaxl0ahhgXHz4aJkkgqz1m403zI/1pX42Xt539in5Ux
         Dtm82cr7+N2zwt7ZtR3MjX9wrDswI1DaHF9YQQkIUlWUDH5Qd48gLwA+kwYnrf3cEzaT
         OZ4Pxkw80S3tBXli7kTAem9pLGmIclqPkL/5b5AmemE7QQYWjAMKIhDF7qRGi5tS1aPj
         gdba0mxVtlCwwOb1e9mLR9iTBiu9JqsyNCQ5eV+nX8VBT6Bki3G5TGaFGMkjrit9M7Hq
         nSXgJcA2cM4at65NrfwhSRSD0Axk2JpaK+cdsxxJQGFteB1DN4L+i5gpHkiGubWTkF8p
         hXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752354294; x=1752959094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aL2X4PSlvKw2OWzjEtTQ+YQrEzIWKJ93JS59r843O7s=;
        b=Y+f0U97uxxhaLmIObC5ri8O3ZPTJMpTSTyaESS1/Vxhsf2nb+JLTiPJknMt3PRCAdg
         fVMfaZDjwTq/lLZcJxMAkzObdM3rkQe8e7nkELdmIHzzF+NY0KmJ/zK1+a9ssClfxmgt
         0AmI+RPnoR7Nln7WHuTkw7PQXAz6GoF5LDXQ7stjTb9SttiNOdl89t5OWxz8a/57QbVe
         xj5l7MWfbWSmhlbjfP2cemgxN2DWgJ24MbpC/hN6IKL1nx0402cxFcjWf4bedYPt/Npv
         1jRqTwRNpgDk8qZWbMl2BYqTAEWMMrGWHzcmwxLuC22+fUW+/bv6L/uUQ/aFLET7b9G7
         mRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ0LAwdoCszrMWiIUUvd+muvbm4PJgmQTUiVTFtDrsbApt1VvUHV9qXBueS0vt57lGVPBgePDFnLiymxcswoE=@lists.infradead.org, AJvYcCWkpTyr56tqsb6Gu07lW0G/kOefKDXqZmIcjS3Kgc2/cHhgl1cfCng708Ri/sDyN3g3PrE41GmmlUixZejA7+9G@lists.infradead.org
X-Gm-Message-State: AOJu0YxwPg3fli+f15yjcTOeFeZ0sexkIMxEo0cSUJfXRVA0ohlGkTJl
	qORNn7s2YvFqzHt50RqIgMClJ+ccOwDylHPVdMWvxMljRTAjSmbQDAbE
X-Gm-Gg: ASbGncsEh3ZlOe7uM+YjE4WM3jtXslcfzk6kgWqk6YYAf1F8Ws6ab9DoZwsP7upSMOA
	bZY7ReNP3X+SIz6uDY0+GR1lqK39fSOjHfA5aNZCKW71YBtowJKBZ15/pw+ISP1UODMmWVOEUbt
	pbGfHVM41iHxie0V2gWs6MOMhHyatQIHRBKmprM127+Wf5om2E/53xZdIOzXOBqaq4BkEGIMG4V
	cslg2lhaWu6Ipq/mWnU+yHxnB/dX7qXtfbWL41F/ZIzHYVZ/Oq8TOCDspoSXJ5FpsYGYOsAvcLl
	LTlhk7GUZ+h4gGCgC6tyriXbwBX6ucqQh1PeXD/vMVFrSKYJtjQ2gZb0XQDhhYxkQZgNK4ZIYns
	I0vqkupVjIz/L/Q==
X-Google-Smtp-Source: AGHT+IFVM9eIPyUa1MSyRIq+YL7Q8u1+8iMgtoX+w9Iao2/yT9qN8qNzp7afO6cMCSrv5R/Em19RlQ==
X-Received: by 2002:a05:6a20:d486:b0:215:df3d:d56 with SMTP id adf61e73a8af0-2311fd0281bmr12030929637.21.1752354293932;
        Sat, 12 Jul 2025 14:04:53 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9dd5d30sm7988645b3a.5.2025.07.12.14.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 14:04:53 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv4 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
Date: Sat, 12 Jul 2025 14:04:44 -0700
Message-ID: <20250712210448.429318-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250712210448.429318-1-rosenp@gmail.com>
References: <20250712210448.429318-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_140454_749507_55022A6E 
X-CRM114-Status: GOOD (  15.97  )
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

Add a single binding to help the already present dts files load the
driver. More are possible but there doesn't seem to be a significant
difference between them to justify this.

Use wifi name per dtschema requirements.

The data field will be used to remove the custom non static probe
function and use of_device_get_match_data.

Added OF dependency to SOC CONFIG as adding of_match_table without OF
being present makes no sense.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/Kconfig     | 2 +-
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/Kconfig b/drivers/net/wireless/ralink/rt2x00/Kconfig
index 3a32ceead54f..a0dc9a751234 100644
--- a/drivers/net/wireless/ralink/rt2x00/Kconfig
+++ b/drivers/net/wireless/ralink/rt2x00/Kconfig
@@ -202,7 +202,7 @@ endif
 
 config RT2800SOC
 	tristate "Ralink WiSoC support"
-	depends on SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST
+	depends on OF && (SOC_RT288X || SOC_RT305X || SOC_MT7620 || COMPILE_TEST)
 	select RT2X00_LIB_SOC
 	select RT2X00_LIB_MMIO
 	select RT2X00_LIB_CRYPTO
diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index e73394cf6ea6..db8d01f0cdc3 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -243,9 +243,16 @@ static int rt2800soc_probe(struct platform_device *pdev)
 	return rt2x00soc_probe(pdev, &rt2800soc_ops);
 }
 
+static const struct of_device_id rt2880_wmac_match[] = {
+	{ .compatible = "ralink,rt2880-wifi", .data = &rt2800soc_ops },
+	{},
+};
+MODULE_DEVICE_TABLE(of, rt2880_wmac_match);
+
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
+		.of_match_table = rt2880_wmac_match,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


