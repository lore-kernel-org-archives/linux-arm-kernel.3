Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3795CCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=74tRC2VlzLxPkuO20P1RbEt4g142PM6DdcNwZMtwWfs=; b=tdjySfXxOK0fks
	fdVPAJ/FJVuwc88KDV65xjiKFSi7tPDXtoEtmX0ux3fOarJ1uznQ4zhDf8epmoUc7ovfusEC6iVEX
	NhuBklMoXu0IWrbZkTS6pYaDAQZobqWKjIc9l06NycmBvk/JrLuVdAhsLfWgI0+ieVDEy7swTtqsB
	e2JmRF6yqWL/ququ+44JNfmjJuYnLYQ6bnmUkrk8gX8+X4TgDrWcPvk5x1t3mfSfRY4WtUdcHeSfc
	6TXwleHBWYqFM64nAxbe5BpexXVMyyfXRJwh/h3z1bLFIFGhEwcVkiV3t+QJsymWoxYodgXSxZ8/6
	DMkanD8wtUgzi4wRnDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzaS-000000083oB-1Zo2;
	Fri, 12 Sep 2025 08:56:56 +0000
Received: from mail-lf1-f41.google.com ([209.85.167.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzaP-000000083lu-34Bl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 08:56:55 +0000
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5608b619cd8so2025220e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 01:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667409; x=1758272209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=74tRC2VlzLxPkuO20P1RbEt4g142PM6DdcNwZMtwWfs=;
        b=nqvGZF+a4vDmj+R9lRxmu/Dh4/tPmVdgG6KnA7KBYxCy5Irwl0bo7FpG9cH5MdSn2T
         HF1ssejsu/Pj/P6NOr9BGtAlijqipjcOlS/xys/TbktATfDgk2gnfkWqkYS0UcXSzved
         XdIBtoJ/vQ/W4VnOKv3Ed7Zg3WdlCbkU8Pfg1bBA6NpRQH6YBhL3T2lRRUBsdY40iR4Y
         UORWrUXQLjARyThXDQ3t0InekNNs/HGj96tKWvgCySQRkJrs6JcCTXwiedoP8aiwqU3U
         +BVxW1lc7OsMvQQ7rz/e93vTvyn+Be8D8bGHhl0NjzmiGWzSBFSy0dCtPRefKgj8DH1Q
         zOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSVgXiCtiwsZ01pOVm2AULkf6fORaAKCCvldUElCerQa8NV7YWh43fhvO7mUzfXfQkZl3+wLbNYL47umCyrOnI@lists.infradead.org
X-Gm-Message-State: AOJu0YxJzx2hm/PJJrv3nmWzc4ojjJrJl/3VIV30tNuJ2hySmkpFdJeW
	sgQxDJxKMNi6zL2Ng/XowSvi/ODC1s+HQtNOQKBLqCRVsshN+ssmHW2zgAxhiJpa
X-Gm-Gg: ASbGncsTHPHZLfY6Dh2/B1pWuEMfjdg6TT4pW58seMEFkruRKjVDR7m8LdSowjFnaDv
	Dk61qrA1qAtDkj7oAgaYPMGgXr/pUhT1+IovMOcY2CYKny1tbwwb4xvqc6yx2Ug4cj79c2awMLR
	R7SXRjyIMEFgt5tgdU/LSG16w+UdA2NdPb6kYbiCkKrGHJkstgOGpKGkzRhAvoVoCmY5EAZESOi
	FtRhfAaMVgPUH59FMzg7kY3qUFaUXeZ8+n4jAKBqUoQ777upiQqz+7VY+08WFi1w+OhG5IXa+DX
	5XP1Yh9cqEXyBOnDIBlXq3mpmTIfPTkXCeY61KihJVsmrFCvN8VudlNSEq0dHyoNlv/qSd2KY2I
	KTWk1xM4NbkzOus0a5bOtvbtI5DP63ftvR5aBxYS7kYDWYYEI0Qppb1g=
X-Google-Smtp-Source: AGHT+IEWlAUUGSFZqAm/6olcZKC1190o9RwIJ9L37rlgR66izBJOqoqtXAHGCJ+9x2kGyCaLIAGi9w==
X-Received: by 2002:a05:6512:3b29:b0:571:eaf:aa64 with SMTP id 2adb3069b0e04-5710eafab74mr394948e87.20.1757667409042;
        Fri, 12 Sep 2025 01:56:49 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com. [209.85.208.170])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5c3b6121sm1030082e87.18.2025.09.12.01.56.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 01:56:48 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-337f6cdaf2cso12147331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 01:56:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1jOUzMgc8YDXcJffWVYD6xKUa+CVkzvqI0gKDgEJ3X8xcGAI7qL3WH0lHWzG9P5OA6gEznm1sqG3MUSx/ah2g@lists.infradead.org
X-Received: by 2002:a05:651c:1118:10b0:338:d42:2a73 with SMTP id
 38308e7fff4ca-351409b51d3mr4673771fa.45.1757667408335; Fri, 12 Sep 2025
 01:56:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net> <20250912-x96q-v1-2-8471daaf39db@posteo.net>
 <aMPftsaf4x61-bGY@probook>
In-Reply-To: <aMPftsaf4x61-bGY@probook>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 12 Sep 2025 16:56:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
X-Gm-Features: Ac12FXw60L74DnVtPN3yLU-Dvc0n827phLti7Hql_EebywNU_R9Et1E7UON_xe0
Message-ID: <CAGb2v66khAeP5pCq6RCrPUwQr=tDqJ6O6cs0gokbMNjpTejuvw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
To: =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_015653_775774_4E96D142 
X-CRM114-Status: GOOD (  12.21  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 12, 2025 at 4:54=E2=80=AFPM J. Neusch=C3=A4fer <j.ne@posteo.net=
> wrote:
>
> On Fri, Sep 12, 2025 at 01:52:10AM +0200, J. Neusch=C3=A4fer via B4 Relay=
 wrote:
> > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> >
> > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB RAM=
,
> > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/video
> > output, and infrared input.
> >
> >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> [...]
> > +&gpu {
> > +     mali-supply =3D <&reg_dcdcc>;
> > +     status =3D "okay";
> > +};
>
> Note for v2: The GPU gets stuck in probe deferral, and I forgot to
> investigate why.

You are probably missing the GPU power domain driver?

ChenYu

