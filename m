Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E454C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=; b=rFENx0IZnpKs2JnpJ1AnPCh4Lq
	Qc54VBuubTH0Snx+9vrO97j41D9A7bTRGhmHossd2+5HGBEPgwsqZJuWp3xdI8voQ6S9B2LhJWE8S
	JatYCmvbPKhGSOf1vM+i+pQva9SzvGJmGoXOt4qc5Mtup/HInuGpmCr+tsXzRN1XhY+ewboDoSMiy
	WPHJ0ygEMsBmEwtHJMmHkH2pPNF4vhv/8ztDc2IqGBqD7wimDxub18boxvU+xzqLZ711LYkh5TpWt
	6PBG2fMnlz0d44idDNilqUaCmXFIibHMi38YQ4M/H3BU704fHI8RhhhCQveym/6d6+qd3+Ge24N1Q
	NoBz7POA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilW-0000000D2ZY-0mgq;
	Tue, 14 Jul 2026 19:26:02 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjilR-0000000D2Wn-2teF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 19:25:59 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7eb9b427da2so833306a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 12:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784057157; x=1784661957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=LIRn+DWx5tVunuStHFRoK6OON+6sIzOPC6zJNVP4ghUdMcyPhQSE7OX1mMEdQot3TA
         Ve0ImvS0Td/eW78GgAReLWc7btQL/UtNnJy/SCKQkpmxMIE5rGADoOQscCjTxjqXhGwd
         v5V4fBDtJCDA4ISO7KdJQOHCZ1g1Izcxy0Vfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784057157; x=1784661957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4qhLkMDf0+YlirUGcXz6TF2rj0izbPoAZeNkitt1I2g=;
        b=g14HHkHSO8NgNGd+84tsWlp/j5BN9PhenjHdUb5nng0cS2RVHDt/7bBCz+3kIFTQqU
         kFZoQMAM1hgZjhXxraai/HXNebPTzo2Up8Zd4XwPu5YPdMrlVRX6F9SiO34kukbiRJEk
         FSQP6iWoeHJcLrI5kG1lX0OMhfGqpI9VVbSMR+LAppcI2ouWNJtg657XEONcStOX2+ol
         s379FKS1hF4aOTq8RHDqICiDeYmwzjc8MMY3PHE89KhWqIGKwEHTikCvAbNJM+pSOJFA
         K5EcMAtzz+3WrQyKuo6yDJEwti5gh1JrFnnoa59MnvSh3f8FguD0WDbFKIRy858p94B+
         1otA==
X-Forwarded-Encrypted: i=1; AFNElJ+RwbzvOHT1RPjhXuLG02TvfDWVoXbpyj9cRPOosg4CAPPpenup4LPbJvXckYAzQuNcwgg2YFxcT6ziozTxZDe4@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+rJe2U7pSoq2d57qGu2A6i8KKMBCvlDGLomJkGREEF5+GT9gC
	Ml2s8KQeh64kpAc4hacW0nY4by64nq70XRfe63fby5bWSTBzOrjWl2jCkYaBlGMsPw==
X-Gm-Gg: AfdE7clJgfc/km1iM3e7pybtGGmE5hzS5HJIyAeUGuOhFmwoKE6gQC4cBMw7q3PXT2Z
	k/DSJ/8Q7aBII2w9IEf3TIOx0fnktTsivbawZpPOgt+meTCjK3DG7O0YZ6ODUfX4mWFD1+0AjRZ
	mLzcM5uCyomV5/tvWAn0MW0Cu10ugSVLagslglcH3LpOzkdsajuX5JCnBYKsk36TJ8eAjc0e+zj
	ob+hibhipEaauNI5jfSEUEPZZSijkq9S/9bm93DF1VjElRQeuxYgN5KCvvHdUi1TJjyrQE/hSfA
	LITFia8vUm2P/6j05HPaZXPlfFdGGfP+fIvC8XKjR96SA4VNIKsBQD1HD+LVs9UpzkkEY2h9t4y
	saXDEz775q9xWChWBweMKaTGOpKXOp4dyDaboJIqImw9JmFj7V/OkC7s126jwjAIVpJUDa6HuR/
	qibRzZoUYirervhMowjw==
X-Received: by 2002:a05:6820:1b0e:b0:6a1:7af8:a048 with SMTP id 006d021491bc7-6a38b9f1f93mr9540469eaf.33.1784057156624;
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4519d89f7desm15759043fac.7.2026.07.14.12.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:25:56 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Tue, 14 Jul 2026 13:25:30 -0600
Message-ID: <20260714132531.v2.2.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260714192535.2082729-1-sjg@chromium.org>
References: <20260714192535.2082729-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_122557_981827_B2681460 
X-CRM114-Status: GOOD (  10.27  )
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

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0


