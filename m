Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693ADC98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 15:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtNwmCpwlATZL6+yLaXsqKa6VUJAOpqf/gk0N1LtqfM=; b=teFz0EBwBfAr27OEc4klFw5Nd8
	vbqVG2D7+yosE2Taq5Vf6SRnctPjgggR7mffUitd4QtEdZFsDPtNTtTFJhEcJZnRM5xnd1n8pTMi4
	Q9DCZAThafXvRV6VEGuzDkLPa8JyVRh9xppX7eBgTdyj5bvBzfV4P65UeiryuOAY1JAtOr+GoO3y/
	lC5sQHhN6TlNz5qBO4mKy8V31VZOZP4svqL7tFCLCAin4dU/Ynty1rBlVTTcaMF/bY0iEAffTT2Av
	3sBdeGi+K52mTGBcNHj8S1Kdjr6jfUlATQBYoT5Kt2jNMyP2qw4U/eVq9GbJceAW9bfJuSCWYpqpi
	iXbVFq6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lLC-0000000BNuf-2obS;
	Thu, 24 Sep 2026 15:26:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9lLB-0000000BNuJ-0J9h;
	Thu, 24 Sep 2026 15:26:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE2E640696;
	Thu, 24 Sep 2026 15:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0631F000FF;
	Thu, 24 Sep 2026 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790263588;
	bh=BtNwmCpwlATZL6+yLaXsqKa6VUJAOpqf/gk0N1LtqfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZmWeZ3udhfVDwkbdG7hmbVUamlOdwN1xRN6b1DIAHjkrRNINpNAEntqN2/gYcb6+c
	 DNyY5UcnsTtJXa4wSzaKR+XVzMSK/YPdatgbzLblwj05a82siMPo+H9MBFRXq0Muam
	 eMgLhELKWHIhSpr7ysCvDQi8XRfD3XKwJfozlir0/9nzPNNDpXYlC4pRB4nhZWrI6s
	 h7dti4Co9Cr9IQI+b/4fsC+pahOTduY/nbbYLzEBYHvhGp3XEuUUKq8utqAbOGLLBy
	 cR842xGOsLypHmxaSz5ICKPqqSruMiz9dMI7BjjRzP62l641nWHjsBIcXIXEb5Sxdj
	 n4v2zzcv9buTA==
Date: Thu, 24 Sep 2026 10:26:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Avri Altman <avri.altman@sandisk.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Wang <peter.wang@mediatek.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-scsi@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Bart Van Assche <bvanassche@acm.org>,
	Chaotian Jing <chaotian.jing@mediatek.com>, kernel@collabora.com,
	"Martin K. Petersen" <mkp@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v12 02/24] dt-bindings: ufs: mediatek,ufs: Complete the
 binding
Message-ID: <179026358626.149119.4739305859668993061.robh@kernel.org>
References: <20260914-mt8196-ufs-v12-0-9279d7ef814d@collabora.com>
 <20260914-mt8196-ufs-v12-2-9279d7ef814d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-mt8196-ufs-v12-2-9279d7ef814d@collabora.com>
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


On Mon, 14 Sep 2026 13:38:48 +0200, Louis-Alexis Eyraud wrote:
> From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> As it stands, the mediatek,ufs.yaml binding is startlingly incomplete.
> Its one example, which is the only real "user" of this binding in
> mainline, uses the deprecated freq-table-hz property.
> 
> The resets, of which there are three optional ones, are completely
> absent.
> 
> The clock description for MT8195 is incomplete, as is the one for
> MT8192. It's not known if the one clock binding for MT8183 is even
> correct, but I do not have access to the necessary code and
> documentation to find this out myself.
> 
> The power supply situation is not much better; the binding describes one
> required power supply, but it's the UFS card supply, not any of the
> supplies feeding the controller silicon.
> 
> No second example is present in the binding, making verification
> difficult.
> 
> Disallow freq-table-hz and move to operating-points-v2. It's fine to
> break compatibility here, as the binding is currently unused and would
> be impossible to correctly use in its current state.
> 
> Add the three resets and the corresponding reset-names property. These
> resets appear to be optional, i.e. not required for the functioning of
> the device.
> 
> Move the list of clock names out of the if condition, and expand it for
> the confirmed clocks I could find by cross-referencing several clock
> drivers. For MT8195, increase the minimum number of clocks to include
> the rx_symbol ones, as they're internal to the SoC and should always
> be present, and should therefore not be omitted.
> 
> MT8192 gets to have at least 3 clocks, as these were the ones I could
> quickly confirm from a glance at various trees. I can't say this was an
> exhaustive search though, but it's better than the current situation.
> 
> Properly document all supplies, with which pin name on the SoCs they
> supply. Complete the example with them.
> 
> Also add a MT8195 example to the binding, using supply labels that I am
> pretty sure would be the right ones for e.g. the Radxa NIO 12L.
> 
> Finally, remove the 'ufs_' prefix from all clock names containing it
> and rename 'ufs' clock to 'main'.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 115 +++++++++++++++++----
>  1 file changed, 96 insertions(+), 19 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


