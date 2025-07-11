Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93122C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 16:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9PEARQKKf/9p+jlcrAMfNzhevLXRjyodsZ6OZ49W5QA=; b=WOvxr1uLpDrhu1C7elubeiV81Z
	VsCO3KspI+OAnhiMaut6k/lNFy7cXawkzNZ/ijc2SFYUjDbj84UNBzzj47x7hXDlpT4GrtTvsl7Zi
	GM4Et9ZAjKE9b0uASJ3+M0hX7AqNTVK9OGER3QQKdk9plSeaHpuuIa8FN6xMqp9F/xAz1Fy2glkpA
	zlTnw10V3EOaJzwN1tUvNdbW40wVu7sx0U6LnPWx+TvXmCAvG0h9k4P4qyA1OWg0xB3uwChKFo9oK
	eb2mOCkVs3hPBSyHu8jy/HSRxIY4a60gARU/vZFjXOcAPUnANK+KH3Xi496XX1Qk6p66aHS3Gptsz
	S7atSrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaGID-0000000FEUF-220y;
	Fri, 11 Jul 2025 16:08:09 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFCI-0000000F5YM-2pCX;
	Fri, 11 Jul 2025 14:57:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1752245869; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gUISBzJNp/J3+ipDHhCGxFk4104DqECAChH3INJYk5klQJgaqZnvTQZqQYRzhxmCFyi9ncNOinnt9z6fuUJNaBpBhChpUH0BuuggJD2Rzhb1YoZxmqIxYHrTHzcBYkD6t2MlhJghqJHiB9kYl90rnzXloduKPJDo1rzEvUFjeyc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752245869; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9PEARQKKf/9p+jlcrAMfNzhevLXRjyodsZ6OZ49W5QA=; 
	b=evHJ8Cyt4Qe7MK595+5A40U0HWg91GOOuRU7UvGFDQzYQS+g+pyyetQ2GWgxfz5U7bN40GhgqP9rRTcg9XTIcfw6QP28voIZOJazGP/n8oy8F2GpO8wnUvDdBEN9K/4yGhvviEc3pex2ggfUrSO1/LJDLq/gY3BPrTQjNpsntqY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752245869;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9PEARQKKf/9p+jlcrAMfNzhevLXRjyodsZ6OZ49W5QA=;
	b=NQrPo/RO3TTaNvHv8m6D3Tbwyn+2J28Xf4GAYryCvri/oUV3aDFalTqMywaaoWH1
	tgiw2SmmnMNEEdXCdVWCBAr0qJhYfTEP3U6DDCJdB8GUrUPYOGqo4JrdLjqN8ilYLa5
	vFRpaJxp/Vb7/9mgrf4tVTaXO6YvwyWBUl/wgnPQ=
Received: by mx.zohomail.com with SMTPS id 175224586740314.377934690162078;
	Fri, 11 Jul 2025 07:57:47 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 11 Jul 2025 16:57:33 +0200
Subject: [PATCH 1/5] dt-bindings: mfd: syscon: Add mt8196 fdvfs syscons
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-mt8196-cpufreq-v1-1-e1b0a3b4ac61@collabora.com>
References: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
In-Reply-To: <20250711-mt8196-cpufreq-v1-0-e1b0a3b4ac61@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Hector Yuan <hector.yuan@mediatek.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_075758_777100_0399DA46 
X-CRM114-Status: UNSURE (   9.84  )
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

The MT8196 SoC uses two syscon ranges for CPU DVFS that are separate
from each other. One, mt8196-fdvfs-config, is used to check for a magic
number at that memory address to verify that fdvfs should be used. The
other, mt8196-fdvfs, is used to configure the desired frequency for the
DVFS controller for each CPU core.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 27672adeb1fedb7c81b8ae86c35f4f3b26d5516f..5ee49d2ba0cdb72dd697a0fd71c8416ad4fd2c1e 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -88,6 +88,8 @@ select:
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8196-fdvfs
+          - mediatek,mt8196-fdvfs-config
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb
@@ -194,6 +196,8 @@ properties:
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8196-fdvfs
+          - mediatek,mt8196-fdvfs-config
           - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon

-- 
2.50.0


