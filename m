Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC2E606A864
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 22:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vrkh7RzH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VFq+3dDH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3mri/QZEgpm6PEQDC7RLq6cQ/hDLdWlk+7v76qgnP6c=; b=vrkh7RzH2M6h9K
	XC+VdgLqfEd5buGGGVqNwdOmL8o2+tPGnZKOjQKYGWVZN78nHgkDNaP0RT6M2iX6jZW8nN/XbllEK
	Zh4q9DvRuPVXojas3yqmyYHblGPJM5Kkm5QlI27WN01ZJ7ymvJds0vSgnYllzZYwKSo/M7++bRY4E
	+i/HB6knAyTTDDr0qlzT+QoYH+XYhusggB1HL+xS/oeqUt3b0iX1c6bzWKyWWDd3jq/HpLWd768WF
	87suwTXjGbj79fyFi453zpdx3KKJVp5DyJnxnlP8G2i65tHArCC4O4cQOfThndzQMTR+zAYgUXgHg
	pPheAzqCm0QQvZ+O/8dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjUu-000000079aq-25Oj;
	Wed, 04 Nov 2026 22:30:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOjUs-000000079aj-3eYW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 22:30:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F102A60C02;
	Wed,  4 Nov 2026 22:30:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2F51F0093A;
	Wed,  4 Nov 2026 22:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793831421;
	bh=3mri/QZEgpm6PEQDC7RLq6cQ/hDLdWlk+7v76qgnP6c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=VFq+3dDHC4imojbcXXhl8reeTOTwtvGzur9ckCYanXyxSIeqKe7vEMqnSPfh2Ppq7
	 Wc2/PVHekSuQkMDTpT90ETHtvDP6LyLH2WH5UNtuBbFJw8pOZRVdSHj/+4QhWjq0s9
	 IKQrqIPZE+mQ1skl8cTkV4JvkQ9R7oGBYhc1Oohjse/tHNAcHo+Wi5wnCs1MpEvslg
	 HTfJU6/ZYfxdOcJ0AMDV1ify3r4nLPBZeHbov+FAzUj/PxpaBv+Lewx9Ro6wRI+SDg
	 IufT+mNYbXYTVnGJ1wNM4kW0LJ6ZWttk/9T3mM+iPrMV9l/ujVS0J6ii/MXWzOB4gW
	 QJfTsLnZNLB8A==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
References: <20261020-ups_mp13_clk_spi-v1-0-6c00730945c7@foss.st.com>
Subject: Re: [PATCH 0/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
Message-Id: <179383141362.620422.9540521231939469885.b4-ty@b4>
Date: Wed, 04 Nov 2026 17:30:13 -0500
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=d67aLjjx5NPzRK8+TYg7tarnAbqEZJwNtwj/735hMts=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJeb/xukcty9GAY+47rdo4TBJy6cs0yvu6zffbZx0Iw2
 4q5qEqso5SFQYyLQVZMkWVJrlFBROoq23t3NFlg5rAygQxh4OIUgIkcD2f4X3rjvX+6AHfajQ+Z
 V/fX2366c9rNQ3q1Nod7mt/y2L3WBYwMi3/NLmr1fLbdqvO5HEuzzobIJx3Kk7/+P5Vn6q51aL4
 QMwA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 10:31:06 +0200, Gabriel Fernandez wrote:
> clk: stm32mp13: add the SPI1 to SPI5 bus clocks
> 
> The STM32MP13 RCC provides the kernel clocks of the SPI/I2S instances
> (SPIx_K) but not their bus interface clocks, whereas the STM32 I2S binding
> requires one as its "pclk" clock (the I2S driver gets it with
> devm_clk_get(dev, "pclk")). The STM32MP15 RCC already exposes them.
> 
> [...]

Applied, thanks!

[1/3] clk: stm32mp13: define the number of clocks in the driver
      https://git.kernel.org/clk/linux/c/eec8af6e2558
[2/3] dt-bindings: clock: stm32mp13: add SPI1 to SPI5 bus clocks
      https://git.kernel.org/clk/linux/c/110cc8efcacc
[3/3] clk: stm32mp13: add the SPI1 to SPI5 bus clocks
      https://git.kernel.org/clk/linux/c/6140e27299bf

Best regards,
-- 
Brian Masney <masneyb@kernel.org>


