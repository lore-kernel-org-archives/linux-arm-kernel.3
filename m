Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCB5CA1009
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 09:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iP4mX/+2DHYze7f0itBbCFIKzjrmdvMk6mmWMpcGwHA=; b=Wwtqus19iAOWqVy8lM5PU7pQM3
	E492crynqRHJJM5dvemok21m0iTBTFVZ4W6y3IxaqWn4oUT1Eb3Zp/zYiW867qu0ezC/PNzN/W6/t
	OIXpuIDpz+11Jm95CAcK8Kxy6qP2Bc0JfKEYP+xuYiDWqlnDKlQIpD4YCpGgB/gPmEhVRzbdDB0Xu
	iUuHgUgFm9EqIjPkH7ocA5fhsWUKGVAAh1Y4uIWc8LZy3XvPY6sOGFMFqXX5oIgseYzKWvcwcbsuj
	O7rIMsmRMOncrbwSkPLPuQDx2Ux3z2qMdN0rb8sBnY7khQVcLMdAXq5+A2rAsbOv0Dau9qioIJRE6
	k4sZ2IuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNGw-0000000GLob-1cyD;
	Tue, 02 Sep 2025 09:25:50 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMjZ-0000000GBVX-3KCA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 08:51:23 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b327480fd0so839181cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 01:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756803081; x=1757407881; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iP4mX/+2DHYze7f0itBbCFIKzjrmdvMk6mmWMpcGwHA=;
        b=y/SvTq/dJO5L5D5j5M+8KcmhmMcHk8nw9DjNZ/b41xhq/2eSlfxDI/bqLz7GdiuSVm
         cDqD2F4Sj8CX1/GCpobkIrfoxQ3++7TL4BDVfCGArU7z+IueqC25Rl3lTZ7b82pjVx//
         Bsi3LK1sXIjhUsAHWiyzrlflMkn0CK0+cmrqtqVduSNguLEdlyrRep18EGmQMu686FKM
         DEpzVjLYPccZwUn1CCkPz4BZ4leqSRYRK/0GjKprw898GNKBCtduRGAsD/QhVdvGdikC
         YD3JVj3V77oAwvqiqmPQTo37f2rQYAD6/57VoNyfX3z3e2nzxKAEtpIP/UGXNQWw98+7
         GuwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756803081; x=1757407881;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iP4mX/+2DHYze7f0itBbCFIKzjrmdvMk6mmWMpcGwHA=;
        b=t2uDa5zi0JiBofUaLXfgr2LwafLE0QPfkNrHoRMF7PPuyyCA45C0PnszgNtfmL/DIl
         4EfGQbedqw6p+OS0eQrmCvfzJ/Qh/XX+16iia6HzRLidPq7YXvhbDMq+fuEOh8xMpr0t
         d9peYHfdI9sqba3hcBBusRmW1cKM04uduBBp1cRBxgnUCstKAQQR/BRQZUFmng/A4kqy
         945mu2CGgOYn1wstA3xvpR+ZoQT9uMpbo4PMlHSpe9k1iZAb2Zv+iSAO/R4NxPrgl4Sa
         V/RVXWHyvt+ldc5lwNhLtkaLzlEH/fGA1/ZeBRxoNDNnVxvLdWjnv2osuVY8/kQuXQiB
         NFig==
X-Forwarded-Encrypted: i=1; AJvYcCUM6fQDDkmiROjT3RspWvKlDpH9E271r5pM3RrwNiRdjnj3zFucSwLh4z5IOHZ5/Y3e+EMU8G23G95RPAnULM/k@lists.infradead.org
X-Gm-Message-State: AOJu0YylLFVx2dAOyrUg1N5EmlzMvevOUuEngSCT/yJqv+Lsp5vElIAY
	uS9pJLH0C4EMaDWBw1vZd/RHFHJukEkLC0vo2EngTemdOjg/AyMuk1hKzKWSuhwPw5vwHNVpXGW
	GoVAkuSMyhzYZYrTFb0dSt+yH575vKK94Oiv6ykjo
X-Gm-Gg: ASbGncutGHvSwGMoo2kTOwF8y/BYJl+w6c1uJoIVtOkatPrAaM1Xn9/NKRJnwbghc8A
	MR3QaF25dfTWxXceiCOYTLFOx9UNgBv/+vt0rl02xE8rDclk6cZUzwihelTaFmXQyrdF+JkwJmX
	HXqa+ofUOWKJKb3N++JEkjRQKTY6zlDVgeDN1+RMcqD98tqDYgbIVv1WGzXCBI0J/orMgZrE7BA
	aP9m46QEWdo4RHMPciXneWqfA==
