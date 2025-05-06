Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A11C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 12:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KtQkNqGsM537amwwqhIUa++uqwpFX6sC1hurxsMCHI=; b=oRpe6N3Y6KRBxtmLWFXQP4gmuB
	Th+5QFJS8YvTJuerA+ByMfrfftuT5Kt76XZI/iBNT8CRpEq8xEs2028cVcBnt+4MA+bdfLtisapSR
	jTP9tn14v+/yVWNe92p4IxFxZq9Op+9/c9bjRMiXhG+mzoXalG0Vpz0FyCw3sqFPhWHk52orN4PBa
	9vSfHNGJflZVxOnnoagvm4JQ6ri7jcjqd7E6yPXtvv6GJUqd8aLf/j+zq0XIJLCeyZXuOBqS7Kme+
	n+S9B0/njibREli3rNiixhI2xDuVRX0T5hdlurSSlYm+A8zFyNS8K8sglGwcUV2+ZORuc/rLMVlfO
	2IBbjT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCH2V-0000000BqLW-3MP5;
	Tue, 06 May 2025 12:04:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCFDa-0000000BWCN-1CyT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 10:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746526085;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2KtQkNqGsM537amwwqhIUa++uqwpFX6sC1hurxsMCHI=;
	b=fVCYukBZAHcpNHxC5l7aWX7MxV7r3Xaqfu8pedC+lsO3H0/OpjrnAl5l8/gjAw8U2qLuI9
	ePCuOYmoJ5+qi/qWOtI+FzqEraPlzMHJCxxzZV8z0FBZDCPNv9z+r+xPAloQQVyRzT8fWU
	GMFahnY1ok+YbT7zeWqEHFMRRtnEzXg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-1fwD5izBPwCqBe5-ctPqdw-1; Tue, 06 May 2025 06:08:04 -0400
X-MC-Unique: 1fwD5izBPwCqBe5-ctPqdw-1
X-Mimecast-MFC-AGG-ID: 1fwD5izBPwCqBe5-ctPqdw_1746526083
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44059976a1fso23448685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 03:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746526083; x=1747130883;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2KtQkNqGsM537amwwqhIUa++uqwpFX6sC1hurxsMCHI=;
        b=PpYh22kxuym7ef9WK7cgEweYUJ7VKIwgOxxQb7/8G8Ih6IguIMWgcMOn7/4UfdtrCo
         0tiHG+h7HuU2F4Zh3tzl3sOVsxecOQ7tfFbajC+seNQBniYcDMX2n6tdC4q8r4ebllCg
         puU8hZCwgLrhj48L2MzyPE1GAtb8+uxpqcDjTafMtIJXXi7JGipr/Nci/3nObDpkqXKu
         nDaxw+wQLNYfaZ3XnLcsp+J6imYkmufOdCp2ufaxb9J01z3/YOZ/UccovOdSgAVuKAnP
         dRrlMpbzCmHYvfkY/dh3NfgKQ3wJq5jQG/k0x1yofO+zMU/9mafnxI8m2b+yNlixrGOj
         mH+A==
X-Gm-Message-State: AOJu0YzVohj/0cDGed0JBKWXa/swRmxnePn98gwUBQzkxV4vVYYZ/tUk
	1EY8GU/XuU3Nt5DXhhdQJWCQGKxhFzFwpmqBpOe94veZMJ2nCEZYacVDmUgXI+eQ0OPfCwUAGR3
	VFvwvcLT+Fqz3j3NFDO9FMhvO1PjXhkXTmlN+kV8z0hc/NqeM85ACgSxX3qtvkAEju/BLvsTc
X-Gm-Gg: ASbGncspG/DLH3rlzHPsDtUS4/XPIjhN7nilUQXoos/wiEiTQ0QbcSveVEpF/MuCapo
	/Hn7A8/7vXfVKzTc1x3mHIMq5nuqLbUfFWDgEVxnRNVUYFG9bMH2gfYPUe7Sl0Kmx7WJWd4k1Ai
	XjmxgQF8viNBbJ172Eo3DWn/54e0Xl0QU0ONdk5WT/GZJYewz1zUlZnQ8SbE19e2NwbvbDgt9QD
	zeEq2MdYdHOtDvKa8r+GEARJU7FERlLThK5px/QaTsuMvBU54yLTH6nR80vpTmgXBk/nxjUJmfc
	nkN1nhBwHRnRbLWMFNr1nu5pbhLucy7T0YniPuc76ShbpEJ6vWOYMMLOyGc=
X-Received: by 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr153287105e9.4.1746526082871;
        Tue, 06 May 2025 03:08:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhc03MBzoZWgjKorEMXR128n+knjgaDZEvqQTT3kpgSCz4Z047896lj5XIARk7un2ADQgeHA==
X-Received: by 2002:a05:600c:5304:b0:43c:fe15:41e1 with SMTP id 5b1f17b1804b1-441bbea0afbmr153286675e9.4.1746526082521;
        Tue, 06 May 2025 03:08:02 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecb60sm207881215e9.11.2025.05.06.03.07.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 03:08:01 -0700 (PDT)
Message-ID: <19f4f38b-9962-41d6-97b7-e254db3c6dee@redhat.com>
Date: Tue, 6 May 2025 12:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 03/11] net: ti: prueth: Adds PRUETH HW and SW
 configuration
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
 richardcochran@gmail.com, glaroque@baylibre.com, schnelle@linux.ibm.com,
 m-karicheri2@ti.com, s.hauer@pengutronix.de, rdunlap@infradead.org,
 diogo.ivo@siemens.com, basharath@couthit.com, horms@kernel.org,
 jacob.e.keller@intel.com, m-malladi@ti.com, javier.carrasco.cruz@gmail.com,
 afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250503121107.1973888-1-parvathi@couthit.com>
 <20250503121107.1973888-4-parvathi@couthit.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250503121107.1973888-4-parvathi@couthit.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xCdalOFjpbU4wQCSGZKmKyid7sllzc1gw8FAsmtB5zI_1746526083
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_030806_401565_49FBA65A 
X-CRM114-Status: UNSURE (   8.06  )
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

On 5/3/25 2:10 PM, Parvathi Pudi wrote:
> +static int icssm_prueth_emac_config(struct prueth_emac *emac)
> +{
> +	struct prueth *prueth = emac->prueth;
> +
> +	/* PRU needs local shared RAM address for C28 */
> +	u32 sharedramaddr = ICSS_LOCAL_SHARED_RAM;
> +
> +	/* PRU needs real global OCMC address for C30*/
> +	u32 ocmcaddr = (u32)prueth->mem[PRUETH_MEM_OCMC].pa;
> +	void __iomem *dram_base;
> +	void __iomem *mac_addr;
> +	void __iomem *dram;

Minor nit: please respect the reverse christmas tree order above.

/P


