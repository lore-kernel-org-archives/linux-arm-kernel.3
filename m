Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5274BC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/QNlEHfEUZYvh9WH2X1qfGtuDYzY2qNWdQQnVhSVobw=; b=k64iVQSCPe6Su/7nFrLnSTslj2
	Mzz0yDjSIDfZbPTMBX5lxF4h7c2qNpkgYYn6rBU3s5JbZGg8ohH1GqxixmnJPz3+XJwHpSPNtx6Gv
	i1LBzBkhqy/rQxDHrKNYEtZmPbd3lkrLoOVtYljvj2FXraw2x22qiT2YURrR2S657n/9KJ5PMLl4O
	jvgDlP918RhKGq8rbo/i+SBeY6hW0DOyBI8FeykVW0eEfzvh682CoOrHEgrDQ7j1nL/ysFvJnExfB
	bvqnGYAgYiy3GfQsffwMyJWJT909C7h2Q/u9QIK7hrjMzJRgKfntcl1YT86inRqwb86QxQqN5mZMR
	BfXh9vcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFDH-00000006YMr-3Jnb;
	Tue, 08 Jul 2025 20:46:51 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElE-00000006U56-1gaY;
	Tue, 08 Jul 2025 20:17:53 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-747c2cc3419so3989930b3a.2;
        Tue, 08 Jul 2025 13:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005872; x=1752610672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QNlEHfEUZYvh9WH2X1qfGtuDYzY2qNWdQQnVhSVobw=;
        b=WjXUbpZ5BTIGq1kTdGllz5/M+kL19Yo/VcdnqRN50NCJls10V7X/xHpRX1soaiRq+i
         deSU7+IhsIlA3KWFjoWiCc/R91M7qufTe7RtDhE1wuZBo5VJu1WbR2LW7Spgfwf6+zzP
         ZvNmvA1i4laeU9vR2JwR/WvolAAZ67/tnvJbBOjZKMOkzWNBKhTElBQVDCWctEP24xwJ
         Tl5E+QjhQkC4WEaWTr1etS9nXte5Y4L+9GaSyKv5dsYoEITVoOWUY7MIw4w1Qkqudezx
         buyn57Vku6KJzRVchE3iJkVdmnhvDDOGmzREA3nTJ8fRSsuLEldEZKMLuyGdhKJOVlpJ
         ah/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005872; x=1752610672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/QNlEHfEUZYvh9WH2X1qfGtuDYzY2qNWdQQnVhSVobw=;
        b=s2E/QMqkSJjbWjewlRM1WMG9Yxs+c5+h/1AqJ+Z1mp4jcW9VFYMsR2MBIEfC4X6Ljr
         84x6/4aIsAnjdd5hnI5bvKJYl07IJhn2WjrCSF2rsuXT+ZCoXzBroz2thzHsfvP4kXqy
         7VL9Wr9go9gAzhVqmzi0s8EMrbggw7i9hXOtBiZ3W9ZL9TnpjFi282jy4lAyaLbAfT6L
         LazCiG4Rp9CwPoJAtPOdEA5A58ZCPWjsXYMW0S5fPvXlL9BPhNtJcV29C/RN6NIVQ8la
         F/0UX/6DjV43zA3sXlsvFT3PSG7bu0BOkem1xaDH30a6z9EGPWxrUnquH/mxivXwc1OS
         tqAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTT149Lr53ktFkfqb4hnu//DP2NAZ9N4I/QTmU9llbBTuXe6rL7Gcn7wyDWNPouOExFPQkSKyoxEIl1XpftbM=@lists.infradead.org, AJvYcCW4O3XDdKmGoPHv1LH2MyHl2yg3dGWVyrC3akDBTgjcbMshfYxpNXuQQJ3xheVW6MMcVagW19isOa35I3ZL1cLB@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/G0VVaVE6GYuj/w8uHvhLD5FC9WvhynfHojkUReCsAQwK3o4
	BQfB89kLvuWykwaZRYwhPcOscuBrW1OFcgcmsk2GEVMuaQ4q/YiKDR03
X-Gm-Gg: ASbGncv2o+obFdW94PRBzv+HqIgl3+MUpy3FtVeRcpzrebynKGaCeMCx+gJsgmzjCmi
	vFxYTJpT5TTc/Y9piJuxOtZfh0bFiSKJpOyXctTkfG55ME0wHglehOYxpjCaunONv7FboXDr7UA
	W1gTDVVDEr0UoS1sUz//yzvqxlOZnzjWmaohUHQC5AwVEitAOA5djiNtQUu+D5epJOYRErYZ+yA
	dXHnhRIKI55xmUrew1+P6Oa1t+cvgJTfZTlEWMXSrvqEhll15QFxE3o0Ph1jhqt8GUvLEDQx5aY
	kedfPgABJN3dT1USV6OkdBEOEql7lw+ZXd97V/+GkRgHIg6lrwKYeA==
X-Google-Smtp-Source: AGHT+IHbYO4srYMIJVFpXEofQgmzn6XNXlOmY818mJw4NNQt11WzJSfS6QV2PLjLjUQtpdhW9yWPFQ==
X-Received: by 2002:a05:6a20:3c8d:b0:1f5:9098:e42e with SMTP id adf61e73a8af0-22caf53c026mr334789637.7.1752005871552;
        Tue, 08 Jul 2025 13:17:51 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:51 -0700 (PDT)
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
Subject: [PATCHv2 wireless-next 3/7] wifi: rt2800soc: allow loading from OF
Date: Tue,  8 Jul 2025 13:17:41 -0700
Message-ID: <20250708201745.5900-4-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131752_438418_797642A3 
X-CRM114-Status: GOOD (  13.72  )
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

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 7 +++++++
 1 file changed, 7 insertions(+)

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


