Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89029D70DE3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 05:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=; b=DX8Oql+VJLONEot21kY3wDa0YB
	ILPajoJtq2N7TKHTlcrNU4r2WahLetvskAMlyQVLFWI+kvcgFytqyfof7f3JfNlRETQq9/f5N/g8/
	wHkW6hiLKDgwnEjlAkrGNoiuKOZSEhbatZC479Eeemw4+hpQR+qhS6L15pgbwmuglCuWhDBnNAH3g
	jQ/+flUtmMrElq7u6eCzKS4UG6Rgafn7Zhv4kIc0FXOf/Fx5gByvXQD1QfDh5CVnNuyAFkzZ+iqPO
	/i/Mcp1ywkFpNqAsBmScsOluExY3VpfqXbmKoRzTeApuP76e0kjThvS6az4jH+vP1ajIqpq6KkOWc
	SlCDt/kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu1M-0000000Gxo4-1bol;
	Fri, 29 Nov 2024 05:58:28 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGu0N-0000000GxZO-00Wz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 05:57:28 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53de79c2be4so1732811e87.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 21:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732859845; x=1733464645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=mU13xBX4s+lPy/zXbFEU3Lr9xz/jEJaZjXEfbvKl+WIBJvNKE+1U287pxoGavutgEt
         Ibj6FRV4u5MIH3dvmlTLmQIPfxmVc5XYTbaNchHWhvrHnUbrFpN5In6qjt8EG228PFdf
         8i+ro47knNb01/QfI28wRAVvvsH0NQQQx5P+E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732859845; x=1733464645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w9WF3O3Q9CqJ+jQNAGLBDdeZMuKGc8yveqCJFxa21hM=;
        b=PuDP/7XScCYcPtc3O5tgnSTRe3Xe/vruawHpzDBXngusxI+1PHkf69p+8gKXsUWAuf
         jqTf5rymu6S/8PEvx5gjGVsnUtKyeK/xLtZtdZhsY+OMK/bRSSVoPOa+K4LmA9w4CL4n
         QkPpkRWuQUE++ua6beMq00w2asvC9evEDNVeqpoISfsZ6jHsKSpI8CL4mZl7HOhmXaQ1
         RJuDPAGb5hcR1fJOu/zNfkn8QbKNCKZaQFkFToEDbiJcD3weePVUXvP/dmS9DyZdTRE3
         2ETcGbf3jdyaivfZ+KDEtcg07Hv2+xIZyO9M70fxX0H2Il07W3GgPW8qQ3XQWdwsW0vr
         4eeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbI+yHGdOM8VT4wNZLc0R4rrKtFHPvetdOr1e2R+L83c21i7Jq9txgkk8b5tjnjhorSKvUqEy+IXfc3kq8RJ7Q@lists.infradead.org
X-Gm-Message-State: AOJu0YxH3Zx/ASRGobeCjA2QYn4aZgadkwtZkN03NY/mupqLOc3SlXRX
	SdAMpEwjCobaLSLgnVKWsJ864WJgFiJoCYBFTvNmvmFzaYP4GeLIGYhDAwYAfw==
X-Gm-Gg: ASbGncsZgly6QbAVSDhc2vC9fgVbN1wzufN7FtbSnkurdo1xuXze91rFdegxooGyNhJ
	4QqU2W5D/7swWW3rcma6tOynWyFFxNXLrLQCywmy+JpKbJZE3Y5R7vdarpYZcpasyvpz9Pes5FR
	9HmAlRTeZ6HFs90pnbFkR1a3KrsKvdnNt2Pp6O9PawUy2OgcBLJSyQyTsIQnrSBw/ZbBn58c8UB
	sMGnwK19Cx6T2m5yi1tmJqcfKIjo7OIMccLX91Q+G0Cd3DcBwBUvA+DaAnfxfCsP7/XVOVC0rM/
	lB0U8sVc
X-Google-Smtp-Source: AGHT+IE65JzRNArxxc+ToexNBzoPm9HjhpdDJXXa/EKqSE7i98HFux8rxp92UCOg27WO0Cy7mDBO/w==
X-Received: by 2002:a05:6512:2355:b0:53d:e41a:c182 with SMTP id 2adb3069b0e04-53df00dc9afmr5377517e87.31.1732859844507;
        Thu, 28 Nov 2024 21:57:24 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa599955662sm136615766b.190.2024.11.28.21.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 21:57:23 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v4 0/2] Add support for Starmie Chromebooks
Date: Fri, 29 Nov 2024 05:57:18 +0000
Message-ID: <20241129055720.3328681-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_215727_044724_9F2AD64B 
X-CRM114-Status: GOOD (  10.97  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Wojciech Macek (2):
  dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
  arm64: dts: mediatek: mt8186: Add Starmie device

 .../devicetree/bindings/arm/mediatek.yaml     |  13 +
 arch/arm64/boot/dts/mediatek/Makefile         |   2 +
 .../mediatek/mt8186-corsola-starmie-sku0.dts  |  31 ++
 .../mediatek/mt8186-corsola-starmie-sku1.dts  |  31 ++
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 465 ++++++++++++++++++
 5 files changed, 542 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi

-- 
2.47.0.338.g60cca15819-goog


