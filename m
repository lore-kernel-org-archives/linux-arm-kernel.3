Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E70DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 16:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2pmJ+PIvMF9iZdCIqPnjJW6ZghDHC4WOLVBAyACT7E=; b=sqH9S4ZsKF1XM/+DpV9xpyqQR6
	/2Q4ttMm+llktpsE3CWrl4rCiohlIL3zIRQ6ojPxzbI5sVqCSqhpQyXTw+bI5ANnirr8YvPs9gg0Y
	Qt83ISOT7SQN0OYs/qupgyEO7sDIL86G5Vqftcnogkf2Y4LmBcfRT+qFH/117LEF2aDv8gaorBkJL
	5v7rARTT0NH/W2ibDDtieOmWvOqByDbeEO/DM8yFRox+dInB9OJCxA8uJmj1HCL2SYW3I9hdCeuMi
	ysx+wb0XnxktxGPokgKudDHcP/r2Eu2omVPcLQvaZsjwF1SAUs8BUGpWilP2KRoflLrckbkPGkugg
	JwrdLuNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr6x-00000007TOL-1ZAp;
	Fri, 01 May 2026 16:53:07 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIr6u-00000007TNs-2nmI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 16:53:06 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-7b248750279so21912787b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 09:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777654383; cv=none;
        d=google.com; s=arc-20240605;
        b=YL4R0XeCN+x5liWC+mwuFcnQR0dFSq9bJs9p5qOro+wpcGFerjhe57rC+2R+yoTkz9
         BGiLHlIUTpVQV4XpYvJPRkKW8AEEVtVDYHjlZDfCziQo28T/PtvfSz8SVcC2eYfx1ePq
         OQIWklIdM2qhATTLyDUmzgCATmqQor6V8Lu+aNFy1Vek/hVLO71huLPboxAJboZXvWXd
         0ddkaTQl8eqOrKFyYTJMlcnPg3pkDMGNd0m6LaQA/HI4Du6l5DYpRZHjjJ8mPTNXNtxG
         v1KcZR6kkcSCKiKV+mhHRxETUrDteVkMZmXsG+PDVx07/D5sbx1Ny/30vbfsyUuhA1E8
         UiXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m2pmJ+PIvMF9iZdCIqPnjJW6ZghDHC4WOLVBAyACT7E=;
        fh=9hV7v9RKh98jFwGVSHU+6/vtxQs84dvtHBMP17OkBfE=;
        b=N2CYJHlLb/W8Cbw5uXeWkVrAnENDfdzU2IJ73iXk3nG7LNQQoPfUIlMDVWnE1ozbYJ
         iFiHr/X/nCQPZ0ZAyI4mxmbpkvlBxHHSskOL1gh6mSbZNTaO4rBoed9v8KdpNuIUoE/P
         BGA92S33hOFMO9fa2KUFOFKVv89tou7AcvAlOrN+XUeGM1PDEBoDdqhVI0YewAFOPCeQ
         zBnpaah07SbqsnawHVQrVksHG5aPkRg8RsGxIp2GFITzDbbBnYoqXkXlz97LJxbEKneh
         egegngtkQ+g1AXBad9M/NuqdEOF3uAlQoS7puKWmxvxt4Y+MnRD0ddYLcbBoUFspePo/
         T3nA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777654383; x=1778259183; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2pmJ+PIvMF9iZdCIqPnjJW6ZghDHC4WOLVBAyACT7E=;
        b=XY+EMG76icKCN/X4/U6Xx2HZPlv2uMB4RKuBbaBbanzPPxIk/r6ZORpQ1XEPOgDOur
         tzgq1ySVlmzLfmiimfjCc716h84UaRy3nkj2q8lOB2vrh0py5XXTuj2DvAvkNXzT6tSG
         l/ugiQl1aStTxpoOA/E1ArJ8eTt7rqzs7e16UHFHRqb8xhk9/4/XMZz54YmzEupVBjZG
         9WcszN+CgNXrSfQ/AfE+uujvCL1xgVCnJN5vCMswPCrMhrrG0O0X74qJym+XDLUtLRwH
         TCWjbvSmMBZfPmo6W6HSjD7SrGY04RadqZ0ejHAqNl6e04jSe+A2qs775qxP9NGzNfvU
         Bnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777654383; x=1778259183;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m2pmJ+PIvMF9iZdCIqPnjJW6ZghDHC4WOLVBAyACT7E=;
        b=DMfsojxRD8T1mXpO/fq+Pki3odwgOLvaoF4pPtUgAYtWmlmL0A4v9tK2Ec+pyk3WAs
         R3XObkhsRWj/4ApI2sy+H3lmRS+13RowIuVKu3juyy2mta88uENtm5lsUvz8P3IQT2A/
         v7A70KjCMqz5OVtYFRoFefxM+6Za60AVrbDwGx/OrTtD1Kae2loDRe3RgWLbAWu7NJek
         aKDaTRdTtG0Y4zJb76P1q1IBQPG01gsy0H5GHGJDbj9yiyEST3P04SPC2ECVjTSncS7B
         oiP/xpxg3NXwFlT8gfujJBFEzbl6+ffjmWrAK83zs0/6tHKBkkhyS9U8aNq+xUk6Xl3p
         Webg==
