Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC95CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 03:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XTGV/Lpx58Ur4YHkEVEE/DLD/lQA5hgEBF0FsirS0AA=; b=iCZEPu2EOyVdHTcjNnVWh8fpFe
	dBpRvMl6pj/Ndue8UIzEhM3OQlIZ5kx5Fp6wvcvRwIB5pHZo88xJOY/TTa0MtO8hLrijDW2TyWMHq
	J10tjeQ06hganP68kxwm4JfBJAk8VxbBoikPy2rqurilUnU5b4IOR3mfHVfEh6JEFKTqkQ5DM+Day
	kE0HFLLeejJaB484CgXlLiFQzouOmJ91DySn+yBB9gGNL5lFSb+88PX5J4bwY+fWvhx3LWk95P+2/
	MKhk8eVaG2WogVRHQwuIm5GXnBapZqHDmJs4dsBwZKpSU2psNmqcI3lF5ftC6xwAAV6gTQomH4Oda
	QKc/5lJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjI6-0000000A7g8-2ibK;
	Wed, 17 Sep 2025 03:57:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyjI3-0000000A7fi-0eyg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 03:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758081424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTGV/Lpx58Ur4YHkEVEE/DLD/lQA5hgEBF0FsirS0AA=;
	b=Uu6rUACuwbvkMtIjC6u1f+RP3t3MXn20F2OkgcEtSZ4gWnJmL5H6Rj2gOk8YQ277DNHZfJ
	SfwbmotR3rcXP84vfwYXK+HuWiGrR8GJvO1qPRHJz0MN5sHGzilKzYKyXb4avhjbjcy7FJ
	zk3iZGqKiv2egPx1ReN8yP2EaWYB+w0=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-YE_vuCThMVW9-kFLuagTFQ-1; Tue, 16 Sep 2025 23:57:03 -0400
X-MC-Unique: YE_vuCThMVW9-kFLuagTFQ-1
X-Mimecast-MFC-AGG-ID: YE_vuCThMVW9-kFLuagTFQ_1758081422
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77260b29516so11689266b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 20:57:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758081422; x=1758686222;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XTGV/Lpx58Ur4YHkEVEE/DLD/lQA5hgEBF0FsirS0AA=;
        b=W0o1/HvUmr1w0SuRjN1REZvXRBt52Vd6VJ8is9XnNi70MW2Uem5MtSiro+1MsVFsxF
         hjBlusk1m5T/sYC8k1cfZ34TWm4KBZxXNLo2sB1JHpqNQnVDHkcfpr/fhGdnQrAH/5Cl
         Th6lp3/HmHrnkc8Rj0zQINOfKm+4SFL9aYnjMxbCxW4x3ghLz9Pn2YjLl+gnq84Do+Mb
         RU/pP3DKUM5e8q4jmkYfGEtip3ER/CAj8FDjh1MwdvsXgmfBc3PvQYG5+pjbloCjRz5t
         Dn77sfVeX4g3m0w2pJS8sYrV5iBE8GWMhEyilnY55jUZmH/g2qDeGkoDOOYph3OdRhC+
         pLIg==
X-Forwarded-Encrypted: i=1; AJvYcCXNZ2z5ZeMPJwqkT45LFvPrBVqbGkZ8rBiKD6UeQ1D5q3CXXd48DdkPJ/AaA+4cJX2LyhRVZ9LVkDBXY7jb1C2A@lists.infradead.org
X-Gm-Message-State: AOJu0YzvC3DUw3GgWroIoPXJeRaOc9pWME5fFzWubvv45n805deyWupW
	2CTyY93ttKZgH6Kl6tamvY7gFUd2QonVi6yDwfXbYEjkH6y271I3DVq7fomXRpyG7r8CzyhxmYT
	DPkkWJkHHrvyJzPAH3N1sycLKTt24rj2ib36Sto2zIf2wdw+j0s8L5O+QscmNbfCpvthQEHgzw8
	FJ
X-Gm-Gg: ASbGncu4F1Wbr/fPdFLy08s8cC2fNnxBMfGgM6X6YpFP3OIy4FE2x0HwWKPsbHaJfXv
	7vJyxZFsv0mLjEMQRA7g7XPd7dF0nV5+LqjMgsazB1LRh6jDvIRsK8HbNuN4tnUsRLIXLz9ivFT
	SXjCLCEm5e1r3W9e6xwskhKLtprUhH1+06AXigkNPQfcZvGlv1PMOpSAhgv+3Qik2Q6gYI4GycZ
	D8qUhnZc0qomRMlvOYIfgWlJgu0SIKljgkfEon5RLsATQ7Uf1Dzf2HOJax7z7lFrFlbnxQEhq+7
	MKUTgGfvBmqRZt7+TlTxYgJBpxxgcakc1lKnb3I1WGUMUVvF5jy2hOxg5afPb8opCDsEn+ZZRAk
	Cclt2
X-Received: by 2002:a05:6a20:430d:b0:252:f0b6:bde with SMTP id adf61e73a8af0-27aa2e9fe25mr909366637.24.1758081422416;
        Tue, 16 Sep 2025 20:57:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMc2O27tB3E/QqyAooDB3y7jr/wt0/Bey9oUtK/NtFfEn70CrDz7Artb0At8viujU7do8N/g==
X-Received: by 2002:a05:6a20:430d:b0:252:f0b6:bde with SMTP id adf61e73a8af0-27aa2e9fe25mr909353637.24.1758081422069;
        Tue, 16 Sep 2025 20:57:02 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77613e4308csm14709454b3a.73.2025.09.16.20.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 20:57:01 -0700 (PDT)
Message-ID: <4e618201-05dd-46e1-8ca8-3956dc738300@redhat.com>
Date: Wed, 17 Sep 2025 13:56:55 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: acpi: Enable ACPI CCEL support
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
 catalin.marinas@arm.com, will@kernel.org, aneesh.kumar@kernel.org,
 sami.mujawar@arm.com, sudeep.holla@arm.com, steven.price@arm.com
References: <20250908223519.1759020-1-suzuki.poulose@arm.com>
 <20250908223519.1759020-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250908223519.1759020-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5kz5x_jwzgEtK7YYDV5pMFg2bYPK-b8-A3QN8QxVPkQ_1758081422
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_205707_271990_44B28A36 
X-CRM114-Status: GOOD (  10.54  )
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

On 9/9/25 8:35 AM, Suzuki K Poulose wrote:
> Add support for ACPI CCEL by handling the EfiACPIMemoryNVS type memory.
> As per UEFI specifications NVS memory is reserved for Firmware use even
> after exiting boot services. Thus map the region as read-only.
> 
> Cc: Sami Mujawar <sami.mujawar@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v1
>   - Map NVS region as read-only, update comment to clarify that the region
>     is reserved for firmware use.
> 
> ---
>   arch/arm64/kernel/acpi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


