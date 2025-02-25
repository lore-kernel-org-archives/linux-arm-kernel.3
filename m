Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406F0C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 17:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eses5UqowZZOTL7HwhdMRbsh8ldZqYuDiaGeH/QTqK0=; b=v41LboGaWwNPaKC4RCAGqFjBQF
	K/EXOZLFWvY99HMEKHOzoqlKVuPfVsENzWuI3gZbphhujPH+Q1hQBgiFDpw0M4nHtL0VU/0WQpJ90
	So0CCGYjF1tINHebS45zs6/hdu8IT7Gf7Z7bZ5c/xXGqqdftLwI3XdswDpJZEd8vAKhrb8+m1zLX/
	XPfOAkO5i6jxxDWTTrwP8eDNQmNh7Vj5YUnAtjCf9pIA1yQrrty/36OY7L4nEicRyNV22VNqKGmv8
	lVRjyXFoS+wGFL6fDX9x2aygo2YxP4i1FtguwdbbEFLkKw8+Tf0df26LsD4h9mnqcIDI3g5yYMT/O
	Fi8uYPHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmysY-00000000gqp-0Idy;
	Tue, 25 Feb 2025 17:37:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmycd-00000000c3J-035h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 17:21:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 702335C737A;
	Tue, 25 Feb 2025 17:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB00FC4CEDD;
	Tue, 25 Feb 2025 17:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740504090;
	bh=c4aCbzvpC4OPRzag8tbbZyRbYav/HzlqEic//RGnM50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pQBFDBkHOiyBhy/mAW0E84hm10c6PAX9Ku0+prxgkb7+EhgTa7ECdsYNiW2V/6fEK
	 D9u6+TZVuOP1ZixIsqp+WL8eiZjV9Yor3oEKRVQ4QoYbzcRvjNjmMp73a7zT+/pbgL
	 FrVuScma9NPfpg6EAceg//o3k4E6fUhEEAvxhf04BI1Ye7w5KVyE6zIvlz+AZjgPH+
	 D/c8eey1FHRasm8hFL1JQONUaCqRyD15flt7yKpcE++TiTtOlQi0tCI9hDggU2CEzV
	 1aLYrh0hQ7TulRA1hy/jHCdrvyl6OxRg/BSVIOTGkx5mVPnM52UaACHi0bYyGUvEnc
	 xZI2V/glBgBBQ==
Date: Tue, 25 Feb 2025 11:21:28 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Richard Zhu <hongxing.zhu@nxp.com>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/3] dt-bindings: PCI: fsl,imx6q-pcie: Add optional DMA
 interrupt
Message-ID: <174050408775.2723311.3813891689598918931.robh@kernel.org>
References: <20250225102726.654070-1-alexander.stein@ew.tq-group.com>
 <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225102726.654070-2-alexander.stein@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_092131_092401_49570831 
X-CRM114-Status: UNSURE (   9.48  )
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


On Tue, 25 Feb 2025 11:27:21 +0100, Alexander Stein wrote:
> i.MX8QM and i.MX8QXP/DXP have an additional interrupt for DMA.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