X-Google-Smtp-Source: AGHT+IEl9wSTHdiJwZPLw2efIYDBOrEGcJPxDblGkQXiafOiZIaocXkLc6odVx1VLSTjodsqJVOs6KtZuN8sumvistY=
X-Received: by 2002:a05:622a:a28a:b0:4b0:9c14:2fec with SMTP id
 d75a77b69052e-4b325008444mr9184701cf.8.1756803080383; Tue, 02 Sep 2025
 01:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250901135408.5965-1-roypat@amazon.co.uk> <20250901145632.28172-1-roypat@amazon.co.uk>
 <CA+EHjTxPfzDk=XmwS0uAtjwsYB829s1uZSMC6x3R6KGQ-SqjtQ@mail.gmail.com> <862475d8-5a4f-44c3-9b3f-56319f70192d@redhat.com>
In-Reply-To: <862475d8-5a4f-44c3-9b3f-56319f70192d@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 2 Sep 2025 09:50:43 +0100
X-Gm-Features: Ac12FXwr7whnN-VXo5s-ZgZo6eW3l7wyHW3APjTTLjncve_-hqyXmzJXVm4lqgs
Message-ID: <CA+EHjTxymfya75KdOrUsSUhtfmxe180DedhJpLQAGeCjsum_nw@mail.gmail.com>
Subject: Re: [PATCH v5 03/12] mm: introduce AS_NO_DIRECT_MAP
To: David Hildenbrand <david@redhat.com>
Cc: "Roy, Patrick" <roypat@amazon.co.uk>, "ackerleytng@google.com" <ackerleytng@google.com>, 
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
X-CRM114-CacheID: sfid-20250902_015121_833580_08C0F36A 
X-CRM114-Status: GOOD (  29.96  )
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

On Tue, 2 Sept 2025 at 09:46, David Hildenbrand <david@redhat.com> wrote:
>
> On 02.09.25 09:59, Fuad Tabba wrote:
> > Hi Patrick,
> >
> > On Mon, 1 Sept 2025 at 15:56, Roy, Patrick <roypat@amazon.co.uk> wrote:
> >>
> >> On Mon, 2025-09-01 at 14:54 +0100, "Roy, Patrick" wrote:
> >>>
> >>> Hi Fuad!
> >>>
> >>> On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:
> >>>> Hi Patrick,
> >>>>
> >>>> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
> >>>>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> >>>>> index 12a12dae727d..b52b28ae4636 100644
> >>>>> --- a/include/linux/pagemap.h
> >>>>> +++ b/include/linux/pagemap.h
> >>>>> @@ -211,6 +211,7 @@ enum mapping_flags {
> >>>>>                                     folio contents */
> >>>>>          AS_INACCESSIBLE = 8,    /* Do not attempt direct R/W access to the mapping */
> >>>>>          AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
> >>>>> +       AS_NO_DIRECT_MAP = 10,  /* Folios in the mapping are not in the direct map */
> >>>>>          /* Bits 16-25 are used for FOLIO_ORDER */
> >>>>>          AS_FOLIO_ORDER_BITS = 5,
> >>>>>          AS_FOLIO_ORDER_MIN = 16,
> >>>>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
> >>>>>          return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
> >>>>>   }
> >>>>>
> >>>>> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
> >>>>> +{
> >>>>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>>>> +}
> >>>>> +
> >>>>> +static inline bool mapping_no_direct_map(struct address_space *mapping)
> >>>>> +{
> >>>>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>>>> +}
> >>>>> +
> >>>>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
> >>>>> +{
> >>>>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> >>>>> +}
> >>>>> +
> >>>> Any reason vma is const whereas mapping in the function that it calls
> >>>> (defined above it) isn't?
> >>>
> >>> Ah, I cannot say that that was a conscious decision, but rather an artifact of
> >>> the code that I looked at for reference when writing these two simply did it
> >>> this way.  Are you saying both should be const, or neither (in my mind, both
> >>> could be const, but the mapping_*() family of functions further up in this file
> >>> dont take const arguments, so I'm a bit unsure now)?
> >>
> >> Hah, just saw
> >> https://lore.kernel.org/linux-mm/20250901123028.3383461-3-max.kellermann@ionos.com/.
> >> Guess that means "both should be const" then :D
> >
> > I don't have any strong preference regarding which way, as long as
> > it's consistent. The thing that should be avoided is having one
> > function with a parameter marked as const, pass that parameter (or
> > something derived from it), to a non-const function.
>
> I think the compiler will tell you that that is not ok (and you'd have
> to force-cast the const it away).

Not for the scenario I'm worried about. The compiler didn't complain
about this (from this patch):

+static inline bool mapping_no_direct_map(struct address_space *mapping)
+{
+       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
+}
+
+static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
+{
+       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
+}

vma_is_no_direct_map() takes a const, but mapping_no_direct_map()
doesn't. For now, mapping_no_direct_map() doesn't modify anything. But
it could, and the compiler wouldn't complain.

Cheers,
/fuad


> Agreed that we should be using const * for these simple getter/test
> functions.
>
> --
> Cheers
>
> David / dhildenb
>

