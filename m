Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C6E7C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQSuEqcHJXFQ1exNbmtWM5VfdOVLBSlLfO7byhWtGpI=; b=r95R5CxzEV9EKVHcB5Jzt3Zks9
	Z91wywhAQXie28MqylHRekete+d2yjEosOGqBzRwnEpsKahgOw6FXeBiNlIU/hY0Kpn2mZ3mNz4X3
	7NtGjEW7iM4EBaW70rsGsiedYT4YcumXTgQu5D8nZEAtj+1G4BQ+uyELZodiAMLFXEBoRS5QMiDGn
	C/IsJ2xnsIqyFOpB/DDg2T0aFP3UTcgN5S8ueo7evI8nzWTOJJ4llkrU5qkrpIvAIluKF1GR5lrnE
	fakR+LoHS8onDMlng9qxj3R+G5ydeEMLX9jZixF6qFNFPURTaYLzo/gd5b8zLk+YArpzNmE6H4rHu
	2zmKCJ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH29S-00000009XYV-3Em8;
	Mon, 19 May 2025 15:11:38 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1Nn-00000009Qqk-0dYi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:22:24 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-601ad859ec0so3513349a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747664541; x=1748269341; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kQSuEqcHJXFQ1exNbmtWM5VfdOVLBSlLfO7byhWtGpI=;
        b=Drbk07BjqIthlkT/rKrmuJoPOXUGAUDYzKSTXmadohke9O51Du5587GmxZE+9h7e15
         rS642jokAgJ/k7VDUpgeUWapzREdoWb9r/9HtCNwrEo43cZC87eX7bcnUFNPETwBdtc8
         tPJ1q76wHlMMFU+O7q8RoDb57UUEbVy5UCtUAVlQJSqx5IZKM1fQTT14vPwYJpynPwDN
         D7PV1EVj7xzQV9osgoMpWAnSFMb23tL9lbsoDnr7GGQlrjnBvpCpOgmjyxi0tLq2ywm/
         bZ+mMPT4CfCL29TAfbkLNXnNiBx4UsNPZV0NT7OWe+uAGzt+xilyiQFfcRgizSTxSuRZ
         UWyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747664541; x=1748269341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQSuEqcHJXFQ1exNbmtWM5VfdOVLBSlLfO7byhWtGpI=;
        b=cxLYLv+OT2+Ye0/7FH0DChCHga0Gxnf3+0RI7R/Qm67V0jf/ZpkxR6iCykoKaxKKHC
         SCdOC2lXcl9oOU+RhBhvpZyySvAKQqT8Pc1VuU/65VNt/TUgndpG77NStVhLRFXZjLp+
         azvuyQh2NWgZYR0BXByJ/8SmJxeUzt51mQHhJepK3L5nRAgX7aVxcz6vBFFnGRIiwLh4
         CruyKOEY9UgvtWhuDurb8rlAYTxhDx+w91neZnRuniHe4VHDnuuBHoFtKmfFIYpazqe1
         LICABd/IVJ4w4XdWVo0OnbeRoan/L0vn+YMxnrSo5DF0cSikv9PYiq6aCXGI7IJ7mD5n
         +vAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcrm92F4ongL8LJe5ZCRWCOWQpw03PfngmjLS2jO2R3qggC8Iv+1tixmA4X5wljMbwskZ8E77TfzHNYpqYp+D2@lists.infradead.org
X-Gm-Message-State: AOJu0YxrSwq8SHPRXvCrpgRcvwd5/SyjXbxlW5cZGeS8evfVD3YaDpWp
	Vuqb7FUbrGBeIPVlz1L7BdTj5WsBEoVJw+d3A2jL/MLetUK32gIWD44C1KlOGf+n+0B4ZzrFNNe
	pu/OWyQ==
