Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86BE5CD3424
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 May 2026 16:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lV+PWS6h5YsTugRvYXVkVMVA3Y637YXU6QnwmmlucsU=; b=H+CT2XxD/IIOorT0dTnTAsYQWt
	7ZaVDkHvd4lf8AoCSmzPsBIcGj1CeDYq5uAJ48GV//g8hJ/bSyrPZTY4BQ4k19NZ8a6J64HLYfvqA
	SA6y69ISHXDKkwiXQHK0UiA8Wh0DClIDr4aDIF5LXk8MwGzfmKQRPVC9r3EWm51G013fbnv/+qGL5
	qarZki3d6IG+mrND17sHbFOSG/PFRKJKltXfCzO8uSmz0DmFzfPzM1u0swMOXW/279wz1Wz0NsM2S
	9F06cqHfW1uaU1AqGkucUUsjenDQlMXtYFZm+AkjFD74ex533MNNj2/vQkn3xd7g5VY2zvuhn7RPU
	4zBc4E9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZxo-0000000BKSk-0v3i;
	Sun, 03 May 2026 16:46:40 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJZxk-0000000BKRy-3dAY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 May 2026 16:46:38 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-365313b86bfso295122a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 09:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777826795; cv=none;
        d=google.com; s=arc-20240605;
        b=jIn0GGlLnHu8BDWWra/YVShUdM0pdmT3IjCVJnGDKZfuIJf4zdmKpjLcb00VchDmnh
         jJ0ryUdBs+GkRATn8fIMmDCBoAD/LxrjlZV4qFRMthHmJpq2KwjOYJ/IaZYY+l2TobEI
         7yopUcKDekgLlU6hWnuFfz9ge/XdnUX43TBh8FkTPLKCaT9JUgSDhKDCX5zPWJGZHcW9
         6z/yc189UU6heNz/Y7qY2Me8r1snL053GeC0zQ4SKrxTU9KWKjLsKfl62q8LbG+FJ+MI
         didLqK3A09r7kpO7DdSVpCkMlcjc3nFqvN2H+x0/LnfoEJWtBD1o+SiKAtmxzRZ+GPMR
         3T7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lV+PWS6h5YsTugRvYXVkVMVA3Y637YXU6QnwmmlucsU=;
        fh=yJ/yE1jXr1xwpSmBZxbTVZhB8+msxqgU9iQ0DvuvfTQ=;
        b=PSyilwYwP1aAH8lavqs666zwm6PflfmjHg37qe1yiihXbtO6EKAOti33AfAYcOD58i
         IfM9cvz0YK9nPA9CWJYXZaCqJVUj8hjPd9Fa14sTWacqSMHFufvXsYSJ7RtNeYnjWTW5
         gGG1SBpwDjn0SOcv0FcPOM9kp2MiQ4arZZ3RaYnWqoMDeMAptOHhH+VkGb2qF1K03fib
         ASOjsYmgFrVvvn2w70/ArYQEV1ioRNKQr7FsyWBrcL7N/09yX5nIXPSTcIrhyY2XaYNs
         PZed9e9YewhpsF7zJZz/qDJnbdrz6FddwWhykbrhB9B8q1ap+i+73jpkWpVN8HGIkhzs
         3Ucg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777826795; x=1778431595; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lV+PWS6h5YsTugRvYXVkVMVA3Y637YXU6QnwmmlucsU=;
        b=ISOiV8uoJsuZiBTH6d5K8l8lx+XfG/RESUqiXOeBM4YqWt9Uy6UMFHqd4OOZlK1l/5
         ZLRaQ4xcShrcB8ZH9JYcjiavGv3pz1UbV9fQdS66E9kgVjb7OfVIIXh09vzNcoROm/hI
         LLt1e918MvpaZxK9WrXoCxFuT6Ut42KQs5jd/DT2YnLMtDXqB4FFZROFc4dZY72vCu9m
         RV4pNhjuZS6KPEDJh33MxTaoOu9qMh3TkXeH+uBGND1XSrPwkVGN2wF060cK4LHYb6SH
         QmFrhRON6JPDQ5Arc2FjH8kfJvMxBYMpvnR94i3UiXeggnamx2tlm8ABbhIn9FOjfU2k
         KhXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777826795; x=1778431595;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lV+PWS6h5YsTugRvYXVkVMVA3Y637YXU6QnwmmlucsU=;
        b=HmrafO/2V0ICJEX4jiQKZuyGh6Rc7MCImzOmswLGYRXx3fwGRCriboIsRLRT+s4pIk
         30G9FLjckeYFFWLZEcZi6djbsQ5wE4wFCsvXKoyJvOBGbPhSoVh2gV++XDoTBlhSHtGu
         7MC8/7Bm52dZTnhHt1xVjuVtZv/T8C8tFUuvmQ5tq6Jh7dologY2jpFrI71zZJkCfKCZ
         Hl4eAeN8KbjMstf0c34IpR/GnHWLGayyr3hNx5Xnq8KQILBSSRTckEUuqdajAu6y8N2k
         kFF/M7uS3s2bW3bdXgbpGQO13iXv9Ye9d9u4ksY4FdfQ3TqO0Ub0nXMhRToLOHp3Ndye
         LMbA==
