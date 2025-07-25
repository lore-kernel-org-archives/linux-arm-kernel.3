Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C7FC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9lqZ8GbVGbsyusC/rotoXs+VvnR4ndEH+/csO6rB//g=; b=TzTYLAMQ+LDHFSbfOFieBfnCMI
	O0Y8X1Iy304w5STWlc3qn3rYjpZOEQ4q17AeVjn8D8ZKKXLoM3+Z/VZ/eutLbwBZQDRnYtKOXxtgj
	ry5sDCGXFZc5iew7lz11GrYn8pAT0OgMkHH+8lxazkZPrTx7dUdVKlXd8iNAdTAqdpzq9hiTJ2mT6
	0i/OO3SnrLsKxf8iuAbJj4nfmdc46oGJz9/I5PsgmDldCrUv86A++EprIjQN3beY0WjjLOUqlIcZ6
	kqkrIVPXzwlhupf7Kg0/E0Ll1D6+EEBGX41yAb0CjEv1bBT5TKOM8kb5qoqznul8L41SWZf5Hp9a5
	J3ge4sqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMwQ-0000000APiR-2273;
	Fri, 25 Jul 2025 18:14:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufMtx-0000000APVC-1NG6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 18:12:14 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4561b43de62so10355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753467132; x=1754071932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lqZ8GbVGbsyusC/rotoXs+VvnR4ndEH+/csO6rB//g=;
        b=d8BZv9B4SW6nbhfbNplLbqzDvv0TiecCGhvEEr7GJelXWdyakeBVjcRDWVmS8Nf431
         3mhSITHiZujRmoFgvEY7ZvoOoNyLtR2/LzdmtUGLBZ0J8nQ4C+EJEYGiJYnauS8eP5Ht
         uLQdepBcc61Qq7LDGZyVk/fsiawygr1xaI3OUMs9Pmzv0PzyFKr8mS6IA2ccoxzoh20U
         Vo4eE4jvPneUm1NDpCie405tEyhXDS6K9QBxKITovpEc1i8pJBeG6QwTVqcffPXDboRj
         2QnpC7h3B1C/yIx1dvpQQYZGYcQLNYlu3HDlqqpQpq/b/bFIY6TBIwXyIx4LG6Pz8GeD
         JK9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753467132; x=1754071932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lqZ8GbVGbsyusC/rotoXs+VvnR4ndEH+/csO6rB//g=;
        b=pRQPM4wrfTlx6uUg1my9wZFLo3hgSC5BzGQqNq4i55XbUkkTD3mqcVpGZVldoDb1p7
         kV7tyOBTIvSAapixuSkrUfEiQWlK+3BF4a1052Yi99cTjvLSvlEohOBkA8QKtBFf0pEM
         WsdD6JoxWohHbqOPQBjHKGbSV2grEz4eW4R6OfZGpYn+baGNH/ZwJSbCyf0TTKmqK7ri
         rcsiqs8N9MjCQPnlgPZ2TkiqWHsdNNjSJLbHS5rFLJaNJGSQvONgfU1UURXHtZSYB4Mx
         cTbSKOHqrIZR8xSDf1wQHZe4XQVyTMnvrECySv5bu74W3XRQXPa84l3RzgZajU8ufmYZ
         5dpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsnur5Ur9PLHB7dZn7u9w+2RJV2t2/3HzBRXDQcMrsN0/kGlkCc5ZYjlPYdMx8ERmtVt+Ily99+ArBPEVQgyI2@lists.infradead.org
X-Gm-Message-State: AOJu0YzXyyhwvAaNwuxwI/I3ZQcDifuigQAekhf9XI247k7LwHHHpHD2
	7Hp7vnlqZkLSatN50zvmxbSVnfsiZHhXuzknVf3ZeF1Z1w+NOtYWR7RbM+FotiLrpg==
X-Gm-Gg: ASbGncswvrOR3mHyAd27V7pqoTVQ3lth4vdC0ibbbhms7lxq5ZNxyfHnhABgOTdqHKp
	sJ1CtmznB4T3zxLswVP9Q2cMx7qXfGY6BeW5lmpMYzinpxbLx5EikPUZ3MAC7dOemMWERKnrIPK
	mE3JlOAdcxTU14Btzn5v08MpBhRQx1wBF2JUaBa7LoWkJNfW2gDf/AZnlMdr3zHYUr9EOAvt5F7
	7xuZeC630CyEwkq8T2tnnEHFchK9C8hj5Z4iAUZrG/JiYAUSsr0W0RFI7gFsqcISiIB5AZZNyiM
	GJ01wz5HipnyPvnuP5huOZ62UjgpYcM4DG77hbD1A5bF/HwZBmAkqMOgQJ7y0x+kplTqwiDJutO
	DTQKfNtzOcDDB9NJmXbq8moC8We9KoPq6GRYLhtruFPdBAspzCR8C+bm6gQ==
X-Google-Smtp-Source: AGHT+IE7dLSNdxnS09UIaiZLtGTzBKRWFvjjxpSelV/vNcmga84rxmjNvK3BLMJqQyO32AXbSKfYAg==
X-Received: by 2002:a05:600c:5289:b0:455:fb2e:95e9 with SMTP id 5b1f17b1804b1-4587c1f7c41mr47125e9.6.1753467131632;
        Fri, 25 Jul 2025 11:12:11 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377e5sm61620255e9.7.2025.07.25.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:12:11 -0700 (PDT)
Date: Fri, 25 Jul 2025 18:12:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, jgg@nvidia.com, will@kernel.org,
	joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIPI9xv-HxTPWMUp@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aINL66r_1NO3Nx-f@google.com>
 <aIOvt+atxTQp57R/@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIOvt+atxTQp57R/@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_111213_366657_D53E97BE 
X-CRM114-Status: GOOD (  22.56  )
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

On Fri, Jul 25, 2025 at 09:24:23AM -0700, Nicolin Chen wrote:
> On Fri, Jul 25, 2025 at 09:18:35AM +0000, Mostafa Saleh wrote:
> > > > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > Had the
> > > > vintf_size rejected it, we wouldn't be calling the init op.
> > > 
> > > A data corruption could happen any time, not related to the
> > > init op. A concurrent buggy thread can overwrite the vIOMMU
> > > object when a write access to its adjacent memory overflows.
> > 
> > Can you please elaborate on that, as memory corruption can happen
> > any time event after the next check and there is no way to defend
> > against that?
> 
> That narrative is under a condition (in the context) "when there
> is a kernel bug corrupting data" :)
> 
> E.g. some new lines of code allocates a wrong size of memory and
> writes above the size. If that memory is near this vIOMMU object
> it might overwrite to this vIOMMU object that this function gets.
> 
> This certainly won't happen if everything is sane.

I see, but I don't think we should do anything about that, there are
100s of structs in the kernel, we can't add checks everywhere, and I
don't see anything special about this path to add an assertion, this
kind of defensive programming isn't really helpful. We just need to
review any new code properly :)

Thanks,
Mostafa

> 
> Nicolin

