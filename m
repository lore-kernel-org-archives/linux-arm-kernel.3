Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEC6CD98E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 15:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqq5dKUgw8U/2JqRQThbBU/bf6oLY395y2woLL4ZjX8=; b=Ri+ydiqgXkw3GXQ5JC+NfdqvKq
	GPtePujGCtGhZ13W/44JGttXzaI8d1Hi/Shv5DQoqfIkRZchqyCC17IIDg+71NuWNJjd0vWBlPGas
	DpygOARSDzUHO9m6fRdAocjl7B/1dMOZSpr9Mh9cmKDfyCERPWo7G3ED6elz+GR7grx85a5bpLrDa
	JnAO6b9cQGbJLVNDPxGm5kxdUeRqxvOoJ6tqzDYqFVE8zKaHjFjhs/dRpHieULZUGnw4xVxCSAze1
	fhDvk7M8Pf2CnOpcyBlOWMsK1D9jLmKmcgi1W++LouylRwbA2vSz+r0lwHcRhqN8ulJb8ov9S5Oxw
	RyIP6bpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOV-0000000Fyc1-3fQW;
	Tue, 16 Jun 2026 15:08:03 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZVOT-0000000Fyaz-2v1l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:08:03 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-51765531803so336221cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 08:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781622479; cv=none;
        d=google.com; s=arc-20240605;
        b=hssisxa+g/lYy9YAVER+OUtcdQUoDd48YIOUSHxXM4hE0znn1To++vLFCbcw07XWPD
         MivOdkTX/bOEEeFGh2jKozb1nbWjyWocWZgP3laLa+Z+7Ws2qR+FPzWp3xfgN9yireFy
         6Aw9aVzs6smuts4+O2hZkKJV4YbH6zA4DWK6+XP/gpC+oLEHgfjOu5LtIG4eIHvq3ZkK
         nKC9wHUk9jn5XJDIQmI6IWqnAMT4RI6kM5iULpPWvbSPmOyR9kg0pBAZ7YNqc6/HlujU
         V/9GwRSRc8uqA4b2u/OG+5pGXJh7oWtaJiP5f0aVrNIlDP5ghL2VcmZvNDFstdSqZTuZ
         RL5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqq5dKUgw8U/2JqRQThbBU/bf6oLY395y2woLL4ZjX8=;
        fh=54wt2W1s0I/1SusacDvV/dQjsBpwuTUajsaUoEvizj0=;
        b=MM4h9IDzOmEhTEaYjUCn1wYWLYreQIdJhirkBgXhieHsVFMNADvRGC8vWx9nAJ565i
         fn0TkuNrbAt6UZReirhcQpccE38Pdm9xulttq+SFy2GMY7YKXXJOxv6U15ShwaFq+4Lh
         NvFrprXkz0Y1iypoGM/lluCuYlszRDTUtCcJv2TSb8GL24bxUgcQQqE7eKP7hwFIXMs1
         r7o8tFrL3gv9qYkIoGz/Whez7m8WanMFtakBsbNWR4RnGOggHACBL1oiqTZibdTmzRBc
         /vEY4u8zDIOIkq0fbnehtkQ58Yr1mAPCcvlDzuJK6d1zuME23M6aVor3tS6hL2lfhD/m
         gTPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781622479; x=1782227279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqq5dKUgw8U/2JqRQThbBU/bf6oLY395y2woLL4ZjX8=;
        b=jI8vJvYjdvWm9JpEgvRhRUlHAuqUC8CDd+tmsfOksrSHidwn3ThPxagTnmtJvjNOYY
         NJUbJdyVCbOW2hvMkPfFyUjD6+zoc84cGdN/LthCF3u8tIcyMMGtLaLf0L+5u94RFQwd
         MHuYO5nQgN8uyV1UQ4wSmG3dWlivVZDC03hcWE/1R5FJ5Ide826aRWlmBAKTCyxvR5b3
         SRQgGht871wH4+P7/ptkEJrLrVkOVeuVFQDxW3RijI7R9cVzVLpjUrlS7c7fxoYNztNV
         weaLlv/aQYTV9IQ81zn7twfEUm/Q2qmWnDC1SzLrbDSMB7Y43u3TrW4iavbziwFhuEoM
         zmqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781622479; x=1782227279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqq5dKUgw8U/2JqRQThbBU/bf6oLY395y2woLL4ZjX8=;
        b=JSxEXDINJ/P8qH0Zr56xJwYfMpm9gPlVMFCc3f7ec08jMgi75TYOk7i76C0f1O9nMD
         rLOeMUhRLUNwa/70raB0ZIliImGMWv+FVKpc8TmMT/rK1HqeurWdR5RnowJuoBVtTfdZ
         nTI8MQVHHkIAcORjhu2n2aTo3mP7j8scACBuQWaKDIWXVZqI083kfXe7+3RfOWQ+OgnI
         6gjIkdxXsPXNlDHbqvRlIIemAFvKEgeKK2Vy4jU4JIojMwozEAnjPiaLukaVwxEXywIc
         oSvydx6TenJvFkKCNLYapskp6YU6jfxIyOQLHoyUqnMQIeLAaWpbMf9djtkrtXqvyuHg
         FlpA==
