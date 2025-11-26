Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CB6D111A6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 21:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR4A76Dv8qf/+6WmZVEh6koqxlO2WxAmz56oNgGMFDY=; b=elt1ZsVwDuQTRDYfEGAG2DJu5l
	iqrL12THxAuPwfOKdrXw2nOOl+nOjBqr0tyTML08oCgxJNOIh3XSyg3fAn00mL2ilYHO1ZkaSbf8D
	cLWFTv4GRVBUUmNooTlrHs9pTbPkB3oY2FUC0rdTeAiV3VHesas7815ntGQ41qp8zs6m0wGK+i/Ct
	x2WcUnqyMSjYz2/vCwCcqtnunY7H20gfxlggqJC1ocUr79ip8Z+VJ2l942MtKacZoefwk5qhLAB26
	q0NQjuPkg0e4k7yRkSIEGnSWyg5vWggxRM68cOgbv136OMlM0KRfWMkESrQXVzK/aiF3y8s0xCRQu
	54HX5+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONKy-0000000FgNQ-2yO4;
	Wed, 26 Nov 2025 21:46:08 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONKv-0000000FgMj-36Zn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 21:46:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b71397df721so43981966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 13:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764193564; x=1764798364; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DR4A76Dv8qf/+6WmZVEh6koqxlO2WxAmz56oNgGMFDY=;
        b=JYv4an4IJCn5S5seu2aU7KA/rRW0bezivj5Xp1mLkajqUhz4TxIc0mwYbCuqpIFWJa
         gJkPNgyWIwwzu8bg8I5JTEDrvj2tclCWgl/CWoB0VuOVe08y1e+6/jGUN5r8J/VzAN+E
         Dhf10vCC6OiF+FjNk02HScBMt2CZF4W8gvKuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764193564; x=1764798364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DR4A76Dv8qf/+6WmZVEh6koqxlO2WxAmz56oNgGMFDY=;
        b=hK7R4tcCa5iRjTkP09xqgOr+rpxEY1yZRb5pPY7UhGgVjVLMjK8qLaFzQIJe/NWtnG
         S+XSE/6T2EIGHGDh0VO1KZtVejURXEDoeg6/TC71DTIaK9PoibNEylsSPpO22mxiVqmF
         82HDfOzd5U/tVW6VSt2GVzKJYDC/hoVHkAmYcTh9Djv4Ezdwp91XkRmIIXHEADhBwmsQ
         XT17iDTThWmsqk8CNk1Btn1gxdtVr4mHdvBSYatZzVF1BSSxjroYLiTuRacR6sqXVx95
         JyWPycq0hIS8m/Uidqvke04oVDvJL1QcQgg2v33fyjhMdDIoyVcHCUGAexWH/Hs0cd05
         6gbg==
X-Forwarded-Encrypted: i=1; AJvYcCVmqjbrGWG1U0WIpwl4dJQiZQnF3VmvY7DgRo4IliuJTFoYXhiDGZjyy+txbs9/98woxfBqrSVjR6geZakgEy1B@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw+7RfJsCAo7BhXhSg1979GOJRtWR2WpbVP4Yhp7FgK/hb++Mf
	JOnAu40t3j66O+jyuhBmTBmVbuRHMIq8NipjGCklS0WfVxJlFi+oVnqDNbHOjhaq68ZZ7N1yZSG
	5xBZUemlumQ==
X-Gm-Gg: ASbGncs/M0pk7Dpxhd9nOcBuy3TJenu+Q27dCCfkX1MUq7z4jy5j+o0wo9Ba699UPqM
	WGIW5L4sWCNQoDjfR/ek6TXYgvJBmMIhCR8NtcS0NiVK2+765Aa6aCR1aHoKSAms/c+mBrxO9fL
	S89M/+pjXMpy5zKJ/xdYGQE2j8p8v/hRFDg16/9K2GkiPZ9uywPHRkzDGd9SB41/yvEQAMR8GeP
	YCil79K54WbnXdUpD1jNcYBJ8m0NXMuNOYoyHEZayyOjk8jVBOKxDPnbuGRN2Gt3abTE4K9xVaE
	FSqjLokWVCWBOXhw1er+t/KAuoGQ2swCv0ggKYoMuNLU/VLYrtKjb/lcEQstS9/QlBoO7FcPItn
	6HhrA4r49X+0OQsZpFRcb9QiV//QJhKv3LhQ9712U3QpOrbP99IORivFiyfTLbzDNAvOH1ogShr
	g1M/ThNzDtErlNeZcJSyWFTIQcSp9AUNegLoPwrWTf4jk+nHBK4QijVEPnzEv/
