Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E38CD98D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 04:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Crq5yHDjMfevdls0e5Awy2sd/URrn7kB/WguSFGm/w=; b=QnukrGtvJ3IAGOk+ZX6CrpLcnb
	6CUmVT92H0y7o0r6i1B1eIy5qApZwWgeazEpjoGMY+Ftshbh6rSYpnqv8QhcX3k4LEw5jReQki+dL
	an3Rfvd0UmSxLJoDBCYtQgRffcCa5V8XKrpoCL9u88PRNCV5H7FE8lE7lPG/WQsCcmhM3awZU1ZvH
	GD/oRwxVp89cDs0T2/gY3govm/XZRGqjm9NAGJoldFME7xeCCBerxeRzdTB0RVq/IW2Ta6HY+sAN4
	ekRw9FzAaOHLjflKZeTJQn91QpL29WazfxQcfp0TswnsHNqAQYWpTQAJpkqirNDxOWl4R8rXqmII4
	eQs8kiXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc27-0000000Ci7v-27te;
	Sun, 14 Jun 2026 04:01:15 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYc25-0000000Ci5c-0SNl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 04:01:14 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c85825bbc4fso1389041a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 21:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781409672; x=1782014472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Crq5yHDjMfevdls0e5Awy2sd/URrn7kB/WguSFGm/w=;
        b=mYjhKEvtbGdgfa+BNalkNa5ABMtHau5hCC3JvLTLNJ+iGkhtwtbdBXUvhleL8ayjtk
         z1TPaa19110qQOLZln/imJVhSRIc5K2qisU8QRnmWuQuE+s3srwOhAoBNrA2d7tUK8EY
         CRU7DqtmFr7kLtryn0jkNziBDW8ZQQqHkwYRXQt3VRXkKJqbcLccpK1nFdpI+Yp9MPb+
         IRJN+5vawF51RMDvJekrpAfdV5v3LIDyQLzUy0CtAZ0Of/WI7+UoRPD0qdrJky8URj45
         NM4tIy0I5OwHHWuw6lqzKIJXT1aU3fUrnG6Jk9XDlGa5HV2neTFbVH+p8e/xE2jYf7gc
         4BKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781409672; x=1782014472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Crq5yHDjMfevdls0e5Awy2sd/URrn7kB/WguSFGm/w=;
        b=LICU9ILpBK+B7ktis8RT7H88BbI1BX4EWbB+dHdv/fh6Epubo4ongso/na2lTJ0KF9
         lNs5r5GH3OCeEXNlGTo3uSKo8Fs/5oVIFaKuUaYqVUGdYPkcL790Ir7npiJ3bzTjocto
         rNBivjqQ+9p8mHF+g10lIvrg6JlJ9NDp0DBWAXEfat2yTHJVSzWStMyw+pqSKM6JIXm9
         LHxgmqVAwfXrp0rcmy3hWVmIMGc8rPhEniDEZNMu43qw0QVTPc0NfLPc04tpgcj4bzja
         aTtkq4TM5vdOqQE72JnBYOEq9p8DWGlvgkZW236h8CU0JzG8mxdwIyJGIlxEleWII1Z9
         nHxQ==
X-Forwarded-Encrypted: i=1; AFNElJ8/mntF38fPwNS9Ia8O7zN5zd891eNIAQC1AETjBuX+Fivh3FAxA27IfOR0WhjCmsM22PwzNVpyUWAaD3GFdcrU@lists.infradead.org
X-Gm-Message-State: AOJu0Yyks2JPqpoKMWC2NwZH9qKKrnkfrTU5CEvcly6/i2inkbiAs5lU
	mHs7jBspWkfIO6pQ+4yI7It7GG98wSzX7MWQ1Za4JZtXw7DqZQATTZuh
X-Gm-Gg: Acq92OEQaqsbg25kMJObNpDUICm6jyhqMAEtsG3/VsiL55/fApUriB5qay34p2GxxSe
	P5J/h8hY9ZWLnoH6743651W6YLbfvGvYltfjYVb7W06ld9RDmIabka8F3im2NgeP2KusM5RrDOM
	J6C8xlF4b7a51v6JlNuucXMwr7F402FoSn4JlbO/EA+Y5JykClzSSdIAZZMWamtoBRlOQplCXiq
	7e28TRNr1QIztJatt9Fc/0M+UPjp84q5Y7MeS3NAEe93kr4vdYotRKB+Nf571ohdhcpE5Nd5JNU
	K7w/Nnx+BZRlbSWeXoz6M5B4LGBUEHjKv5+9AmJ/WC46CG2kmn839TbMFYG0F56cMz3mHBvgqxE
	YQVEnYtY+Tm4wVNOIBx711JIkgplJv4jSic2qMb1aRSfvDYkpZUaQ08V7Wq3DxInw/oQ05grzEr
	mbpsBZB0DTd9vDPPObyb0=
X-Received: by 2002:a05:6a21:6f17:b0:3b2:8675:4866 with SMTP id adf61e73a8af0-3b78415d3f1mr10802330637.31.1781409672295;
        Sat, 13 Jun 2026 21:01:12 -0700 (PDT)
Received: from mincom1 ([115.4.79.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8661a67603sm5676983a12.0.2026.06.13.21.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 21:01:11 -0700 (PDT)
From: Jihong Min <hurryman2212@gmail.com>
To: netdev@vger.kernel.org,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Christian Marangi <ansuelsmth@gmail.com>,
	Felix Fietkau <nbd@nbd.name>,
	linux-kernel@vger.kernel.org,
	Jihong Min <hurryman2212@gmail.com>
Subject: [RFC PATCH net-next 3/7] arm64: dts: airoha: add EN7581 SOE node
Date: Sun, 14 Jun 2026 13:00:28 +0900
Message-ID: <20260614040032.1567994-4-hurryman2212@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614040032.1567994-1-hurryman2212@gmail.com>
References: <20260614040032.1567994-1-hurryman2212@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_210113_171701_A9598923 
X-CRM114-Status: GOOD (  10.30  )
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

Describe the EN7581 SOE register window and interrupt so the Ethernet driver can discover and initialize the packet offload engine.

Signed-off-by: Jihong Min <hurryman2212@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ff6908a76e8e..a3c1033d2437 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -347,6 +347,12 @@ i2c1: i2c@1fbf8100 {
 			status = "disabled";
 		};
 
+		soe: soe@1fbfa000 {
+			compatible = "airoha,en7581-soe";
+			reg = <0x0 0x1fbfa000 0x0 0x268>;
+			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		eth: ethernet@1fb50000 {
 			compatible = "airoha,en7581-eth";
 			reg = <0 0x1fb50000 0 0x2600>,
-- 
2.53.0


