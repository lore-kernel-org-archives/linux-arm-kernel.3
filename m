Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B73CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=; b=dRQEUtEAw5IVveiC6NAARNBRMw
	jb2s6w9ZUf1N3aDxSlvHLXKWoh5PejQUtX/BbdqmYh4YSKcffY55H5JlwjoIht7j4KQJGdLKAcxAk
	Y45ud8jinBX/GkViA4FUXWASCEiihAOzW/ogWsXVTLvEbaCcf4Ynu6r3ZRsfjsmkNxJ8Tk2ES/fiX
	qwCNL+lwUpjaAPl4dj/+o2pbaKtfZWpKbEjUAYKi44C8OoJYHy4FL5nkovq1CqqlnUk3HFQt60jVa
	UpP458Is4jwXgZjR3AeIBmQ9FMVrLYEk6c/vzorvQLaNij1aUu7xPFeB1B1eLGow4VUnknh9nNcHu
	1HsVuzrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6vT-00000008avR-2g9L;
	Thu, 21 May 2026 17:11:15 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ6vR-00000008atl-0BcW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 17:11:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-453903ee4adso3163247f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 10:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779383471; x=1779988271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=sHXvLKj7U47rsUgXK2C23j5p1l+Cxp1BiUpB7/3cFaEl3xTtLPiWX6LZGr0/rDd86r
         JWgkM+RQUOtCAEBP0dRiVdMD7gcIAG95WovwVVP1mAaPBvGqMH3mInqtMYJnhN3mURVj
         7LBWAuklLY0qOkujPwv2YyIqgZF2seyDe69P1J2a2BBmSVdfH4In+RVeq/kwkNTOw157
         AudTlr09ztRVZunktGpU1m4JZ2DilXEBISE00/ZaU55egfFjppYY0k2wYhPqCjvdJjE8
         uIXHzCQ1wZm+sk3oICRZcyIufYSIvF1ZTV+jGvqrP9RVB3PLCmUy7ljgOsDOFrFpxCww
         zEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779383471; x=1779988271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98JuQONnWQsI55kpTBrrRllxqm+qH6cTiMyVfzawqAw=;
        b=DaHJJlFZ3Deuj2cyTlUFnPgzsg86EHJZPxup7U28nNer+XZ3nJUE41MZiL7XXlnfKP
         UawuMDQaRvm8f5cqFwpWGqQ03m8LFl5qVdAmoueBHD4TL1iLRy0nAbZiUkslZSMnZ3wA
         TGxk/h5rCofdYrxux7QKpXIUGxXj+IHOhVuVUdAGqvRMoxh7/pWHQ/HapWBLney4NIVt
         axj1S0fehMVbhkRqRTN3T3r2iBCEbDFMxzfoknueEkI4UbLFi8fRqKaJLTZ5Mx+s+fmr
         0PYqe3quF3N168aAZKtZAPjD+qs4zZA8De9aggWG4OYp37T9FJXCVvL1xEykf99k1YP2
         IFHQ==
X-Forwarded-Encrypted: i=1; AFNElJ9oIuOA5+DrCQvlVH5oojhPZpbVPmdLyyh/6iWv5EHMTE4z0dF1oj54DehVWBgrg9Qctl/AGXrYK2/WxrlKEaJJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyAkLUEH31d6Ph9df3M/1PwkuBl6sHFmbkQ1OYmudMO95aeqhBs
	R7603VHES7g28ebxtoH/NOxPzZVhoLYK7C25N4hDreS998aert9uZ1AK
X-Gm-Gg: Acq92OEj7Si633LigvxB/vEasInQ6KZjN32kosVB6zY/Nj8ZZY2NaVCQdpndmgG/DCZ
	dPdg+8DHezc20IavvJ2Xja89wzbaSk/hXWxYnRszEnlUMxMMAyFUm7tGRwZ+BDCVX0jW2TCJsGa
	8K12pwl0ekSfogBeU5VEWk7yg67TViBot3IJCWtmizBKjuoPhkY6Yiyqqq7oenPN+IzP9ARHQlx
	7+Tt9Bg/YBjWpvdGymhudDGCdvAueQ2AQzMBfwFxFqVgMCdKY3778yx9s3QKm8prnzOQmX97ALC
	J9ST6KiWMzP2P0+QMjZGlNZ8JP3IGjgf15odA3+6MhgezfDpHzfTjRSKt4kh1qwCYSOQA7+Fuam
	epgNy68F5SCepyARg4iC5niYwXwUqG5ynEAYmYAQGD4Uq+5/DlcqY+m9Mwt5F6SaNTD0JSPKniD
	r34ljPEIRjcERBnogppXBdUhkMb24FnscHBpqbl/XK4yLibwz4Ea3mt2adwb91r2qOUlD2HVkdj
	k8xPrMyTj1cO6NsNRKhEhOdaaSJ1FAk5bSuSoIV6dAm8LSY1nyUDQljvZq4VhZMZYvb9uPPvJPp
	KA==
X-Received: by 2002:a05:6000:22c9:b0:439:c18f:5aaf with SMTP id ffacd0b85a97d-45ea3bf0b1amr6276246f8f.34.1779383471016;
        Thu, 21 May 2026 10:11:11 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7cd815sm6046116f8f.6.2026.05.21.10.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 10:11:10 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Thu, 21 May 2026 19:11:04 +0200
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Aquila iMX95
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-add-aquila-imx95-v4-1-5a7f86c824f5@toradex.com>
References: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
In-Reply-To: <20260521-add-aquila-imx95-v4-0-5a7f86c824f5@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_101113_100364_B8ADDE83 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Franz Schnyder <franz.schnyder@toradex.com>

Add DT compatible strings for the Aquila i.MX95 SoM and its supported
carrier boards: the Aquila Development Board and the Clover carrier
board.

Link: https://www.toradex.com/computer-on-modules/aquila-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/aquila-development-board-kit
Link: https://www.toradex.com/products/carrier-board/clover
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v4: No changes
v3: No changes
v2: Added Conor's acked-by
v1: https://lore.kernel.org/all/20260506-add-aquila-imx95-v1-1-69c8ee1c5413@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 59f7f168bf7c4..ea4cc98dadebc 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1507,6 +1507,14 @@ properties:
           - const: phytec,imx95-phycore-fpsc  # phyCORE-i.MX 95 FPSC
           - const: fsl,imx95
 
+      - description: Toradex Boards with Aquila iMX95 Modules
+        items:
+          - enum:
+              - toradex,aquila-imx95-clover # Aquila iMX95 Module on Clover Board
+              - toradex,aquila-imx95-dev    # Aquila iMX95 Module on Aquila Development Board
+          - const: toradex,aquila-imx95     # Aquila iMX95 Module
+          - const: fsl,imx95
+
       - description: Toradex Boards with SMARC iMX95 Modules
         items:
           - const: toradex,smarc-imx95-dev # Toradex SMARC iMX95 on Toradex SMARC Development Board

-- 
2.43.0


