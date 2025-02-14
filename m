Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C713C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 16:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rU4kAK02kLzV6QdIIG9KIbvsHX1G28GJXyl8/6kQ9k=; b=dgLPunKoRyyMdMgH4nEd+i2lnF
	JJPclaRiExuenYErISy5QIVXWhrgOnr/ZLzZHNwxRG63NgW2MenINzZCFg1Q5gplEH49hmN4nAQaW
	Eo5EGh6OAu3rudA1+8gmYxFHxuiYcRkC9QTFntezJRibWs0V5iPh9zsn78tha9fQ+F1H5rXQjV8T5
	ZOpco990wy1nQAorg0ZYyjZs+YJABmpWXmIv8KF6X5nnHimC3tOzZHjZGjx9jSBjcnT7NXw7RnMb2
	o7rpasgi0CHhQ+Oup2i1CaINde2mAu+lpK9ag0bQbSqOiDv5MNUUDZEU7KNjWoWAC2C6FPLYq2SO4
	mSTeaA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyJy-0000000FT6e-0lgZ;
	Fri, 14 Feb 2025 16:13:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiyIV-0000000FT1H-3Awd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 16:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739549530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9rU4kAK02kLzV6QdIIG9KIbvsHX1G28GJXyl8/6kQ9k=;
	b=XvJVkzp7bbYcKWE1ny1a3bKTOLV97FvGr0mMP2j29mzKxUiBwK0S2g3MockRgBSidTBKWY
	JLvZfl8exHA9qYgpg95a+r3BODpIuwwDS/Y++1JsajvXROYfCRhZ/1Q7vAVmiPkkdYfsw6
	Ofts5cNWJ3Ijmp16zD6gJeEuPUqKnUw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-6Gt8UbRBOxuFbc1paWeY6w-1; Fri, 14 Feb 2025 11:12:09 -0500
X-MC-Unique: 6Gt8UbRBOxuFbc1paWeY6w-1
X-Mimecast-MFC-AGG-ID: 6Gt8UbRBOxuFbc1paWeY6w_1739549528
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dda790cfbso1854566f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 08:12:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739549528; x=1740154328;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9rU4kAK02kLzV6QdIIG9KIbvsHX1G28GJXyl8/6kQ9k=;
        b=aSl4b7E5OcK9pHNEHdGlMA5Ix0ZBzcDAZ2TzOqZbW2bigS92GkSC3PmT4uQX//inGX
         t8SvdBvHdFZXfe/rDjScAMrYpTfSxzoqbwr2uAzKK34kQnaBK+YlY/1xlXxtmdi0F+Oq
         y9e/7qDdITZO54jPnteOEMLlViq46LBbJNipFoCBOOxqN0EbRgNM+7Km1aGH5c47mmAs
         yMcF+fLPOd/kW41QM5SPHNT/xIqGcPAW75Gp1VXhTrom0SKQpJ+sleVz3aAP5oOVtqYK
         9VHqhSpOj1a/gOyqMZVAIUOjtWcdNWIsRDydLwtiyYhZ/UTxhhtsPs8VTDBqAKkD5YAC
         iF/w==
X-Forwarded-Encrypted: i=1; AJvYcCXY2sSlHkpABTtjwl54H2K5CpcrGh6ARzW+2olvDGTEipnx8+r9cUPfCcbzMT+JA6oFPDJ/TMFCT3QxYnMeBKkU@lists.infradead.org
X-Gm-Message-State: AOJu0YyneDOw7wogBYoJfNgw8KpUqrWX4ZajgZ5tDcGgOmitnqupCa0U
	2k7necuDT8O2rSbl/karBR9/sv1zZZY/5As/gNj8XI973yVzDLWlBw5lQLCs53Ic72DJu6J+WW3
	pkcAJkDv5e8VaIBkghdt1USv7w/so6mQb5YEo32Ux7nY9gfHl/Q4JMmoovQwmuEgf5b3m3ay1
X-Gm-Gg: ASbGncv6PLjJ7M9e4HGWa5tgKuQEnL5djqJf5pDiUQGmjNN9Y6ZUxUUigLtxH/k+gIV
	7F+EVKCMxGtRbgd8m+v+ZUpdqN2CL8IPe51mNTpnS1dLAoYqR7pE+tMHxFc/5f8oRrcQUCMvVvc
	IOJJoAepp0U9Jsnog4rxndXgzB59EqBZpXmrWPJ8h7o32bfaTTa8IXwQ4EhizBbreEvZ2ggj7ke
	HjQxWeuzMFIdNI/KuezC6fLEFkz08N88CcIFJPgrLhlMctuB3/D0nce/46pSZWUxZP33HdauzFI
	7ynfYjzHoxeNHfLjwxNhlzZt/ENwOqOBzt+TErozF8sQ0a7JZina/Q==
X-Received: by 2002:a5d:47c8:0:b0:38d:dbbc:3afd with SMTP id ffacd0b85a97d-38f244da0c2mr13727891f8f.10.1739549526221;
        Fri, 14 Feb 2025 08:12:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEcI2NzAuNSVbBparnUO5fYVfOX53USB+DDuRh2f8jycwPKynNSN38Usb2CLponDOD4RENz1w==
X-Received: by 2002:a5d:47c8:0:b0:38d:dbbc:3afd with SMTP id ffacd0b85a97d-38f244da0c2mr13727588f8f.10.1739549524323;
        Fri, 14 Feb 2025 08:12:04 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbbdsm5022784f8f.37.2025.02.14.08.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 08:12:03 -0800 (PST)
Date: Fri, 14 Feb 2025 17:12:02 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v7 4/5] smccc/kvm_guest: Enable errata based on implementation
 CPUs
In-Reply-To: <20250214151343.61348-5-shameerali.kolothum.thodi@huawei.com>
Message-ID: <10831a79-a21f-dc40-a374-81b300d26dac@redhat.com>
References: <20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com> <20250214151343.61348-5-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3hgHRVWfroOL9oWZnGPeLG10s3K7EX6673YzhvkPI9I_1739549528
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_081211_875584_00806814 
X-CRM114-Status: UNSURE (   7.43  )
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

On Fri, 14 Feb 2025, Shameer Kolothum wrote:
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -14,6 +14,9 @@
> #include <asm/kvm_asm.h>
> #include <asm/smp_plat.h>
>
> +u32 target_impl_cpu_num;
> +struct target_impl_cpu *target_impl_cpus;

These should be exported (for configs using
CONFIG_CORESIGHT_SOURCE_ETM4X=m)

Sebastian


