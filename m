Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BACCA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 10:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c4ZOsSgcttRMvxWFSgVRWx9LXQHTbGG8yJSj2/0idLs=; b=mYZKh+vlgLI+Q3MK/FM+NTjQT5
	WoHCSExXJ42E6pPkRvHeXdNLofLRTUb18YU+qeRBN7oWFuCexqIYB4w2wMkEIvTV8d6F3YAcr4HfD
	lbKlLPgkdMbgdOzUYs7jnv7wYDj4wbzJGCNx4ayo7snWM4m1AXp1cOOqP95hSjku95LN+T6d7jB62
	GQabaLJZ1TYfqDOdlzksqYPoe+j3P6kbgNEqNyXjILyAcS6w7tovC/d1PYZlWGN7SDcAjLECGRJmr
	K1DbAp/LH4rZ3u3B7oDaBYHYETb8748VlQNE6mw/x1J4e66jVSS2pUWHTEo7iwe075RUz1bIrrlRG
	vPnnMKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwebL-00000002OgT-33Qd;
	Thu, 11 Sep 2025 10:32:27 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwebI-00000002OeU-2Ayv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 10:32:25 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e96fbf400c0so683139276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 03:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757586743; x=1758191543; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c4ZOsSgcttRMvxWFSgVRWx9LXQHTbGG8yJSj2/0idLs=;
        b=tHzRzTT8puRsnOhFHH83Li+8s9jcKYMBsLyerh+38C/wXMQXAFno/33em9YcgjI+9w
         Y8i27So2wRcnqaJppF7lJzVKNBTqq5vKHtZYJtVuFgQdH6vSmc9WXS1WVvMa/0nfRvQz
         n+FdkT6eNFF7/f0OI4SI6qGlK33MZnwBHDmZ9YuesKwWF+JAPKWW2r48IOjv2dBKmaRG
         7eDuIXguesRYqZf9EhEJ4dM+mS2xNpVOV5eX4sS6FwfNFv8eTWjYLshlNcxuAeWuuiwg
         7l1ielJD+6oXfwjEmmM7Js2K3moGvJuW/DGlm0m4ZvpJ+sjJOl7vgq7ATEcavUUxOHIV
         Ik9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757586743; x=1758191543;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4ZOsSgcttRMvxWFSgVRWx9LXQHTbGG8yJSj2/0idLs=;
        b=VlXEjWcJNGGuU2oI5/Srz4lCZZ1lvBMS5ZAADxrQ8RRlD5y0gqxyfWcLyrqPcTxlVD
         Qu92mJddgd2lCd98qJ+ayKnU36NuLIb6yswAfUyB+WyGDMMPgkjXTQP+K3XLy3HFhzJb
         FuvsTg29FyzJmO7wKjJyhIStIJYSOPagoV0KqkUrVl16iXCRmlweb2awBun3PDl5iIOC
         Cb1TZlSQeOM2z7wbm3pRieHUWoRG0BvFxNu8e5BX/VuYfWGX5xZpdIR6/33hPQOKvfx0
         LLfjMolfuIOhI7RkyFsigCXziwKWMbcGIvajRsxiZtAXJuVw04XEw1RlqlMVVvga7wRg
         219w==
X-Forwarded-Encrypted: i=1; AJvYcCW1bMZBPEo3a6WFBWHvBuM9UXeNYIcqE2Cpx/c90vNkvHQkh+md832ivE0DpPyJ4WN9n/2gJTgOrK15lUv1FUYV@lists.infradead.org
X-Gm-Message-State: AOJu0YwQmQh6vT/NN3sUMOYEsr5lJOx4YfQGLakveJtg8d2d+vzY184x
	Fky7rTPOzAyw4OubC103WbyUfGyH2c8WvARb7mAAg1a/xNaLDz5mhqrX070y7k2fv+ljLHS8d6/
	oJJilEkhh35RnEeFzP06XydMzwsmM2qq6L5iMg+ntCQ==
