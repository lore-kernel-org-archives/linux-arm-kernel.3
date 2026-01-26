Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C9ED19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1pdoPngF1aDapNIHrwNpRBo4Sp2UIKTCGoXtl4MeI4=; b=NqwGHMO9Vc59tIuDB/3vVUaogn
	XJSE2BXJQ80KCR0KTliyXh9yRUVEXx+YxPXxLD5CQJQHkxpQKSBRckOEynjFzHCNciOYzCOOGO12m
	CzqVs2g/I6CUY5b82rESP1GNrY1UpEqHxWadr8IL5ElZ9IY1toby+dM2DF3aLNOVMlX9NrZ8xzI4X
	56S5EvY+bK7hJlTGPYqLZC6mC5whImeXuS2Mh4IkWMVQYrzO5OiKmnpsYdiANDQgBswdM40nJIyCz
	fQfOhowNv4+yWT3DBEDjV/f9ymO0tKbkArS+p7gWCdYWqYyWggTeBQfgQNkqNkwCgJr1vAgK3KshI
	0s0BVuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRHj-0000000D4mq-3eRs;
	Mon, 26 Jan 2026 18:25:59 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRHg-0000000D4mT-3fLt;
	Mon, 26 Jan 2026 18:25:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769451944; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zn/ooi+tjr/B3JZDfPh6S7Ri3js5/zkIprHGuSy97Br9nKNc5h9Q+3B0YtaxOSINPbwt5XSlq7A285NIzYIhKR3+uw7TCTuccCx8ru7A0VY+1OCkrptNhflRy6+f6Z/7EFDNt02eVgv8txvvOeWg3v3mEpxqRRvkq/zWGaw62kQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769451944; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=M1pdoPngF1aDapNIHrwNpRBo4Sp2UIKTCGoXtl4MeI4=; 
	b=mH+JJFvIxEHJy/ZqUXFKpCNR56M+yc2s5cu7Kj/5E1PjupQbN+MMgkU9rFQsKRHZcnd7g8RN9XvUrf5SAFnXhBVoqzCq/X1BNYjGTdhAX+p+yxV34OghF5PjtsS9vqDqO5Vr7W9RYPfQ7kKC1ezDMdMXKZoKxA0ru5ETMMjpbT8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769451944;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=M1pdoPngF1aDapNIHrwNpRBo4Sp2UIKTCGoXtl4MeI4=;
	b=kx4bYd12ixykYU8diZAiP/k70qprWD1JrV1394b507KEwJW1kFjztI6eDoTdXmPJ
	3hSiX5ttD67uYlI6KIHByJf3ZXLw1EP7BGtJ2DE+mQp2TeJ3325DDtTizqYaTh9Ap0I
	7VOZVwpb30TL56i6OValyHjQb9aWD5899FMpx0hM=
Received: by mx.zohomail.com with SMTPS id 176945194260896.91308996533701;
	Mon, 26 Jan 2026 10:25:42 -0800 (PST)
Message-ID: <0dfb0aafeb37f0683182ef23293bb8373dd7caf2.camel@collabora.com>
Subject: Re: [PATCH v4 3/4] drm/vkms: Support setting custom background color
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang	 <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed	 <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 26 Jan 2026 15:25:35 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-3-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
	 <20251219-rk3588-bgcolor-v4-3-2ff1127ea757@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_102556_980335_1A455D97 
X-CRM114-Status: UNSURE (   7.57  )
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

On Fri, 2025-12-19 at 23:47 +0200, Cristian Ciocaltea wrote:
> Make use of the BACKGROUND_COLOR CRTC property when filling the
> background during blending.=C2=A0 It already defaults to solid black.
>=20
> Since the internal representation of the pixel color in VKMS relies
> on
> 16 bits of precision, use the newly introduced
> DRM_ARGB64_GET{R|G|B}()
> helpers to access the individual components of the background color
> property, which is compliant with DRM_FORMAT_ARGB16161616.
>=20
> It's worth noting the alpha component is ignored, hence non-opaque
> background colors are not supported.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