X-Google-Smtp-Source: AGHT+IE+s1VTp3mMyMI3xKlrnjctESZOa1h9jEb3A35+2iU0AAlV02dfB37dexg6dtTlN+9aR2FhfQ==
X-Received: by 2002:a17:907:9706:b0:b72:7cc6:a143 with SMTP id a640c23a62f3a-b76c555cbfcmr910739666b.40.1764193563621;
        Wed, 26 Nov 2025 13:46:03 -0800 (PST)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654d50328sm2011507666b.20.2025.11.26.13.46.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 13:46:02 -0800 (PST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-64312565c10so445435a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 13:46:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXkfH+71yy03wI8i5v9npCLnUSuw9SSLz6/x76yAJ8QSsivhhVZe6qY2daFZ1dGsQ9jnhHPLlbe1FxKCvqG722F@lists.infradead.org
X-Received: by 2002:a05:6402:13cb:b0:640:c454:e8 with SMTP id
 4fb4d7f45d1cf-645eb2b7f7emr8102794a12.30.1764193562184; Wed, 26 Nov 2025
 13:46:02 -0800 (PST)
MIME-Version: 1.0
References: <20251113005529.2494066-1-jon@nutanix.com> <CACGkMEtQZ3M-sERT2P8WV=82BuXCbBHeJX+zgxx+9X7OUTqi4g@mail.gmail.com>
 <E1226897-C6D1-439C-AB3B-012F8C4A72DF@nutanix.com> <CACGkMEuPK4=Tf3x-k0ZHY1rqL=2rg60-qdON8UJmQZTqpUryTQ@mail.gmail.com>
 <A0AFD371-1FA3-48F7-A259-6503A6F052E5@nutanix.com> <CACGkMEvD16y2rt+cXupZ-aEcPZ=nvU7+xYSYBkUj7tH=ER3f-A@mail.gmail.com>
 <121ABD73-9400-4657-997C-6AEA578864C5@nutanix.com> <CACGkMEtk7veKToaJO9rwo7UeJkN+reaoG9_XcPG-dKAho1dV+A@mail.gmail.com>
 <61102cff-bb35-4fe4-af61-9fc31e3c65e0@app.fastmail.com> <02B0FDF1-41D4-4A7D-A57E-089D2B69CEF2@nutanix.com>
 <32530984-cbaa-49e8-9c1e-34f04271538d@app.fastmail.com> <0D4EA459-C3E5-4557-97EB-17ABB4F817E5@nutanix.com>
In-Reply-To: <0D4EA459-C3E5-4557-97EB-17ABB4F817E5@nutanix.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Nov 2025 13:45:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiEg3yO5znyPD+soCkVi_emP=wHrRZk2sv4VS768S3a2g@mail.gmail.com>
X-Gm-Features: AWmQ_bkSLlyCoqZg3bYaZu1P_V2VILWs6lgJjJBJnYgDxxhAqc51xHDCsThFNYo
Message-ID: <CAHk-=wiEg3yO5znyPD+soCkVi_emP=wHrRZk2sv4VS768S3a2g@mail.gmail.com>
Subject: Re: [PATCH net-next] vhost: use "checked" versions of get_user() and put_user()
To: Jon Kohler <jon@nutanix.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Wang <jasowang@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Netdev <netdev@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Sean Christopherson <seanjc@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Drew Fustini <fustini@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_134605_819987_7CEA679A 
X-CRM114-Status: GOOD (  13.87  )
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

On Wed, 26 Nov 2025 at 13:43, Jon Kohler <jon@nutanix.com> wrote:
>
> Linus mentioned he might get into the mix and do a bulk
> change and kill the whole thing once and for all, so I=E2=80=99m
> simply trying to help knock an incremental amount of work
> off the pile in advance of that (and reap some performance
> benefits at the same time, at least on the x86 side).

So I'm definitely going to do some bulk conversion at some point, but
honestly, I'll be a lot happier if most users already self-converted
before that, and I only end up doing a "convert unmaintained old code
that nobody really cares about".

                  Linus

