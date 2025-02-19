Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0D9C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+LqTHoDj76dw2WXgpoqSioSSuePBWgpGnGDD7HgLeA=; b=uOg7HcPTyUAUDhujFhFLuYrtpw
	WbTAmNnaP3FmwbRpmdF61X8tuWVVCRr+fVATypf5GdMF2Jlf39So9A0ZmSN3Cb20kjeydSzK6MOOE
	fV/dEBhoOZhPtjmrRrjf+6S8kVP9jrxuMa7bRIP1IEhxSRY//dsADYNgsmZzQOu/hlUt10MbNgfDo
	sXspUexSEyeWwofIQvJIrwQzg/VFsls3T0Vuyyei6/sBd/QwgFDsNqT1VQJua+UwyPZisJZNMRk74
	bKfo4ix1/aUaCqrEXFitPPM2WuI5lUcbvlfwBFiefYQy7x4ERve/yijSk8ccKEyv5UonZVOs9/Bcl
	L2Rl+81w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrUL-0000000F9vR-44i7;
	Wed, 19 Feb 2025 21:20:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrMd-0000000F75S-1eVO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:12:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD5775C5AF1;
	Wed, 19 Feb 2025 21:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56649C4CED1;
	Wed, 19 Feb 2025 21:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999534;
	bh=RH2S874a9p3OcwC5UMWnwGLvCd8mOlpI7+gBBPGe02k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTAWZnXgtZ8AVs9p1jhneACdx3Wj7FIOWsubcJNQ8Uq3Lhy/j0COgROUsFS7UeCqV
	 1FIYWON4Zjvnv4HKULOq1JfQREuNZVA94ZvZSwyHaJ0tu5hGKEy8VS2fFQU+CgJJQ6
	 rBbGTIrJTEI4SV03yNjTGiKoVHVs5OAog/OsHyAnzZFmK5KjTD30A/GBDVEIfFLnYc
	 pYdkUTUoTjaJjkJHOuFIc7Ror+Du0xs2yoztCTnTqbDbKiqPa+2KDg4TdpcbcDHzJ/
	 SCpZanryjZLF0LiAVm4rLeDe5tekQ9LsZUPMFxxJBM75sJ4RomBYfciicrYYsAL1Bl
	 wQtSdsIMjXwfg==
Date: Wed, 19 Feb 2025 15:12:13 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Purism Kernel Team <kernel@puri.sm>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Robert Chiras <robert.chiras@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8QM(QXP) compatible strings
Message-ID: <173999953304.2962619.18320580606066581337.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-6-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_131215_470645_7CFE4695 
X-CRM114-Status: GOOD (  12.21  )
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


On Mon, 10 Feb 2025 15:59:25 -0500, Frank Li wrote:
> From: Robert Chiras <robert.chiras@nxp.com>
> 
> Add compatible strings for i.MX8QM/i.MX8QXP platform. Remove
> fsl,mipi-phy-gpr from required properties and add new reg space, since
> i.MX8QM and i.MX8QXP use dedicate control and status register(csr) space.
> 
> Keep the same restriction for other compatible strings.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - use dedicate csr register space
> change from v1 to v2
> - remove internal review tags
> - remove reg maxitems:1
> - remove 8ulp part
> - add 8qxp compatible string and make 8qm failback to 8qxp
> - limit reset and power domain number to 1 for 8qxp and 8qm
> - remove power-domains change because 8qm/8qxp only need 1 power domain
> ---
>  .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       | 38 +++++++++++++++++++---
>  1 file changed, 34 insertions(+), 4 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


