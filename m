Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18B8CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yEuWOBEN/U35xXneOxk8fuulvP+81wWTxzQsKgpzxyU=; b=Po6Bn81M/eSB2TP9OoZ8jCRgtE
	W7Af/AhxlCiQ7AV5v8tQbkYLwN5ILuotcnbAdAcOtBml2h9UbJKruYAyYpX4nF0X6cZo7ifvIE7N0
	yCwqwKpxutw0UCcKHTtIXHkpv3GhTl+3jlUY52WIDbIeoPp4y7dU8GHZ26mEVoTJRPix2BXyFUvQo
	BvIC1UJJt6D6WFFKvDprxDRMSD3xmL/hxTuJ23D9glO02H2LqorVlDBGfDWgwmZrzRFzaZaat7kQf
	6iqekF21z/17rZ9WZHB9kgeVBoQy+7N05EWnntFewtAeYeLonhrq4+Ll0QE8ZZ2C2UW/YgOaEuZGY
	AqGNhi0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWSM-00000002Xqg-2mun;
	Wed, 22 Oct 2025 10:52:38 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBWSJ-00000002Xpk-3tRJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:52:37 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8923b2d9954so384415485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761130355; x=1761735155; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yEuWOBEN/U35xXneOxk8fuulvP+81wWTxzQsKgpzxyU=;
        b=D1K8nUELXPhkYffiTdCRBgWcoSK6m1D5FuUQ5oWAK/qH3BmuNoLemEYHBM6A03lvk8
         yh85ZnaaFiOdRL9r97FKUDMkDSr3V0gBGNdF2ILLZrHwNwflBWqZ/JsmUcsntV1KZccc
         urvsR/lbYf8ndv+i6O5jnC+HoRjV0t+WL2O+b6JXcn3HuTaDzRBoonPy2CBfF1DeC006
         i5bAAXmesy8qN3q4xasdutTz9g18dQWIoJdFLyBJYaclRwGi8E1ywd6PRPFCULPM2BDo
         VyE/5ZvRxSTKSBhswZ0QC3RFmta87rQC7WsBaABVyi/7MvAnRsPspig4JMC+dqO+oYrX
         T9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761130355; x=1761735155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yEuWOBEN/U35xXneOxk8fuulvP+81wWTxzQsKgpzxyU=;
        b=k1xHuRFi9g/qWiLVziI1Sr0bq4Nk/6S+edakW+NvvXW7TrEtfHLENocig1AfRLBBDP
         xAhWsB6iDL6hZ48xNL46Pd5a22lQyfD2g6+PDe7ZUzo6302DGFmyBkWR8vDSek/2UO8l
         +zWj3jdGMERV/T5omoPN29XxGmvT/Kru6ieKGhLPkDTeoIz6zxnvZ6O/G6/GyDmWwf1V
         F9Tir9jOVENLIhkoWrOOTqTafPeGrgGhc1fq16ckrHZyJEUUuGldvaw1vF8mrzNvJ9UM
         xtK83r9XzbGDfxSnnBK2alcS5adw6aiVv6XTXITR019Ob8YmfMTNP8VaLhpNSK65Q0Dp
         aLkA==
X-Forwarded-Encrypted: i=1; AJvYcCU5AE0+9HDnaBvKuObNi/aIxFD/sX7UrfWaRqdd0VYShy4/7YuOpDRwgHbs+NJEzE8uoEKsi7hgMgvwCfs4a6W2@lists.infradead.org
X-Gm-Message-State: AOJu0Yx03vOr/KlqqU4J4BkqpkSBmkpP7EKa/hb4dt7l4q8t/kMtuXns
	OfrWGtWnvHgkMYCGRbaEKivbdoElocKv431wLi+Tq3C0uUrgHFojtx/wVlr2xXD9b5pc1tQZE/a
	DN9GWlDeG+j06t+VulYTbOmJ0RYppUIY=
