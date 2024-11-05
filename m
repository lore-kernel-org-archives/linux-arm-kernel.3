Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD966D3E775
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 21:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wXtAUZpo/eZv9N34VGkN0x5RoW3L2kZwJ65Z3JqvyA=; b=jY6MF6O76JM0qZvWUE7OhX9uSz
	hoLprbyo03zshGgZq0KULsodFcySdYM9DO5cSKmBKa1ownlyethv76RcXlQ8xqKNCKROjE2jEwHCV
	OtQJHw/z8T6lRC9tX34RYrXfyzCEuzvN7aVRZLkKCnUhDUpIcxGQ+cENqNRvokxYMejaynam7Gyuf
	dPa+vItx/mdIFh7yczukRKy7V/+O6GMJ5WPdGEJf8sJefUwlyAF6rqCLjacYS4KZXiBl5N2muTldS
	aLc7uSJ9ClNJ5oMCViRgJbpayKRLK6mb9D0R4g1ZoBq4AfSoBoMc4lhp2Z4w2jDbNtDLwuNTyI1qX
	WmkbPS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RZ4-00000000viA-2GWf;
	Tue, 05 Nov 2024 21:58:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8RXK-00000000vJk-16d2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 21:56:31 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3909528e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 Nov 2024 13:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730843787; x=1731448587; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wXtAUZpo/eZv9N34VGkN0x5RoW3L2kZwJ65Z3JqvyA=;
        b=TZYeB8OJNY7ZMTPiVLl5LBzy5Zb+lhaoL4MHJ7/6RjGJ/EYSbOR5Yj1jxDs2nF0rz1
         aJ51vlftv/ELj39CLhhF0bvg8PW/bmTaGzM9Ku4HNjCZJP+q4e8TP6p9EqCSdKI0sR1z
         euF4X/aGPfaECaA1bdxaXKIC9DuwqqX/PVzZoyeAJAHJ5H9WiG1C6bcxVyP33MR9fdR/
         t9sDBDHsZwq7P2JJj8bOd7CLRTMNIlFn4r9Ez3iN3Xok17lspxpIMVcOTqGD6t8EpM6L
         f3EmvsoD+E66JkREr98eS5sy00ZDppSdtdedcVbThIrDOVVb87dkdxld+924JTwLENQT
         hHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730843787; x=1731448587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wXtAUZpo/eZv9N34VGkN0x5RoW3L2kZwJ65Z3JqvyA=;
        b=lSCEdTib65xtjycws6J9Iiwb5pc+/V5Ida4o1Fo0KWzV/n45Win3Js0X8WrzioHQRZ
         2ToGQhkiz2XrPUO1RHJCaP/PtW4EOXgvPRGhfwA31oP9eTVeFGXpqeCnDlxIe87sD4dy
         Zi0Ny0LneoguvtkW/jWDOCEFjw685+Q1FRc3/W2VfHHEp72L2LA7B6BoSUTLaq8JUcyf
         7RDU8VOXwlZjx0orUtUvTligNQ84L029NQWcrYROqvV2ARVQA4S33ROvZ2g7r6LcwCLm
         33kfwW1wYjE/3nviCnf6e0Rftc2Ux3t1qvYguD2zLWQZUUx6jB2WNnpVmpJ4j17rRmrN
         atNg==
X-Forwarded-Encrypted: i=1; AJvYcCW3GTKN+xDo7V67d8C57OAedAZA7bjhfBHWgu09VwvXeoSzMPTAeXSZFqZxeVArKC4oP7z26aBdg1GDrD39rfVU@lists.infradead.org
X-Gm-Message-State: AOJu0Yw96JGURKIKbM+91wHQvOhVP958F/9OYB5i1DB1pdnnDclMqjaY
	It+RFMgL+HYjPilxJF24mHEooOC3HSqEL58HiV2+s9z6u1W/FJ8NYrzMrmuRz5tbPY3QgmR5Ku2
	oB0xbrcQ71QGiavCuhGHgb90uVAgYNaEmsiW34LgJKSZtH3TMCA==
X-Google-Smtp-Source: AGHT+IG1+f/ZA6qSL99d7qn8w74pDe+0ftoUHGp5Hxjh0+8ykvXijLN2604KYOE83QwClmrIDEAPur/UKnYI6c3tcfY=
X-Received: by 2002:a05:6512:31cc:b0:531:4c6d:b8ef with SMTP id
 2adb3069b0e04-53b7ecd5232mr14841438e87.6.1730843786817; Tue, 05 Nov 2024
 13:56:26 -0800 (PST)
MIME-Version: 1.0
References: <20241105193422.1094875-1-jingzhangos@google.com> <ZyqPMdH4anLEIq8G@linux.dev>
In-Reply-To: <ZyqPMdH4anLEIq8G@linux.dev>
From: Jing Zhang <jingzhangos@google.com>
Date: Tue, 5 Nov 2024 13:56:14 -0800
Message-ID: <CAAdAUthd+c71BTSEvQvCZoYE2vQPHabofK=947MspU1hUbZd+w@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Fix a bug in VGIC ITS tables' save/restore
To: Oliver Upton <oliver.upton@linux.dev>
Cc: KVM <kvm@vger.kernel.org>, KVMARM <kvmarm@lists.linux.dev>, 
	ARMLinux <linux-arm-kernel@lists.infradead.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@google.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andre Przywara <andre.przywara@arm.com>, 
	Raghavendra Rao Ananta <rananta@google.com>, Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_135630_342048_0616A705 
X-CRM114-Status: GOOD (  16.72  )
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

On Tue, Nov 5, 2024 at 1:33=E2=80=AFPM Oliver Upton <oliver.upton@linux.dev=
> wrote:
>
> Hi Jing,
>
> On Tue, Nov 05, 2024 at 11:34:18AM -0800, Jing Zhang wrote:
> > The core issue stems from the static linked list implementation of DTEs=
/ITEs,
> > requiring a full table scan to locate the list head during restoration.=
 This
> > scan increases the likelihood of encountering orphaned entries.  To rec=
tify
> > this, the patch series introduces a dummy head to the list, enabling im=
mediate
> > access to the list head and bypassing the scan. This optimization not o=
nly
> > resolves the bug but also significantly enhances restore performance,
> > particularly in edge cases where valid entries reside at the end of the=
 table.
>
> I think we need a more targeted fix (i.e. Kunkun's patch) to stop the
> bleeding + backport it to stable.
>
> Then we can have a separate discussion about improving the save/restore
> performance with your approach.

Yes, I'll respin Kunkun's patch soon. This patch series has the
selftest which we can use for verification.

>
> --
> Thanks,
> Oliver

Thanks,
Jing

