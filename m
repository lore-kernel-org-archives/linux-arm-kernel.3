Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1A6606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 11:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lpZlpdmi;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=OAlhM/b1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=kDk67lzWfFsCYZhs+URfHejnsQjHQKAdi21nEjEfkGQ=; b=lpZlpdmi1kIJ1K
	t0CzFXW9ineH3iqV3jrJVCzlnKC6pPEMVDM9K0Qy+zLqcn6FU4+CGyCTIULYM9sE6US0lYHcmZQ/0
	uzWrHOFWX1WKCag2HTpPT+zVcX+BA0f/FPnxYoBQ2dlad+Z26JCF83gPckbFqUow7z5YYPf6nvpJo
	5JPOx+RbgOOqPButrPZ4y7DUSKQHJxMezHvw7szyuKz8wUtNqMS5lWOZYPcMfG7stYs53aBVqb8eO
	/A0drko4QIqhHb1nE3B4xa05cYpWQVWYgKavVVPHbxszVkW2ADM/qysj9sCpa0nCNJU/sFEOeBZ+D
	0hfoRpNFhiXNr6udY5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ6d-000000058yi-2Nq5;
	Wed, 04 Nov 2026 11:24:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZ6Z-000000058xu-3lJ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 11:24:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E405F1576;
	Wed,  4 Nov 2026 03:24:31 -0800 (PST)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5D4133F632;
	Wed,  4 Nov 2026 03:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793791475; bh=cNxLHKyKxNfmJ7kK8jwQOdBxq1jdZRXYKMxUjflNzHs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=OAlhM/b1UTDCKzHxVKcWTVHHEiWyoE3sOAS4WGx61rTB5VMFvG8P8T5fTW41sJMuS
	 ZAbEa1L5Umt4WXeDaT02Am9/gtSjfRoHgWFuf0W85ST6HEfe8d0YD008dplkLjN45U
	 Xh/1LHcOvctYNx/2RYy6/tFKeFJn6SAJd72YDDjo=
Message-ID: <7fcc1d9a-1c19-4827-b602-0db416af2e2f@arm.com>
Date: Wed, 4 Nov 2026 12:24:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Restore the cached configuration when a write
 to an MSC fails
To: Jinjie Ruan <ruanjinjie@huawei.com>, james.morse@arm.com,
 ben.horgan@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 gshan@redhat.com, jonathan.cameron@oss.qualcomm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261104101541.563113-1-ruanjinjie@huawei.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20261104101541.563113-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_032435_983345_F2557A54 
X-CRM114-Status: GOOD (  22.65  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 11/4/26 11:15, Jinjie Ruan wrote:
> mpam_apply_config() caches the new configuration before writing it to
> the RISes. When mpam_touch_msc() fails, the cache keeps the new values,
> so a retry with the same schemata is skipped as a no-op and never
> reaches the hardware.

Do we really need this? Has this been observed to solve a problem?
If any of the MSC accesses fail (for MPAM-Fb only), we already tear down 
the whole MPAM driver immediately, so any subsequent accesses wouldn't 
work. So I think there is little point in trying to fix or restore any 
configuration?

Propagating errors up the call chain is another issue, but I don't think 
we need to care about any hardware settings in case of a failure.

Cheers,
Andre

> 
> Restore the cached configuration on failure so the retry writes it to
> the RISes again.
> 
> Only arm64 MPAM systems are affected; x86 does not support MPAM.
> 
> Fixes: 60e33a1864fd ("arm_mpam: propagate MSC access errors for mpam_reprogram_ris_partid()")
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: <stable@vger.kernel.org> # 7.4.x
> ---
>   drivers/resctrl/mpam_devices.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index c067b6d57d71..bb667a416660 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -3412,6 +3412,7 @@ static bool mpam_update_config(struct mpam_config *cfg,
>   int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   		      struct mpam_config *cfg)
>   {
> +	struct mpam_config old_cfg = comp->cfg[partid];
>   	struct mpam_write_config_arg arg;
>   	struct mpam_msc_ris *ris;
>   	struct mpam_vmsc *vmsc;
> @@ -3439,8 +3440,10 @@ int mpam_apply_config(struct mpam_component *comp, u16 partid,
>   					 srcu_read_lock_held(&mpam_srcu)) {
>   			arg.ris = ris;
>   			ret = mpam_touch_msc(msc, __write_config, &arg);
> -			if (ret)
> +			if (ret) {
> +				comp->cfg[partid] = old_cfg;
>   				return ret;
> +			}
>   			ris->in_reset_state = false;
>   		}
>   	}


