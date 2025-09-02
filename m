Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F5CCA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNeLWs2qHyUDts+2iHePFK0hNcgX1eWBxmSFpW760QQ=; b=AyeqvGzmZn8oibK37jVAt4EsFB
	wU+2DYj4tLze1KMiHxk5Z+0Go2TxEj75ZGwKu/Fy09nAqRMITRz6NRgPZ85h0nValX1/qOqhWPFu2
	NafkBgmz+aSocGWInB3oGgHpLizg5PSfHtqfpOkGCMRJezPdI5kBznxlLrYX8rAJUZ7cHZPTunloj
	P4vViEFseYd2QpCBky8nT99lNA5GDP8dsJJoSEKBulhfhJvzgJbyxX2Vo2J8ZMW38UQCv2rsjZerc
	c7Vi3wtHaRNPDe0XbC5b1RV1jqGfqjq3QyS4Hc0Sjol1SD+wLEvDeEaZDDa0T2SSAbWg8E006BKel
	rJoCJx0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMDp-0000000G0Ka-2mLi;
	Tue, 02 Sep 2025 08:18:33 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLvk-0000000FslI-3uhl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:59:54 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b30bb04ed8so448131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 00:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756799991; x=1757404791; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oNeLWs2qHyUDts+2iHePFK0hNcgX1eWBxmSFpW760QQ=;
        b=yIo1/3uqkRjUNtv0b7Ix0aJV65hI3IdWJZVo0nzmfHf96uGB2xBckO+OxO5DK66pCV
         nUlGI2m8xhXWAEjSsldZAGtnPH002CUPBob9BHz+5zY4jOzpMXVj/s7Yub+1bDIX1NFY
         mt47t9eOLEdhySPDTy3hIGZGVG0GUz8OTxEtbLl4BVJQu7DDbwrqEJoW4kIDLaDBPLYV
         rqZtWiBYO5ZozwLUpLoGzUlAgoK3KIc+VjyN19mnh6FQd1EZLFZnxvVK79vrqUHYMTLA
         IsBEJ41sEpr/mmOk7MnjmYetyB1CNw2amvvXaPeLolek8hV2S1fYOTfQ6GFN0fBY8O/g
         +CHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799991; x=1757404791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oNeLWs2qHyUDts+2iHePFK0hNcgX1eWBxmSFpW760QQ=;
        b=kWGC5hXO1vI9w1lQai5f6zhmGcNT43Q2MCuHGL4WVmsU2mlQk6LCBTt4EJcTzlV9m/
         cLOO44eoWwsiHnEay+vLzBCuulZbxwSBoKxHwGh35yzD5xYvlG+X1IctByZykTR3phhm
         aZ2yUXKA8xy1DM48NSVC+xUPlpumrpaGlZlcpaWLmqBI9UgwEsVXUNqyapGhcKdWqO50
         LSu8zrHyGZUneiqB2cbQUUWsUQ+UUIWgGN//yf9m0Ta/AcEuuC19cuX1cm/54SUDadJX
         orowdTqDtUqv9wBfnGmCSqTm/8axI5g0FoYnxRNa++MXKX5LRyC7p7uzoPfvDHynZSwe
         ZdhA==
X-Forwarded-Encrypted: i=1; AJvYcCXELb7YBUxI2Nkf5IFc06mr9DeT4zZRfla/S04eVRE/vn+6Fhd7qS/9nqUMpMGfb7A0w92h4c5s8KVAoLVFEVr0@lists.infradead.org
X-Gm-Message-State: AOJu0YxYsDygifKCVCatqhbwbMa9XKM71vsxCm3yHgnISLlO4vEzTbWD
	6y+FNDTSxK3l/CPjyRpwhVI9tPmw+50tTwJbuIRj8Tz3qyqAJcctpYCj3tYHV5HXYWj6H3ocxCA
	rWcJBCdEQphfgZV2m822AkI8ncoRg79XcKAGvI9Zc
X-Gm-Gg: ASbGncu/DPkCBH5Gj4uWZpatSDuFzDba9Hpv980dzujhAmbsamGs/IJMO6Dvn/FPNzA
	j+D5FPs6lHhBGAtK72j9bNzx0fEpdvWyGmHMdQqIHg1htTeyzDLir19vmiyEi7IUzhCFk22sxuV
	v7f+Qm2dYoCx2Q0eyZBS5lSQwQMS6pg7vB7Ov2aja5I4BwVp48SR2dwdi+ELxO9hFDK3HsyU+ln
	h1MsNifa2uHCrGAqnY/qHXnJ/oW/J/Y1amo
