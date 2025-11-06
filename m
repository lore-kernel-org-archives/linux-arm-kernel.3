Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5958CCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 17:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgxrGX1ncCHXXJp1kwwkg1TSvCMea4zbZRphFSfsxhA=; b=CKA6XxmkQOvgcEAUZxHAKN/btJ
	1dGZ3i77vktclFCTwCY+kMnUCsyaUWTozmVqqvtEksNJ88IfJ+V4WSwXWo8YJKPsuc5GiqvTZ7GO7
	fTuj6sA6DdpflrtcN4f6aEyi/lscy4VC/PxgvDj9srB/jrjcrYQl4RT9CR4kCRfzcVv0LdUPR9vWc
	JZuqeLzRxhJXVWg14Lnjuxb3H8EN03qAlN03Ef+2k6yMSXLgr5l2IQ2IE8UTbkUdz8NSCOMdCer4D
	3BbAZOfid4/TQbyAjSigDytngTjOV2EQB2OIXydcOHDpQh8A8hHxqzhbxwHFjI0wTAqmnKSodNXNp
	YJd1twLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3mK-0000000G1Rn-4ARp;
	Thu, 06 Nov 2025 17:28:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH3mH-0000000G1QT-3LUV;
	Thu, 06 Nov 2025 17:28:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0EF8432E5;
	Thu,  6 Nov 2025 17:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C585BC4CEFB;
	Thu,  6 Nov 2025 17:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762450084;
	bh=bgxrGX1ncCHXXJp1kwwkg1TSvCMea4zbZRphFSfsxhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FLwc/b9Cj6k5hUXPM9oYxjeswD8Vb1ej4/mcZDVLV0MmuNFlo+hLSwLEDhVYG9FgW
	 2onU3Rj3cj25Sp6p7wA78X45e3lV0E274Qj4/fFwJbhu6X02vf+tVHiDX5nFbppzKk
	 50GP1FEbI7eV5/ocbikVTV9B1i5WUB0+NiRUrBhyEl6byOJ25Ik3kariC2esEEJYPw
	 iFULGRyotJ1WnSPGN6Y933gUd0H5d1YejDHnubSFeTWJy6dWVhtGODA1g5Hvpfxlm7
	 utgvNAHF6d4dpnoaEdW6rUJJPrGoEMTe3GNBVRY6uuAj65ErVMlp986qDmisjXmPK/
	 /8bCy4V5KvAnA==
Date: Thu, 6 Nov 2025 17:27:58 +0000
From: Conor Dooley <conor@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: [PATCH 3/9] dt-bindings: display: rockchip,dw-mipi-dsi: Add
 compatible for rk3506
Message-ID: <20251106-watch-confining-6a3800cf81eb@spud>
References: <20251106020632.92-1-kernel@airkyi.com>
 <20251106020632.92-4-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3yjg8hVehVxlP0SN"
Content-Disposition: inline
In-Reply-To: <20251106020632.92-4-kernel@airkyi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_092805_851708_4FC464DC 
X-CRM114-Status: UNSURE (   6.47  )
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


--3yjg8hVehVxlP0SN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--3yjg8hVehVxlP0SN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQzangAKCRB4tDGHoIJi
0mJSAP9jViavOmW7ijllM9pi+5hpceEFSeVprT+VVdypRaeBggEAraipNDFhLqIW
QknuBgh9VzGzJrCnn5mz8n4Ul7FO0Aw=
=9Uh8
-----END PGP SIGNATURE-----

--3yjg8hVehVxlP0SN--

