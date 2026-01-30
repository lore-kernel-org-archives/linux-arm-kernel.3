Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3854D49C66
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=; b=sCWMfWRObpMR9c4vFlVP4CWuhJ
	/wZEZo+KYQs8yWr50VS1Z9Exf4EoDDD8U/vsyxJP4u0Q0yKbWz5BfSS0xx5bnqxHdjGbt0oGuhbsq
	1unVLRZzA3q+2kQLviEl+sbm+rApirjMem2apTAe3TjFt28MtXswFU9hRlaHyWUFzZK5ili4NHoRN
	xcnuVw76GzwyeeYutEzovYyEMwAlThps1BvLsPUmxWmqrFs+4bIP8pMJ6KxZ0O97XNC2rhw2IYsdM
	eMnTIzw17DvYAhNJKz87qf9JSBYhAdhi3ytRsoXm9+gAhbZnxoI87wU6agw0yWP5DOLwZ+hC1goxa
	MTGW+sCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljCc-00000001A0J-1G4Q;
	Fri, 30 Jan 2026 07:46:02 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljCZ-000000019ze-19ZR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:46:00 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso1790473a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:45:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759158; cv=none;
        d=google.com; s=arc-20240605;
        b=AjBEYVtQUjhhgg9/cj6BVsmJGCp0LwIKUIuuNQYeqKv/kQIHeLEqUa/VQLxb4Wf2MW
         xnD2Uqd+cDSEF+v/KUZ+2j5HZU/D1z4EhqxHR2oIhimyjFHBjhWjiuPTKsGrgCw07vWz
         tN0fUt3rqPFYttkEF8tVoM5BrD0sm55vOOuAbbZNYRfZVtWDx5U8LndKVTFloUkNPUfF
         85I17paGGy3rU/jzMBTjMP3I7EQqG1wzATMdIsBY6RGyIZ94OHKkdBVpXbBZVI0areI6
         zMrjJjAwK0kxvQDxyzg47mzi3vfIpi2pLVS0MJGgzfa3EAbjs1m3pXB895eQBc8gAL8S
         tGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        fh=bTWhR67G/7wJSKzCPdWyBX7JWY4A0A83zwIPIglvL5s=;
        b=G1X6PgxVs/aMEgvF7x90G3L+EDYnOYF4WInPaqIk3QagYcMGJ2vudSrrebBhZI5EIW
         eb8lYO1wDfkpHWCkCqepPdr1WrcXrPW+Psg3KYGC9XPTDT3I6Hx7g9EAat8VKB6o+LYV
         7TyGv/n72i/rYEgNxJLln6ezAB4LqnAT9gk7mIfDbD46ZtMmaZKojmI0TdirJUtktCwG
         TwUIN0LV036Ha1oK8U7Yd8WziOBoOldAps+uFLyZe0Ky08RvoalFkw2+A8QtCAcxXHb4
         E5dxFQjvB9oYIkMUFa62mzhe3L0OmEmYQkpUGGK/nt0NTkIZOImgUdBsk5jjB9z1UER3
         VLOw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769759158; x=1770363958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        b=MHUDO3DStA5E1GFQCEO+SB9EKwV0Z3e5HJ0+mLuyCRIYZb/Yi+pDUM+np0mal6kWqu
         w7IoSg6rERZgr5p/hBxQVaiZSQr6ehacq0zyi3LK8fZFC8VviIimk5Hb8LTpYMLQIxen
         yVTWVpYazbLkEOuHyccgBsyWC3tYGPwKbY8vmS3uj4DbOFE9qD4yt5Xp6mxlTiRUZBAw
         NSzgVeEKZq4tha4kOg8g+3d3fEQfTKcJ7nzBzE07lcnvKIxXKaYD+Po8BDAJ+0KSHA00
         H7fRgIT0vDs59ecpqYLF5prc/fgKIASlW0MWKO3aoZVXAcxbY9jdxLEkgXJ6UvzxliTh
         ULAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759158; x=1770363958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TAKPIgQHJLSAdcHdDw9QZcfJJfsr09DFKKKOpfOD4gw=;
        b=PVwCFeHM/4fUMgjY58uV6auIYEZhb53abTEyAOOPIIfvgFZU7XUUgxM5hpZ5FSCePi
         Mtl2CwTWmwm6tAM2tjbo58mlgBdKOeW2mP6Fz8GSBJ1LQlqS+t3xaESlvQSYsS4C68wa
         T4yAADBwcKW8u2PZUPCwlDhAhsSviM9O6HFKVlbyf4dpJqHggGVC0BpTFdYIrmtfxMP/
         L/49SGize7Y2GulnCk9TFOrfJlFUb86T5Q6jHGU1lWS/W6/wuZ/g5kUEbmppRI8F1MuW
         bohNY23Di4EIQt+SrjQFcU53OI2kobGFHyOI9JCq3WcJWdS0pKpH2yFi95+Bn8od7RcH
         4nxg==
