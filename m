Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88368CA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmiQEbEAvOozmFqw9ji6oPoxgyycKFjBNvTezQZX36M=; b=MKfk33K2RC01YU3rq6w51BdHNc
	w7hkesFAN3lnLEbgqbehf3HVMw9VqWQCpomvyOMnkf/8E0/UdQwojc2eQeirpoJ3wLAJyjueaVQ3/
	83gS8EzrGmuk4D3ps+vDtM6w+fjoqhqE8F4Gu0pKWl9LHVIEkRIfE3L9xTVcjGMn49JQYdYVI0cTc
	DQyUbO7aSXsoM2b08eWdg3TyYrOrIa1BTi+7IlJQJi2VgMqZjeqruU4NTPuBLh4+hN2KN02lPeccm
	8MzwTSG5XDzLhJvQuowaWpW9EhAD+AqQqX1ghs3VZNkaBN5Qcg4XVQmPX9JjHgoVvFT/2sTWgaMUL
	FvpsLudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxGm-0000000CjpN-2WBb;
	Tue, 26 Aug 2025 17:15:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqxE5-0000000CjcJ-2MI7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 17:12:54 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso844787166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 10:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756228372; x=1756833172; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmiQEbEAvOozmFqw9ji6oPoxgyycKFjBNvTezQZX36M=;
        b=qUQDlx+1sVl/VQoBWEfvmbINYvom/6Qw2Hdjx5Lc14D0MjNcAzyu72jiz+KBufGZxu
         +/rMvWHds6o+r8/Rs3RKCHTTvMphH4RBsbBNZUTTknSgOOi8tkyhC387YnqzRHQ41Ba3
         i6bOWQCuqaB/TSv9nImdmNyQpj2j/34TlqJHoogSy8eMzWBUHPpxIhgYr8kryjz/y0SD
         d9/emO4xK4J28v4Y2P1IChp5idyMykgxSTFfv/nqBW9siN5RIIRSzdARritfP0C4iD+N
         sVen/nnjDzO+GIHna3gPb6td1v0YM4kJUNnTaTITTGvYb0coYrjrbv8S/G5g2Ig5aYag
         JLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756228372; x=1756833172;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmiQEbEAvOozmFqw9ji6oPoxgyycKFjBNvTezQZX36M=;
        b=Hfi0vkwSlseKCs1ctVS+qq5rPezDJi/tSGN951I/C7Fi7CgnWRSawIC7ixOg5BznXY
         8vU8N5V5gITx5rk7k+kihxXFvTC6hIHKpaSxlogFX7x1bgIh9lgfJEcyQhhcFSx0jAWF
         Xl+TxUhQLd9jD6Rn/v9dATNIZtg7m0apwZXOXWsFYBNE0Ph3Et1+I1To8BMWTC4I+eBq
         wChKp8OOWow6yynZqyb40fBYoj95I+LXz9J/rQavp1aaWfKYqvQzANYDxJLOzRn5SAQi
         453HZpYP3OprAvtfWlGAv89Qaig1E30a6T5jmHrWz2ChOwbi4uwbSszQLYQc7LrUJM5j
         US/A==
X-Forwarded-Encrypted: i=1; AJvYcCVparFTOlG5ve+rh4lNsuc5nHgspSjLapdW9YMVVdFty9vJHmIIrLNko0TuTKeGZbBrWNo5nXWK76Ng/i1iXIsy@lists.infradead.org
X-Gm-Message-State: AOJu0YxsMDfnt2QBZG4fSuLr/YiYRW0QLihOz5AXW2d1Ra5xlGXNMJ9F
	3r5wGnbKaaKRAaxZtSnxDBp6H1MBT89coDUS2VesK/xTmxUKl+A5P6oXlSRM40igBWLxQ4knbyd
	jaeW8/UZFRG8DAgnipalzwrgcykPHeMo6yaCgQwFeHw==
X-Gm-Gg: ASbGnctdXvFLWVrimgh9vmVGbgu0BDeeNMkJIhmyIAe13xA5ah9PoHqTO3fdrivD8QH
	htfJpFdb8R3hwnbKotxoUw0ql2zm7xg9H/LHvUkS6nBS8O9gPrmL1Ev6hemb4NbovlhyLBc/c1l
	5dRRmr6mP2PU5OPUXsWpVWeXRfFgxWMIILJsZ43+fyvUG0vaeI6n2PVhNU7dZwl6zN9TGh21OZW
	AcE6S7MaF88qhPaEQUOTGyILQGzgEt0VTt0HbY=
