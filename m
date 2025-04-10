Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F10CC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8hkLcLDH7nSI13qsqezdG+87BGroYwujWBW8KumB1MM=; b=qPJnI4H+cACdbYKBBdeLPDSrgg
	pGdbIiCeUVXt+k6q8Lx8k6aPGpi5xQoN+UMXu9aXQYzQdXJLBq/eZVYtobuoRLigbMcNrBiFCpdZv
	Yp1P2SvALx+rtJJfo40MtPW4b5xcFw2tdis/0ggtzMEADSMdNhGso1kUiT/QUQEbu72+Hup1amTT1
	T+h5KqgiExFzemuvA3tbOlVvMu2GQUlBcoTyH7WiagPn58DuZfkLht8X+IwfDZMfLivX/35zVcLJe
	+DsDPYO5MnCI2C+FdQgZsTA7dUfc2OF18MElFWhTfVSKfN5q1JqExqbmzUdioU7YA2O/7oiJyY2pu
	NE1Sz6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mDs-00000009WZT-1VqR;
	Thu, 10 Apr 2025 07:21:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lhG-00000009PyD-2GUS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EE8F49D01;
	Thu, 10 Apr 2025 06:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573C1C4CEE3;
	Thu, 10 Apr 2025 06:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267653;
	bh=8hkLcLDH7nSI13qsqezdG+87BGroYwujWBW8KumB1MM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYokwitx/IQTfloJqvtw9W73YftJtdBU9KKufIeVzr+DmF74EgudgIWvwL5qBMRS4
	 jlp6EKU8xwPIazNpv/LIihUWSCGEhx5fFvCcm1Bg7ujD7sWjnmKQ0udLkRJCjla8wG
	 2la6raLHHiilW8u2uMsju0vz314FXtc5GtUwXJeK8FYzeqPLd3pEN+45lUkKeYRF/G
	 D7BXESDXQ5HkD+c1IXKwHovGosEVDPYnF6bSALkkjYvyPZRsUHwHyHgRz3SrHxQFoR
	 NfDhJU1HBUy+zx3oG6MjlVlciUHm1GdOTi8+mPJ1sgInqt6RWcInhWuuEeoMEzTnnB
	 WQUf2NuxzZ7Xg==
Date: Thu, 10 Apr 2025 08:47:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: Add an interrupt property for
 Coresight CTCU
Message-ID: <20250410-demonic-woodoo-kudu-bcd994@shite>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
 <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_234734_606327_2FC8A05D 
X-CRM114-Status: UNSURE (   8.02  )
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

On Thu, Apr 10, 2025 at 09:33:27AM GMT, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshlod of the

typo: threshold?

> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


