Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ED4FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 22:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdHOWqrJRE/TIxXfheRFRvDV3pWT8VAKvfg7GHpSJqI=; b=oYdLVm1Hqrhnvd/m9lzBUoNQDu
	foY8kPpfoObfSQzKBaGbK0Fcva/+4RkLABpJLcSdk1qThetr2S/0MuQTJpWlUqIotjgpe2jYznYjU
	zYVcjW8gzamq3HBooN1UCvfxS2yVJ5lwRMBdS1mIzIqM7+5S78Ixye6lYv9OnJ/H5xxKeBF7CFdO/
	opajubT8VTnT49yRz5EwTEp+iTcSnq6sJoFeZDBCBu0t/fya6xjMghttmP4eQ7Tp+/P7il87jp8+O
	E63mbjoKFPx6i2pgDTIXLw1mBVz7YJNpROPaSCkP3l8CJhW+NDNVSq90/VCcN6r6Ji/EhOMpojd74
	T4mZ74dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZzK-000000063tx-2eZr;
	Thu, 30 Apr 2026 22:36:06 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIZzI-000000063tc-0OMU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 22:36:06 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-36146ae9dd4so1235223a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 15:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777588563; cv=none;
        d=google.com; s=arc-20240605;
        b=UN1KTe3z43Uri5XDJKl39bS6hMVGr+0qsNc0EpBpCseVAfgUvSD68jt0RaWaL2hLvA
         pso60VU2cOSisaWyYVavDb1Oes76VNlMKa4eMwmnCVfrF9gVOy0I1YlZW62OJSFBWji8
         OYvb3vkyAgPlDnVeR9ukg1c+helNy8kZ6tJYEnAMmiUsH4y1OjFo/CIprGVMdjK1q/bO
         cthozDhvboDcpmpyF0nMX/6CJVMLgZMRxv88LzhFmo2IJTKHcsAkiFsEEtuoWwRo1FLb
         dg7b0PzjF8/pS0523xu/+xM3kmwA29CIhm9VpcXf/ZPln/gCsA8C3T02IZalNSyRsleX
         E8xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdHOWqrJRE/TIxXfheRFRvDV3pWT8VAKvfg7GHpSJqI=;
        fh=bHf71e4Xu6itrkkgfM+fZiACy6YTHO8+R84uT6zhYI0=;
        b=DkbJclUmhnag9JgghX/YTqm6K2ui6+9QMoWYLWpzSmIR9jf4vKKdKg1/ETASA3zwRn
         HBeN+u0Amdfr4EI6uNo5mKhK0+DzoYXkG9y9kHGovlxnUqSQbecn+a7/zyBh1n0Mh2z8
         y+hWBXUZ+nWLcK1LbgJ1ZzHC2a5DesoIZxS4dGvpkK6ctX+whJbKt1bbBp9fUMAvOU2p
         7PzVYlN6WENSDQ9gtSSu5j6wFBEty6oc6P/pgNs2Qfl9gcPT3K7tXLwvcCNzXrD4I6j9
         uik86abY0YPAyYSUPiGdT6VJYUWWFc23U6pAgvUj2VRdj+4JYAiSRdnnHxiUOeNs39rT
         QjDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777588563; x=1778193363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HdHOWqrJRE/TIxXfheRFRvDV3pWT8VAKvfg7GHpSJqI=;
        b=e3qzM+a448rwz17NeM5m0aA8OYB58++V5x3Zc8/57ppjiwEDRERYuGNlF//my/NqK1
         fNcA+b4yOMjmhCdOTPyfeuaYcLthsDl4J9xlIaciJDSo/i7ynORCui5BfF0Q72I6btgA
         vq+HcwMDMUjJ7IqO6mpylG2MJGPcbZ8LFqVmqTxZ/a+lzIUPwLDSxA4VFLBidc3DBRl5
         0vjvbfSHWcPA5154y6bvbwXCkA2SEcuCU0OvSwAPBZXgN6yNJFxn9WPq8+weVPFZW+rF
         eAEmo926gXr+CIHRBIeUrlJJUBSRXo48UP9fPGuo2hCx6sFHaw2J0Okc8J0jtmi5xe56
         pVew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777588563; x=1778193363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HdHOWqrJRE/TIxXfheRFRvDV3pWT8VAKvfg7GHpSJqI=;
        b=WmdyC0MPWOIgeb+6F9fCzkOfIlO+NJzRI6NV7Lh9Ey0PJdism7MWkawcVZYXgwTAbH
         10dvyCWleBrNvfID4A7aMT/wxn0PJfopJ3djNEddcqEyGqa0wZJDvys/qMPyih6rDEys
         edxOsF5QIpM6ZxBI8lgqyoQ/cYVudfBVut80eDQkAGWheA/txMQXqiyRW1hfQouSIOnS
         VS214eCpPrx8tcYCmyB5PJPynpg5O7igJvUML4cv4pRGioPq3pV5k3vuni3iXscP640F
         k1qjQlFzv2ue1Ez/MXrwhhrt3awVnAZQfUzdAw57rLYt202uKIkD6NkXqwEoySDB5bcH
         NrZg==
