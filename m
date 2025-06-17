Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D937C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 17:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IA4MJhquE1o+TqnkmWKumeVS5f4R14B242ocDAaHIkk=; b=bC41vBVXpFKbM+raK9A8xSzfux
	cXrArNvZOodzaqCewbgIx+VP9sdb4lbj4lwltnwL19lUvu87VKobt86Og7+x96x0D4LS4uHSngZSc
	5ejU9TPkzkZqjC8C90Z/VyMKh/Y68xs6Cq69WX+BTliWg+4cLee1npcunBkONhevAZX0wCmqbbF0c
	K6m/U3Y5GdIvPe8AcPUszG2Aenh7E4uJWU9M4b0hInPbCvUsnjNWISO9o7zmHxkML7/Q83bK3uKAM
	sF8YC/b57Xml2z+ffLmbZAWFFdEUIolv9HLR/RQkpgwpNAvV4UA2qUgZiHO2CGm3fTTFuAGoMNFVo
	2r4AayzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZre-000000080N1-0SPJ;
	Tue, 17 Jun 2025 17:12:50 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRZAY-00000007sVR-1D46
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 16:28:19 +0000
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bMC2c52jwz6M4HK;
	Wed, 18 Jun 2025 00:27:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8A246140136;
	Wed, 18 Jun 2025 00:28:10 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Jun
 2025 18:28:09 +0200
Date: Tue, 17 Jun 2025 17:28:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: James Morse <james.morse@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	"Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>
Subject: Re: [PATCH 5/5] cacheinfo: Add helper to find the cache size from
 cpu+level
Message-ID: <20250617172808.00005c14@huawei.com>
In-Reply-To: <20250613130356.8080-6-james.morse@arm.com>
References: <20250613130356.8080-1-james.morse@arm.com>
	<20250613130356.8080-6-james.morse@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_092818_476636_8B58764A 
X-CRM114-Status: GOOD (  20.61  )
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

On Fri, 13 Jun 2025 13:03:56 +0000
James Morse <james.morse@arm.com> wrote:

> The MPAM driver needs to know the size of a cache associated with a
> particular CPU. The DT/ACPI agnostic way of doing this is to ask cacheinfo.
> 
> Add a helper to do this.
> 
> Signed-off-by: James Morse <james.morse@arm.com>



> ---
>  include/linux/cacheinfo.h | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
> index 9c959caf8af8..3f1b6b2e25b5 100644
> --- a/include/linux/cacheinfo.h
> +++ b/include/linux/cacheinfo.h
> @@ -148,6 +148,26 @@ static inline int get_cpu_cacheinfo_id(int cpu, int level)
>  	return ci ? ci->id : -1;
>  }
>  
> +/*
> + * Get the size of the cache associated with @cpu at level @level.
> + * cpuhp lock must be held.
To me kernel-doc would be appropriate.  Particularly the return 0 thing.
However there isn't any for existing cacheinfo interfaces so maybe
fair enough to 'follow local style' on that.

> + */
> +static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
> +{
> +	struct cpu_cacheinfo *ci = get_cpu_cacheinfo(cpu);
> +	int i;
> +
> +	if (!ci->info_list)
> +		return 0;
> +
> +	for (i = 0; i < ci->num_leaves; i++) {
> +		if (ci->info_list[i].level == level)
> +			return ci->info_list[i].size;
> +	}
> +
> +	return 0;
> +}
> +
Why not

static inline unsigned int get_cpu_cacheinfo_size(int cpu, int level)
{
	struct cpu_cachinfo *ci = get_cpu_cacheinfo_level(cpu, lev);

	return ci ? ci->size; 0;
}

Like existing get_cpu_cacheinfo_id()?

>  #if defined(CONFIG_ARM64) || defined(CONFIG_ARM)
>  #define use_arch_cache_info()	(true)
>  #else


