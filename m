Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5D41099B54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Mar 2026 06:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=; b=N6zD2uyQ9erSfOwCaE1AzKgHBi
	rAQ0t9yUEFvuaVWEBop2QfYjjC5BkMUKpKrqFv/sr5NKyuwZeXjFvQda3COH6nqqMaVoQsJf+wNYS
	MgKcavc6ADtBvReeCQCX2PNEneyI3NYX6sODUBpA5pzOfgkMcGqwR3PCXFswdc+AqS4s+quN4OZkT
	8Gd8fjbpZtFzUA5Lw3oBjMzvdeLeIO5CDNLA+/KKmvAU9/Ys8hfenUkRbEsccyVFeIVuPKhM99SPx
	la8MvfD8gmh2iM15P1rRlgxOgTJYYwu1xFMi0cnR3Ls/hgthJ6dVOj0hOfdqw6qia6AZOPxyFso8O
	8M4gPrNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE6-0000000EAhU-2m3r;
	Sat, 21 Mar 2026 06:54:26 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3qE1-0000000EAf4-0B8G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Mar 2026 06:54:23 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b9382e59c0eso185714566b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 23:54:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774076057; cv=none;
        d=google.com; s=arc-20240605;
        b=izesBnyGUv03lIkBvhOGF/1xILy34MRDa9JLGtXWFgI6mZ+Bl3nzCOVRrSHKZx7WhB
         E8vEhlCCY2op27MB1MwbVzC/Y41k8HhjwReeZzlp/P52yWecQyu8cg2mLT51xpBDMR+9
         S+GEw28UOjs3ML6Ts3bp7f+HYgBPDnBHuRZTuU42ltgauYqKyxfwFWh1Lp/xtjbLhUwb
         We8uZkSPX8wuabhqxT+msdsQDl2jbpCgmQqr5yeznxxJqxCQApf7gOzWIHM3Hibu6L3N
         S2MJBk9wYVNbxGiPFmWps5JG95e+tw0SLG8HZkWre+IsUvwMQz+SJSPwA7S6sYBmlPzr
         qjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        fh=iuJ95+Ox71aoFiMR8I+pNORb2YnFEwO5Q3GLW/Oi/rE=;
        b=YQqM+NfsonxproNPsCwF+vWxCOJsYe9aLJ44hGl61TVYIM8iyZzmkY0nLQPfani6r4
         pKe52SpXyEGWOK/+ITMyx5bEoGLP5G5KJL1ETRlDZfbL/aVSCZWSuuUrRcaMevEaGk3p
         cqR/W5j+3Z/DiszueF2exSE9wNo6j5lGJ+3q+UtB4JtriAuOHqs6n+LZl4jkyU9TYmH7
         jg5Gw0hXn8wk11odOynUfCm/0tG2uGIUPZHCCH4KU5U5en5TcIdAzgeIwh0k4qWkLie+
         pbQ8KgwLjxYSRQQZRyWt2ORf4XfFx6BplSiEX3zdPPW6RA3Q77ppUlsm7gpZzu8GX3G6
         Ydxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774076057; x=1774680857; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=Ub1t7LsZKnCXgK9tMZgEg4n+GJFs1xyUO6TbGeOyjSQeHg6HVY1xBSo2NzMD50dayV
         jm2SupIMS0ZzOnl/c9hb6YujmraRKvSig+oXbtTYJ4v29f+/p6Fb0Vi9Wz8XS01ucGAF
         HogOHTgGS6cl1vuu0hrnCAlvnwAKOsWPaFlbGr8HKWMgIzZUIwtL8yIUvddVDBr8dY7G
         7G5TSyF7XDb3X20WWvGhv8EAP8HNzr/NnNv+qFIsP3D4AdR5hgjsYuHKBDdzerMSRqee
         27kW2ZaCMLRj83HCDQv9FPc2/oRva70CRRM4m8QPKVhGFB2NGDs/2DmwEyzxcv8Jg69+
         ElUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774076057; x=1774680857;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Tbl+o0FBCsTBj4CkROI9ysmcgdS1EFqniJjzP33wZX4=;
        b=ZlQjsvi+z5mj1w3YBJI+htmXZ1thhPR+jrRVvAuji+Jm8q25bcZBuWZ4+V3PZ2FTSk
         amAiuJpbyhPJ2zsx93crx62KM/g/k1SiOTGDJzGM9BFtbfMQCF8wXnOcMkHA0uUW8NAj
         ghqnSd/HkjO9b7CxdV4BlQCRO5L8Zw0Zbfsk/Ki5a2eyGn2urYNLcFO9LpBTB52Cr0zG
         uDg9DKHEu9ltBVJDXE29SXI7+9Ayv2ygB/ELh2OJR2uIy+P5+9TnzitOpNeBj+MS/Apx
         0Xe8BCY2ULiKNO3VffZ24odxwiV0Ags2TDoX702VYWAVE2Zv0h4GNrlhK9Ht69QkbNnL
         34tA==
