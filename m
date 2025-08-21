Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D53CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 02:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=; b=AUyukbH3bSj843chtH4deIJYzC
	8XeiRipaGyYLd/XW1PibhtpuDzubqIAW0aUMd7LRTdAydOL2sZPPc5ZGUQ+Am7BMx1Gx2d/nM/bJm
	rrhVPv0OC1bJS28uyOO0x4W5ZYoqcX97HBwdwxE6IDQM6JYka8+NJX3iVWyc0358faHWSkdNvA7Kt
	GoFc8oMkk+rr38T35SqSTyjRfeza9TCkRcKbG/ctNTiZj9spVdpXbVS6pZXXv452TRP7GSDhOthJB
	A8JZgzcS3VslCIEpvgUwR61msjxlwa5w0c9/mgbDyz2oQ9umOjbYtMSdqXvgCUhKgFcCHjyPSGP9F
	58m1tDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upH57-00000001Cbv-0Hl6;
	Fri, 22 Aug 2025 02:00:41 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upC1d-00000000Uw3-1Fob
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:36:46 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e933af9f8b5so1158480276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1755808604; x=1756413404; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
        b=V3r67x+OP8d5deMjJ0E0HJPAQN8bmgWA70sFhRz164JCEY6mKaT3uvqmJi9lLg3ok8
         qYVSTU6oKn5GnVJ/sY6lXjE9tP/sWd5sBJeHL4CVQE+DO6hors3l9hw9ZHGfEgJaN+ed
         YC4EA+v7Z/qMUWjYLe3a/wxcb7+hKKCtTd5Vo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808604; x=1756413404;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=083PuN2wICwWm8iwB5WBlP6qyKXLyqdZEBdZ0ztp8l8=;
        b=vvaz7yEV0XPIAN7GEToiz6FeXEdneueaJbFEMVrLmJZh94ShZ4JeHw1pqKKSlSVaTN
         wUeM2JNZCQ/7DNtNmh5VjAClxj2fSOea3GK0XaxqmIOR4weutnCW106ln16/uKX+++sM
         zie98uGaSkijLsxnem3vON6j+ZNL9xVI6vELf/a0EnF133i3zfkQB1loW75h8nvZaO3/
         8xFNIBHzIw3A8rFbja3chJQyLyJUW2Ohq3uiRXb9PjbqtJhpoCsmHvMmHQlRKb+TMTle
         fU4cBav/HMkhQQeF2kDox1XLzcJNoWpm5/bUD4GGJtuXbbv90tAxRN+NrTn2P4rZenFg
         U1VA==
X-Forwarded-Encrypted: i=1; AJvYcCWhJ5IlSZW/+qxTZJnq14iI952CuUl8B2XKDb2/dFRhQjhmKzrxt9xMAP0xWP6Y1zjA4uTTxOvxz52yDd3BVxmn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxf2mHn14S1dq4wZGjo+oPQ89SIsMKAvbBv+88BbFTygwALJh1W
	jT21p1+Syo+rbMIrTGf7J3haa8fSOeSyxBc8ftbo7616OzSiThp2pEchokU5Mtip1nUORLdAIyc
	8BJ+IfhsDv4Buluj0fkjafn7Xd0i9nedvW7oNuPwdmQ==
X-Gm-Gg: ASbGnctQnEeNjgMbsTeZ9J0ZqtqN8vdts52JEHhWtYg90fa+ZqkM9mUHrR+97wVhWTm
	E7BKnZaVFAxqP/fE1FS+CMt6842vTK7MNBlcIP2oIHvx7V2KT8YuJBgHhdCrVYI8S73jAyQtiLB
	qHv2j95Ns/J3V8L+WuJueY1es6o9L2VwTv216bI9F4tpQNKL85mGu7aywhPwatVmXoCZDfkKTLR
	bXsSHGD57DO9wtfq43eOQRPINA=
X-Google-Smtp-Source: AGHT+IHnF0lVhm+1Tun1UWlMLnnSk/jF/jUOt69DP22IOjEUNxjHdHqCJTIRGjm6XM6hiUq/Axp7jnIGuYc/D1Y8ZZI=
X-Received: by 2002:a05:6902:4381:b0:e94:dea:b80b with SMTP id
 3f1490d57ef6-e951c365621mr715984276.40.1755808604080; Thu, 21 Aug 2025
 13:36:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250821200701.1329277-1-david@redhat.com> <20250821200701.1329277-32-david@redhat.com>
 <CAHk-=wjGzyGPgqKDNXM6_2Puf7OJ+DQAXMg5NgtSASN8De1roQ@mail.gmail.com> <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
In-Reply-To: <2926d7d9-b44e-40c0-b05d-8c42e99c511d@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 21 Aug 2025 16:36:32 -0400
X-Gm-Features: Ac12FXz8i_O0Dca-zCdGNOyRYVeCyfB9Z0ucQ3KoLazk0PNM2PIB2a_qe1sXKks
Message-ID: <CAADWXX81Y3ny6WvDN8EeYvBPa2qy10PKhWfZpj=VBcqczL6npg@mail.gmail.com>
Subject: Re: [PATCH RFC 31/35] crypto: remove nth_page() usage within SG entry
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Alexander Potapenko <glider@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Brendan Jackman <jackmanb@google.com>, 
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, 
	dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	iommu@lists.linux.dev, io-uring@vger.kernel.org, 
	Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>, 
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com, kvm@vger.kernel.org, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-arm-kernel@axis.com, 
	linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org, 
	linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
	netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>, 
	Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>, 
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, 
	x86@kernel.org, Zi Yan <ziy@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_133645_343699_15752F68 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

Oh, an your reply was an invalid email and ended up in my spam-box:

  From: David Hildenbrand <david@redhat.com>

but you apparently didn't use the redhat mail system, so the DKIM signing fails

       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE)
header.from=redhat.com

and it gets marked as spam.

I think you may have gone through smtp.kernel.org, but then you need
to use your kernel.org email address to get the DKIM right.

          Linus

