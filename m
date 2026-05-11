Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DC4CD4843
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyEdGT/UwThY07rJVuH5QIYg5WfjYK/VMng0MYb/gWQ=; b=Nn1A08ldqtC//zXMn+SyTlqZsP
	hz4E0a8H3cY2YPMvy8iDLXUd8pW8i3gNqsbVdTjXrfE9h1ETiOlyZmGlMVpOUjXJQo3GfJKuJnEiZ
	xfciSqzjeyAbwtvjeQMYsQKchArd3IOi36my0XN8rLtMrq9dxJ3+OVoywTUCpIE3y27Df0gwpBmiC
	tene0Mj8OvU9YvFg2fS3hX8fY9p1CrdIk9DXxs7hRhZbdaxT9JzgDUVds9DqnqHO8+mZz1Fik6aD4
	DobxegSTCCbDW4DRAJUVOIJJ5pPsi8Il8ohwRCHoSIRXhLSv4JsjY1vxS2uFWRAjR5sZhqxEjNmtj
	zxvhEt7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPCq-0000000DPMX-2wMv;
	Mon, 11 May 2026 11:53:52 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMPCn-0000000DPLN-3dgj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 11:53:51 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-50d864c23bdso7611cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 04:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778500428; cv=none;
        d=google.com; s=arc-20240605;
        b=DHTsbYfnCn6uz0036TbRTmYbqktiIcqBpQNdzpiY+yrHctUUPsEHfMXyuwOqcFv8qq
         uyvTw0RqcTrUMAVzRflt1m2SQCtpoGt2DtSsUeoUagCErEjib5BjCviHhS5nUFrqkIvj
         FZGaKC3cdSsgTfM+mTO5tTsVJlcAeIau2/9yIMsg4Ris43qTdYuwugTtwrkcTXOTQAM6
         f5JoSqPMiU/zzsZpw5/T2c0hFGQDA9NO8YvLYPXWSXDiCKe3EODPNnoXUwWJpmTBIDmL
         WsD1Zbhcyghqr3c5Z+3ix6M+d3vj17XoHLa+3WSc5IQ+jvIstH/kTNYvBntapZcJhcpi
         g3VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EyEdGT/UwThY07rJVuH5QIYg5WfjYK/VMng0MYb/gWQ=;
        fh=6ieudtMQbA5neqvHXq7patI32UHMWWpWWmlTAvJb4LI=;
        b=AUbFL/LWnsECB72GNSB7jLiZ9GgzY6zwk1h49rRkTAE68m/jr5mBSPJ5EPmT/Cre+T
         pOB+5RMoDr+r9yqYB9NKmE4LRPhmvd4dW5IK0eoVYxLua2TPAiNLeZskesT0JMP344IY
         3FeXoxUYn5+Vmkp/WulfVLOH5ETuljGQJzz4IYy1QJOHblWOn6dqo45oss1ZfdF6Stdr
         Ag0UW5RElkQCLQLn6uOK/qRbJeHBRZ1iHzNngmkPge4jVg0I0bGdh+Oy20g8smgsszX/
         6M5IkV+YfhbZjRo8Y6okcNtIjTtz2EV9V6dzeen3Jv1gsqcr4Lvc0y+0HntVhpk+qyUZ
         Ypwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778500428; x=1779105228; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EyEdGT/UwThY07rJVuH5QIYg5WfjYK/VMng0MYb/gWQ=;
        b=Wa+N2W66aL457htgNKtxsf5ARUbWHZRLV/D3wj2rzjRj/V/C+eODxpvO5goXJ2t+Oz
         Q2vZAkyiomrAiNFxhPm7AcblJ9Z+vPllvTCS5zSPkXIsNTZkULs/haqiBiQSWsXUwzBl
         NtqlO9ibF3JA2wwvQ9atOK4cwXTuYKbrs8zNa5xv6Htm8YAexYyl9RHVYaggTx47p6Wt
         XO2S9+T+WmZXAVwHIVCIfU35XDsB4xv/Quxp4p1/EA9i5nxGenruH0eqJHsu2VdYV4Uk
         aFMeP+gOAf8F4H4KZ6G8D/7otcyaBh3Wg/twHifOZC7bSKkt7ULnooiwlXnuCcwmEpke
         5KkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778500428; x=1779105228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EyEdGT/UwThY07rJVuH5QIYg5WfjYK/VMng0MYb/gWQ=;
        b=me3jLk0oJTRl2CVsWl0kw2mN2IK0YCMcPDDOVpEi8YJMIYPSe+4KnDV34AYMEgq//J
         8WM//iqws0QyVXZieGcFkW0Jte35mKzUstBZtNy2xL6R4NhfwMQFXGKvBuV11W6FI23l
         UCcLuh8l71gRN9Z0FBPJMNOWnpyn5jnzfCDrEDHJK8JfozH7gWGEf1zp2zG+1cp+Ez4P
         AQFqb8FB0ybR8sKqkF/sza8MSgLZgozs2XVKdU93tN5mh1BAVCUAIhQi37dNiALvImnz
         2nG4gnYYfz5jn4hVjsz9X1tzNwyiIMUjRCEDqn0FeS7M+iM630NTCceuqG5PqoHk8+cD
         Oh8A==
