Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E19ACA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qh9CoKh+ZXVGj6kTKZS0aB5YRv820luNzFDKgz4XQQE=; b=syNm/mi0Qj5+H44VSOqIs/rWB0
	mRCG2Xjj9CTDsQtBQKukqsvM+T/A1rk4gytXpneicoWvyPuiD5isNerhAf9gX4z+CsOt7E+QpvFqA
	YbGLUrd4cG8BOG4uquTBVxQGIGJ9kluF8PqqomhL80gBur/HzCx2oltUU6GeToAv5UrzlkNUkRejy
	l/PQUUAcQ1EhGYvqBJq2j2T1gt0Lod9z+JyLj6SveOR76WBUWjFrbW9Fy0S5auRaSk3H4pPew7KSm
	9wTPIGhmzX8zMvYmL7Oi49y7gnBJzt7nMWxE7qBKsCy9OxOiJzGFtCO2udBZuylradizGkiqk7xne
	rHdRrGoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweUx-00000002MkD-0RKy;
	Thu, 11 Sep 2025 10:25:51 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uweUu-00000002MjL-3ABK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:25:50 +0000
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-ea059954d52so338446276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 03:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757586347; x=1758191147; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qh9CoKh+ZXVGj6kTKZS0aB5YRv820luNzFDKgz4XQQE=;
        b=TwacL1MkPh+kziyj507vK7ru3fwTndy+IA6cPbuloKjsUVSjwLNtY94I596TV6trKG
         Kyz7lnWn9WUF4L75fXmUGO+kpHZWPhaBFTI7sIx79zYR62+oWp1siBcg9x9l1tnZ1Gc9
         7tT0vixDgzLz3ypPyR6V4SRVE0Ut5vRiOo2lVJxrur+rScYoLvrxcwuSmzBklfk+JY2I
         e5aJAaTOoG7MdkWC2KOh9bueMSMUQV3UyQzfyP7QyhF+f4icVI9ihB5aLQC442TocWBQ
         638xTAzn52JcB8e2Ca+525R8eG2YqXg8mjSpphoW1MNvQT5r0Eo6tAC60fmFi0tMxZNM
         mWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757586347; x=1758191147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qh9CoKh+ZXVGj6kTKZS0aB5YRv820luNzFDKgz4XQQE=;
        b=Z00aAUaVANTESUpmgjXZqKJbgJbnfQul7qNfEl8EKNhoVANhXGAmSO4cVV2i95W9wh
         q97cAVBULUEQcJTBgYVSqeSUI8X0/YDhYryQZase9wCoBJVQNTp+zEGN9jQ95Rb2pN22
         HxELexucSSnfVX5u+pbkY0Wp6DZm6VqflScPu4x+chEW5Q2eAc82bt8HWaIz1b7DHf16
         iaYD+pTQ0RWMq0nRHrHJF7OufNwK5J8Rnf6VEBy4UEMtvY7/VWsx6v01zYKBwXnD7fum
         ijidW8TCwgAHxTVGb8iKsc/iQqR0GhjlyYgWljDV0zgKAzHNVn6TPK1axD0Qr8zpG3PJ
         JoIg==
X-Forwarded-Encrypted: i=1; AJvYcCWXBGN8OjjTMxvLi3p7EeroJvy0+P+1YU4BE2RmdKoYSBs6RmM7mCSTFZNUJTOnsGa0EayivfpWEa1Qz444sg/Y@lists.infradead.org
X-Gm-Message-State: AOJu0YxdLWBiWoC1XxDg8rCHCVrQLwgNVoXAitGuyrcdZ86wTEAhRtRb
	zfrf9j2MQf1U5wtkAvxuOHoHAOGOEAnfZ0uGX/cC2MD1Nz8XrtnyM4soLMtO/UEnVY7PqVc9eZe
	iFCmiN/NDRTGYcbTresiAJW6alUIsaobkxaiyL8LL8/ulECZ5BO1DUqA=
