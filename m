Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A56FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 22:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAcyp6tj20FtAf4IQx3ifIttGPMFNnHtv6J7kGhC8TM=; b=ZDTfupeOl0Ake0oUhFUW02WX7i
	+ivPA79zKrOFepWMdluaIBOrL14AR8reTExPUnskh027YQI8cNBLSoFzHbC0mI5FJYJ/qBYilNTU2
	JM0+pUMCz8vvnthzhq9Ebsksx23x87gR8DvyVnnITvfI6jN5iNlSzF2D3rxy7JwqZXeqyziJrUX5N
	Bbe27R6c32AshGN2tCx6Y91Zwui/1rMJDT86mud01y2kGkJ5UAqv2EbY3Be8L13UK2zOukE2nH6tq
	GQ9v+ZAXEDjEfF+LFWk+WyWRjv9SwV/vHfha9I1ccltrriWqmpZdda9XCnOaJeyjQQqXHCdsoXZPT
	VrJ/4/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGOjH-0000000DnR6-3XAx;
	Fri, 24 Apr 2026 22:10:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGOjE-0000000DnQR-2f8N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 22:10:30 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-82f943870baso3416523b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 15:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777068627; cv=none;
        d=google.com; s=arc-20240605;
        b=Jg3ld74YakW4rShBIjxgmAOWv4oNfJ28jbTuKUAMApuxqwNuPOdbC39o9RvJnzZO14
         PZJImkAWRiNEWfYetazI9OP6rg1AMoUasZHEgcQRJfvS30dZNQPJ3c6VN5xwg1vNamvH
         x2jvIHCnXEkMDQdSK9oNUSH2EONN3n+S5OKv+OkTDHmgkecGADiBK8RvT8vXzub7t6HV
         4w4tGfq2KMqSOJerjbwdAm3rQaiCAp6jDUD5h6N8IH6hwdKcQBVJeCKU7zqbJwDbUWBc
         qKRsFEN3OyZnZA5uNib+6pIDFAOkERQYmkfDBJt+H/G0pJrrkIP/rej3LU2t+A9Q9hM8
         LVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAcyp6tj20FtAf4IQx3ifIttGPMFNnHtv6J7kGhC8TM=;
        fh=SEp4qWFZGgktWendYk7ObHvDRQXu862leezvri1JvdA=;
        b=PDs2Dv2VYbx39313YLO4aY8+MbLllR5urqkjf7I++tDAQZekifSZJGw4qUwO6BOc20
         XLZu6mO8QSNSaLe3ftZkHX0bUS0F9LZ8nQi0igNQnONsvvJed53sbUuIZNyC6FFYLyGc
         6nBnslPv93b5jgWJ4uLDz8eiOp5UsLo5G1bQSs3D6aXhiLVXcf6eeyJ+Iy8960pW5Hh7
         Mcmd04/+NZ2fMVa5UmdgT+m5swp3ezIQSipUZSPMszjcoPJL91zWEtL9Fa9gfpvdd4d4
         mqFi3FytV9tQX5LYJO1FNxuv3XqYYtuGw0tiVfLwaRqsLp4yFtv6HpWFL8PSl+efcMJg
         H+yQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777068627; x=1777673427; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hAcyp6tj20FtAf4IQx3ifIttGPMFNnHtv6J7kGhC8TM=;
        b=evdjjykQvVX6issg58b/kcgksB38fcKI36IDhW3QGpgrhrL5u/O27gOPCDhaAmwVqF
         UcuSPNrS5w3mk15np56WiinbYYnu1duo27ioRe9Hl2lPt3XeKiJ+kKFQ+CEb3GTHwRDN
         YtnG1rkCbCwLCNX0I5/y4fCnOxot0HalCNV20NJ+Vou4VZQr5e3ybtQskySXCRzLZZcA
         EFu2vThHlPd9MfzVvuMhZMdKKbH+a89jxj/oH9aGxziqrPB01UTPZNi3mrUyw+PSIndg
         MV2vy1ZdrzbhhCoGd31dL+WS6rmO4lKCb+CHgI8nX+b3Gx5snSMlYdj/YvY2cQUncPGu
         frvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777068627; x=1777673427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hAcyp6tj20FtAf4IQx3ifIttGPMFNnHtv6J7kGhC8TM=;
        b=M131AZS0Hb5XYzln3j+g4XadEBCHIJTCRg5Bw8PJRhHIZ6ZB30xST1cp7412cH/ufw
         kDrg3GH5CB3/ohPJT8FPWvfFnwXq5tqdhPLwTZQqzkR1DZJSEWqM54l4JSm3PJHiU6NC
         uKO7xua0WezNAK5JDsYAWWrXAdBi/fMxTyUlWlRKZNbU044fyUSOIf/WmxpJ0ssAorWL
         3I7+WN/5JBs3aZUz6eMXDsvuMM+oNvwBYEG35LAh3UrXHRAvYOFszr5L7WLY2TLaddA4
         bcpYX3U9HlUtQHsc6So0wTHyVO/V2KcptvjT6xpYucSuYRaH2CSsH23mI524fI5oo8Jm
         poBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8RAsD1jOkNv8bJNdSKMNopN+W3kFxQczGeoQU6Pg+4VbEjcPS52bVgqcWWBD0yVjhkjilgb65CghSmF1WE1yg/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+TRMGPPw4f/EuHX3rLxgYk+khrqwyozuPOpWERjIOOjc/zur6
	ZwnWQOnUBlbnUQGQXGqzBkdThuU5VJwJBgQw9vZtR2X+s6ihsnZlxt/SBzj0jUHpbDkXHI/BTNl
	hvJ2YwBC3dtGH/IxK8iyfIfcqfnCE55SPLgWyvdaj
