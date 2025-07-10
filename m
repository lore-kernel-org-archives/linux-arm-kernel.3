Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF64C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 12:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lNmncl3vzJsUWRoJNZxmBhE+E8sb6lSPv1tCHk92ysY=; b=qgPy5HwOzzu59NPlmPhHFWZ1kR
	QVOuMo5gz2KkkWa4DElFOk+xu+T5C8R9+1+IWRxcxz5Q3XtIHVQ+CE9o6Q9b41o83hfpk114FOdab
	aDiPVBwsB4WiSbPFtE24jjlkdqrhOhvmDU6yrybH/UKXJIfqzTgpV4Mf+td2WHRUOr3zKvzWbbynT
	Uw4tHN7e9iAxMxNjwCeq6WLTrpdXTCufDAOdOszzpVWp/+qIpBcNlNAogWUMPWU/xLIEEDotiXemX
	DPhaz+Wteq2d9QVhHYP7cfFbu0mX+e4wJH27J7bVAbbsbWXKYMSZj9rHwASqSqzrsWJJ+hdyll0Ya
	a9kw8GYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqCM-0000000BkBN-3zYi;
	Thu, 10 Jul 2025 12:16:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoqu-0000000BXHt-3WMc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 10:50:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752144606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lNmncl3vzJsUWRoJNZxmBhE+E8sb6lSPv1tCHk92ysY=;
	b=BYz1TmxMZohJ2++cKgcO1fDkDFkZKXBsD/rV/R1eV56SAvX44qmkf9WFv6nvqgCoTpgsmR
	B8WF1cEGysPM8PwOzjeNIl4PYPKnC6lIoW1cJ6/JR6RN8ykfHIYd+8F+DgG3a02C5nkvSa
	jyTP15GqYMAwDS8L9U1nSgdkZT8Yrk4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-oRjIHl6BP8O4tcusPFvrUA-1; Thu, 10 Jul 2025 06:48:40 -0400
X-MC-Unique: oRjIHl6BP8O4tcusPFvrUA-1
X-Mimecast-MFC-AGG-ID: oRjIHl6BP8O4tcusPFvrUA_1752144519
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4537f56ab74so5241765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 03:48:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752144519; x=1752749319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lNmncl3vzJsUWRoJNZxmBhE+E8sb6lSPv1tCHk92ysY=;
        b=QRe40/HK9QTmJCdXSMvBh5737lG1qy5xm1XJrIwlvWFAPMUNcDoyalnx1X0vGIZFvy
         BYHmiooitdodVhDHUdbmMOmPqFPBDXFBFOFJI3SPHiVyseVwfF+cz4uhrcC1ObqAAgJd
         Ah9E1Sg6txdzMp0XyZVy3P8hcP24JHYEYvefczHtbCCXuTYnRxJ+gxrXssQd6nV6JXVZ
         ltiM9XlSS7LP4YsRudWBbgps8e8NXVrpE3581pVADTUfR3wj8PQEWlZ86b61y7NxoHyW
         pniLK72s/JwWCC0EMnN2hII89Qo/sBEt4HmP2QfQ/cYEYf9MiXoMFbPUkx40LNH+ial6
         286w==
X-Forwarded-Encrypted: i=1; AJvYcCWi2qXmjV+JO/nFnGwX8TvcGeEV8BFnu4erRBFZioIguNGhTXxG904IADzgnDqavuTXt6orZIxM8mnYDdXQkzv3@lists.infradead.org
X-Gm-Message-State: AOJu0YxFAI9Tt97Qz/qZXcEnQB6bRFcz7w3JdBPY9PDzRIeDaDS2w29V
	8jDqjMH7gMjXF4Rr1rY6ziUZeSO0y9Si8AcFCbRhBkYCys0TOcQcTFPSfYYp+DoWjsyDzzelxje
	vQsSVRpvd2NSfzbvmVBeM5BeJRbN9rH5qehMO/qw5dgrrWjjsydBOgzQLlRbGQmei+qby/3d5jt
	3PE3lmlulO2StmRafBZblPs8UMG0rSjzozE+ndZ1LdMtYaiUIyGBU=
X-Gm-Gg: ASbGncsp0o540GQWLqQaAT4zXhbZAgCk7GWJPPop73PjJMZ4by7qu9gK0bBE/3fJeeh
	rEiIlRMZQheGNdv3tLJg+ibFj5zpU6PvHQqzupL5xoQkDFzlYuFvXDSyEv1980G2WAiiZoLbhTj
	4N+pfv
X-Received: by 2002:a05:6000:240e:b0:3b2:dfc6:2485 with SMTP id ffacd0b85a97d-3b5e866be37mr1530564f8f.4.1752144519479;
        Thu, 10 Jul 2025 03:48:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmY5FVV5iTS8z0YqIW6yODFY43cB2gfswppkDLC9lidIswhlzZ5Ms1OGnA8y43lftuWydzsAPcndaHukvYemo=
X-Received: by 2002:a05:6000:240e:b0:3b2:dfc6:2485 with SMTP id
 ffacd0b85a97d-3b5e866be37mr1530551f8f.4.1752144519104; Thu, 10 Jul 2025
 03:48:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250626152023.192347-1-maz@kernel.org> <CABgObfZ3RepTFAMVSB4v1cmuOg+JB7LAcqx04EZui6qF3q5QtA@mail.gmail.com>
 <86o6tua76o.wl-maz@kernel.org>
In-Reply-To: <86o6tua76o.wl-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 10 Jul 2025 12:48:27 +0200
X-Gm-Features: Ac12FXwkZUiiCJDC2HojeWiVZysisH16fFGmMHmUxWKm3vmZc3XEF7c6L-0RtaY
Message-ID: <CABgObfa-1ee9ugHk2WmwYmqTqUtc5x1wOW2JPv9+5VigvSAkZA@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 fixes for 6.16, take #4
To: Marc Zyngier <maz@kernel.org>
Cc: Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>, 
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FGPX163-S_Us66RTcOC2M9n5aPE4oPVTfK33IkMo760_1752144519
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_035008_939141_7BB960EC 
X-CRM114-Status: GOOD (  10.55  )
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

On Tue, Jul 8, 2025 at 8:06=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 08 Jul 2025 15:48:01 +0100,
> Paolo Bonzini <pbonzini@redhat.com> wrote:
> > On Thu, Jun 26, 2025 at 5:20=E2=80=AFPM Marc Zyngier <maz@kernel.org> w=
rote:
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tag=
s/kvmarm-fixes-6.16-4
> >
> > Done now, thanks!  Note that in the meanwhile git:// is not working
> > anymore, so you probably want https:// in there.
>
> Really? That's... odd. Was this announced one way or another? I can
> definitely use git:// from where I seat:

And it works now for me too, so it must have been a fluke on
git.kernel.org's side.

Paolo


