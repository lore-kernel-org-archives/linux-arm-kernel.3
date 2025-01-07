Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A445BE77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 01:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1cq8MFbpYBQ15nZ7TZmC38dR26HoCi1nRHmAE0jyLE=; b=D/0izMAvxETE4n3uABOqjegWmq
	AgqlQ5xooNLEE7a9VnrpesWO9yRKAwUCcu0iUbDsJcMlLzBiLzEu6ha7ic9dakNzcqTxall1T+Sp9
	iqJHdg36RpY4d3xVgbeNkaEOxjBuY/GG4LH5ii+mye50hmwVZ0igGw7kWMU+omriH/F4DKe8lnMuD
	uQsFayRo/0Z5ejO6URJEW2HoPNMOrJYxp0SaBiRfQjNokrvBTZDnFoTYbixfoZFbAkIhVhvLG2KWl
	wenDLLO7BsW9KwtRxiHpQ5OGFjnoA9FMXhUvE8CUpKyISkbYIzyBTOaRlhSTNvWXDDEdMP8vsxrOw
	YvSLJKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyUl-00000003851-498B;
	Tue, 07 Jan 2025 01:34:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUyTZ-000000037yC-1egV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 01:33:46 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5d7e3f1fc01so2322385a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 17:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736213623; x=1736818423; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S1cq8MFbpYBQ15nZ7TZmC38dR26HoCi1nRHmAE0jyLE=;
        b=Rql7jVHFqD0JBuctKoThSh1pZmbhTB6t2o+fAmD1ua4MH/YWOsLWtlqDMlwXBUOcp9
         EmNI+JzTTm8G4fAKoo8AYnW5adNCpjx+qsypijYaQAOH7PugZJV9lmFaQfQPqqBLe9w3
         N6iDDY2wK5mumkyO7MuBR9QPt68RBHr+4h1Pob6K76EZNvIE/X6jPQQqJRAGzRD16Z+f
         EE0DPP240EgxaiWupUZRoY3yVo8rPuqptrcMRcQTKe/pSVK5MQ+w5vbfpEUW/T9tGM1p
         2WECJsZbfuFEe+cjv0jk+Vnua8rhG4ioXnbrAO3fgmt+BeRJbe7HwuN/NP0Y+K3xqPoz
         Ilvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736213623; x=1736818423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S1cq8MFbpYBQ15nZ7TZmC38dR26HoCi1nRHmAE0jyLE=;
        b=X3QU5gubk0bMayzn4UwUbcd4zo4nlKmcwFr0QRqIgi0L97kTf2lnWAn7Wbxb3UJS/f
         YJaPGbQmJFnbQSg6dfp6KlsS0PCG5EWMGkvVZ1auCQk9WJu2VHf4zq4ZvLxc9kmaoSV0
         H2rhPv9zaEH8dfWNIQAt6XZKp7H4li36c7BXoMtuhVz2tsqG9IgobLK/UtEWE51rX1HT
         FCPwJuXiQgcvTSC35fHGooRdqvEAjOXImkru8lmMlcO4oDkobU3As8GlOPhJtnoOgseH
         dSyHMdpo8scOw3GQf6ryv10dOKWXL3pbtQVGrczl9qf+kt9d56miIL3RPsN6q1PKw0pm
         735w==
X-Forwarded-Encrypted: i=1; AJvYcCWodX/UJy2VY7w8wEc3LWars29thQWGd9DsWmJGgKWX5yaTkvwfuh64nTBolZE8rlumoCsa7O5pGqvKYyhiSWYz@lists.infradead.org
X-Gm-Message-State: AOJu0YxLFdIPfbEXhroNHeBtU7ZO/ncXVlcB/cxJEDKZT4oN2G1JvdWB
	J03WroGsyQWHzKl5NSFkooV4KFbciFs7pQzmL+raqcBuLWKzKsTqWplN8t/lu7voSVAatQcA6ly
	eD3T29XN7yjTkGMdPNzU7oLODPWs=
