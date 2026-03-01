Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CFF1FD0058
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 08:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=; b=N0NIg1JcEPaFUB1Czr5XEjNXqR
	sXyQYkQd6dnmljkC+M5xb9IA3g1QlRSOg729dEBwA/NMoWwl4Hwt43PBhyoLNt3kM82hRGIwijUxM
	qNjyfXG5ywMLbko2otFcJMpRqCLfw+e1K70oo2rvtS5G5Ffzsno+U58G7/WRpU+H7cox+V6LVD3L8
	EbZyKHb67+AlOTZnKllYvqrDlPbn+gYakO2+iHpkLO9/h5vpqBm3itqauIlARhRqYk/IaNdSzzcBt
	/GlaopbFWsD7GsCRH8c4oqnIR5ArnNgodjk+q6ozuZ8ALI+Lnsni076JJJInhavRqWY4VZCNbuWaN
	dEYxY2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwboh-0000000AwFv-0HBN;
	Sun, 01 Mar 2026 08:06:19 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwboe-0000000AwFO-3ThX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 08:06:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3598a09fcb3so53545a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772352376; x=1772957176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=KCn90FQclF1KeuV7EuL4CDM3I8fltzhdmvFZuC8tNkpa1YEpxpC8rrC9wj/Y+nPl0h
         NaDH+yCy5bv/fcqueACENo2WQC4TrNR3CJ7woJFrUUBmY8kX4y/iEzXcSFsEbZoGyQev
         a9CcyviT34e2rWkK3Dp6PFcf16n4OrCvKn16QaFPVTWh1BenhDmcOn1HT80mysRvnFSJ
         hnlpZBUIY4UUCdj1UaX7SD5JoAq2SNIspgRkM/So9+RICb0UBbUW+/f27R2Tg/KTdqTa
         dnS3oMCi9doMDsipxG2DZFzX/Ivoc+3fHRNCy2A/gNcZ53U9WcuKE+oLF1/eRdAc+gbW
         i0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772352376; x=1772957176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HKbztpHgM8PKD0CcFwHhxyWzraGVBnVo495326Vfa6Y=;
        b=rf2NPR8S3hs8BIRZZXfXs0+eX6/yEbfE0WF/EfuV9nc6Yw6Y3Z7dwvKbIvMg44Bw4D
         jiVOL/Tb2EUAG1Ds1i/dkdC4lEVcuC7USXUOBxe4j4PgaGGXkRM2Xk6VFfb1Ad02IjMU
         bG2+YOTgkFTbGMvXBXcEeA0Bfy5EpezzZaFnqgUkEp0+Pt3h9WA5/xEC/XNxsv3+7v4R
         w5Q1uUMAlptlqNq9miDYtRn/zt7ZI9xV3p2Eq80VF8xGdm2dxZxnOtueMNd8WYARYfBc
         ncAIxZAu5e0ljzVhWQ4u+mVSPK2bU7DPKlmSk/bDbGs4SRTRkcW+oUZeZGav5AcepzuF
         ugSg==
X-Forwarded-Encrypted: i=1; AJvYcCVX3zHp/uM3A4g1Du2hiz2Qzw5SHFEm5nMvKnQ4TQXnQ5aYno90wohHecrQeqA+q3DiX5jnoQq8rYEoHTotFYC+@lists.infradead.org
X-Gm-Message-State: AOJu0YzCTv8QqWrLHRURT4UU55hhb+H5EtWHiTvw4XPnLjcgdMXk6+ym
	fn8xLO0duBpXMKnT9S8gbz2QaNNQS1AI1Tw9upOlgUImJkL3RfNvZi+g
X-Gm-Gg: ATEYQzwivsi58bb9HIJQWmyIO9rW8p6lZtAEIXU8ygJKiUbGOQk+3n0136OWHPQPYM6
	j43vJ60QBBNH1ibZ1eAiNrONcsVvkvoe4isMFQO1UE24CYgwtzDP26ZcwaYXkicFXGglB6bm9gq
	+kBCJCVV0gl6W+yo07Glbsrd53BmZmtWcVcr2DRX37hE9uIU1V32MPnPIlL5dn0twaQef9G+5r5
	v03KWLQ4kTFPfgCYeexX/MU1JHA6bKZ3g+mGe4/Rx3qPvYAVXnKDaNvCfGT4grb+TE/ZKnIVocu
	823R1uGHtvFXcN+FECkkjKMnYXFeHVbr43d28tAT8oCnZrGapXoO/Gesu18tvPfwq75ncD60ixe
	cVMViLPWjtZwtBXld9PcZzjMYmFLqsi0QUtzG8FO/iNuY6u4bDDIDVaybrIAoBU6TT1b2gzTwLJ
	sqjBjGeCTtCMCdOF7qa4uWZNQ23SMkk9IrQXkp/PQKethBDNdyjxhDMQvgM9W59SeBb6VfNp3ex
	r3RLj3gha1OAUkBcxavap/0m78aG1LiZJXpf79RGxjJu/NtzXXrhadMGtss/7KFd/FqyOB5SrbT
