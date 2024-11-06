Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D30BD59F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 18:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYk4e/Rf0Fwn8rgiKqzmXUTH3/JjwaWMVgfrc3mEkFk=; b=E86WA0Ju8WngroLDwoG7Lk+akK
	kvYRcW7KRfP+4ZTaKA5MBShZ7Zv/oT+gySVEKcqKK42GBK5LcOrs5EN6hsifl2asiYLTWm1OsqsQM
	uRjCVMdvbcH1WD7f0tBjFqIaSij2lmJkXfcw5SkGlhMtZHWoKuaU8C8CfnkAneU3IkX/304WsmPBl
	/QTpxEy5Pv2HROOQbJNgcXqzKqDQdGbb4yYXnRfB3WH+6HNXcVoBfV1W9Za3QYkz0sCz+3my0VJC+
	PmUJhmq4Gs+NmzAhbqswtVX1BpvjDYFOk4TXgErXyeMXUNideXt5qjKS1Fo6TPBPE/d2q5zqcOh5Z
	BycNVkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8l0F-00000004Nti-32rV;
	Wed, 06 Nov 2024 18:43:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8kyT-00000004NfX-0RQk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 18:41:50 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so50363e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 10:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730918507; x=1731523307; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yYk4e/Rf0Fwn8rgiKqzmXUTH3/JjwaWMVgfrc3mEkFk=;
        b=C9T7GmRqXpYSYQQeZWrUyHmpI1LD51tjUIpigg3nuRwTi5VTjGOyxrNydZ/zVfrdV0
         jKQ6RBMrfwm0j2uVMpaPpLXsu57wZmewvUn1rSzmGQJ7oee8hukqANQH+XrfpNa15x3e
         8cCe06EUeMVDH4K78Xc1HRon15SiculuIj/jjAbUOoGzYSDBIHPYmpREyazFWgE/jhnz
         dkavaKNkS94cjA3GOu+mPESA3QfikaPXBPx+dZVd5HbuDF/38W/kJgw1MuTT09DsALd2
         4frYWsMJYs05z83kwbIKI/OpRfr3SIVAabPT4Tcyf2d+J9V2l1JGJMCuyZ2gDdAidaj/
         3H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730918507; x=1731523307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYk4e/Rf0Fwn8rgiKqzmXUTH3/JjwaWMVgfrc3mEkFk=;
        b=dfjUqopXt7m9mkg/wyy/j/nY7Da/bfFTxDpy/QhaxrLiqOlxrcTOjqjrI5jixowfOy
         U6S8WvrI0Gdcaad7eNLkOHIk7dtaLq4n741MTJIo2wLV8Dm4HyTdWWD8vaHaqXZeDky8
         72uYhOszF9AIqDZHFaDh8yNyHfuELJcR9j3J1yfAvohdSFHo/cygP2z79c6fKLxGq9aj
         vfG7rt8A7ZoCkV7XmZTNxEJbm0JUlJIt9Th3fWIprLnaZ1XBD0+EtFaVnetlDonHs5SD
         1KRCkHZ5N2MrSIvJUpCWjfFQRGkkoHn7VWQUIEuZ11fqxneHRM4QTMmPh0bqQQLX+rOh
         XWiA==
X-Forwarded-Encrypted: i=1; AJvYcCXyN2DAbWPHlFUYYJyyjeKcRVuDtdL6ZFWije4qdjd7YvM4IYc1GuC5Mg0j54GeU1UVeuXqNrniT2v/UvVlq0zx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5JAW5yZA6x5631U9Imor9ZvXwXFlEV44THmjZLaa9qNQUjSUE
	ZXUWQemvex8bAkKDtc8lRYHBmYnnp/Lwx9hul5PZZ+w2KjCY/kDSFD+X8uPUjiIYAwM6ByaM+dv
	C5odq5oRV2bR0qpSQulG43QxrV1WYUNlFYn2Z
X-Google-Smtp-Source: AGHT+IHx4X3KPAFGSnjaYKE8NT/XVzFyHeBioH3zapaMHSYPe+KnYq0l63zBuSlt2HLiDpsHUtw8XFGqFcDi10iVlu8=
X-Received: by 2002:a05:6512:6ce:b0:539:f922:bd4e with SMTP id
 2adb3069b0e04-53b7ece11eamr15715877e87.23.1730918507026; Wed, 06 Nov 2024
 10:41:47 -0800 (PST)
MIME-Version: 1.0
References: <20241106083035.2813799-1-jingzhangos@google.com>
 <20241106083035.2813799-5-jingzhangos@google.com> <86a5ec1oim.wl-maz@kernel.org>
In-Reply-To: <86a5ec1oim.wl-maz@kernel.org>
From: Jing Zhang <jingzhangos@google.com>
Date: Wed, 6 Nov 2024 10:41:35 -0800
Message-ID: <CAAdAUtjYZ5N4UpaK5Kt8MRyN1zqPD5QqjZzNdp-HPUgA-AtNJg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] KVM: selftests: aarch64: Test VGIC ITS tables save/restore
To: Marc Zyngier <maz@kernel.org>
Cc: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Oliver Upton <oupton@google.com>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Kunkun Jiang <jiangkunkun@huawei.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Shusen Li <lishusen2@huawei.com>, Eric Auger <eauger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_104149_165547_46B66266 
X-CRM114-Status: GOOD (  23.53  )
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

Hi Marc,


On Wed, Nov 6, 2024 at 5:27=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> [Adding Eric to the list, since he worked a lot on the save/restore code]
>
> On Wed, 06 Nov 2024 08:30:35 +0000,
> Jing Zhang <jingzhangos@google.com> wrote:
> >
> > Add a selftest to verify the correctness of the VGIC ITS mappings after
> > the save/restore operations (KVM_DEV_ARM_ITS_SAVE_TABLES /
> > KVM_DEV_ARM_ITS_RESTORE_TABLES).
>
> What are you checking? The saved data? The restored data?
>
> > Also calculate the time spending on save/restore operations.
>
> Is that really relevant? I don't think performance matters at this
> stage, if we can't even have reliable data.

Right. It doesn't matter. Will remove this line from the message.
>
> > This test uses some corner cases to capture the save/restore bugs. It
>
> Which corner cases?

Will add details.
>
> > will be used to verify the future incoming changes for the VGIC ITS
> > tables save/restore.
> >
> > To capture the "Invalid argument (-22)" error, run the test without any
> > option. To capture the wrong/lost mappings, run the test with '-s'
> > option.
> > Since the VGIC ITS save/restore bug is caused by orphaned DTE/ITE
> > entries, if we run the test with '-c' option whih clears the tables
> > before the save operation, the test will complete successfully.
>
> I'm sorry, but this description is meaningless, as you need to know
> what is the bug that has been fixed.

Will add bug description here too as in the cover letter.
>
> Also, how is someone supposed to run this thing? Without options? With
> options? With any combination of options?
>
> From what I understand, the various options are designed to help
> debugging a broken vgic implementation. So please document what the
> options do rather than an bug that is supposed to be already fixed.

Will do.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Thanks,
Jing

