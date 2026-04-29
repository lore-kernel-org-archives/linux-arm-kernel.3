Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073E2FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 07:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RFZhSnSnaJvbVAF8eyUqTOgahKo+NC7KLHnE9JI0jEw=; b=R5HYzYrPOj/+QqYNSZc6UZCRsJ
	jsGaOc7fxbkEoZrd/ha+EBHdaPijW1Ft+3unp3q8TAntgyn2a457TAfMxn631RRXYfHRAJb+Vq8T0
	S5K0r49OTZqu/Lv2eUUq6Oor7wJhez4CSVCX7LdBLZc82YCMYGRAKejQFwK1p9MjKc9EzVhl9E8Gz
	+I+rWRkNf4vT7E+6yXQ6UPFEg/Y4Y/7vNTxYLW24WCzeHgxHWITFad0sapAOlRo0fxqNyvj+TPAQo
	qnwuR8seNna75hY5IfgNtlH5XVxNJUNLh8ifc9vtvvXQml+J52JQfOdZM/YV0oK2Q15RhhFxtmFKb
	DkZlaBcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY5-00000003Aij-0fX3;
	Wed, 29 Apr 2026 07:41:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHzY2-00000003Aht-2NCW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 07:41:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-35691a231a7so8179015a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 00:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777448490; x=1778053290; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RFZhSnSnaJvbVAF8eyUqTOgahKo+NC7KLHnE9JI0jEw=;
        b=n23eYsaIk+uLth7Avh+i9KYkshX14qJi3QFvWidcRzhRqCYphxYJFyk2OZcIkcmidh
         qUXHXx9ZmDd59MTih+WDttXwk3dS5UpuNQckNg6JEmIFRXyFGNggTRog79CbzSEoFcSz
         Z9B4QEBETYF9MF3quORjnFX8QIDzYhen8h9/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777448490; x=1778053290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFZhSnSnaJvbVAF8eyUqTOgahKo+NC7KLHnE9JI0jEw=;
        b=gY6a0o4+qliEPHQEB2jO4Vves9CWRb0SaLHm9X8kmlg/YBWJeG+SMykfCc8ilbAgva
         ghQKwT4i9K5ysAgMB3NC/sHDPBd++nM7UtyVygms76zHDf0uzAFc+iT9oGECP3zEnpcL
         Ju8r5LYYbBs0UNb2MK2PfCrtk0TzFI54EbhOiKKAjIqQh3RGmjnIyJW4vVALP+2C92Qu
         APcmS8mfRwbXzR8yv5vzChh5kSohpq/BJ2k840AuMwzG8dS+AAEPzr4wsFejiLO+ZSER
         n3CWXUdUoM5fN/jegE7yYvoEb3WtW/fb+W1xMy3wPyfq2BglfbjnWEWtNLxh/Yt94Lns
         1Ouw==
X-Forwarded-Encrypted: i=1; AFNElJ/VldJi8ASWd2VKbdQTEu9J98+xh8tEl4l3IocZWLaxYOzQjN/NDM3xGTY14t5iY19ZCBSjRZVcURdDn604R8En@lists.infradead.org
X-Gm-Message-State: AOJu0YwRo47lamkqXvFkFcfLVI++pSwGUAqbzl9jfbCx1sRFYIa1LPLY
	0gAIcKXna9kwHtH4mwBC68s550xiEM/ryIQBwsEz7TBFWgputMBiGQu45bfe1xMDMg==
X-Gm-Gg: AeBDiesyOWyAqL06PUxAEkHueV2S41uWs6FnucnLt50dP/RPlb6yKHf+KsVz8GdPWaK
	/1TttXC2KSgTWGemd/GYIwtj8rq512Qh48LJkz6j6Hsian3S/7ARcZNMOMNa6Jd5gu0iZOQkTME
	9DsWAGz1LX4wIWAK9NEWbPuN+xch+xODd4995ch0PnERmxOncUdnY+IMV4YMEpn54a+DC/tavRZ
	F3sqZdUGcMzcU38r4t4fS73nqK7IR1/IZ0KbBabetPQXW2+nxCBlEo3UVwya8OfWOiUv3YJeSSI
	/39AbOYzPvCiGb1RNueByStuIdNrnrb2NR43wVONI0uwHeh5OxyXHZz2hgBj9V9teDaJDTXPJbU
	8dTeo+6xyLKhdgVRENfkvwh9UHnb1emliHBG0k71a+sfn8lhTsS1kkVz31dZlMh9U0rRY7iTuX+
	5WOqDDXsqC4LcG2k8CUnLKUfIbiW7P+uR9axud+TZZZPEDDuPxCB0Z2PEeX+1m3lsBUEhG0bPw0
	yq7aR7U7RhXpQM1yf0=
X-Received: by 2002:a17:90b:2fc5:b0:35c:b02:b5c1 with SMTP id 98e67ed59e1d1-364a0b2b59bmr2680846a91.2.1777448489640;
        Wed, 29 Apr 2026 00:41:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:e49b:67f9:cdcb:8366])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364a439248fsm1341528a91.9.2026.04.29.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 00:41:29 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/6] regulator: mt6359: cleanup and add supplies
Date: Wed, 29 Apr 2026 15:41:06 +0800
Message-ID: <20260429074113.3720271-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_004130_675740_010D5DB8 
X-CRM114-Status: GOOD (  20.92  )
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

Hi,

This is v2 of my "MT6359 PMIC cleanup and add supplies" series.

Changes since v1:
- Moved regulator supply properties up to the PMIC mfd node
  - This requires moving the properties to the mfd bindings
- deprecated vcn33_[12]_(bt|wifi) regulators and added vcn33_[12]
- model the deprecated ones as downstream to the new ones
  (vcn33_[12] -> vcn33_[12]_(bt|wifi)
- Handle internal supply of vbbck directly in the driver, instead of
  specifying it in the binding
- Added patch to constify data structures in the regulator driver

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 3 deprecates the vcn33_[12]_(bt|wifi) regulators, and adds new
proper vcn33_[12] regulators. The two *real* VCN33 regulator outputs
each have two enable bits that are OR-ed together to control the
output. This allowed WiFi and BT stacks to separately control power
output without coordination.

Patch 4 constifies the data structures used throughout the regulator
driver. While not directly related, it touches the same context and
it is easier to include it in the series.

Patch 5 adds the supply names from the DT binding change in patch 2
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

Patch 6 implements the changes of the DT binding change in patch 3.


One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu

Chen-Yu Tsai (6):
  mfd: dt-bindings: mt6397: Add regulator supplies
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Deprecate bogus vcn33_[12]_* split
    regulators
  regulator: mt6359: const-ify regulator descriptions
  regulator: mt6359: Add regulator supply names
  regulator: mt6359: Add proper ldo_vcn33_[12] regulators

 .../bindings/mfd/mediatek,mt6397.yaml         |  50 +++
 .../bindings/regulator/mt6359-regulator.yaml  |  52 +--
 drivers/regulator/mt6359-regulator.c          | 400 ++++++++++++------
 include/linux/regulator/mt6359-regulator.h    |  10 +-
 4 files changed, 339 insertions(+), 173 deletions(-)

-- 
2.54.0.545.g6539524ca2-goog


