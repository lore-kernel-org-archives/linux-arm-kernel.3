Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B675CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5o2cb+RS3e9vM6xcSLE475S0MGwfkgp0FUKoEaEDRlU=; b=j8Y+SBaLlzJaFVkOvexqQXz6LM
	RhmSogSn0ffaBWispOaYRO7mTQ0wEndJfcly56WLyuQPScdjSEZmiPQpi/ywsG8dmMOh5HxvCwGM0
	Dc7RLQZM33Qe1ptnOKeKjz2VcCpUJgjlkHbH39DbEJDg0S8TDjZ0PLEGIT3renuDRWtMpSzdyAvUU
	R7FLihKZoPRELc3Kh9iS4wOfMLlKtUlVsKRbjv5jXUEc8NfXFywDPh7pgrnNYrAuFMb/t/kMQIQpV
	kpWn8UeePSoo49gcx32wzFk0G9mJBO4Hn98fEZVrg/OC4dEAWaszF/LRyxIuu+j8kdsUAgzvzkHZr
	fFEBKC3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrCB-0000000BIkn-1gBS;
	Wed, 17 Sep 2025 12:23:35 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrC9-0000000BIiV-13Vm;
	Wed, 17 Sep 2025 12:23:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758111798; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W26Gva+bHpne6WMF5uKZgSqyBdL92tU9AnT3VLV5vReGApyw/lpS1kfdh/F6CkLxYx3E7kPKFVjY6cNjhXv4jEthGME0FEOcHfTIEzqnmGyUX/M4C+mY/aq7Ka3H1NUJfdSK/domA/9lt4PMszsYzlipsSCGUZlC/JGOmeK2ils=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758111798; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5o2cb+RS3e9vM6xcSLE475S0MGwfkgp0FUKoEaEDRlU=; 
	b=SmYBeiKwTHFMvt+H/brPs39DJxvj1ox6WWx4ySNfIkpA4gfJRsTNbLsZ9MuoB5bFRgYsTM7dbM17z2efC0TPFlQWckP9e29o92rALU0/qPGM9+Bjf+B0F/F324ZL3wWMgNruGG9hSkMaH4KXH20S3hJIdk3yQ+VvYf5JBpr27lU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758111798;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5o2cb+RS3e9vM6xcSLE475S0MGwfkgp0FUKoEaEDRlU=;
	b=i4DCo5WY9wx1Nlz15PunPPIbyzf93vuMZIhJwrDhzSI5Wmmku+h22ChhntkLQUIK
	KCr1/t17NX8VhRZtHzJkN1j7D9GcCrFNI6ZquzDaxpWr+iM18TTDAnXyADGrFzxT8p3
	gWXtFg4aEu+p44OupSMXYAQlDQVCnF2PK4adFufk=
Received: by mx.zohomail.com with SMTPS id 1758111796622265.07880855548797;
	Wed, 17 Sep 2025 05:23:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 17 Sep 2025 14:22:34 +0200
Subject: [PATCH v3 03/10] dt-bindings: sram: Add compatible for
 mediatek,mt8196-gpufreq-sram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-mt8196-gpufreq-v3-3-c4ede4b4399e@collabora.com>
References: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
In-Reply-To: <20250917-mt8196-gpufreq-v3-0-c4ede4b4399e@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_052333_359102_3FDDE40B 
X-CRM114-Status: GOOD (  10.09  )
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

This compatible is used for an SRAM section that's shared between the
MT8196's application processor cores and the embedded GPUEB MCU that
controls the GPU frequency.

Through this SRAM section, things about the GPU frequency controller
like the OPP table can be read.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 7c1337e159f2371401ae99313375656fff014ed4..6ba0dd6a66def11f56a1d5276d7397b655bff11e 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -89,6 +89,7 @@ patternProperties:
             - arm,juno-scp-shmem
             - arm,scmi-shmem
             - arm,scp-shmem
+            - mediatek,mt8196-gpufreq-sram
             - renesas,smp-sram
             - rockchip,rk3066-smp-sram
             - samsung,exynos4210-sysram

-- 
2.51.0


