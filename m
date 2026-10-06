Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DF3CA5FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 03:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=; b=u10AaTjm640UFcdrpqdLEBQQck
	jgvr4JYXkXvprTpaCl8ooJ12Az9dwiwkILwqsJOi3uDsPpEzOjwOdH5CCPALKQN6LWnXqP+x6gnjd
	s8c6ZySKo7yZ3vFisQ6ZAHDPV3/RiUR+qNESgJIEsw4CSGTKRZx23+Ms3qhD7gb7qAwWYjb3pXUU7
	eahUq1ZePwK5S5/CrbT6OmuKcf/E/isFH/dZ7UZgYRleKY+xaVK/VWjDywParnkXOmQ+pWtCChMrP
	vmKwPduWFWg4dielX5+wQ98HNGwDDUXZs+DXKlErr9gAQ1uYSlrIkvZ/mwu63Vs8Sa1snoJWYFdYm
	EdYgFXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvhl-0000000HYUB-1SdY;
	Tue, 06 Oct 2026 03:19:01 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvhj-0000000HYTp-0ArX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 03:19:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791256738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
	b=B3dj1H2YF+yiaLeDUWYki+191b0E5W0gXHFwi7EkpwziCO412xZgz/hc1LuUJBBKwxtfId
	Rl6KxSoI097NmWZESsBthGmYyr43yqKi1cDPO9dH4Aqvh0qA4xhUwHYaGWOXl/aoDALfE3
	zvmwIqL0rycsw3nBgqriFt7lndDA2EQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-19-rNyr5DiCNCiQgMg6wXzQPg-1; Mon, 05 Oct 2026 23:18:54 -0400
X-MC-Unique: rNyr5DiCNCiQgMg6wXzQPg-1
X-Mimecast-MFC-AGG-ID: rNyr5DiCNCiQgMg6wXzQPg_1791256733
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2df8484f12cso25260625ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 20:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791256733; x=1791861533;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jMiWdjITXmdV/ikrHHf6jmvGBH/AsJXpXasV0+qQL8=;
        b=nCjOI1vrPNVvo556u6bbQDspXJWdiyLf2Ly5MNzh8YwywgupWTFTqIuaTsWo8Q5xV4
         yU6CXA4ctQXfSvgXkLvJIRSvCXv3TUk+MpmDZZVISvshPp6i3uZWx1St3fjW5wjFatwL
         Ox9eEe4kDs/KZ7DBPdgWEWIo7OR55MQJ3VuZlKrgwBd4W1Dx2MgzsPUVUtvRznFPukqW
         TULPzijT3czNmVWzdauIAr9DE7MHyS2icbCOqrK4VLQTd5nqNGKRL81fEQMBVe5NIdxM
         aGVaM4YqMsKDg1HTNLPKWaOhTaG4EsNy2qDZPnCdQMmV/OMBxWC2LvpJizRZKS0gqzko
         hsZg==
X-Forwarded-Encrypted: i=1; AKwUvBw7i8eg8WIm4SVCIsgclikOLYmRp+s+P0XT+DJ/JXt67T87Nbgoqkb1jKb/XOg1NzxXV+hzbEvmGuAiBlB2irVL@lists.infradead.org
X-Gm-Message-State: AFq9FYLd0PRd42UyJA4OVhoOQ1Wk7Y4v1sj7fPEIjuZu2C7eAcU8tBg/
	8pw22djUroLehE5KXPFp5y8ULFLo30jPg4thsJ6poUw7M0LBWMrE5tjxNyFPTcpROPMAEbQorHs
	g0ldtEPwpCPlp3II0h5PtAwRqQiWksKhydJpPflnbvXVFLXiE383lZAZJ01VX7QDLZ9jmSUwFNd
	3q
X-Gm-Gg: AYBFou0VkE7/6RBKvY4mLvjJwAflpd+ZopVT0aAQTZ2Wny3FfDXdILjX6cBW3QhTcTL
	f/k4+QHb3+Wy/86gfsiij8283B2J/3xodUo7Fi/iSLCI+kuTuiznjmgGdhpV5l+YLk4BaJmG9tl
	am8N9Mb97CRvdY1Yd/mqvk5FOEjl7x3yWaJdFy52Qeh4oWIANHhBspVB2SO2OVE7Sh07RW8NQ1O
	frJ77cxqH0qxf9tcuvMlzDlA1AnJ2OIWh/jWkehsGYF8/mUhF4A4PsICDg89mdj+yJFfaDa0Isn
	ZP1/PmH3DH3o17V2t6d0L53wdILdUEoa85cT4an7Qgnlf/PmLShaCCYa5bFAstXMZBZBPGRWMFT
	2deBIuC2nZVu/m+NES/Lpo6LZku6ocp/ZJET0YjHiiQ==
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348415ad.66.1791256733321;
        Mon, 05 Oct 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a17:902:c952:b0:2e2:dc54:3148 with SMTP id d9443c01a7336-2e5dcdbe031mr1348145ad.66.1791256732898;
        Mon, 05 Oct 2026 20:18:52 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e5a5ecf461sm15865645ad.53.2026.10.05.20.18.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 20:18:51 -0700 (PDT)
Message-ID: <e556089c-18bf-44c2-8b94-3c558b0398db@redhat.com>
Date: Tue, 6 Oct 2026 13:18:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 17/23] KVM: arm64: CCA: Add bare minimal S2 operations
 for Realm
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com
References: <20261005090754.2140522-1-suzuki.poulose@arm.com>
 <20261005090754.2140522-18-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261005090754.2140522-18-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SJ1XKW2R5uiBZAKOGZRr96gR3mx-Qm0AxYMxgnC-C2g_1791256733
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_201859_183343_BDC13A31 
X-CRM114-Status: GOOD (  13.81  )
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

On 10/5/26 7:07 PM, Suzuki K Poulose wrote:
> Add bare minimal MMU operation hooks for Realms. The mem_abort handling
> is chosen as the default KVM variant. However this cannot be reached for
> Realms yet and we would need real RMI command support to make it fully
> functional. Similarly, unmapping stage2 requires RMI command support.
> Until then reuse follow protected pKVM hook and ignore unmapping.
> This will be addressed in the later series.
> 
> RMM takes care of the TLB flushing as required, when the Stage2 is
> modified. So host doesn't need to do anything explicitly. RMM doesn't
> support access flags for the stage2, even for the shared IPA.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v21:
>   - Reuse no_age_gfn for Realms. Also use no_stage2_unmap_range for
>     now, until we get proper RMI backed driver.
> ---
>   arch/arm64/kvm/mmu.c | 23 +++++++++++++++++++++++
>   1 file changed, 23 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


