Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41697FED9FD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 18:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1V79m/qtPd2CPkeGy9ve7l8GZ9xh9SScmUR42+dIKPU=; b=Ctu9EW9YJnNxYm4udl+o4XnJSR
	BVkS6i/JAE+6kb8EO8zJX81nWDvaP+dR6Vwx0U7DY/J7aAsBXRZKnKJC4zVgheLI7rWMZZc1nun65
	lfde7plBDJhHkKyuwBDQmXRXyiaJoUP1vjUHZPjddW94mrJX1XVdMLACBrCC4BbQPSn7V8TZmiQrA
	Rc/ruTEUOA0nRv1ZBMdqSpdoS5Xr1TNEXJGTQBni8+isVyc+cih6c8QEHXd5aiEt3XZwuX/Xr82i0
	KxCgpi7zU+KHeLNMwI5TLT2Zt3P8zOgH5UjhVepi7iW4+NRul41Y+NmS/SoO9aTpDNw6hOMx8o3zU
	SuMYEsWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ykz-00000006znj-1Oum;
	Tue, 17 Mar 2026 18:03:05 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Ykx-00000006znH-01cQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 18:03:04 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5091ed02c54so72681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 11:03:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773770582; cv=none;
        d=google.com; s=arc-20240605;
        b=Mgj71Xc/Aki6kby91SRppiq49RceUKVeHX9XJUB8bg5KyoXgeoHme8ihSQmMPY+3FB
         IiqXL1zki+hY6tRFB3tf/M1+yuGhIkA55ugWcuvmn3KokSS2lD3NP91RWJST+c1OHMTH
         jtwlK6okINNLPnLGxb27bCrVNWBzdJWmU8rgYzgE7bzTtdsksQnJ5ge+SLAa1uywuMTC
         9YUYGA5pT4stt7W8wojnC/0ENp3assLDKEG+Q7dlUyYIGJUsbZEGLrWCk+wy1RCEecGl
         xCu8wWXN8rgLwLtA1c55lBKZ+MuawOODs5MGp6CCDk023Pkgbd6r5EZrTQZkbwskJUZZ
         PidQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1V79m/qtPd2CPkeGy9ve7l8GZ9xh9SScmUR42+dIKPU=;
        fh=BybxUIkGkbzV6ZcNH572xizG3PrwiuFykWMx8aSJDc8=;
        b=Hvw7+gVxV7YjiMWivGq/Qufkuk1ZWhP5JLpCMd6nNL3Zp5Ek2KFGAuDtYccHs0M8UF
         WavsXxRoLQUR8NlTrKs2O21MXqtnApneMACOoRFy2/C+1PtE7tgbi3gV1e/Jsh7uyksX
         8hGA45hNTfOSC884L7Hnjhx1nOZVVS8rOwAW2dXGAJdf/Cs9BqxyCLqapPFIehdkWaWK
         kfGFTVJdfWyTl8Ut8EIAkXvELodw+kvSjYK0txw6jdR9IdHN5JPRJgRepNRffmx0dM6v
         c5cTshv5Dp0S7pWTPMMfUoP3sW2pmsrZRRk3ItabdRzYyyknXHZp3LuLnyIKzko1WJaq
         OiaA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773770582; x=1774375382; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1V79m/qtPd2CPkeGy9ve7l8GZ9xh9SScmUR42+dIKPU=;
        b=Ued9vZaA06hj6hn/ULphysQldnDOgWgAwGFA9oo+nzujX5rXIuzHKsMw8HLNhxE/RT
         3z1VKEtjeqXgUBGSEg8UjuK1D5kIVdws8s4hfUboA70HaPJf3jwhOC8+h15AyX6S6xr8
         oSQcCkmJZeJGdhI4hNERted2+vL7H4VrK+HXA7uiEfF72Qz37pEbvgPPc4bj/OeXWl1l
         tJj45eMK7IHb53jx/UuwAybxd0JH1NXtEaNZzqAHkFhnaNmAfLHqKsXPE4GeywD39M2i
         aDM8uBlrCZ7egY8nREIUA0RB/y8MfzXwnANF8PAZWRAldZpyL6wChwJxdRb53NxPRHM2
         KGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773770582; x=1774375382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1V79m/qtPd2CPkeGy9ve7l8GZ9xh9SScmUR42+dIKPU=;
        b=ewnBL5jWbwAQx9QiMqUUADmDq5ow+aBK4D8CV3CDZCANq133gcLjCBYCoxOKCOWH4W
         STNO2fgWVsHE/6nppd1E6Ad9oj6tgjBOyJs0wvCRLLiFr5zIlxnAerjo5H8KFLk0DOav
         CMY4XleSMYolzWkwWDw6ldcCygPxpA8j1Uf/DuaTYvDSNSQ0BIVpSlpp65lrqIUT3qkQ
         lVUMyCd+oLRyTVysppbNZ+tnqDjM0DgYU/x1lKTcPgcshrq8OwZmRRgiMcpXVUgon8T4
         vtkKfArj54dpdYeaZ1hcEUG88QnWcf8mwyctnUvOt3stPuu5nO5AnFQFszoycRNr9ZkT
         oZfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXoCPw5/VUc3fSt+tmEH7oNZMzqmeFdWP7G7KmS6D6fvT1aklTXAg3Dmd4Kh4WJ/AOW/dZPodJSkzLeZ98ve9X@lists.infradead.org