X-Forwarded-Encrypted: i=1; AFNElJ/inliVntHqhNXyTVUDAZdOwUTYkWVVzhK/5cDDCH+xsBStTRJzS+tYBxNIRRN4GSZ9nUvL4RVNt/E4aHj9zTtK@lists.infradead.org
X-Gm-Message-State: AOJu0YwXYDTvNctG+2NO2KV8W4P1IwCcxZanCLIxez5z75ixQ+XdCUzS
	vn97Jv5ECC+TzUZBUryyeYz/2IhRSzA5ahfo7qdd3VwdoSsgyBH1ySoxJlxTKIXS/Gai+QohbS9
	+wpIuFG+rDlJWQV3KDVq3RntHn4tacuM/buw/yN5g
X-Gm-Gg: AeBDietoOIcp1f54eBqF6GqgjzT/k3HIDPK1kJXhJ739t14bOygrH93JO2hEr/IUuJ/
	prn3ez5uvQiedHhdvkPHxxPT0EpEhRQs2LmtVrTEIthYQg5cC4jnfqhYmEZVbMR2TskqSHIai5f
	etITrX9S4uqXW6ZLXINuxHkv6n4FFAc9qdrdqZ4hBZQ5oH+aJPtL0Is+xup5Q6Sri+lXqYo6Det
	vEUXX2W98O+6da6X6ZNoTM7Kpd/ticWsQQuSC89DzslDpCsxulYLoKqbENdJ4lGPTb8FF+UhQmW
	sxcy/hyjgbyK5YBpfgoMWi4EMTOc
X-Received: by 2002:a17:90b:3e46:b0:35e:5ae3:298a with SMTP id
 98e67ed59e1d1-3650cece2d0mr6631879a91.18.1777826795343; Sun, 03 May 2026
 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777036497.git.noodles@meta.com> <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com> <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
 <CAHC9VhRsnmPp2KmQAns5uq5qXX5EF2xQQzyfTgrPi4O9AXyPpg@mail.gmail.com> <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
In-Reply-To: <ba4bf28314b679474a6a8da6298e548e54b3754c.camel@linux.ibm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Sun, 3 May 2026 12:46:23 -0400
X-Gm-Features: AVHnY4L2at1Ee87namZ-f-yBAzCWpTyJONd_xc3EwssaGjpCZndG6MYs1AyLIxg
Message-ID: <CAHC9VhRE2kRr1fdDf6xgQgpSrtvqtP8Vy9LVGJhDZFUbzLKGmQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260503_094637_301731_D0EF1F9B 
X-CRM114-Status: GOOD (  19.98  )
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

