Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BD2CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 11:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SbWzV2vPE++u109IpxS5OpTrsMRMsUHWUjB2MEW5hF8=; b=h2oKvnolEd9mpDG/NYi2se+8aV
	57XbnLme/TxfapVNMUFkwzTPBuIIStA2q/GnMQSyiMZMlwGqfAiySvqfnnr8DrTuxtvaeo3sYuYaZ
	JnG2o7IIbjU7Wn2QWmrFKKthE0tDdTrS/s8VtnjVTVlsAVQYwnoNfaDCdPwbELEa+34rx2PYRMyJs
	hfC7HstKtYDjCJquzD4Ex2wJc/fHDSNqyf7QA7zxp1NtUUabohzzDsnGkKZYEZ/hv0r1TKi6dAwED
	9bDaQIVi2JVJxjzi0nvO2scOMYGpU8c/+xMFji4s9yv17fJ5vlCOYxvQGtssvGBLn3k0NyxKQ2w2H
	wtEm2LFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11OC-0000000DD2x-0EB6;
	Tue, 23 Sep 2025 11:40:56 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v11O9-0000000DD0A-1iJC;
	Tue, 23 Sep 2025 11:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758627640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Rgp8McNENZzRnj2r1cNqPvFh2g+a6ag6snGvabEghvVvFrIi37mqpGzlV0mznEZE0xI5/uIOAGdYvefreSxRaCX3vSwuFYvn7XjKIdRs2O3NvYUlMJDOMYBIiA/qMPFIKOs5HjJXXBZgo2QZpKWphMLhhKkbtnQVE6QpcbKXifo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758627640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SbWzV2vPE++u109IpxS5OpTrsMRMsUHWUjB2MEW5hF8=; 
	b=bHzkaqSxeXNfUSm+xRWZGbDUIWj7tlo6MBlwWas8rDDCDISr6Wmn287VB1io7qqQdfuxVFk9REWnWttaEZG1IYetaY6G2RPbJ4U7JjQK9lxiw/54J820WTzhcTVXIrNSPWphmxmU1mRfAcqHe9RQ2naC+X/rg7L/dHKh3b67dI4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758627640;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=SbWzV2vPE++u109IpxS5OpTrsMRMsUHWUjB2MEW5hF8=;
	b=SjDTYPMlppu83vvOIAFjFcZiwoAhoT3OHvazmZAM5Huv7Mf3qKtr9piqiMREAbjO
	iPH2nKg7ONERCDhI/NBvmf28158Ui4a1h6wZGjeiETmAHzVqUCV1pGMP6GtWaYYAfMB
	tPKb0ZABwnFZqYBYDnz2y1IYWIY0jUWlZ1dvzhBk=
Received: by mx.zohomail.com with SMTPS id 1758627638907817.5750146025789;
	Tue, 23 Sep 2025 04:40:38 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 23 Sep 2025 13:39:56 +0200
Subject: [PATCH v4 3/8] dt-bindings: sram: Add compatible for
 mediatek,mt8196-gpufreq-sram
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-mt8196-gpufreq-v4-3-6cd63ade73d6@collabora.com>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
In-Reply-To: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_044053_617758_81C44E78 
X-CRM114-Status: UNSURE (   9.59  )
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

This compatible is used for an SRAM section that's shared between the
MT8196's application processor cores and the embedded GPUEB MCU that
controls the GPU frequency.

Through this SRAM section, things about the GPU frequency controller
like the OPP table can be read.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


