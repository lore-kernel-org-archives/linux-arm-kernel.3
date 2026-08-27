Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5323C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=; b=pmv6VOzh++GDl7BsOXVUXf0adk
	W7f/IR8b94u+d67Qv0n+DM/yZC16TCdqQ69TW1ZGXEA0P32lBn10YtEnR51b9q6mopNmchiEBRylt
	K/rZV827+m8Z3RG2tfK/q1dMDilKNKSaKbK/l0840z/htYp1XSvaD/YuuSavX5D+KiOJfkem0HJUo
	cfCU2SEsiez8EWXUxEteoyUS52bGgH2nr/NhpyiVmy9rc75wEu7qsj/dIMN5gVEqdVjY1vcltS5Zj
	RMJ5uP4pHMlLc5MTrgj+1dQISk2eeUsp1UC9hc90n9Pk2zaKITNhjdBqfuB5vMIAYoEqMXng7EY71
	EEf7+Gwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiY-00000004DcF-1nLz;
	Thu, 27 Aug 2026 15:08:38 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzbiR-00000004Da9-0cl5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 15:08:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-47db714766aso846736f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 08:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787843309; x=1788448109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=YJOdw+xBdsm1/IQNDR7xrNWu84r75RfghoDe9KRXpQoSXpbPc8GAyH4AdE07uO13Li
         PMVYzSFmSFzaeHIahW1g+Ki7xrTjibRT3IDfKJ6K82Ewxw/0uWCftHM1Se6ldXprWfjl
         YsI3YDaZJSa0PgpHBDYdkq5XB/Tb4eVoqgoK2ZhG0lewX0c2Ue7unOZLOMWIK77zvoVN
         PvYVG4Ft+HYvvRYs4SezJ+hJ21kHUkDR8zHQQD0j5v5IfmK8vH8+ts9RDl99v6nsV/rU
         KQ60Ia59vhE4gknakMGVBUZS8pMZZLAV0MN0Uus5gasMKgPS5oJOZpPE9NMMms4MnHtX
         E7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787843309; x=1788448109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TqkMmON3N0nWAQFU0GAIUZAQN0hk7LFNlz724oqocVQ=;
        b=Q+ddesSu56rmt5PqXRrItGqJ81Ythjhm+ZEyJQtVz6Dk4JyXJ/jGDkW8oCPFvTtKYh
         O+Ci8ANKGP3EJZ6SxhfwJsdtaT8PBRXCVlPLxyfu65QZUVqHBSGjecPkvzrZVtCFaIcr
         cSsjy3Qv9TGdJjbZ0+AtAHnTCIwvKsIwLHS0KizYehAXGtkJJSrJ3Wff9mTY2zujjsQz
         4kwwpt3Wq5eA6R29Qy/Jmy8ZthCmAIUNv5A1TC0jHPAl9+5H90ryuaH+XopLmvPjTHX9
         JEs7GUN0jLL3Vzjx1/kWQN23oB45tmn042bYq8ZjHpxtZ0LUPnHAcMrAYGmcqxCInKeT
         kJZA==
X-Forwarded-Encrypted: i=1; AHgh+RqIdXmHSQcY/7rS2OF9QXo9T7JiKDuUg9voePdHlva04hU5jRIvrq6wJLwrYUpFYEIPYW8cRSFss+QeFP+6mFoV@lists.infradead.org
X-Gm-Message-State: AFuF++kJ192GzFizGqii8SumO67hye01CcsnKoaod+mXesSwgdnISIza
	wnsj0yCN3/bnVYNid4TNDSuJajU3NwlBuCEgR9u4gKYmv9yzkVXwIS3x
X-Gm-Gg: AR+sD102pWwzDRJaTc7mAtwZjX8WDXN30Z0zU1RNmy8iFdaMteiozvEandyu7G51pus
	r/XI7q344t1G1+xvs0UPZzfsbH8FdFa+4YXvmzNdhoNzMTOtrNAecdtwFXWSsZvAll4+xain0p6
	LE/Kqd0NxOMGIa4j3shqfJNRVbNDnwohey+MYG1tpY7ymz7GtpzciTOJ46mo6/6zK1Yql84oOaB
	m6nuyV7nbbgd38z6loOxzokBl1YtqCZDr9WeNw1Zr04MAQSDGoNFOy65awT7zIPq6MWbqyXY8CF
	S8zxzYscpCSf7BJtphoNeH4leqO6hicJd/CBaaHYDBEvXTcHR9+cL4qtu4ORTN85jZOqANeoD8u
	wfvwds2rsITCeSb4tTYV7+277BIJ/j8L4tXoXqTCHRQTt2N71WTW53Qx0KjWuF1MnT6c9IqZN5k
	ATcZcKK6QqdThSF+ZDktZ+EuBjAINR+aAbTx1MGfMdrrNL42NgczCYdDgAcKofioWEhcTOwvY4N
	NPH6EBy4R6TMQM=
X-Received: by 2002:a05:6000:644:b0:482:e658:7a39 with SMTP id ffacd0b85a97d-482eaba7f73mr9712719f8f.11.1787843309482;
        Thu, 27 Aug 2026 08:08:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([165.85.187.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e279eb11sm10247151f8f.8.2026.08.27.08.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 08:08:28 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Thu, 27 Aug 2026 08:06:56 -0700
Message-ID: <20260827150657.1657-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
References: <20260827150657.1657-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_080831_213774_F02AD01E 
X-CRM114-Status: UNSURE (   9.64  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..5d9da745b715 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1535,6 +1535,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0


