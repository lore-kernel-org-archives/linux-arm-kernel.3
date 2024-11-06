Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCD7D59F7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 23:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=yhxHGEnvGLmfUODCKVKEKhm6OSCVAv0A1JJ/Xcrv8yI=; b=Cn3GjpChYls6vbtVJOBtxWgSV6
	g3/97vWxdKxaEUc4Fa8391Prpdso82PphzQtsQelr3+TwKlEYJJr13tFP+PYN3GTevGNQQt2zAkzN
	r8kpVZX20IF2fqCkp9yCAVO2IycGy/cSq9cVkGt5lMaN2ki57MFSU9xVj5ocsvMc/Rtdz6j0KkiOY
	aslTNXjIUpaWKu6i9IBZWKA5FBm7WH0dJltjhBRVYEY5JEMDct4Q2A3ComCdywEaWXbsL8JeSuJWS
	q1/aRMpuvG648YcrQiCxkQdW0sq6ySsbeVsks21BA1UMG4P22t7164baqcSTCYOTxnQbD8SetLiVW
	isEvhuRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pf5-000000054lM-4B02;
	Wed, 06 Nov 2024 23:42:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8pdM-000000054XX-32mf;
	Wed, 06 Nov 2024 23:40:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DA502A4010F;
	Wed,  6 Nov 2024 23:38:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39A07C4CEC6;
	Wed,  6 Nov 2024 23:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730936419;
	bh=CkGGHWsAOzlrkCRfO25nUXeUnK9cjDfpzkgHRPsMsIg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=LJZfy4fXE8rdCT9INnntdHrIliXU/wiigikdb2LujfIuesFsgHjxQacPtd6you21Q
	 5Y7Yq4TF9YYqG8XiRSVdf4xoiGHQSJxL6kzX6hT1bL8OXTgyALmIv3efDZqzX3zKk4
	 m3dN0/rRI5irRke7cbgk+YVHfvLnvhzkj2BaLSOuVa/bZxWU+8SELp/Pkk5nDZxy+r
	 aCAh6AbGsuWqGIvnSaPFNUDtCm++/yfcMOrjan7A1imB1XBf38NWcyRX/AWfWXZu5w
	 K3O609rN1a/bDnTxVfYv/xWremg0FuQU2/6hksnP7x06KwTVTMOXyFCdGerrU6/jYP
	 tAY0B4jm2cRxA==
Date: Wed, 6 Nov 2024 17:40:18 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jim Quinlan <jim2101024@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, linux-pci@vger.kernel.org,
	ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
	nbd@nbd.name, dd@embedd.com, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Krishna Chaitanya Chundru <quic_krichai@quicinc.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Subject: Re: [PATCH v4 4/4] PCI: mediatek-gen3: Add Airoha EN7581 support
Message-ID: <20241106234018.GA1581562@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANCKTBuxKA8JdfYMCcGS=CpyuXGiLz1NdereCjqo-_2Er3Pfww@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_154020_919690_CB9878F2 
X-CRM114-Status: GOOD (  29.21  )
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

On Wed, Nov 06, 2024 at 06:00:08PM -0500, Jim Quinlan wrote:
> On Tue, Nov 5, 2024 at 4:33 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > On Wed, Jul 03, 2024 at 06:12:44PM +0200, Lorenzo Bianconi wrote:
> > > Introduce support for Airoha EN7581 PCIe controller to mediatek-gen3
> > > PCIe controller driver.
> >
> > > +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> >
> > > +#define PCIE_EQ_PRESET_01_REG                0x100
> > > +#define PCIE_VAL_LN0_DOWNSTREAM              GENMASK(6, 0)
> > > +#define PCIE_VAL_LN0_UPSTREAM                GENMASK(14, 8)
> > > +#define PCIE_VAL_LN1_DOWNSTREAM              GENMASK(22, 16)
> > > +#define PCIE_VAL_LN1_UPSTREAM                GENMASK(30, 24)
> > > ...
> >
> > > +static int mtk_pcie_en7581_power_up(struct mtk_gen3_pcie *pcie)
> > > +{
> > > ...
> >
> > > +     val = FIELD_PREP(PCIE_VAL_LN0_DOWNSTREAM, 0x47) |
> > > +           FIELD_PREP(PCIE_VAL_LN1_DOWNSTREAM, 0x47) |
> > > +           FIELD_PREP(PCIE_VAL_LN0_UPSTREAM, 0x41) |
> > > +           FIELD_PREP(PCIE_VAL_LN1_UPSTREAM, 0x41);
> > > +     writel_relaxed(val, pcie->base + PCIE_EQ_PRESET_01_REG);
> 
> Not sure it is worth the trouble to define fields.  In fact, you are
> already combining fields (rec+trans) so why not go further and just
> write each lane as a u16?
> >
> > This looks like it might be for the Lane Equalization Control
> > registers (PCIe r6.0, sec 7.7.3.4)?
> >
> > I would expect those values (0x47, 0x41) to be related to the platform
> > design, so maybe not completely determined by the SoC itself?  Jim and
> > Krishna have been working on DT schema for the equalization values,
> > which seems like the right place for them:
> >
> > https://lore.kernel.org/linux-pci/20241018182247.41130-2-james.quinlan@broadcom.com/
> > https://lore.kernel.org/r/77d3a1a9-c22d-0fd3-5942-91b9a3d74a43@quicinc.com
> >
> > Maybe that would be applicable here as well?  It would at least be
> > nice to use a common #define for the Lane Equalization Control
> > register offset from the capability base.
> 
> FWIW, these registers are HwInit/RO.  In our (Broadcom) case we have
> to write them using an internal register block that is not visible in
> the config space.  In other words, we do not use the cap offset.

Good point.  It looks like they're a mix of HwInit/RsvdP and
Hwinit/RO.  RsvdP is for writes, so I guess the config space registers
must be write-once and subsequently read-only until reset.  In any
case, mtk is using an internal register block as well, so a cap offset
wouldn't be useful.

Maybe it would still be worthwhile to define the fields themselves in
pci_regs.h so we can someday have common code to parse the DT
properties and assemble them.  Although I suppose there's no
requirement that the registers in the internal block even be laid out
the same as the config space register.

> > Although I see that no such #define exists in pci_regs.h, so I guess
> > there's nothing to do here yet.
> >
> > The only users of equalization settings I could find so far are:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-tegra194.c?id=v6.11#n832
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/dwc/pcie-qcom-common.c?id=v6.12-rc1#n11
> >   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/controller/pcie-mediatek-gen3.c?id=v6.12-rc1#n909
> >
> > Bjorn
> >

