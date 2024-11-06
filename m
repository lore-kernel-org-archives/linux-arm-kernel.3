Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5727D59F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 17:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2Kg6GaH7gYTnb++jbY4MBBC4c65ettqYa6wLql3FJE=; b=vquo7BC0gbZ5PlPARwE228rNKW
	AUbVQLy485K4d4S///w08jEzCZG9cEmxUWnlWGUXQdWMMqBUAsdspv23TM18Xbofgrt8RbthBY9o0
	yJEkmpYjLZ77Jk2nnD+KbR8V7fBZRvVi20pwpvIAYNRRQAY2X2BgN4BD55DinyRMrqlGqaTmmhuuY
	89WHFd5yDFRa8thYkXb9YVvaIjUU3bGmX3qDnLUTg7uUxkhUEIJ+6Cqv/KXDQ1UMZRWgw8elheH8B
	NWV79rcGiuk639JP7acL7sxHuxWlD7z6bCVQko8Y4gfa8W1M0mWdEkQWXqZmp6qZldJDJkgypG2B1
	mEyUy4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jPE-000000047WF-0crI;
	Wed, 06 Nov 2024 17:01:20 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8jN3-000000046z0-0bXw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 16:59:06 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5cec93719ccso5924267a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 08:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730912342; x=1731517142; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T2Kg6GaH7gYTnb++jbY4MBBC4c65ettqYa6wLql3FJE=;
        b=AgYMvcF7R9sIkT4mVCzhxsKw9EziOWIM3ScZum0DWPjXiAzgY9jZ3JKgsvbJDX8nYU
         o30atFcAO6+kY/cw+BaH4tdgH0ZkPjjEhI+FX+gAAEpi3Hn6V+m/t5uo9NpI53ftMLbf
         lpdz6KPsbCVmwxGFXzAjPEA8PR0KpddYDQJliRCMqEiesyI8R/U13DUuVjZxKbdO91z3
         xFLdsvnMQOXJ8CjAiLHAS/GpKtLRUec+DzGVUqPVHlkSssU5bascRyfmB+Hbba0T8dG+
         tmuyhUpDv+WRO4IMufmkn9XWPPQuMLUtKitddaO6qA+b7kw/6kEaNwOZqlAWmKx8gz+4
         pyjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730912342; x=1731517142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2Kg6GaH7gYTnb++jbY4MBBC4c65ettqYa6wLql3FJE=;
        b=BKhlB8IwftedFqUNmX9oJgoaCZtDKVLU9btGWGqR0LZ2sl1tH2IC2j1Dg0TTJLwsP7
         g8Y6l7+k5mTQe5k6kEkLIkYsdLGdz1StfyCN3m9xMrpQN8k6xpq/ilS8+qmDp6XvNg2n
         ozkMQp6SXuCKQZ+Gk664+qO6EgePBpHhPe1sYGI+ptwne3aOni4GMiHFA4fmxKNiU2j1
         WT03omXwZhM1gaWmYkek5jx4udY9p5QTJtTXT/OkmQtg8XOBAA9trKzXY0aLXT0C1N9T
         GHrd1bcgJ/HZpHXkGAydPn7VESvZFeY73f6D2irtireBnMOdIUYBZ+GWtXSmKHBWjvrz
         sGyA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ0w7avbXsjN5djrlEe/zUfJQbBj3D6s4uXjyN11VhZN1imUotgk9zZzr/BsiuLFXtdjKhBgbnNTkfrZ3c4g+A@lists.infradead.org
X-Gm-Message-State: AOJu0YymV9RXTsXySA6D+lW+1dNSzWqdzcXwwFOTmBMbz4c4jXnI7iKA
	RMVeI8EzdgPulZixA8Sm/5Ec1LLlOOGqxTVhvRBHi0zFKpPStgYMo/qt3VJXSw==
X-Google-Smtp-Source: AGHT+IGvdZ2IaD+BzOBp7O9t8aJG3Fn8CPmHBQZKasjV9H+9x/GBg968m+XOOjPPD2/pEN1skbtRkA==
X-Received: by 2002:a17:907:7f14:b0:a9a:6855:1820 with SMTP id a640c23a62f3a-a9e3a5a0357mr2809681466b.15.1730912342073;
        Wed, 06 Nov 2024 08:59:02 -0800 (PST)
Received: from google.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb16a1440sm304413166b.31.2024.11.06.08.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 08:59:01 -0800 (PST)
Date: Wed, 6 Nov 2024 16:58:58 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/18] KVM: arm64: Introduce the EL1 pKVM MMU
Message-ID: <ZyugUvS5dMwXU5nW@google.com>
References: <20241104133204.85208-1-qperret@google.com>
 <20241104133204.85208-18-qperret@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104133204.85208-18-qperret@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_085905_201728_E409E057 
X-CRM114-Status: UNSURE (   9.39  )
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

On Monday 04 Nov 2024 at 13:32:03 (+0000), Quentin Perret wrote:
> +bool pkvm_pgtable_test_clear_young(struct kvm_pgtable *pgt, u64 addr, u64 size, bool mkold)
> +{
> +	pkvm_handle_t handle = pkvm_pgt_to_handle(pgt);
> +	struct pkvm_mapping *mapping;
> +	struct rb_node *tmp;
> +	bool young = false;
> +
> +	read_lock(&pgt->pkvm.mappings_lock);
> +	for_each_mapping_in_range(pgt, addr, addr + size, mapping, tmp)
> +		young |= kvm_call_hyp_nvhe(__pkvm_host_wrprotect_guest, handle, mapping->gfn, mkold);
> +	read_unlock(&pgt->pkvm.mappings_lock);
> +
> +	return young;
> +}

I just observed a funny behaviour in one of my tests, the above explains
it ... Can you find the bug? Ahem. I'll fix in v2 obviously.