X-Forwarded-Encrypted: i=1; AFNElJ/4EltkX9HTsz7bcK2fopeE526JOj2GVHP+0HwL2ENXQd0Y2nB25o8YuUOh03dqw9tlkmobH3CyTpwxRVqYMx+4@lists.infradead.org
X-Gm-Message-State: AOJu0YzDxEbiac8UBf5v3S6wst90HCwifQUxttw/cwLgmkwydRtYz5Y9
	ywn6tMzs8Uyq5sZR4yOyCyL3QxeGk+DtnGRipoFKVVqdiz2FSRipPLchn5oyH9LJ4n78g5w0S5s
	Sip0G1VTlXrPI2rD+jX/RYpjWJwar+bVRANEWMBMf
X-Gm-Gg: AeBDieukEHuGcMxPRDEkHHhP3CcuoMkhFc/zJwSGuBDnU3p+OkifCqkHS0RUV5Up/p/
	fmTW2HuOobo8aaoVZ4L6WNK9YR7PIKGW+lJQBmvSDa8AaPsGd8pxQLKL7EWSzU6t3dzLydlts+E
	pegnlAFVh/SAU0os32j9Ez42hSTW8YRDxlMcbPWOyaCulXTPjtjjmuofWv9LXVCJ0GvoMhyti6/
	WZFfgbPgN6xPxCqC5tQm8d6/UjlSFadLpTOuIfjXAnKQPjyaGA9CsdkBUvzlS4vUO0qffG7p6xc
	kdJyDQpmYSDYf1ZDcA==
X-Received: by 2002:a17:90b:3911:b0:35e:5929:d78d with SMTP id
 98e67ed59e1d1-364c2f0a149mr5141150a91.3.1777588562768; Thu, 30 Apr 2026
 15:36:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777036497.git.noodles@meta.com> <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com> <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
In-Reply-To: <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 30 Apr 2026 18:35:51 -0400
X-Gm-Features: AVHnY4LdKYNPArKuQ8yWbQCW6t_Frk0rXn10CBP9XbvLgaV8zkcfCZpOFGUTse8
Message-ID: <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com, 
	roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, 
	jarkko@kernel.org, jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org, 
	oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	noodles@meta.com, sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_153604_636607_C7E756AD 
X-CRM114-Status: GOOD (  13.21  )
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

