Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD27FF8867
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 01:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVDB/J4GDc58D/rJhBbvpxXUYt1f3iejtI1opWBv6+Y=; b=iBZrSElHgotkSOD0mWe+IQK9sO
	YTHw+yowF7Il73yQuXS451aqq5M1h4zVkJG6pxTgwuyc3GIqiGbGrDYHECi6SeKyyrTtMLmt1hec5
	U1Dd2GFzWqYxjVpmDyfJ6e4Zju36hBBx/UXbr+2NP6BrtLrf6tZJOtDXWII2koRm9sRAIY1ON6p/0
	dOqG4b3uSm415iScnqHliCZaylf1ODVyvkSdvJkuFIPJ82C+l+LteP6yckWYsDsJCyUQ44s7gKAxm
	ONd16Zc6gs+CdEDBQ4ifv3JnocX65zF4R9AagPwdwYdW7MX4/p5peMDupCUszpTvDoQA8bpYt7/hu
	awvxhfJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXIB-00000000O6g-2S4h;
	Tue, 28 Apr 2026 01:31:15 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHXI9-00000000O6J-1kyy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 01:31:15 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b788a98557so53887135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 18:31:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777339872; cv=none;
        d=google.com; s=arc-20240605;
        b=LIonFZEJiCtRaZkRhb4cHrrdzjAkLW9c/UchtDjoQ8XwuPMfrCnmgkolBR9Lee76Pg
         hbeDGDjLS9blgiWWh9Kf0dSkUJSC/ojTgxk2es2IFQcMYFvjS5SOhgECiSTbIn9jHEoy
         WkFqk2fNbbc7tGOI5NDji8W2Z4Flw6PiMK18xyOQOZv0P8LU6MyX92zd9YTjXzcuOXaG
         q77tB1JttCSjFRX7czd4Y0gTWwvLijB6GuVK3Dw2BaS7ES2flz54PdcrkvN+x7VsM3Yq
         dYXVCFtK2hZ3/XSV6Fsloz4vOob2tsTayxj9aGUTVSLnPQ6lXDyqwDfnurPtUymhSG7F
         8ACg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HVDB/J4GDc58D/rJhBbvpxXUYt1f3iejtI1opWBv6+Y=;
        fh=SEt0LJE4YVNDw/NVgVGGDvXznnJ454EHlwf0RTnYuKo=;
        b=gM6KeFy831ssIglrRD582fIl6d8hQGVyWq4+9U6gussZgtCEzMwkGa9E77nB6xX3bz
         7JPEEnWmPY4HwN33A6vq0DM/UeBRYpHiAntsSlANHF28nCXCNnGLh3XfSK3WqJDLHH50
         8/dyOriwYzFW8NsxAvXSsIBmoBK6BEKozVeIiQc7HBI2MTwd5UxYNyswDxW1QmOEuDDw
         q1k5byd8JmXcAiUHZtXovth0jGjf02fvSrSO+w3HZ21TxmwQ6CmDlyXbxbHGhvM/P1dq
         FlHWBYjxf31Q3WwfSOKYc/vV+RDd5+Np/GfhQtMClNvR0ZqLRL8cHqeU0tcbBpeBk6wL
         3uTg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777339872; x=1777944672; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVDB/J4GDc58D/rJhBbvpxXUYt1f3iejtI1opWBv6+Y=;
        b=LfU6OOQm+PG/g6LVKXMERWhkHFkeXR3N5M30kIfe6Dr/azqCkjS9bAfoe8sKSRRDOa
         S+9kE/vWQk/zw9yM00E+YV6ycajHH3WsBeXOlUDzY5gW5qT6+eUJ9Q3BW3K0xErza1h0
         0DF+GtuXz1Hu+OZX9PsP4QROiYckgUlkzeTerb56vSI3fllnVRrrXLAKJgvsq74RkEHE
         ZSij8Vc2TwCr1F08X6bR6LFS1jJ/NKKcoNV4Kxm6bnvvWbQwHSt0AjFIys7YATFDMa7m
         7ovinFL1w44KNZTTvhr3edVnx25NFRGD/S0yI2Gk4yrdVocNzClCKsfFGL2gQYurLO/0
         PSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777339872; x=1777944672;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVDB/J4GDc58D/rJhBbvpxXUYt1f3iejtI1opWBv6+Y=;
        b=eGaOec5cmYN653twDO1E5POLqJdr1Mz22veoaw2oIWhcBBjdAPIwxc6jC2L7eK7lqr
         cG+ALqwFnCNIp/Ro4QRo1m5VF/KkbNcc9SO+USUMHXZuIlnQXhU8wMeXdm1q2YpU1hUD
         cXtkLT6GIZWUxhTorCuZJN3qL2+xDqR9cE4df9CVIq4D4w4vkijNzS8GR+kygKvvzyS3
         +UomuJZXPz8Dfe36KVYqWokGd966wludCklVWHJt/Bc5nTfu475pNH/g9eiGbPXRSd0i
         eXJHHj53xqDD9rTdgki9xBy+1zTyCx2JuRcO3ZgCvMse8kKdUg9MpScyJjO5mYZoGEwq
         D1Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+jalFF/Jyp9POpQF0jB7EUES1oPYwiW5nBfFPvpmDBu0ASNnDdCGWwLx/nyeffy0/K7Yn1HRRxsnq+7mR6xmZJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzfuyJAeuhsaSphz7Xa8Amt5ddSvGcgq/qN+U1gs14HmnWu03XL
	JRoxgJAl1Am6mrtGjiLkcmnXApKtlL1fWn0uQeIl7cOeNW77TcUl1Ca55036+rqCT6Qm0legSM3
	NpTwe7rUKg6n/cFIdJ0UiuxPPIwRgudwDgcFUeFHJ
