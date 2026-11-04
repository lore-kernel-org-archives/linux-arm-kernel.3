Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE27E606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DEu1Yn2W;
	dkim=pass (2048-bit key, unprotected) header.d=sntech.de header.i=@sntech.de header.a=rsa-sha256 header.s=gloria202408 header.b=l+XOTufO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Cw/AEA9RUly+lbDRITFDwUsGwTqIHV3epLm2bzHHVIE=; b=DEu1Yn2WEXaT1yTzQSntPfsQQf
	KcGvtrhYXdm1QMGssQUalhP1vCP+rVGA0EDQZjgN3eQhjPGS6U+tD+4AkfSSb6mCfrIdz6rygqxEX
	MYA9BkBGwk9bngRHjxHvOjS4nUbDmR43JAalycPjg98O8MMN7CrsTWL7rF4xt+KKCSQ4QEWw83deI
	ukevavraHehjCdIbalc0LXdxkcdo5VNkSdWHxVdkaHFXBNrTnKDgSp4oshkUHjQiBVlmtsZn1tmSm
	DTKE1QfuVYe/5fzOrevjkxs161GSgiy9JkdDy4zhw8/MTA2toZSU3BhmcKXfhdeVBHsLEqta2O7BL
	BiqBPMtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXhg-00000004vuy-2oNc;
	Wed, 04 Nov 2026 09:54:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOXhe-00000004vuG-0ini;
	Wed, 04 Nov 2026 09:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=Cw/AEA9RUly+lbDRITFDwUsGwTqIHV3epLm2bzHHVIE=; b=l+XOTufOEsoX4h44xsZUeQJd9y
	UQVDTH1ZcIwsjWzDG9IAhHZZZROudzxDmWTRe5fqxP9BNQHxaefTD7xe0xXAh4yv6Rl/ylkjgSZxR
	LUFNPOSonghfbKOtC13S7/DdNMQR0ETOrTCFkr+4TT2zDhj2oYeY1GSun7OholDrhGQTOzHa3PgP7
	DqltQo4KF2KUZeQRaOrWsndiEP1eIVultVov0khVdbYyT85U/m1nh9ZInru8Ei8lmOK26bFB8Y6Oh
	AvKNrRTTtZIEUMXouprbvAyoZjJ3pBFNBrvyzgWBn51Muil4I2Ya3HaOC3W3sq6TPM8kVURpOI65E
	0zkY4ZCw==;
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>,
 Igor Paunovic <royalnet026@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
 Robert Foss <rfoss@kernel.org>, Sidong Yang <sidong.yang@furiosa.ai>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Jiaxing Hu <gahing@gahingwoo.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jonas Karlman <jonas@kwiboo.se>, Guangshuo Li <lgs201920130244@gmail.com>,
 =?UTF-8?B?SMO8c2V5aW4=?= BIYIK <boogiepop@gmx.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v2 03/11] accel/rocket: search every core slot when looking up a
 scheduler
Date: Wed, 04 Nov 2026 10:54:26 +0100
Message-ID: <3950609.VQhiAETyHQ@diego>
In-Reply-To: <20260922080114.44662-4-royalnet026@gmail.com>
References: <20260922080114.44662-1-royalnet026@gmail.com>
 <20260922080114.44662-4-royalnet026@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_015446_213604_F5A105CC 
X-CRM114-Status: UNSURE (   9.20  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am Dienstag, 22. September 2026, 10:01:06 Mitteleurop=C3=A4ische Normalzeit=
 schrieb Igor Paunovic:
[...]
> Search all the slots that were allocated, the way find_core_for_dev() now
> does. A core that is still bound is then found, and the two callers get
> the pointer they already assume they have.
[...]
> ---
> Unchanged from the standalone posting, which this series supersedes:
> https://lore.kernel.org/r/20260905150432.7477-1-royalnet026@gmail.com

not to self: I had applied the standalone version for 7.3

Heiko



