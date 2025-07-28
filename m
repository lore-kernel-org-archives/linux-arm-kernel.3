Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A56C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhwwnGaF8oEjcg00LdipcmVJCogFTYddUjPclmorEh8=; b=n/l+SbFMiahwV7kHd7BADOX8Pj
	+MMvmMdkyStOYUsMz4x8e4vdPt+rfGZfzf38+ApJzzaurmlzxO+vZWQIHNprPr9cihU3OaI9XMOgb
	hDZkei4azU2zpw2EjcgO60zR74AbMSCn6lPs2MupIoAQGW2cCLaHI9vjIZTm3JwSzqh7YiS8+oTnT
	2Xr+rZhfzEzEuoL2tP6UuMdDcpZGNr9yScsM6HNcV5eVD6ccpjp2qGLPiMsQdkXzmSVuZKPy+bDwO
	Y05SIwFiUNf5SHQof21ZmPaYzxdnacCr9uHveM4/g5vgFUsz0PNOOA3M7UBiN72Aismt4huFlmRQ0
	RGoPxliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRzE-0000000F8Rq-36Hw;
	Mon, 28 Jul 2025 17:50:08 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR48-0000000F25E-05Xi;
	Mon, 28 Jul 2025 16:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753721469; x=1785257469;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=/nGUWz/QI4oI9JaeM4nznpA3cGA5rFBBCsAtiIFIIQs=;
  b=cP2LnrzhTwJdfq3YsQT2OEjZz9U0M8KwLc30dZrLl3SWkjMkQRKRt8Zq
   Di5m7DVKCORjAeMGazs6nCm5PTL3SZaicHM8BP34h2jY4lUo7Mzracycq
   Gtbq0syh0rA25BIxpyxo6WqddVFnSD79bIV8PMyTKxR9rqjW/tNjHAggQ
   bB1PTnVjfYbyI1a+h1V56ZawtlOhW/VPRg1Mv2Q3zEZgrvpmPWfBHc+C8
   xmbANi9taVrJF761bCKwLgU3Yg9ZPf1gCKwgwQpM+k/0IsvSGrshV2iQ6
   ohzqU+fYNU89Fbz0XUtA85wWZx6eeA6ZMtzAwKrKY44Rz61ldiPRr8PIB
   Q==;
X-CSE-ConnectionGUID: 7P8lNp4sSM69SrZSs9aWng==
X-CSE-MsgGUID: A3yh4WEsQNK0LPnNA7tb6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="55677205"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55677205"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 09:51:04 -0700
X-CSE-ConnectionGUID: ry8R4pN3S9ul7V1FyWdaJg==
X-CSE-MsgGUID: agjBKv3LTLaQRocnjggyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="193308480"
Received: from hlagrand-mobl1.ger.corp.intel.com (HELO [10.245.102.40]) ([10.245.102.40])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 09:51:01 -0700
Message-ID: <08e39788-8d1b-494d-87e3-e5b427875674@linux.intel.com>
Date: Mon, 28 Jul 2025 18:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix PPE table access in
 airoha_ppe_debugfs_foe_show()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
Content-Language: pl, en-US
From: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
In-Reply-To: <20250728-airoha_ppe_foe_get_entry_locked-v1-1-8630ec73f3d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_095108_137978_0FD0F1E4 
X-CRM114-Status: GOOD (  16.39  )
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

On 2025-07-28 1:58 PM, Lorenzo Bianconi wrote:
> In order to avoid any possible race we need to hold the ppe_lock
> spinlock accessing the hw PPE table. airoha_ppe_foe_get_entry routine is
> always executed holding ppe_lock except in airoha_ppe_debugfs_foe_show
> routine. Fix the problem introducing airoha_ppe_foe_get_entry_locked
> routine.
> 
> Fixes: 3fe15c640f380 ("net: airoha: Introduce PPE debugfs support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>

Thanks,
Dawid

> ---
>   drivers/net/ethernet/airoha/airoha_eth.h         |  4 ++--
>   drivers/net/ethernet/airoha/airoha_ppe.c         | 18 ++++++++++++++++--
>   drivers/net/ethernet/airoha/airoha_ppe_debugfs.c |  2 +-
>   3 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
> index a970b789cf232c316e5ea27b0146493bf91c3767..cf33d731ad0db43bca8463fde76673b39a4f6796 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -615,8 +615,8 @@ int airoha_ppe_setup_tc_block_cb(struct net_device *dev, void *type_data);
>   int airoha_ppe_init(struct airoha_eth *eth);
>   void airoha_ppe_deinit(struct airoha_eth *eth);
>   void airoha_ppe_init_upd_mem(struct airoha_gdm_port *port);
> -struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
> -						  u32 hash);
> +struct airoha_foe_entry *
> +airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash);
>   void airoha_ppe_foe_entry_get_stats(struct airoha_ppe *ppe, u32 hash,
>   				    struct airoha_foe_stats64 *stats);
>   
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> index 0e217acfc5ef748453b020e5713ace1910abc4a8..4dbf2bf187d02e3e8b9d2b966036c3aa58c867b1 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -498,9 +498,11 @@ static void airoha_ppe_foe_flow_stats_update(struct airoha_ppe *ppe,
>   		FIELD_PREP(AIROHA_FOE_IB2_NBQ, nbq);
>   }
>   
> -struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
> -						  u32 hash)
> +static struct airoha_foe_entry *
> +airoha_ppe_foe_get_entry(struct airoha_ppe *ppe, u32 hash)
>   {
> +	lockdep_assert_held(&ppe_lock);
> +
>   	if (hash < PPE_SRAM_NUM_ENTRIES) {
>   		u32 *hwe = ppe->foe + hash * sizeof(struct airoha_foe_entry);
>   		struct airoha_eth *eth = ppe->eth;
> @@ -527,6 +529,18 @@ struct airoha_foe_entry *airoha_ppe_foe_get_entry(struct airoha_ppe *ppe,
>   	return ppe->foe + hash * sizeof(struct airoha_foe_entry);
>   }
>   
> +struct airoha_foe_entry *
> +airoha_ppe_foe_get_entry_locked(struct airoha_ppe *ppe, u32 hash)
> +{
> +	struct airoha_foe_entry *hwe;
> +
> +	spin_lock_bh(&ppe_lock);
> +	hwe = airoha_ppe_foe_get_entry(ppe, hash);
> +	spin_unlock_bh(&ppe_lock);
> +
> +	return hwe;
> +}
> +
>   static bool airoha_ppe_foe_compare_entry(struct airoha_flow_table_entry *e,
>   					 struct airoha_foe_entry *hwe)
>   {
> diff --git a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> index 05a756233f6a44fa51d1c57dd39d89c8ea488054..992bf2e9598414ee3f1f126be3f451e486b26640 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe_debugfs.c
> @@ -67,7 +67,7 @@ static int airoha_ppe_debugfs_foe_show(struct seq_file *m, void *private,
>   		u32 type, state, ib2, data;
>   		bool ipv6 = false;
>   
> -		hwe = airoha_ppe_foe_get_entry(ppe, i);
> +		hwe = airoha_ppe_foe_get_entry_locked(ppe, i);
>   		if (!hwe)
>   			continue;
>   
> 
> ---
> base-commit: afd8c2c9e2e29c6c7705635bea2960593976dacc
> change-id: 20250728-airoha_ppe_foe_get_entry_locked-70e4ebbee984
> 
> Best regards,


