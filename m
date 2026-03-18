Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AA4103E166
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLqnHb2ogCoxqHkELJxhX6U8ujBBduz9IxDDxqOJz0g=; b=4xRhNVV/IKgg8EiF+9DpZQeRj6
	bTyra74juYkKs9Xck7zLq4AykcKyNuWC6FVfEVKM5519HBx01OlvLP/+ux+YRiLsNhQlBhvrEzO3E
	MqL9baD3ViFzjBINXHfbyb8pKevEdgPXJpXUc2k5DAsA+oSGIa9g/jUsdwywsMdxzc3ksqN3eHHEM
	wS8iJPqN0pN8Q/mxRvO5b3rXZnUQEn+sPZl9VZ3sFJactZpOWEOX0p33nKHd8csNwxnbJ3JRlTGDt
	LRNw3vMJHGnzVRI4C0IfJ9vG1lySAgaTRCimYw+ZPZIfGizStw15GK68o3ANsM1VrT+Mg2ZXKyAvi
	ZTZqVNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pMv-00000008Kxv-3sCY;
	Wed, 18 Mar 2026 11:47:21 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2pMt-00000008Kwx-0oFI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:47:20 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-829928e512aso3514442b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20230601.gappssmtp.com; s=20230601; t=1773834438; x=1774439238; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLqnHb2ogCoxqHkELJxhX6U8ujBBduz9IxDDxqOJz0g=;
        b=iOEqT/Rx3gNxrI6Yr+OAw4RtQXxLPWJcliBc/1JgMWw5hBi+iu3z/I3KgjJiG0ogpB
         W6aRx7xtIiTIwRfTLAnb1frWz9DIuRHo2RtyjIVe9GIVfgdxiChh2QZAR6EH4Za/e1QB
         CttmeKdVhw1STBt9nQmiB/OAvsWEAnIs+TKGdLb7+0yGKNtpaR/HOFYO73fAP0Y/DyMI
         Ids3r+dM6hirPK5BJ62zl3BC3EA6ajYZjAjy/x66R4lQ7sKhVd3XY6AzUenx3PDi4KyR
         AfiXwgg/EHQdrHt2UtICbLL5I9yvVR7Z2HcwpQL6BFgrSQB2MoxnL2uNLRmftDt5n6JF
         Kfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773834438; x=1774439238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kLqnHb2ogCoxqHkELJxhX6U8ujBBduz9IxDDxqOJz0g=;
        b=szkoUF6V0VZCEJfKXw4Lx38yAI6EfLlFn38PymWRRHXnccWlh7m2gCseoJynKX5dKC
         DrSOqbi7lqh3Hdp0GJozhrZbiyB9qB7LpBHxpLTz1vYOVdmIyw0+gbGr5fNptCtOO0j3
         VnI65ojBNRRFAOcY/89xif9U5opHUgf0sIBhGNOJSZF8vAIUWWpp/OGn/2nr/NmgLigp
         cJBoDLr07dSvTUgIUKE2PDfC7vffix5TT2l2RomgVaGt6qeS6Spv3Iud81n0okGLg3ex
         yFozm6xosX8Kj2ueEjHl3o1zbsJHmIkrq+BPDzMiqozDR2s/olvr31iT/E6MEPniqnqX
         4U8w==
X-Forwarded-Encrypted: i=1; AJvYcCXqtfWk7ei58x7hOaaNVlcC13GR10iDEZjx86rGgZAke8p7AUvwM4D6D14yG6DGYSE4jOOV/VwBw3uvt5SzFW7N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+X13E29IRKh8rfdJ/szZml6zW6kbBgIQ6v5UL9j48GiIw9Sa3
	x2WvsP48F9OOZK6BZhhiqwNmL5rqCuvSYBvtGSBBz09IQkzoGfyScIQRHqiTpGZS3Kc=
