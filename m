Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C6AD1266B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 09:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f+4NwQTv7E4920mh+Y7a29gPk9vmlaHbaiEomCWWFMY=; b=XrLdB+AxIwtp9gNDSGFxYOsAL1
	MzZuivBmRsS3Uw6FwDYUsiAR5KxsHdcubYgPh9oRu4nDEje/NEUkARUCIt3CC/2jf6bbZdv/6l4Ng
	GGuYX1ftYUOWVkndjEKwl5ORhFSo1dmS+Cn3JFIPPmIDKoATlReMykusiRHSqUtKj90HvYNOWErzg
	iNZY+IzJX0AruzdbGOd17S3nCkDvVRD6Cl6w90Fcz2Z/61Plj+6CbM4lDsyPSXOi0H+2p/Ecp75Bc
	pgaMsn1wpaDIxyKbK6JBTgWzJ2hJNCD+u+ZKmywSL0CoMY+hv1EmsLIRYUrLF8302DW+7xISvqZ5t
	7TaqMQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FfX-0000000GT8W-0mTN;
	Tue, 05 Nov 2024 09:16:11 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8FcT-0000000GSSk-0JDj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 09:13:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-720cb6ac25aso3879158b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 01:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730797980; x=1731402780; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+4NwQTv7E4920mh+Y7a29gPk9vmlaHbaiEomCWWFMY=;
        b=X8xfQ9L+EGJK39HzrZLHu7YSL9wkxoLOzgTsVbGPOl0zFvzAFtdKcoXAT4JiwMjxHk
         kfHjipPTZlinKjRZ0Ogn8KryuiR43FFwuelL34dSOUJ4XUFea3re71viA9b7dKjX6djr
         piGyBdZ+yXNYc6EhOcJIvUflQqToZUrcb/2mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730797980; x=1731402780;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+4NwQTv7E4920mh+Y7a29gPk9vmlaHbaiEomCWWFMY=;
        b=Es75EO8mxUzm6NSY1F1lR55FEi9Ulikp/SyRp/SyhpuSnl61XYmL1gYNxtE5ujgpdw
         MLeKxbfFe7BFenCF4bNZ5nNXBth/Ye0vT0e55HO9OlNZNLpTOubURyxQDN63ijkb6hGL
         ZhjmTdBoouOUezFQv4MtGasfF5s0NiL1Y2bumdnpPr//zO5Z5BgbBcHGbjc5VQohwmYE
         NifJA8VbqPEBzPJkXMli9Bgdr/hWOOwqdwu5kJlDQ6gRQtL4D2Ove5PbFf/wBRzSUE0h
         B9rcH/9HxFyqlVv9GoNC7VtDtLDZaJamchF5IwOiSTOPM2vrtAkMNIK8rXrkcb1lbJ4C
         jJUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoy+FwaQmNYS9tXR77RfYUAqfaL2/hNqubKTuAoYU3PcSLg+0X4TKapFmzyb3OpdFWVpHh2fEh9DzxlE9gC9pm@lists.infradead.org
X-Gm-Message-State: AOJu0YwjlFvMlHieykGujQSgnbhR+UZ3at4qLFV1taE+7xrzZiVyipRJ
	F6jiYvEnJWcRgME451pbIRkQHx4LuR+E1xk0K/r5vb+IoQ/4VlEZD1ij2+4Cjg==
X-Google-Smtp-Source: AGHT+IFfp3tQ5uLnmExGkLWD+ytb0gK4uUh68a0Vvv88I2b/msUwcuNAU6GAKyLacYFjAI1B1n9KVA==
X-Received: by 2002:a05:6a00:3d44:b0:71e:1722:d02c with SMTP id d2e1a72fcca58-72062f81d35mr48493079b3a.3.1730797979801;
        Tue, 05 Nov 2024 01:12:59 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:20ee:3712:ce0b:1ed7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e7825sm8943185b3a.76.2024.11.05.01.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:12:59 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Trevor Wu <trevor.wu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add mediatek,adsp property
Date: Tue,  5 Nov 2024 17:11:36 +0800
Message-ID: <20241105091246.3944946-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_011301_154199_F3F3D104 
X-CRM114-Status: GOOD (  14.16  )
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

On some MediaTek SoCs, an Audio DSP (ADSP) is integrated as a separate
hardware block that leverages Sound Open Firmware (SOF) and provides
additional audio functionalities. This hardware is optional, and the
audio subsystem will still function normally when it's not present.

To enable ADSP support, a 'mediatek,adsp' property is required in the
sound card node to pass the ADSP phandle. This allows AFE to link to
ADSP when the sound card is probed.

MT8188 has ADSP integrated, so add the 'mediatek,adsp' property to
allow using it in the audio subsystem.

This fixes dtbs_check error:
  Unevaluated properties are not allowed ('mediatek,adsp' was
  unexpected)

Signed-off-by: Fei Shao <fshao@chromium.org>
---
This patch is based on a previous [v1] series.
This is sent as an individual patch in v2 because the other patches in
the [v1] series are either invalid or for different purpose in different
binding, so I think it'd be better to send them separately.

[v1]:
https://lore.kernel.org/all/20241025104548.1220076-2-fshao@chromium.org/

Changes in v2:
- drop `mediatek,dai-link` vendor property because its goal can be
  achieved by using the existing `audio-routing`
- update property description
- update commit message

 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index f94ad0715e32..ba482747f0e6 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -29,6 +29,13 @@ properties:
     $ref: /schemas/types.yaml#/definitions/phandle
     description: The phandle of MT8188 ASoC platform.
 
+  mediatek,adsp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the MT8188 ADSP platform, which is the optional Audio DSP
+      hardware that provides additional audio functionalities if present.
+      The AFE will link to ADSP when the phandle is provided.
+
 patternProperties:
   "^dai-link-[0-9]+$":
     type: object
-- 
2.47.0.277.g8800431eea-goog


