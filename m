Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88EACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CIAv+UZ8t7s5h+WlDS73yJMkdztMQ3zXG2Fxq/to8M=; b=edOzEFxeHhB+Q6qXRiGbYKpLkV
	1yCw71LNZRSJcyfo5uZS97UMsXkAxaai+hWojrys9ICZmCEB4+5laH6YqEVzOnB8IK5GfbrJTKH1o
	fZptJQSNKXF0PrIa7F3yIoF7TBLGtBPSRJgJKsfoTew5+qxYzSEpgi0uDJAc3azaE1mwCrVJeXQ+I
	2mptSX9XXi3mjVmXvHuV/oJYlAltYGoDx981WfeIe1kLLioP3p362fiUG9mv5VSuKBl1jKeieUS2y
	9pZJouMY4JtEI2eETeP3EBAxu3xxOBX/8/TXhhFmctYNfu+cSI5qn78DREQt22zDIOjztHP+OcL0h
	Q+RMWAYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjc9n-0000000BuHT-01BA;
	Tue, 14 Jul 2026 12:22:39 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjc9k-0000000BuGd-0f1Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:22:37 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-92ea24a2dbfso317289985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031754; x=1784636554; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5CIAv+UZ8t7s5h+WlDS73yJMkdztMQ3zXG2Fxq/to8M=;
        b=f8EmQ76uyfF+rwtVE+l6PY1PKXt6LGh100JdIjzM9Fz+khCzuMfdbTEsUyMy2P/Kn0
         B1Qv9FONG7zrN6Kam/9WVGBkKLKmTiHMjcrDUNPPiCOi4MM21OKSToKkj+RaTxdGkkSR
         bPlctLJhi/+Uo7/Hrf7MufMa9Qcn2+MoYS6x7uYuFC83GnxIzJqfT6bipPmGsRNC1wq7
         ftZp+VQmKXKQ32Ob2lOWu1g46kTjSYtQaKDkQcHlRN9xnodkNraj+tgrYXXpz0wt4f84
         2C6hBAINo/swn9ebjJPzyATqnwtkAwfgC/oRLRZ6YDDsCNootbPPE0cE2N+j6wzlhS2+
         gZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031754; x=1784636554;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5CIAv+UZ8t7s5h+WlDS73yJMkdztMQ3zXG2Fxq/to8M=;
        b=bwkeNEZ9e3TWW7PWoShXp1pNi+chUTHZPW9Thuy7mVd3cQErUUVnmbkcKuiZEEkgqx
         OHtPlZvxzax0KcGUW5Qe8pmDabWfP9cRcc189lBufHQHpDWcQU0spKvbip3/4DExs9ux
         scl1aBLhESkXf9d0CNp7ISJNG8UvBw9PEv4i3ctg1j1f6WfXvp0eATUmynFHyeuWcMiw
         xKfo2KOSMiCDyLx5hiXBNDRf+7H0SNPXL/UJJ11Crfm5wP8Q40pS6TCEDjvAS9fAnhPS
         ts0qYqYdZperfRochHn5piQIgvzxbDs3KjKTKAcyerotE37OQ14/1FlhfHvFCrACfWwe
         NHYw==
X-Forwarded-Encrypted: i=1; AHgh+RoJrCnsMhfz8O8805KlR0Hj9XVIth/3faNIpLFbxuTNR/Jpvz4jGKr8ofVUw/EgjUEPGIywo7YAI3LKOzCbhVJc@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJbd6l72X1bx6OzNWaBQg19FJLwx9MxJDMAErFboiGF0CQgsf
	86HOsCc20Buyzl4ebL8qp71z0MetY1Eve9RkVnoqSjRmtB2QuFs/mHZC8Y61L+rBaco=
X-Gm-Gg: AfdE7cmRaUvGbUWK9Rbldqd9BvI0c2MaZ8wxzuEy7bsDXNmywVjlM5kxeLMAqPmb+V9
	JF8jJtV1G1kCdjXmDTmbjpiOKxCdpr6dB0geEGInR7+JJrUyqJ4WP6R9x+wmvEeBBKuqo1H3t4u
	XS7J4CzzzJRnPnLiQYGW5akXrPyrzAeyllyeciipZghzAVfe/nwUAHezL0L02kZ5MCZKRXcZV/r
	jCrvWnb/KL09sb8Djq8CUmu8bkW6Rqr1GFkQdlEIs+gfeZhkoWtU0LoMePt50YnOvRzXkqcCBTQ
	P6WMbmlhXhYsy6CImrTbuELCE+aetYxFEijskkhFfhW6T3l8YSdCAYsmcBezUN+il8PKXlKXENx
	k+6PmZMFArMJ7qXGRUjSiMvoQ2Q2GoO3lrc4KFwXq1So/K/iYIpotPeFB6+Ur
X-Received: by 2002:a05:620a:7085:b0:92e:6bbf:966e with SMTP id af79cd13be357-92ef2cb202cmr1211484585a.45.1784031754284;
        Tue, 14 Jul 2026 05:22:34 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd82ea9casm164927486d6.42.2026.07.14.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:22:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjc9g-0000000FRaG-0ohM;
	Tue, 14 Jul 2026 09:22:32 -0300
Date: Tue, 14 Jul 2026 09:22:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 02/22] dma-pool: fix page leak in atomic_pool_expand()
 cleanup
Message-ID: <20260714122232.GE3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-3-aneesh.kumar@kernel.org>
 <20260713175433.GI3133966@ziepe.ca>
 <yq5azezumef6.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5azezumef6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052236_286151_F58373C6 
X-CRM114-Status: GOOD (  17.48  )
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

On Tue, Jul 14, 2026 at 09:05:25AM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Jul 01, 2026 at 11:19:06AM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> @@ -115,8 +116,10 @@ static int atomic_pool_expand(struct gen_pool *pool, size_t pool_size,
> >>  	 */
> >>  	ret = set_memory_decrypted((unsigned long)page_to_virt(page),
> >>  				   1 << order);
> >> -	if (ret)
> >> +	if (ret) {
> >> +		leak_pages = true;
> >>  		goto remove_mapping;
> >> +	}
> >
> > Truely these _set_memory_decrypted() things are an insane API. So a if
> > it fails to decrypt it can be in any messy state?
> >
> 
> Yes, we could possibly try to encrypt the page again and, if that
> succeeds, avoid leaking it. We might want to do that tree-wide in a
> separate patch.

IMHO it is a horrid API if failure leaves thing in an indeterminate
state. For something like this I don't see why the arch FW implementation
would be unable to restore things back to as they were on failure.

But whatever, everything about set_memory_xx is really bad it could
use a cleaning

Jason