X-Gm-Message-State: AOJu0YyJbtovgAIsLN3wHJAigyE3dKvuk6+7cCEN5dOJG2jycoaoKYaH
	6RBglUzWazxbq2Z1GkmOygcZ0Z5GSTxAQuWI9mRNqREZIsXLQ/Qdif95jo5BRoY5Cqi6SknML0z
	qMRSO8EjhKhrjr3NCyj9q6vRDJ5ddCL42VersHojf
X-Gm-Gg: ATEYQzwVkTmZ7/GxhNTy/JXB8LXgcXpjA9ttO1M35bvFK87wJF2EzKSr8Dol3pW4pSX
	cT1G9G/wOJEYTRGX2u0SainVDKExwtgtcTQiBCYzeXdy2wgsDh1u5gH6WolFM+YfhTtLspgDxqq
	9ixyjjyKT56axBgzoDsShTSo57ay0quRu+WMCuZf9zqC8wxRnpKzo+v5DW8evPsTKVuWX6MZRsU
	YGu672odJns3Cv7HvduR8mIr8vQuGcpfpxFEaXaG9rtaWwWTej35qiuQ4O1SSkWsafENRI7hhb+
	HWSP9iyS
X-Received: by 2002:a05:622a:178f:b0:509:14f0:bff2 with SMTP id
 d75a77b69052e-50b148054aamr1140381cf.12.1773770581019; Tue, 17 Mar 2026
 11:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260316175451.1866175-1-maz@kernel.org> <CA+EHjTyBtM5idopKisJf_e10aRifubtKEpbkjkEnmrOqa9-SPw@mail.gmail.com>
 <CA+EHjTy=MCgeKoi9sA_eDuiODucOdMP5m4CAciUW=rStgJggmQ@mail.gmail.com>
 <86tsue6ezy.wl-maz@kernel.org> <CA+EHjTxF9fLtjdTtJontFuziRsgGMeE0bvEjHYqr64hDK3wLVg@mail.gmail.com>
In-Reply-To: <CA+EHjTxF9fLtjdTtJontFuziRsgGMeE0bvEjHYqr64hDK3wLVg@mail.gmail.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Mar 2026 18:02:23 +0000
X-Gm-Features: AaiRm53dTl6Qirg4e0url9XntUW8jOUcL89COPt1hC5dsOyIpA9_l2n6qMF9Tr8
Message-ID: <CA+EHjTxUmBOK6fMmYcw3QR8V5rb-KM9vCN-deCeeB2QvDAOO2w@mail.gmail.com>
Subject: Re: [PATCH 00/17] KVM: arm64: More user_mem_abort() rework
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_110303_053442_B41D24A8 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, 17 Mar 2026 at 17:50, Fuad Tabba <tabba@google.com> wrote:
>
> <snip>
>
> > > > The series in hack/user_mem_abort-rework is different from this one.
> > > > Here are the first few patches:
> > >
> > > And I just realized it's because they're based on _my_ patches ... doh! :D
> >
> > I thought I was clear when I wrote "I've added my on take on top of
> > it", but maybe not. In any case, I didn't feel the need to redo what
> > you had already done -- I don't think I'd have come up with something
> > better.
>
> You were clear. It's the reader's fault, not the author's.
>
> I'll send you one more patch that might be worth adding, but this
> looks great! Much easier to reason about. Thanks.

On a second thought, let's stop here. I was thinking of going ahead
with guest_memfd abort, but let's see how this one goes and take it
from there.

Thanks again for this!
/fuad

> For the series:
> Tested-by: Fuad Tabba <tabba@google.com>
>
> (might as well repeat it here)
> Reviwed-by: Fuad Tabba <tabba@google.com>
>
> Cheers,
> /fuad
>
>
> >
> > In any case, I'd appreciate your feedback!
> >
> > Thanks,
> >
> >         M.
> >
> > --
> > Without deviation from the norm, progress is not possible.

