Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CACDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eFxTtDgk1DzZsZQ3ygFGMHqYYaI93o+Qf7G7yIH5Azk=; b=hce14rRJsGucvnbXsGz++ky38k
	6AvMHLloBFNMDEWyGZafa4wCtGEHdHqluTr6HIySqFnE+NGHgArCWKLlKVOD7AoOWQvoRtEqfZUTW
	ATScM76vxT/Ie3mSVl1aZOB+HFtnO7ziA1fS4dxr2AsMW/EbpHfotxPHPGl8q5WvqwaLW3plopCuH
	513Om+4SYCBrp8Xg++6VpONQD6o9M+FubADdVK1oERIMGuF/ZhohB16sh09RbyUglxMwOh1WDYOXl
	mEwRphYzZcoJP68aKNq7kViVygwKNC6/W6Gk4qBMOt5sS/s+Er5G0GumJa0MtZZPAK44Qkvaj7zF7
	SyQxZE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj2z-00000000bWP-156R;
	Mon, 06 Jan 2025 09:05:17 +0000
Received: from mail-ua1-x931.google.com ([2607:f8b0:4864:20::931])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUj1k-00000000b13-1f6k
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jan 2025 09:04:01 +0000
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-85bb13573fbso2739017241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jan 2025 01:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736154239; x=1736759039; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eFxTtDgk1DzZsZQ3ygFGMHqYYaI93o+Qf7G7yIH5Azk=;
        b=lmKiOG1U7EDBY8oLblclqwiE94bf0k87w78D0dEw2NxzD8DrgTdFBL5/j14tpFs5gn
         c1imhUiBICjrc+wowgIRLlTwaxNEsf2n+k3jZtsXAGBgaqbaXL1xxEmBZWG00lJmUZfS
         NIWn7cF3Y1OCZlkLZgJeeVTgWDl3nPL4V4DaQ590PjwQLunIr55Q13pRY/WI0gFuPbIa
         M1SRdVhmACVcR1JoVaC8kBHhFvZ9rcGTBLe08cr+CiVC+b6OKP7PxVE/G5pJeXHxQxB+
         dGDMW4SmPqE4D7o8uR1t+UeeT4v/PDtK5/xC2ET9jgCri6t9F36cs7yuX1sHcAFJI6Nc
         hY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736154239; x=1736759039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFxTtDgk1DzZsZQ3ygFGMHqYYaI93o+Qf7G7yIH5Azk=;
        b=jqpSupfCgOEKOAePrGtbdyCjrbl+JJ74NLfEWSc1DmE9SCd77ZNVIchP/gC/xhf+vJ
         s9rZQoBCEHWePl41zXRUehRbXRgGaJmFUOu2pFlz8GZgPLYSkSSWeSL11vMJShArGInS
         WfgrVhaj4s+gMGpAmL744blvsQMtbcBhAWAgl3HSAuaohntS17qpRqJ1DgwjSHPulCpk
         RFxS1U7DBYwAs6HjO+NRaq2pqvqsXJkN3vhqNp+PtI8vyLz8h0iGZLD0zKzFtaezhaH9
         /Ejr4Oe5bnmphyMjGyMLSRt2t+vWRUAmQ6Q8VQ2IMCYO7ce64i/c692yRYELh5h7JADe
         Tqwg==
X-Forwarded-Encrypted: i=1; AJvYcCUrSVLSABpEh1ZPhgaKyD9EL3mJkNzdSf8tIzJpQv6FB4u80Ou/jM/irVJR7I1L2eUi5EZQut2xGEHkoqMny2LX@lists.infradead.org
X-Gm-Message-State: AOJu0Yw03/rDWje9QRM0eKI0cfLCanDTestkb/9jMsyHAOFMAcSmANAU
	Bi3x1LQQBikSgsnbtv1KBmMcPQpIRq+FD7N9zEz8KL6bnrUrwUzu3jzB6WITzdhUiXk/QSt7Ors
	g4EHLrVaHHQEDv3CTgAcM+8034lQ=
X-Gm-Gg: ASbGncv/2pvqipMTCwLAjWgZHiDlgqaiTdnpPejDDSWgNxvvO0TJGuC23LsfR43D6HC
	pCwzyqCd4JmJaP//KWpnTkY0roZzUcYyTCJWgg+CXVJl/HPXJxMQaUUXw7XK5XLcoAjlzHf8i
X-Google-Smtp-Source: AGHT+IGwF5u5tAifgOYHybaFWllpmt6FYSuR30rbFw3ny0sRMYsqv6sxNn2xOvl/ZEYg65NFBsY/fXPifuwkCo/Lph4=
X-Received: by 2002:a05:6102:508d:b0:4af:e0d4:70df with SMTP id
 ada2fe7eead31-4b2cc49c342mr33101717137.27.1736154239114; Mon, 06 Jan 2025
 01:03:59 -0800 (PST)
MIME-Version: 1.0
References: <20250106031711.82855-1-21cnbao@gmail.com> <20250106031711.82855-2-21cnbao@gmail.com>
 <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com>
In-Reply-To: <e68b8279-fe16-462a-bf99-6b4d90e96904@linux.alibaba.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 6 Jan 2025 22:03:48 +1300
Message-ID: <CAGsJ_4wMuDYxuEMcA0jYvekt26Uvz86kjWbo0nz-ZZzuiyEOQQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm: set folio swapbacked iff folios are dirty in try_to_unmap_one
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, ioworker0@gmail.com, david@redhat.com, 
	ryan.roberts@arm.com, zhengtangquan@oppo.com, ying.huang@intel.com, 
	kasong@tencent.com, chrisl@kernel.org, Barry Song <v-songbaohua@oppo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_010400_471440_6314AFD5 
X-CRM114-Status: GOOD (  14.97  )
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

On Mon, Jan 6, 2025 at 7:40=E2=80=AFPM Baolin Wang
<baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/1/6 11:17, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > The refcount may be temporarily or long-term increased, but this does
> > not change the fundamental nature of the folio already being lazy-
> > freed. Therefore, we only reset 'swapbacked' when we are certain the
> > folio is dirty and not droppable.
> >
> > Suggested-by: David Hildenbrand <david@redhat.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
>
> The changes look good to me. While we are at it, could you also change
> the __discard_anon_folio_pmd_locked() to follow the same strategy for
> lazy-freed PMD-sized folio?

it seems you mean __discard_anon_folio_pmd_locked() is lacking
folio_set_swapbacked(folio) for dirty pmd-mapped folios?
and it seems !(vma->vm_flags & VM_DROPPABLE) is also not
handled properly?

Thanks
barry

