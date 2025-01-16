Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B488C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 20:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cBjXp+Q0kBMQo93pn9/JG/mDdpOMWtXcKEJJB7g0DX0=; b=xp56JrVTvAzW8SwdJAqk/sQOgP
	X0yXrE5/txyIektsuxdcobhrKa00FzHC/0KaV+8AJjFCCZE4zr2+1vge5rMTNEYfUVGP3UrogUywv
	NBRYqTtvG7/C7yaNu+9h4ZkRhu7jYkTO0O3Gc5QFpKmrAGK4eHt1VzA9Zg3YFeqr5WRc1iPLhbWaU
	nQbWnt8By9kxIjiI77Yn5srtcm3+573KVa/EuQSbYtxsPat8I3S5eBpIjHn2b3OtUCThYVlYe1B/U
	X1+SSg1sT82/gt+sd1ulV6I9y+t7vSRXlstcbMhcQ6jUcFeLt4evO/yEFDIlaHZVQNmiks7sydtCX
	y6bxeyig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWYZ-0000000G2XR-2dPN;
	Thu, 16 Jan 2025 20:33:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYWXJ-0000000G2Mi-1HSv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 20:32:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737059535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cBjXp+Q0kBMQo93pn9/JG/mDdpOMWtXcKEJJB7g0DX0=;
	b=FqCqi3TWOb2BbweNIeGvtX21i/va1/7tyuDXVuTXQy6wqsb7dk+cpt+jSU3hJNIXripBJf
	CCNsU//XFkXZkAOLuAx/XRtC2A523VDAA5EVg12pWxTVxYjn7Rgh8SNnbmdhH+n8HVUR7H
	x5rcK0h7NRu3KnjGimrI4igaIBsODWM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-vH8YJ6_eO2moT9n4zV3hhA-1; Thu, 16 Jan 2025 15:32:13 -0500
X-MC-Unique: vH8YJ6_eO2moT9n4zV3hhA-1
X-Mimecast-MFC-AGG-ID: vH8YJ6_eO2moT9n4zV3hhA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216311faa51so23093725ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jan 2025 12:32:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737059532; x=1737664332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBjXp+Q0kBMQo93pn9/JG/mDdpOMWtXcKEJJB7g0DX0=;
        b=ooSdXlE93eAt/xeahNENtPcjoVSV2kfGtYfA5JUeMdPPIkqbz7okLj3MBrdQ+lsOOf
         vGqLuBhY6SC4PisErqbi0WJSprYbwUmU416vCAKfiyt7k0scOTwFY11Ogw0laWjUvf0j
         fItZ8QT8XFL7x+mxObl8NwQ1ZVRbdjoW8z0kQVZXQ3FALfDh8pZ3p0dUINE9n4jK6uHh
         LlIOwA18o3KzzvvtSs516KjhRJrpdF9eNzUAdAtcbA/SZCP8ENF4F5XJciZ32i8KQr+k
         KMmfj9+p1VLWru2G944rPwwS+9G/gNDBFRLvw8m2gyR08N0zt1ig9HTW5C9HKlbnwvnL
         vybA==
X-Forwarded-Encrypted: i=1; AJvYcCVQtEpFxg1MUFoF3q0UH3myRK4VlHsblKqjNbRExHPl20udHccdwK1bdhP0m0B3nGE9yfwftCAYH5vAep0Z6WWm@lists.infradead.org
X-Gm-Message-State: AOJu0YzfZ/8mhUPUoL0Dl0ij5/uQH2QlLBwH1AyJSQPIHvnNwpwNGaCj
	4SeSgs9L8Zf6zj6yl1eUDCeJGyrlmDUxlJmrvAMnFJ7R2VvajMZFOIt23RApO0f78+uA+KdYejU
	dG0tR3yS2r7a7wIllPS81FoqrdUQFey1SQEsRdfmJEDYDjoA7wYbxarFeCu7tLl+xmHn6kQ0X
X-Gm-Gg: ASbGncs2L0vIYFcR3BPSGrxFRlEoPIeWe2C5cOedEnU10xlpDOXZizUO0puweOlI4lW
	xMFyij94cXezwFrgEa5U1JnH36s/0Ru3gwUsFULp4lV0i/2cNi+DFYg0mhnVnuxOUTuQfdA0SqT
	ZFv47dNKcjYTBR0lh7tDC/rQm+Yk3aJMd3R6bAjhW6C+xOCbjVWoOF6qZlORpTM+7arerrNNSfp
	l5PUaHHIRWmO0v9j6Dr/lH3gbnJj9MgbRVa9MpRwZ1Q9ch9CBDae98ND9EnBkfQ3LuO6A7OIueY
	qRXqaUh6Vz0F5fwkwg==
