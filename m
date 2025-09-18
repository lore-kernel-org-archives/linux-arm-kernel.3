Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42370CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnUwZStouFz5qxjD1Lj/dsD47M7aWuqj5p6Ia/ydEQA=; b=nlgncr98S7w+kGplznWc6sxEN5
	sfXNti2BybFlpWL4OwrZpwIbO9qYG+jCgknsDD62qGMeoDbiyl2b7owCDuCReruV9kZBP5soOKPHG
	4067ijvDaye5HSjbiWWWFg5WV8tYJF5E0uQyK+wayOZQYctWd0FEK0H7fzix/kGYzQuhQoPD7TB32
	hhP8c4uIFLmwH8sJ3Lydh4hjOKvXOXGcOCBZVzFBQ4ddLUQvayBN9ZAT5O88GbwS6KfRBvE1K1XXS
	cgtCZFeFB7oXHpsKgg1fups9rB7oTTikb9drgrLFJXQc99aswP9wW1sx/Kue+vgW0l1wsMULtBsyH
	2Jgd41Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNLc-00000001MGo-0CdY;
	Thu, 18 Sep 2025 22:43:28 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzNLZ-00000001MGS-1Z6l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 22:43:26 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-62340cf68b2so322151eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 15:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758235404; x=1758840204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnUwZStouFz5qxjD1Lj/dsD47M7aWuqj5p6Ia/ydEQA=;
        b=XqdRyuedufrb5eSuuH8Q9OV67YyKJqOq9faKaQ2PmqLPnflHtskeu2BrKjg+uB6wuI
         Beyd1VnneLnAeOjK1ZojedQXnO9A2K8rRg6H0yOUgF28UxyRM8hcwb0BAD9J95qLSho0
         w4RdeHJtt90+dHHqiHAbHtnXHkORUTVddXFtp32KzwuW7SLROJ/Y+wgyumP/e0XvAh1I
         5x1eeOMEAMYiTPeiVlVa2A4bA+ddycBxC1os0ZsjIgh7B+L4FCg1lT40QgygTS1y9QdX
         vWA/hkvFoF47rSWGSk/4VzuXpOgIy28xaaWd0KEuKfi2QWl96WIL98g2XL0mN+CvWKSu
         qpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758235404; x=1758840204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qnUwZStouFz5qxjD1Lj/dsD47M7aWuqj5p6Ia/ydEQA=;
        b=MpeBa+7nqk7YLXK4P1cmsi03UDz0szkKlT9A8WJcHvu4mdgOnI94NwwL9jBEHudz6E
         vAcWzL+kvmT3KFCTwsSBqPFyu6GVcaQqFzGLFIBX3a2jk6tkeH8Ejkv8AfHi2OvZJ0og
         71wz0miFZ+8PWNv4LrGpn6eCQ5VwEHiWfE9iPO+3O4iXJUltzUGTok5TkyNB5eR4qDIB
         sywHvopes44sJFkcnZuoOdkZ+9BSP+BSt2GNKh0jJBufWMBO39ci/Q1H1ontnL0sh2nY
         LMElX9fbW0pt4XQMj0xpfZ0O5wbvS4651nf7/bzCuzSXHRhnZU72rqQ/lHgoGP/xPVPB
         8YTQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKqnQ/yQh7W0JAcezhn2IQqxlUO4ckbNdlZrJ1/UdpahIcbrSvBEsyuQqMZZLCsZzqW4tez91yLr/hsN+7OPrB@lists.infradead.org
X-Gm-Message-State: AOJu0YyQTNyll6frUAPPfIxE1sLZ2f1lz2ohoM59tDm9TxcNW/wWaGrF
	Y8Uu70f2oRDslnlDOl4ak/8JCnlQ1ut6ojgYD03aErVaIMJZeiAXUx/6W5bVMOMCaQ0=
X-Gm-Gg: ASbGncvE2d8IBcClKGcL3G4x4OPzsHTWZi4k7V1m4FarDPQXKVlBPI/NyJM+N7RkcoY
	fBJBxIbV3R3V7BxTQjCU9gObKqbteQvmzbFJ4IZQ0j3jn2Nq6qRQv2ii/ZcIYTbdyo988c1VGdo
	V2LUQGJ7Bwhk0YXC8OuBr7PnA4GeYSDQGhIh491ZUjvS0fO/Ek1lbLz+g43rR0YnYgjlbFASQaj
	ngXR7aaB/UZvDi3mnt23yuSGi4Rfdn26wmh7PAzdK1ywMLnkizj27p+AL+66MKXZXYjGXItLy3m
	aazlbOIKFcpiKSa9HNLlZGa4mI37PhfDW7epIg+feMtyHRHysjEHRE45QS1FYzYhphiHcv/FSUa
	fnpmZX0KSyeAueLQ=
X-Google-Smtp-Source: AGHT+IHKROKv4GiW5aFGatEtEb+qiEoA/WdhBpHSCZhcOfsuIyYvldoezk0nWsp/B7NH1cp0nPxRTw==
X-Received: by 2002:a05:6808:5289:b0:43d:21ba:b09f with SMTP id 5614622812f47-43d6c24559amr470351b6e.24.1758235404194;
        Thu, 18 Sep 2025 15:43:24 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43d5c85d269sm1274466b6e.23.2025.09.18.15.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 15:43:23 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uzNLW-000000091yf-0M6j;
	Thu, 18 Sep 2025 19:43:22 -0300
Date: Thu, 18 Sep 2025 19:43:22 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Shyam Saini <shyamsaini@linux.microsoft.com>, thierry.reding@gmail.com,
	robin.murphy@arm.com, robh@kernel.org, joro@8bytes.org,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	jacob.pan@linux.microsoft.com, eric.auger@redhat.com,
	code@tyhicks.com, eahariha@linux.microsoft.com,
	vijayb@linux.microsoft.com, bboscaccy@linux.microsoft.com,
	saravanak@google.com, krzk+dt@kernel.org, conor+dt@kernel.org,
	lizhi.hou@amd.com, clement.leger@bootlin.com
Subject: Re: [PATCH v4 3/4] arm-smmu: select suitable MSI IOVA
Message-ID: <20250918224322.GR1326709@ziepe.ca>
References: <20250909154600.910110-1-shyamsaini@linux.microsoft.com>
 <20250909154600.910110-4-shyamsaini@linux.microsoft.com>
 <aMw4I0AjKNPY6SOw@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMw4I0AjKNPY6SOw@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_154325_481550_A4A90C2E 
X-CRM114-Status: GOOD (  13.04  )
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

On Thu, Sep 18, 2025 at 05:49:39PM +0100, Will Deacon wrote:
> Given that we're walking over the reserved regions to see if we have a
> collision with MSI_IOVA_BASE, why not allocate the base address
> dynamically if we detect a collision rather than having yet another
> hard-coded address which we can't guarantee won't be problematic in future?

I'm nervous about this. Right now the  MSI_IOVA is actually UAPI and
things like VFIO/qmeu need to accomodate it's placement in their own
memory maps.

Nicolin has some patches on the iommufd side to let userspace select
the MSI address instead, but they are not done yet.

So, randomly picking an address sounds like a bad idea to me, it would
almost certainly unpredictably break qemu..

Hopefully by the time we need a 3rd one we have the userspace MSI
control and then we could make reasonably make the kernel
automatically select.

Jason

