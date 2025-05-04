Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F4C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 May 2025 21:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=; b=zlBSrt0B1MQ17T2HIQadPvUGJA
	6Lfy0HQ0ERzNe13CAkyXpBSGHWFaUCKzn5rsgCGIRVFHKq5bP6jp+v4B7iTUscbt24zha9SuXbKxl
	Oq7WRtfhcnULtKdHL4maNvQGvx9DnuJkk4L6Y+aQaPwWSEfjZvp40T0FdynzpuFhJpUC2/VNCzZSU
	k0FmlkpZX3dbo8Y38VNXvUwpgiH3vNMetYP4QL4VEGMK4Nv4sadkIz7TFnQ54VjamgDMw1Miye5BA
	B6w4ZtVtNgVTpTV4CH7C37EiP+cqA3G7mSE2wmFltMzxdK8S9g7Owlp//P0TuKevCoONHuHOcnkPa
	z9dNi2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgZX-00000005xYf-3yWS;
	Sun, 04 May 2025 21:08:27 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBgXR-00000005xIC-3ke3;
	Sun, 04 May 2025 21:06:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22435603572so45044485ad.1;
        Sun, 04 May 2025 14:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746392777; x=1746997577; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=MRyf4oTfLeLY4FN3RbCwx6QO4uBFvgziwS3LG0xqSH5+R6sJ6t+rQtrs05rMOskhFu
         KBOCE40Gq162vXS1BxsUvYh78na5+SDGWt+L6Dqsi3VER07iCTvWo5Ajm/R9bDFrVhQ7
         p3vcQKCpCT05Ov4VjnL7Kkb5toKvU9UHCJszV5MK2FbSckT+yxaafrfaT/cs/sQd+DnD
         3tne7RqbTXGkY1Jd60s3e1oOnJshW7h7NQfc5bmsEf+EB3vr94FCeEEmg/J4xQgnEYVa
         RiCSiJtka1JzwMtZ+8fxSCkiCvyg3esW3haKgJ2NNMOzs9nmxm3EcFixYLRWG20Mbzo7
         PkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746392777; x=1746997577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d7XMv7LIvPb7tqhoDTx4OKcxFQ5Z8THhrxnqY7emq7k=;
        b=MlK74oAUtEY3r9vwdOYU25B/2z6smbGmjOwTjGNgvgtu3T8H5zKp7jJlqDjuQHpzwf
         FM3KGZSLtyH1F35t1gpE+9zv2ln8OwsQ1E2q1viP/toMljQczIlDq8zVCnKkIxgv/BPQ
         h9UT8ulkcjNqFQHJHqw7LCM48dGe3A3FUNw363QffT2hZ640LXIyPWGlygJWM4VQGTeX
         PRhbeeOXN2llP7tN0Wbifd8w+h9Qd+AF5eG7LRCujsICi/UmITNvI6BxNfwWMhR77wGQ
         s96iJK1Gk1zdTjMnUYOmfWYDc2oXCJxCCM6+nM62jAzk8iQtCzHi/XsIyJ8NTlX+lgcl
         J6hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6nGd1N0BtcfNXVZXHnfOlPhrTuAqlc3O947P3ZrwMOVpjmDAyPD5eHQKPUPG8touql3cOoaBFPZWyJ8Kw@lists.infradead.org, AJvYcCXipTN2AGI79GUtiyJKu2neoVE22gG/SMNgOVbqbDOeV/wjZXkFMAbTNlZr1YzFTFnC6NzKmhmcjhR3KMwn/0VhFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk1GBUDug4O3Jw/bBoAn6t071OtdSLcsSpbtDTvs+ksSyILjc5
	Q0PuU7rm8sEvqxjFbHG+79B/6qhYek3WuZbAmvZLc5TQC2f829CoeIUMGb727ZdoxcX4ry+zhBE
	r4ibFazpX1ZaHsfM4bM1qenzsM/o=
X-Gm-Gg: ASbGnctOj6qoFi4DGeIBUJtR1uYBDq9ezVwZqrUHfDk8osXEp3VKW+WG5yBIyrLaQK0
	BW9+GNPcsD43h8H3+KkaeLfTjoff+gvY7fEeYYzV+oNlkN3nfj1Wh+m1yNeI7r8FUeu4Qk0Uygt
	a9xXvRwDcq7p2HsMGiqKF3SYlX2oqNq8ZCOVsOd6ADR7szXrGaRPAMAKE=
X-Google-Smtp-Source: AGHT+IH+MEVsPdqEqxaolEpzZxyQFPKcfV4Aif9uF/lMz5vcLwENh3usDnJAXYsU/xVN5tXD/rnnCYtU/paPqSYdvtk=
X-Received: by 2002:a17:903:1b6b:b0:221:7e36:b13e with SMTP id
 d9443c01a7336-22e1e8e702dmr87722535ad.12.1746392776924; Sun, 04 May 2025
 14:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250429190724.330883-1-richard120310@gmail.com> <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
In-Reply-To: <d5a8e781-6936-4c83-83d1-92daa2da8ca2@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 4 May 2025 23:06:06 +0200
X-Gm-Features: ATxdqUEZVaon0qrNN_2-3htZD6nCAzznTNUIlmtX8rkJYKBTJ9BhwXmOhJS40AA
Message-ID: <CAFBinCCL6OQrbQ_UY_nhnbodN2TquuKPk9unhp3YjpR5u=EXag@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: Cast mode->clock to unsigned long long
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: I Hsin Cheng <richard120310@gmail.com>, neil.armstrong@linaro.org, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, khilman@baylibre.com, 
	jbrunet@baylibre.com, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_140617_933964_5F706FE5 
X-CRM114-Status: GOOD (  14.32  )
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

On Tue, Apr 29, 2025 at 11:00=E2=80=AFPM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> Le 29/04/2025 =C3=A0 21:07, I Hsin Cheng a =C3=A9crit :
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Cast the type of "mode->clock" to "unsigned long long=
"
> > when utilizing it to avoid potential integer overflow issue.
> >
> > Link: https://scan5.scan.coverity.com/#/project-view/10074/10063?select=
edIssue=3D1646759
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/d=
rm/meson/meson_encoder_hdmi.c
> > index 7752d8ac85f0..fe3d3ff7c432 100644
> > --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
> > @@ -75,7 +75,7 @@ static void meson_encoder_hdmi_set_vclk(struct meson_=
encoder_hdmi *encoder_hdmi,
> >       unsigned long long venc_freq;
> >       unsigned long long hdmi_freq;
> >
> > -     vclk_freq =3D mode->clock * 1000;
> > +     vclk_freq =3D (unsigned long long) mode->clock * 1000;
>
> Hi,
>
> maybe, using 1000ULL instead would do the same, but would be less verbose=
?
Agreed, that would make the code more similar to drm_hdmi_compute_mode_cloc=
k().
The goal is to switch to drm_hdmi_compute_mode_clock() mid-term anyways.

