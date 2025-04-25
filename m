Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD22FC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzOovnCFz7a1pN3eCV+0adUMbLsCWU/yLERT/IqWY78=; b=CK/L/auFoQKcUnpkbsF6mKwvuv
	v4NT8JZ++JA5sFl/rHxlpcEMo9dPyaF7sj4G3lyRk50WG2qFk6v1ZnPtA9TDlDksFTZAmpD57ySz4
	jzMp5IIAn3mrcNrnyKuvXiwHGLyCAkzSaBza4z4rhoWb4KzZYRpIHtrGDmHkUZX/ZpC2VjoN3VJxH
	m1AfitNup+uDS1D3PRow4+uFufqbS+v5L/Tht10uesknfHpHd1DIoOaHi1JMiP9eJBWlIqtOaQqIQ
	9PxgYseGtFD7dugTgkdgKn4B9HbbQuwHMGu7sSdBDO/bZGyV4EofIC6J4e3h/ws258VbKvH7KPHpp
	JIAa9IXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Iud-0000000HFAZ-1tQd;
	Fri, 25 Apr 2025 13:16:15 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Hzu-0000000H6CZ-39z4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:17:40 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-708154c2a80so18897447b3.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745583457; x=1746188257; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MzOovnCFz7a1pN3eCV+0adUMbLsCWU/yLERT/IqWY78=;
        b=fIbBZ+lqUM6krF4w3KmZkBGlDXU2l6BWSkeZnZFdXJA/RcUquOHmN9sFkY6L/6vOXU
         odAAhAm3ZL0VR1pmNV44aXb+6NXVgNVhcINlSwb6Ke22L+Ti7CLeCUp5mW4HwaO96/Y5
         7nAWyf67KL4+MA7y33OliH8YYuuJhSc17abG7GEbwT1EIb/ITkvBzXHfPyTs0HlQSNCA
         L50iCq0A2yICjEQiuaq5P7lO8xM+mR4Bwd4MK/6uh6JjgLYW9uEuaYAMnpa7aqjDM45X
         miuTOzCQlKxBEmSg5kq1XG4TQZufIaY+mRlprFXE0Xmp+kp0guPum7NJ7ZstHs4i409U
         0pWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745583457; x=1746188257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MzOovnCFz7a1pN3eCV+0adUMbLsCWU/yLERT/IqWY78=;
        b=tdgKiByJF0bcaRZG3J97JIXcz3VAxfJlMvDkBld1BH4TeNwx6OTPuqJ1gYc0wNrfxl
         2xlHkmehpiaMzaY42vnV21pKQ4qvYuz5gKoW76c1A0LVodnafMgNiiqmtxvIK+FIajFC
         v5rBa9vHZomsoFVWAYTciNFitNVctjeQj3UTPLn16T7TBpxNaDMmqAPIKB5gEfsjR3Cj
         9W6UBBdUC8hcSKX2/CuHSlnFPKuQaWfHm9uvKdHN0byVqOMg2wQQ8DokB4JnY+CFvq2z
         6WpjW9gWiLH2k8QLy//riVTMh1rcPO4C8ZQgtYO2QdyA5XBb/c61eLzXoQB2CMvpw8AS
         6yoA==
X-Forwarded-Encrypted: i=1; AJvYcCV1MiSivh11owb4mCv99Sb3D9iikXBwXIBLYunWM0tZ563FbwjGMDl+W87wwMJufOgwYHf/WZnBUn03S/rOYwhc@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9vw9y9AjHhRLnXdUehhB9z8AqrEKe46EvfL7N1rXSknC4g+RD
	xMGfs3umsKjPmYI/fbWN/bqjaTvaybslMvm2HhnR/70lA0aHwe37CmLJmJ1B/doCU7WxzvnHPyg
	r1/OgiLYnf69PZDA50x7dFIqh8uweKyVADmFY2A==
X-Gm-Gg: ASbGncscYp/5SHi7GpPZ0OrwfodrShgLfmkEILMebhB/zc1YRYgMWMQzHp4foWMNrJc
	jDrxAqznQ/Zg7XOfT0y3FKGpO/RciePWaxxjv36z04IuFCXoJDuo3YTMppO5/u6dScmsOWYQvwW
	LRm531jBQu+CohWD8M3bG0Vzs=
X-Google-Smtp-Source: AGHT+IGhJmRc9wirk6fDwzA3gjt9BfQcDnkXr8+Xu6rh22RdL/tZq9C8iOaUX31C0gPRlQRgIZCpM52uZZvwSlBctd0=
X-Received: by 2002:a05:690c:60c8:b0:6fb:5498:70fa with SMTP id
 00721157ae682-7085412a5c0mr29991187b3.18.1745583457456; Fri, 25 Apr 2025
 05:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250417142513.312939-1-ulf.hansson@linaro.org> <8e748129-3348-4bf1-9fc8-fadc569fa48e@ideasonboard.com>
