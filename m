Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D368EFD0622
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=; b=D/R2fEjWjC2Z3huYTPeNZQsT4a
	YHDdFMVktV1IzCpJ++Ht72ef7yBW9pHFIqWghJTUMiBf3KN/MLXg3FbVR+BP5DNQzzb0wHcoEcBnV
	Ff7+qg1U/+wP8i5EBE/x/nt3qeSYDgUVzktUBTR8vLUOd3voJ4U76hPc0xVEPv9/Zvah4wL/5RO28
	dysWSSvZKsfqEItFhsGal5FhBCfqjBbkLGVslHMX3j87dMiR3fAkc1jReS+BgKwVgA+Mc2I/eZmip
	wVQ0iaRV1k3ipOqxlBmD6IdmJXm0QHbg2E0iQ/X0yBafcepztzGH6M7TAuRjMJh0/qWXNXnLBf97k
	ROtuD4QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Cx9-0000000AvDD-27X7;
	Wed, 11 Mar 2026 06:21:55 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Cx5-0000000AvBU-1F2D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:21:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-35a094cc3e9so47279a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 23:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210110; x=1773814910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=DI1LjmqCkty22vPXaOY+nJy2Jxr9SRLfOak75M7zpSYYtaIaH6NHUFmpXXPS/07pjA
         nQfRZt1oDSnpHlf7dgZMTYe3VMsireWbC/KtwlCFZZvPWz2zZN03jUldygxGWherj1O7
         cPlOIqs7po75xtqxbq1yaXcpnVd42azu5J+6gZ26tXzp/oPXnOxyj3/NebkKJ3EcuYSc
         KXLoYfuN79uC5Off9Qz1kwrx+IKAyvl4/UZm9esStYIOwIa0cF1e+8Y2qJKymJmpo7xq
         KUXZ+WEp7ZyUjFKEsPcjoyZIcTcaHz1cGSn2UPZ6ob2oiKGMzFrwLY1aarKCOps7cpFT
         20og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210110; x=1773814910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=nHH7OtvoulX4tB3unbXfBn9ZxWcoZJLWaMJs6hUokbjKQ4WArbd+MEVz84TK6a2RZ2
         o5wtK9MJ9SnpoR4v855RLKmAJYdGN+VRV1wGvhgE5gmlXNGcvX8+Bkv2pgEJdg+YZe3P
         ah9/D2/SWZxGCJk9BvPpZQPoEXzEFtQkfhndQI3xcWuynKYfi53nof9zNwttNiK3Vm8N
         6ljdMIa/c1HFx4XeuVO2QpibVmfZKPvc0gH111brvCPUSBX9Y84vfK2qd3Gc00DcUTF8
         JLZ1p2w6eiOuFERzaViI2XlUjPnM9/yIJ89OebOcLUyIljaZbrW3QDuiJqDMbJu8bXk+
         PE3A==
X-Forwarded-Encrypted: i=1; AJvYcCVuBEG3iFgfMAZ2d2wdnL/miz6iUvCm9N8+B0BzYUMHL/pumbYzq9jxxhOyJ8wiWuzyzBAmjl03FkETpVTs29K/@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm0gcNTUQey/e8MUA+Ks5O6dn3Bd/vWaFNL7jXLxechVipqmwJ
	EFWldX523hgqjuDpnlreF6+/kD/Iuhhn6bd7ZXlOKNpOCgMbwidGXJ4F
X-Gm-Gg: ATEYQzxMDEAODNl5JzTCfv9svKs4/0pwyfmangGqvd9n2fuvMU2Hu2m3wS9+uUmAIs3
	r3XAroUCijE7/mpcx9/EYBYU19lfZxGV5FRn+dsL/7L7Mm3/YgkkDPGi6YkNO4anpRan3WTZB3C
	Krj5HpsRceRYiUeSC2zotWe1lP51+Ki5aZblybDs1XC/QYN8cTQCdyl0E1JCROpAfOS/HZ4oIBG
	0U1XIQyz7C1gSfz671C8962KfLinCLoYTe0+aOLFH7baREsmx4BjoO0ekeQASJLOplZGzJ08tFh
	L9gjjUZLxn60tzXECLo6nwyGdtYrV/69T9cb0LSYDTN56JUa/ePKO3JlvM2bel9lk+HKF3tzQcz
	Oi74XoUkti4kP/Xv6AiPjjKQZYhetqjlCfOHWdn/bPLJ1xtyKwbuG58ZNUb3ekKO2FGqOuTu1r8
	BQ1+4+KP2+P65eAoigItOYrAK52ue6DyZGVPC2AgLob/o7LrdaMEfNcNNkbIbEtUStlyZ9/tY6D
	VDyehq78ajnlg==
X-Received: by 2002:a17:903:298b:b0:2ad:cf11:5048 with SMTP id d9443c01a7336-2aeae7c7d39mr17260585ad.22.1773210110459;
        Tue, 10 Mar 2026 23:21:50 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73cdfa9acbsm1008019a12.32.2026.03.10.23.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:21:50 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Wed, 11 Mar 2026 14:19:28 +0800
Subject: [PATCH v3 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-sanmiguel_init_dts-v3-1-2b4d1ab7a8a1@gmail.com>
References: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
In-Reply-To: <20260311-sanmiguel_init_dts-v3-0-2b4d1ab7a8a1@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773210105; l=894;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=505A4j1K+3BVyfKFAUJFkb0POt+oWwmpy0RpscQYCVE=;
 b=A2uKouFUmFPpIc+1d2JM6DuRLNpKNSsTbf5qhXW5G0z3TWQLHVqz2DyRpNDVzyOfvo536LvZ5
 DPEacuxk38KDBVA2zulneYlS2HN3XfaCIiHMNfEzeRIiVOxEUaJ+RNR
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_232151_338651_26FBD9FF 
X-CRM114-Status: UNSURE (   9.19  )
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

Add Meta (Facebook) SanMiguel BMC board compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1