X-Gm-Gg: ASbGncvM5RbVWmjpPTR6sevVpe8U/d3F8RjUJKllv1fYFBJ33AA7IddBaE5koxW5iWN
	Vi4F0R1wZhvbScrp9RXzYrQSi3IEXnhfn6Wg2eg==
X-Google-Smtp-Source: AGHT+IFY1c/2d1AkAFyDlUnnS8En22lLEjmEOOwu78dZ4QLRW5CoAGB96WE7IsRvm/0TuAIextJbw7H2WkFHUM0Qd1Y=
X-Received: by 2002:a05:6402:26c5:b0:5d1:f009:925e with SMTP id
 4fb4d7f45d1cf-5d81ddad8edmr59384404a12.16.1736213623454; Mon, 06 Jan 2025
 17:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com> <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
 <b65e145b-a754-41bb-8322-f93c24f6b7d1@linux.alibaba.com> <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
In-Reply-To: <CAK1f24ksqXUKquPUu3hL3qZha6fOSz2xjRcy83CDg_rdOcZB6g@mail.gmail.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Tue, 7 Jan 2025 09:33:06 +0800
Message-ID: <CAK1f24=b=3Ny2TjHJccw_i0YG5AvSCpAFt2C6+c-FzgJqCSqyw@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, david@redhat.com, ryan.roberts@arm.com, 
	zhengtangquan@oppo.com, ying.huang@intel.com, kasong@tencent.com, 
	chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_173345_439932_29F68DB2 
X-CRM114-Status: GOOD (  21.14  )
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

On Mon, Jan 6, 2025 at 10:39=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> On Mon, Jan 6, 2025 at 5:34=E2=80=AFPM Baolin Wang
> <baolin.wang@linux.alibaba.com> wrote:
> >
> >
> >
> > On 2025/1/6 17:03, Barry Song wrote:
> > > On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Baolin Wang
> > > <baolin.wang@linux.alibaba.com> wrote:
> > >>
> > >>
> > >>
> > >> On 2025/1/6 11:17, Barry Song wrote:
> > >>> From: Barry Song <v-songbaohua@oppo.com>
> > >>>
> > >>> The refcount may be temporarily or long-term increased, but this do=
es
> > >>> not change the fundamental nature of the folio already being lazy-
> > >>> freed. Therefore, we only reset 'swapbacked' when we are certain th=
e
> > >>> folio is dirty and not droppable.
> > >>>
> > >>> Suggested-by: David Hildenbrand <david@redhat.com>
> > >>> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > >>
> > >> The changes look good to me. While we are at it, could you also chan=
ge
> > >> the __discard_anon_folio_pmd_locked() to follow the same strategy fo=
r
> > >> lazy-freed PMD-sized folio?
> > >
> > > it seems you mean __discard_anon_folio_pmd_locked() is lacking
> > > folio_set_swapbacked(folio) for dirty pmd-mapped folios?
>
> Good catch!
>
> Hmm... I don't recall why we don't call folio_set_swapbacked for dirty
> THPs in __discard_anon_folio_pmd_locked() - possibly to align with
> previous behavior ;)
>
> If a dirty PMD-mapped THP cannot be discarded, we just split it and
> restart the page walk to process the PTE-mapped THP. After that, we
> will only mark each folio within the THP as swap-backed individually.
>
> It seems like we could cut the work by calling folio_set_swapbacked()
> for dirty THPs directly in __discard_anon_folio_pmd_locked(), skipping
> the restart of the page walk after splitting the THP, IMHO ;)

In correction to the earlier email:

folio_set_swapbacked() is only called in __discard_anon_folio_pmd_locked()
when '!(vma->vm_flags & VM_DROPPABLE)' is true, IIUC.

Thanks,
Lance


>
> Thanks,
> Lance
>
>
> > > and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
> > > handled properly?
>
>
> >
> > Right.

