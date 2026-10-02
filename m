Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE074CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=; b=RWFN38rthOPqJbWaiybsxqxTE/
	uSV6WRoph0rFhXU2eGCb1ceBO4VGTqEJZzFYxVsyWm1SzHs5KlalcHHSK6EAjSy8EqgIHP69EvCCM
	70kHas5ufDEJPyVqzNO9kqyV5zrE8SGrdpPTXhWn6HQNfS3dQfhLnWR5omReBfU8y/IKdm6qhJqym
	t73K7DhifY+Z160xM3/lJG4h6vM3FAvI9TLaExPdZ8ZsmcyQdQVM8qJ7n9nZdXpuSkBcOpOeVy4e7
	I+2buXIQ8jT+ylqqCHBhCu39XTeIcOKJDpTiYacFHs/83IacNy6glxcLTAdDDsMLzDdwClQE7p94o
	+vq+tIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWmE-0000000AiUf-1keF;
	Fri, 02 Oct 2026 06:29:50 +0000
Received: from mail-dl2-x0d.google.com ([2607:f8b0:4864:38::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWmC-0000000AiU5-2ATm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:29:49 +0000
Received: by mail-dl2-x0d.google.com with SMTP id a92af1059eb24-149d5ec8e96so1893185c88.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 23:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922587; x=1791527387; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=IJAA59dpjQkBK7BUhvU9hFzQGbJLl3c18vXvRqBrfysHtc+3XVcomXFOD2CKi9Xf/Y
         1CkOojtzu4ql454uiGjiZuctLMVypFLDScF47zo7mJeHn+u2u/MO8Cep/TPyJQUyaX1g
         mSUv6d9feBINJSj0eoIMBry8f2u2upqlCmUokdHOHqiu3QPLhNgyYhPZLlcL8WXvINcO
         AJ/nG3ZzVix71nLBpPDhuM+3K2Gz19AZ17+Mh9KvZnO/3oRsQlftbPCJ74l66H/OzCau
         QNRbLC1VMZoEX+vhub/VTMzYDGErMojtahPW1G1hPrCyCqo2CaNs/wv6xoBurFLN3Cd/
         DcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922587; x=1791527387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOdg97xUtxa8AhSsk3nKT5LmiSCoT1EL2eRC7gkp05s=;
        b=rMrhNcVfI5NsrADeD9r4IviaV1Dagtt972fD0w70y8NO8NFBvunKaiASD9w/YfNocM
         E3WaHjkZjPv8EsP0dwFc9GaN1ZhdL1ZF37rLeyyvtdYCItR6b0wd2ye+UvV8fKjB1RHp
         vjR43XOeM3JiwJGE1ZSybIJh8E0dOuntJDxH3lUzlgMgJMCQ5/CjYFLBb1lwa4Bccgn+
         erK0vThcNleK/ocYR/4t5631brvTekChkmZY9mUvaOBO8KDrt42Se6/5DFxXM1JG6rdm
         xHuAAD1jWizKybODHtbqQ09vYJLJJG3NAfUgj+/YW0eIH6M/l3DPfproNFqdfS/zK/TK
         PS5g==
X-Forwarded-Encrypted: i=1; AKwUvBz1hcyIBXK8j2RFKdaJamwpl8dJDOljnLgAoH/7+vzWR85gEUtrOUYmQmy+Cj3Trey+WqrSqWPNhujNQ0oStFVN@lists.infradead.org
X-Gm-Message-State: AFuF++n6McRIm3cF8dL3fng6rvtm1+YPaEk2qDRhiLX0jK3nMtxdatD+
	6l/Cx0heVuj/HGCfcM6a6srRsgtDGpWhTb58HcCK10lpM1jmNIIkpllN
X-Gm-Gg: AYBFou2AbU3XLwDQf145+JCG/iOpqtZF98U6AYuVoPOGuv6gPY/CM6auw8c98Tnxi7z
	JuuT/5mQuXRmDyzjgLjjKRsLtAAsU7stdLgyKkLRvTjb1O8wroBQqdZ9dLhDVXYmVgMfwj2ASmB
	aXZhW6Oo1zUYwA7EYsAHqCM3sVOlAEykXRmr1W8i9tNLF8tlJccM4HNtFdM1eifj8iKDXVUp7Li
	y/M7JlpnuvTDH1HiBdi5Czr7qYvL1fmBAVnHByyx86N6a1glvAL1jsjxTokuOiCoJCFT5bazf6I
	U2+Wmnkh8Is/mKdcioysrGbJ8eNSbqoir+lWT9Uycs+7KDFTZOQfCWrNaBoRIF/qxrNwhuXETeX
	Q2NxiYFBGHBMSDNfhSymBikvpse7xr7eGcE/JTxpdtVrVwdNQAQMdsASgNWsYQlnH2+dREgIZuJ
	udN7vsKHmKtFk44KjQz6RF/ZlZxaCF8HKQqmf6uTiDZslLo1BFhEG2Mso1nQOieze/ZvXxjRLR1
	U/gpABxn1cWRFCt1z9PyWKOjSA=
X-Received: by 2002:a05:7022:f509:b0:14c:be8e:69fc with SMTP id a92af1059eb24-14f5b9faf32mr1694735c88.15.1790922587359;
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:47 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/2] dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
Date: Fri,  2 Oct 2026 11:59:32 +0530
Message-ID: <20261002062933.26497-2-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
References: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_232948_557837_DC1C54AF 
X-CRM114-Status: UNSURE (   9.32  )
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

Add the compatible string for the ASRock Rack B650D4U BMC,
which is an AST2600-based server motherboard.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9ba195b8f22d..4c9e96801c1a 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -81,6 +81,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asrock,b650d4u-bmc
               - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,anacapa-bmc
-- 
2.47.3


