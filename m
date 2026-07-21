Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8DC44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 15:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FQ4oz64LgBujIP7CtqKYaHKZcr3Fx0Qobtjvcna58JE=; b=IyEu0t9WVub2j+f4sHMvWMv10f
	ysLjIN1TUYp7X6/Nfyqv6oKdd6tiGa8qISh1kLzS01Gd1cD2QpBOk/fbKko1XCLvbT3wsmyL2BDVy
	METWIxYcmRMLuiYCXQqNdF4BjQgj02RytPOuUWxkmblQzv8nGOj2a/BaVh60DpRfP6CBnPd/rqB8I
	rikMbdN2F7l50sZZBumzDC5YEXPzGWvhbSplAbnmU0pxr2scg1I5L6+XtnxEHUzps4ZJuRXKPfCP+
	yiNtK/UQV89pkuPbfN9HeQbAbl+G6eCz6clgfbTaKmQ7uEnxlsozFsQorxsHesH1sQ/liDsLx4OYc
	mMSRl5sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCMr-00000009nlq-2jvG;
	Tue, 21 Jul 2026 15:26:49 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmCMo-00000009nlP-1iX9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 15:26:47 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7eb63dbd229so3083945a34.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:26:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784647605; x=1785252405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQ4oz64LgBujIP7CtqKYaHKZcr3Fx0Qobtjvcna58JE=;
        b=CoUZJI3mX3Nukr3C2WZV41SQCr4FSQUyJzf2akiQHtWL49mAnWPO1VlPmBzQFx+1MN
         XOp1/3QS0Llu3ntRxdgqn4inKUz+K+BTA8pa/DX7bfNLs2iNUlZK2tt0CjLIoF3TOOkg
         nhuhqcNhma6q7e/GCj3lIZU5E6t+kZwPcXAt63wFCtEdkyzVRXw9akMMXaF1uU3VCuDS
         Gal55UyunbtrfuHmRf/KF+yoFywD7j46cxZf9plOnh0O2E17nAhHnLkozafBJDhy1vDX
         7oLxI1ufpI2TikGBv7g7Ld80Pl1L2YA3D54dpDDptDUq79IVPmiGuEdXVdmUHNcJQja9
         9xkQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqt4S2B1FbL3Ps8yJkOH/QK4aF3E9yDaoF7YLxfy/D/5V8E+VWtDuGp+PbAtND1vT9xEsFzO19jMa8h7hlvXVAX@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9S8gYPaanV927SHYkaPus5BKbOEGk2Pe3L+V0UJarfX0WjGwO
	ePZlTXNXvcnnQLvQTnYMuladn8Fp+QyKauStbYSvT2+xooFWYJLMrmAWWC5Ev+LGcg==
X-Gm-Gg: AfdE7ckZ4nc1UUH7zi801MO2Q+YWsMFobhyzirp8PlusXnAUBDbXp5Ez/Wo4/PW2/BN
	zNy9ViOKWUAMct5AiMU/yxm+Pf3GJFQsAZzxLywHt7m8g3FMUk9y0wsS4FabgqhEtttB0b6OGqa
	0CIZpwOKR4g578a/yeoXcMc7qBtM/stcypY+zhl/Nk81rt2XbHLW8vJZMrJHAhxvQalHJVDn0Zu
	ZuQHSi92mnkXpo9TNbEzXa4zVBTibwaXFR1a1wS6UJDWxaG5T0Gy5dVE7SDPI+T1DUz7WebOZcq
	MTWz9Hr9r8Z5t7rFAoHUxZgD8kcMN5IkLMPiEozAPsG/6+fJVJGfFnJgjNzikLIvewL47TdEX+j
	Pxso7VDz+6AH9IFJpYsCBgjjQLRbImaxpyHO0dnYWXtkj1moExnw1bNSa+fAerVXxq6sQM8MVPX
	FEjWn4yuLw+peFtqQqKHwr5bc84g/nQBXICaWUuixHdxxP0YwIIZ0uu3sWL5Nzw9g4+BQzD/1d