X-Gm-Gg: ATEYQzzCx27h7UNjdKZh4huM/Gg0DsyKXQIAnEWryyc48KsgBRDTvz7ZOIOXi7+H2Ha
	SxXKKhCNpyByGVZu8WYdcxkOqs+x6EQ2tjE7OXDQlRs/AHLY5VIJ/aopOuR4Ea/jvNODelwdUeJ
	mXZXKTtEAx1rqVZSIhSnyfzm4gar8TXynVjuZghn3ImsY3MO8LfiYOnmNC1abhBKjfzEeIo9GQH
	Rh/m09IoHtzYVOikGKThrLyK6wLVQliPNo8LkU+cVigpIjNGkG7PHgx2GxkjgWw88B7nAUSVtgD
	Qg7ysqPf1wR8lQlCfnTVhaEJAnlLD87Vs4EkM/3YlSB9IwR5g0YuElnC5F0BGDLemkZIht4jU8l
	zguBoW/BBNxCcQl8DFxy/HWGxrKBgT9G9yAJDrUjqomS4KHIs2mxTZAM0njWv2cx3GHL3XhZdhf
	Cj
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id d2e1a72fcca58-82a6ae4f234mr2558433b3a.44.1773834437848;
        Wed, 18 Mar 2026 04:47:17 -0700 (PDT)
Received: from gpc ([2400:8902:e002:ded5:78c1:8178:95c1:6ca3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bf0cf5fsm3176671b3a.61.2026.03.18.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:47:17 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: usama.arif@linux.dev
Cc: Liam.Howlett@oracle.com,
	ajd@linux.ibm.com,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	apopple@nvidia.com,
	baohua@kernel.org,
	baolin.wang@linux.alibaba.com,
	brauner@kernel.org,
	catalin.marinas@arm.com,
	david@kernel.org,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	jack@suse.cz,
	kas@kernel.org,
	kees@kernel.org,
	kernel-team@meta.com,
	kevin.brodsky@arm.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	lorenzo.stoakes@oracle.com,
	npache@redhat.com,
	r@hev.cc,
	rmclure@linux.ibm.com,
	ryan.roberts@arm.com,
	shakeel.butt@linux.dev,
	viro@zeniv.linux.org.uk,
	will@kernel.org,
	willy@infradead.org,
	ziy@nvidia.com
Subject: Re: [PATCH 0/4] arm64/mm: contpte-sized exec folios for 16K and 64K pages
Date: Wed, 18 Mar 2026 19:46:53 +0800
Message-ID: <20260318114653.123656-1-r@hev.cc>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <d0c0ac64-be15-4683-89ec-e32bf4867109@linux.dev>
References: <d0c0ac64-be15-4683-89ec-e32bf4867109@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_044719_366893_7F8573EF 
X-CRM114-Status: GOOD (  11.00  )
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

> Thanks for running these! Just wanted to check what is the base page size
> of this experiment?

base page size: 4K

> Yeah I think introducing Kconfig might be an option.

I wonder if it would make sense for exec_folio_order() to vary the
order based on the code size, instead of always returning a fixed
value for a given architecture and base page size.

For example, on AArch64 with 4K base pages, in the load_elf_binary()
case: if exec_folio_order() only ever returns cont-PTE (64K), we may
miss the opportunity to use PMD mappings. On the other hand, if it
always returns PMD (2M), then for binaries smaller than 2M we end up
reducing ASLR entropy.

Maybe something along these lines would work better:

unsigned int exec_folio_order(size_t code_size)
{
#if PAGE_SIZE == 4096
    if (code_size >= PMD_SIZE)
        return ilog2(SZ_2M >> PAGE_SHIFT);
    else if (code_size >= SZ_64K)
        return ilog2(SZ_64K >> PAGE_SHIFT);
    else
        return 0;
#elif PAGE_SIZE == 16384
    ...
#elif PAGE_SIZE == ...
    /* let the arch cap the max order here, rather
       than hard-coding it at the use sites */
#endif
}

Thanks,
Rui

