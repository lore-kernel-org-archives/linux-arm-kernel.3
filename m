Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F94C3ABA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 19:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AggKn5qQSOyJ8yR7ej8IqO+s6E4KoXzhfYiniZSkALQ=; b=qJRPHbzfV1mhR2iPllM9fnm3vb
	mRou76qR3gKMUEW8FFvZym2fPR0HMLXpDlTJ3vLK2nsEyCa/li0IlSJxAhgkUKDJ9ehovFcvPuM6/
	gJ/tgd6fvREZr3vZ5ZsfxthhdzZ5dBZD1Y1u6LDsLRYIIwwwD7aVE1t97oZrW7DWUv9cf4eZuOGKW
	A5vlZEir1EgYLwlNsiuyJxQkciQk2uCwSU+G9Ye/XekSr3isJjFc+oB6MBqD3s1supenRrMvZf1O8
	WKSvLdx5zOLsiVYfeDutdK6iFzd/MAVbmdfw0M6eONr5vCEPK2shLGuO3E8rkuVwdGiVci6JiOBp5
	F/RHg3wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADLR-0000000DpCN-049R;
	Wed, 30 Apr 2025 19:43:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADJV-0000000Dogq-3R1I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 19:41:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 24A2F68499;
	Wed, 30 Apr 2025 19:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3D6C4CEE7;
	Wed, 30 Apr 2025 19:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746042108;
	bh=hpfAhy/7tVhagfc9z4JgybjSfRl2vTPI06TuCoChDUg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y9UCymD/N2lgHtazdCALwEztIiO3B6AihkoBnLIQwX8jf5BouAMCk2GqQO+F2j17i
	 LD1YLsmNsWc8n1bJWzdge2XYDrroxdW4jpDyx/0s5xuN79n+gMpVMxtQXk4R/x3PTD
	 g25P8NedW9cmZohv1NMH2CHa9fKEpXnmvclK0s3oq+eewwqMhBuMxOaOCu8PVcEfRh
	 JvO0YW06OXT8OvmFMTpmTv2N+3URcdcn8aJb7wMOboV8lSbOdBLJyky7PJSQo4mn8Z
	 9wBEJhdKv6ozC3X8zlFQTnSxmokHy8FxBnmOkdWg9qWauZuHX3SnLLEXi/Tc04m7Kq
	 mX30ayso6Irjg==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hector Martin <marcan@marcan.st>, Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Apple PMIC NVMEM cell driver
 (Formerly: Generic SPMI NVMEM cell driver)
Message-Id: <174604210497.121736.17664603572137635486.b4-ty@kernel.org>
Date: Wed, 30 Apr 2025 20:41:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Wed, 23 Apr 2025 19:55:12 +0200, Sasha Finkelstein wrote:
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
> 
> The NVMEM cell consumer drivers will be sent in a further series.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: spmi: Add Apple SPMI NVMEM
      commit: 342ad99689be22776c50ab5d82064b700e516a98
[2/3] nvmem: Add apple-spmi-nvmem driver
      commit: 8d2900cc141122ad3a754d6d86cd15a9a4bf0b74

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


