Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FF3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 21:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y68oQ6pR8oZ0Y5HNXaAqZgdViYCscuZZHbOBoV81/Xc=; b=46TuvtPMFquoAlmm4FhP8IYEO+
	5b6V4/Z7kxqqPQO4246wwFj2A4NQ3y6GCMVDS8JO+qChDvOj9qkug0XjDGnUdK5Z7jTntfXPHSmIC
	JmSn3Dcco/XWty0gQsp9NTS1+2mhyap0I19WXH7yLKvKv0rYYRJz/PQd1QcYCoIzc8Xw6zNFqEuxg
	4aWXq/day0TQ2XwLL+ppj8G2pOJ1zs0PJBS/AuPIYOERGPbuJKou069T00y8HQfZWnOFcMBAJ+CQ/
	1YNNeHLNsIu7UbYjS5Qjd2VsdPOtzry2VsvOImamahWRL5vFtcq8WB4WJWCRIZFqjnqfl2cRCpJv6
	1er21SUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrNu-0000000F7e7-3yxV;
	Wed, 19 Feb 2025 21:13:34 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkrGI-0000000F4ii-1wUt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 21:05:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21FBB611C7;
	Wed, 19 Feb 2025 21:05:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15279C4CED1;
	Wed, 19 Feb 2025 21:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739999141;
	bh=GyhV3lcJSOotUArslQ+DPnCWFQF3eyPqRLf5/jkAdJM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ErG3Mxq616iGCoUz8SrfNnzzTTxqxNXKJjBhfW2Y+qnP1g1utp/sqcAqrrMeVOw+C
	 p8XoON0pwyLN7dkFt70atzLNoDbYtAzpVsa19d7qnCeNxU8lE92rrhBl19/b4YdFXX
	 uqrIbm4x+xRcGYJBmBXcO3yqQ11THTBndYbSp3JthISQuqS9qaH/H5hnKWLriYAlzB
	 sxiyEMfnPeLMSnC7fkrZO23Xs6QGTMkROpFS74Ja4Fs90/v/QfFz6bIGtnzKn9bPD3
	 X5h1GwlH2jpDrLkEGH7BP1oIXrpNi5sIm9UZy/JsJYWeAlRIDabEttNO+bd8MZFMgO
	 z1JM/eKaXON2g==
Date: Wed, 19 Feb 2025 15:05:40 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Martin Kepplinger <martink@posteo.de>, imx@lists.linux.dev,
	Robert Chiras <robert.chiras@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 01/12] dt-bindings: firmware: imx: add property
 reset-controller
Message-ID: <173999913941.2953348.10916179903206198002.robh@kernel.org>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-1-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-1-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_130542_567373_CF8652B4 
X-CRM114-Status: GOOD (  11.67  )
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


On Mon, 10 Feb 2025 15:59:20 -0500, Frank Li wrote:
> System Controller Firmware(SCU) reset some peripherals, such as CSI. So add
> reset-controller for it.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> -none
> 
> change from v1 to v2
> - new patch, move reset-controller in top fsl,scu.yaml
> ---
>  Documentation/devicetree/bindings/firmware/fsl,scu.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


