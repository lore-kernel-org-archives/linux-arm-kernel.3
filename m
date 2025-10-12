Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD708CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=; b=b4XgXGSge3vL37mfrjkafG5Dgn
	HGo4sn2VLlFVkIA4ag5uA0O0GIcqbJAGVqIiBQtTXqVyePOPlUyT9e2G8B/kJ5iTaLNdOyzzCqQ/P
	u2wsKsLIvkvWvZsgOhZ7y/vTcQ1E/KeSdNiScD+ct/jWFzulOoTSvp/oQPxpl4vR7DJBRojfBIfpU
	xStUYx12j5YnJjhv6M+UEE3Y6Ktxcsl2a3ztNSYCC5eYEsBFQX5kFVY6ha1jHCu+TxUH5tPB9Kgpw
	E8eQenqXV0BnFv7VjDVLLjo/wBpeEVjlx8ckef2UfYALX7WgcOvp8vpBA8BpUs65eT8g6dEQ4RNwH
	Ihs/95kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839u-0000000BlTY-2Anh;
	Sun, 12 Oct 2025 20:59:14 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839r-0000000BlQj-09DJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:12 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so2065423f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 13:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302749; x=1760907549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=;
        b=VXUceYzL4PGznSp/3qxb0pJqd0/ty7eMUw+j4emXZnBLgV0bCH2rpkOnMXdST1jTy3
         grMA3dYA4K9o0iq3I4qD64o7dJeaZCxZibAC4vYr/nuPC535zN8oVNb4IO3cJbJBAFwv
         cAZbn4RE89CAGo/UmVtlV+j6GXI8E7Qbb/qOb9t21A4tR4PFWy3Y0AnbXIMJWmm6zsk7
         IGS2V3W0QMQUoxGOkSMbj5MiIqDMKEL4eO33YsoQrKIpkFUfbNsMwZO2mU/HKuS8b7n3
         CCieRogC7UcxQshnjN9CcB9mSTJqisTWFKaaJe7bGntydjlYJAgtb5InDvjoZ0PZqA60
         fpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302749; x=1760907549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV+6yoKv/P9OgvlWPQKcQD99p3mLWnHYMK2iXPsZM3o=;
        b=HQjtYDEoFWvuQ8vDgqd8wh8cG9oBPYt80BwE0jVN2z9WoQk+4X8pjqZ1AOPMiSqF46
         5X3+6ys8VPq5sT4gvZU8z5zU+fMwehrIaoeI0j3qsfrDrzr+N07ayEehLH93ZJRO00PI
         y20vdQJitIl8a2xWOFMbUHGMcVj2aFbX+n1Cw4VNUuKgsVxAuFTghOBSA5JwpiHE3ws5
         j9Qs3Ejwjq2jWzhonM9UGSWZ0XLiuyCC5IN4twmXihCQQt2gCDpamLsWsWRjzTDOmDuB
         w4F5k0IzBxX1QnvVMrF+8qNIB/AraUQ0NqelSU2z9cC7LfNn4+xpfN9GzfpeXZ411pv9
         OfZg==
X-Forwarded-Encrypted: i=1; AJvYcCVbUQBuZnxxjaHRGCy6XG/glA0ua1qwwZomawes3A+tJptyY+vCg849Ds6XKGz9FYu+i2M2CTyUise1xbSnQMq4@lists.infradead.org
X-Gm-Message-State: AOJu0YzTGXIyA+vBXW+XfzviJWmcLjPiP7WvGpfPFairfIZt7Pn3DKJo
	rPRyIEI0askRV3Whksw/4rPD7cWfW0yae4o9AUgLktIGLOJVL9hIkV/A
X-Gm-Gg: ASbGncuYQNRESSgy9qmsOKWf6jjLMnOhiN5hjQhzknMHAmD5E18nfHAa/HK1FV6+H5r
	tsfvDB4COmuVun/B9ntIBCkY+VMh75TyVVDmuIR6zqYRtLnvVIJK88tDmWMHBUKgkhWStlYQYoZ
	o0rsW/+I7XJmrFibwzpBToMbhuPMin6Ukkv1JcbOQCn6GdEf8OzCk09TuMUak2zrYrRni2zUSaM
	aRZhRksxNxRO8/9GStZCZg7LZUexqyKCA2QkuB8XRXhfnKE4rfaYWxMS+qgUizq9E4AgQ3Zn769
	JTjpPBySouEBW4IaJkziZZXOjOHgxBT5g6r0ffae5ecpk0bisrXjQ8V8KK6SL0FvvuCqmIs4/e/
	EoaZ9ECQjOlbu81sYxXEbj5Kb9ha4JLS6iII+VfiV7Yqq1dBi3D/IcxVZEYWWeyaUqMa8RS1KNG
	7ac/dh1WLm
X-Google-Smtp-Source: AGHT+IHtY+2+uH13hhyazhLdneYWQO5n0wlug1GAYN01XwbK9r5lScGjBtdQeUGHDHf1GNUaqgMf6Q==
X-Received: by 2002:a05:6000:3111:b0:40e:31a2:7efe with SMTP id ffacd0b85a97d-42667177d9fmr12401174f8f.14.1760302749069;
        Sun, 12 Oct 2025 13:59:09 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 1/5] ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623
Date: Sun, 12 Oct 2025 22:56:55 +0200
Message-ID: <20251012205900.5948-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135911_142854_8CFC9F28 
X-CRM114-Status: GOOD (  14.89  )
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

The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
was wrongly added following the pattern of other clock node but it's
actually not needed as the register are not used by other device on the
SoC.

On top of this it's against the schema for hifsys YAML and causes a
dtbs_check warning.

Drop the "syscon" compatible to mute the warning and reflect the
compatible property described in the mediatek,mt2701-hifsys.yaml schema.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index ce6a4015fed5..128b87229f3d 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -597,7 +597,7 @@ larb1: larb@16010000 {
 	};
 
 	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt2701-hifsys", "syscon";
+		compatible = "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index fd7a89cc337d..4b1685b93989 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -744,8 +744,7 @@ vdecsys: syscon@16000000 {
 
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
+			     "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.51.0


