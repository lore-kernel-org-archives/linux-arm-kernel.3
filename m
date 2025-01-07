Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D14CE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nP3a904pW+4NeZpIzj2rL1y4z2Ox21R2Xnv72pkxwco=; b=zgu4xBSFWiNGek9DrKqziJWV47
	bivKoNtlyVvMkFA8tZrhQbNlZL9VhxL8/ZGKM2mLSuEn6E68fFBIgYvHf9o+eMIb8EINOW33Fhfjq
	GFR/nBWxAYt1E/H2kS+7L19BBNhq3dUVMcwDWGrrJT6Abixm5WkbaGFRRFYI2VzLv1Ej3lTnZW2Pn
	YPwrAuYiLcvrP1eyDg7fl2Pv8KCOWLebWQivyZsZkFhwDGapBaH/iRuxlXVnvalg36JXJHTVSHLo9
	bujfVdwPu10CUm3wgI2yot3R54fUMoLnMjElYSbeS2iB2+1Gq/9rMRU/DNkHdGzHP27YdN+az9NiN
	ksqrlQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV45E-00000003lca-1P48;
	Tue, 07 Jan 2025 07:33:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV429-00000003lF2-0L2L;
	Tue, 07 Jan 2025 07:29:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1736234989; x=1767770989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nP3a904pW+4NeZpIzj2rL1y4z2Ox21R2Xnv72pkxwco=;
  b=ee2FIquH9i21Tt1oI67MC4K04R8ooLYfYbYvpE6dZOFRcYfhXFcasv6E
   EkGoBcD5Zl1ZNrZAxs2U9ISQihEzqf7C1HPQ2/eNJTyeO4RpcKoyueClN
   WeMcgxg3AHooqhHUjYSj6NW7bfNHoExR9OOBwEl7k0ozKr3u0t3yeN5EQ
   JPEENtuaSx6FhRMDshVrKFHAXkdNF6MnV9rneTVgkI6n5CvbSbeLDF6t5
   ptfZzVu0r2Ndi4H/V12sdIFZle3cKWew+zje4SnMXIJUYTsyzsP/yOYIC
   37vH/K3cQe/Lr2NqNCQFjgL6bFGwRlzLJ9KQ1OOmp2bI2U6Oggb/DtPkd
   g==;
X-CSE-ConnectionGUID: Izfo4A+rSCy3NyDPZAJESA==
X-CSE-MsgGUID: xzEX+6reTZOhb7p1aXK/6Q==
X-IronPort-AV: E=Sophos;i="6.12,294,1728943200"; 
   d="scan'208";a="40884099"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 07 Jan 2025 08:29:46 +0100
X-CheckPoint: {677CD7EA-9-1647E5E1-CA16D1A6}
X-MAIL-CPID: 1AEEC7B410713E20B959F122062910D3_2
X-Control-Analysis: str=0001.0A682F28.677CD7EA.00B1,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11EEF16127F;
	Tue,  7 Jan 2025 08:29:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1736234981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nP3a904pW+4NeZpIzj2rL1y4z2Ox21R2Xnv72pkxwco=;
	b=kUQqq3eFKQVewMaUchSw5EAUYGP9HHxGRg6hRebVznMHtHICrD6XdTKTAfwJWtI0GoTpcs
	ImBdTuEMqD8JIzytM1HTt//DoWwt+Ci/ReXj6QXX/RS4A6rrQCKNyOrnZe9dUG8qMZrHnW
	VygnZzh72HPDs8KMeLlV3U6HG3BiPFJO/QuqnFcti7RLBBG2t8UvwZqoXZLKzXBdS05ohy
	8vXM3XG6VH8PWNBlNxaB5L5HFIWUgLX4NG3cnkPTlMnHI6/br9uYw39Vgl58GQvgy74fEj
	Mq7udal6QZYZOLG+gGpfEKVaWTCuEFNS0fgAVNYIRD8CUcd8DuKhxuh1z+I52g==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, mripard@kernel.org, Sandor Yu <Sandor.yu@nxp.com>
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com, oliver.brown@nxp.com, sam@ravnborg.org
Subject: Re: [PATCH v20 0/8] Initial support Cadence MHDP8501(HDMI/DP) for i.MX8MQ
Date: Tue, 07 Jan 2025 08:29:36 +0100
Message-ID: <2381464.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_232949_485503_EBD8D040 
X-CRM114-Status: GOOD (  10.66  )
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

Hi Sandor,

thanks for the updates.

Am Dienstag, 17. Dezember 2024, 07:51:42 CET schrieb Sandor Yu:
> The patch set initial support Cadence MHDP8501(HDMI/DP) DRM bridge
> driver and Cadence HDP-TX PHY(HDMI/DP) driver for Freescale i.MX8MQ.
>=20
> The patch set compose of DRM bridge drivers and PHY driver.
>=20
> Both of them need by patch #1 and #3 to pass build.
>=20
> DRM bridges driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #2: drm: bridge: cadence: Update mhdp8546 mailbox access functions
>   #3: phy: Add HDMI configuration options
>   #4: dt-bindings: display: bridge: Add Cadence MHDP8501
>   #5: drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
>=20
> PHY driver patches:
>   #1: soc: cadence: Create helper functions for Cadence MHDP
>   #3: phy: Add HDMI configuration options
>   #6: dt-bindings: phy: Add Freescale iMX8MQ DP and HDMI PHY
>   #7: phy: freescale: Add DisplayPort/HDMI Combo-PHY driver for i.MX8MQ
>=20
> i.MX8M/TQMa8Mx DT patches:
>   #8: Add DT nodes for DCSS/HDMI pipeline
>   #9: Enable HDMI for TQMa8Mx/MBa8Mx
>=20

I gave this version a new try but unfortunately the display stays black.
Although the display pipeline is intialized and even wayland starts.
Do you have any idea where to start looking?

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



