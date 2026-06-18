Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD1BCD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 07:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtYT+I9662XplkfCGmvghjrOBbhri8Oyb4z6FWIkm7k=; b=d1zrRMS8AU2rDsqElYLtGrXM1Y
	aZLDvj1E8+6m4YbE9JpGi9DluNsDU7xb5CQvIuXo89tiNLuXBkMV6br1h574xXxXlBlWZ/SamUbBY
	RqXRxo41V5w7grR5Yn9UPQA/Bo58NdA1+VBBOsd46w9QueG5IiNWnU+ve9CUs9roFQDm5wo/UGPvK
	BdbJ2MpZLHNJnkeL22h/srDzy1q51du05YkdHhPEOTVbk48odmhbFP1fDplx0oj/dozKwVeHCXIHO
	tAw6CBI0fW1QdlylrXj9FWBbPHzicuJr87F/R4WZeAzOZ0Vu048cHcltnAduGfRR+4CXwcAfK2Ctp
	JS6osSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7bO-00000000o7J-2kJf;
	Thu, 18 Jun 2026 07:55:54 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7bL-00000000o6w-1hrN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 07:55:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-51790c0a692so7412771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 00:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781769349; cv=none;
        d=google.com; s=arc-20240605;
        b=je/UdL2C+ut7UHysa5yCJDMRrigAMGjBs6ITY3TLneQ6dpPO5SjTLKWyTuHCPNbTI6
         M00wJh48uWQc2bToSPB3rJ5Kqc2ElNt1nETxcRPA71ms5NDRIoxQheQc0wbHBkZSCmwS
         49xXYuIsgMBj+n5C3N8SfDe/XsrecxsxWvbrQjJyIf7FY1nar+lLL2cp5VrYd7QeUWc7
         VYJVL/ADPzYE5yxUNL60xic6sQflP/YLbmLuYWsfwrMUXpuBgr23IgygkXkGynFpAZde
         dt6VMKnRwvepM4lkVyxiRZVzTo6lU8wvrSqaxm8QJu0gYt94WYvIiSO2U3/6sqWYk1MZ
         NEzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UtYT+I9662XplkfCGmvghjrOBbhri8Oyb4z6FWIkm7k=;
        fh=of7um8tNSOcMXOsryXBKrR4bmQoAZJK+9ObJ7a4xXXM=;
        b=REjdhP+8nZk7L5wSkILCptXTZCBN2kyx2aJUrtUTd3m3x02rvX3aZzvVB/FErXnP8z
         XvXabAZjMmWtrQCeKZRSH9iedstgNNPzZu9XrDqVqtWKKo9suiZGzga44Pb9Y+nX3TGb
         KoC/taolY1A0SwzvjCn3eYGwo93K159sGTt8nJr+t8jOn4X07f7XPGt0V2eieM1fcIYG
         Z43+8IyKK2lOudbz541YtlnqC8k8qxPYlUR11/3EFVhFnJgD3aaUR0FjhB3tlVxWdM0u
         Hm7ZH7mIX3DOn2+0RkF8pt9eWOLv2xyrp1jR7f51XnUfxHC1KC6Ld9hbC2mq1uPfnHje
         oymQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1781769349; x=1782374149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UtYT+I9662XplkfCGmvghjrOBbhri8Oyb4z6FWIkm7k=;
        b=XIDQQutaSxgpza34KQ7rb9tdbeJnFjpArE8kNXlIg73wOWY3qX3tPSuXONfq8tQLux
         PBZqh2CVxcv3rnWvopYs7CvuNc//XWu44StNnGBxM6WmZPmfuViON6t3S0CcCw1iAalT
         dZz73+eFz54FFyd73/Q9ixcdRH1WaOy2Y0VVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781769349; x=1782374149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UtYT+I9662XplkfCGmvghjrOBbhri8Oyb4z6FWIkm7k=;
        b=FDchTLS9GgSSoQkMgWqQV659/CEanWQWPSG//v/3rAaCTwfrHAE3FxhYTVBhOoSh05
         xeu270nU8cHQdLFB0w8fbtmDEaUcLBftIwIywfmpOgv+iXQzef0VaNVzUy76uac33LYd
         csSxyPXDHIUSZKyEsUEi4Ty5gq60Iem1P6gkwm8lpb8EMiuME2rP9LMZErWHGzgae9Gy
         rzL4cSMH7jmzvLfb0YuVUITVcb2Tv2bSMIE/ebEJNPH0OeKFkRQcFVNd5OCLqyAGj8Jd
         yTB6nFgLHhE1drS18MUiiJkTpERZB9aVJfn4F3WVmqtreMe2kVP61W+V+t1J5MPPXHuu
         GCBw==