X-Gm-Gg: ASbGncvYc09qbDqhgaon25pSXm2b3d8SMOF11yNBJrbz8WWy4Go2xwMex3+jvBYrdbp
	FiqiwMZgT43zd9pB3isH9rJXVUWhdJm+IEjNXiCVrO81v7sqbMduvaqKOOdYyJ5vBNY/8b3A/Yq
	ZMrp81Lkzdz0dSHgTTGiAmM3W2cpPwP/OBGYei4akcOJ6AADeS2VAH6sloAafjwyMxKWaDSiWaJ
	py6QjMu
X-Google-Smtp-Source: AGHT+IG3s4IJNZMJSCEDBH6fNAyZFvVket6EtCNxPtuvOXrrmrIogMrgaGfvzIvNzamapqOCag5fTU5WzoWDmiZ5pgw=
X-Received: by 2002:a05:6902:2a4a:b0:e98:9926:e5cf with SMTP id
 3f1490d57ef6-e9f6798f570mr15236689276.24.1757586347029; Thu, 11 Sep 2025
 03:25:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <20250909111130.132976-2-ulf.hansson@linaro.org> <CAMuHMdUFXioe36r9mzNchHw3DGyEiVA-=ajTp333jowEsrxMNw@mail.gmail.com>
In-Reply-To: <CAMuHMdUFXioe36r9mzNchHw3DGyEiVA-=ajTp333jowEsrxMNw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 12:25:09 +0200
X-Gm-Features: Ac12FXzECRIqMODIi1UrVX0E7YEVWHDVwJFOM_t49DQAOVwqsE-keud9aiJ5lYc
Message-ID: <CAPDyKFrTTUs2xwoY+Tmff1SHhsGjj-XmW3maDnO7V6T7m_8H=Q@mail.gmail.com>
Subject: Re: [PATCH 1/5] pmdomain: core: Restore behaviour for disabling
 unused PM domains
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org, 
	Stephen Boyd <sboyd@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Sebin Francis <sebin.francis@ti.com>, 
	Diederik de Haas <didi.debian@cknow.org>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_032548_812639_FE62B64B 
X-CRM114-Status: GOOD (  28.31  )
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

On Thu, 11 Sept 2025 at 09:56, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > Recent changes to genpd prevents those PM domains being powered-on during
> > initialization from being powered-off during the boot sequence. Based upon
> > whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
> > on the sync_state mechanism or the genpd_power_off_unused() (which is a
> > late_initcall_sync), to understand when it's okay to allow these PM domains
> > to be powered-off.
> >
> > This new behaviour in genpd has lead to problems on different platforms.
> > Let's therefore restore the behavior of genpd_power_off_unused().
> > Moreover, let's introduce GENPD_FLAG_NO_STAY_ON, to allow genpd OF
> > providers to opt-out from the new behaviour.
> >
> > Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Link: https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/
> > Reported-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> > Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/include/linux/pm_domain.h
> > +++ b/include/linux/pm_domain.h
> > @@ -115,6 +115,12 @@ struct dev_pm_domain_list {
> >   *                             genpd provider specific way, likely through a
> >   *                             parent device node. This flag makes genpd to
> >   *                             skip its internal support for this.
> > + *
> > + * GENPD_FLAG_NO_STAY_ON:      For genpd OF providers a powered-on PM domain at
> > + *                             initialization is prevented from being
> > + *                             powered-off until the ->sync_state() callback is
> > + *                             invoked. This flag informs genpd to allow a
> > + *                             power-off without waiting for ->sync_state().
>
> This also restores power-down of pmdomains after a failed device
> probe (due to a real issue, or just -EPROBE_DEFER), possibly
> interfering with other devices that are part of the same pmdomain(s)
> but haven't been probed yet. E.g. what if your serial console is
> part of the same pmdomain?  Probably the pmdomain(s) should not
> be powered down immediately, but only later, when either sync state
> or genpd_power_off_unused() kicks in.

That is exactly one of the problems we solve with the new sync_state
support in genpd.

If you have this problem for one of the PM domains, we should not set
GENPD_FLAG_NO_STAY_ON for it. In fact, that's exactly why I added this
flag, to allow it to be set on a per genpd basis. Otherwise we might
as well have used of_genpd_sync_state().

Down the road, if we can improve the sync_state support in genpd,
especially a more fine-grained control for those providers that use
of_genpd_add_provider_onecell(), I hope we should be able to remove
this flag.

[...]

Kind regards
Uffe