X-Gm-Gg: AeBDiet5aXMwpSWFOsKNdcP8TnqWOEc0tlXk+HXBCnG3ZCJRTLYFBTtGSTN1Xn9uWDZ
	ZyS1igv8q8rSkNewBmORLO0ug3ULOavzkUQFVYCySGGED6sAA2WGwDmus1Q+BQACNM6n+7VuL8Y
	iDdUkpaFO4096D3HDqq6Wat34zDHGtDTpyyomZqIoAqyB8scRfHaMNHt56mzkKGplKfJpStCpu1
	EGYiFz0IWEMMtEfpLL4BSBuWrti6N3hN8C3LASJnvOHy5cAjnxyWfFVQ1Zi4GSPeYzK46xCG92i
	5nTr8EZ0KJN9wPqYfw==
X-Received: by 2002:a05:6a21:e082:b0:39f:91e9:cada with SMTP id
 adf61e73a8af0-3a08d677abemr37340839637.9.1777068627375; Fri, 24 Apr 2026
 15:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com> <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
 <014cf39aa8d6a0bcfa1a95c069675977ac67b843.camel@linux.ibm.com>
 <CAHC9VhTW3=RJ8L91RWXYYA9tFjfSXGN-DMEEwdiD6big9H57Ew@mail.gmail.com> <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
In-Reply-To: <1f78fc75b2e95239973612a4b6c4cc782960b7ac.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 24 Apr 2026 18:10:15 -0400
X-Gm-Features: AQROBzAx1ZA_SOme2lQN7_v2fyTxeQpFzpK5JHTmeoRh2Wyy1mmm1jq2VzT2o90
Message-ID: <CAHC9VhS4JmPmCJrYTdbjxb3TO-uK6cB3Zij-ef=wswGce2BGzg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260424_151029_053860_95FB3B10 
X-CRM114-Status: GOOD (  46.15  )
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

On Fri, Apr 24, 2026 at 6:01=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
> On Fri, 2026-04-24 at 17:08 -0400, Paul Moore wrote:
> > On Fri, Apr 24, 2026 at 4:58=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com=
> wrote:
> > > On Fri, 2026-04-24 at 16:15 -0400, Paul Moore wrote:
> > > > On Fri, Apr 24, 2026 at 1:57=E2=80=AFAM Yeoreum Yun <yeoreum.yun@ar=
m.com> wrote:
> > > > > > On Thu, Apr 23, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yu=
n@arm.com> wrote:
> > > > > > >
> > > > > > > Sounds good. Once the patch is posted, I=E2=80=99ll review it=
 as well.