X-Google-Smtp-Source: AGHT+IFDZvNaU3eL+sPBd2g+8ckgsa/t5Cv1DlJOj7IrzVfzrcw4klg/uE7e1fiMAWwe/BWU80WL1sKNP8AidkFE6Go=
X-Received: by 2002:a17:907:3f0c:b0:af9:a2a9:b5f8 with SMTP id
 a640c23a62f3a-afe28fc1d5dmr1553038066b.18.1756228371757; Tue, 26 Aug 2025
 10:12:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250818124458.334548733@linuxfoundation.org> <CA+G9fYt5sknJ3jbebYZrqMRhbcLZKLCvTDHfg5feNnOpj-j9Wg@mail.gmail.com>
 <CA+G9fYt6SAsPo6TvfgtnDWHPHO2q7xfppGbCaW0JxpL50zqWew@mail.gmail.com>
 <CACMJSeu_DTVK=XtvaSD3Fj3aTXBJ5d-MpQMuysJYEFBNwznDqQ@mail.gmail.com>
 <2025081931-chump-uncurled-656b@gregkh> <CACMJSesMDcUM+bvmT76m2s05a+-T7NxGQwe72yS03zkEJ-KzCw@mail.gmail.com>
 <2025082612-energetic-lair-ee26@gregkh>
In-Reply-To: <2025082612-energetic-lair-ee26@gregkh>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Aug 2025 19:12:40 +0200
X-Gm-Features: Ac12FXxkgjfxjtCqgbWi4lcdhlWZDxk1sUygzZJ-Vm9DflOQJnoV5kzUn5n4oQw
Message-ID: <CACMJSeshuCMDiKWBKYD9OB5QvZugkz-87EEu-yi2g+7UF+WUJg@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/515] 6.15.11-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org, 
	patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	pavel@denx.de, jonathanh@nvidia.com, f.fainelli@gmail.com, 
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	Ben Copeland <benjamin.copeland@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, srinivas.kandagatla@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_101253_607662_B0E35C86 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, 26 Aug 2025 at 16:45, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Aug 26, 2025 at 02:06:04PM +0200, Bartosz Golaszewski wrote:
> > On Tue, 19 Aug 2025 at 13:52, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Aug 19, 2025 at 01:30:46PM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, 19 Aug 2025 at 12:02, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > >
> > > > > On Tue, 19 Aug 2025 at 00:18, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > > > > >
> > > > > >
> > > > > > Boot regression: stable-rc 6.15.11-rc1 arm64 Qualcomm Dragonboard 410c
> > > > > > Unable to handle kernel NULL pointer dereference
> > > > > > qcom_scm_shm_bridge_enable
> > > > >
> > > > > I have reverted the following patch and the regression got fixed.
> > > > >
> > > > > firmware: qcom: scm: initialize tzmem before marking SCM as available
> > > > >     [ Upstream commit 87be3e7a2d0030cda6314d2ec96b37991f636ccd ]
> > > > >
> > > >
> > > > Hi! I'm on vacation, I will look into this next week. I expect there
> > > > to be a fix on top of this commit.
> > >
> > > Ok, I'll go and drop this one from the queues now, thanks.
> > >
> > > greg k-h
> >
> > Hi!
> >
> > The issue was caused by only picking up commit 7ab36b51c6bee
> > ("firmware: qcom: scm: request the waitqueue irq *after* initializing
> > SCM") into stable, while the following four must be applied instead:
> >
> > 23972da96e1ee ("firmware: qcom: scm: remove unused arguments from SHM
> > bridge routines")
> > dc3f4e75c54c1 ("firmware: qcom: scm: take struct device as argument in
> > SHM bridge enable")
> > 87be3e7a2d003 ("firmware: qcom: scm: initialize tzmem before marking
> > SCM as available")
> > 7ab36b51c6bee ("firmware: qcom: scm: request the waitqueue irq *after*
> > initializing SCM")
>
> 6.15.y is long end-of-life, so is anything still to be done here?
>

The same applies to all other branches for which Naresh reported an
issue: 6.12, 6.15 and 6.16. I think only 6.16 is still relevant.

Bartosz