X-Forwarded-Encrypted: i=1; AFNElJ8hquJh6XgUb3OwPKEiNrz8HISpl6hYW5vEnjeb2IIQFPwZQhfQjTd5HFCzaHnaoLNA+hyX5RGOLKBTG8v3KGXr@lists.infradead.org
X-Gm-Message-State: AOJu0YzSHMPftr+a+f77z11VkC0CdjBIkulF/vtHNNUs5/dOVNi2HVVa
	dt/ULd31mcgFukfoFmQQDp4DgRCOz6peC4OS+YtETwi8apDJPeEruHrcDYiMMKiIGkE9qcGGJi/
	pEAFVgf3lRGCcp74x/Rkohh9vxN8Gxr8=
X-Gm-Gg: AeBDievXax97rkmOANy+vrnkeqTS9b3EEnMSyz/GTE99w8hO+JGRVXoe7HQk+Uh0X4d
	Z7rr42gMP6cdW+CuDQ2AUY3gWOnm4R9DKtqam4bbrPa4LlmP6fJ+w//0xghkcFV8N1WhhRdzQe5
	naeuF1CEgm+e+kuELW0vJq7Lc4X2k57A6OspGQjtgrC5P+fAf51qdfLivuuNZZbJsPtxHw1kQM4
	k68TQ9xEa+VNv9U4y5dT+71E4A5D9K87pmYcFOcW4T2bstrK5TfldO9VVKIIcwjcRIr8aTa9fyz
	3DIoNUtzuUKg80Te4qGwCVVoyMg5ukAPl39znEqHA8CBwNpnmUylIJ1b7fIjqLTIgBNGgzUcUhT
	lWnnkEiXcbw0FVKfqkCDqIUuIB/DHu2E=
X-Received: by 2002:a05:690c:c4e9:b0:79a:b1e1:49cd with SMTP id
 00721157ae682-7bd77126443mr1403037b3.33.1777654382869; Fri, 01 May 2026
 09:53:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1777036497.git.noodles@meta.com> <7734099f5e7fda5480bca016a9e6707983325fbd.camel@linux.ibm.com>
 <afMlgstqahnZg68h@e129823.arm.com> <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
In-Reply-To: <9f188536f09a2db30877d6bfbb84aeaf2565cccf.camel@linux.ibm.com>
From: David Safford <david.safford@gmail.com>
Date: Fri, 1 May 2026 12:52:51 -0400
X-Gm-Features: AVHnY4JVldFvGpRy8AVR9UIjGcDa3SwPwwl5jSipOcT4G7P3qCyc6tJtsxpRfB0
Message-ID: <CAGWfHUW+AX0Hpuw5Vr5iTSaJKQJ+O_4nWWmU1UR8Z_3XFctHZg@mail.gmail.com>
Subject: Re: [PATCH] ima: debugging late_initcall_sync measurements
To: Mimi Zohar <zohar@linux.ibm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, paul@paul-moore.com, jmorris@namei.org, 
	serge@hallyn.com, roberto.sassu@huawei.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_095304_765190_8B4E9779 
X-CRM114-Status: GOOD (  14.64  )
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

On Thu, Apr 30, 2026 at 5:43=E2=80=AFPM Mimi Zohar <zohar@linux.ibm.com> wr=
ote:
>
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
snip
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
>
> Mimi

I have also run with this patch on a number of bare metal and virtual machi=
nes,
running everything from default Fedora 44 to a version with everything turn=
ed on
(uefi secure boot, UKI with sdboot stub measurements, IMA measurement
and appraisal enabled,
all systemd measurements on, and systemd using the TPM for root
partition decryption.)
I too see only the kernel_version event between the normal and late
calls, if ima_policy=3Dcritical_data.

dave

