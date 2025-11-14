Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B89DCD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 00:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=; b=JC3KshQGNrovPQuMEeU82KsQWH
	OMxALwfBIYmsPRFrq3RjUDXT7E607hrHZSox24TDtMVKiG3xg8qNKHvqgDWGVZCnKYtOTiTTF9gmW
	Izr4b5iMZsvhvaeubP/Af5bMmsvgPPjszmDMZov7G4uX5Mz1mWT/aRbi8eUzK+Dn7Scs+Vcj+/0ds
	u9t3FLUpdmTMfg3cLM7C5G5GFodEld4vIBG14dl0T36e+Mfxzpn531qN/140I0kX/lqLn0nCR5FNN
	rD8Qcb6AEkOVizjDmyiNnlZlSm2qDXw2+kyR5ZqlH8lT/uiRQvJA0KW+3zK9dX+p8Q1jgqCNafDnB
	VVe9c35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi4B-0000000BMYV-0yWO;
	Fri, 14 Nov 2025 00:53:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJi49-0000000BMXv-0dTa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 00:53:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4770d4df4deso15325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 16:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763081607; x=1763686407; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=;
        b=X/Qd1mv8OTSLyse/pRkEw02FfuZW0Me5moje+fWykVBU7fvwfsoOEHEoyhOEizyChZ
         8X/0UDITSGh+KOHHXu8nLuBr7Cx6q094k8MBSaEd8v/HmpUYKrxtaLI+ZnW9tsxnaBZv
         mfIvVD8O49bYRyvMTm5tS2oxtlNWUI+7xYBbwmREvaadUmpe4bu8WxiUtJbkTj8G+yVz
         o6fhhO6Waq39n5VL9rqC3dxzV0zxTm2EY3Q37LS0VGI4xAvlH56SSKgziz46iamAKnmx
         9WGZgFC6jYuiQa4JJ1CbIwnc1134MLh9VedE4lzhu71WUDQ6ZGvO52MgWooL3ACGRhS7
         i6mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763081607; x=1763686407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sk2uMggCq1ckhCBdGx9muJo7+MWiHKvDO30mLbByhn8=;
        b=NPo7I2mCnl6rhNdxr6LwAg6IhJWimxRlFd+kxP7HKAOszwcqqS8K/1TaxuRxWqfqWo
         5+Jv02wX0u6mMUPWRQU53wq8oWBT5/eanIM/YiSW96bTuQUbmVewaNGU0dtmFtKQ6nrG
         onZEzy7jScwqN6wK4FF50N1+ei8O/9Z2GjcAIwfPqHQGpBZaRC3wgM+giFm1wXXiPpdm
         E5FR68d8BikpgAq8zbauT73Cx3t5UgI+xE6ixELQ1XpMHQ8eDMRKfcUSZ0xuMTwYg3np
         3F6K8ZOkp8H5y6ba9FAfyItRBFbMHskLumli02UVLBe+1gtP6kN1x+SdP7sm3/3Cph/b
         uhyw==
X-Forwarded-Encrypted: i=1; AJvYcCX1w+y/8d4QqmuJ6C88gARA0swyMvfhwEXT28YMO727dRvLOliKJJOSHmqBaiJY3LAYoBV120c2XSpxLVrOH16Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwZJVJEeiDwnu+6NwbA6VB2SPqIsjzvSGcDRrndJjPpHXqGlusW
	gK+JXXlBNHFFXRKUQKMxRGXTfMFUTVKTM53l1eyo0nCPP3x1iBNQLZOQ4mV8IiRHtaza04Xfhbh
	GE8pWkVQm/N2A8YLqp0z17GR4VnpTfELhTJEsOlhH
X-Gm-Gg: ASbGncur38B1ar/+OvXNq5PHUODjWdyyd2FT5biFeZwNUsSrfgJ5tOvJvODhOHyl0C3
	FzC8RNujuyPvKCsqzY4O2YT6UwJBGpyJD89MRsRF/DLHsh97LHQGR7Lxt9oTe+9W5+a75ld4puK
	x3J/uZqNcWfOLxDSxcYymA92UEQJPcykqJVYRxy6gqkWM/lu2DOInRXLJ6CczCvEL0BAxSgsfPr
	I8EfdgIQIfnnyy+TYER+MB/9DES4GXTlR7mVntj8Jq/C1QkMnVZisZt2ayf6huO3JaAe9x4O4wu
	OonfmQri8P+4rkBRBP1iSknELg==
X-Google-Smtp-Source: AGHT+IE3vstJm3oWP95qkqRJjs5fszSUCVzNUiug16EQF/JXNPVFpZq7hEiC3L8y9CW/kpoGUurTym+p6tSTb8UVNrk=
X-Received: by 2002:a05:600c:a20e:b0:477:86fd:fb19 with SMTP id
 5b1f17b1804b1-47790b10751mr266505e9.9.1763081607050; Thu, 13 Nov 2025
 16:53:27 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
 <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com> <aRZc1SqU01Cyxc5Y@kernel.org>
In-Reply-To: <aRZc1SqU01Cyxc5Y@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 13 Nov 2025 16:53:15 -0800
X-Gm-Features: AWmQ_bmZ-_H-myZL0CSQJa9c5c9xb22UWf4fE3TvV1ETbHc5zzWFdDRoRMYRrbg
Message-ID: <CACw3F50ti1cXOLwhyEbM8OCmwEaDDXK-r3QT+qfz2=a0yCTBjA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: Oliver Upton <oupton@kernel.org>
Cc: oliver.upton@linux.dev, maz@kernel.org, duenwen@google.com, 
	rananta@google.com, jthoughton@google.com, vsethi@nvidia.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_165329_201155_7CC8D246 
X-CRM114-Status: GOOD (  13.72  )
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

On Thu, Nov 13, 2025 at 2:34=E2=80=AFPM Oliver Upton <oupton@kernel.org> wr=
ote:
>
> On Thu, Nov 13, 2025 at 02:14:08PM -0800, Jiaqi Yan wrote:
> > On Thu, Nov 13, 2025 at 1:06=E2=80=AFPM Oliver Upton <oupton@kernel.org=
> wrote:
> > >
> > > On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> > > > Problem
> > > > =3D=3D=3D=3D=3D=3D=3D
> > > >
> > > > When host APEI is unable to claim a synchronous external abort (SEA=
)
> > > > during guest abort, today KVM directly injects an asynchronous SErr=
or
> > > > into the VCPU then resumes it. The injected SError usually results =
in
> > > > unpleasant guest kernel panic.
> > > >
> > > > [...]
> > >
> > > I've gone ahead and done some cleanups, especially around documentati=
on.
> > >
> > > Applied to next, thanks!
> >
> > Many thanks, Oliver!
> >
> > I assume I still need to send out v5 with typo fixed, comments
> > addressed, and your cleanups applied? If so, what specific tag/release
> > you want me to rebase v5 onto?
>
> No need -- I took care of the issues I spotted when applying, LMK if
> anything looks amiss on kvmarm/next.

I took a look and everything looks fixed, and thanks for nearly
rewriting the documentation!

>
> Thanks,
> Oliver

