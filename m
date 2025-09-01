Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827B2CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgnLlO7jOt0FD4jUzFN4p+RS1ZzKoUQ5W4E4v5dt5GY=; b=chbHcPdMJF6yWZr4zfXe4Ia7rh
	mq6vM+XhMimCp4y/N34Vz/ahH1/xFv2jBCAEBohK9gz8IV9ExANqNmcWp/b9Mdsxn8yu2MSUI8ohO
	1yJPCcrOnHkOM2/0EY97ZJdIqzDxF5JDwG57mK2FM1t5n8yAzWrcYeLAPi9yhO/PGFeS0zY+6I14G
	ptBt5Zd65CTZ9SpdiAjed4+ZIOPk7ebb+PJ6EcYeV5giWgDICt2xW+sPjGe1UfHbAgDlgOG6z+vKg
	Bh2jxRLWGHhG63JvZfzW/Jj7EetnPHTcDR2Kkuy97/3yTp6C0TC2D5UZ/P5yDtcZYhnNPn5eKTvqz
	Wl+d4NCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7jD-0000000DLGe-434U;
	Mon, 01 Sep 2025 16:49:59 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut4CZ-0000000CcSz-1ne3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 13:04:04 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F1BB34E40C64;
	Mon,  1 Sep 2025 13:04:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C797960699;
	Mon,  1 Sep 2025 13:04:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9E05C1C22D9A3;
	Mon,  1 Sep 2025 15:03:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756731840; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IgnLlO7jOt0FD4jUzFN4p+RS1ZzKoUQ5W4E4v5dt5GY=;
	b=k1oKLpPB/xN0+LSXuE9pFlMVOUwjjpm7z8hAbcHZtb0psY9101Tjrjs28FX958mzmZUq8x
	j+gzj3qdRTLpgo4ok9b2M4wGzhsOcTn3dLwI/XfvMuy9C8UUoiaPqYKHReFkhFb4jX4mKw
	xIa5XkhNemDk0/EnwoEeFeRxF9WyDFFiEoKVHa85brb9FxSZD2vm+MmmIIyl+hE1l0I5DM
	dE4XNUduk70udDE+jSkvWrVjQnrV/cjMC+9xGGijQJflgcj7gtEEsIge2U0eVTdp/fhl7c
	IotwMfSHozv8JMWEu0XdK65xQ8LPdUeLPtg0IRykP9WJACUU1sSIRKgkVRVf3g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] mtd: rawnand: s3c2410: Drop S3C2410 driver
Date: Mon,  1 Sep 2025 15:03:48 +0200
Message-ID: <175673179165.52555.3449710772627669678.b4-ty@bootlin.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_060403_600096_DD739664 
X-CRM114-Status: GOOD (  10.08  )
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

On Sat, 30 Aug 2025 19:01:08 +0200, Krzysztof Kozlowski wrote:
> Drop S3C2410 NAND driver because its only two users were:
> 1. S3C2410 SoC: removed from kernel,
> 2. S3C64xx SoC: does not reference this driver.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied to nand/next, thanks!

[1/4] mtd: rawnand: s3c2410: Drop S3C2410 support
      commit: 773b9202de0127444fc8802a611a19637b7fa12f
[2/4] dt-bindings: mtd samsung-s3c2410: Drop S3C2410 support
      commit: 451f1184f8f6a90c701b9d8c8c055f6a1d9308bb
[3/4] mtd: rawnand: s3c2410: Drop driver (no actual S3C64xx user)
      commit: d40934bea54ca5509138d40ab530c6700c830802

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

