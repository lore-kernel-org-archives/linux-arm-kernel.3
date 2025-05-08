Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 789A8C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 16:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM4QjkPCoOZz7ahD1Rov7Pc15g+3o4zNeRGOhW1N2W4=; b=SspzAmkd68ckosKGei1Gc6dnYg
	ZIILLdgS4Vp3PbJkjLSTQoU6Dm/4ZOSW1diBwEvLxgeeB/r0VMFiekpNaMcSCzhbtkNe0GoERC1OW
	igWDpIDkJsZYpPz3qs1UOfQVdV3WHcwJdCi9F/EAkcMK4rzj4YDXQG8V/jIP5D8Woe8E/Lv3M/3rs
	tnIzUsGNBisNwC8c9NqxPlwIoOEa7QDilxmu/7bdZWkJBk8sCghTRzwVkHFaCeJ6hwquUd1Nxqclj
	vhBUGh4NtY4q2Zh6qaq5wLuvsYkZc95kdrZjhd/HE1vhUYEo0g6a3cSjz3wjtJrJGXADFtD5OYw/E
	zSjT0UzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD4Cy-00000001IkT-2RpC;
	Thu, 08 May 2025 16:34:52 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD3Qz-00000001B5J-0xNN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 15:45:18 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6f5365bdbaeso10780496d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20230601; t=1746719115; x=1747323915; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM4QjkPCoOZz7ahD1Rov7Pc15g+3o4zNeRGOhW1N2W4=;
        b=1kQjPvN7sgyfr54KwKg2CAkWP33xgLXgvQ6/yq4JiU+FTuP0WOcAlZMQ1z2dKukNlW
         1Y7ERdXnz/0Cm4uTOM/IOCMkIgQrFSO/hdUA/hLqu0RK3fusUqvRPYWMIQFQRDEW8UlZ
         Kp6BrhnsTuuh5kANZGhPu5H4PwrP6IwOWj2WMt0ARpnnj9iI22zPIcn52jHCUgLHvZ8Z
         R60zVVHSCeyJYRjXVu8I3D2uR/XVxolQIPagqs0ArgqGRJd46AOPsRusl2Io63SRCEM6
         B4BOWO5RKRkwlZUw0iNfWZqhcnz/ZqV+5vy4JDOgyNOSap6odWh0ARoo/Fgw0FzUlBar
         /NUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746719115; x=1747323915;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NM4QjkPCoOZz7ahD1Rov7Pc15g+3o4zNeRGOhW1N2W4=;
        b=cGcH+dcDI/Y5UozO61SRAWCuelEgB+vkIAccT0F61lftw3ginbAdwGl4JhvJ73cvmD
         nzVIHjlsq5OgrfhyU1HEJBkmnjKX4/NlSnysWgcKQuXS0iSfLbrD9MXn5zziWTIxSamd
         OpK8kt6uNEN8t2oYWCeEChYfwLkBov4inPGCPnBmtzUPMUAPXSQbqkVhHL7K3wdCti2h
         FNd94BBGxjMhgrOwdJsDwO7CWFi5mL3CmA0iJpRWHE0JWVTffhPyEEN313L3ddMAUSBc
         hfvt+cTYyALatBbpxHtmFyBsn7gGNdW96FrUvSHM3FEXQhFQh/HMrnXVuEc61AXu41SH
         qvKw==
X-Forwarded-Encrypted: i=1; AJvYcCW6d8ngGrq53heqtXEitLwY+AfI2ZhTtRilYmVq6IMfTs9+zrsKjYPA84j0RhDWKFI2KcukleNwPaYyiBlJevgM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8EYFE7Xz4GyFBPnmHptDg9ziShJggAyB3Phapj/dOMslEPrcG
	3jkb3Nru7kb8ZcKrvWnRqGKGVsOCcPh04JNZPcnXuMgNEO7wVuL3D5DvL50aMmlhGJj3ZD0wich
	RqOHdnk3u3ZYofIlhr+hOZ8E38Gh2rNekmLL0
