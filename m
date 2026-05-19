Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1199ACD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8YjP9Npno4O4XTZSmojz9CpByYqxe69fUnIsHVXY3g=; b=BYEY7T4GtXuW66
	irvVARu18DTcBLPBjyzmGPVq8wk9f8Sz8YZ7LzAwimXaIlGQObf5XldDv8hiqaVkV5lUL7b3WBO5m
	GFdKn41EqGj21imEcLs8UIkml7lvhnED9CSCwgoj6aEaN8zBmWqkduGIUSc+CRYKqmBCHALH2iCAh
	WZ2gHIt+GsS2fMYqdrtuGplhoMjYNlg9iEmyllyAmLwRkML3Nkkom+HWVI882evT3WBHk6KxtW4k8
	O5ZXZbj7sQs0rfma1FTH0CpbduVYflzkrp7GYk05UtKvSsc6CpBiHWc4zJYkIi4xmyfLvRxqstv6j
	CZAcmG5UuUrjGGrf+Wcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLtW-00000001uqd-312Z;
	Tue, 19 May 2026 14:58:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLtT-00000001upt-47UN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAA30443E9
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 14:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B004FC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779202682;
	bh=v8YjP9Npno4O4XTZSmojz9CpByYqxe69fUnIsHVXY3g=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=umrZTPQB5Hn5SzscWM6sns7PJzTVHLIadzM9TOv/VGS1aN0lLn7hicuyKFk8ymv3D
	 VmSHhQfH3Tq2WVhFwYOopA9R6tV2RuoyKATBTGfyzvKTwH9vI8jmMxrXcVg1lcq4EY
	 kEl8PtsuW0WnyTYo9Lqau1Lq/aQFrELXE19QyyBgQ3kjTvStuCdTNK0japzEaOBvWH
	 JD5yphtMM+tdwj3+05ZdTH3jwT54Fr6jsCUQk14OexOkFgihpDXYXzzsxfPHVwBfOt
	 +2RvxKFhHcqRU1mw+62rY3Wd60cSpviwugeSFWaKqBHiJtBLnXaRwCUXx896utmckd
	 KCic15yCA4amg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-394413a63d3so31614871fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:58:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Jp1goiEFSf/EVRVGzsWxP+FS6OJU09qNGBOqx4s8s7JMAMPyTekyV7tvOW6nMEwynL5exJLf/tF60qqI9cQdg@lists.infradead.org
X-Gm-Message-State: AOJu0YxyMHodX4Sscvu5i1vcCndU6O+baNenE2T35HvVQO4G+/X2ZUzr
	ejwtBCdtUmE8sh+Lb46Em1j17gwrmGAlpJGzune7uhdTe7Dr3exlKxarZgOYoGoffwGBMxbDSma
	8Z8zqwnrJv0ADfAsUbt+R+cBSlYxB28g=
X-Received: by 2002:a2e:bc20:0:b0:393:a2ec:da34 with SMTP id
 38308e7fff4ca-39561c36355mr65078351fa.10.1779202680929; Tue, 19 May 2026
 07:58:00 -0700 (PDT)
MIME-Version: 1.0
References: <20260519144712.1418302-1-javierm@redhat.com> <20260519144712.1418302-7-javierm@redhat.com>
In-Reply-To: <20260519144712.1418302-7-javierm@redhat.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 19 May 2026 22:57:47 +0800
X-Gmail-Original-Message-ID: <CAGb2v64354S65SxU40Lp9K2ous=OQO2QujD0L4d9iF4=reaMXg@mail.gmail.com>
X-Gm-Features: AVHnY4Kflsk35TrUBM5-9zDiyDqHDodSOzLTF9r2I5qXft0UA_EkYXejxu4fC40
Message-ID: <CAGb2v64354S65SxU40Lp9K2ous=OQO2QujD0L4d9iF4=reaMXg@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm/sun4i: hdmi: Use the common TMDS char rate constant
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Samuel Holland <samuel@sholland.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_075804_041647_23723581 
X-CRM114-Status: UNSURE (   9.78  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, May 19, 2026 at 10:47=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
>
> Replace the 165000000 magic number with the shared constant defined
> in the <drm/display/drm_hdmi_helper.h> header.
>
> The old comment referenced "HDMI <=3D 1.2" but 165 MHz is actually
> the maximum TMDS character rate defined by the HDMI 1.0 spec.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