X-Gm-Gg: AeBDieujdKfGcwkrzBFONHAI3rle1pU3lNcJ2W9ljPF3xFUGVa/p0fMgrBbQo3BML60
	6VkHsWiWtxSOV0PKVW7sYqs6bZXl+oxG+7XhDOl6AzdRJZj9fLcEO0FstOdUdzU69DMenO/J2Xa
	6lSiMZee2sJDar3enuPkoyJRMijdcwZ83Crq6TkaglVfiw0J+QikRAeBz1ZFK8wMA0qNjGrUosW
	5VfsA//dtkB+XaXB2/kS+YtGa+GYpgN2GibfnSMu+Ju2qBqvuKRef5T/6faQ+vo9fIiCFBOwSY7
	1UlPEweGlc9GGDHTZQ==
X-Received: by 2002:a17:902:ef52:b0:2b7:88d8:efee with SMTP id
 d9443c01a7336-2b97c479823mr8581955ad.28.1777339871992; Mon, 27 Apr 2026
 18:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com>
 <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
 <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com> <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
In-Reply-To: <1e51c2fd090e5ceb07b1d09e50650c70fd3ccdb1.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 27 Apr 2026 21:31:00 -0400
X-Gm-Features: AVHnY4KFlOUWIpfP4Gb0UYo42YH7fwp4lG0sflhn6Go0itDdLXH-l_OT6jI63ko
Message-ID: <CAHC9VhS_WgwhW_NDO91LoTeSzdieGqbwqnwPq8KpavH1_Lwi7g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, roberto.sassu@huawei.com, 
	Jonathan McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_183113_883035_BB38FB9F 
X-CRM114-Status: GOOD (  15.63  )
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

On Fri, Apr 24, 2026 at 6:49=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
> On Fri, 2026-04-24 at 18:10 -0400, Paul Moore wrote:
> > (I'm assuming you meant initcall and not syscall above, but if you're
> > talking about something else, please let me know.)
> >
> > Saying that you aren't comfortable moving IMA initialization to
> > late-sync is inconsistent with allowing IMA initialization to be
> > deferred to late-sync.  Either it is okay to initialize IMA in
> > late-sync or it isn't.  You must pick one.
>
> Yes, we're discussing late_initcall and late_initcall_sync.
>
> I prefer to look at it as being pragmatic. I'd rather err on the side of =
caution
> and not move the syscall to late_initcall_sync, than move it.

If you were truly erring on the side of caution you wouldn't allow
late-sync initialization without knowing if it was safe or not.
Determine whether IMA initialization is safe at late-sync.  If it is
safe, move the init to late-sync; if not, keep it at late and figure
out another mechanism to sync with the TPM availability.  If needed,
you could probably use the LSM notifier to enable the TPM driver to
signal when it is up and running.

--=20
paul-moore.com

