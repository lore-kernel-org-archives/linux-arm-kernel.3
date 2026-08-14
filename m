Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B140DC5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 12:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+bad5oyeWP0/0ZF4aAZkwQilG4UExN8XIo8ZjKwl5Y=; b=ltVR6dAOSnBQk8uOaN9K8HwiQa
	gl+4b7VX3+LFrrRCru8Z3VquZ8dKtDhGwqwCNj0VWIKamWxBg5L3gdLSFg47hfIrR86J2kEHE7qmR
	6BJhI3TMv0FY4OO+pxisAuNeeqvr46svSZ4gbZrh/jAKxL9Qksf+ErgIvBf0pldkIASW765PEeBp7
	4FRrqB2a2/F92y6+MIuJPgCkzpuj25CyRrq4gosozbRaUR4EJVE3nFKXx8ZPbhFzRZ69IvfJmb9F6
	PAXCJCuMN7/zgp/cwvEj+psffRd3H6t4eaiMaA88K3xap/gOYTxOZBSKzNpoX9PvvQqX6Iwaa3Kpw
	6A/Xbldg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurB2-00000002f36-12u4;
	Fri, 14 Aug 2026 12:38:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wurAz-00000002f2d-1JyL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 12:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786711099;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z+bad5oyeWP0/0ZF4aAZkwQilG4UExN8XIo8ZjKwl5Y=;
	b=C0Eu2TbGQ2WaDn7hUNWM6VjteePfTHgWyVENsUQrFJnnRbxL45oeAjbjUUKBO/2ZpU1yNe
	PsdIwaRZ8bG8lrTW0eu0DQIbdVv3GIUKEkMYu3B4U0Mb/KIJr7C6xyR9SfJcDFIN04z8vq
	/jr5O+C2XgJJ6pwnlQ/hf4F6KjcT1ZI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-So-emCqJNx-jt5pE3mY47w-1; Fri, 14 Aug 2026 08:36:46 -0400
X-MC-Unique: So-emCqJNx-jt5pE3mY47w-1
X-Mimecast-MFC-AGG-ID: So-emCqJNx-jt5pE3mY47w_1786711005
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4954c2d4081so8732435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 05:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711005; x=1787315805;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+bad5oyeWP0/0ZF4aAZkwQilG4UExN8XIo8ZjKwl5Y=;
        b=lDTyIK6x70O7N1d003VhCNxK1WNsstTnbmHxdegqnBrz/4bU4UDAIoDsebLBHpoaYS
         GpwUR8spGucjJl3ZGZ9lY4Z7uyCsBlM+yPWqVsjr1P2+6978NP3YslWJL38e4bXiflyC
         pkjUJ4PW9M2TRBXyxiGtBPvoqWxWpTnLvSEra0WEJrODmPZR1SJvP8/WGcbVFyn2lCJ8
         gBeAN3Un5N7KDf4w3Eq2grCRVUgRgEZvnMQH8w1QPMUufbA69isPWE6dVUV5qdm8IlWD
         RM6UO3msrvv8QbqF29QmWaF+AGv/HKdvREMCEN8IqB9TmHm4w8v6GZK3trN0fU6dkcyU
         aHzA==
X-Forwarded-Encrypted: i=1; AHgh+RpONjCd+fVGcLs/0tC3dJdgEBBvvhJfCH0wpMONv5LslTf0XbfoEIYEfGvS8eWayCc/yBxLy6s08xJkJoHfk6s7@lists.infradead.org
X-Gm-Message-State: AOJu0YzwDXeVNwINtzzGfc+XfxabE5KIOAu5Io2wafkYE/aDC/sFnJ+8
	bC1cw8SnnNQH9No0uTEv3vJwjU4fu3FARBBXFOplqaCUIWsF7QRhoQ7WqnjhugzSvy7wLA6/Cmo
	il754whXw0FTWIWPyzgjz5e2E1jryK7aqC2USObNYW3HwqlcpNIhJOzIuUO9A1obNsYkp0TXvfm
	/bO9PYbn7t
X-Gm-Gg: AR+sD13LbKBHcpAgU8aYUHDsaiDQx2KuJ11scN31CN8xqyQq9jwiC/tlL0iw28sW1DG
	cwFbaFi668yFbtrKPwO7h/Bu9IP8OUuVDiPyWLf+ac6HBbWlTnb91QlQ8N8xKNAD4qflviCDqb/
	K+pXlKBF9CB/yH205x+A3BtPmVbBhd3Etj8IcF3I7MZDM85iRk3tAfGvn0KaPiYuPwfnmypTI2v
	CAEn3UC5pnYt+xXeffdPLGC8+0Ztuac/gnxPTP7fbboaC7agV9w2N/ULln0VK0/5GlbKyuHlw4C
	SlI6iROSGf2DcAUbxPpnomn6nRwsFlSF8/aGeED6R+dNlWRBIiOZJlTKsFG73fYp9kFuA6MsB5j
	yWkdBy9wixbkg4IY0qLLEER7Y8gWpYDYHLGVFDYzL+8U=
