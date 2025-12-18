Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B70BD6ACDD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 16:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtbpbbpV9bUsJBGaPOSut2qlkR5Ouq49ldE2JFrXQNw=; b=Pvrws/irwRqLvoP3qlsI2vrIyr
	VNQNWLCEhENUMacXWNeNJYoDL6zosT2XSFbAQ19SUl9xSEOqvjCMhEhzp7IWZT7XnSRbQMPBxVf0b
	u+JfzlDmFHN+iGUdWUM5q2Ajt72dwrtBCSuNSWl48TKT8f4iekBAZXKi8/bRUy63IUbduT0xMYHEd
	kXvtkb3yDU/aAAU6Ilgj6lcqdNNKLu4bswxhv8swe8c9ezX5kF2S70JtUQe3gnDTUuG28imJ+p48+
	FP0FN3i0UGi6JSH+2esVEoVY1xx6ICufi5wdXjFm3FM+TE8Kq/og8oQAQxQE0ftElsYNNIk/7LUCH
	PckK6vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGaa-00000008n3O-2P6Z;
	Thu, 18 Dec 2025 16:10:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWGaY-00000008n2k-2fav
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 16:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADF6860008;
	Thu, 18 Dec 2025 16:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3E74C4CEFB;
	Thu, 18 Dec 2025 16:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766074249;
	bh=zlgwqexkBMnoqotoasLnmEGnWT3Dr1HRS4BATSlZwKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l7Y18yQiBkXWcWjcByBadrlPgG0wKuIGVGiFXaBgFzasOninl90Z26tTM9PRFrAi+
	 vL50jYUJCyB5jQhgUYScc/yR3IVPB8H6dXspE68wvyOvADRxgKDJCwRkCwjKOzFZEi
	 /H/HIgd6hGptTZBrN7T7AONbHF5T2ohjBwPBBqo6JGiwJaZuCnAypqxJ3CpkFIe/r3
	 f3vzZtbjS1Kg6zFWoTXSDwFgPoGix+Z0Rz4ikqxVf7R74bWOgR/KoH3pXRvIy/gblI
	 +pxPx4VojQ1z67lQi+1UlAbt6OW/z4Yc+KQmw/JmazkGiYCsdE5Q3+zrfm7l8eXZ58
	 XrYW0t0PVNy0Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
References: <20251118-b4-ddr-bindings-v9-0-a033ac5144da@gmail.com>
Subject: Re: (subset) [PATCH v9 0/7] Add DDR4 memory-controller bindings
 and factorise LPDDR and DDR bindings
Message-Id: <176607424544.18448.1362838186917250806.b4-ty@kernel.org>
Date: Thu, 18 Dec 2025 17:10:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
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


On Tue, 18 Nov 2025 16:07:56 +0100, Clément Le Goffic wrote:
> Introduce DDR4 bindings, which is the first DDR type to be added.
> As the DDR and LPDDR use the same properties, factorise them in a
> sdram-props bindings file and rename lpddr-channel into sdram-channel.
> 
> Changes in v9:
> - In the ddr4 compatible pattern :
>     s/ddrX-YYYY,AAAA...,ZZ/ddrX-YYYY,AAAA...-ZZ/
>     The comma before the "ZZ" part has been replaced with a minus.
> - Add information about how the compatible is constructed in the patch 2:
>   "dt-bindings: memory: introduce DDR4"
> - Add Krzysztof Kozlowski's trailer on patch 1
> - Link to v8: https://lore.kernel.org/r/20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: memory: factorise LPDDR props into SDRAM props
      https://git.kernel.org/krzk/linux-mem-ctrl/c/dffaa1beea9e7a0d902fc4e25e137afcf1297267
[2/7] dt-bindings: memory: introduce DDR4
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b5c1a217552c3513977a9f1138b05de0bada8a52
[3/7] dt-bindings: memory: factorise LPDDR channel binding into SDRAM channel
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6ab3581ab19fa348b93c85a793e45cd8a80912a8
[4/7] dt-binding: memory: add DDR4 channel compatible
      https://git.kernel.org/krzk/linux-mem-ctrl/c/36ecc8346747b600892e3040e1d0ecb1e939c6e8
[5/7] dt-bindings: memory: SDRAM channel: standardise node name
      https://git.kernel.org/krzk/linux-mem-ctrl/c/9805f2cfc883018f7bf84c84e3af3786c37dac7b

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


