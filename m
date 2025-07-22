Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4970C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Jul 2025 17:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKB6gNFEIrgaeKTQOkToma4zoeyJbKtBVeqploJ//e8=; b=t+sUVa600lbtXqgsxF12FszJJ6
	qn0LKWXx8PtZ9xZz+s6OSIXKBboProq8J/NnMY6DtIGMrpMasmL6am4aBKPlm780IpDl1k2rRw/WO
	8rpZpXHALkS51AX1QScUQgMsGYNriiLVRu56XmqBeFtAkL2KbcTjNmVrTF5NbmoeyuJZjdsxSBmjl
	KjsAzd3JtEhks19PKUNIDLZDUl0SBiYaJhBM0dwNpTDavSg5tnlae+iemJyzPE0vyUf+qoxD7JDtv
	ItTD1YpDexu+n32V84Ty8BTqWxwM8SgfxyiPSjY7dI6vVmWDKNRAwMPoLdyXuG6IP7f/4tKZ0Tkej
	lOSklEoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGQ2-000000035pt-0po3;
	Tue, 22 Jul 2025 17:04:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueGMj-000000035Q1-0Dnp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Jul 2025 17:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 75EA95C48BA;
	Tue, 22 Jul 2025 17:01:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034DDC4CEEB;
	Tue, 22 Jul 2025 17:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753203680;
	bh=4ExxWF210EVKXVfZ8XRUE1perdO4miFY1lWLlDpGXyE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=o1qzI20yrVdhUnbNKS9chhnWZwfsufwiVXUoOBR5Nzqdw4VuznVLUtui48AqcvckC
	 dksJVF+i5y4kslxWQZQSbXWGchZw/2Vnydl1hmZ8MCBw3tTb7lKjvZ80/jWQKNNGzF
	 PxTgOs34OjapDTx9a2Y80Wk4bp7d1/jrUPkELzwhXxJn6f8UrfOIX0PIPqIVfqO2Df
	 CJHRsHhmxBuI6EjTWH+DSFGpZpqzQ559K9Vt3euNX2h57Hoqhp123HjpkZUmQHGvrl
	 OaieU6ya2bzCTb4dzFod3SamD0A9iFYEGl0+ELuDNjUWsaLEWupl7EPr1vj26f83VY
	 MM1BiQ/ZB1Qbg==
Date: Tue, 22 Jul 2025 12:01:19 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Will Deacon <will@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gatien Chevallier <gatien.chevallier@foss.st.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, devicetree@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, 
 linux-clk@vger.kernel.org, linux-doc@vger.kernel.org, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-perf-users@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Le Goffic <legoffic.clement@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
To: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
In-Reply-To: <20250722-ddrperfm-upstream-v3-11-7b7a4f3dc8a0@foss.st.com>
References: <20250722-ddrperfm-upstream-v3-0-7b7a4f3dc8a0@foss.st.com>
 <20250722-ddrperfm-upstream-v3-11-7b7a4f3dc8a0@foss.st.com>
Message-Id: <175320367908.42297.8460265656019241171.robh@kernel.org>
Subject: Re: [PATCH v3 11/19] dt-bindings: perf: stm32: introduce DDRPERFM
 dt-bindings
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_100121_132196_43496291 
X-CRM114-Status: GOOD (  12.05  )
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


On Tue, 22 Jul 2025 16:03:28 +0200, Clément Le Goffic wrote:
> DDRPERFM is the DDR Performance Monitor embedded in STM32MPU SoC.
> It allows to monitor DDR events that come from the DDR Controller
> such as read or write events.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
>  .../devicetree/bindings/perf/st,stm32-ddr-pmu.yaml | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/perf/st,stm32-ddr-pmu.example.dtb: /example-1/ddr3-channel: failed to match any schema with compatible: ['jedec,ddr3-channel']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250722-ddrperfm-upstream-v3-11-7b7a4f3dc8a0@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


