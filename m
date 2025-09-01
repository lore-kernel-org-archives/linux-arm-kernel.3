Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF3DCA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ImQL93cWU9txQnD2Z/VJCpp3Mddb+X9LqtZaBzfGqPs=; b=Yp9MxZd6q7YlQ2n25A9HMpDo8V
	czjhpQb47sBSK1O3pEhg1ySNjkCCJOjMh+zfWpvlqURt1/UjWMuPHKN7B5L4XYWy68qyFPTtqfDBV
	SIQ7bjUzPNoWieHMr4p2Nt4ScWGfRBRFdOQoO8S4eqGq8hTPXE4gXVsKreCfFksA/6LlHtZwK7Gth
	ZYlVj9HHkp/p7PxbZJatvVRV8ZLI6+m7SWC4UCwYP7g6UyeoDJPX5F4095navfJ/kOCuAkA0fTtgD
	PXf258oNtQKEGSw0HOb8MbRAk635QM82YO4mZEJiqK6LCJX8pnTjUnKp9BcNS2qxuSkEW9tXTg12i
	UDpAH57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszmq-0000000BYse-2TTI;
	Mon, 01 Sep 2025 08:21:12 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usyvs-0000000BQvh-0OAN;
	Mon, 01 Sep 2025 07:26:30 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id AF1ADC653FA;
	Mon,  1 Sep 2025 07:26:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6DB7B60699;
	Mon,  1 Sep 2025 07:26:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 291E41C22DC76;
	Mon,  1 Sep 2025 09:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756711582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ImQL93cWU9txQnD2Z/VJCpp3Mddb+X9LqtZaBzfGqPs=;
	b=218vl8jrV5nS1OF9XPtgqctOBR4E5Wt9W4UG6OxZHv7VtXkQRBmbUVPaVY/3b1cPBl7ehQ
	J7kK4SYpusaEVXga/qqSB0wfgkzV9Xt8jKrBzVRabErX/7SV2YBYZ2q8FAQAJ1EigBut1s
	luu06JS21cW3gu2DjeH9Jet88Qx3zB/QM7V+5dZ6hNn1z9Do6W0Yo8wZ+ClFPoglbkXT/Q
	ii9Sl8lbZqdedK97AHAk6UzFxuoZPlr5m9YkYhiiBZ7lix/nt9QHMSrAohu3Sb+yskUiXh
	F2EpllC44LqrZxMO0GAq6p3Sc0xKPaXuSnNd4s7Rq7Zgg7yw6UbWFjtYS6PmLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Krzysztof
 Kozlowski <krzk@kernel.org>,  Alim Akhtar <alim.akhtar@samsung.com>,
  Russell King <linux@armlinux.org.uk>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 4/4] ARM: s3c6400_defconfig: Drop MTD_NAND_S3C2410
In-Reply-To: <20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
	(Krzysztof Kozlowski's message of "Sat, 30 Aug 2025 19:01:12 +0200")
References: <20250830-s3c-cleanup-nand-v1-0-05b99ef990fe@linaro.org>
	<20250830-s3c-cleanup-nand-v1-4-05b99ef990fe@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 01 Sep 2025 09:26:01 +0200
Message-ID: <87qzwqr5va.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_002628_647740_701CAF13 
X-CRM114-Status: UNSURE (   7.39  )
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

Hello Krzysztof,

On 30/08/2025 at 19:01:12 +02, Krzysztof Kozlowski <krzysztof.kozlowski@lin=
aro.org> wrote:

> MTD_NAND_S3C2410 driver was removed from the kernel, so cleanup
> defconfig as well.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> I will take it via Samsung SoC.

Ok, I'll take the other patches through mtd.

Thanks,
Miqu=C3=A8l

