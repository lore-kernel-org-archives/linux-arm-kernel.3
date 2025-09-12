Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB45ECAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWAcV33ZMph2arQWUOu2bOKmt37CgEiSNgomNwsHgUE=; b=LkWwyL/kz2zCZHtS7VqpkovV2G
	8Qr9xAzb30Sfb9c/dVUSFdMDEi0NHH4gtv9UOIayK/jBAa3PCDTlhEy4g/AHH3040wY4NF8DIusFH
	Bw3YQeQc0T3UqVRSPYlfzBYVpscq50bxpmwA/P/tq09saIslGZ/zckZ6UfJWHAdwaqBehjFkgMDUL
	JBbgdCxUuu6NDON6GLb+tTYLjLD8QJ6UnxapNk+U22+jQqhi4jUrRXYJVoxI7gxMeMGvxzUyUJKgP
	lhNFOUuby2x6Ivujp2c7509y1TxFt/pNGWE+kkZjyBSLwWBGjMGF6Ol1sogCmwS2khz4nAaOV3S/L
	oMLjMN+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Zs-0000000B0lk-14WN;
	Fri, 12 Sep 2025 18:32:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Zr-0000000B0kh-0fCR
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 12 Sep 2025 18:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MWAcV33ZMph2arQWUOu2bOKmt37CgEiSNgomNwsHgUE=; b=Tdo0hlZCNHNM6sQedBwwiuzjWa
	PwuhVDPyvFBJbP1yD/h/HvLogrAFrObjnzpdCKBAP3ym9i1YuKrbnXm0qnw1i++xJVH/yB1b+4TeP
	MGL/VY9Duh6ggozsBeusqW5JFfMf/CF014dvTjeZDJJDmWvRiUxRCnmnGjPsT8D+qTh7/ekSmlzPE
	Y5gdZ1i9Q9I9ouExmtSjJwcq76MGJOKyCCJqqH6U1NqkOs1+CYizOBWY0eC136btuqkSv5V/4JO6b
	1j+RrylwjNMHVXjrgQxhxIvxMJvL0thHClUVvitFLIk56YnEpGUDXpw8s3UfF3ay9bCOgKnD7ZYvf
	nZfq2TBw==;
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Zo-00000006P86-08HV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:32:53 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-53042807be7so1547483137.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757701967; x=1758306767; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MWAcV33ZMph2arQWUOu2bOKmt37CgEiSNgomNwsHgUE=;
        b=hWtcxhYe7lVZg5yr2kAEK0ldUN3jtt9iplP9suZljf1vFkhHbAKG3MiGv5XLu1kEVX
         +Fwfrbnb9nbQZy/gdJBO8xInW6L2kCJ31fHhsp9OwXrLbD7qbuPktC2i7mBoAtGHnznw
         11VYPx/Uq5kWA0LHWxEEfGUfORBeuVTOcDLb2Xz/wan6J78Hknx48LAMhHsgM/6UuL5Q
         sZj2mXyuB2MBXepaokdjKcgP0/hRaOhx5QZiVVFc/zotvRQsWW4KLUIuK0+mkE8Oly6i
         ZWCQoO/1s5U5ZwK1r6bZW0j8eiQ9ICcS/nIOM4mSPGZaKdlPLjghJQsuPqLDj/KtTjC6
         X6FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757701967; x=1758306767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MWAcV33ZMph2arQWUOu2bOKmt37CgEiSNgomNwsHgUE=;
        b=g+ROdxt+tcxK/JJtUffGHU5NW5I3RkfgWiOwWb/8d9l7YLXOKiQEksfcKIRp39XCC3
         WhY9CCxP3tCtMW2g8hFE6jln+sfL2i71GzMPQ89Q/Q0ptVqaETaV4jVlrn0KQZVKizT4
         vJUCc/0Esg3m2jZXal7PKqKNDeRMbhEWyq9UxxMQVKnTNysUxUEQAnIVorWcCaXiJUQR
         a5l7c6fuNgGMC4qWZs7klpmAtgAHAn+5aelQZfT/bjtDODmeahmwcgWnSbhYBkInj9UQ
         LyLZXcPmBrGYsrASnqjwcnWjQZpXx8Yz8D7TcKYciugyvqH5hhGdYtI9zh9GVpUZaUwT
         PpFg==
X-Forwarded-Encrypted: i=1; AJvYcCVMK2qS47jAAprNoDiW3sRVIw6Z2XN8Rs/75eo63IpLjUFIqAuSg1a0Nok8GUM9oZCIydmLtf/o9fZkZ+jvpGRF@lists.infradead.org
X-Gm-Message-State: AOJu0YyQNjrMGmfaV53fLCWQTG6XbpYIyhgPQptowDZzR0DHGoboZlBm
	UNAZeOo+WnHnOASH1ZdlFSUr5hhgEAvmlJjc0/l74vl5Lz2TPTOSvh+2OgtCk4V4bGy/h1UoS21
	Y8HSAWQk4hbHec9N/NaWXjX6QG8h2aGM79eUsAren
X-Gm-Gg: ASbGnctP3L5HYJTJm+vCu9NwpKEvA6BPw0eFKHsqLew/hy8cxFFDNAfKaAZy4yAJtLR
	VVkLe1fBMf37g1R75UM39h4RWNorJsKz0VwgEDhtLqIXz+H0me8uq5fW6ZfBTxUOZmysLcOC3F9
	BBVbnwd/a3YeUWXW5cbbY8IJQGriNdIzu41QrreMtklWOorPzKbId+dPsPa6AzLnOKM1XY4nPNI
	YoHYkmG30z9SZy8yAn4OO8=
