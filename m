Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D9EC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gwg1Qkumyzy7K7Uv0qmGTTBvVa/Ezn8Hh7q0O4lw1Sc=; b=gkEJmbsmPcLN6Wr7BPt2miU7Tu
	G36uCVq49Pfo7tZXIHHS8J13P02e1O/k5TXOCOBCMEHbp5SOasukAoXRraGQNSFxsYBJJGBT32HUH
	C3yyjb1Tkmq0Rw3G1nKHBBgRdoZrFiKUgkLyHJQ2SXqqECBGQMaaq/mLclMYURG1VrHNRc7yOPUqu
	ZCOLxWtZsRS1uyjdtFsYMkA9FkjkCwickisez65C/5ppVUKJkhm4KBtccs0UDDFOwj9hY0qYPxc/u
	wNo51fqAzrKbcNsxaqJOMzaTIIj+cuYnQrCGRKja6i0hE8+q7uxz96vz2QBYwI940jfozruZDO52d
	x13TmfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvf0-0000000EHMV-0esz;
	Wed, 15 Jul 2026 09:12:10 +0000
Received: from fhigh-a8-smtp.messagingengine.com ([103.168.172.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjveu-0000000EHI2-3Xv3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 09:12:07 +0000
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 23E64140014A;
	Wed, 15 Jul 2026 05:12:04 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 15 Jul 2026 05:12:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784106724;
	 x=1784193124; bh=Gwg1Qkumyzy7K7Uv0qmGTTBvVa/Ezn8Hh7q0O4lw1Sc=; b=
	JjPq4v2v5I+Itv2CMXjGQWCIs/C6IM5Lb3qf7W0Gz3vjhEenV2IpBnnfBE5SDIuh
	F1J5iGwpL1Qwif7fTFUYLH9jiRU+gHxSK2Sd5oY1mjk97upLYUE+BtCIPTHc3qb4
	XRnuEmzwBhHfNXs1oaF3WO8qbvHUmKvqhwHH/r+nUCnoCCveH3QQG2K0LJfCMR90
	/do6kmxWIMtTVxubHwEPtDIqVme6lGS2wb1ccTH/8BPZX2bAzIjeK+0dPAMFjuVp
	Qfn7g+7MTot2ivPmLJhZ4eyOdgHqHjQBHaLVt2W5XtPPdi8lzPQwOmT+GS1uxZOZ
	aFlkWgsT5VydWJDZVsyHCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784106724; x=
	1784193124; bh=Gwg1Qkumyzy7K7Uv0qmGTTBvVa/Ezn8Hh7q0O4lw1Sc=; b=o
	5idtCdWh0rAgVye9w44PEHkQezqqTg8wLVZJ5yDyBATsPG9EFbBSWy4bR7J+iqLL
	HiLmtDNcjQ/GQsa8MxHLw/ZC6sbk5u6e63oiW0holj76UeDUuIGUvKIJQILJh5I8
	yOe/Idig6X8+XZ5EU/NMwW4W0lQLVNJSew4+8zqENdUPJarvJDYnXf1/cNoMmFOv
	IPP+ZS0uXzSkj/CL//Or6hNh38spD+sneBhCuO8oCAQDKCyDadGhcfU1V+gv/ZH7
	mYqGTnSF5xLLVJqCU0jMICGmdbmZ+me2+UVMCv4Ktq+XaSPDyVo7CDlQsH0yafrv
	UIdKVtPab1Wwo847p4s2w==
X-ME-Sender: <xms:405XajBNWU7BBwdolUWEBnoPOuKinycHR8b3gmElFy7nQ5iua672lw>
    <xme:405Xap6xrSnGGt1U-g5fAH-pkDEFIA9q-VwaGVWhtMp7MAYUFBMCmACyWZzvN-xJW
    bSWf2Ej8mDEV3NQA9t2gOfgL66n1IXBwMcRsK6MjjO1eJ6TgBaZ2T4>
X-ME-Received: <xmr:405Xavuh6gyvXoCO0Uq528jPkVV5d_4UaP3JRxZggPORHF86fPRLBdCVPrts96JnDNpTp_aierVkuLow0plyRRQRHSll_15xFIs4uA>
X-ME-Proxy-Cause: dmFkZTGbEfTGVuHxOJuyKCFvk6zsdjnpTYAj03akCpyfO8+qFj/r9fUNl/dlR0wUY4Tkjz
    N8whbTOR/VZbolzdOo7RwWDDl+GFFDRX6xEYLButw8EkfRcs+qKzpAB3eI9bWeGQ+KZjDf
    vUjxxEC419LJG0p4lk+H/82r2oPAXONqCfgFlRnkrVqzMF3n4ZpgAOgs+drcWhplhSKo2V
    cExiHLUTnIX3eCBvpYgjx7OAUYt6zgl+tNWD/OKuHEYmIxB1ztf6XbODt0covZvJzlkiHE
    Y7hBjEUjZIPYOrZGRddUvW/Z6GPlxjye25BjJzBJOTpI0FPf5NjIM46nLCzefle7QRZCsh
    3A2THnwSNaCQziai36l8Qq4CzhkN0RlR5WGyfXTG5BYIU0csr3fDR3IxoT7t/ynnwD/CdS
    hYsaNHVr2OxaXdhXIqHiZ2PijZpxynSRqxAoxyhIqiF2SjKeCxLQy1BCnJmFLrNplJL3e/
    QcXMOSUy6tsWNjVvAOjftIKPsHi78gYOmg9XEDFFToRYjGQLQduAkva83dBRG2sXRTFOPo
    RHkyZNCccl3yN9F0M5Lgu4MW7RO+ZuFBf0m6y+5kGdNItaul5s59BbHR+QBmu6kwipfjGv
    TQBlpLPk/RC5Z4ajDmejmtXgz+IhDdcUwarI1cCKlkeDZQ4n7EKbZAqkAIbg
X-ME-Proxy: <xmx:405XahwrpOjC-hX6Pff99xu8t33gOtCXJwDFnpaIj-O1RpbABPH3IQ>
    <xmx:405XanaHoC0kbpjBj3pbxTYc62yBy_Q5F53Mrv0zy4318-6nGXDA7g>
    <xmx:405Xag5ZkYatUNEVcVqS_9x3F4iH2zSNlkj_WoPeu8hWB11ST-aczA>
    <xmx:405Xam4c82ScU50ZN4YvB-2SbxTc0hGFraxuQLF-ZxGTOfvgANNKTg>
    <xmx:5E5XauQs1g0wckBeGzGvZijbNa28P-LA3XsxtaxuNi9I79usZq_qHqMx>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 15 Jul 2026 05:12:03 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Wed, 15 Jul 2026 11:11:49 +0200
Subject: [PATCH v2 02/10] dt-bindings: interrupt-controller: apple,aic2:
 Invert #interrupt-cells condition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-apple-t603x-initial-devices-v2-2-df65b2485710@jannau.net>
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org, 
 linux-pwm@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1552; i=j@jannau.net;
 h=from:subject:message-id; bh=TaPp3YmDGKuL811lfs/as2BQJH0FaJPIrM4HTX3tMVk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqxwv+vJ9l/UyzK3hzSd1LISv5pqHL88O33n1QcO0/54H
 N6xz3Vmx0QWBjEuBksxRZYk7ZcdDKtrFGNqH4TBzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjrGOkYMXJwCMNWpKQz/LItNQk8++X1I4tDHcN4isXM3lt3aOOPdBcvEYhezpoBP5Qz/HRXiw8q
 emuVtDL7osja5hunV9hlTtc6FTLp+eY/Zpvo4VgA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_021204_982923_4C43DF89 
X-CRM114-Status: UNSURE (   9.18  )
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

The condition for 3 or 4 #interrupt-cells list compatibles for the 3
cells variant (not used in SoCs consisting out of multiple dies). This
includes the AICv3 base compatible "apple,t8122-aic3". This will match
    compatible = "apple,t6031-aic3", "apple,t8122-aic3";
shared for M3 Max and Ultra based devices which require the additional
interrupt cell for the die number.
Instead list the compatibles used for multi-die SoCs explicitly and use
4 #interrupt-cells for them.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 .../devicetree/bindings/interrupt-controller/apple,aic2.yaml      | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
index d0d9a90e96e7..a94787939d34 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/apple,aic2.yaml
@@ -128,16 +128,16 @@ allOf:
         compatible:
           contains:
             enum:
-              - apple,t8112-aic
-              - apple,t8122-aic3
+              - apple,t6000-aic
+              - apple,t6020-aic
     then:
       properties:
         '#interrupt-cells':
-          const: 3
+          const: 4
     else:
       properties:
         '#interrupt-cells':
-          const: 4
+          const: 3
 
 examples:
   - |

-- 
2.54.0


