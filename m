Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18857D3B9A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 15:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=; b=cH+pwVjrgkGbMxV+PAYb95x/Cm
	KO8cQWOXMk8rqRcLwfqx3f4ffbxpEK0rpWKDq/pUFQNNHL1HnVtCjO8Sn7hBbYOBMdkTBzjNhKXoi
	TOJg87Z73ueGkKLuhzQ2RajY9dsPKI0Oe24ETkG6UA3f5uIuETl+eo0D/O3ldoMnW0kL6UULL4Qrw
	KDAYtWNeSkmkwdq14igYUT+fq6/+BWLnBHVKAulm0yMCoZbse5PallNuEZLbaN2IJg7EWTR7kWuJh
	rtvsR5gJ4JbSmvkayEYrVrqGyAnKyVKgqyA/rPc/kZq59fjbyNtOF3NqjPm8+toy4i3wHvztgEL/j
	gVkV8YCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxWw-0000000B0Xm-2zI1;
	Tue, 26 Nov 2024 15:31:10 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFxVy-0000000B0Qs-2716
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 15:30:11 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-724f1004c79so2517160b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732635009; x=1733239809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=;
        b=DWvrSD5uncbFT8tRP6GwzbcPRthK51R8AwNLZvtwBScgaVY7qfgm00qwUIoWMXEmbK
         9KQkLsBtyMpzcFwnVRa7oVB5tXPZ3J9xKKE6fKyhB0PsylY8GrRHC6SfgfEXD3k2LieK
         aoayPF7PCDD4aA3vm9rOaKL7EzaHPIDQ28ZgRbjBLreMHIUPgjU0slOymZZGKm+L7MtH
         ggvYZlp7odYOi553WwhngheRLCb1dltYf/el7THMD/uk4cxAq6Vm2C5oqgVLMSP1TZjX
         5BXD5jcCUuDaECr4vfjXVF1ax7UNDxsfZ+8xTtgzmRlnj148k+RXqwP5ukzHGBxURKqE
         DoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732635009; x=1733239809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lCN6+M4YRWXxu55EQBJT4kfjQmI6NsK2j4LNx9CC/U=;
        b=BnQbklP3TQQsVQ7IbVu1Q1ogYFcVjqzd7hRhbxKoFTEf4tCXM99WOmVhG/Q3cvjubj
         MIZ2n3fSw0fbhon08g6DsKEtrXEe4/MsLmTqPVdEdcbjhjhspszYFqPQ7fpiIAzI0yaz
         BudNoIJEdQfDDCRKM0yQwtlnRBxQZfaZEUCp0Z3Bev1ezRiOShX6CCCvw4MqdZ1u9kgt
         G27XYlklrkM/VLl938aebs6iWaTEC1m2LRl8vTAs85a3i8wXyvzfuxmAyqfm44xylv4g
         WK7GrKYpGVx9VODiZGEOWa9BGRPnFL94HhAlPD4+rSHbaqhdkhfs9nTwUzPRcySrzq0C
         lcXw==
X-Forwarded-Encrypted: i=1; AJvYcCUD4/2b9ysvyHd6TjRLqTRhHTN357tNIJw4K4yr5pVVRhakt0ensxIMiQNzpEJ90b3zsddHVm2zWJWG0JW0d06l@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi2OCcRtVteU5r3oOmGFzWXDyZa1qTCer6fC1/5SgMZW/xwUEu
	fDDT+EgAGNGQrefZL6svlX2iM6hI3aJXCRD0f6MEaDNr7d4p1Q5HLXfwoHetlwixREHPoj5awOW
	+KZPvuNv8cbGJhC6brJeuPq3zkUI=
X-Gm-Gg: ASbGncvtgp2k1z+mUaQIjcdUD22rRvzr3Kqz7ZCPfEXULZtr73wkoMF2AP/k4uWSBno
	I8EpRJ7KYaokzrUzVsvA5HlGLPEk=
X-Google-Smtp-Source: AGHT+IE+SmZiC8p1bNoQl+mNZuGid7/lVlvbrYFavOShe+NZ2CQZoGtsNSljGtzXmRs6oybFN33p4fu0cBJQOnn1jEM=
X-Received: by 2002:a05:6a00:92a2:b0:71e:f14:869c with SMTP id
 d2e1a72fcca58-724df5d4b2fmr22690572b3a.6.1732635009446; Tue, 26 Nov 2024
 07:30:09 -0800 (PST)
MIME-Version: 1.0
References: <20241125152427.136883-1-daniel.baluta@nxp.com>
 <20241125152427.136883-5-daniel.baluta@nxp.com> <Z0SvF2tQR14jrHet@lizhi-Precision-Tower-5810>
In-Reply-To: <Z0SvF2tQR14jrHet@lizhi-Precision-Tower-5810>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 26 Nov 2024 17:31:21 +0200
Message-ID: <CAEnQRZAVmza+A5QC1Xq4dsw1WBtdp0EoM505+UzrCKe15+vqhA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: imx8mp: Add syscon compatible
To: Frank Li <Frank.li@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, aisheng.dong@nxp.com, 
	laurentiu.mihalcea@nxp.com, shengjiu.wang@nxp.com, iuliana.prodan@nxp.com, 
	a.fatoum@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_073010_544916_62ED08E8 
X-CRM114-Status: GOOD (  15.17  )
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

On Mon, Nov 25, 2024 at 7:08=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Nov 25, 2024 at 05:24:24PM +0200, Daniel Baluta wrote:
> > imx8mp audiomix contains a set of registers used to control
> > the DSP.
> >
> > The dsp will use this to acquire o reference to audiomix registers
> > and handle the registers to control the dsp.
>
> Look like this is NOT good method to direct operate these register. If it
> is reset, you should export it as reset interface. If it is clock, you
> should export it as clock interface.


Hi Frank,

The code to handle this is already upstream and used for:

Remoteproc

https://elixir.bootlin.com/linux/v6.12/source/drivers/remoteproc/imx_dsp_rp=
roc.c#L991

and Sound Open Firmware

https://elixir.bootlin.com/linux/v6.12/source/sound/soc/sof/imx/imx8m.c#L23=
7

I'm not sure if it worths the effort to refactor this for such a
simple operation.