X-Forwarded-Encrypted: i=1; AJvYcCWNWPFNKw0KygBE8EFseC8nHzrUlxXOrQiyLgNDLqW7lHy7Z0SMiyOOzktf7a/8fP3TaYN5jekVyZM4oDXE19Q8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw49L/LIZ5T8UBiEAhST3zbwrPWw/2qA3n61lZWgcs902PIXf/t
	snjjHM4gfsa4Rjjcewtg6yQlw4DgaIsrB/jqajpulThnl+QqSrAbZbYowxw+xLj482AdaqIkGLx
	j5bKRb2Qyo3OaDFUWD2g6vEThIQ2+4qM=
X-Gm-Gg: ATEYQzzldhrKdXqpZjKgwgk4zJBnqt1CP35NmT67NvkmoH6OIjPAS5xhOlceF43/NCQ
	Ngz9Sze8eG5UxvwR75L2uRv8LgSNzGXXF0t3kmISvTaDz2pvk0HK9rZ4U3QoU3+ofD5eJhvQcQB
	NbMrizVVr6rzpDixQEbG367Grumv5Cei8rvNS3AR2uGXp2EzE1fPg7urcczpeaYv73l/U1/6Fgy
	oKI4uzBcH7XMjUJMBymWjTg6ljxPpOoWInCpF8gKErmRW9I1jJEtbXya1Td7GNRmh3XJP9yNcSe
	3RLxZfx9O5fQ9anD
X-Received: by 2002:a17:907:d109:b0:b96:f6f1:e7af with SMTP id
 a640c23a62f3a-b982f1ed7bdmr419710366b.9.1774076056402; Fri, 20 Mar 2026
 23:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260304100557.126488-1-linux.amoon@gmail.com> <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
In-Reply-To: <9db109a657e18d1e5ead67d7db06cfaf68f7fa84.camel@ndufresne.ca>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sat, 21 Mar 2026 12:24:01 +0530
X-Gm-Features: AaiRm522SeNM1abZw4YAK4uXkmRkLpmLZXI60fMElcfZGsZpbYfOo6oOjvIO9yA
Message-ID: <CANAwSgQ0N3wmJF2s_fuQN8GWvoYrrgg09X2cMnGFiyM+5U641Q@mail.gmail.com>
Subject: Re: [PATCH v1] media: meson: vdec: Fix memory leak in error path of vdec_open
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Jourdan <mjourdan@baylibre.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>, 
	"open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_235421_134667_F2D7D3F9 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Nicolas,

Thanks for your review comments.

On Fri, 20 Mar 2026 at 02:05, Nicolas Dufresne <nicolas@ndufresne.ca> wrote=
:
>
> Hi,
>
> Le mercredi 04 mars 2026 =C3=A0 15:35 +0530, Anand Moon a =C3=A9crit :
> > If vdec_init_ctrls(sess) fails, or any subsequent initialization step
> > during vdec_open fails, the control handler allocated for the session
> > is not released. This causes a memory leak of the v4l2_ctrl_handler
> > and its associated control objects.
> >
> > Add a call to v4l2_ctrl_handler_free() in the err_m2m_release error
> > path to ensure resources are properly reclaimed.
> >
> > unreferenced object 0xffff0000205d6878 (size 8):
> >   comm "v4l_id", pid 5289, jiffies 4294938580
> >   hex dump (first 8 bytes):
> >     40 d2 49 18 00 00 ff ff                          @.I.....
> >   backtrace (crc d3204599):
> >     kmemleak_alloc+0xc8/0xf0
> >     __kvmalloc_node_noprof+0x60c/0x850
> >     v4l2_ctrl_handler_init_class+0x1b4/0x2e8 [videodev]
> >     vdec_open+0x1f4/0x788 [meson_vdec]
> >     v4l2_open+0x144/0x460 [videodev]
> >     chrdev_open+0x1ac/0x500
> >     do_dentry_open+0x3f0/0xfe8
> >     vfs_open+0x68/0x320
> >     do_open+0x2d8/0x9a8
> >     path_openat+0x1d0/0x4f0
> >     do_filp_open+0x190/0x380
> >     do_sys_openat2+0xf8/0x1b0
> >     __arm64_sys_openat+0x13c/0x1e8
> >     invoke_syscall+0xdc/0x268
> >     el0_svc_common.constprop.0+0x178/0x258
> >     do_el0_svc+0x4c/0x70
> >
> > Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > ---
> >  drivers/staging/media/meson/vdec/vdec.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/=
media/meson/vdec/vdec.c
> > index 4b77ec1af5a7..a5ab0c2390f5 100644
> > --- a/drivers/staging/media/meson/vdec/vdec.c
> > +++ b/drivers/staging/media/meson/vdec/vdec.c
> > @@ -914,6 +914,7 @@ static int vdec_open(struct file *file)
> >       return 0;
> >
> >  err_m2m_release:
>
> This goto is used twice. The second time is when vdec_init_ctrls() fails,=
 and in
> that case the v4l2_m2m_ctx is leaded. Can you add the missing label and c=
all
> v4l2_m2m_ctx_release() accordingly. This way we don't have to revisit aga=
in.
>
Ok, understood, I will update this in the next version.

Thanks
-Anand