X-Received: by 2002:a17:903:238e:b0:216:311e:b1c4 with SMTP id d9443c01a7336-21bf029e049mr110709305ad.4.1737059532478;
        Thu, 16 Jan 2025 12:32:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKxzy3YKG0/4peNFIGTyI8M6fxHbUDzV/T0Dy6Fv99Nr5xuebiMcqfPD2o4c5t4sCUc/gI8A==
X-Received: by 2002:a17:903:238e:b0:216:311e:b1c4 with SMTP id d9443c01a7336-21bf029e049mr110708925ad.4.1737059532113;
        Thu, 16 Jan 2025 12:32:12 -0800 (PST)
Received: from x1n (pool-99-254-114-190.cpe.net.cable.rogers.com. [99.254.114.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdd30e9adsm444712a12.62.2025.01.16.12.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 12:32:11 -0800 (PST)
Date: Thu, 16 Jan 2025 15:32:06 -0500
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
Message-ID: <Z4lsxgFSdiqpNtdG@x1n>
References: <20241204191349.1730936-1-jthoughton@google.com>
 <Z2simHWeYbww90OZ@x1n>
 <CADrL8HUkP2ti1yWwp=1LwTX2Koit5Pk6LFcOyTpN2b+B3MfKuw@mail.gmail.com>
 <Z4lp5QzdOX0oYGOk@x1n>
MIME-Version: 1.0
In-Reply-To: <Z4lp5QzdOX0oYGOk@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _onPaCbMsOF5CLfO9SowLJjmiUOF9Xz2w_XCBGOKboY_1737059532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_123217_418796_09FE9B85 
X-CRM114-Status: GOOD (  29.39  )
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

On Thu, Jan 16, 2025 at 03:19:49PM -0500, Peter Xu wrote:
> James,
> 
> Sorry for a late reply.
> 
> I still do have one or two pure questions, but nothing directly relevant to
> your series.
> 
> On Thu, Jan 02, 2025 at 12:53:11PM -0500, James Houghton wrote:
> > So I'm not pushing for KVM Userfault to replace userfaultfd; it's not
> > worth the extra/duplicated complexity. And at LPC, Paolo and Sean
> > indicated that this direction was indeed wrong. I have another way to
> > make this work in mind. :)
> 
> Do you still want to share it, more or less? :)
> 
> > 
> > For the gmem case, userfaultfd cannot be used, so KVM Userfault isn't
> > replacing it. And as of right now anyway, KVM Userfault *does* provide
> > a complete post-copy system for gmem.
> > 
> > When gmem pages can be mapped into userspace, for post-copy to remain
> > functional, userspace-mapped gmem will need userfaultfd integration.
> > Keep in mind that even after this integration happens, userfaultfd
> > alone will *not* be a complete post-copy solution, as vCPU faults
> > won't be resolved via the userspace page tables.
> 
> Do you know in context of CoCo, whether a private page can be accessed at
> all outside of KVM?
> 
> I think I'm pretty sure now a private page can never be mapped to
> userspace.  However, can another module like vhost-kernel access it during
> postcopy?  My impression of that is still a yes, but then how about
> vhost-user?
> 
> Here, the "vhost-kernel" part represents a question on whether private
> pages can be accessed at all outside KVM.  While "vhost-user" part
> represents a question on whether, if the previous vhost-kernel question
> answers as "yes it can", such access attempt can happen in another
> process/task (hence, not only does it lack KVM context, but also not
> sharing the same task context).

Right after I sent it, I just recalled whenever a device needs to access
the page, it needs to be converted to shared pages first..

So I suppose the questions were not valid at all!  It is not about the
context but that the pages will be shared always whenever a device in
whatever form will access it..

Fundamentally I'm thinking about whether userfaultfd must support (fd,
offset) tuple.  Now I suppose it's not, because vCPUs accessing
private/shared will all exit to userspace, while all non-vCPU / devices can
access shared pages only.

In that case, looks like userfaultfd can support CoCo on device emulations
by sticking with virtual-address traps like before, at least from that
specific POV.

-- 
Peter Xu