X-Received: by 2002:a05:600c:3e15:b0:498:ee7:e407 with SMTP id 5b1f17b1804b1-49987999622mr78582885e9.17.1786711005067;
        Fri, 14 Aug 2026 05:36:45 -0700 (PDT)
X-Received: by 2002:a05:600c:3e15:b0:498:ee7:e407 with SMTP id 5b1f17b1804b1-49987999622mr78582165e9.17.1786711004715;
        Fri, 14 Aug 2026 05:36:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49989ae96c1sm25906085e9.12.2026.08.14.05.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 05:36:44 -0700 (PDT)
Message-ID: <0ce5e496-a067-48fd-80d2-94fe9981d505@redhat.com>
Date: Fri, 14 Aug 2026 14:36:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] KVM: arm64: vgic-its: Don't dereference a NULL
 collection on ITT save
To: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>
Cc: Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807104102.2410744-1-fuad.tabba@linux.dev>
 <20260807104102.2410744-2-fuad.tabba@linux.dev>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260807104102.2410744-2-fuad.tabba@linux.dev>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h5T2WCLTEkrulk1LnfhHxJDd-6eD35WMgpaUAsBzGwM_1786711005
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_053821_439638_0F77E004 
X-CRM114-Status: GOOD (  21.64  )
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

Hi Fuad,

On 8/7/26 12:40 PM, Fuad Tabba wrote:
> MAPC with V=0 drops ite->collection but leaves the ITE on the device's
> ITT list, and vgic_its_save_ite() dereferences it unconditionally. A
> guest that issues MAPD, MAPTI and then MAPC(V=0) therefore oopses the
> host when the VMM issues KVM_DEV_ARM_ITS_SAVE_TABLES to migrate it.
Thank you for fixing this bug!
> That sequence is UNPREDICTABLE per the architecture, but KVM already
> handles the resulting state in the translate, MOVI and DISCARD paths.
Maybe: "its_is_collection_mapped() already checks the collection is non
null in translate, movi and discard"
> 
> Save a zeroed entry, which vgic_its_restore_ite() reads back as
> invalid. Skipping the ITE instead would leave the ITT slot holding
> whatever is in guest memory, and restore rejects an entry naming a
> collection the restored collection table does not have.
> 
> Fixes: eff484e0298da ("KVM: arm64: vgic-its: ITT save and restore")
> Cc: stable@vger.kernel.org
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> ---
>  arch/arm64/kvm/vgic/vgic-its.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
> index 36ab3e4929154..ed281fbf008b9 100644
> --- a/arch/arm64/kvm/vgic/vgic-its.c
> +++ b/arch/arm64/kvm/vgic/vgic-its.c
> @@ -2119,6 +2119,14 @@ static int vgic_its_save_ite(struct vgic_its *its, struct its_device *dev,
>  	u32 next_offset;
>  	u64 val;
>  
> +	/*
> +	 * MAPC with V=0 keeps the ITEs mapped but drops their collection,
> +	 * and with it the ICID. Save a zeroed entry, which the restore path
> +	 * reads back as invalid.
in

https://lore.kernel.org/all/CA+EHjTymdanCKoQO3ATmUZ=7Ph2wv4ES8SfkSsTgmOYAYBWayQ@mail.gmail.com/

you also mentionned this can also happen on clearing
GITS_BASER<coll>.Valid clear. So maybe don't specifically focus on MAPC
in in the comment.


> +	 */
> +	if (!ite->collection)
> +		return vgic_its_write_entry_lock(its, gpa, 0ULL, ite);
I would rather squash 4/4 here to emphasize we are unlinking that entry
from the scan chain.

Besides I also wonder if we should directly remove those entries from
the &device->itt_head on MAPC and GITS_BASER<coll>.Valid reset.

Thanks

Eric>  	next_offset = compute_next_eventid_offset(&dev->itt_head, ite);
>  	val = ((u64)next_offset << KVM_ITS_ITE_NEXT_SHIFT) |
>  	       ((u64)ite->irq->intid << KVM_ITS_ITE_PINTID_SHIFT) |