> > > > > > > Sorry again for the noise, and thanks for your patience ;)
> > > > > >
> > > > > > My apologies for not getting a chance to look at this patchset =
sooner.
> > > > > >
> > > > > > This seems like an obvious, perhaps even stupid, question, but =
I have
> > > > > > to ask: if IMA can be properly initialized via late_initcall_sy=
nc(),
> > > > > > why not simply do the initialization in late_initcall_sync() an=
d drop
> > > > > > the late_initcall() initialization?
> > > > > >
> > > > > > Does any IMA functionality suffer if initialization waits until
> > > > > > late_initcall_sync()?  If so, it seems non-critical if waiting =
until
> > > > > > _sync() is acceptable, as it appears in these patches/comments.
> > > > >
> > > > > This is the way first patch did, and here is some discussion for =
this
> > > > > (Might you have seen, but in case of you missed):
> > > > >   - https://lore.kernel.org/all/a6a0e15286c983d720de227c6827adbe9=
76c5b9b.camel@linux.ibm.com/
> > > >
> > > > Thanks for the pointer.
> > > >
> > > > Unfortunately, my concern remains the same: it's either "safe" to
> > > > initialize IMA at late_initcall_sync() or it isn't.  Attempting to
> > > > initialize IMA twice seems both odd and wrong.
> > >
> > > Agreed.  However, IMA should be initialized as soon as the TPM become=
s
> > > available, not delayed.
> > >
> > > In patch 2/4 patch description, Jonathan describes the reasoning:
> > >
> > > Unfortunately some TPM drivers (such as Arm FF-A, or SPI attached TPM
> > > devices) are not reliably available during the initcall_late stage,
> > > resulting in a log error:
> > >
> > >   ima: No TPM chip found, activating TPM-bypass!
> > >
> > > and no measurements into the TPM by IMA. We can avoid this by doing I=
MA
> > > init in the initcall_late_sync stage, after the drivers have complete=
d
> > > their init + registration.
> > >
> > > Rather than do this everywhere, and needlessly delay the initialisati=
on
> > > of IMA when there is no need to do so, we continue to try to initiali=
se
> > > at the earlier stage, only deferring to the later point if the TPM is
> > > not available yet.
> >
> > Once again, that heavily implies that it is safe to initialize IMA in l=
ate-sync.
> >
> > Put another way, what breaks if IMA's initialization is delayed to
> > late-sync?  If the answer is nothing, just move the initialization to
> > late-sync.  However, if something *is* broken and we are just doing
> > this because of TPM delays at boot, this patchset just creates
> > additional problems and we need a different solution.  I can't
> > envision a scenario where it makes sense to attempt initialization
> > twice.
> >
> > > > I understand the need to ensure that the TPM is available, but if i=
t
> > > > isn't safe to wait to initialize IMA at late_initcall_sync() then i=
t
> > > > would seem like this is a bad option and we need another mechanism =
to
> > > > synchronize IMA with TPM devices.  If it is safe to initalize IMA i=
n
> > > > late_initcall_sync(), just do that and be done with it.
> > >
> > > Within the same initcall level there is no way of ordering the initia=
lization.
> > > Yeorum attempted to address the ordering issue in commit 0e0546eabcd6
> > > ("firmware: arm_ffa: Change initcall level of ffa_init() to rootfs_in=
itcall"),
> > > which is being reverted in this patch set.
> > >
> > > Ordering within an initcall level needs to be fixed, but for now retr=
ying at
> > > late_initcall_sync works for some, hopefully most, cases.
> >
> > That's not a good answer.  Ignoring the TPM issue for a moment, can
> > you confirm that moving IMA's initialization to late-sync is safe?  If
> > not, why is this approach being considered?
>
> I'm not seeing any measurements between late_initcall and late_initcall_s=
ync.
> Based on this very limited testing, I don't feel comfortable to actually =
move
> the syscall, but can see adding support to allow IMA initialization to be
> deferred.

(I'm assuming you meant initcall and not syscall above, but if you're
talking about something else, please let me know.)

Saying that you aren't comfortable moving IMA initialization to
late-sync is inconsistent with allowing IMA initialization to be
deferred to late-sync.  Either it is okay to initialize IMA in
late-sync or it isn't.  You must pick one.

--=20
paul-moore.com

