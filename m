Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6963DCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tg5CSyFuy1gjgzwuVzeNqzr1hqLjP8/oZVMupaN2ME4=; b=pPinuKymE1MJwKVFcVg/Vz/vhJ
	p323y8gJ5pPaTQLnT2NyR+WOLhsGkWRXRcR9vdPkmQuLBCfN3EOYZQGSpB91keC7aJ2xa+46yBOU4
	RpcascrUOWA7zX9z3UpYZydKaZiwPe7TKUs5TISOEO7PUehi5XvBh2rBtlROivGQsmgi1QclXNBja
	yUnTA4pzCGRU6MDmzvWLbtX36xZjE1PVWR54P/3VCMbr5MaoBkfF0TJFst6kk85fYjur5Ac96sAJR
	+ChmSS+emFUoe9L3kE25uNA2barQkPuFQFC5q43EVLyKN+QCKj43gK1MkkyAXtwzLQxkfPO3Jvs3e
	9ctvYWLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVz1-00000002SpP-1Jkh;
	Wed, 22 Oct 2025 10:22:19 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBVyx-00000002Son-3L6f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 10:22:18 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-88f239686f2so847047685a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 03:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761128534; x=1761733334; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tg5CSyFuy1gjgzwuVzeNqzr1hqLjP8/oZVMupaN2ME4=;
        b=CNCg5MbzCuv0uEB2i9xaKjnAEyGynikZfLy0QDaVavAeOC6ZsU+jeeFdwCxoekAFzg
         Es+Vj0aFZMbe67cKUz/AxYNCoBXFFttk66HKSSXYVrhffBCOlnl3nN6Env+IUyH9CqLC
         EEkIMKBhdDaHvNaIqx87zr/A/xjImrZk2jx1XWhVVUzhqYqXmw+jF4HOTC/PZ7E6zDcx
         eqckkx4+XK8oMtEJ4hlhpAFg/HHYnQX+WAMdvvYZI+bFG8NTYBq35pFISEqhMXpaSXLW
         NI+XLUV0dVKGlHSqxH2U+AlnTNcX1QgKrggU+aoi1gyQ9RbvvCXZeLaJB39aBtS4Nuqi
         rMhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761128534; x=1761733334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tg5CSyFuy1gjgzwuVzeNqzr1hqLjP8/oZVMupaN2ME4=;
        b=FSdlXsHNHQUJDLA2gfQGHOY2FRrDAXvJCQWV++HK51+Wk46CdrMy/EEZJqYMX5lX5N
         BBJIalBal8oJ9FIp4j893msLCtUHXepMl92vDP54PaiBafhPi8Rma+WcNLTTvZaBUeuO
         IQ9MKJ05G6JfvI8Bkn95tqrITD2Gx0JcMqRvhZSPzv5cYityLLtALRN/fDubU/dYG7RZ
         JWdEHvS7zAikkjlH13959hkbHWiN/dUmRNMfT2Zpgs1UHC2dksKA167ePswcMp7M6NsE
         GTBzItR9Nd5DTmUJ/DywSn0w42ZDlrOkjM/l1iWEM3mJecOZZpbRW3M8N0nDSpXnM0vj
         sAgA==
X-Forwarded-Encrypted: i=1; AJvYcCVcytAuV3kKbQ5EqdjJzaWoysSTxIHQZuoss/ANkXQG3S22BAlUcb7Lv8lgrNk5RVuGbu018kP71WCT5Gk3tMu3@lists.infradead.org
X-Gm-Message-State: AOJu0YwwhKPy0DOovmTpNUM1463wtIMy5G38tLs7bUIbrH5ogWpLVMDW
	1hc5RoLuvRuZ9fO/0p+tbrJOMIiwvsJ1rWm6VoN+SRNh1Om6vvg/kH3Y0nTCDaVV6XgSBztmqtH
	rUlMSeOuxGcYLnDG2hlQPGCuwmLJ2StI=
X-Gm-Gg: ASbGncv93Cffa1gtxXmrfMlXyJ6JaXiPxogVJYRH6Jch1IPxb5mRyrAp11H76iv6yRL
	ZtLl/4c0fd7eVmHuOQLgNegtFAgDVazLfUt75kbab94Qs9pu9i8gxnH4HJ2r3PFkZtZZREGBeio
	5xPKnZdY+Pb+0OSj3cJYansaqi/HE3dBvOjs4j1qauzMBuuzHl+6T9Rj034yeMLqPppCsM4ssxm
	9sQpbiKbsgoRINfoC4ZH2Pm4Ux7oOaBa3snaiGukQEavEvt5VfcrQ7B7S1neyquW2Me1CHZ1Zpe
	zbhcvUUGg2A4PG7l
X-Google-Smtp-Source: AGHT+IHgh/2ue5XLoiEIIP3qVcbBgpSwlGUDyMrIbpcYgXG8Fb2NWv4YHZCQZ79f1++pVClCNC7jVN49zC4Kgu6WL3s=
X-Received: by 2002:a05:620a:8083:b0:890:cfbb:f9a3 with SMTP id
 af79cd13be357-890cfbc03a5mr1867383185a.87.1761128534358; Wed, 22 Oct 2025
 03:22:14 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
 <875xc78es0.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
 <87a51j6zg7.fsf@DESKTOP-5N7EMDA> <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 22 Oct 2025 23:22:02 +1300
X-Gm-Features: AS18NWBircPFuACNmjNln0NVeJ5pMiUTEtaKbz7xy8k3SeBdgLEYQqjplgyUxCM
Message-ID: <CAGsJ_4yeygfzna6SRG3poD9cXhFNz21-he9psiKvMTMG8WBgmg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251022_032215_873489_3A5D1CB5 
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

On Wed, Oct 22, 2025 at 10:55=E2=80=AFPM Barry Song <21cnbao@gmail.com> wro=
te:
>
> On Wed, Oct 22, 2025 at 10:46=E2=80=AFPM Huang, Ying
> <ying.huang@linux.alibaba.com> wrote:
>
> > >
> > > I agree. Yet the ish barrier can still avoid the page faults during C=
PU0's PTL.
> >
> > IIUC, you think that dsb(ish) compared with dsb(nsh) can accelerate
> > memory writing (visible to other CPUs).  TBH, I suspect that this is th=
e
> > case.
>
> Why? In any case, nsh is not a smp domain.
>
> I believe a dmb(ishst) is sufficient to ensure that the new PTE writes
> are visible
> to other CPUs. I=E2=80=99m not quite sure why the current flush code uses=
 dsb(ish);
> it seems like overkill.

On second thought, the PTE/page table walker might not be a typical
SMP sync case,
so a dmb may not be sufficient=E2=80=94we are not dealing with standard loa=
d/store
instruction sequences across multiple threads. In any case, my point is tha=
t
dsb(ish) might be slightly slower than your dsb(nsh), but it makes the PTE
visible to other CPUs earlier and helps avoid some page faults after we=E2=
=80=99ve
written the PTE. However, if your current nsh version actually provides bet=
ter
performance=E2=80=94even when multiple threads may access the data simultan=
eously=E2=80=94
It should be completely fine.

Now you are

write pte
don't broadcast pte
tlbi
don't broadcast tlbi

we might be:

write pte
broadcast pte
tlbi
don't broadcast tlbi

Thanks
Barry