X-Received: by 2002:a05:6830:710b:b0:7e9:da5e:93f5 with SMTP id 46e09a7af769-7ee22e768b0mr47776a34.12.1784647605207;
        Tue, 21 Jul 2026 08:26:45 -0700 (PDT)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com. [209.85.160.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ee1481f58csm1618356a34.2.2026.07.21.08.26.38
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 08:26:42 -0700 (PDT)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-451fd21113cso3868149fac.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:26:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrN+rg40H4ctb/utF/+J6ixDOhROBfyyNVghUIjMp4G8CrI+rjmqLIA7VQ76H0rEbhAlEj61Uw+y9U8k4uOOjK7@lists.infradead.org
X-Received: by 2002:a05:6871:e023:b0:430:16b5:909 with SMTP id
 586e51a60fabf-4576337c756mr31587fac.15.1784647598566; Tue, 21 Jul 2026
 08:26:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260720162117.32304-1-fourdollars@debian.org>
 <20260720162117.32304-6-fourdollars@debian.org> <al81PmK1UMr2g8p-@wunner.de>
 <CAAT15mPuO71WbbS2ZpWjceCVj3FUTqHLi3wbbeV7B33JHbPRsQ@mail.gmail.com>
 <CAAT15mPrwAqLmFVF730G+iJugzNzaT=HDj_7G5-wXbhBNU7ANg@mail.gmail.com> <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
In-Reply-To: <f7449a69-98e3-41c0-b535-847b8c520e10@sirena.org.uk>
From: "Shih-Yuan Lee (FourDollars)" <fourdollars@debian.org>
Date: Tue, 21 Jul 2026 23:26:27 +0800
X-Gmail-Original-Message-ID: <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcLZ9MDAZV4isNPolsPsjelNX391zsUCu_4hyVZw3renDlpBWi3bMJ4kg
Message-ID: <CAAT15mNppZ6nPQ9a8Hp54XK4BXndfv+G24n4VeQ1X8GOk6fSyQ@mail.gmail.com>
Subject: Re: [PATCH v16 5/7] spi: pxa2xx: disable DMA for Apple MacBook8,1
To: Mark Brown <broonie@debian.org>
Cc: Lukas Wunner <lukas@wunner.de>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_082646_452968_C1E3C3D0 
X-CRM114-Status: GOOD (  25.05  )
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

On Tue, Jul 21, 2026 at 11:05=E2=80=AFPM Mark Brown <broonie@debian.org> wr=
ote:
>
> On Tue, Jul 21, 2026 at 10:34:20PM +0800, Shih-Yuan Lee (FourDollars) wro=
te:
> > On Tue, Jul 21, 2026 at 5:26=E2=80=AFPM Shih-Yuan Lee (FourDollars)
> > > On Tue, Jul 21, 2026 at 5:18=E2=80=AFPM Lukas Wunner <lukas@wunner.de=
> wrote:
>
> > > > It would seem better to fix up the incorrect interrupt number in a =
quirk,
> > > > rather than disabling DMA wholesale.
>
> > > I appreciate the comment. Based on the Bugzilla feedback regarding th=
e
> > > incorrect interrupt assignment, it seems fixing the IRQ value via a
> > > quirk is indeed a better approach than disabling DMA wholesale. While
> > > I am not certain this will resolve the issue entirely, it looks very
> > > promising. I will investigate the IRQ mis-assignment problem further.
>
> > 1. DMAR/IOMMU Validation Failure (Error -22)
> > On modern kernels with Interrupt Remapping (DMAR) enabled, overriding
> > pdev->irq to 21 causes the dw_dmac_pci driver probe to fail with
> > -EINVAL (-22) during request_irq(). This is because the
> > DMAR/IOMMU strictly validates the PCI Requester ID (source ID) against
> > the GSI mapping defined in the ACPI _PRT table. Forcing a device
> > mapped to GSI 20 (00:15.0) to register on GSI 21 triggers a
> > source ID mismatch check, which the kernel rejects.
>
> That really seems like something we ought to be able to do, though I
> think the idiom here is to patch the ACPI tables so they are correct
> rather than quirk things in C code.  ICBW about the preferred approach
> there.
>
> BTW, if you're using a LLM to assist with analysis please don't just
> paste the output into mail.  Instead make sure you understand what the
> LLM is saying and write up the salient bits.
Hi Mark,

You are absolutely correct. The standard idiom for correcting firmware
bugs in ACPI tables is indeed using the Initrd ACPI Table Override
mechanism (compiling a modified DSDT with corrected _PRT routing and
prepending it to the initramfs).

Actually, I was just following Lukas's suggestion to modify
drivers/dma/dw/pci.c to do a quick proof-of-concept test, and I used
an AI assistant to help me write and deploy the driver quirk code.

I have previous experience with the Initrd ACPI Table Override
mechanism, so I can definitely try that on my machine next to see if
we can get DMA working properly by aligning the PCI routing and DMAR
mapping correctly).

Also, I will keep your advice in mind regarding LLM usage, and will
make sure to write up the key points myself rather than pasting raw
output.

Thanks,

Shih-Yuan

