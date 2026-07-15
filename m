Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71F7C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 19:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pc5zej8Cp2CJIzssMoKWrKfQALA6yoxrIoO3Y71lFVo=; b=iQWlWl1p3Z3cI17QE8e/Ip9fta
	oNbzh5HnrVy1M847PvmA8nTVqhy8bPHHhmEiG8bDddozknW/eElvzpazDCLm1A5uCCUMj03ppo8ve
	V1hM9uTe9pAUi8m9utSKHMNgSYaT/iThsq51aAt5ED/z18I3CU9Zqu++6xTlNZjSd2x4iRyNXvHwd
	PbtFfC3BYNJwiLm6BFwVQHwJ40KBG4LcACmJ958aVPz+z2pY5SK7c2FUNO4OWTiwZNr2Zm/3Uvqh/
	pQvnTIIO+U71gWVPxARjLEkv5y+W5vBE4ScRmTPQ+ubx1xaLFR2urjvFo1REiW7u5zJyYm01DcNSK
	e6om2RnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4su-0000000Fkdg-0dEd;
	Wed, 15 Jul 2026 19:03:08 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4sr-0000000Fkd2-39Km
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 19:03:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so5087527e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784142181; x=1784746981; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pc5zej8Cp2CJIzssMoKWrKfQALA6yoxrIoO3Y71lFVo=;
        b=bOT7FbWfpx5FgwGhg7IOXe73H2HQrKhNwk+dtDttDPQRdziCzBxoG7s2QCYr8QkY2I
         nCD2SVI30QsPmj1PjQrw4mV7DYhpia3gnN9o6TstRjKzEhiqAl20f6A1KNnPD8ElFYQE
         Lzpzw1MWU8GacItA1YiaGu9ErT+DFJfhYVVw2co2x1HsUonZHQKy/ZFzK54uu7XS6oci
         Bhe12OaVBPUwocSmSeak/SucK9qJg27kOU40KEK2dvND8JJfJtYU4Uyxlo6iAS4brhrg
         k4l5lBvHJfVkmm2PIp+LD8s7KSTu9He9O6aFow+obG0O1wDXHg5jx1WGJ9p0YNgdb6ea
         xGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784142181; x=1784746981;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Pc5zej8Cp2CJIzssMoKWrKfQALA6yoxrIoO3Y71lFVo=;
        b=l2i3rZ8lO0yOEAGetq/H6t1Ux8eMRt/ErVJ/jFVjf7sH+lRA0cfSsV1sk+6ndpEuNk
         4ip2tXT0dG+wyC/8iP7OJfXEIZCvijG4K3948RfChjjRUeZp2Ajbxj9m8jcaZ6LQBoiF
         aohf/iylFwgmjUcwnzk82uKrOslsuQwUEz0/vgd91VgjvObs+myHrv4PobBu6aIbJ+oh
         SbVYqeqHP4UoNSYo0mc2g32iExJKYz7LAwCD6Orium648kXfs1g66RdIWy9w8GpCgASQ
         kr3WSQoup88wZG5wKHc1jy9e+S/50oO0FIYTjaRS/Kk4BuQ/3Bqg6FkygMTyhY2Vb5o2
         3vMg==
X-Forwarded-Encrypted: i=1; AHgh+RrNV7YTayaQ8rATUoyeyGEW4Ratj3pLz68dHcSBySUYjdF84DmyMIPR/3FWMERdgVghBVulFr8z52afd/eU4joS@lists.infradead.org
X-Gm-Message-State: AOJu0YwNvJ2C9DLy67XmRYYyHShH5b/g3c0+wCuceZIboroec1F/Mg2B
	8KkbL+xLUZySjXZ6VP3wLHAI4cM9vHJ+QSe1ipvNH7+Dk5Xd7F0H6zFI
X-Gm-Gg: AfdE7ckg1di3tO0kDiVCJ8eg0iQvd8s7LrSEOhyOFRMR/t+PqupD7LjAwPTTXaVdMp0
	nJaojwIPMmlV7xDo63gX21WhiwOvLFFyEslwIBwdtI3St+gIfm0uUjqF3+Pohfwuf9abviH3jfg
	aoOqtN0srrFsIn4jBmvqHaAnO0zwVBYuWRXtr4Ff/IgKxYm2ieEvPv0pmQr7fQrCliPCQhguF43
	c2dfbY2ZrjBDva807jIkViCQa3NZ0ISE5tH+hmieYEL/sGFb5WiBl19f0Ak28cx3iv/7Yx9WxBT
	H3z5Tx4GUMMW48yGxAMz4idXzdwx+ohUDtgBPqXpQMOgiuWPhWywAPsDw8S2h7IIjyhTfpSPp6b
	gKeZeLSPGlWjE5enA4pov3O8etpozH48nAL4p4ctcrZMdRUf/1PlCSEc4OyuurZ1hE+C1T9dSlC
	l/elfrOxBuqw2/3HIgZwkmbO0kGEnidNGxzxs+xNj4Knf+nnnOkg==