On Thu, Apr 30, 2026 at 9:51=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
> On Thu, 2026-04-30 at 18:35 -0400, Paul Moore wrote:
> > On Thu, Apr 30, 2026 at 5:39=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com=
> wrote:
> > > On Thu, 2026-04-30 at 10:48 +0100, Yeoreum Yun wrote:
> > > > With above change I confirmed there is no meaurement log
> > > > between boot_aggregate and boot_aggregate_late except "kernel_versi=
on"
> > > > But this is ignorable since this UTS measurement is done in
> > > > "ima_init_core() (old: ima_init())" and it is part of ima initialis=
ation.
> > > >
> > > > 1. ima_policy=3Dtcb
> > > >
> > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate_la=
te
> > > >   10 7c23cc970eceec906f7a41bc2fbde770d7092209 ima-ng sha256:72ade6a=
e3d35cfe5ede7a77b1c0ed1d1782a899445fdcb219c0e994a084a70d5 /bin/busybox
> > > >   10 17ec669c65c401e5e85875cf2962eb7d8c47595f ima-ng sha256:dc6b013=
e9768d9b13bcd6678470448090138ca831f4771a43ce3988d8e54ffce /lib/ld-linux-aar=
ch64.so.1
> > > >   10 58679a66ac1de17f02595625a8fbeafa259a4c81 ima-ng sha256:494f62b=
cfb2fcf1b427d5092fafa62c8df39a83b4a64402620b28846724f237f /usr/lib/libtirpc=
.so.3.0.0
> > > >   10 42f74ee200434576e33be153830b3d55bbe6d2bf ima-ng sha256:a18856b=
4f6927bc2b8dd4608c0768b8f98544a161b85bf4a64419131243ad300 /lib/libresolv.so=
.2
> > > >   10 626b4f7bd4f123d18d3a3d8719ed0ae19ee5f331 ima-ng sha256:b8d442d=
e5d31c3f9d1bbb98785f04d4a23dc53442b286d85d4b355927cbe9af4 /lib/libc.so.6
> > > >   10 655a200869696207646377a58cab417fd35b09d2 ima-ng sha256:ad46146=
b6dd32b47213e5327f1bb2f962ef838a4b707ef7445fa2dbc9019b44f /etc/inittab
> > > >   10 81353202685e022fcd0069a3b2fc4eaa6b1db537 ima-ng sha256:74d698f=
e0a6862050af29083aa591c960ec1f67be960047e96bb6be5fc2bc0c0 /bin/mount
> > > >   10 ae64184ee607ef8f3aa08ab52cb548318534fd4b ima-ng sha256:27846b5=
7e8234c6a9611b00351f581a54ad6f9a1920b9aa18ceb0ae28e4f7564 /lib/libmount.so.=
1.1.0
> > > >   10 5ea01f34e7705d1bdb936fd576e2aeb5fd78dab9 ima-ng sha256:3d2a414=
ec0355fcf0910224fb4a3c53e13d98731a35241edfdf4fb911ed9b210 /lib/libblkid.so.=
1.1.0
> > > >   10 22c48b4853594a08a73ad4ae6dbe6f2c2bebc6c5 ima-ng sha256:e3b0c44=
298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855 /run/utmp
> > > >   10 3024ea5021f8a5d9fb4bd519d599bdca43b7fb93 ima-ng sha256:71ea9ff=
e2b30e5a9bdceff78785cf281cc41544474db8dc4605a06a597ce1edc /etc/fstab
> > > >   10 2e7530a0f56420991ac7611734cea4774b92b9ef ima-ng sha256:df4697d=
699442cfe73db7cc8b4c1b37e8a31e75e01f66a0d70134ac812fa683b /bin/mkdir
> > > >   10 3ad117a863aa1ed7b7c09e1d106f84abf7d2ae96 ima-ng sha256:c19a710=
989b43222431b02399273dba409fe10ca8eefff88eaa936fa695f8324 /bin/ln
> > > >   10 4141c82cb516ac3c846e0b08abcd6abeee7efa1a ima-ng sha256:b75d7f2=
8772f71715a941c77e07e3922815391dd9cc5718ad21f2231c2da09bb /etc/hostname
> > > >   10 dfcedd3c7dc3ed42e09219804504489ab264e2e3 ima-ng sha256:dc1615d=
f9f2012b20b81ffad8e07e16293039ba7fd897854ca3646d6cfea0c0f /etc/init.d/rcS
> > > >   ...
> > > >
> > > > 2. ima_policy=3Dcritical_data
> > > >
> > > >   # cat /sys/kernel/security/ima/ascii_runtime_measurements
> > > >   10 0adefe762c149c7cec19da62f0da1297fcfbffff ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate
> > > >   10 49ab61dd97ea2f759edcb6c6a3387ac67f0aa576 ima-buf sha256:0c907a=
ab3261194f16b0c2a422a82f145bc9b9ecb8fdb633fa43e3e5379f0af2 kernel_version 3=
72e312e302d7263312b // Ignorable since it's generated by ima_init(_core)().
> > > >   10 4e5d73ebadfd8f850cb93ce4de755ba148a9a7d5 ima-ng sha256:0000000=
000000000000000000000000000000000000000000000000000000000 boot_aggregate_la=
te
> > > >
> > > > Therefore, init_ima() could move into late_initcall_sync like v1 di=
d:
> > > >   - https://lore.kernel.org/all/20260417175759.3191279-2-yeoreum.yu=
n@arm.com/
> > >
> > > Thanks, Yeoreum.  It's a bit premature to claim it's "safe" to move t=
he
> > > initcall.  Hopefully others will respond.
> >
> > Is it not possible to look at the code and determine if it is safe or
> > not?  Or is the initialization of TPM devices at boot done in a random
> > order with respect to the initcall levels?
>
> The TPM is normally initialized at the device_initcall, except when other
> resources are not ready.
>
> (Abbreviated) AI explanation:
>    If the TPM's first probe succeeds at device_initcall with no deferral,=
 IMA
>    finds it fine. It is only when the TPM is pushed onto the deferred lis=
t that
>    late_initcall can execute before the retry succeeds, leaving
>    tpm_default_chip() returning NULL.

I really hope you are using AI only to phrase a response and not as a
substitute for actually investigating the code and determining what is
happening.

Regardless, assuming you always want IMA to leverage a TPMs when they
exist, your reply suggests that using an initcall based IMA init
scheme, even a late-sync initcall, may not be sufficient because
deferred TPM initialization could happen later, yes?

--=20
paul-moore.com