X-Gm-Gg: ASbGncvXDuc13mMdGr1gGfACSWSfTjTEuJey9GDMqoNL3JvK/HBJWNEndd/BHQ+nFSD
	SkSdKRi+tJFi/LQ7A1iTFDnU3h/bBzVKcB8Boqp7P/K0PraNNvoNBBPRykZ2cH30FqOe4Cla8Jp
	zqAYbNkc3Goum2QtMc45m0XVvddKGIy6gQo1Mj+Fao/Z6w8O0PjnerpLZ+8FM7hU9F66NFxB2zo
	srh2vozYSQCKDoRXz8D3f+7SaKtMnumLDHIlbGFZlNBM/l6+4+RgmY537ySPlKLOrBF1ndrArFD
	cFXOESDo7GqydslCSW0neyvS1lU=
X-Google-Smtp-Source: AGHT+IF+UfILE16/+y31/plfKL4BsKCPsgS9omTYmo7r7nqziwmbbysRvcZ1nTCNlDK4BHMGeEjCaYDlClvwVJdT4QE=
X-Received: by 2002:a05:620a:25cf:b0:850:b7ad:c978 with SMTP id
 af79cd13be357-890708f2553mr2525779185a.49.1761130354392; Wed, 22 Oct 2025
 03:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
 <875xc78es0.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
 <87a51j6zg7.fsf@DESKTOP-5N7EMDA> <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
 <87ms5j4444.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87ms5j4444.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 23:52:23 +1300
X-Gm-Features: AS18NWAP0fbsGHxZLrVjv_J-9bnvKPZdV1GwoS51_2cxWur2X2S3xT3hLu6HdG0
Message-ID: <CAGsJ_4xhJSLnXOZy4kPmnif5Paq+OPN_Ww+rPk2WO4-ADSC0Yw@mail.gmail.com>
Subject: Re: [PATCH -v2 2/2] arm64, tlbflush: don't TLBI broadcast if page
 reused in write fault
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Ryan Roberts <ryan.roberts@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Dev Jain <dev.jain@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Kefeng Wang <wangkefeng.wang@huawei.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	Yin Fengwei <fengwei_yin@linux.alibaba.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_035236_101244_22CD163A 
X-CRM114-Status: GOOD (  18.98  )
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

On Wed, Oct 22, 2025 at 11:34=E2=80=AFPM Huang, Ying
<ying.huang@linux.alibaba.com> wrote:
>
> Barry Song <21cnbao@gmail.com> writes:
>
> > On Wed, Oct 22, 2025 at 10:46=E2=80=AFPM Huang, Ying
> > <ying.huang@linux.alibaba.com> wrote:
> >
> >> >
> >> > I agree. Yet the ish barrier can still avoid the page faults during =
CPU0's PTL.
> >>
> >> IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
> >> memory writing (visible to other CPUs).  TBH, I suspect that this is t=
he
> >> case.
> >
> > Why? In any case, nsh is not a smp domain.
>
> I think dsb(ish) will be slower than dsb(nsh) in theory.  I guess that
> dsb just wait for the memory write to be visible in the specified
> shareability domain instead of making write faster.
>
> > I believe a dmb(ishst) is sufficient to ensure that the new PTE writes
> > are visible
>
> dmb(ishst) (smp_wmb()) should pair with dmb(ishld) (smp_rmb()).
>
> > to other CPUs. I=E2=80=99m not quite sure why the current flush code us=
es dsb(ish);
> > it seems like overkill.
>
> dsb(ish) here is used for tlbi(XXis) broadcast.  It waits until the page
> table change is visible to the page table walker of the remote CPU.

It seems we=E2=80=99re aligned on all points[1], although I=E2=80=99m not s=
ure whether
you have data comparing A and B.

A:
write pte
don't broadcast pte
tlbi
don't broadcast tlbi

with

B:
write pte
broadcast pte
tlbi
don't broadcast tlbi

I guess the gain comes from "don't broadcat tlbi" ?
With B, we should be able to share many existing code.

[1] https://lore.kernel.org/linux-mm/20251013092038.6963-1-ying.huang@linux=
.alibaba.com/T/#m54312d4914c69aa550bee7df36711c03a4280c52

Thanks
Barry

