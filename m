Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFF1CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 05:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FsKIh8Sr2YempVn4RfoujlQjHMyiuNGVB5flJcwQHSo=; b=uKnZ0HIRe1nS84MUeMNcJFGJsb
	V0Ht8myWsAWdXMd7qwMAcWQhY2yPv0JxnKuaVzAr4/uOJHbifHoW286eeK9ET9BVcp9gIubrWW67o
	ha6p6DXRj1Zlk7WPUDGthtKM/llbpRh/NkvC9B31BZNfD0FSAJLFUMLVWLjwiKK4T53W810dDeyD2
	exMbMS4xv1d2sFh88rCizTVofB65i0OQpgOvJHiswl6UCB8b3dOfpvUy1KFsJr/uAwcszuCpLNKSI
	ndIIHDj0XJuw6lCy8pzAnrtxGCNLyCBjkmAfilfuyoNcoEebmU6HEGaGVP5Yt64g7gbP+l3B+KoPq
	G2NfJZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo3H-000000059Mi-2zqo;
	Thu, 23 Oct 2025 05:39:55 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBo3E-000000059MM-491e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 05:39:54 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-88e1a22125bso47582485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 22:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761197991; x=1761802791; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FsKIh8Sr2YempVn4RfoujlQjHMyiuNGVB5flJcwQHSo=;
        b=HRJ66O8Ol/jCsktAPZrAhNueeqciSRNumCB0qSP91fw/EAyT9SwUW2/CtWmp6W3ddo
         RAhjcweLIC2CT4fHegcVgvneGQtBaXENc02C0wsOXnXtyZUyku55UBmx1Bs458L1Q7rL
         Bjs1CPBSyqKH1yNz7dqupVhx/JR4sjp4Qb2lrZn7roxRNCoQAfS4vZXZzafWPrV6OO6x
         dpmBBid3UxpuWGoKYk1j+q3A6bq4UM0s4ZPk8+ximbrCMKJsvqKZsiReFiDvm3+rLgNb
         BE3MZbqZPdtX7ahi1vkUt9Ym6xNOQoQjC5K+lPxKY/MfxhPk/47/IajHDN/NCRxawFoc
         ADZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761197991; x=1761802791;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FsKIh8Sr2YempVn4RfoujlQjHMyiuNGVB5flJcwQHSo=;
        b=KJfVJltL+fXvp6TbYJUaak94oDRqSmS8dhQ+j9ARakhV7vzlDXwMRuYjkBQrLsB3d2
         DZhn6HazJ033GZUh0dDgR6mZviam5zFJmh/18BRjn6qkiYF0BlulSiqFgTCwRXOAGY90
         QQHSBf+89cYxIbZK8zBVdtjHAjaSjnitUUKEg76Z4x5d7gI/9y29NHoO9jQ46v8fk/Li
         CuLh2QvF8AEm5RLeYLDMvhbYdksbjy3tl2NTEEMxATn54U52PECPCyQkJqzQy6UWKJzz
         afIyQTtM4FpFGHEDkxohxVeqTUKqChuQCB59jLMAndKEy1uBuIsPmZGSPv4jMYmNnyqp
         qRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs/rB03sMU+C1r87UjnCdc2b4obOjDkilBbTrlaUjRiRh+/5T24/IGZcPOz6Lq752zSI6pa+pO8aWnFfux7UBh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7eFzihHtO11ffqQT33ds+NsxtM3Nidplh+pCaT2Dk+ZNdxX5B
	r1K1/HRsZbymI83vO7M/dcxSSHyd+KlDJKew5n1HXn9SmSrKX0nmQx0kZ9B8uurvSJ+qWCpQGsr
	SqhPw3hapiS7vh+7JjYyIAE7rde2vp8E=
