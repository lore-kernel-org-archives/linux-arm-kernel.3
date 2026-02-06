Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE534EB28D4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nkMDM4rC7yGmXZE/CaMd6fZPIBX9ktS8WEKcs5QdQiM=; b=KCF0+OwkKAXiAd3uIte7LwYWoE
	aB/vfSxb2ZSmqA4naV70rW4nCudzLPvfxVOz/nzwEUYsPBIGZ6NDyPza48gv+MmzecxZjQ+LWG57J
	cgUbOh2k36xUDkhc+J5cCsmANrXRFhCyNPoNzipTHa2Z+zWmaLwvvMlBn2QzcKfONqI5RWoyhE/6k
	cA5yDAVtwiGzwh4Ad0dQSCt86T9V32IszXx5c9DFQvbxP4/6aRDAGnZHkeeOrA5aOVwN7tdDJ4KIV
	XLCmXEjQ9eJfWaqQuYVemzoNVf1KE9lVpVlOyWKLsEoawk5lRhRNCRIUCDx4+K+89a/qvrSe4Hotr
	T/WK0q/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG4Y-0000000AyUj-45Su;
	Fri, 06 Feb 2026 07:16:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voG4W-0000000AyUB-0YAo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 07:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 34AA56001A;
	Fri,  6 Feb 2026 07:16:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E952AC116C6;
	Fri,  6 Feb 2026 07:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770362166;
	bh=EQj88U1PIguqEAI0bHvHKRFIWmNh/CHWlfiSK+CikIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ttr4vzmAOWkSVKpkh3mIiwxnjyQYBOLTV4WPmeC6K+A4UgVq/Q6trh5HHQpzZ4sPp
	 hMpwYsrh05MItrVvB4p2pEIC/zTE9V4qIJD99iciQ1WGDAbbiHUBxkAqYKlrMV80Cp
	 JRkr8kaumkUtREeJXcZG/3A+kvu6mxSI2EbFxMo8R9PcokrV0RLJ/EqIgOvH8+UAxc
	 4iUALByznofDbaIUEyhTZJ/FW1+qUk6BeozjhHf7l2qy1rBrDqjKiMFMDFOoHiZK5s
	 bK0KITp3JQh0NpLNVp72lAosI5sZEsyfW9EIWMyHM2AJAysrba0dQUd1kKROMeFrtS
	 cxko2kfih5Jqg==
Message-ID: <f942c10a-73a7-4185-865f-c74c11f6fdcc@kernel.org>
Date: Fri, 6 Feb 2026 08:16:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: fsl: qbman: fix race condition in qman_destroy_fq
To: Richard GENOUD <richard.genoud@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Roy Pledge <roy.pledge@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Scott Wood <oss@buserror.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>
References: <20251223072549.397625-1-richard.genoud@bootlin.com>
 <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <825baaef-bd76-4e2c-94ef-3daddf55243b@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi,

Le 02/02/2026 à 13:54, Richard GENOUD a écrit :
> Le 23/12/2025 à 08:25, Richard Genoud a écrit :
>> When QMAN_FQ_FLAG_DYNAMIC_FQID is set, there's a race condition between
>> fq_table[fq->idx] state and freeing/allocating from the pool and
>> WARN_ON(fq_table[fq->idx]) in qman_create_fq() gets triggered.
>>
>> Indeed, we can have:
>>           Thread A                             Thread B
>>      qman_destroy_fq()                    qman_create_fq()
>>        qman_release_fqid()
>>          qman_shutdown_fq()
>>          gen_pool_free()
>>             -- At this point, the fqid is available again --
>>                                             qman_alloc_fqid()
>>             -- so, we can get the just-freed fqid in thread B --
>>                                             fq->fqid = fqid;
>>                                             fq->idx = fqid * 2;
>>                                             WARN_ON(fq_table[fq->idx]);
>>                                             fq_table[fq->idx] = fq;
>>       fq_table[fq->idx] = NULL;
>>
>> And adding some logs between qman_release_fqid() and
>> fq_table[fq->idx] = NULL makes the WARN_ON() trigger a lot more.
>>
>> To prevent that, ensure that fq_table[fq->idx] is set to NULL before
>> gen_pool_free() is called by using smp_wmb().
>>
> 
> Tested on a LS1046A based board.
> With this patch, the warning is not triggered anymore.
> 
> Tested-by: CHAMPSEIX Thomas <thomas.champseix@alstomgroup.com>

This fix is now in linux-next. If everything goes well I will send a 
pull request for this fix in rc2 or rc3.

> 
>> Fixes: c535e923bb97 ("soc/fsl: Introduce DPAA 1.x QMan device driver")
>> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
>> ---
>>   drivers/soc/fsl/qbman/qman.c | 24 ++++++++++++++++++++++--
>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>
>> NB: I'm not 100% sure of the need of a barrier here, since even without
>> it, the WARN_ON() wasn't triggered any more.
>>
>> diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
>> index 6b392b3ad4b1..39a3e7aab6ff 100644
>> --- a/drivers/soc/fsl/qbman/qman.c
>> +++ b/drivers/soc/fsl/qbman/qman.c
>> @@ -1827,6 +1827,8 @@ EXPORT_SYMBOL(qman_create_fq);
>>   void qman_destroy_fq(struct qman_fq *fq)
>>   {
>> +    int leaked;
>> +
>>       /*
>>        * We don't need to lock the FQ as it is a pre-condition that 
>> the FQ be
>>        * quiesced. Instead, run some checks.
>> @@ -1834,11 +1836,29 @@ void qman_destroy_fq(struct qman_fq *fq)
>>       switch (fq->state) {
>>       case qman_fq_state_parked:
>>       case qman_fq_state_oos:
>> -        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID))
>> -            qman_release_fqid(fq->fqid);
>> +        /*
>> +         * There's a race condition here on releasing the fqid,
>> +         * setting the fq_table to NULL, and freeing the fqid.
>> +         * To prevent it, this order should be respected:
>> +         */
>> +        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID)) {
>> +            leaked = qman_shutdown_fq(fq->fqid);
>> +            if (leaked)
>> +                pr_debug("FQID %d leaked\n", fq->fqid);
>> +        }
>>           DPAA_ASSERT(fq_table[fq->idx]);
>>           fq_table[fq->idx] = NULL;
>> +
>> +        if (fq_isset(fq, QMAN_FQ_FLAG_DYNAMIC_FQID) && !leaked) {
>> +            /*
>> +             * fq_table[fq->idx] should be set to null before
>> +             * freeing fq->fqid otherwise it could by allocated by
>> +             * qman_alloc_fqid() while still being !NULL
>> +             */
>> +            smp_wmb();
>> +            gen_pool_free(qm_fqalloc, fq->fqid | DPAA_GENALLOC_OFF, 1);
>> +        }
>>           return;
>>       default:
>>           break;
>>
>> base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
> 
> 