X-Google-Smtp-Source: AGHT+IFkdbqiMarowY+mmKOzuU9RyYySZu0bnzDQg3QNeDfxzMXfy+3OtZ2GRaaDn0H+MAu5W+vNpqCjVKeX20zwo4o=
X-Received: by 2002:a05:622a:107:b0:48d:8f6e:ece7 with SMTP id
 d75a77b69052e-4b31b245bdfmr13130661cf.3.1756799990207; Tue, 02 Sep 2025
 00:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250901135408.5965-1-roypat@amazon.co.uk> <20250901145632.28172-1-roypat@amazon.co.uk>
In-Reply-To: <20250901145632.28172-1-roypat@amazon.co.uk>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 2 Sep 2025 08:59:13 +0100
X-Gm-Features: Ac12FXwFaub6kV3Kd2ykY4foMIV_-u80DlGRtIr2iGvqoKH4iO-6ScE4yMry24U
Message-ID: <CA+EHjTxPfzDk=XmwS0uAtjwsYB829s1uZSMC6x3R6KGQ-SqjtQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250902_005952_970576_D4FC6966 
X-CRM114-Status: GOOD (  25.54  )
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

Hi Patrick,

On Mon, 1 Sept 2025 at 15:56, Roy, Patrick <roypat@amazon.co.uk> wrote:
>
> On Mon, 2025-09-01 at 14:54 +0100, "Roy, Patrick" wrote:
> >
> > Hi Fuad!
> >
> > On Thu, 2025-08-28 at 11:21 +0100, Fuad Tabba wrote:
> >> Hi Patrick,
> >>
> >> On Thu, 28 Aug 2025 at 10:39, Roy, Patrick <roypat@amazon.co.uk> wrote:
> >>> diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> >>> index 12a12dae727d..b52b28ae4636 100644
> >>> --- a/include/linux/pagemap.h
> >>> +++ b/include/linux/pagemap.h
> >>> @@ -211,6 +211,7 @@ enum mapping_flags {
> >>>                                    folio contents */
> >>>         AS_INACCESSIBLE = 8,    /* Do not attempt direct R/W access to the mapping */
> >>>         AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM = 9,
> >>> +       AS_NO_DIRECT_MAP = 10,  /* Folios in the mapping are not in the direct map */
> >>>         /* Bits 16-25 are used for FOLIO_ORDER */
> >>>         AS_FOLIO_ORDER_BITS = 5,
> >>>         AS_FOLIO_ORDER_MIN = 16,
> >>> @@ -346,6 +347,21 @@ static inline bool mapping_writeback_may_deadlock_on_reclaim(struct address_spac
> >>>         return test_bit(AS_WRITEBACK_MAY_DEADLOCK_ON_RECLAIM, &mapping->flags);
> >>>  }
> >>>
> >>> +static inline void mapping_set_no_direct_map(struct address_space *mapping)
> >>> +{
> >>> +       set_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>> +}
> >>> +
> >>> +static inline bool mapping_no_direct_map(struct address_space *mapping)
> >>> +{
> >>> +       return test_bit(AS_NO_DIRECT_MAP, &mapping->flags);
> >>> +}
> >>> +
> >>> +static inline bool vma_is_no_direct_map(const struct vm_area_struct *vma)
> >>> +{
> >>> +       return vma->vm_file && mapping_no_direct_map(vma->vm_file->f_mapping);
> >>> +}
> >>> +
> >> Any reason vma is const whereas mapping in the function that it calls
> >> (defined above it) isn't?
> >
> > Ah, I cannot say that that was a conscious decision, but rather an artifact of
> > the code that I looked at for reference when writing these two simply did it
> > this way.  Are you saying both should be const, or neither (in my mind, both
> > could be const, but the mapping_*() family of functions further up in this file
> > dont take const arguments, so I'm a bit unsure now)?
>
> Hah, just saw
> https://lore.kernel.org/linux-mm/20250901123028.3383461-3-max.kellermann@ionos.com/.
> Guess that means "both should be const" then :D

I don't have any strong preference regarding which way, as long as
it's consistent. The thing that should be avoided is having one
function with a parameter marked as const, pass that parameter (or
something derived from it), to a non-const function. Instead of
helping, this could cause a lot of headaches when trying to debug
things in the future, and figuring out what something that's supposed
to be "const" is being "corrupted".

Cheers,
/fuad


>
> >> Cheers,
> >> /fuad
> >
> > Best,
> > Patrick
>