In-Reply-To: <8e748129-3348-4bf1-9fc8-fadc569fa48e@ideasonboard.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 14:17:01 +0200
X-Gm-Features: ATxdqUHCfnRVoNINH1KaYmw86rw8GwFvpw8gSk9J6VyXy12y2iJ3WN0VKIVIR6M
Message-ID: <CAPDyKFqEgJPn-e-FooG_3h=Eqfw511c9_b+ywPcrfao8_p=u+Q@mail.gmail.com>
Subject: Re: [PATCH 00/11] pmdomain: Add generic ->sync_state() support to genpd
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Devarsh Thakkar <devarsht@lewv0571a.ent.ti.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, 
	Devarsh Thakkar <devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_051738_825789_4A60724A 
X-CRM114-Status: GOOD (  45.57  )
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

On Thu, 24 Apr 2025 at 12:59, Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> Hi,
>
> On 17/04/2025 17:24, Ulf Hansson wrote:
> > If a PM domain (genpd) is powered-on during boot, there is probably a good
> > reason for it. Therefore it's known to be a bad idea to allow such genpd to be
> > powered-off before all of its consumer devices have been probed. This series
> > intends to fix this problem.
> >
> > We have been discussing these issues at LKML and at various Linux-conferences
> > in the past. I have therefore tried to include the people I can recall being
> > involved, but I may have forgotten some (my apologies), feel free to loop them
> > in.
> >
> > A few notes:
> > *)
> > Even if this looks good, the last patch can't go in without some additional
> > changes to a couple of existing genpd provider drivers. Typically genpd provider
> > drivers that implements ->sync_state() need to call of_genpd_sync_state(), but I
> > will fix this asap, if we think the series makes sense.
> >
> > *)
> > Patch 1 -> 3 are just preparatory cleanups.
> >
> > *)
> > I have tested this with QEMU with a bunch of local test-drivers and DT nodes.
> > Let me know if you want me to share this code too.
> >
> >
> > Please help review and test!
> > Finally, a big thanks to Saravana for all the support!
>
> I had a quick test with this on TI's AM62 board. A few observations.
>
> With this series, all the individual PDs seem to get a state_synced file:
>
> ...
> /sys/devices/genpd_provider/pd:143/state_synced
> /sys/devices/genpd_provider/pd:54/state_synced
> /sys/devices/genpd_provider/pd:105/state_synced
> /sys/devices/genpd_provider/pd:62/state_synced
> /sys/devices/genpd_provider/pd:141/state_synced
> ...
>
> Is that on purpose? What do these files represent? They all seem to be "1".

It's on purpose, but in this case there are no fw_devlink tracking
them, but instead that's done via..

/sys/devices/platform/bus@f0000/44043000.system-controller/44043000.system-controller:power-controller/state_synced

..as you point out below.

Depending on the DT layout these nodes may be useful, but not in the
TI PM domain case.

