Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3159C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=; b=wQO07NHH4KGZgb8DXJymI6/gQV
	O6AZ2Lw9vWrKnnTdAvw5oV/+979QqdyCZf0+AfQL5Bk7l14FTXvXyCrwwP6MuA/OjW+8NdpafIuR5
	dVReRarL5OoXd27WuFZcGrqssImB7TFxzmhrEIipj2CHxAS2r0FNUtaW3NtqspMtakVkEMhmLbyb0
	foy6AP1NLr8E9A/Hg/H8DpPZswAZDQ9l//raHNgvJ2dSSYxPq191SQ3DfeUZBqPl5h4+YHXPEJHVq
	mW3cTlWpF1HeX8rEvEttupgn8hrLLyzxmWFL1raAWvr4rMTz6iigc+aUZ/SSfU/DbiO6f9Nw20JFD
	pxzK7T8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Rc-0000000878w-2SwC;
	Wed, 16 Jul 2025 15:53:20 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc4Mk-000000086LI-37Cx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 15:48:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ae3be3eabd8so12504666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 08:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752680897; x=1753285697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=BzdNtRc+saWJJ1f+Cvv7uM6+WSqa4UuN2hMleml7dv24Nfwato1mPhmOFQyDpbzooA
         Zi/sj2sNoE7L8Zxbm04NMAGVWGTgpXXQancOILZyU4jEjNBSq6z5J1TiDEjilx+aLIss
         xrc01tIEo0XnfLu0ZlkgsRk0/Np0RDQLKMpNrsXoMBtzt9iOTQHFtlV3uGSbMMv8X4yu
         xLAB3j8sBifslii9tQlVF7fNvmPqPmtmQ36MNroZRk4GVCcn2vdqMEiN/TyzGg62vn67
         nmvHmeuoivPc8/3Rf9FTboZ0+1z6F6Ra6aDC6EJV0ZEV3wZjPZ82U5li6O+4MOmpeJkN
         uZMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752680897; x=1753285697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEbSpxuj6iCO3S7ehFSQfszMAGt5vRbG8XfTrlB69o=;
        b=gtGbD9tYwf61LavZb9q0L9bKZxE9cRZIx+WsmtlMlPji6iwnMZ8L6I95D8Yi00HFlk
         YgRctlgoYIxfr79iU4ccaze5eAhu02YAG9cgrQBAbkV3UDNBGXhzW+axStkHe/9fTq6l
         TJ+OXJ5re9o+BKDjKmOojzIJ84ow/SLqgCnnlV6Idywo2gQHaVhO8Rg+wIyFYNqVIoeB
         0B6Ag60hV9pPkWz1g9ssHfVefGyzVn5l0gw1oyfAHnDURtnZLB6NO3bh6546pEdsoYqS
         eBHARsj6arg9FUqa9omh3KeoVRLSqGEVYo6SWoPWNs1yNHR6l7I4CsQVmtE07DH78hC1
         LZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWun6zx/VoWlxKLGYL/lBUy6Km/f+T2TE9xhwGlYKh9eBgnruUtnIJIN45+UuvubasMuh18GdX06ZVVrItT0emE@lists.infradead.org
X-Gm-Message-State: AOJu0YzUu5eAjg1lkswjLWqJg4o7dC+IDYdBlCxlTBw2AzyHdgXOX2MS
	Py21tcgxrG9A4f1NktTAroEbS98nvjAPkJ9gt8ApVTG4OlPmoqZzeebi
X-Gm-Gg: ASbGncu1R0z9HLPgqdw0g+y6Rm4mAWTAQ/SutHcJ0YCh5B5rbcDmLdr6nH2xUSosnyH
	TMdwzpkrBc86i0wHCEFHnNdQvqJzW/V38p23+T0oqK2x5yBFEZZl8AfwFrw094ovjbChItgiGoU
	g6Bz79MlmVw8VPcqkvEjJPWyM6MDy94o1Q1KjPqfbCi/+G8yQ/wqhjACIN6qOkWBYeDNVOsddqq
	ygmtfy2zj6redBGXhPCmYPopL3QuEdlIoQ2rKieOLsAmGbSUYE1IKurduzaD44QZmrIXtgiy3kB
	v9fDXtVbOMPd7D48ukQ28gdGm3OjJrmvK0+hrdwCTro/fq9sneNoeg0AdKYlDD531rLk9nb8E4i
	EBJ6n+Ce/VFH0O+pOuzVAIm7dFBeq0strzuqe
X-Google-Smtp-Source: AGHT+IEtMqgd0cERI8zRb+TGkoaqjZkaTKRBSNcMuZ1lo/YTkdU8esv903psbEZ+S5JSVNmNrcYOCQ==
X-Received: by 2002:a17:907:c88d:b0:ae0:d409:5f19 with SMTP id a640c23a62f3a-aec4cdfd503mr8257666b.2.1752680896987;
        Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8293fe7sm1196705266b.123.2025.07.16.08.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 08:48:16 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/3] dt-bindings: arm: imx8mp: Add Ultratronik Ultra-MACH SBC
Date: Wed, 16 Jul 2025 17:48:05 +0200
Message-ID: <20250716154808.335138-3-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716154808.335138-1-goran.radni@gmail.com>
References: <20250716154808.335138-1-goran.radni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_084818_779835_EE20E78A 
X-CRM114-Status: UNSURE (   9.34  )
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

Document the Ultratronik Ultra-MACH SBC, based on the NXP i.MX8MP SoC.

This board is manufactured by Ultratronik GmbH and uses the compatible
string "ux,imx8mp-ultra-mach-sbc".

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d3b5e6923e41..9cf2ab3b12db 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1101,6 +1101,7 @@ properties:
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel
               - skov,imx8mp-skov-revc-bd500 # SKOV i.MX8MP climate control with LED frontplate
               - skov,imx8mp-skov-revc-tian-g07017 # SKOV i.MX8MP climate control with 7" panel
+              - ultratronik,imx8mp-ultra-mach-sbc # Ultratronik SBC i.MX8MP based board
               - ysoft,imx8mp-iota2-lumpy  # Y Soft i.MX8MP IOTA2 Lumpy Board
           - const: fsl,imx8mp
 
-- 
2.43.0


