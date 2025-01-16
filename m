Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2DEC02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxyx17H16LTaCMPogGfVhxD8KdAjR1MUqsEp+1MdmBk=; b=P7foN4ohH5Bh0T2i6cDshv+1sJ
	g076fgLKO/5oAL3TvZSJ7wSuvS4HE+uNGWDgfOqgtQPWAWA6RD7vEY5Z2nnYAY8wz6Pm7zarTQKuq
	kvblJjPt6y3YtKCoyQHVn38ILbezFq31iCAYsyjgSRO42Me6OqRqsNLbJXNPK6uIg++CEMwOZH1k5
	q9ANpdP8f6rX8st4g/JZ8jIY0iBK/uxY0d67XtJ8yHpLS+KTfjM3jndmikk0pgWFd005ulH+lRkd4
	tEOHHun1zrNDqGCd+Tm+iY3dnzbMdKTcwuiYkY56Q15I9IDM5fh5qZwGQLH8wUMLxvUEymNnp5e11
	B3Ug+dRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWMi-0000000G0BB-2auB;
	Thu, 16 Jan 2025 20:21:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWLP-0000000FzpD-3dgN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 20:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737058798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hxyx17H16LTaCMPogGfVhxD8KdAjR1MUqsEp+1MdmBk=;
	b=Gj069CJa4nUwP9pKLTx2K5xZxYQESBVIoikqa9aC/KEUu5iNOYUOCzLH/zic+lmPFyOIga
	G9zjhhgA69K46lgaCiVTQoh4F4qJ0+/ow4VSS3XpEB5sBDmXlFB8f3YoEKIAyKnTUoTcOJ
	7AkXARApq90qXGCo36r3AybiBSQqNPQ=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-EQT-uhI0NX6wcdMl3vl5TA-1; Thu, 16 Jan 2025 15:19:56 -0500
X-MC-Unique: EQT-uhI0NX6wcdMl3vl5TA-1
X-Mimecast-MFC-AGG-ID: EQT-uhI0NX6wcdMl3vl5TA
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2164861e1feso23831095ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 12:19:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737058796; x=1737663596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxyx17H16LTaCMPogGfVhxD8KdAjR1MUqsEp+1MdmBk=;
        b=TwjEkPFt3zFrBVrKoTv4SqqCixbPOjnWWoCjnjKIS1LJ7YYHfJAK0Jdj03a7jygbCf
         Z/kh46CNSARcHKQ3Gz2jYctRw7dzAnZjpiuMBYNlJmCi2kYjXIIbiTxaYUEfVUzGxoV0
         qDYSZr9uAWWtgLDJrQfIvIjQ8pLBKf+opLmgdHdUW3UWD+0utIxFemQf4Ce8h5Hg6Hi1
         WoUVOqPc1n4e2nPChrfF0XRZxG0Iz5dEYkLzJCFjs+WXaXozy+YlzkQHjYu+1/diUpY+
         3/ptFcCvmc+0rjdGaw6Zv/vjACb6O7HvbCVZSGZB0tHrHkYRqYiwK3o3OzqGupUE1CGv
         6YtA==
X-Forwarded-Encrypted: i=1; AJvYcCUDXJCR1xTPuRXQIXoGfUig/GsOXlbZx733oSLKie8CT3X7gapZKQmdKhdXBRVepkPZU3OKTfYDp26h6Dtw7OSJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmw3Mesf/KwNmMkoK4EW+UmYl0rdmBFKRlQp8SGRzQExGAfXvy
	cliefBK0F4HpA3fsKGBD9Raf8dT5PSsTXeUJepz3PdkPceGBEyuxtlytQYf3tLf8fJub8FRt/X7
	ehUt29LeowcVDa0529zpEX6yMccBM0yhtgCAuMEJMvCWW2DVx484+6/bE8Gmas0WnZoy1DCyz
X-Gm-Gg: ASbGnctEhds4l1R49tcrEQikc0U1N8kZGuVmvaTRsWJU2BVuCln/mHUjruHObop4x2A
	oTYw/6HjushGs8awExDPCWZ5qT7ZVqKCH/Rr0VEzOUL856GYUHScFSdufoIN+Fqv7l5M3WjAZY0
	udMZNYYE4wazBS8Co2DP0urHQybYqGtf97AktCQjVv5a3BqCi+siQJ7URJ6d+tq/cqVBg1btlYF
	0dFS2/py2z1deR70hVsnB1dgTDjvbyg8rffU9q0BIX4124UnLRxH0zRmtYyV2tc+cpZYHM7fuxA
	UzLos2c036koInYufg==
X-Received: by 2002:a17:903:1105:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21c352c77eamr1589145ad.2.1737058795383;
        Thu, 16 Jan 2025 12:19:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCdUZtxdruuZ9dhKBDB1S+oAh8pcb12HPEW8IyTWaMSLHmWxJL1Esm0PAWT5jrhgt1RJfKYw==
X-Received: by 2002:a17:903:1105:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21c352c77eamr1588855ad.2.1737058795018;
        Thu, 16 Jan 2025 12:19:55 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3ac3e2sm3791465ad.139.2025.01.16.12.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 12:19:54 -0800 (PST)
Date: Thu, 16 Jan 2025 15:19:49 -0500
From: Peter Xu <peterx@redhat.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>,
	David Matlack <dmatlack@google.com>, Wei W <wei.w.wang@intel.com>,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v1 00/13] KVM: Introduce KVM Userfault
Message-ID: <Z4lp5QzdOX0oYGOk@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZUl5Ror5TUNBgmotIpLKMm8StcE2NG4y9aPTfgALkns_1737058796
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_121959_973429_7BBE1DA8 
X-CRM114-Status: GOOD (  17.26  )
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

James,

Sorry for a late reply.

I still do have one or two pure questions, but nothing directly relevant to
your series.

On Thu, Jan 02, 2025 at 12:53:11PM -0500, James Houghton wrote:
> So I'm not pushing for KVM Userfault to replace userfaultfd; it's not
> worth the extra/duplicated complexity. And at LPC, Paolo and Sean
> indicated that this direction was indeed wrong. I have another way to
> make this work in mind. :)

Do you still want to share it, more or less? :)

> 
> For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> replacing it. And as of right now anyway, KVM Userfault *does* provide
> a complete post-copy system for gmem.
> 
> When gmem pages can be mapped into userspace, for post-copy to remain
> functional, userspace-mapped gmem will need userfaultfd integration.
> Keep in mind that even after this integration happens, userfaultfd
> alone will *not* be a complete post-copy solution, as vCPU faults
> won't be resolved via the userspace page tables.

Do you know in context of CoCo, whether a private page can be accessed at
all outside of KVM?

I think I'm pretty sure now a private page can never be mapped to
userspace.  However, can another module like vhost-kernel access it during
postcopy?  My impression of that is still a yes, but then how about
vhost-user?

Here, the "vhost-kernel" part represents a question on whether private
pages can be accessed at all outside KVM.  While "vhost-user" part
represents a question on whether, if the previous vhost-kernel question
answers as "yes it can", such access attempt can happen in another
process/task (hence, not only does it lack KVM context, but also not
sharing the same task context).

Thanks,

-- 
Peter Xu