>
> When I boot up, I see the sync_state pending:
>
> [   22.541292] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> 2b10000.audio-contro
> ller
> [   22.554839] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> e0f0000.watchdog
> [   22.566550] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> e030000.watchdog
> [   22.577854] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> e020000.watchdog
> [   22.589239] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> e010000.watchdog
> [   22.600674] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> e000000.watchdog
> [   22.611875] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> 30200000.dss
> [   22.622813] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> fd00000.gpu
> [   22.633565] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> b00000.temperature-s
> ensor
> [   22.645540] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> 2b300050.target-modu
> le
> [   22.657067] ti_sci_pm_domains
> 44043000.system-controller:power-controller: sync_state() pending due to
> chosen:framebuffer@0
>
> The "real" state_synced file on this platform is:
>
> /sys/devices/platform/bus@f0000/44043000.system-controller/44043000.system-controller:power-controller/state_synced
>
> In strict mode, this shows 0, and if I echo 1 (interestingly "echo 1 >
> /sys/..." doesn't work, I need "echo -n 1 > /sys/...), I see PDs getting
> powered off (added a debug print there):
>
> [   87.335487] ti_sci_pd_power_off 88
> [   87.342896] ti_sci_pd_power_off 87
> [   87.347404] ti_sci_pd_power_off 86
> [   87.356464] ti_sci_pd_power_off 128
> [   87.361296] ti_sci_pd_power_off 127
> [   87.368714] ti_sci_pd_power_off 126
> [   87.373349] ti_sci_pd_power_off 125
> [   87.378077] ti_sci_pd_power_off 62
> [   87.382587] ti_sci_pd_power_off 60
> [   87.387194] ti_sci_pd_power_off 59
> [   87.391759] ti_sci_pd_power_off 53
> [   87.396648] ti_sci_pd_power_off 52
> [   87.400801] ti_sci_pd_power_off 51
> [   87.405131] ti_sci_pd_power_off 75
> [   87.409238] ti_sci_pd_power_off 143
> [   87.413328] ti_sci_pd_power_off 142
> [   87.417403] ti_sci_pd_power_off 141
> [   87.421494] ti_sci_pd_power_off 105
> [   87.425632] ti_sci_pd_power_off 104
> [   87.429815] ti_sci_pd_power_off 103
> [   87.433941] ti_sci_pd_power_off 102
> [   87.438054] ti_sci_pd_power_off 158
> [   87.442151] ti_sci_pd_power_off 156
> [   87.446324] ti_sci_pd_power_off 155
> [   87.450463] ti_sci_pd_power_off 154
> [   87.454549] ti_sci_pd_power_off 153
> [   87.458671] ti_sci_pd_power_off 152
> [   87.462571] ti_sci_pd_power_off 43
> [   87.466425] ti_sci_pd_power_off 42
> [   87.470254] ti_sci_pd_power_off 41
> [   87.474032] ti_sci_pd_power_off 40
> [   87.477825] ti_sci_pd_power_off 39
> [   87.481609] ti_sci_pd_power_off 38
> [   87.485432] ti_sci_pd_power_off 37
> [   87.489256] ti_sci_pd_power_off 36
> [   87.493077] ti_sci_pd_power_off 95
> [   87.496845] ti_sci_pd_power_off 132
> [   87.500780] ti_sci_pd_power_off 107
> [   87.504583] ti_sci_pd_power_off 114
> [   87.508429] ti_sci_pd_power_off 79
> [   87.512050] ti_sci_pd_power_off 148
> [   87.515859] ti_sci_pd_power_off 147
> [   87.519644] ti_sci_pd_power_off 106
> [   87.523414] ti_sci_pd_power_off 149
> [   87.527203] ti_sci_pd_power_off 50
> [   87.530971] ti_sci_pd_power_off 49
> [   87.534708] ti_sci_pd_power_off 48
> [   87.538401] ti_sci_pd_power_off 35
> [   87.542040] ti_sci_pd_power_off 186
>
> We do have a lot of "extra" PDs enabled by the bootloader...
>
> With the timeout mode, I see the sync_state() getting called some
> seconds after the boot has finished.
>
> So... I think it all works as expected. You can take this as some kind
> of Tested-by, but it'd be good if someone from TI who knows more about
> PDs would test this too =).

Thanks a lot for testing and sharing your information!

>
> Interestingly, I see a difference in behavior to the old patches from
> Abel: with the old patches, if I boot up with the DSS (display
> subsystem) enabled by the bootloader, it looks the same as with these
> patches. However, with the old patches, when I load the DSS driver, and
> it probes successfully, the DSS PD will get managed correctly, i.e. if I
> blank the screen, the DSS PD will go to off, even if the sync_state has
> not been called.
>
> With these patches the DSS PD will stay on, no matter if I load the DSS
> driver or not, and will only go off after sync_state has been called.
>
> I'm not quite sure here, but I think the behavior with the old patches
> makes sense: when the driver for a particular PD loads, the PD no longer
> needs to be kept on. Or... Is this about the case where a PD has
> multiple consumers? The PD provider cannot know how many consumers there
> are for a single PD, so it must keep all boot-time-enabled PDs on until
> sync_state() (i.e. all the consumer drivers have probed)?

You are correct!

ti_sci_pm_domains are modelled in DT by using:
#power-domain-cells = <1>;
or
#power-domain-cells = <2>;

fw_devlink doesn't look at those additional specifiers in DT. For
example, if a consumer has "power-domains = <&k2g_pds 5>;" the '5'
will not be considered as a separate domain, but instead all consumers
of &k2g_pds needs to be probed, before the ->sync_state() gets called.

Theoretically, if we could treat the specifier ('5' in this case) as
being a separate domain, that should would for most cases. The
question is, how difficult it would be to extend fw_devlink to support
this, so that when all consumers that has  "power-domains = <&k2g_pds
5>" has probed, the ->sync_state() get's invoked for the corresponding
genpd->dev.

If Saravanna want to comment on this, that would be nice, otherwise I
will chat with him offlist about this.

That said, it seems like this is working fine for the TI platforms,
which is great!

Kind regards
Uffe