X-Gm-Gg: ASbGncsFVs0tNKRBjm0L9TKQHvDjES0B5YVGudVtvShcRwuDtdsSJ7aBWqzIV4F7sP1
	Ll/2Q7uxewxoWdoWim7/wKfrqMQi0kOxJXbNIa5t/F5iSGZKZKJ+yB96yeujjU/pPzvHLwIAMh+
	QOiUPpW7+uUcJXREIed3lO/E1MgRYf0xs8l71m6n1i2bm0Z7pD/AS3k47EEXqTJn9oOf8ZvUIdZ
	tCjJg6fuygzgSh11CY=
X-Google-Smtp-Source: AGHT+IF6/FMvfkM2t/XH6c5AXnqivQugM2HMLBN1/u9XexbnBojnOfBcCiOm0kb7ITvQxJ9JRgM1J9hGYF+YRqPfZm4=
X-Received: by 2002:a25:ab45:0:b0:e97:398:43a with SMTP id 3f1490d57ef6-ea3ca7088f6mr1978662276.19.1757586743140;
 Thu, 11 Sep 2025 03:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250909111130.132976-1-ulf.hansson@linaro.org>
 <20250909111130.132976-4-ulf.hansson@linaro.org> <CAMuHMdWB05sQpv0nKgU2NNn4=KAmNCpHhAnz3s15Gopu8FKVkQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWB05sQpv0nKgU2NNn4=KAmNCpHhAnz3s15Gopu8FKVkQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 11 Sep 2025 12:31:47 +0200
X-Gm-Features: Ac12FXx4q_7O4EKT7jwetBM883Ai-tYxqwF2ULDV_qJob3VYY3KUktShD0zBpHM
Message-ID: <CAPDyKFrZ4hA0O3PRUJwwetQYsgAt50tPo_hL90epUx1T8kFDEQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] pmdomain: renesas: rcar-sysc: Don't keep unused PM
 domains powered-on
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
X-CRM114-CacheID: sfid-20250911_033224_564765_3FC84B70 
X-CRM114-Status: GOOD (  24.65  )
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

On Thu, 11 Sept 2025 at 11:02, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Ulf,
>
> On Tue, 9 Sept 2025 at 13:11, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > The recent changes to genpd makes a genpd OF provider that is powered-on at
> > initialization to stay powered-on, until the ->sync_state() callback is
> > invoked for it.
> >
> > This may not happen at all, if we wait for a consumer device to be probed,
> > leading to wasting energy. There are ways to enforce the ->sync_state()
> > callback to be invoked, through sysfs or via the probe-defer-timeout, but
> > none of them in its current form are a good fit for rcar-sysc PM domains.
> >
> > Let's therefore opt-out from this behaviour of genpd for now, by using the
> > GENPD_FLAG_NO_STAY_ON.
> >
> > Link: https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> > Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> > --- a/drivers/pmdomain/renesas/rcar-sysc.c
> > +++ b/drivers/pmdomain/renesas/rcar-sysc.c
> > @@ -241,6 +241,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
> >                 }
> >         }
> >
> > +       genpd->flags |= GENPD_FLAG_NO_STAY_ON;
>
> So this applies to all PM Domains.  While this doesn't hurt, perhaps it
> should not be set for always-on domains, and thus moved up, to become
> an "else" branch in the "if/else if/..."-logic handling always-on
> domains at the top of the function?
>
> This applies to rar-gen4-sysc.c, too.

You have a point, but currently this doesn't really matter. Genpd will
not power-off always-on-domains no matter whether
GENPD_FLAG_NO_STAY_ON is set or not.

The whole purpose from my side was to restore the behaviour we had
before, for the Reneas PM domains. I tend to think that it's better to
apply the $subject patch as is - and leave improvements to be made on
top.

Thanks a lot for testing and reviewing!

[...]

Kind regards
Uffe

