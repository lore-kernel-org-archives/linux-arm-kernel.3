Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50878CA9ECE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 22:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=; b=rNxR8qPfw6R+N/oldrN3HDwmD5
	CAu7PQi6Yal6iYa76m73crusNInoCAHPkMgTM7h3OBxdq9J55scJBL47eruR3ZiwuT/ute0AuNEMY
	MPpFma7ULC5vPebIxc8vS5CDcmsPlKMleWHb/VlVG0a7j8Mp4R58bQmnfrd1qTQT70dsvrfrMgnI7
	UgEv3a8oUe1u+b+286O74o2k3ZT+/wkFLK1x/HmO+suIuY0Znz275PwX19SvkkAX1jI8rvCGLGEN+
	B8dD3ngwNEhoCYi0oR+DEMgRpTkXgnSYkmZZJ6wkTvRzcMNoPjmx4kzKuAXpH3CYzUxij84gh4bRs
	pGcH94Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfo7-00000008Vga-0Pz7;
	Sat, 10 Oct 2026 22:44:47 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFfo3-00000008Vfn-3rhI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 22:44:45 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-6767d92cde6so599537d50.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 15:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791672282; cv=none;
        d=google.com; s=arc-20260327;
        b=d65iJ2F3G0Dafdtf+jvDivVrLV2w76IUj4L+02iAeystao3QMSdrjtE81irMwJnvGN
         wJKHt5xM5NPhEFlDZP43D+Fb+dBlwHM7yYMl+F0ADszL4P4HqrrtMs/AGtJwtA8vAUwi
         BH+8/6OAxf7KfwSBzQq8LuRCatFnwBYfPtTO3gHkRU1uNiKXxo940INe4nj2I180x4hL
         Gq1FuSqY+HWAK9H9/HzQOrFSXoe2/z5rWNxNI9TDwo3zFYIYB5hO+bVKKj1OH8v2YtbK
         8bkDx7J8EBOcNaPeRNdYORun2qUCrpNI6CfYACVbz1VoSoavnSZDhW7h1zRK1xR7aYYd
         pfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        fh=XOdkBGnYKNsxGb3dGL8eUJNtn+gFvJuxz0hYHBDxG3Y=;
        b=lb9Xgy3nkzgd3t6aMYLrGKfq4r4AUcJEsrvFj/HtUw1JL7Pr5WSHOE1XsG/gijtrJh
         kuHFan1oBXo4GukczxflIX6n7O1xvofAzDy4J758zCMMhl88LCO84rkMUm+tcSWNYCJA
         6tn3fkP8CqCmLDxvDWz4gPlZS/Zsp3+gGyd+tVL7HiuH86xia9c1W1NfcGt/yw/zYwA9
         GbtvOOvK7ItkpoIfTxfojxy/OzBLvm/YmG98d4npUSc1ILJ11H/3r1+Nty/7pYEyp6BZ
         i7xZxXZMwydllr8hX9VhuqRVuQe3g+kDOeUrSeJ5Wr9yScmmvVPPSfLgyGESUH8ifGfK
         +WyQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1791672282; x=1792277082; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=YVJRvZ3sK1QBhYPRgc5y8nhAe4ehznY/h2Se+BF3rVHlhPk+FRrrkJfl3p2J+x2Eq4
         qjuHQ+b/bTIedQKk+m7enZDVM+BV1XCCHcgHQqNok8Eib/QEtmFmuy191I/juYEOST6l
         4jvTRN08vTROD6WtPBS6w0s4aI3gtEN289pDzkwa31Y7q3r8Dw4eG8hTDIkoYpzATYyx
         nSW9EIR26fCNKXCK7R333vNgflJy0GXHQA827ovTVDFJa/XMFWeBTpmKEWXFNekaH4nJ
         Z3WWw3Z5tbM01rFOeih7Fxf6sivQnsOPzv/a0NUGCRhRM8lYTfJoBFTYwKkBtjzMnY/k
         9g2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791672282; x=1792277082;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbb/AEzxbWb1wH79cWu6esvVp0pjm+0ygNJUrbpwYnI=;
        b=KrIIx2CI0eDiStKx+TV/lFDWE4fQiqoWkcDAUv3+brVMfGLGe3hdSWVN+96fjGFNtz
         W6O4UNagwexIBQpubbffiK5KMc78Jl8PM0eOmvRQaIm1WBcMP5wLgp1dt8t+FRqjAgNc
         AItsmMxum34LA1gaAlvBmOw/oDYGcxkQm7zQw+9I4ovuyhLefnVkqKhrsRT1rcWlGIQV
         DKUaTaivjWcNIC+az5nvP51cV56+sRVUwDt2j5gtiWKViqpw7gcqXtJQ5eYhFhI0VC2+
         tBk2XG1anEfK/2YG/lRhOJVlCp1Irh2opWftJlYV9HIIGKfcCBJkpK5YTrK+Lpb73CPt
         yWRQ==
