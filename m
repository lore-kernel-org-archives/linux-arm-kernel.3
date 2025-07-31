Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81264C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eiNYedotPctc6xPTtf1N6xVN29fIlNTNoGPInQPwrIg=; b=sw+kJ0DAbIjxx0WWAGFvBMwrcv
	a+ie4lcRlwaN51+n5CttB1RCvJfqDGbkf0zRzMGRoP8Elx/gX8483r79mZaaH5ZgbsUhTcrSxUyx/
	E91cPp7INya1ScG2klSaaiXnEdJYd+R7R3Bn+A9PK338fQtbhMyM1R9iKWsrgK/RgSC9JdrEv4Uc9
	wTbv1kuxOsqFlhE6/gFVEzVXZoFpiscZ+K0JzQ5raQg72tmggPqqcK8fseNoytyA5R8AtGTwK/kce
	ICZIDLqLRTaYZpnc10zW5MmeUWXiqjV6+rGhaQHAGIymtINGfv+Kd3RpTjh2Kt/ETC+xbw/tLWUYO
	Bk1+kadQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOup-00000003CKn-2izA;
	Thu, 31 Jul 2025 08:45:31 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhOk0-00000003Aha-3OpI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 08:34:21 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4aef56cea5bso67451cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 01:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753950860; x=1754555660; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eiNYedotPctc6xPTtf1N6xVN29fIlNTNoGPInQPwrIg=;
        b=mJyAyViN8IuAHnoF30Z/vyMEb6QaODDhDq0I7f9iiYQXVUFtC+K0e2lzAfntvz6JGe
         rPwP6IyN5SovZ8sd6ArGrVDFsu5sqU4RVM7y1xHE3ZnnHhhq+sYcvU1OZMHyyAsn8tMh
         1/9h9XNQ4Sng0H04fm7j1NJ6oeue7OE3p5AYnYVf4rKSbp4zEY9oj95vcQd9V7YywwDi
         vNYnFxWtXnAjpZ6qWOfoUgOuZ0auIuiu52iwH0tItpgIb71FhFu8Ag8QZPbUjEPNtjnD
         f0MGhGx5OTuMwcTVqz9uARRBq0sORID7eBPIghpzsKQYbeXOl69Q9NHo/JVpUuN7v3NE
         9R6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753950860; x=1754555660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eiNYedotPctc6xPTtf1N6xVN29fIlNTNoGPInQPwrIg=;
        b=owwmqJbODJsSdkaGJCIl0uUqpU7v/HLH3i3Lkm2Adk7JUydiHAPOv9FVYj+2fSIiXU
         QZ5dh4Y+RJxqG4ZGDgZUPiFVpK43PTJn46qpqt8KG7iqTiOyCkqejWP/VWaI6JxKwncF
         apiZH9F0OXocIFqBG/UA1mFATsQo4dXxkg2w3v3//hKc4rfb7T92aKGUVliJRQrLdIXw
         mAtP+ZMmO+MX1oCgbluskxSsW40udVwu1v/6DV58OnKsQzmNAip2bY2E1sSwEOY4033y
         0PNqBQfvu5g8czpFlB1EVB+dFgA6yiOQ952KChO91OoVk/AoqIdalKQ43R9baBHoekt2
         XO7A==
X-Forwarded-Encrypted: i=1; AJvYcCV7StpHqAv13W8WOvKK2w3OrD0983ijKGfPJKq29fEU6oytcuDesh4ehv7gvDkbnBJWoC9jPkacyfHO0NTN38Au@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl9zy9lXNrhwkvPxI0hcWAfg0SsbVATaetei2ZFE8jyl7ln2ln
	gFH70MLIhGDnbQIvvGvs856tNjqdqqR24GmrLDu027IAvvbfwrzGmF3yzvLd1vBMlZLGIjb0i7Q
	s1i3Ii3AUvoqKx9/64SUKFpsTBla94XQRQho4ucVO
X-Gm-Gg: ASbGncsfz8mm6tvOP9sIZiAvlEV5MVQCw9av9eS14vaN0n/zGep8VIDEOpoX09JRzXe
	U8eab+1MlhVxYU1qSECjNgT3MizqirFCMIBRqGDo/ycCj0JmgxVDttz9yLbQBqHoF8kMhbXSGb2
	jmiQmCOLronDZmZ9yhYSOKcysyrYN+SxzGr6UuAQ7cCZdZw9MmJkU6h61ZvCZvpz8fUPMbwMwAe
	e1PxomNVpMql+udFg==
X-Google-Smtp-Source: AGHT+IHWSj7+ppidqQQ7crIyrSg2wcIE/rWj46ZOv/ucXGZB3xZ7fB2xhdup8ZybMJXt3sd69EoqALJyiMp0TePdZrs=
X-Received: by 2002:a05:622a:9:b0:4a7:e3b:50be with SMTP id
 d75a77b69052e-4aeeff8952dmr2421461cf.16.1753950859428; Thu, 31 Jul 2025
 01:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250729225455.670324-1-seanjc@google.com> <20250729225455.670324-13-seanjc@google.com>
 <CA+EHjTwuXT_wcDAOwwKP+yBetE9N46QMb+hUKAOsxBVkkOgCTw@mail.gmail.com> <c320b7a3-bf75-4f9e-bd72-4290fd9fe9d9@redhat.com>
In-Reply-To: <c320b7a3-bf75-4f9e-bd72-4290fd9fe9d9@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 31 Jul 2025 09:33:42 +0100
X-Gm-Features: Ac12FXzoE81EGQG0C5ZbrL6pv7Gwfmxe6c2Z4n5qEJHhSLSLb8R4m4jCH0y1OFY
Message-ID: <CA+EHjTx8KiDS+WcB9gpWaKtmEaC40gdE1ZDaMJydHfMJLVLbwA@mail.gmail.com>
Subject: Re: [PATCH v17 12/24] KVM: x86/mmu: Rename .private_max_mapping_level()
 to .gmem_max_mapping_level()
To: David Hildenbrand <david@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Gavin Shan <gshan@redhat.com>, Shivank Garg <shivankg@amd.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Tao Chan <chentao@kylinos.cn>, James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_013420_849750_8B2D6028 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, 31 Jul 2025 at 09:29, David Hildenbrand <david@redhat.com> wrote:
>
> On 31.07.25 10:15, Fuad Tabba wrote:
> > On Tue, 29 Jul 2025 at 23:55, Sean Christopherson <seanjc@google.com> wrote:
> >>
> >> From: Ackerley Tng <ackerleytng@google.com>
> >>
> >> Rename kvm_x86_ops.private_max_mapping_level() to .gmem_max_mapping_level()
> >> in anticipation of extending guest_memfd support to non-private memory.
> >>
> >> No functional change intended.
> >>
> >> Reviewed-by: Xiaoyao Li <xiaoyao.li@intel.com>
> >> Acked-by: David Hildenbrand <david@redhat.com>
> >> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> >> Signed-off-by: Fuad Tabba <tabba@google.com>
> >> Co-developed-by: Sean Christopherson <seanjc@google.com>
> >> Signed-off-by: Sean Christopherson <seanjc@google.com>
> >> ---
> >
> > nit: remove my "Signed-off-by", since I'm not a co-developer, and instead:
>
> The patch went "through your hands", right? In that case, a SOB is the
> right thing to do.
>
> "The Signed-off-by: tag indicates that the signer was involved in the
> development of the patch, or that he/she was in the patch's delivery path."

I see. I thought it only applied to the current re-spin.

In that case, sorry for the noise! :)

Cheers,
/fuad

> --
> Cheers,
>
> David / dhildenb
>

