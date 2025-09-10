Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5AEDCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 14:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMazei6Uh8gNBhGV5j7yauY4k1ZT+4VWeaSfA88CoTQ=; b=EaffiHB6Ed/XDKoeMm7PHOLYFO
	On8b56ECUJeDkIfsUbpRiWyTN5ld2fqIvcGA045i0UwLSABpyFudByzj4i/unI5sORK5Ncd4ZLIWE
	PQOsgmvLwA0+b0AZBiwJ4aViEMekzwesvKb6fzhiamXv/U41k6HITmryvB9/EDP1U7cqGxzoL3WWa
	73H8YPbhFMuNVhVkkzK2XeKXyfcoBIdQPq2qkCHqCFJdXCRVDeAvQHrGz/msUnKDQao1vTfCOVvV/
	QDWQCi7V5nddGM8vG/kGGTbhk5GJynNw4Py0CHOKya4EJHr+gYXrU/l4g2GvGRxHFFQOX1okLZriQ
	3YLyZ1Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLvq-0000000El0S-1JVF;
	Wed, 10 Sep 2025 14:36:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwLvn-0000000EkyK-35HF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 14:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 14FDE40474;
	Wed, 10 Sep 2025 14:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3EC0C4CEEB;
	Wed, 10 Sep 2025 14:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757514978;
	bh=YzN2vCtNXOfPmEUy/QtzOmDZxzWZ2vYAup9vdx715rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TcziRYTYjchVtxoB9c9jxPGdTtH8mRcmyM0KzU+MT9Wvq7cTN3ItuzY3bIARaBIQ0
	 maLWUpobcoR0VBLEhkZQtzjsRyGo5BQrMjAvQU1kuWrgkrnQ2JOXsP1Rqcl0FyYFRZ
	 MgY3Z1fV4VgFb8slQlwvM8aTQbqcrE4wiViC2hkhs3XXOcNBx/gH+aa24Byz2Bq9xH
	 YDcQN6Mg00HsekKooHydArdlKbBPtw3EatWrexA5irgomMXn/0wjp/3cJQ3lFqXJ2t
	 Er39O+Ouvu8cFbvN8cO71In7Sk+0MoLdX/YjJ/eB6on0oDpqYWfMIwBlI8co8JhIa3
	 auGJTVRYZcT7A==
Date: Wed, 10 Sep 2025 09:36:18 -0500
From: Rob Herring <robh@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Eric Dumazet <edumazet@google.com>, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>, Vinod Koul <vkoul@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/9] dt-bindings: net: qcom: document the ethqos device
 for SCMI-based systems
Message-ID: <20250910143618.GA4072335-robh@kernel.org>
References: <20250910-qcom-sa8255p-emac-v1-0-32a79cf1e668@linaro.org>
 <20250910-qcom-sa8255p-emac-v1-2-32a79cf1e668@linaro.org>
 <175751081352.3667912.274641295097354228.robh@kernel.org>
 <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mfom=QpqTrTSc_NEbKScOi1bLdVDO7kJ0+UQW9ydvdKjQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_073619_809980_0F2B0861 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, Sep 10, 2025 at 03:43:38PM +0200, Bartosz Golaszewski wrote:
> On Wed, Sep 10, 2025 at 3:38 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> >
> > On Wed, 10 Sep 2025 10:07:39 +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > Describe the firmware-managed variant of the QCom DesignWare MAC. As the
> > > properties here differ a lot from the HLOS-managed variant, lets put it
> > > in a separate file.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > ---
> > >  .../devicetree/bindings/net/qcom,ethqos-scmi.yaml  | 101 +++++++++++++++++++++
> > >  .../devicetree/bindings/net/snps,dwmac.yaml        |   4 +-
> > >  MAINTAINERS                                        |   1 +
> > >  3 files changed, 105 insertions(+), 1 deletion(-)
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'phy-mode', 'power-domains', 'reg', 'rx-fifo-depth', 'snps,multicast-filter-bins', 'snps,perfect-filter-entries', 'tx-fifo-depth' were unexpected)
> >         from schema $id: http://devicetree.org/schemas/net/renesas,rzn1-gmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/renesas,rzn1-gmac.example.dtb: ethernet@44000000 (renesas,r9a06g032-gmac): power-domains: [[4294967295]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): Unevaluated properties are not allowed ('mac-address', 'phy-mode', 'reg', 'snps,reset-delays-us', 'snps,reset-gpio', 'snps,rxpbl', 'snps,txpbl' were unexpected)
> >         from schema $id: http://devicetree.org/schemas/net/mediatek-dwmac.yaml#
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/mediatek-dwmac.example.dtb: ethernet@1101c000 (mediatek,mt2712-gmac): power-domains: [[4294967295, 4]] is too short
> >         from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
> >
> 
> These seem to be a false-positives triggered by modifying the
> high-level snps.dwmac.yaml file?

No. You just made 3 power-domains required for everyone.

You have to test without DT_SCHEMA_FILES set so that every example is 
tested with every possible schema.

Rob