On Thu, Apr 30, 2026 at 5:39=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
> On Thu, 2026-04-30 at 10:48 +0100, Yeoreum Yun wrote:
> > With above change I confirmed there is no meaurement log
> > between boot_aggregate and boot_aggregate_late except "kernel_version"
> > But this is ignorable since this UTS measurement is done in
> > "ima_init_core() (old: ima_init())" and it is part of ima initialisatio=
n.
> >
> > 1. ima_policy=3Dtcb
> >
> >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:00000000000=
00000000000000000000000000000000000000000000000000000 boot_aggregate
> >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:00000000000=
00000000000000000000000000000000000000000000000000000 boot_aggregate_late
> >   10 7c23cc970eceec906f7a41bc2fbde770d7092209 ima-ng sha256:72ade6ae3d3=
5cfe5ede7a77b1c0ed1d1782a899445fdcb219c0e994a084a70d5 /bin/busybox
> >   10 17ec669c65c401e5e85875cf2962eb7d8c47595f ima-ng sha256:dc6b013e976=
8d9b13bcd6678470448090138ca831f4771a43ce3988d8e54ffce /lib/ld-linux-aarch64=
.so.1
> >   10 58679a66ac1de17f02595625a8fbeafa259a4c81 ima-ng sha256:494f62bcfb2=
fcf1b427d5092fafa62c8df39a83b4a64402620b28846724f237f /usr/lib/libtirpc.so.=
3.0.0
> >   10 42f74ee200434576e33be153830b3d55bbe6d2bf ima-ng sha256:a18856b4f69=
27bc2b8dd4608c0768b8f98544a161b85bf4a64419131243ad300 /lib/libresolv.so.2
> >   10 626b4f7bd4f123d18d3a3d8719ed0ae19ee5f331 ima-ng sha256:b8d442de5d3=
1c3f9d1bbb98785f04d4a23dc53442b286d85d4b355927cbe9af4 /lib/libc.so.6
> >   10 655a200869696207646377a58cab417fd35b09d2 ima-ng sha256:ad46146b6dd=
32b47213e5327f1bb2f962ef838a4b707ef7445fa2dbc9019b44f /etc/inittab
> >   10 81353202685e022fcd0069a3b2fc4eaa6b1db537 ima-ng sha256:74d698fe0a6=
862050af29083aa591c960ec1f67be960047e96bb6be5fc2bc0c0 /bin/mount
> >   10 ae64184ee607ef8f3aa08ab52cb548318534fd4b ima-ng sha256:27846b57e82=
34c6a9611b00351f581a54ad6f9a1920b9aa18ceb0ae28e4f7564 /lib/libmount.so.1.1.=
0
> >   10 5ea01f34e7705d1bdb936fd576e2aeb5fd78dab9 ima-ng sha256:3d2a414ec03=
55fcf0910224fb4a3c53e13d98731a35241edfdf4fb911ed9b210 /lib/libblkid.so.1.1.=
0
> >   10 22c48b4853594a08a73ad4ae6dbe6f2c2bebc6c5 ima-ng sha256:e3b0c44298f=
c1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 /run/utmp
> >   10 3024ea5021f8a5d9fb4bd519d599bdca43b7fb93 ima-ng sha256:71ea9ffe2b3=
0e5a9bdceff78785cf281cc41544474db8dc4605a06a597ce1edc /etc/fstab
> >   10 2e7530a0f56420991ac7611734cea4774b92b9ef ima-ng sha256:df4697d6994=
42cfe73db7cc8b4c1b37e8a31e75e01f66a0d70134ac812fa683b /bin/mkdir
> >   10 3ad117a863aa1ed7b7c09e1d106f84abf7d2ae96 ima-ng sha256:c19a710989b=
43222431b02399273dba409fe10ca8eefff88eaa936fa695f8324 /bin/ln
> >   10 4141c82cb516ac3c846e0b08abcd6abeee7efa1a ima-ng sha256:b75d7f28772=
f71715a941c77e07e3922815391dd9cc5718ad21f2231c2da09bb /etc/hostname
> >   10 dfcedd3c7dc3ed42e09219804504489ab264e2e3 ima-ng sha256:dc1615df9f2=
012b20b81ffad8e07e16293039ba7fd897854ca3646d6cfea0c0f /etc/init.d/rcS
> >   ...
> >
> > 2. ima_policy=3Dcritical_data
> >
> >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:00000000000=
00000000000000000000000000000000000000000000000000000 boot_aggregate
> >   10 49ab61dd97ea2f759edcb6c6a3387ac67f0aa576 ima-buf sha256:0c907aab32=
61194f16b0c2a422a82f145bc9b9ecb8fdb633fa43e3e5379f0af2 kernel_version 372e3=
12e302d7263312b // Ignorable since it's generated by ima_init(_core)().
> >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:00000000000=
00000000000000000000000000000000000000000000000000000 boot_aggregate_late
> >
> > Therefore, init_ima() could move into late_initcall_sync like v1 did:
> >   - https://lore.kernel.org/all/20260417175759.3191279-2-yeoreum.yun@ar=
m.com/
>
> Thanks, Yeoreum.  It's a bit premature to claim it's "safe" to move the
> initcall.  Hopefully others will respond.

Is it not possible to look at the code and determine if it is safe or
not?  Or is the initialization of TPM devices at boot done in a random
order with respect to the initcall levels?

--=20
paul-moore.com

