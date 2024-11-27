Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9BAD6ACF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 16:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W3ci6YCIiDufTlH6QWOH+RcWY/SBARvhjUkFISOP+Eg=; b=QcztPhiScZ+RZexPaDXGYzwegh
	Mf+MfRpo1eWShTF+53reAoNc1umHCKPeWZxQk7XPoAFzhulnSkJYgSu2ysVyffXBE7L5DeOTpwPVd
	Wz5D7CyNNfzU1N0WsQ7+wuhQ3GnWVnjhep0I+uJ79PmO78CCvfeqGE/hDnvAh9E5aoFC5W/bLYC0o
	UeIiHE04SypP+V/Q9EcSoHzQ9v/L9IOiatkkSo4MgrNsb3TLm658IEIaLg0mfkS9XIRQqavVVgASg
	5krO3ma4NhzzoSUkgjHrmDDEBQWGN/9VPIMZ/3QAzlQIj3AK35o7l0VE229lQzpP42y31rJTaXkAG
	lsClGLgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKrb-0000000DciU-1JS3;
	Wed, 27 Nov 2024 16:26:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGKpo-0000000DcQt-0AZl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 16:24:13 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso4421495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 08:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732724650; x=1733329450; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=W3ci6YCIiDufTlH6QWOH+RcWY/SBARvhjUkFISOP+Eg=;
        b=V3nEd4XJRV6j/AFZJ4DTMTsYt0EXOHgueegtl+j4f7IfCgyE3Tj9ouYtqE0rVqpT5P
         XjPP5iWU6JKQXUhYYE4nzt6xG/aXF/hO4KaFW+g1SRw9N2PEhekpY+JKYLMBw+Rmk/2M
         uwq53tiLszjQyIqsddi23s5uLQtw1xJ0rrh0MvRy+RKovZcVyHtowi/npAWO9PgmkQ7U
         GMdyK0RLZjEXMhBVZUP7BcgNMU+7mjN0Al0eet1ajRmFS79PtTAk0eXNAkSKiFU/qUix
         eZdCOCWV7naPtJ3twt8A4yjgp94FDZ87JKLXxRfsG6QjwGPSFfvApdn+Eogae9dBMq8Z
         K27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732724650; x=1733329450;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W3ci6YCIiDufTlH6QWOH+RcWY/SBARvhjUkFISOP+Eg=;
        b=cMOQ82UALGf3Ge2r5RiijZkOTe63zUoZyS7/NVpGVxikAsw+OjfVnKsksH7eTmP7sN
         Uo9OEF7oP6VPHXiz8cFK6VGRvQCKE3/lt1mlw1a1xE12yK8gPzk0/j4Gp+xFLMNhTOz0
         9CHMg6g2H4AvP1KJWAbFgbWIk7DZMOKTMBh0Vq6FZv9Lo+9tbU+/5Pl8PGnePsy+AhGE
         Dm/J89szOS7nWiwg3yvIDRx0+gwYvlMSbuXa8jbGjoOq5ROfSUjgmbLK3I/YrNfGQDiD
         u5Nh4QQYeRL/Gfn/padajKfEyn3O4Qdkfs5f/yx5J6hYdQgVLZfYGGkBjbfcT14NFLJm
         zAMg==
X-Forwarded-Encrypted: i=1; AJvYcCXN/BWeDCMx9dhp0Myy5avmsgn0rAgtvcCW+Me+pxyEWrOx81PmL/iTXO7VAtMu3P2kh9USeL7b7DTW/BmHzUO/@lists.infradead.org
X-Gm-Message-State: AOJu0YzcYtBaku2KocZwJC74zySgZsq4QqlFwaTH7RdFuHvdkbblPK7G
	x2xbB0MVR6JGSvB8ax71QikfeP7z5zXRv7Df+8wpytAoYAL/aOaal+LY5146sU4=
X-Gm-Gg: ASbGncsMppyCCuJBu7w8gf91LaMivROvfSTO7U6kmS692NhyAWAun1WgtqKaRRMALTZ
	FTnDNxTWe/QvwtNQ6KGpppaM0kqFK/rAAsl0vvwykhhIwWchylE97lou1ZAXPlpZhdL6t21cO1R
	N50k4JCLF+SIKp3nHyXrdznSnJlNgFoG01lUkatHlL3rnoHQvg4DnLkNuPM2cRdPWSd3OGNwpNO
	JCObvj2k+5kbQn3aZSk7lHJyaQwL9FxMFSrA+DmP7u2PEMUNiCYRA==
X-Google-Smtp-Source: AGHT+IGDZztPo405KuhE/5HQpdEcc6G4U1hi5a0UqN/AZl+cMPyQNrZOeFD27R5rS38JBrkH0dwofA==
X-Received: by 2002:a05:600c:354e:b0:434:a684:9b1 with SMTP id 5b1f17b1804b1-434a9dbbfc6mr34223735e9.4.1732724650556;
        Wed, 27 Nov 2024 08:24:10 -0800 (PST)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3defsm17311830f8f.70.2024.11.27.08.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 08:24:10 -0800 (PST)
Message-ID: <813713d8ac62be0782bcf36d1d23bec5f4a3c08e.camel@linaro.org>
Subject: Re: [PATCH 3/9] dt-bindings: phy: samsung,usb3-drd-phy: gs101:
 require Type-C properties
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Conor Dooley <conor@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Marek Szyprowski
 <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Peter Griffin
 <peter.griffin@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Sam
 Protsenko <semen.protsenko@linaro.org>, Will McVicker
 <willmcvicker@google.com>, Roy Luo <royluo@google.com>,
 kernel-team@android.com,  linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org
Date: Wed, 27 Nov 2024 16:24:08 +0000
In-Reply-To: <20241127-majorette-decorated-44dc1e7dd121@spud>
References: <20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org>
	 <20241127-gs101-phy-lanes-orientation-phy-v1-3-1b7fce24960b@linaro.org>
	 <20241127-majorette-decorated-44dc1e7dd121@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_082412_092363_D480B0B1 
X-CRM114-Status: GOOD (  16.01  )
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

Hi Conor,

On Wed, 2024-11-27 at 16:00 +0000, Conor Dooley wrote:
> On Wed, Nov 27, 2024 at 10:58:13AM +0000, Andr=C3=A9 Draszik wrote:
> > The USB PHY on gs101 needs to be configured based on the orientation of
> > the connector. For that the DTS needs a link between the phy's port and
> > a TCPCi, and we'll need to inform the phy driver that it should handle
> > the orientation (register a handler).
> >=20
> > Update the schema to enforce that by requiring the orientation-switch
> > and port properties (on gs101 only).
> >=20
> > Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20
> What is your driver doing if these are not provided? New required
> properties are an ABI break after all and I don't see a mention of how
> you're handling it here.

This is hooked-in in patch 8 of this series in
exynos5_usbdrd_setup_notifiers(). The new behaviour is gated off

    if (device_property_present(phy_drd->dev, "orientation-switch")) {
        ...

Without that property (i.e. old DTS or !gs101), the driver will behave as
before (meaning for gs101 it will work in SS mode in one orientation only).

Does that address your concern?

Cheers,
Andre'


