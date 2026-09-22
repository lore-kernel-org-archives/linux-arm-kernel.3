Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532BCC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=; b=wMtfG6bblpOvClXmB1u9V7jf3f
	rGsAitYryfUbDatXdVZ/Kjp9yjMLsRjOLRJ3XRZw8KK+HNj1uuWrHwZqZJlBpJ/LilZpPTxAnDcoV
	mSlkK5NLC0LqJlqYpP2mCJJ5PbgbT7J5ups56cCr9jyKY7rRQR3oxK7cvq3aiaXo6P3W5xHtpsixk
	uekUf//eM3QWvnEa2lsUgtvW+fqUJ6HQM9UxCKW2+TsuG6q75aKOCtv5o3IO7SEbsd3jAXuPn4+2m
	qQ5dcjCKfbeQ3q7Y1+tN41ZkpKPB5P6XRBM/zLxV8Fmf7U8K+Lemj++7MWUUfeQQjql06iyETbwRb
	pTcZFFVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHe-00000004GtK-2E8F;
	Tue, 22 Sep 2026 05:43:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHa-00000004GsA-3Phx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=;
	b=bYbdm3GuJcvk1a5AHC55Lz7czVDhFrf51n+XhX+4JGxcF8iIfX/kGhHzgXDvatkfCq7wFn
	nw1YI8W/Qf6vpek70gjM+dBkXg2lhEc/oBHCECs4/aHzSMsMKJjn1VbiOCcF3J1n5UkVgY
	NO3F8s8RIpYuKZ8nWUG4v7a/Ac9pZhw=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-uvGJZn7MMrioG6grSEU6GA-1; Tue, 22 Sep 2026 01:43:07 -0400
X-MC-Unique: uvGJZn7MMrioG6grSEU6GA-1
X-Mimecast-MFC-AGG-ID: uvGJZn7MMrioG6grSEU6GA_1790055786
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39aee9b4cf2so6701485a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055786; x=1790660586;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ehNp1JTVt6t81etN8BHSi1b5yH/BNSAqQ2MBfVgapJo=;
        b=11Tzal23YC0q3JsHIKufCXEded1QRqCdZ88vrNF4q9Pwub5XSk5vXzDMXzYbcyK9rR
         Mu+COQUS52HyJ3TaShm5fL/d8UJI+k2Xsx7lkepF8B8N/NMcY9zzF3gt5z1ebTHmqGtw
         iuh+FuYggWkVBEURDbmX5Cu8lUTSUOVcZZGISVkxrXtJjddtY1FvXlY3Aj2OGAqg9avs
         wZ39Q+9BUvVR/5EBT/fax4y1GIUnq8Zn3VXwKkuXtQ5Ju2OD5j3v2PrxO5uC3hMTc/u6
         7F+7qsa/aFW3IVesw1UpYdx2Cl2qcG3IvWbsP1/bak4BpabQcx9Nf385FWqMVdvSZUeE
         NkWw==
X-Forwarded-Encrypted: i=1; AKwUvBwnIE6DD2obDOSeI3JDf5s03yWdQNZPwDJ9dp6ADb6GoVOTTV+LoQzHfLQVnWUTVyFpwmCLM/pq+TiQ63MwLZSQ@lists.infradead.org
X-Gm-Message-State: AFuF++n2Y7f5DUhBRdlMIFX3dRxRihZ2XAs5uKZltzfibeEpYCNgpzQx
	rt0ja7G9LShEcpjiUZTNafw9n+nYKdwfpntNN55PmPUx+JA1WLYuuiqPMvv3RN8rx0HSuoaMkjI
	GftnPhsbIl2y7MPSkAx2W1EkX8ICwqPFBxTSJ7EQ2WTi39yFv7V6k83fIKC7n14vX3epVvcfZW8
	Df
X-Gm-Gg: AYBFou1pjQ1qFovxTwOsitT7+10dxPAVlIuivEJiFx05KVvGNqJ6b3xmc5S66ZRmwWs
	BFAXNUEB2aYw0R1LFdg+J1PhNKJsNpkvPdc/aOS167z/nAenX2jfquK4lY9HacfrYKRCuOWz6c6
	MZmcKsIV4cQGugVZ1FWjemQ3oQbP5Qhme+6obpdf+1fDfmoDeRRLF45sl7p59oDpSC/WF32cZNL
	BBcRK88LhF+V9FG+hN320VdTL0UvuW34UJjXTLe9EyzDHZoSl8E2ab3dsRitPBRg4AUXTjxHQ0F
	V0H2GekoewhIYa5c8nMGi+Zf6XowThoX5wjeZI9P8DSTV7TTw7Tu+GoNRX/CFKgG12JTnjA/bRV
	L9G4GQ0Gs1MQVndShzahYOTUs1/U4nGPg3QApv2Q+kA==
X-Received: by 2002:a17:90b:4ec8:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a0730d8f30mr84668a91.19.1790055786266;
        Mon, 21 Sep 2026 22:43:06 -0700 (PDT)
X-Received: by 2002:a17:90b:4ec8:b0:398:bacb:1137 with SMTP id 98e67ed59e1d1-3a0730d8f30mr84648a91.19.1790055785811;
        Mon, 21 Sep 2026 22:43:05 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674c321dsm2592051a91.14.2026.09.21.22.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:43:05 -0700 (PDT)
Message-ID: <729c585e-2977-496f-aa7f-d68d9ccb9162@redhat.com>
Date: Tue, 22 Sep 2026 15:43:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on
 restore
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-6-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-6-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: m0xVZ6kBnnnSfru5DBV5FQw9ZhQMoDw8hHzDzB3PqLA_1790055786
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224310_927832_7602CE08 
X-CRM114-Status: GOOD (  13.54  )
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

On 9/18/26 12:56 AM, Ben Horgan wrote:
> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
> will mismatch when restoring and so the monitor will be reset. However, the
> state may have been lost and so there are no guarantees. Ensure the reset
> happens by setting the reset_on_next_read and remove the unnecessary writes
> from mpam_save_mbwu_state().
> 
> Fixes: 41e8a14950e1 ("arm_mpam: Track bandwidth counter state for power management")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Tested-by: Gavin Shan <gshan@redhat.com>
> ---
> Changes since v1:
> Use local variable mbwu_state consistently (Shaopeng)
> Only access ris->mbwu_state when have the mon_sel_lock
> ---
>   drivers/resctrl/mpam_devices.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


