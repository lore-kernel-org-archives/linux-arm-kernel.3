Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CD3CFD62A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRal9aRJEBMws0AwIbeE+xWsj4dyQhrtTO2oF039rMA=; b=KRiMkoiF/1Xs5Cp10EiGK4sGOE
	WByx78oNzi+XUR4BRY8K85kXskn37so7mrsqiZORLJCXRgowKCzDlEjrX13dxIhM0+umr9FDLQDGn
	xWuMH8WuKo3eJnAKa1GP3GneBPr2H9+Wi9NOYRfBUFVktMYk6KBWCojCPjUIwHHlJ3CKFyU9mer5O
	WyW+AmoF5QNSrlH8+4tQU5rVBFOM3zgC4y/OWL+JmpiVd8HfJ7gSwle9uX7Q2CtZow8PJ9SKs3eg9
	o06q3SW8gRHp2kZBtx54V7Y4wVpinxT5f0VNn+Kqsbtabw/M0U35aXo8GHrpfdpebLXL2aLrfxMa8
	etsRdq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTff-0000000F0ut-1AXg;
	Wed, 07 Jan 2026 13:33:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTfd-0000000F0uZ-1D3C
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 13:33:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7FA8D41765;
	Wed,  7 Jan 2026 13:33:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D683CC4CEF7;
	Wed,  7 Jan 2026 13:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792832;
	bh=eRal9aRJEBMws0AwIbeE+xWsj4dyQhrtTO2oF039rMA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZsLZbs7o8rWvOy1KXRQEHXUY+OZNgKMmY0wLvJ8iieksy79lUKP2qpEbtYYjj18AN
	 E7Xd9oiOs9XbNxr+4a9Ia06cop1T+OsmXvlKomwA1JcpOKqFyXILxvBcNGcMq38DZp
	 HKbwnC7jmd/ik1tz4BPGB9OR3OcTMLK9ETrR22i4v2rVF8AKst/eJmHg3pizbZ0FCZ
	 ciyGXWN51TABOpmO5w4SPjJ/n0kYXGAld0XeeODer6T7xx+Q6wEGXzip1eGcNwjLeM
	 P+aBsWtH1MwJXQHaAnU27itZ5joYHKy6ZNad+h2Z7Sx4DhaMZt9mwn9z9kKmC5JLUb
	 KNZlEazVnbbrQ==
Message-ID: <7e796e122dcbce9a8d7678db9bbfc89d@kernel.org>
Date: Wed, 07 Jan 2026 13:33:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 01/12] drm: of: drm_of_panel_bridge_remove(): fix
 device_node leak
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-1-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-1-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_053353_351582_D28E1CE8 
X-CRM114-Status: UNSURE (   6.14  )
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

On Wed, 7 Jan 2026 14:12:52 +0100, Luca Ceresoli wrote:
> drm_of_panel_bridge_remove() uses of_graph_get_remote_node() to get a
> device_node but does not put the node reference.
>=20
> Fixes: c70087e8f16f ("drm/drm_of: add drm_of_panel_bridge_remove function=
")
> Cc: stable@vger.kernel.org # v4.15
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

