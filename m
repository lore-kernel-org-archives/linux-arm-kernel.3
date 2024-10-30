Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 343ADD6B6B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MnkN8ptr3KGmpx2Uv+pp+uUkuHBCH11BckHc8GqWeDg=; b=aqbZsdsvr4qQfB3kwrivf6lauh
	leP4/jYYup3/nGf4ADnvXs0uVjsQ8JHJtp4D8Gi3X8Df33t7KUu7hVrDs5j8HpcZUoiikqor3qBiz
	8Rnx4KumbFlRuFf5QyhznVulEPO7StgnW7TdVE8RkIlUWzL4sM/PwdNg0oE2t3jZ3/vdFTYpJ2aHS
	KOWLhSmuizgDj0G7wlgae1uykIZikag9aCyKktv3XqJzSqoZmN9XuQivNtxumSR3xewfl/JEAXr4A
	EHzOpmFU1lfYkg4iTVW6ifUa/+VqkW+XJVQ+yGmYadQjZxU8TwnF9tT/Oq1RYbUh0KoP8FQBRuL2a
	pmInyI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CWx-00000001HjG-1uI4;
	Wed, 30 Oct 2024 17:30:51 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CUb-00000001HTY-3hqu;
	Wed, 30 Oct 2024 17:28:27 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-71e983487a1so39132b3a.2;
        Wed, 30 Oct 2024 10:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730309304; x=1730914104; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnkN8ptr3KGmpx2Uv+pp+uUkuHBCH11BckHc8GqWeDg=;
        b=CYnYsjdEwm8vLAOwuiHYObpL/fN48iQAUnEJ/3p4CG2OT3NNcVMwPIeQDTYGiU1xRk
         6PBbVj51sRcXqRoSeM26R+iwaOqYgJATEQVFY0X0H6OJaOoGJoguhjA1+XFbIA41UxGT
         r+bAQJqUKfHTFc9Wf8hhgx27qc98LcyQGD6HJjHmR4BMD4VjIs/7DbVsMtOyT1zzo9wY
         05g1HkfTz+oAWdzEEYMqk5atv5pyea2S7hcoiULlcDJ5xo0WnnIRIib6hNHKmshMat5V
         mvrcMIntUXx8txLv26A8dI5WgTg6h0krMR0PYS+UHoHxH+70B5SSKDFB1xd1ZSPrvI25
         6zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730309304; x=1730914104;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnkN8ptr3KGmpx2Uv+pp+uUkuHBCH11BckHc8GqWeDg=;
        b=edjNnitZ2zXscrW3sfiFu/qGgZFecvqsrFo8jMk1EWQAOeFg1/CYDkrWh3kasRK4Zc
         dicPYeXV/sni8xUAUyfh2pldiygrM6PVyE9zpfOQ4NyGOTDI91tzWDQtBlCI53V/Cg4C
         YiZAbDpqRyUfJpS/7+Lxa1QKjesB+symNPi57Ffnyz7UYqPz4e2qFPk4EV/wneF08Yrv
         AjXbJfvVspYHAXapfZ04qCxOLjjU4xWd8lYYt1pMjmQVuanIMH/QIoTwZI1rBt3hTVsm
         E8f0trF0K9cMRDTe15EZcZ59Yv+p9SJlaGCHw5FvVpFWHnKNzWpwGV1h/Ini6sL7tMJd
         HX0A==
X-Forwarded-Encrypted: i=1; AJvYcCWUuVz2xDsoJNapdwaj2Ie4tHBNZJTeN9XgO/jkoNe5LjeQJtyZ0QcN8pTFmm7b7u1wk37l6gGhqxd4DgAeXLWB@lists.infradead.org, AJvYcCXTM9vbi1J1ZapaGeONy5X7tSBx8iCc4v14hVZuN/C/Cyh1jw7zDXn4SJkRMA+sD7h6szV+yNknPinA@lists.infradead.org
X-Gm-Message-State: AOJu0YwIWDkz7alNODQNL1d8lkXMvulPFKs7Y8aoCVEg2wypBT9/j/1j
	gD09unsX7PXfffhnkNXlETC8dB7c8RrOC5t5s/UUAAghod1ENb4EVWu2U5Rud9YDDiSFnnebgrx
	rnrBCDWzaPhwqM3tRyePLZxRVTkc=