X-Received: by 2002:a05:6512:3d1c:b0:5b0:1760:facb with SMTP id 2adb3069b0e04-5b15d779c02mr1056769e87.21.1784142180582;
        Wed, 15 Jul 2026 12:03:00 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b023b5931bsm3701194e87.42.2026.07.15.12.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 12:02:59 -0700 (PDT)
Date: Wed, 15 Jul 2026 21:02:56 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Peter Rosin <peda@lysator.liu.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/7] i2c: mux: add idle_state property to i2c_mux_core
Message-ID: <alfZYOKCjf6CKN6i@gmail.com>
References: <20260713-i2c-mux-v11-0-72bb8af8ee8c@gmail.com>
 <20260713-i2c-mux-v11-2-72bb8af8ee8c@gmail.com>
 <e2d4fdf8-4dae-43dc-95ae-b9aa1884fdf5@lysator.liu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <e2d4fdf8-4dae-43dc-95ae-b9aa1884fdf5@lysator.liu.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_120305_826137_B51C3B8E 
X-CRM114-Status: GOOD (  29.92  )
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

Hi Peter,

On Tue, Jul 14, 2026 at 01:29:01PM +0200, Peter Rosin wrote:
> Hi Marcus,
>=20
> Sorry for the very late feedback.
>=20
> On 2026-07-13 09:19, Marcus Folkesson wrote:
> > Muxes treat their channels differently when idle.
> > Let the mux core have this information to make it available for
> > internal use.
> > Reuse the same state values used by CONFIG_MULTIPLEXER.
> >=20
> > Possible idle states are:
> > - MUX_IDLE_AS_IS: Leave channels as is when idle
> > - MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
> > - <n>: Enable channel n when idle
> >=20
> > Default value is set to MUX_IDLE_AS_IS.
> >=20
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >   drivers/i2c/i2c-mux.c   |  1 +
> >   include/linux/i2c-mux.h | 26 ++++++++++++++++++++++++++
> >   2 files changed, 27 insertions(+)
> >=20
> > diff --git a/drivers/i2c/i2c-mux.c b/drivers/i2c/i2c-mux.c
> > index 681a201c239b..edf16683dc83 100644
> > --- a/drivers/i2c/i2c-mux.c
> > +++ b/drivers/i2c/i2c-mux.c
> > @@ -247,6 +247,7 @@ struct i2c_mux_core *i2c_mux_alloc(struct i2c_adapt=
er *parent,
> >   	muxc->select =3D select;
> >   	muxc->deselect =3D deselect;
> >   	muxc->max_adapters =3D max_adapters;
> > +	muxc->idle_state =3D MUX_IDLE_AS_IS;
>=20
> This is insufficient. AS_IS is simply not an adequate default.
>=20
> For i2c-mux-gpmux, there is currently no way to dig out what
> the idle state is, as it is not exposed by the mux subsystem. For
> i2c-mux-gpio, the idle state depends on both the idle-state /and/
> the i2c-mux-idle-disconnect props. For i2c-mux-pca954x the idle
> state can be adjusted at runtime. Etc.
>=20
> In short, idle state handling is a bit diverse, and I think this
> adds to that mess.
>=20
> I think it will be a bit of work to come up with a scheme for the
> I2C mux core to accurately keep track of what the idle state is.
> One way to deal with that is to introduce a new "unknown" value
> that can be the default for all drivers that has not yet figured
> out how to feed the correct idle state to the core.
>=20
> And that hints at why I think reusing the mux.h bindings #include
> is bad. The mux subsystem simply has no need for an unknown state,
> and adding that to mux.h is therefore out of place.

I see.

I think I will introduce a few defines in i2c-mux.c then;


#define I2C_MUX_IDLE_UNKNOWN	(-1)
#define I2C_MUX_IDLE_AS_IS      (-2)
#define I2C_MUX_IDLE_DISCONNECT (-3)

[...]

struct i2c_mux_core {

    [...]

	/*
	 * The mux state to use when not active.
	 * Possible idle states are:
	 *  - I2C_MUX_IDLE_UNKNOWN: Unknown idle state
	 *  - I2C_MUX_IDLE_AS_IS: Leave channels as is when idle
	 *  - I2C_MUX_IDLE_DISCONNECT: Disconnect channel (set HiZ when idle)
	 *  - <n>: Enable channel n (starting from 0) when idle"
	 *
	 * Default value is set to I2C_MUX_IDLE_UNKNOWN.
	 */
	int idle_state;

    [...]
};


Would that be a better approach?

Thanks,
Marcus Folkesson