X-Forwarded-Encrypted: i=1; AFNElJ+X1+UCnGUo3ICEWO+EPgBk133tTfyXUJT8MGbWb6zI3s4pAukqyK3kkHMw+Zc8aVqN66QshSa/d+MnQ7ZS3q4k@lists.infradead.org
X-Gm-Message-State: AOJu0YwQcC96rOESyNvOwrt6AKat9jRIcDtz9CZqdVzKTJIUy5lOmFLI
	EtVSkTN9m3A59P78znG1I5OIVnG1m21Pb95JfctHb9YIvQl6scmFOuCTHT/SyzvLJIe6diP2F6h
	ntDTUlPog6eDUsfRdsd7ciq9IeXaWEN2yDnJe80AXAw==
X-Gm-Gg: Acq92OGrmXsEazsdC2XPok6Aqmrh+OneTRi02L3YwQJq6yW62tp4P7TbSoi1lvBqPtR
	ZODyxFkdUBxmsnuiyplTFveXPTBIYt80i49tlrxVQwD1E7vlASqwUOAVRhihTsfld46PP+e/+U0
	Et3lTmR5uwS1+OEShGapWvU/ROjv6WhsNCaqVPmv7FUiMTYKrhpRzKISwqt6/tQwysFrr9SrYVn
	ytKd5+iYLGbkixYlCRKVwBCthJlOuqAfwARcAdRQyXEuLfPxQg4esTwsjQ3VSxRmcDlVEU=
X-Received: by 2002:a05:622a:2611:b0:50e:a1ab:114c with SMTP id
 d75a77b69052e-519ac38fbd1mr104119671cf.32.1781769349417; Thu, 18 Jun 2026
 00:55:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260508142023.3268622-1-mark.rutland@arm.com>
 <54ffcf73-dfc5-417c-b9d5-6dee551f8d39@huawei.com> <CAHnCjA1dGNH07YkWupg1THAmBhW=o4C+uhHbbcRX4edMj2rmEg@mail.gmail.com>
 <ailagpgcDGVoXgm0@willie-the-truck>
In-Reply-To: <ailagpgcDGVoXgm0@willie-the-truck>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 18 Jun 2026 09:55:20 +0200
X-Gm-Features: AVVi8CfN7euc24_h5NnkYII56Axkn9eu_WM0CSNVpLh7Vo6KuBgYFBpGEkiQEb4
Message-ID: <CAHnCjA2+LeDt+_i44dq--73N85qpiCupa_82r0Knm0_RFDKTQw@mail.gmail.com>
Subject: Re: [PATCHv2] arm64/entry: Fix arm64-specific rseq brokenness
To: Will Deacon <will@kernel.org>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, ckennelly@google.com, dvyukov@google.com, 
	linux-kernel@vger.kernel.org, mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_005551_618820_1C2704B9 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, Jun 10, 2026 at 2:37=E2=80=AFPM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jun 09, 2026 at 02:04:23PM +0200, Mathias Stearn wrote:
> > Is it possible to get 411c1cf43039 backported to 7.0 or was it omitted
> > intentionally?
>
> You can send a backport to the stable maintainers:
>
> https://docs.kernel.org/process/stable-kernel-rules.html#procedure-for-su=
bmitting-patches-to-the-stable-tree


Who was that "you" directed at? I'm not used to the kernel development
process. Is that my responsibility as the bug reporter / interested
party, or something that Mark Rutland, author of the patch, should do?

