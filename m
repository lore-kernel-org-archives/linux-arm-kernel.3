Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C5BD3E773
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RiIH1HYwsImzEJ3i20lQJhzXuSrrqWNiCzP/sbG0lmQ=; b=jFv3GEOro5mPop
	VMMvhVvfRVVJqM9IfuJTkcxUIPFXpUY97E4kpsGnqB95NR4WUEbuqv+clxe3iw4lgdHKwQWWSHfPU
	E060bLtLpd7jvDEcMDDvlNREtqc/cnYaFDxixVpo647M7WeIww6P80IAGxyBdNpks8Yv87bytnJSj
	cbh73th3FG0bXGovJUhy017jfMncZMIK0T/I+vVK0oRdx1ysCOKpnrfUU1DPaud0MPpNde3M6Jb9P
	+FRWJdRp7HPokLSONbqTrg9f2TZj4VX0JPA1B8eXYpbt3KDcwYWBIF4uDAeZ4oYcocn3WN8o14L9y
	fM6+Fw6Dq6+hhi+OjeSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RD0-00000000sdm-1luh;
	Tue, 05 Nov 2024 21:35:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RBG-00000000sOS-3UdT;
	Tue, 05 Nov 2024 21:33:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65F7E5C4D0F;
	Tue,  5 Nov 2024 21:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BE83C4CECF;
	Tue,  5 Nov 2024 21:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730842421;
	bh=gmEfvmYRrOEhveo9TzLIdRgKJt2TtDdbk0WfhRNwuI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LpTsH1qXgUEO/6AX3Gjk6Gez6UQYdz2/PVOr2RWndY80oROZTmtVVLyukEQQ77FkS
	 KZdPmSwEsWysVQqbIbK3pfo3x3WeJztIjavT9TKoFMAxuSnYN1vLhLfunkCgNhOGFs
	 8rHH+ay6kDRpx4WPWuexRXrXypaAWMx7HQO+GZ9Lry6Oovht9hYbKFeeJWBtRl7WE4
	 qfsTLJIVzIX3mMhTk1J2Vq5a6MPp3oEdBsGgyJ6mDjuE7PGEFxDdjQ7AIFxjAj1Syp
	 G3cBczYSaetEPKeLpDib+9v1H0fpvLSLhg/Snmui41Dqpk+Vmr0oE6oWM5f5q9W1xM
	 wbdONkM9kF1Tw==
Date: Tue, 5 Nov 2024 15:33:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20241105213339.GA1487624@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aca00bd672ee576ad96d279414fc0835ff31f637.1720022580.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_133342_963246_534934AB 
X-CRM114-Status: GOOD (  13.13  )
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

[+cc Jim, Krishna, Vidya, Shashank]

On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> PCIe controller driver.

> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c

> +#define PCIE_EQ_PRESET_01_REG		0x100
> +#define PCIE_VAL_LN0_DOWNSTREAM		GENMASK(6, 0)
> +#define PCIE_VAL_LN0_UPSTREAM		GENMASK(14, 8)
> +#define PCIE_VAL_LN1_DOWNSTREAM		GENMASK(22, 16)
> +#define PCIE_VAL_LN1_UPSTREAM		GENMASK(30, 24)
> ...

> +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> +{
> ...

> +	val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> +	      FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> +	      FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> +	      FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> +	writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);

This looks like it might be for the Lane Equalization Control
registers (PCIe r6.0, sec 7.7.3.4)?

I would expect those values (0x47, 0x41) to be related to the platform
design, so maybe not completely determined by the SoC itself?  Jim and
Krishna have been working on DT schema for the equalization values,
which seems like the right place for them:

https://lore.kernel.org/linux-pci/20241018182247.41130-2-james.quinlan@broadcom.com/
https://lore.kernel.org/r/77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.com

Maybe that would be applicable here as well?  It would at least be
nice to use a common #define for the Lane Equalization Control
register offset from the capability base.

Although I see that no such #define exists in pci_regs.h, so I guess
there's nothing to do here yet.

The only users of equalization settings I could find so far are:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-tegra194.c?id=v6.11#n832
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-qcom-common.c?id=v6.12-rc1#n11
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mediatek-gen3.c?id=v6.12-rc1#n909

Bjorn

