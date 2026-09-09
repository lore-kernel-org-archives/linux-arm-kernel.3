Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A000EC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=; b=EllE+Ky0+MP/WPjP+A2SwBlItC
	X/i23DbJtlugL7waDpRyZzcMrpIgZq5GU8TmmTuFpGJakPof8BpEan18pswsU85kaIP+6ilpssmcu
	oy5zKa+LZFGItMGsObRlVK1fysJ8lAZR+2ruF1DPGeIGK1MtBbkFVdZyOBigLGzA0qiCQe/OMiwAD
	yf8kL6y2wyl/OhA6qhsMNqgE4K9ExFWn8HUaGZD1bKOWxaqn4Ec8DPrSQSIJv4E7t8jjKTwxWMMIH
	B26Tt9hxqNGEYoLWVrP1PeUMwFcL7bO0X0xWVJdgzKqApsXggH3KhH7wFEETOfIOOXo7ldsRvfDRj
	VMiqu0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPz-0000000CCY1-0uTB;
	Wed, 09 Sep 2026 15:40:59 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KPv-0000000CCVN-0Q6E
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:40:57 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-482dd6ee390so6647812f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 08:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788968453; x=1789573253; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=WJCeLkl1EmQ6ET4ym5YxVA0sM5iGgFJbQJrgGeSwq1feppZoyuOXTgl1eei4ke2MKk
         vtq7+m9pWe+Ve/xY14Y+H9ZCLdfe/YPl0luLjwYEozzuvPwKatmVCM1kydMWi0YonhWh
         KxNZHdaimDhZeZmWBm4Q4sk/IYMr6yJfl3ToCZfECqn2HqtZNwNgopc4FgPjZDGHJ7Ed
         Vi5iXf/RbshDv3HL4lkENNbvNQNjqIgTk06JjsnCMbq/hFZH5r2hKUKRbrFkC0wKe7hQ
         V+XHtxtF6fHmuAIr16ojMn8DDJFgqWX04mZ6YEdjGDJ8BNfOcIouv5Bk6RmklIaBzkGv
         fy8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788968453; x=1789573253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=fOCOCYtWRMMNF/QWVrjKW9tneJK6BKhY2Lock0B1r8ISW4K0GpCCHVDe9vdmLxKsh7
         HcUeOvywhIsg00r+ck+4UxPrVho2FtqLqQwFczMAItITpHemTf5ZiOKR+h92Nf5JE+kF
         cxkBDsSGEj8NLaPqxkZGLKi+R5N45+HJOPaFT8S8tmMBF86M7V4RHdVKs9+raMtECUXL
         /7vUOuaGMCaKZME6VDi9ae96Js+q7mKdJTYxMFM6cnP5XBScv1+pvjt9Qo6J9smtXp9u
         JxTFQu9KfJ19mpZFkPfxY7+nJU8C6jOM4qZ7AHVXYUlxW1VgRPSnSiBhsvD4xCBD6oii
         s1zg==
X-Forwarded-Encrypted: i=1; AKwUvBwH+/IYdnUCa7WsWORRXncMH8u8EjVqzlWph4ySdm1cTW6cZo33T6tC8veEjYxaR+7is2z5+7IsEbxFRnzoVEIT@lists.infradead.org
X-Gm-Message-State: AFuF++l620KGa0sYyC86xWi127wtUIlYbLhXaQ47M+hz3DHlnhaNCsok
	xlQj4BaBIrsA85se+BtO/5WUe83r1AgZ6co4+UX0RdPaqJncnbythNzb
X-Gm-Gg: AYBFou3dWnjYdTvNCuRS4slEQTQ9gVstFATvc+1McWx4j/E6ZzLQtKSlGpVkN08YCNo
	2A1pvL5x3c/c4FChEZ/00v2+clHib4l3QOD2sEglBsyVBFKZQdN+0o5GYrlj1E5vLUJNuezYqnZ
	PtWk2znEH/Q4cFpsMBDvqRLSdbpfgChzbNk1G8o/vepdIAwMWhu7WAU8UpGm9dM69w0QHRPnU0T
	Wn/ZKM+EDfuAVKBju/qgBMG5uW5mgTFahBDmwL8V2sk8HDNEnJoavO25Pk6B+M7sRVwtr5cnzxH
	LDSAYdMxng9Os+yeUX8sNaDnrpS7YJ1aAgueXfNtuD/ssxSp0djzDd5a+OvbuehQuYBB1pdjVzG
	+1XsM4GP4EgJgSTOU3Kum0awsBzLJWxz5SF7pDPx/LiL1uXWvInYo9NYDTmIQ6LJg9jiwQd7T8B
	oxyhjgs1AIAEiAKGw8NY3dqVFNa7fReWd++bYvWwtt9WE3I7+cj+id6HyqmtTe/bHmmDpFCfnAe
	Pj3wHMRKP5D0Z66Rnqid6125g==
X-Received: by 2002:a5d:588d:0:b0:485:8c16:a338 with SMTP id ffacd0b85a97d-4858c16a615mr33895800f8f.45.1788968453181;
        Wed, 09 Sep 2026 08:40:53 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885be1c1sm43810943f8f.32.2026.09.09.08.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:40:52 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	elena.popa@nxp.com,
	consmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Wed,  9 Sep 2026 08:39:42 -0700
Message-ID: <20260909153943.1048-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
References: <20260909153943.1048-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_084055_183881_E9943DF3 
X-CRM114-Status: UNSURE (   9.69  )
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
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0


