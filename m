Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692F4CA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=; b=BL/gOHrncHplI4V0TwPWPiuJsF
	pq97DSFqyJixRZ+jpVcfgiY0r7cBcERW+ms+ZouvY4zlFulvB0s46FVSZkgn74VUFzZHhj/vQmguB
	4xGBXpc9WP6WRmi2+SPSpqY9hs6yE3KthtSFfTw+HW2qvYrAMC6xJwkDIgOJMtfB5mf4YPcPjmfFi
	MkJL1MFyu75YJxoqnMEQscjCgvTlG821ShNp3Gjr1qq6Fyvbl4Mw0Uh4efqb8LxreTWb6Ts9rldlA
	Kl7maHZ7fJaf4USHX5xXmUDDB0ErT4koGRf4x5fvnmk7aXVPxgVy/ajRQJS6FVJuyM17OixR48Pek
	2DdVsmtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELSj-00000001o80-0m01;
	Wed, 07 Oct 2026 06:49:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELSi-00000001o7o-1gop
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:49:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C0B7601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 06:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060391F0089F
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 06:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791355751;
	bh=kVXuH7H4PDcskImrivyP/VtzUO54yTkMmhV+cSg/PdA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dg/APZQ9ejy4HmKPDmWJ49DQjYI8eWTCX2U9HoU5cpY3x9Rp89PIqyA8NLJL0FwtJ
	 GMzK4tUOwWk49yYln+oGbbud0wd+E1ne0Fmx4u/kimPS1vwfpbRml7GQ+ixnK3WLy5
	 adZ7iVP2QncNkxmIKC3Dhq6N3u2YYx+tYwo97iXjIw81UJ7iupGbyvfRCJaeqOgE3+
	 VTVO/i9lEVYeS//KnuemuoJQ9Bhbgdxg47sJreGtLXkIMBl+Vr5niUOqlFYNtkozg9
	 mGCFqSQyXN8Tou3REIxsoHqM2zX/h5J9SJoWUqMbRVurUKh76v8oQHNBpM1OPIMfQC
	 G4LuA1C3AaIVA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5bcb6faf862so3099366e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 23:49:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx1EW/WLLW7KUj1NntMzU9HN2MZt3eTn5U2TKu0/0GhgutcvFaNQYoCdHc74fzlpLlvVJBbelJnlWZe+ZU2RVe9@lists.infradead.org
X-Gm-Message-State: AFq9FYJHZ6CfX1ZfujV9n/at+TFas4d03NHPXqzth6zl0Ouuqdt46Ryw
	v9KkdMI21doEwci/6t9Ca+NkSXb3E6Jn+IfQokPXQ9BgKw5Age0abm6Zlre1VsjoVvJFjq1z+we
	jLDiO5Chl9MeDNbrg4uakqlT6cMu4SuA=
X-Received: by 2002:ac2:51cb:0:b0:5ba:3443:aa2e with SMTP id
 2adb3069b0e04-5bcd06dde9emr392580e87.21.1791355749772; Tue, 06 Oct 2026
 23:49:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
In-Reply-To: <20260917-scmi-pinctrl-generics-v2-0-3eeee364257f@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 08:48:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
X-Gm-Features: AclHuK9LebUk8FXXJTxUAdYqh6ANC6YbZR1Kg-AkYL0dvrplEgSlwXOq9S4AtEE
Message-ID: <CAD++jLkgBKDvbxsnhsBE_Qqs6TA8how4J2jvKm=tdpx4P+4JdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: scmi: Replace get function and group info
 with generic callbacks
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Sep 18, 2026 at 12:56=E2=80=AFAM Alex Tran <alex.tran@oss.qualcomm.=
com> wrote:

> This series refactors the SCMI pinctrl driver to eliminate metadata
> getter callbacks to be replaced with pinctrl and pinmux generics
> provided by the pinctrl core.
>
> Previously, the driver implemented its own get_functions_count,
> get_function_name, get_function_groups, get_groups_count,
> get_group_name, and get_group_pins callbacks, which required
> maintaining driver metadata like the functions and count.
>
> The pinctrl core already has support to store and manage this
> topology in the pinctrl_dev via its own internal radix trees.
> By registering functions and groups at probe time using
> pinmux_generic_add_function and pinctrl_generic_add_group, the
> driver can delegate group and function metadata management to
> the core.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Patches applied!

Yours,
Linus Walleij

