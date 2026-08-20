Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06AA7C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 12:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CFAD3PPmyEYBnRQoyhozco7Gx3OsZl5eV5ORNG74mm8=; b=JBBL2H+M3SdqQ9PH02vua/e/4+
	OrAOgLTIyQU8i1jgDYLie4V5ui6bcc9uN5AC34/rPoHcACRaMWdSMpdgR9j/W0hUKTO4UrKpAPm+G
	qR5vQQI2OQ4xxdutOc/igeziL4A4tbOu6K+uaFuhcRKG80UztpU5KPq5GWET+HKZ/83cgFrdQhAiI
	NYcX76hBWjBQmFG+PTU47VvdAy1hoLqR6q5rmxU+JrGOXUclU5zsEJQFnlisAg1C3QTHQe4xQhdi8
	odbgR7nJVTiBJjfBEBjy1XwLUGKM2VmBJoZgueUazTVTaJetNKsHJGgUVyOKFkSeSbfSTHc9QU61h
	Mp5DGPiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1lP-0000000BW9O-0arh;
	Thu, 20 Aug 2026 12:20:55 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1lM-0000000BW8o-1eye
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 12:20:53 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-902fc790cd5so16197466d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 05:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1787228450; x=1787833250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CFAD3PPmyEYBnRQoyhozco7Gx3OsZl5eV5ORNG74mm8=;
        b=PRTzRepxrBVpPnQ54plN97kmEUeEL+5QrpvdCwugmf9n+IkSxI4VflgKrUoEHLXvWc
         db9rbRhadmBV0/NS/7H6VSF3d8y9EnARJF2eHKSlUt/JRv4jinQStQO3JIK2XawOJY4m
         oLugpLW7Gnrx26vgRXPNRDYskq59UFn4PBAw0lZhOWG40c3Fz/C4A9E9gSApHqaba8+c
         /90CGXqmbTordih3idPQqgKC4uYCcG2Fh/JBSP6aJtcl9Jq2L2gKoPFHjmwrJhJmrHlA
         uXbvTiDQi7xbtD2FKcs8FmFT5xdGdPj0NSBWeV8sq3CzTUIdG78biC+GBEvhvKnD6VSM
         RxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787228450; x=1787833250;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CFAD3PPmyEYBnRQoyhozco7Gx3OsZl5eV5ORNG74mm8=;
        b=XV3L9HWMNlsj8Pc0Ic110Chnp+rkyymmXh9+KnuuiArr7VzmPgYC/rrU2/ZBO45C5C
         1ACtq+uxLLVjrMtcedyPzD2vVzTLV6cRX+OoOckdKcomXAugxlki+hlXFPdilIP+HKdh
         oD87BYtx+RcQ/Nx8oEeFEaNtrJWChJ4VC/QMkIZc2o7xtSkJ5VlxIyt/ZKz1Z3+SLgOn
         P4Uv9TijIrMkDwpVPlOGJAy6Vn17lJSuYT9tuTUCiDNZGgLxzw3riSLt31fUXpKXby3w
         mEnIya4mSArHW76a4L64mpgXsZqakuPG4ONJPDcDji4MQs5bIY57fbv8rdHzq+svcwoG
         0COA==
X-Forwarded-Encrypted: i=1; AHgh+RqVOZjvZRyTHVXKE9bqic3tqkJ81OPYLVkyvQ54GrxRWp0KgDZ3pYDga/8KLEBlqVOd3iomg1ScYEPcRB6zgRXe@lists.infradead.org
X-Gm-Message-State: AFuF++lWh17L8YnjDJKwxJ13ddBzRAm28gOPAN+H/b3ZY8m7jLVyYGpK
	f7ntqjFoTWIT2g5pWWX+pJoRk8Dy0/I+bBmTLs1/EAxW5wX0ROFQS3oVNshanI4+RmQ=
X-Gm-Gg: AR+sD12LJ6xB/7nybRb87zZ/OE4UyYDwvCWd4hsgfaFytY++Ru2B017vtZXEXdLWukV
	CrV0caYxFAVtDacsrrj3MjoaUKxtZA7KGNYB866gppAmZnV5egoRpTKltD3CZRAHEX8RSxf0V1d
	DQc2Yz8UzrJbkg2KMYRGK1mMB+sRGx8fvb0gF7ffKOLppG20cLoTkiF+cJiyjB7RoJVUav+G3VE
	uRbB9CV6ejwlfUWY37479+ZZJFKcUUJ7Ivc4uRnF76850wtLP606k+BPlCyQJPI6YMQpV8zbbMQ
	LmPwxed61Ds4KmVZY54kMF4RFVrkvsATnknLRoCAMNUu4nTcojTGa6PjMrHnMLgVVRODYuyRA37
	ckipiadyseDjDqyDjgFmozy5QnPBV+MU+soG1LIN8/gU2hV1DPuMZfdWCHLTkv8jkZXRnnVFCKD
	37u5zbJbHCE8kIwcObhsvGTEfXod48hujbPjElfCJYq9npdm6HuZTJIDntYVpFnwTwZ+/XMkU2f
	g7h8gfAqQ5nAWI2ah2mPhp7TOIO1TY4u1BHDQVegFZhtw==
X-Received: by 2002:a05:6214:124a:b0:908:92e3:a37 with SMTP id 6a1803df08f44-90c5eaf245amr114579506d6.32.1787228450436;
        Thu, 20 Aug 2026 05:20:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5f2b1f39sm36591756d6.41.2026.08.20.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:20:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wx1lI-00000003bNC-36dR;
	Thu, 20 Aug 2026 09:20:48 -0300
Date: Thu, 20 Aug 2026 09:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Steven Price <steven.price@arm.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Marc Zyngier <maz@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"T.J. Mercier" <tjmercier@google.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH 0/2] Clear shared pages after private-to-shared conversion
Message-ID: <20260820122048.GB18100@ziepe.ca>
References: <20260820105026.53208-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820105026.53208-1-steven.price@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_052052_589173_F1261DD4 
X-CRM114-Status: GOOD (  12.81  )
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

On Thu, Aug 20, 2026 at 11:50:23AM +0100, Steven Price wrote:
> Arm CCA includes "Memory Encryption Contexts" (MEC) which allows the
> private and shared data accessible to a guest to have different memory
> encryption keys. Consequently when converting memory to shared, the
> memory encryption key used to access the physical page will change.
> 
> Both the GICv3 ITS driver and the system_cc_shared dma-buf heap
> currently allocate memory with __GFP_ZERO and then decrypt it. With MEC
> the zeroing is done with the wrong encryption key and the data visible
> after decryption may be ciphertext. The RMM is required to scrub the
> data, but may perform this scrub with a different encryption key to the
> eventual key that will be used for shared access.
> 
> Fix these two sites by avoiding the __GFP_ZERO during the allocation and
> performing a clear_pages() call after the decryption.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

This whole set_memory_decrypted() API is awful. It really should be improved.

alloc_pages_decrypted() ?

Jason