X-Gm-Message-State: AOJu0YyKWnsLDh22huhRF7/7drvACzeka3oytLvmXwKsse4if5p4Ff/T
	7r5dajRNc4NlvvnOciovimzZlcdBi8+i9HxG3ryA8m5feo8A8q20dbdB3RCoTVT4xnR55WEIBUo
	W/Cf1p8yxXbUh8X35wykiqTak/EITrHdcTeOTiWkQ
X-Gm-Gg: Acq92OHHVgrIYMT1dicITZIKkSdo7kY4SIqX3Bht8mNAr6gGK2sLQPL3b6P9VqmzE2u
	mhUCzfkH9BI1MLNI76BbRzlpG7g28flzwTKSqhTC5SOTyH0DkEJKL87ZzQy2u6kUxh4gT3cX/MK
	YB78JRI8S/zSqLUgbgoSf+v/2RtgoyNLI3qFl3z1nNLwiAzwTzUuJTZdlHpg+34X8Oazkm8jce5
	SeueHe/euq0NBAxxuHCcPMmzMBD9y8Exu0wGGBCu5jO9f1f4zFdAe9YloJf/y5gaaPPkBAF3TOI
	WBTnxkBW+v1F9RWiwUJAby38GXAJjeBRb1TPSoeldijFNbterTIc78IhPiLOpA==
X-Received: by 2002:a05:622a:8d12:b0:50e:5c9d:49c7 with SMTP id
 d75a77b69052e-514a046fbc9mr19494131cf.7.1778500427992; Mon, 11 May 2026
 04:53:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260501111928.259252-1-smostafa@google.com> <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca> <afiODW2sVMeOj3Ag@google.com>
 <afoagb/wVBJD1IX+@ziepe.ca> <afofSPQbepd_fpom@google.com> <afsQTwO3eW+Ks2fe@ziepe.ca>
 <afxlufh3t3hRe4-G@google.com> <20260509233443.GK9285@ziepe.ca>
In-Reply-To: <20260509233443.GK9285@ziepe.ca>
From: Mostafa Saleh <smostafa@google.com>
Date: Mon, 11 May 2026 12:53:36 +0100
X-Gm-Features: AVHnY4Iy01SZKx6-ZKVz0uRzPgk9VsXyMheNVJnPIgQawwYuBaPqoPjvouiwCBk
Message-ID: <CAFgf54rJqq_bJONpx85p+uB68i1oVAGZW40aZA1ufid_5fqwQw@mail.gmail.com>
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common functions
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, joro@8bytes.org, 
	jean-philippe@linaro.org, mark.rutland@arm.com, qperret@google.com, 
	tabba@google.com, vdonnefort@google.com, sebastianene@google.com, 
	keirf@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_045349_946760_E4DD37BB 
X-CRM114-Status: GOOD (  33.43  )
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

On Sun, May 10, 2026 at 12:34=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Thu, May 07, 2026 at 10:13:13AM +0000, Mostafa Saleh wrote:
> > > I was thinking more like
> > >
> > > #define arm_smmu arm_pkvm_smmu
> > >
> > > Before the pkvm compile of the shared code.
> >
> > Oh, so we rely on arm_pkvm_smmu and arm_smmu having the same field
> > names and types?
>
> Just for the shared code, yes.
>
> For instance this patch would require the features field be present in
> both, and then all you do is directly copy all the smmu->features
> logic into the shared file and that's it.
>
> > I don=E2=80=99t think that=E2=80=99s better for maintainability, I can =
look into it
> > if Robin and Will are OK with that.
>
> I think maintainability here means pkvm minimizes how much it changes
> the code of the main driver.
>
> Copying a bunch of functions into a shared .c file exactly as it is,
> then compiling the shared file with some #ifdef'ery at is going to be
> long term better than trying to mangle the whole thing to avoid using
> any of the core types and not directly share the code, IMHO.
>

There isn't #ifdef'ery at the moment, that's what I was trying to
avoid by introducing shared code.
I believe that can be treated as a library as most of the shared code
is about HW description (commands, invalidation, IDR probing...)

> Like my tlbi point for instance, it is not a good idea to rip out a
> little bit of the invalidation logic then open code a pkvm
> version. Use the exact driver code. But to do this you need to pass an
> arm_smmu through to to the pkvm specific queue management functions.
>

What concerns me is how fragile that is, any change in the main struct
can easily break the hypervisor, unlike if we have a clear shared code
and defined API that is used by 2 entities.
I will think more about this before v7 and see how intrusive it is.

> > > How does pkvm compilation work anyhow? Is it all rolled into a unique
> > > link, or do you have to worry about symbol conflicts with the main
> > > kernel?
> >
> > All pkvm symbols are prefixed with __kvm_nvhe_ in the main kernel.
>
> So automatically with objcopy or something like that during the build?
>

Exactly: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/tree/arch/arm64/kvm/hyp/nvhe/Makefile#n96

Thanks,
Mostafa

> Jason