X-Gm-Gg: ASbGncuo18YTncUcOkTh7PpnTFIsLx0huvHFl4ooSwwOh+PCjcirl8p0pytpPvUgMIK
	5FJJ2VRz2CF2SsSkllIlWf53OjJTD3RJEz/emXtw/HZILY07kc4pleeBFl0XqNQCDR0CW/1/W6q
	+uuDboz6bqJhC2mkTk2k1Ob3xAxzydhELh0mCC5anKd3DLzMfqX1MHxpc=
X-Google-Smtp-Source: AGHT+IHc5QpsocWh4+JhJxyePGK+eK7xc3hc4CKN9/ujajSYCJIlTH83nwZ4fer3bYFp280RvLfeG7NtLclp+yhwbtI=
X-Received: by 2002:a05:6214:20ef:b0:6f5:374d:3cec with SMTP id
 6a1803df08f44-6f542adfef8mr152122036d6.38.1746719112652; Thu, 08 May 2025
 08:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <CA+AY4XcaJa1_U3qXQUBj4wZJYc9hKmRX8FTNeDvV2auEnC_WrA@mail.gmail.com>
 <86r017h00e.wl-maz@kernel.org> <aBnNXyJn818ZEKOS@google.com>
 <8634dfh47q.wl-maz@kernel.org> <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
In-Reply-To: <20250508-spectral-sage-whippet-4f7ac2@sudeepholla>
From: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Date: Thu, 8 May 2025 08:45:01 -0700
X-Gm-Features: ATxdqUHLxJTSxwoqFpk9lA8TVBYoTMM9oR5V-VvKoxrBxJB4bep25PWQBicEw1s
Message-ID: <CAMP5XgcCg+kB7tPwSYUcjfZqR_734cGEs_KX4st9SQOVLBV-Yw@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Restrict FF-A host version renegotiation
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Per Larsen <perl@immunant.com>, armellel@google.com, 
	catalin.marinas@arm.com, kernel-team@android.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	qperret@google.com, sebastianene@google.com, will@kernel.org, 
	yuzenghui@huawei.com, Per Larsen <perlarsen@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_084517_297768_10B98D8B 
X-CRM114-Status: GOOD (  26.31  )
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

On Thu, May 8, 2025 at 2:27=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> (just adding some additional info not particularly impacting the $subject
>  change implementation)
>
> On Thu, May 08, 2025 at 09:55:05AM +0100, Marc Zyngier wrote:
> > On Tue, 06 May 2025 10:29:41 +0100,
> > Per Larsen <perl@immunant.com> wrote:
> > >
>
> [...]
>
> > > Asssuming we drop this patch from the series and apply the rest, the
> > > hypervisor and host can negotiate FF-A 1.2. If the host then calls
> > > FFA_VERSION a second time to request FF-A 1.1, the hypervisor would
> > > return version 1.2 (without this patch).
> >
> > Why would it do that? Once a particular version has been negotiated, I
> > expect to be immutable.
> >
>
> Not suggesting that we need to support this, but it is technically possib=
le
> today by loading FF-A as a module=E2=80=94first inserting and removing a =
module with
> v1.2 support, then loading one with v1.1 support. It can ever throw error
> as not supported to keep it simple.
>

I'm not sure how what you are suggesting here is different from what
this patch does. This patch does not alter what versions the host can
negotiate. The hypervisor already disallows negotiating a different
version once has_version_negotiated is set, the return code just
doesn't always reflect this. If you try to load the 1.0 driver in the
host after unloading the 1.1 driver similar to what you describe
above, then this CL will let the 1.0 driver know that the hypervisor
does not support 1.0 (I use 1.1 to 1.0 as the example here since this
is an issue even without the next CL in this patch series that bumps
the hypervisor supported version to 1.2). Without this CL, the 1.0
driver will now proceed making other ffa calls using 1.0 data
structures that the hypervisor will incorrectly interpret as 1.1 data
structures.

With this CL, loading a 1.2 driver after the initial 1.1 driver will
work as it did before by returning version 1.1 to the 1.2 driver to
let it know that _it_ needs to downgrade to 1.1. if it wants to
proceed. Loading the 1.0 driver after 1.1 will now fail at the version
negotiation stage however. This will be clearer, and more correct,
than getting FFA_RET_INVALID_PARAMETERS return codes from other ffa
calls when passing valid 1.0 parameters to those calls.

--
Arve Hj=C3=B8nnev=C3=A5g

