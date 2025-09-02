Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 917A1CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEJ7Ey14mWS9ux2fnI3lv4hByDSn+Z0hPpiKOiV6hv4=; b=wJh9E9J+wN+iIohTaTLpAaEu7p
	X0ad2ziaYlafH79eD/wHXoU+jaPgBOan9t+fkqunVuEl7gIqbu8dZNoIrBM1OwP0kcPXn8HTF7NhR
	cjS2U3cXOTfhmg9lBYE/uf2pEV9qxVMMr73zR/OvLpg6LtCVkHvRFPzs6J7H/MmlGOUuQtgKSCkkU
	sy/Nz6U5Nh1NHAxilDHr0ljl04L25Y4XvTq1KuVIn16INCSH89vnhEwi3WApaIy59hvAG54jdazLD
	ylikk5vU1oOcGBSk5oGih8m5GscTRKVhcta2ZlWuEiEyRB+2/Q1XlUAnGI5NQFKkUnTfxiA+ZhDWp
	KcoSjLLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ7H-0000000HEn9-3hZM;
	Tue, 02 Sep 2025 12:28:03 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNDW-0000000GKge-0Ql8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:22:19 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-4b30bb04ed8so463721cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756804937; x=1757409737; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UEJ7Ey14mWS9ux2fnI3lv4hByDSn+Z0hPpiKOiV6hv4=;
        b=wivM3pDcx3OpGz4idnqaElQXGgHj3zPyzBPqGvcKlRljvOyKEVK50RlK/YecjiKE35
         nSy5rGVS+ahdE9+SsvilbHAZSi9OIGgtHVTCMJnpwvtp209w/2R7vBAaA3rmY0CUoOvu
         eV9XS6cSZnbPiDSJfLre7QSoMPMn04Pkjs9gY3SgHZ6N2ZM/Aey+esbxc6QVtCCdLXeq
         GB+HLiR+3x1A+1wnoLqhXFNdVX671OdSXokP6uTXK5amwLdg9kbPmQcCVGcbvgYzo/RJ
         rYekoRCqnC+p2WWOEQsxK2nQqd/aJ1eKGkJO4XAHcW2YftVZJGJQo6aOh/xIEeWrztWm
         xZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756804937; x=1757409737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UEJ7Ey14mWS9ux2fnI3lv4hByDSn+Z0hPpiKOiV6hv4=;
        b=pSL3g3NlUAYHsBEjLO0nee0cmQH2VK93pZ73Vn1ieRKz4SwAZrQcKASg0R7iPD+uok
         SV1OnsZh96RIyi/p23Q+Ul5dQc3830xRl4N4qR3EVPHn+VENXc0GE6NU0cjXz2caCWw8
         T/bYzO4/9n3LuvhNkBIsBcgiz3Rk/ZK9dQ+LZGrKUFaRFNY1XL05Qx63k9uEU+MrayaQ
         ZRhm0AjPA2/PGNdiuU5B5cWtiVjR2NL94NenoRIiLFFBtTKlN5OozASFvFboSdBOzsLs
         dorac/BGW9vYxpLeErkEE8NtaRKrXV3KRM5JZu6kiOgX+o3RfASNKI6OtmFymRg2SA/p
         4G/w==
X-Forwarded-Encrypted: i=1; AJvYcCXsKFtck0Plv4oyyfjrdmN3GcOdXiLhKvvKv2P+8iw4z0SXSRAze76FNhr4VHLoNozRGV0Z3aX4kQbSutm2uctQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwzJiv1b2kigZBolVUmr8uhZjnKuzsWfJxwScb32WwMJPrn+5px
	Y3fbp+0zft9KbP7GkmwEltFGLhiTgebOBJXrfMax6cahAbTG/fi6qn2xGH0pw8/3kT0jlBPDlYU
	PdVJSyDEpJi9xPSeFwUKjSOzoc7/mNVjzOFsEGq31
X-Gm-Gg: ASbGncsE9gSGVgmeslGNZXboDNZy1kbsBgmQ6mdckL/jDjc/RnP6R7I8q9itWxI0QpO
	VgrZ0KeZwhzgAsL8/EYJAUrCAUHL9J6Cf+dq8kf7oT+7oEvbCy7vtfuVoLey3UpQy+aCdiOs7Ry
	eNAI4s1SnUpIXdknzPzjnFRG9TgIq/xcMRje93VY9XBBlgBKhon+/8cQ9FbCRAUJNT0lzkkup0b
	PgusZgkdpbx8L0=
X-Google-Smtp-Source: AGHT+IE/365ZPa2na0I+61w5kSKHeQK2w8xYgvB2r/DuNmzeiSpIrPg40UHX6ZyJ0CzihYKx7admZMRUkLUk8hCwjvo=
X-Received: by 2002:ac8:5a56:0:b0:4b3:8ee:521b with SMTP id
 d75a77b69052e-4b31b0e2753mr12638851cf.0.1756804936638; Tue, 02 Sep 2025
 02:22:16 -0700 (PDT)
MIME-Version: 1.0
References: <CA+EHjTxymfya75KdOrUsSUhtfmxe180DedhJpLQAGeCjsum_nw@mail.gmail.com>
 <20250902091810.4854-1-roypat@amazon.co.uk>