X-Forwarded-Encrypted: i=1; AKwUvByss4bifaMV8YhCxAPeohjBloel4ldAxH9AX/xcXfgWy7f4NlGzqQkZJPrv+XO1xyd9/qPyqSaXU7BRhYlpp0JP@lists.infradead.org
X-Gm-Message-State: AFq9FYLdijGuYVhyYGz3CqNG8SjLnDbVvyREBLuDqB1sqbPKegRKWWL9
	3hNaZ8mTIiYK0ajp8+sCPGRfyVoTlHHxFyIBBw9sFQSnHNGO6JyzBHTxI8n2mCV5mZE4g9CsKc5
	VZzEr27GQgyBBCuocUiZ3mnKhcdGl/fE=
X-Gm-Gg: AYBFou3Wtm7O6BSBdZG7CFbbwuWgAU9M5YSr/YaQnqcLHZJ9bBihO0WxjDT+ZfKqD/q
	7kxYVaTdwLZxx4tyVNer15rosBFuDHl3w9lyrAdsLb+y9665rfdy+Zj43OB8btWDZ4n6gm/Ai4U
	9X7iEU811Tj7HYiMse/moxj1xboJTxW+33+RfBn9SK3+yfLd+TZlt+ltihXNiUvwSn3TCUoJS8y
	NyRn7a7brwU11+S/qlFOCV68dP7nXTQzsFM/t6OSoSKl41nPJojQYfodgkzBpLVsneDsCuh+oDH
	oPiZztWQMLpyLDb1mYEZskJxCt39Osxm650cJHyXgcrUuzZ9gUJbVHeubpEhKaE+tv+zdui8cQH
	lHW6cdvwQwOU7
X-Received: by 2002:a05:690e:4144:b0:676:8c58:c607 with SMTP id
 956f58d0204a3-6793606970emr2386943d50.27.1791672281835; Sat, 10 Oct 2026
 15:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com> <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-2-1835d4966da3@radxa.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 11 Oct 2026 00:44:31 +0200
X-Gm-Features: AclHuK9SzxfYbidbXHkCFy5EESOculWVRi3ikF-IkFS2nFcOSocjCQZtavNl1aY
Message-ID: <CAFBinCDtwrEpLY7W-VKn=ekCPbwAeq63nDX9y-nuV_TviHFJAA@mail.gmail.com>
Subject: Re: [PATCH v2 02/20] drm/connector: Drop early state allocation for
 max bpc registration
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, dragon@radxa.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_154443_991217_2431FFEA 
X-CRM114-Status: GOOD (  11.11  )
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

On Fri, Oct 9, 2026 at 5:17=E2=80=AFAM Xilin Wu <sophon@radxa.com> wrote:
>
> The max bpc property can now be attached before connector state exists,
> and the atomic state helper restores its default when creating state.
> Remove the early state allocation that was only needed to satisfy the
> old property attachment requirement in the HDMI connector helper, Meson
> and DW HDMI.
>
> Update the HDMI connector tests to check bit-depth defaults after the
> normal mode configuration reset, and check that property registration
> itself no longer allocates state.
>
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