X-Google-Smtp-Source: AGHT+IHW4Ei/MHebO474qYJ4FnNy3KOOcESKnX+HK1imXciZaQOAIYn479DmypH3MHAeRnnMNdgGnRLoV9bhVu1WXCI=
X-Received: by 2002:a05:6a00:3c96:b0:71d:f4ef:6b3a with SMTP id
 d2e1a72fcca58-720b9db22bfmr624360b3a.21.1730309303938; Wed, 30 Oct 2024
 10:28:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240203165307.7806-1-aford173@gmail.com> <20241025080544.136280-1-mailinglist1@johanneskirchmair.de>
 <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
In-Reply-To: <6d039ecf-0e48-415a-afd8-6bfce60081ae@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Oct 2024 12:28:12 -0500
Message-ID: <CAHCN7xKevGWipBSch6gKVeJRT9Zb8QTchhxg3c=96XhnAvnjZw@mail.gmail.com>
Subject: Re: imx8mp: HDMI display blank/black problems
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: mailinglist1@johanneskirchmair.de, johannes.kirchmair@skidata.com, 
	Laurent.pinchart@ideasonboard.com, airlied@gmail.com, 
	alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com, 
	catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	festevam@gmail.com, jernej.skrabec@gmail.com, jonas@kwiboo.se, 
	kernel@pengutronix.de, kishon@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	l.stach@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-imx@nxp.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	maarten.lankhorst@linux.intel.com, marex@denx.de, mripard@kernel.org, 
	neil.armstrong@linaro.org, p.zabel@pengutronix.de, rfoss@kernel.org, 
	robh+dt@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	tzimmermann@suse.de, ulf.hansson@linaro.org, victor.liu@nxp.com, 
	vkoul@kernel.org, will@kernel.org, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_102825_976230_67699404 
X-CRM114-Status: GOOD (  25.80  )
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

On Wed, Oct 30, 2024 at 4:01=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> Hi Johannes,
>
> On 25.10.24 10:05 AM, mailinglist1@johanneskirchmair.de wrote:
> > [Sie erhalten nicht h=C3=A4ufig E-Mails von mailinglist1@johanneskirchm=
air.de. Weitere Informationen, warum dies wichtig ist, finden Sie unter htt=
ps://aka.ms/LearnAboutSenderIdentification ]
> >
> > Hey,
> > We had some problems with the hdmi on the imx8mp and wanted to leave, w=
hat we found out about it, somewhere for others to find it.
> >
> > The problem was that our hdmi display sometimes stayed blank after hot =
plugging and sometimes at startup. On older kernel versions 6.6 we did not =
have the problem with the not mainlined hdmi patches.
> > We tracked the commit down that introduced the problem for us. It was t=
he following =E2=80=9Cdriver core: Enable fw_devlink=3Drpm by default=E2=80=
=9D  https://lore.kernel.org/lkml/20231113220948.80089-1-saravanak@google.c=
om/
> > So we switched back to FW_DEVLINK_FLAGS_ON via kernel parameter. Don=E2=
=80=99t really understand what the problem with RPM is.
> >
> > So, this information is just for reference. Maybe someone has an idea w=
hat is going on here. And how to fix the problem in a more proper way.
>
> Thanks for investigating and sharing your results!
>
> I'm seeing the same symptoms and previously found out that this is
> related to LCDIF underrun errors. See [1] for more information.
>
> Adam has also started this thread: [2].
>
> Anyway, knowing that this is related to fw_devlink=3Drpm is really
> helpful. I just tried with fw_devlink=3Don and wasn't able to see any
> issues anymore. So this confirms your findings.

I was off in the weeds thinking there was something wrong in timing
and/or a race condition around the PLL or something.  This is good
news.
Please forgive my ignorance, what does fw_devlink do?  Is there
something we can do in the driver itself to force its behavior?

adam
>
> I hope that some of the driver framework and runtime PM experts can help
> to find out what is actually wrong and how the correct fix might look lik=
e.
>
> I'm also CC-ing Saravana who authored the change from fw_devlink=3Don to
> fw_devlink=3Drpm to see if they have anything to add.
>
> Thanks
> Frieder
>
> [1]
> https://patchwork.kernel.org/project/linux-phy/cover/20240904233100.11461=
1-1-aford173@gmail.com/#26014057
> [2]
> https://lore.kernel.org/imx/8cfd3052-c85a-4235-b9b8-6d2929e9e455@kontron.=
de/T/

