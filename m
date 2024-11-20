Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63697D711DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 18:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hAEQOpv3e/6njl4g9eVBdiJIB3uT53su0BHZMcI8lQ=; b=4uzidspyQfqIrwLuCDw9hMiA0J
	kie9aYn1qukrvGodt46aQaXvxzmV4iigy86Wx7iZulmEGmRU4StFvBD77sL3KtenDqoY+mrjv7x2K
	Mton//0/Vw8ce3VockPuVzCdr+QRj4ZPW+zFhet48p0hBeywIuIS42wbzanRLW0QdTW4raM0pPCYF
	O++kwfiDEqZFMQOKz+8b5I2e2F8A6jU/0yMDNW5JXvZhSE1bITlW5j4bDCQVRRFiqXJ9Nl/aeEJ07
	liXYTqoXnqw4nbfg8ymH95kSC+8ke5qHP4b6r5iD/xkEYe5SOlRu+dwXQQN+6AsNBhkvtAOBmaBeP
	a5EQpc1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDpfx-0000000G3Ws-0ldz;
	Wed, 20 Nov 2024 18:43:41 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDpf0-0000000G3Oy-3oT0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 18:42:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2fb5111747cso983621fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 10:42:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732128161; x=1732732961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hAEQOpv3e/6njl4g9eVBdiJIB3uT53su0BHZMcI8lQ=;
        b=SdVfaTI18kFWCq78n65CSEDBR3GpwyIOQeuViKoH+fbm93IvIqvtammN0bVjLmVmwz
         Asi2ozevy0jja6Cs4acxVMHQxDdO7IL0K6OqSRkkcAPqsYeVYHmYTcM7Y0rzvcHia2W5
         KMY40S+RR+C4uegLQcl59I2kARrXcho1JLb1pxVqKQtwyExBt/JlGjQ/QKk8mtQsItoN
         DxcBmqssm7UqxicxWdUyv/0J+SsbVQLtDesdZTMf8vzX6UQxf4nE/4Gq13tvCbs2Mdem
         ej+RlQKpfJNasVMehn9fMMWJQAxRFmgnYHdp9QI4ajCCmTe6KAtGxkiYI5NOcVekAr6L
         v7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732128161; x=1732732961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hAEQOpv3e/6njl4g9eVBdiJIB3uT53su0BHZMcI8lQ=;
        b=D1KLaJ386GSMUQKkvbHiN4j0KI0vUQLCyuevGcyjqihV9ABkuoHrzcHXsLseJLSsKi
         8VvcShQlE9jKRiu0Slq8OFhaiImcHQq/g/MKtTH4M0HcOsLfkimgrbpcJv20uYIvawJF
         Ku5l6vvGpf7c+NNIDWI6njXmlZZQJNrdVK1wenmC2/YfOJKffcISHph5GRTaSq1Ns6eq
         bN1P5ML/Geu6skfNO24fGcLnHJWVZ1IxtnD31RTkgpBF4FgY8lJba3MFfAmmurGlm+rZ
         DHQMGMnb+Cp/rteZISnlH8IjZmFeZlZlE5hNmqL0IR/VUsmwKk2cv5QnRD1wfKgQXuRw
         hT2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVvxwdPqjQBim38PTZ/5vxU7RJ4cbK/MqU/YV0A37hXcBUtVIgb/eF31uKCi6+75L9r73+qPd7hlxWefw5OHg8/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Rsvt11neRLnGDZ7gcGx8yumgdXC4DwJP2yOFvOAt0rNQyZvZ
	pK3bPzNSQCHeZ8nhFvIFmVWFFnSrNyCW68gBWvLsxUWPOG36XRebRmLAvfCeCF+P1JrAi6x3iiz
	J7FETO3T+IezRb7gpOtrfwBxRTH4=
X-Google-Smtp-Source: AGHT+IH2X5VB9h2nw+Jkh45tRBGbRsS9MWdWWWZz+fC+WzN6aKJtr4NXlo5S3vdL2/SbBK/c1If30/9tu1+PUurCivc=
X-Received: by 2002:a05:651c:154c:b0:2fb:6027:7c0a with SMTP id
 38308e7fff4ca-2ff8db66029mr29570051fa.8.1732128159060; Wed, 20 Nov 2024
 10:42:39 -0800 (PST)
MIME-Version: 1.0
References: <CAOMZO5CvorhgM0r0WssdPxu2Q+=QuaLh2m26sekn5TadUip=RQ@mail.gmail.com>
In-Reply-To: <CAOMZO5CvorhgM0r0WssdPxu2Q+=QuaLh2m26sekn5TadUip=RQ@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 20 Nov 2024 15:42:27 -0300
Message-ID: <CAOMZO5D=CGJsf0JZz606Bpsvu7mhi4h4XsE173feRfT25mLfhw@mail.gmail.com>
Subject: Re: imx93-evk: Failure to run flexcan loopback
To: Bough Chen <haibo.chen@nxp.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, Li Jun <jun.li@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, linux-can@vger.kernel.org, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Mathieu Othacehe <m.othacehe@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_104242_945797_2A2D196C 
X-CRM114-Status: GOOD (  12.60  )
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

On Wed, Nov 20, 2024 at 9:23=E2=80=AFAM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi,
>
> I am running kernel 6.12 on the imx93-11x11-evk board.
>
> I have backported the imx93-11x11-evk flexcan support:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?h=3Dnext-20241120&id=3Ded73790b6ba7e44b6ca7129dbe564c50a20d9f45
>
> I am trying to run a loopback test:
>
> ~# ip link set can0 up type can bitrate 125000 loopback on
> ~# candump can0 &
> ~# interface =3D can0, family =3D 29, type =3D 3, proto =3D 1
> [   73.313897] can: controller area network core
> [   73.318472] NET: Registered PF_CAN protocol family
> [   73.338241] can: raw protocol
>
> ~# cansend can0 5A1#11.2233.44556677.88
> interface =3D can0, family =3D 29, type =3D 3, proto =3D 1
> ~# <0x001> [1] 05
> <0x001> [1] 05
>
> but I do not see the eight bytes appearing in the loopback.

It was a canutils versus can-utils syntax problem.

It is working well now.

Sorry for the noise.

