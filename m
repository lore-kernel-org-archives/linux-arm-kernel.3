Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C3BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=; b=KGSrHi2pGp6a/oi6Fog8e/UBL/
	eIPzb50EyL4miGk/gcQNG365zGiIkTqe0rgXd0U5F+LGpxhiaVPd7Tn+p701dAB7uVDCIfKMMrj5E
	uf7tUYW++JDhiqcX+3og4J9MSmjQT2SWX/899B/eHvzXdTPr8xWsJ3m5roo5U+nCCPm9TvUYcKCbL
	6ILQ0N1nfaPKUowl14RKCD9td0RmExSS0t49UPmnc7vDv1nhExdJVb5vBbBPmmbqyZ9L8zwn6QfCa
	jRihUSLeJKcIquMtBh5nFd/1chmSmFQo5iVVoZhhirwo96WkR91IU9/o0EDQx6KabrWVF3QFt4+zN
	gx3iwzQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeW1-00000002Wte-1yFK;
	Fri, 16 Oct 2026 09:46:17 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHeVz-00000002WtC-092Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:46:16 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a01933b584so52872895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143973; x=1792748773; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=EIZKuxn8mgWI9D0Fn/BHAtOptdK4H8YMI854BTuVlEwN79fQ6Yc4n7U2bx7UA2OBPA
         Olg4uIKiEwvEtuho+q3w51MVxHxBIh1QafsPShikIaEyft6nfwL7HifWUfrxcpxdLcaX
         oFKuRnTTxnKaR428SO3PbyJydTwaeh3WbR/njswSD+YHpMsOVRsskrB2DMS0YKmcm0Uu
         ChXKts8WAIErgPln0/TkJP8PV/AOKmM8f5gFLHwzwc5sjWdGYNR4lNpjfG8uHp876+fh
         iEHoNVyFacbawRdcJCYalqtmfflRWDT3v+d053N0dLm8zmUoEKzLgLQ5UrU0/TCc8uXC
         RHJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143973; x=1792748773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WBdGcxWiDrcVKqaT6IjY7dlU/wWj/hMB+CXmv51CihE=;
        b=OuuekygrqDPptBai6Hq+Gt1I74UVDmPEzfyykQ+rcskjCvDoDzPxP3cEqLmL5VxaNx
         kE/wMk7ciZDZEiQXZ2FHlxF/QJX28H/7uLUE0wVaTggjaRKkl3/4uD5yLqw2E2Ziw7Gi
         SQlmXxioc/GCarKa/Dxcl7DAwfyljkJO7VqmEkUpoNMK/P6+eMCzH5bjigzlWqiciLBp
         7/HzSAziW2CcLCBVj98Jn7+3LBFLgKv1zQqKuRNbXY1Aclfzx5gJRtmxaB1xDAQyLzrX
         URr44qS1sibLU7FJ+pVGtNRrHh3U5eEB9yzlSjFvnRoAlflHFsT15UDYPxY9xH4tRgXf
         9ChA==
X-Forwarded-Encrypted: i=1; AKwUvBzn+FcRQFd7OtxeVjcW0MNkSVgWTjrkErNBaybtKI/2J1Tfh4Aih3JX0NSPUXJbQ+5flwiRsN5VCcTHBIzNp/nR@lists.infradead.org
X-Gm-Message-State: AFq9FYLP8WrboO3FlXYWPw6JGepR4sz8Zp7Oj6mULr0mHEieIl5kOAje
	6LAVkQ3VNpvP9HZDEKgmc3JdeQBxFHC0eu9EsIEf6SUvNTO9d98RRAPu
X-Gm-Gg: AYBFou3hlQNjIY8svjfP356coGbj1m1DZuU68vb98K9QNe4d99MUwt8sWs88fQX/mUP
	Cq7hvBxi1+NgZmwTR3CNRQGEednOkuoG6UXAkng3EPLLVyZfDHtKFcD24da1GlEye3NnLZ/RNM1
	B00eHMcxYecWXQW+naVpB3LG/d9gBxU0dZn51f48zMA1wNApF5CDp22ima6r/MVYpwxFoGbtdF7
	aDQoFIanfuINb/vEI6fNsnwx5iAw4e7UTcrhW5KT65ajClyrts9+vv+fcD2iyNdORY8s5rwoC1+
	wT0ZgXUMnAL9WQS0k+iEHL7oXrqqorGUGNa9uLqn1oNCSBeoTEyRYexM49yalmVuZoNyWTd6sic
	kTR5H2TaoVbdRQ46Uf1LXSgQZnuoNd3XyURs3/ep2BXZL0N4O/kJxI3EtnZcjwYC/kHNpZYs3Xq
	uFxWDWwYcnRoTAvPklLekVr6r6gQdLol10wfly53YEey7fGFMjB0pnUnZW4xivCQeBHpMo/+X9j
	kGgsw6nI41MDM6YX+FttgLavk7lnbLwN70xHHEYve+xICZzgGbSSzf9gynfKZuSWWqdXk/gRghk
	gBpwJFDCRjnrHlalzb/UsLGExg9SGrccaBc=
X-Received: by 2002:a05:600c:83c6:b0:4a1:7093:40c7 with SMTP id 5b1f17b1804b1-4a18e493048mr406737735e9.8.1792143972697;
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1cca43012sm17041055e9.3.2026.10.16.02.46.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:46:12 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider mappings
Date: Fri, 16 Oct 2026 09:46:10 +0000
Message-ID: <20261016094610.57849-1-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com> <20261014093733.90312-8-griffoul@gmail.com> <20261016001448.GC14213@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_024615_086650_F4F37A23 
X-CRM114-Status: GOOD (  15.34  )
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

On Thu, Oct 15, 2026 at 09:14:48PM -0300, Jason Gunthorpe wrote:
> You are going to need to go into generic_pt and implement cut and a
> more suitable unmap to make this stuff work properly. We can't over
> unmap on conversions.

Agreed. I'll drop this patch from v3 for now.

Just to check I understand what you have in mind: a cut operation in
generic_pt that splits a large entry in place into smaller ones, so
that the revoke unmaps exactly its range, and iommufd uses large pages
only on domains that support it?

> Also please don't write commit messages with AI. WTF is this even
> trying to say? The subject is "use large pages" and this text says
> "map each page with its own call"

Sorry about that. It goes away with the patch, and I'll check and
rewrite the other commit messages for v3.

Fred

