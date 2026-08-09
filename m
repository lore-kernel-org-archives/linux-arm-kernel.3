Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B50C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 12:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e3KMMzv3K929D3w9UY+XxM5RHRu8d0jOJpEaxYiyjtY=; b=TgJuhzeqlPpp0L
	VKe768zT/Q7VfBzmaDcs+iJUcsGvKTkFEuHw2lwApL2jR1sC+WQBrQCXTzfh3RbIemBabA+aSn4Tu
	pksRhBRF4Z1FnfH4QSNTxed7EBuMiN6sRe7IEAo7J11xs7ZulOdUQh5o8sEteWWr+e+OfNy7xn86w
	QzyjpqQ34uCyLIu0g4qofUwKf56VtLcTgJqjbe7LQlIkaniqZ9DQBDezZlC9zPqRqech1cMcR0bhA
	FxKYKtLGxGK7LBs/ogBcxynpJuxBE+czU2y2riFWfNn09nM4qwnPT+Rz7Iow1ZbYTDGaGAtUMMITh
	O3oc1UQDhXAoAxX7ybfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2Rq-0000000AHMi-2BcW;
	Sun, 09 Aug 2026 12:16:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt2Rp-0000000AHL8-0pPI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 12:16:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4D81A600BC;
	Sun,  9 Aug 2026 12:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDEB8C2BCB9;
	Sun,  9 Aug 2026 12:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786277772;
	bh=DsfiHmyqE8aSbXZkKzysnOzPgwXdCEsx/VkGP4SjgGY=;
	h=From:Subject:Date:To:Cc:From;
	b=bHvG7ffx4zCV6lD3MAyEaAiqpO3wOwofvKCX9mFS8M64HD3zdkSQm7S/5a2cwX4dH
	 Ft82oryuR+q4xIcKwleSVi3TDuJt7oY76bkpaJNL/+EVkaRCbgg2kE8Gcgk9m2pyUD
	 Uhp/J7zJkken2KF5p7i0/aALXA5q12r3FEuFC2WrP6EPUSLLla+xBviAwrTZh1bn97
	 W30pw3z9On31TdvQjz0JFgriAEb1bsPTNZZgoXIQo2gt2h32L2qCJFRjkBdDDq1iqs
	 t4cTxhzkvKAhEZwc16Zpq8njHaoCMF/C9kzUzI/IfMrKTF7Wh2bR1s+eZ19vFBslmM
	 +piDTDHc1obVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C829DC5AD5A;
	Sun,  9 Aug 2026 12:16:11 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/3] Apple SoC CIO (USB4/Thunderbolt) reset controller
Date: Sun, 09 Aug 2026 14:16:01 +0200
Message-Id: <20260809-b4-cio-reset-v1-0-4f33777d9b4b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5EQBBG4VeRWk8l7RLBq0xm0d1+lAXShUjEu
 2tj+S3OOUkRBEpNclLALirzFJF+EvKDnXqwtNGUmaw0lanZFexl5gDFytbmnTOFs20NiskS0Mn
 x331/r3VzI/z6POi6bpQn5XNwAAAA
X-Change-ID: 20260809-b4-cio-reset-aa3fb04bad9e
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1677; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=DsfiHmyqE8aSbXZkKzysnOzPgwXdCEsx/VkGP4SjgGY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ1ZFfnNE7VrLuzN3HSpcd7HbKeSfunzERAHGT7IqlUftb
 k2q2X+yo5SFQYyLQVZMkWX7fnvTJw/fCC7ddOk9zBxWJpAhDFycAjCR2bMZ/inFntr83liqw2Vz
 lcvuzVtPyOsfF9WeGTK/gs3hbJj060aGf3aC/m2r9k7aHmm35T5XvO4t0/VbyrKuCh17qXYgL8H
 pCQsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

The CIO blocks used for USB4/Thunderbolt on Apple Silicon SoCs have a
reset inside the power manager that has to be deasserted before their
co-processor can be booted. On t8103 and t8112 each port comes with a
dedicated register page while t600x and t602x use a single register
with one request bit per port shared by all ports of a die in the
middle of the PMGR MMIO region.

The first patch adds the dt-binding, the second one the driver and the
last one the device tree nodes for all SoCs. This will be used by the
upcoming USB4/Thunderbolt series to start the host routers before
booting their co-processors.

Best,

Sven

---
Sven Peter (3):
      dt-bindings: reset: Add Apple SoC CIO reset
      reset: Add Apple SoC CIO reset driver
      arm64: dts: apple: Add CIO reset controllers

 .../devicetree/bindings/arm/apple/apple,pmgr.yaml  |   6 +
 .../bindings/reset/apple,t8103-cio-reset.yaml      |  74 +++++++++
 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/apple/t600x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t602x-dieX.dtsi          |   8 +-
 arch/arm64/boot/dts/apple/t8103.dtsi               |   6 +
 arch/arm64/boot/dts/apple/t8112.dtsi               |   6 +
 drivers/reset/Kconfig                              |  10 ++
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-apple-cio.c                    | 182 +++++++++++++++++++++
 10 files changed, 301 insertions(+), 2 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260809-b4-cio-reset-aa3fb04bad9e

Best regards,
--  
Sven Peter <sven@kernel.org>



