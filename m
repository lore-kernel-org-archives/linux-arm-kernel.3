Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3ADDC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQ1CNK1mdZ8YlTItOSEv/fLsfB3GT+YfGG+Yal83Wg8=; b=FTUEW2+QbXK8H79MlxoW98BbGq
	Z/Gv/DPBJE6KxmLPoygObTevuBoDh+W/IjneAAxr2E0/GN/Ut7yvJ2vGoGvUyOu6V0YvyPdg273Fy
	t+fxaLyhCiP7QNNn2mSBwBWZ8gcZ9ozCP1jT3VmF5vRCD4hq9LzIck/EMNjJJSFmREGBhbqYoPP9k
	Mq36YfZ29ho475nfnTkZZlNdBxZiYYVh9KYtYsUpQ+wvI/sqQUTgs1/6xTrH+6X9ZYHfOFJq631up
	Y/93aZrxoxJxi20akEJ0DkDe0yxf22iYvMjlTqCUuqSFo3MVmSLgKRBcdX/kc8OJGYPE5dkhBBrwR
	6iCPYTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkL2b-0000000HEP9-0468;
	Thu, 16 Jul 2026 12:18:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkL2Z-0000000HEOt-3qqQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 12:18:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3A586001A;
	Thu, 16 Jul 2026 12:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E053A1F000E9;
	Thu, 16 Jul 2026 12:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784204289;
	bh=IQ1CNK1mdZ8YlTItOSEv/fLsfB3GT+YfGG+Yal83Wg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FO9Y3c3DbaKAuRoFCkVxiuGMVal9pgOCeSZFKZupNG7SzIxVAdExLXXq7doe2o4B/
	 30FmRahGmuHmg2KTzhU3FZgQ3zhWQh7KPl95x9ljNqYMoIp+GUJCeb4m6wHtKmRFhL
	 QRug+GMtDiIc49XGgNp5TkY4fyEzR0LKwNtNO4Fymb+dG2WLHfG1Jw6j4UVg6N2HJZ
	 Kr7QzBvzZbl1Q41sFlXYT4w1KZnBceBWB0sykqoJ6UmBl06piJ0St8aeFs8f5jwDoi
	 G9QStqZPxBMrX8/rzsXO9pvnm7lbEi0Gj6lYCQ8PZVcMF4XMcatYPq0MRUvQEqfW1y
	 kOJB48xG37Hsg==
Date: Thu, 16 Jul 2026 13:18:04 +0100
From: Will Deacon <will@kernel.org>
To: Yuho Choi <dbgh9129@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Oliver Upton <oupton@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64: cpuinfo: Fix sysfs cleanup on failure
Message-ID: <aljL_HSIc2ZhVj07@willie-the-truck>
References: <20260702230744.91169-1-dbgh9129@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702230744.91169-1-dbgh9129@gmail.com>
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

On Thu, Jul 02, 2026 at 07:07:44PM -0400, Yuho Choi wrote:
> cpuid_cpu_online() creates the CPU registers kobject and the base
> identification attribute group before optionally merging the SME-specific
> SMIDR attribute into that group.
> 
> If the base group creation fails, return after deleting the kobject. If
> the SME merge fails, remove the base group before deleting the kobject.

Why is it a good idea to remove the entire group if the merge fails?
Wouldn't it be more pragmatic to continue with the group that we did
manage to create? I don't really get why this proposed behaviour is
better.

Will

> diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
> index d50e2a9b066b..141bcfa4d611 100644
> --- a/arch/arm64/kernel/cpuinfo.c
> +++ b/arch/arm64/kernel/cpuinfo.c
> @@ -380,9 +380,19 @@ static int cpuid_cpu_online(unsigned int cpu)
>  		goto out;
>  	rc = sysfs_create_group(&info->kobj, &cpuregs_attr_group);
>  	if (rc)
> -		kobject_del(&info->kobj);
> -	if (system_supports_sme())
> +		goto out_del_kobj;
> +	if (system_supports_sme()) {
>  		rc = sysfs_merge_group(&info->kobj, &sme_cpuregs_attr_group);
> +		if (rc)
> +			goto out_remove_group;
> +	}
> +
> +	return 0;
> +
> +out_remove_group:
> +	sysfs_remove_group(&info->kobj, &cpuregs_attr_group);
> +out_del_kobj:
> +	kobject_del(&info->kobj);
>  out:
>  	return rc;
>  }
> -- 
> 2.43.0