X-Forwarded-Encrypted: i=1; AFNElJ/GonTk8SrI1Ki42vQY0hT0WH6C72YwPcQllDVZ+PdO90TtwccpEtPrsQQqCaLkgky4TdL6pvx9iRIJVPNdu3pJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwpsLszclYVONLM7e17AYdIEadBYR/EHrLbVhzbaNONs5GP37Wu
	M/VQpWDGZCgi1p3a8f3wC+kn3xhtR+E+ck96/2ir9985B/yc0V2uIcj8fOgf6n3NZFdcVNt6BTV
	9NtXiDINzKPGwmB+mM6/g2KRee5EqBZUIP2WxsiKa
X-Gm-Gg: Acq92OEOjFnNX6KZUgcvi3FVEMG0Zgaik1pXJte+eiuIeQk4nwn6l8UWqFF/wjUeZND
	4cYRH9DrNGHrQNJcwWmflUazdMTDBvac1gRz4LU2kMYc4BeE9bOkJQdHre4+hYBg4O6cEMvOu/i
	tuq67GVOkHHOj0hPM8caDtdU6rfdKwosjrvNRHJnQnWOFuTPqRS0F4AYuBxsH7MHt7Kb9gAGImj
	Cz/FOBDV4wGP82siXXrJKQA2ZZ8Y9pJOx5Dt0Y0bxcj/JTBStcOad1M53WUROM+qA5YRaQjOo61
	N4kIU4Tm1ibVkZM=
X-Received: by 2002:a05:622a:8c0e:b0:516:4f62:85e8 with SMTP id
 d75a77b69052e-519a34e7b85mr2617721cf.19.1781622478631; Tue, 16 Jun 2026
 08:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260601215909.3958732-1-praan@google.com> <20260601215909.3958732-10-praan@google.com>
 <ajBCazla1VoJX9Ms@google.com> <ajBWGSs6RrkRTcSY@google.com>
In-Reply-To: <ajBWGSs6RrkRTcSY@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 16 Jun 2026 08:07:44 -0700
X-Gm-Features: AVVi8CfqcSeUYuDAEnTPMC0DtKy0TtaDLxdPPAnI0OHRksFAMPBLMu228VtVFLM
Message-ID: <CAE2F3rCmGS0Q+fZkJXRfStQt0MuoRGE8Nk4PCtvFb5Vj5ZxKEg@mail.gmail.com>
Subject: Re: [PATCH v8 09/12] iommu/arm-smmu-v3: Implement pm_runtime & system
 sleep ops
To: Pranjal Shrivastava <praan@google.com>
Cc: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev, 
	Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_080801_743471_68FBBE64 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, Jun 15, 2026 at 12:44=E2=80=AFPM Pranjal Shrivastava <praan@google.=
com> wrote:
>
> On Mon, Jun 15, 2026 at 06:20:27PM +0000, Mostafa Saleh wrote:
> > On Mon, Jun 01, 2026 at 09:59:06PM +0000, Pranjal Shrivastava wrote:
> > > Implement pm_runtime and system sleep ops for arm-smmu-v3.

> > > +   /* Clear any flags from the previous life */

I'm wondering if this comment can be improved. You are clearing a very
specific flag, not just any random one. How about "Resume command
queue insertion by clearing STOP_FLAG"?

> > > +   atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.owner_prod);
> > > +   atomic_andnot(CMDQ_PROD_STOP_FLAG, &smmu->cmdq.q.llq.atomic.prod)=
;
> >
> > Should not that be done from the suspend call?
>
> I'm not sure if I understand? We're just clearing the flag here?
> We set the flag in suspend to close the gate and clear it in resume
> to re-open it. Clearing it at the end of suspend would be wrong as it
> would allow new submissions while the SMMU is off..

