Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7FFD116F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VGMOgE5nROcKR76+XJUgIhsjqUTTAWoW5W6MOeDvkTk=; b=l/1UyCBA8PmzzRQHpRt4MZiXoP
	AxB2kQu7vD09rXVxa512XVd7AWx3p9boNAiik4jbbXPo7jadpIfOCLVVfkq8jb0SXy4wOLRppdTe1
	7z8D4oDFW4ud3y4eQhDUJrJGojbz+rUP1SQwKaF2WUZo4o65XMthSRWzGm7fkkT11jxEQU5rPUMWF
	YIz1Yd/WTaVdDWj4ndPaC5yIW0zcA75JDgcks4RCCb1va0Onpn/8NP5mSZ7Y+nbOjxJICFgeUXYoB
	2aTih7pCMldYKUHviv/TdWLYaK3vp4hH+qBcwFFC668B6D6ajMfF3Q4lWp0DkbpglyHnbbcAWL05C
	g99wreCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP21h-00000000iDz-1OKQ;
	Fri, 28 Nov 2025 17:12:57 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP21f-00000000iDX-2xQV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 17:12:56 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-8b2ea2b9631so194351985a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 09:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764349974; x=1764954774; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VGMOgE5nROcKR76+XJUgIhsjqUTTAWoW5W6MOeDvkTk=;
        b=hFIrz+gVEhm9lfR14iOT2nkBDjrXZkzxosp/KaQvBuJSIaOAwcKT8dbHcb0Daxn11L
         aPBtJZdShSGUhV7ng2RVXpVQjj0SaW/leCrZ+qrcKYhh2n49CX/mlpi4Xz9yzzQbWD1F
         PvTGKHYUjlD3w3RrinmHnesDUXCLoerampNkoYiOiMScyf+08gLAIv+JWtBUdk8zu9U3
         9swUZm0Pu3UmauQmHO+CsiD5WZa0dC5wILENScaRZQ0WrunIU7yxWXJmXBSlDXBZzbFL
         rMOL0L6Aep8Kmb+qXbT25OeBDlh/QE//2ZBObuUQvmVKl4r5ZVVTJ1jSUyh7mfs82oKn
         s/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764349974; x=1764954774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VGMOgE5nROcKR76+XJUgIhsjqUTTAWoW5W6MOeDvkTk=;
        b=TsxraZnOT44LzU7A33K9jqpX4+Krln3QyZxmkQR4ybj9/xXwZbMCZnq5xtD5Ir+5nF
         j7yq63pgyt/9rr3xNRW4u4okSJDk2tkwLwgkelg9ozPta5f1/XhtyHwcuklNmeAlgtX4
         xGNqyz3aPTm9/4AejCJD2EtZgOXkuEBDS6/dqDQhqnlHVNtufxCnXFu3CkDAeJesXTMq
         TmnYPeI1ACwMVGUXpoztFARvz0frUaOvgKtPTDsCaKe23KF1l1kzSguX9/HaEgBE/byR
         4AeUmZCGmLwwJJ+9eBe7VqgyUJGqNs+eEY/LW+ZMkWe8CArf3uUeDMjB7MlOZh3v9WBn
         ZscQ==
X-Gm-Message-State: AOJu0Yx1xkbjeYD+2OUBzR5Lye/Xh3oYnNLPCLCST/PU1ZI1NF+INtyB
	Bz95ICgZWTJgZwLJtO/lh8gmX420z8OJ0/Kc9fuVEQMH6AfSYEmsouhuMhox3LkxpYLmEvXCH8f
	k38/r
X-Gm-Gg: ASbGncsItr0mKmmvXj3sD9Ice97k312JAwlwdHEmObsEoLh2XsrKgas38bnyhXJkYlj
	Eg7MAeL7bejORF9iCgTXkGB2ogW+hx2F5n/0ecZi+OYYeksiANkcUH3Nq6PdpsV0fBmnAp3q+BD
	cGs1HzWQkXrZTUupChVC0DXzlJOpLzGVIOj4K02vxVv7a954aSqFo+My7HdJyDpC3Nz7jRZU2BA
	+84CWKyD6cIDc0kD+7N1w5fUeDoIKe2gsqWQzDQR6btgMtzGZrJ9S3UPtjEIxrYcXxvT74md2K7
	m1qVESdZ+cEYsyIViOIZEv8nB9Z4b+V+ckoYJRXQEev5W6qPx61Nb1w2lwwvELv4xYm7eURjavU
	EFOms6AERQmTT4M+47tm9AvJ6maLcQaMdV50EfoGIcRUkvCFUiU7v8M/ytpoh39ZZbBY8rG/p/n
	AzjEG+r+ntMDMfHt7ysNhdVjYvpYoHQ/zVqqKtIt1+Vl3kj5axLBCDmJNE
X-Google-Smtp-Source: AGHT+IEpLMRDIa8BpUCxOvzv6sBrlYlrmtR4jLIjgGtg7IeIGGp0t/UdGNKFxQmXbiZHtnUvklj64g==
X-Received: by 2002:a05:620a:3188:b0:864:48eb:34e with SMTP id af79cd13be357-8b4ebdaea45mr2049767785a.55.1764349974363;
        Fri, 28 Nov 2025 09:12:54 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a69d1sm339226285a.16.2025.11.28.09.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:12:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP21c-00000003Q9u-4AUc;
	Fri, 28 Nov 2025 13:12:53 -0400
Date: Fri, 28 Nov 2025 13:12:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 27/27] iommu/arm-smmu-v3-kvm: Enable nesting
Message-ID: <20251128171252.GF812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-28-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-28-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_091255_754607_650D6DFB 
X-CRM114-Status: GOOD (  17.45  )
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

On Mon, Nov 17, 2025 at 06:48:14PM +0000, Mostafa Saleh wrote:
> @@ -441,8 +490,32 @@ static void smmu_reshadow_ste(struct hyp_arm_smmu_v3_device *smmu, u32 sid, bool
>  		hyp_ste_ptr = smmu_get_ste_ptr(smmu, sid, hyp_ste_base);
>  	}
>  
> -	smmu_copy_from_host(smmu, hyp_ste_ptr->data, host_ste_ptr->data,
> +	smmu_copy_from_host(smmu, target.data, host_ste_ptr->data,
>  			    STRTAB_STE_DWORDS << 3);
> +	/*
> +	 * Typically, STE update is done as the following
> +	 * 1- Write last 7 dwords, while STE is invalid
> +	 * 2- CFGI
> +	 * 3- Write first dword, making STE valid
> +	 * 4- CFGI
> +	 * As the SMMU MUST at least load 64 bits atomically
> +	 * that gurantees that there is no race between writing
> +	 * the STE and the CFGI where the SMMU observes parts
> +	 * of the STE.
> +	 * In the shadow we update the STE to enable nested translation,
> +	 * which requires updating first 4 dwords.
> +	 * That is only done if the STE is valid and not in abort.
> +	 * Which means it happens at step 4)
> +	 * So we need to also write the last 7 dwords and send CFGI
> +	 * before writing the first dword.
> +	 * There is no need for last CFGI as it's done next.
> +	 */

This really should share the main driver logic to do STE writes in the
right order and try to avoid making it non-valid if not necessary.

This will not properly support all the real-world kernel flows around
PASID with such a simplistic implementation.

Json

