Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFB8CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=; b=Ir4+lCLdUSai6+KX5/y8R5m7Vw
	ebSTE0GXyEm9meR89nEz4Ywtt2WxQC4iVi8d9PBznlDMR9tQSJqngbLC3pIMCihCvfoiReE5hy960
	AGc3oPSd8sMoVokmJoTQsWN6hYw22rVPR35Ud0b5nJ26Skz2p8E0X/aDpxppX7SOIWdXGb6YXyAja
	bYJ4VeWugw7o8X7sUOYleVdEwntbmGktNahuXe3Kk5cjIWvypEv86Dp8KJFJp4X/5tlpKWJAwkvf8
	2zWlD5BSt5kWmsqyu8GZ+z0I20DoTrCBJnHbfIuQDR+blMGiOoNmf9sjOQ72mupSKIS9Xvch2LDiX
	STNsoWsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXIR-00000000eKK-06En;
	Thu, 28 Aug 2025 07:43:47 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urXAr-00000000c4O-0QeG;
	Thu, 28 Aug 2025 07:35:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-61cd1046d42so778225a12.3;
        Thu, 28 Aug 2025 00:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756366555; x=1756971355; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
        b=jnivqwC41byNBcXSFuMHi+axyKQo9qL0sVM5K1ctO8wCTZPCTdZuA9MR9jyZPXrFm/
         sd/JCmEkIvg3Fs/aWHtiNtkq1ILwuq1s7Q3kZK/FeoKRsdTTzsh3a+gV9pQtAExWDK9W
         ojUit9pEEaM48xY9rIUf/RUKqey8HaArCIcsdSOVxT3CH6lTBPNPfFipimBXuSP4tKPC
         KAcJ+J21Wg87fs0q6teAZg7yE69hdw/jiJnhUi4JAgaIhS2IGIUgnWhZDO4kuOBQqj+t
         WS95/+c9dzeV9RsXZIR0svcqxw5qMcLm/3N9fUwDTGrW/Gwt8tuKW1O5srPX4vr8J/wo
         Saqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756366555; x=1756971355;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q0BfjvXaX7EhpBrJcO9diF40ujDlSeO28TY40tQufFs=;
        b=bIaTdN2thYdW4O98RR4RGDUrZkD43VtS0Ito/GzdWr/nnJ9Q51DKcvQz0/U33Pv2fi
         qoCPnaNEaRagT78l2As6Hcj4TbhuM9I6/Jj3ruAt/09XMXmB43yNqaqLD9atOqwH396W
         pUHEnpTpTZVIG9Boy2m09SGADyiJi4abeotJNYoCx32m7TReIkqAOw7p3WmVj5/nqcR8
         j+FO2cCtqoIyKsQz93n41uacAI5/foDugIDuHAfxjBMH9+RNAHDUj1WAj4FvJAfFCCMB
         wvESRbZB4iKGiDiwCljByySTlRNsdAo2AThTnz7fXUAK6rz9hA/WiTzGNHqRxP67D1ad
         UqjA==
X-Forwarded-Encrypted: i=1; AJvYcCUoMssK6yb5WOWZDCLRORjED974OYWCLIhkj2ipVnwIgYxDPUd7B152qSsaKlcNiXK467+M+wEmx2NM6TkFC5Gz@lists.infradead.org, AJvYcCWLp3redamK/Bgp3DSAz+g1HrmiewmmGvv9pAj7+pnCDr6HS/Fcop0fg5QDVkIeUZnqc8KEK1gB2tXjAdg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9MUzxk85d7Vh7biuYOLO/Dmlgnh69NyJwbxJHpECp51caQClI
	99sR9fXzqGLiesPUYd493JIwx7+ydmKFeGBl+uw3bgchxtuVQCpe0eQl
X-Gm-Gg: ASbGncuOKoda2P+G5Rw8f5gDHhg9yx1KD46Qq928/HTj3PoS8FNFIe9HZNaj3bFI6qA
	RkhmQKwdputHJOl86CgZ88gtmuguQe6eKPqwn+HToZdHBlSPeVvQ4HdzVzJ92utiJlSwNS/10U3
	WKVyCPIj9SbZ3nldiuYmQrBRAv1uc0ttX8lRrPUodeWU8raTsfDY0s7hMacCta+d4EYoyRkBfcS
	QaPU0TX6KEfVtDnNNWt09CZWJi7H0cQSv1cOzEtNp4yT3cLesy0UoIl15baWNjZK5rTFwJQgTf+
	fy2QY2dtLWB+TwiwR6oY7svMtk015jYea5Yvwc/I6a7w3tJD9+I8af9SBCgxieiC+8W/k52D7Kf
	l4b9iI/n93sM95XS2tiUDDmGMbw==
X-Google-Smtp-Source: AGHT+IETTLjGc3PPKg04ncd1zRzcObVAV207MWaWJmOCZt1EmbrBQuEK0aAe9NGL4LI6P2OcE9HkdQ==
X-Received: by 2002:a17:907:fdc1:b0:afc:aa44:bda1 with SMTP id a640c23a62f3a-afe296bcae4mr2097332866b.54.1756366555363;
        Thu, 28 Aug 2025 00:35:55 -0700 (PDT)
Received: from localhost ([185.92.221.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe68891cefsm988052566b.66.2025.08.28.00.35.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Aug 2025 00:35:54 -0700 (PDT)
Date: Thu, 28 Aug 2025 07:35:54 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>, Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org, iommu@lists.linux.dev,
	io-uring@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>, Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
	kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com, x86@kernel.org
Subject: Re: [PATCH v1 10/36] mm: sanity-check maximum folio size in
 folio_set_order()
Message-ID: <20250828073554.evipmbkxrint3tbs@master>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-11-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827220141.262669-11-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_003557_139102_74E58D16 
X-CRM114-Status: GOOD (  10.45  )
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Aug 28, 2025 at 12:01:14AM +0200, David Hildenbrand wrote:
>Let's sanity-check in folio_set_order() whether we would be trying to
>create a folio with an order that would make it exceed MAX_FOLIO_ORDER.
>
>This will enable the check whenever a folio/compound page is initialized
>through prepare_compound_head() / prepare_compound_page().
>
>Reviewed-by: Zi Yan <ziy@nvidia.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

-- 
Wei Yang
Help you, Help me