X-Received: by 2002:a17:90b:3f87:b0:359:8014:d5fb with SMTP id 98e67ed59e1d1-3598014d645mr3245982a91.0.1772352375853;
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359135ef1d7sm8885384a91.5.2026.03.01.00.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 00:06:15 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 01 Mar 2026 18:05:20 +1000
Subject: [PATCH v3 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
In-Reply-To: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3210;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=HNjAg2xdRxewqWz3EXUwC/PrDpEvfT/uT/eZPObjn+w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJmLP6dvf2pd1qHRvMz1xi4v/i9vSkzeL088WKxRn2z4p
 TMz/bl2x0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKpP6jD8FdFdfO5hUsaOKw+lrt6UzfgXfjtO7nf3noRZrzrm8ISFFzAy3LpZs+4
 O53ye+6smZzlZH57lNf3Lovuq18IcX523mefVyQgA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_000616_880236_C53E7D10 
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

This schema was still in plaintext form. Convert to YAML format.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/sound/tdm-slot.txt          | 29 ----------------------
 .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 29 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.txt b/Documentation/devicetree/bindings/sound/tdm-slot.txt
deleted file mode 100644
index 4bb513ae62fc..000000000000
--- a/Documentation/devicetree/bindings/sound/tdm-slot.txt
+++ /dev/null
@@ -1,29 +0,0 @@
-TDM slot:
-
-This specifies audio DAI's TDM slot.
-
-TDM slot properties:
-dai-tdm-slot-num : Number of slots in use.
-dai-tdm-slot-width : Width in bits for each slot.
-dai-tdm-slot-tx-mask : Transmit direction slot mask, optional
-dai-tdm-slot-rx-mask : Receive direction slot mask, optional
-
-For instance:
-	dai-tdm-slot-num = <2>;
-	dai-tdm-slot-width = <8>;
-	dai-tdm-slot-tx-mask = <0 1>;
-	dai-tdm-slot-rx-mask = <1 0>;
-
-And for each specified driver, there could be one .of_xlate_tdm_slot_mask()
-to specify an explicit mapping of the channels and the slots. If it's absent
-the default snd_soc_of_xlate_tdm_slot_mask() will be used to generating the
-tx and rx masks.
-
-For snd_soc_of_xlate_tdm_slot_mask(), the tx and rx masks will use a 1 bit
-for an active slot as default, and the default active bits are at the LSB of
-the masks.
-
-The explicit masks are given as array of integers, where the first
-number presents bit-0 (LSB), second presents bit-1, etc. Any non zero
-number is considered 1 and 0 is 0. snd_soc_of_xlate_tdm_slot_mask()
-does not do anything, if either mask is set non zero value.
diff --git a/Documentation/devicetree/bindings/sound/tdm-slot.yaml b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
new file mode 100644
index 000000000000..ca71e3660f62
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tdm-slot.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tdm-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Time Division Multiplexing (TDM) Slot Parameters
+
+maintainers:
+  - Liam Girdwood <lgirdwood@gmail.com>
+
+select: false
+
+properties:
+  dai-tdm-slot-num:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of slots in use
+
+  dai-tdm-slot-width:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Width, in bits, of each slot
+
+patternProperties:
+  '^dai-tdm-slot-[rt]x-mask$':
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    description: Slot mask for active TDM slots. Optional. Drivers may
+      specify .xlate_tdm_slot_mask() to generate a slot mask dynamically. If
+      neither this property nor a driver-specific function are specified, the
+      default snd_soc_xlate_tdm_slot_mask() function will be used to generate
+      a mask. The first element of the array is slot 0 (LSB). Any nonzero
+      value will be treated as 1.
+
+additionalProperties: true

-- 
2.53.0