X-Google-Smtp-Source: AGHT+IEwuqGiSpqE4S73UrrBSfohWasHabBibycBkPxzV5dEA4Kg4RuWdEXXtxpvh+JdAFU3NQGylw9Qezmw4UR6T3M=
X-Received: by 2002:a05:6102:5092:b0:555:56e0:f357 with SMTP id
 ada2fe7eead31-556111a20c4mr2073158137.23.1757701967147; Fri, 12 Sep 2025
 11:32:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <DCPDDIZ3S1CM.3DJYY5U4T6V4U@cknow.org> <CAMuHMdVxjOLZsas4+nmAkZjbJsQjxdkZvZ8tTY9pq2zz3gvFNQ@mail.gmail.com>
 <DCPTTD0NKOE6.1HKQ87ESFOT6D@cknow.org>
In-Reply-To: <DCPTTD0NKOE6.1HKQ87ESFOT6D@cknow.org>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 12 Sep 2025 11:32:10 -0700
X-Gm-Features: AS18NWABs8fnzpFVCAtvwJwDtmgpdJSk1T67VpjW5fTH0mGJFK7ZtMdVqvXofIU
Message-ID: <CAGETcx-HnLZBZmP0CUhuYc8jtyAaP6Ax_h0oHubyaL9qw=dF3w@mail.gmail.com>
Subject: Re: [PATCH 0/5] pmdomain: Restore behaviour for disabling unused PM domains
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-rockchip@lists.infradead.org, Konrad Dybcio <konradybcio@kernel.org>, 
	Peng Fan <peng.fan@oss.nxp.com>, linux-pm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Sebin Francis <sebin.francis@ti.com>, 
	Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Christian Hewitt <christianshewitt@gmail.com>, 
	linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_193252_157937_B9D05633 
X-CRM114-Status: GOOD (  34.53  )
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

On Thu, Sep 11, 2025 at 1:26=E2=80=AFAM Diederik de Haas <didi.debian@cknow=
.org> wrote:
>
> Hi Geert,
>
> On Thu Sep 11, 2025 at 9:18 AM CEST, Geert Uytterhoeven wrote:
> > On Wed, 10 Sept 2025 at 21:33, Diederik de Haas <didi.debian@cknow.org>=
 wrote:
> >> On Tue Sep 9, 2025 at 1:11 PM CEST, Ulf Hansson wrote:
> >> > Recent changes to genpd prevents those PM domains being powered-on d=
uring
> >> > initialization from being powered-off during the boot sequence. Base=
d upon
> >> > whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd =
relies
> >> > on the sync_state mechanism or the genpd_power_off_unused() (which i=
s a
> >> > late_initcall_sync), to understand when it's okay to allow these PM =
domains
> >> > to be powered-off.
> >> >
> >> > This new behaviour in genpd has lead to problems on different platfo=
rms [1].
> >> >
> >> > In this series, I am therefore suggesting to restore the behavior of
> >> > genpd_power_off_unused() along with introducing a new genpd config f=
lag,
> >> > GENPD_FLAG_NO_STAY_ON, to allow genpd OF providers to opt-out from t=
he new
> >> > behaviour.
> >>
> >> Is it expected that I'm still seeing this on a Rock64 (rk3328), just
> >> like before [1]?
> >>
> >>   [   17.124202] rockchip-pm-domain ff100000.syscon:power-controller: =
sync_state() pending due to ff300000.gpu
> >>   [   17.129799] rockchip-pm-domain ff100000.syscon:power-controller: =
sync_state() pending due to ff350000.video-codec
> >>   [   17.140003] rockchip-pm-domain ff100000.syscon:power-controller: =
sync_state() pending due to ff360000.video-codec
> >
> > Yes, as the sync state is still blocked on them.
> > Disabling unused PM Domains is done independently of sync state.
> >
> >> This is with a 6.17-rc5 kernel with this patch set applied.
> >> And it also has this patch from Christian Hewitt added, now in v3:
> >> https://lore.kernel.org/linux-rockchip/20250906120810.1833016-1-christ=
ianshewitt@gmail.com/
> >>
> >> When I boot into a 6.17-rc5 kernel without any patches applied, I do g=
et
> >> the 2 for ff350000.video-codec and ff360000.video-codec, but not the
> >> ff300000.gpu one.
> >>
> >> Interestingly:
> >> ff300000.gpu -> power-domains =3D <&power RK3328_PD_GPU>;
> >> ff350000.video-codec -> power-domains =3D <&power RK3328_PD_VPU>;
> >> ff360000.video-codec -> power-domains =3D <&power RK3328_PD_VIDEO>;
> >>
> >> I would be surprised if that was a coincidence.
> >
> > Fw_devlinks ignores the index cell (RK3328_PD_*), hence all links are
> > created pointing to the pmdomain controller (in case it has a platform
> > driver) or the first pmdomain (in case it has not). thus blocking the
> > sync state call and power-down for _all_ pmdomains managed by the
> > controller.
>
> I don't think I fully understand this (not your problem due to lack of
> knowledge on my part), but you mentioning 'fw_devlink' rang a bell.
>
> Some time ago Nicolas Frattaroli and I worked on an image for PINE64's
> *Quartz* devices and that added ``fw_devlink=3Doff`` to cmdline.
> I've been using it on all my Rockchip based devices, without
> understanding that parameter ... but (apparently) on my 'rock64-test'
> device, where I tested it with, I had removed that parameter.
> Putting that parameter back ... and those warnings are gone!
>
> Thanks a LOT for that hint!

Please don't just disable fw_devlink using fw_devlink=3Doff. We want to
fix any issues you are hitting with it. I might even delete this "off"
option sometime. It was meant as an early debug option.

Thanks,
Saravana