X-Gm-Gg: ASbGncvKH8sCevh1Sj+hGWIcNbNWMe+aGHo2ggSEzYeNC9FsQtwadeWXaSWvsUIdW4F
	QyC4GVhnbp+h+2jkHjxu66zez86tNcxcEwCw4TyzLQlOLaEn7BILKJpaYcppKzGfGqW5YZ4X90w
	fIK9hohpOkCZBr02R4gZ9Hx1vTMyWmSP5mVI/6y6fOJ/TdTp+IVnzwJequisFTtwodaWrubg72A
	LXi44H7DvyqGidrdMMb2FGBCtJDmJlgMHsFqJmlVOOAibFBdxQ0FvAFWNpAR68B4dfpCY/uz7RJ
	vtPOmjsxizFBSbX9
X-Google-Smtp-Source: AGHT+IFTcAOtXGOZhl7XZO47Jw5as7yHXv1okWMKdwokC78k4R5PlQjBIcNv/sxneXQntHqjozJlsExm4jwJsJf+GKs=
X-Received: by 2002:a05:620a:2990:b0:82e:ce61:f840 with SMTP id
 af79cd13be357-89070fc102bmr2871005985a.84.1761197991234; Wed, 22 Oct 2025
 22:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20251013092038.6963-1-ying.huang@linux.alibaba.com>
 <20251013092038.6963-3-ying.huang@linux.alibaba.com> <CAGsJ_4xaA8QRjP9H=n1hQfEfGop7vOd5Y=J+KQzuOyfa8GK-kQ@mail.gmail.com>
 <87a51jfl44.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zPH0fwBOLQwh1y6jG3tCXHLGRCTyVVSCWb+NfLCEMV0Q@mail.gmail.com>
 <871pmv9unr.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zW6ogVdi=t9JCuvGD9N21mA_ORXRCakw4Av68d9n+DDw@mail.gmail.com>
 <875xc78es0.fsf@DESKTOP-5N7EMDA> <CAGsJ_4zKGS-Xd-58ufXGoyRfaZWd8wTgv0b6ibHJ2aS14mQqtw@mail.gmail.com>
 <87a51j6zg7.fsf@DESKTOP-5N7EMDA> <CAGsJ_4y32i3aNYPum=8J3_Kt6vOSisr_jg6btB-YG1uQBqHG7Q@mail.gmail.com>
 <87ms5j4444.fsf@DESKTOP-5N7EMDA> <CAGsJ_4xhJSLnXOZy4kPmnif5Paq+OPN_Ww+rPk2WO4-ADSC0Yw@mail.gmail.com>
 <87qzuu1kg2.fsf@DESKTOP-5N7EMDA>
In-Reply-To: <87qzuu1kg2.fsf@DESKTOP-5N7EMDA>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 23 Oct 2025 18:39:39 +1300
X-Gm-Features: AS18NWDKv8WT7U0pZbWb-8Jorrgh3QZSKh6u4PKNw3UoBHBCpCMmg3gw3nK3q9o
Message-ID: <CAGsJ_4z7SASir4gWThfePdnvw82TB8E6rXnzJ=CieaFnJpJt7g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20251022_223953_074949_24228E88 
X-CRM114-Status: GOOD (  14.24  )
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

> >
> > A:
> > write pte
> > don't broadcast pte
> > tlbi
> > don't broadcast tlbi
> >
> > with
> >
> > B:
> > write pte
> > broadcast pte
>
> I suspect that pte will be broadcast, DVM broadcast isn't used for
> the memory coherency IIUC.

I guess you=E2=80=99re right. By =E2=80=9Cbroadcast,=E2=80=9D I actually me=
ant the PTE becoming visible
to other CPUs. With a dsb(ish) before tlbi, other cores=E2=80=99 TLBs can l=
oad the new
PTE after their TLB is shoot down. But as you said, if the hardware doesn=
=E2=80=99t
propagate the updated PTE faster, it doesn=E2=80=99t seem to help reduce pa=
ge faults.

As a side note, I=E2=80=99m curious about the data between dsb(nsh) and dsb=
(ish) on
your platform. Perhaps because the number of CPU cores is small, I didn=E2=
=80=99t see
any noticeable difference between them on phones.

>
> > tlbi
> > don't broadcast tlbi
> >
> > I guess the gain comes from "don't broadcat tlbi" ?
> > With B, we should be able to share many existing code.
>
> Ryan has some plan to reduce the code duplication with the current
> solution.

Ok.

Thanks
Barry