X-Forwarded-Encrypted: i=1; AJvYcCWCTVjq4kEhm/Qp4FXL6Tj69tQ5XK7lksRCC2o994C1XxDdZd3jp7+rv+fRePMFk21D9Ef367rM6mDl3TKfXO1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzlEWHnl8t1V4533w1fy8p3m/Z78CkzGv0+gz68NxEWGUWodleI
	fbiIwsowGLkWus3A77g5lYD81is6ISifXbsYlTRU+eAZEsh+KBVsaa0vPU3kbvdDqSbczHo1T6V
	eJDmTk0346HEGHJKiQFxyOBr6qDjGro8=
X-Gm-Gg: AZuq6aLH0Qf0Jtu33ZHpr+WIGyAhbLKktQHQfXchHo2gENhXZ1ni+HD0Ao8n0HVxigS
	+m7ODGORo1lii7SfF7HcOOr98hkahhs7lnxbKgpQ9sFM8ykCafEeoSEXGJnIIZGbwW2lOSdMG+9
	0DRi46C9ykle3qojcheiztIjG33nMhMpgnHRrVaGs/sDAWUzU3U5TNdzPsRkOqa79MdTiSCl394
	TXYmYVh1ZWhLNYZLJbCCDHZSA/b/UC/pH7RrgDIDJPRDalFh9wHtGqfXEUgG0FtZlRFeIo=
X-Received: by 2002:a17:90a:c888:b0:34c:718c:5448 with SMTP id
 98e67ed59e1d1-354299f4a62mr4806616a91.4.1769759158099; Thu, 29 Jan 2026
 23:45:58 -0800 (PST)
MIME-Version: 1.0
References: <20260130055508.3462700-1-shengjiu.wang@nxp.com>
 <cec25a41-cc6a-4b03-833e-5c7da5727e85@nxp.com> <CAA+D8AMkipi_iX=vagZMHXTNtqUqyFeVkU1Vr_wb4R82F1OHDA@mail.gmail.com>
 <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
In-Reply-To: <5c559d32-c75d-469e-8652-86122cf436df@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 30 Jan 2026 15:45:45 +0800
X-Gm-Features: AZwV_QhX1h_sXu2udLuSrjmEyu3PiDv_14Kt3Gf0zaIQ_xpv8bfSI3HflORbIrk
Message-ID: <CAA+D8AMoEaY0WzU82L_JnwhHMeA4THZe0bgBSgsyuvhjP9Z3AQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: imx: imx8mp-hdmi-pai: enable pm runtime
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_234559_821964_8882DBEB 
X-CRM114-Status: GOOD (  15.01  )
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

On Fri, Jan 30, 2026 at 3:08=E2=80=AFPM Liu Ying <victor.liu@nxp.com> wrote=
:
>
>
>
> On Fri, Jan 30, 2026 at 03:06:19PM +0800, Shengjiu Wang wrote:
> > On Fri, Jan 30, 2026 at 2:49=E2=80=AFPM Liu Ying <victor.liu@nxp.com> w=
rote:
> >>
> >> Hi Shengjiu,
> >>
> >> On Fri, Jan 30, 2026 at 01:55:08PM +0800, Shengjiu Wang wrote:
> >>> There is an audio channel shift issue with multi channel case, first =
run
> >>> the channel order is correct, but second run the channel order is shi=
fted.
>
> [...]
>
> >> Can the channel order shift issue be fully fixed instead of implementi=
ng
> >> a "recovery method"?  I presume that this patch implements a recovery
> >> mechanism.  If it can't, any chip ERRATA?
> >
> > Yes, it can be fully fixed by this patch. I will remove the "recovery" =
for
> > confusion.
>
> Then, you need to add a Fixes tag.

yes.

best regards
Shengjiu Wang

>
> --
> Regards,
> Liu Ying