X-Gm-Gg: ASbGncvDfl3LQw8c5dCKnvPZKOoXgbBjWtiakiJ3BLrrY4ffZNhXNFImEIu/c6usa+y
	GiK58cZjijLwJQtguhTBn4yUtDzqWbiXIvaVkGSsGGZct5s4ffvz8gbVpruTWO79ioHGFqcnYq0
	hWf28FDnNbwptKs94SG9LMX6cSjin5Ml3eYu59AHqJlnHPwjHYCjGGR6NMi1pQ6fy7f/ZOTXlff
	G8ZF2XitdjKxwJMCJjAEzBQTbSgoSXKuhbUuFG/YBQBtVZpi23m8Q9IYOAlLB3srj8B6tlBPLuz
	NDAZCBokFoaaTM7UXdeiWKTJv56zASd9k1/AONgCNPij1mKzCwmTvcH7dBunxE/FOfQxgVKf1/m
	Ljt5ckRNcQNATgX8CXm3Q
X-Google-Smtp-Source: AGHT+IFH5dLBwEyWAFcQq1e+DL6BqjO9tw6VuHfBFByUGGuIQ9a/huk1aiNUfDOMwmKFocYhB49/Cg==
X-Received: by 2002:a17:907:9412:b0:ad5:69e7:181e with SMTP id a640c23a62f3a-ad569e71f30mr348649466b.61.1747664530363;
        Mon, 19 May 2025 07:22:10 -0700 (PDT)
Received: from google.com (68.57.204.35.bc.googleusercontent.com. [35.204.57.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d498747sm595489966b.137.2025.05.19.07.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 07:22:09 -0700 (PDT)
Date: Mon, 19 May 2025 14:22:05 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v4 07/10] KVM: arm64: Convert pkvm_mappings to interval
 tree
Message-ID: <aCs-jYUrEraCnLaX@google.com>
References: <20250509131706.2336138-1-vdonnefort@google.com>
 <20250509131706.2336138-8-vdonnefort@google.com>
 <867c2gg0hq.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <867c2gg0hq.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_072223_185960_495DDCCD 
X-CRM114-Status: GOOD (  14.84  )
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

On Friday 16 May 2025 at 14:15:45 (+0100), Marc Zyngier wrote:
> > -/*
> > - * __tmp is updated to rb_next(__tmp) *before* entering the body of the loop to allow freeing
> > - * of __map inline.
> > - */
> > +INTERVAL_TREE_DEFINE(struct pkvm_mapping, node, u64, __subtree_last,
> > +		     __pkvm_mapping_start, __pkvm_mapping_end, static,
> > +		     pkvm_mapping);
> > +
> >  #define for_each_mapping_in_range_safe(__pgt, __start, __end, __map)				\
> > -	for (struct rb_node *__tmp = find_first_mapping_node(&(__pgt)->pkvm_mappings,		\
> > -							     ((__start) >> PAGE_SHIFT));	\
> > +	for (struct pkvm_mapping *__tmp = pkvm_mapping_iter_first(&(__pgt)->pkvm_mappings,	\
> > +								  __start, __end - 1);		\
> >  	     __tmp && ({									\
> > -				__map = rb_entry(__tmp, struct pkvm_mapping, node);		\
> > -				__tmp = rb_next(__tmp);						\
> > +				__map = __tmp;							\
> > +				__tmp = pkvm_mapping_iter_next(__map, __start, __end - 1);	\
> >  				true;								\
> >  		       });									\
> > -	    )											\
> > -		if (__map->gfn < ((__start) >> PAGE_SHIFT))					\
> > -			continue;								\
> > -		else if (__map->gfn >= ((__end) >> PAGE_SHIFT))					\
> > -			break;									\
> > -		else
> > +	    )
> 
> The removal of the comment worries me a bit. Is this iterator still
> safe wrt freeing of the iterator in the loop?

Yep it is still safe (we're still caching the next value in __tmp before
entering the body of the loop). But we shouldn't remove the comment
altogether, it just needs an update.

Cheers,
Quentin

