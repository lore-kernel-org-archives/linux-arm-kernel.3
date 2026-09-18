Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEE6C982DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 11:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTZzu47AOmRxHTR0Eyam8a+mT0R7a/crBOBUb7Y1wmI=; b=B6IGGMlhv1o8KAiPIHgpgGfG/b
	2xEsqTuuChHFfucRe1DaSn7n6yuvw7ji5EaY+zZfe9gcrtMKNsbFC2c7h8F82MFAoLiuM5ubOvQ4J
	cOpPgLWwLmu/Y96csNr67EUzv2TrvW2e/zK1F8tbTV5KMBh8yxaNlhHP2OGxxac1ALkTiOjB5cJrV
	9LnH5B2KQ6ba16Ph0rw5chMw5sPWBnmyU5fsQIfSuvh8dB4jiocGoKhhgTZocb3mf4UJVKqaUmEMW
	Y/fapxSbnosM0BQiJ7CWB0eRkai1hkZDdqtSEM9YTyEPM9Hvl9wcVaDfJYMktN79FSZhivDmrljlr
	kQ/OtNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XF1-0000000EJDM-2Al1;
	Fri, 18 Sep 2026 11:58:55 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7XEy-0000000EJCg-1XXU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 11:58:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FTZzu47AOmRxHTR0Eyam8a+mT0R7a/crBOBUb7Y1wmI=;
	b=2iI2NGkHtsj0pKWN/NSlZVoBkpiYmpnYJ1HMqRg97bQbgDGbJXsYzxrE1RSQE50iT3kZnaZ1r
	ugnw7eBaUpx7P+dyZXKWjDZw5E3lp1WnMKCHoysh5eRZFpjB0II66WCYY+kvJVlIN1mP3T5YsE/
	82FZwcek02meXDFkiwiIZGk=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4hmW8D3pYRzKm5t;
	Fri, 18 Sep 2026 19:47:40 +0800 (CST)
Received: from kwepemr100010.china.huawei.com (unknown [7.202.195.125])
	by mail.maildlp.com (Postfix) with ESMTPS id 317A84057A;
	Fri, 18 Sep 2026 19:58:44 +0800 (CST)
Received: from [10.67.120.103] (10.67.120.103) by
 kwepemr100010.china.huawei.com (7.202.195.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 18 Sep 2026 19:58:43 +0800
Message-ID: <497c6239-a75f-4087-83c8-efface3fe3d7@huawei.com>
Date: Fri, 18 Sep 2026 19:58:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 5/5] KVM: arm64: Enable HAFDBS for guests not on
 migration
To: Leonardo Bras <leo.bras@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <kvmarm@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>
References: <20260901171558.2674031-1-leo.bras@arm.com>
 <20260901171558.2674031-6-leo.bras@arm.com>
From: Tian Zheng <zhengtian10@huawei.com>
In-Reply-To: <20260901171558.2674031-6-leo.bras@arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.120.103]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemr100010.china.huawei.com (7.202.195.125)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_045852_872919_83EC2091 
X-CRM114-Status: GOOD (  13.33  )
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



On 9/2/2026 1:15 AM, Leonardo Bras wrote:
> @@ -2570,53 +2571,76 @@ int __init kvm_mmu_init(u32 hyp_va_bits)
>   
>   out_destroy_pgtable:
>   	kvm_pgtable_hyp_destroy(hyp_pgtable);
>   out_free_pgtable:
>   	kfree(hyp_pgtable);
>   	hyp_pgtable = NULL;
>   out:
>   	return err;
>   }
>   
> +static void kvm_set_hafdbs(struct kvm *kvm, bool set)
> +{
> +	/* Check if no action required */
> +	if (!!(kvm->arch.mmu.vtcr & VTCR_EL2_HD) == set)
> +		return;
> +
> +	if (set)
> +		kvm->arch.mmu.vtcr |= VTCR_EL2_HD;
> +	else
> +		kvm->arch.mmu.vtcr &= ~VTCR_EL2_HD;
> +
> +	kvm_make_all_cpus_request(kvm, KVM_REQ_RELOAD_STAGE2);
> +}
> +

Hi Leo,

HD alone is architecturally a no-op. According to the Arm spec, the
VTCR_EL2.HD field description reads: "When the Effective value of
VTCR_EL2.HA is 0, this field behaves as 0 for all purposes other than a
direct read of the value of this bit." So patch 5 as it stands never
actually enables stage-2 dirty management.

In the combined series, I'm planning to replace both kvm_set_hafdbs()
and our earlier enable/disable hooks with a single derived mode:

```
/*
  *   logging && HDBSS-capable  ->  HDBSS  (HD|HA|HDBSS)
  *   logging, no HDBSS         ->  off
  *   !logging, HAFDBS-capable  ->  HAFDBS (HD|HA)
  */
void kvm_arch_update_hw_dirty_mode(struct kvm *kvm)
{
	bool logging = atomic_read(&kvm->nr_memslots_dirty_logging) != 0;
	unsigned long target;

	if (logging && kvm_supports_hdbss(kvm))
		target = VTCR_EL2_HD | VTCR_EL2_HA | VTCR_EL2_HDBSS;
	else if (logging || !kvm_supports_hafdbs(kvm))
		target = 0;
	else
		target = VTCR_EL2_HD | VTCR_EL2_HA;
	...
}
```

HA is always set alongside HD by construction, so the no-op issue goes
away.

I'll fold this into the HDBSS v5 series when I send it out. Let me know
if you'd rather keep it in your v2 instead.

Thanks,
Tian