In-Reply-To: <20250902091810.4854-1-roypat@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 2 Sep 2025 10:21:40 +0100
X-Gm-Features: Ac12FXxFB1Y6AnaQmou77bzNFiPMi0bpB9wRe5PhLp9QE0Dg7CKdLpI-R4eIPWU
Message-ID: <CA+EHjTz1JxOy=E3p=So2q+k=UK3cDG6C8gOUgA9NQEpqRdhW5g@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
To: "Roy, Patrick" <roypat@amazon.co.uk>
Cc: "ackerleytng@google.com" <ackerleytng@google.com>, "david@redhat.com" <david@redhat.com>, 
	"Manwaring, Derek" <derekmn@amazon.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, 
	"Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, 
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "rppt@kernel.org" <rppt@kernel.org>, 
	"seanjc@google.com" <seanjc@google.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "will@kernel.org" <will@kernel.org>, 
	"Cali, Marco" <xmarcalx@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_022218_143529_D33053B2 
X-CRM114-Status: GOOD (  33.90  )
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

On Tue, 2 Sept 2025 at 10:18, Roy, Patrick <roypat@amazon.co.uk> wrote:
>
> On Tue, 2025-09-02 at 09:50 +0100, Fuad Tabba wrote:
> > On Tue, 2 Sept 2025 at 09:46, David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 02.09.25 09:59, Fuad Tabba wrote:
> >>> Hi Patrick,
> >>>
> >>> On Mon, 1 Sept 2025 at 15:56, Roy, Patrick <roypat@amazon.co.uk> wrote:
> >>>>
> >>>> On Mon, 2025-09-01 at 14:54 +0100, "Roy, Patrick" wrote:
> >>>>>
> >>>>> Hi Fuad!
> >>>>>
> >>>>> On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:
> >>>>>> Hi Patrick,
> >>>>>>
> >>>>>> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
> >>>>>>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> >>>>>>> index 12a12dae727d..b52b28ae4636 100644
> >>>>>>> --- a/include/linux/pagemap.h
> >>>>>>> +++ b/include/linux/pagemap.h
> >>>>>>> @@ -211,6 +211,7 @@ enum mapping_flags {
> >>>>>>>                                     folio contents */
> >>>>>>>          AS_INACCESSIBLE = 8,    /* Do not attempt direct R/W access to the mapping */
> >>>>>>>          AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
> >>>>>>> +       AS_NO_DIRECT_MAP = 10,  /* Folios in the mapping are not in the direct map */
> >>>>>>>          /* Bits 16-25 are used for FOLIO_ORDER */
> >>>>>>>          AS_FOLIO_ORDER_BITS = 5,
> >>>>>>>          AS_FOLIO_ORDER_MIN = 16,
> >>>>>>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
> >>>>>>>          return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
> >>>>>>>   }
> >>>>>>>
> >>>>>>> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
> >>>>>>> +{
> >>>>>>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static inline bool mapping_no_direct_map(struct address_space *mapping)
> >>>>>>> +{
> >>>>>>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
> >>>>>>> +{
> >>>>>>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> >>>>>>> +}
> >>>>>>> +
> >>>>>> Any reason vma is const whereas mapping in the function that it calls
> >>>>>> (defined above it) isn't?
> >>>>>
> >>>>> Ah, I cannot say that that was a conscious decision, but rather an artifact of
> >>>>> the code that I looked at for reference when writing these two simply did it
> >>>>> this way.  Are you saying both should be const, or neither (in my mind, both
> >>>>> could be const, but the mapping_*() family of functions further up in this file
> >>>>> dont take const arguments, so I'm a bit unsure now)?
> >>>>
> >>>> Hah, just saw
> >>>> https://lore.kernel.org/linux-mm/20250901123028.3383461-3-max.kellermann@ionos.com/.
> >>>> Guess that means "both should be const" then :D
> >>>
> >>> I don't have any strong preference regarding which way, as long as
> >>> it's consistent. The thing that should be avoided is having one
> >>> function with a parameter marked as const, pass that parameter (or
> >>> something derived from it), to a non-const function.
> >>
> >> I think the compiler will tell you that that is not ok (and you'd have
> >> to force-cast the const it away).
> >
> > Not for the scenario I'm worried about. The compiler didn't complain
> > about this (from this patch):
> >
> > +static inline bool mapping_no_direct_map(struct address_space *mapping)
> > +{
> > +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> > +}
> > +
> > +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
> > +{
> > +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> > +}
> >
> > vma_is_no_direct_map() takes a const, but mapping_no_direct_map()
> > doesn't. For now, mapping_no_direct_map() doesn't modify anything. But
> > it could, and the compiler wouldn't complain.
>
> Wouldn't this only be a problem if vma->vm_file->f_mapping was a 'const struct
> address_space *const'? I thought const-ness doesn't leak into pointers (e.g.
> even above, vma_is_no_direct_map isn't allowed to make vma point at something
> else, but it could modify the pointed-to vm_area_struct).

That's the thing, constness checks don't carry over to pointers within
a struct, but a person reading the code would assume that a function
with a parameter marked as const wouldn't modify anything related to
that parameter.

Cheers,
/fuad

> > Cheers,
> > /fuad
> >
> >
> >> Agreed that we should be using const * for these simple getter/test
> >> functions.
> >>
> >> --
> >> Cheers
> >>
> >> David / dhildenb
> >>
>

