Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA7B6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j1nB02IjvKHpw9cON+cJaf9JT0gkQcPpJ01RGLydvJE=; b=vynb80vd+jscR6VWrn2eN0CBxd
	dDJmY5wE9USEPu8/N7AOeHCOrnnNOIVo6v3bSxTSp0lypiSWciAymM5QtWhzQEcZRaId2c2bDS9A1
	T1T5FqtmkNO55CRdTTnZ1JWwsv8cfXS5Md6dcE83h2UNEKs+u4D394CPANuQ4gzogaf6FQJH5LNZn
	N1DEBPHCzG/ae+burvq3Nf3uSJmSL8S/C4lO6cPrzrQlnkB7+abSn2jl9WkdMaUjCGpy+6mBXNyqb
	tomGdcHTVNq1xlmFpjhjffgQqIU9OfsaeADfsCVFzfuqj8b4sci1kKdVyzN0TtkMCB5GAvBm/nRpi
	TSdI3V3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGYp-0000000GTBL-0xeI;
	Tue, 05 May 2026 14:15:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGYo-0000000GTB8-07i2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 14:15:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB9CD60154;
	Tue,  5 May 2026 14:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 698A6C2BCB4;
	Tue,  5 May 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777990540;
	bh=FQsBhAgsYHplHV2/vcCwYjBqbsq7KXkPO3MRqXSfMok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E6osNGJmPtrOn/dO5V7lDP7Lu/A7Jxq46ChObn5PlgAvC6B/uvqi6QdXgDtylkKuM
	 fustiBuO44Cvy9/Z8gnQ76Exw7F/EXMUM4tSZWdpthwoUGaAcvKTxfr129TuZP6AEp
	 acVDIdJWpmY9DvuBke1cI4BAhj6/Bo7OzY2Lo5qNrUeNE3QZsRE8RiO0sPN9cQVgoK
	 UIC3P1lMZp8WkwsjfaA+BGMryIpLkoMJpkbBeeXm28BjehqGYWBVps0s8ISiwSZ3ti
	 UIk9UYCpdU0ypAKcGcmQqzOppY78h0DnZSdZF+XEj94/78Kh78Mv6n5pO1dnuOpRqM
	 Sg6yu/4lU10xg==
Date: Tue, 5 May 2026 09:15:38 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com,
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
Message-ID: <20260505141538.GA2547282-robh@kernel.org>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
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

On Mon, May 04, 2026 at 10:21:42PM +0200, Marco Felsch wrote:
> This reverts commit 16c8d76abe83d75b578d72ee22d25a52c764e14a.
> 
> Remove the 'reg' and 'reg-names' property from the LDB.
> 
> The LDB is either part of the IOMUX_GPR (i.MX6SX) or the BLKCTRL
> (i.MX8MP, i.MX93) register space. Both IOMUX_GPR and BLKCTRL are
> register ranges with loose register definitions. E.g.
> 
>   - On the i.MX8MP there is one register which controls the AXI
>     threshold for two different IPs (BIT(31:16) - IP1, BIT(15:0) - IP2).
>   - On the i.MX6SX IOMUXC_GPR5 controlls: CSI2 mux, WDOG3 settings, PXP
>     handshake, ...
> 
> In conclusion: it can't be ensured that one register belongs to one
> dedicated IP and the LDB is rather an exception than the rule.

It is fine if there's a child node for LDB if the LDB registers are 
consistent, but the other misc things are represented by the parent 
node. It is certainly not a requirement that either everything be in 
child nodes or nothing be in child nodes.

What I don't see in this series is what problem does this fix? If you 
are going to break compatibility, then there had better be a good 
reason.

Rob

