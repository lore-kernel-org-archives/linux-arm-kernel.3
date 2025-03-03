Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FFD9C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 06:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+ANXerGfs05Qx5JuBBnd1YtOYkq281duKe5pNwiLBs=; b=wiE6fU4m5ekBzg0oyKzls3MNeC
	HnvyEgL0o39T1J7FxaOKh+4DotDihq3mWmhDUgzNKa337MCsUdLSQ1eTAfi1VLNTnr563qUgB/SSB
	IJFH8blEkMAJyR/N7rRie4DbmxZFKIRDYLy7F+otu6HKIjuunDuxHm1HiFFVv2H9Sbg/KY503pNnD
	lBv1L9byS507JjlD/Yp/rohalv5j0SwDSYSWcAaCWuFQrRGozJQzjrP7SrrsLaHz5br5D39JTLoGr
	srKuQCbjWzCxBVFLrThqY1XvjnlSIOf5D3wk6FwC4pMM3+Q1BX55iJ1LZZbMCGJbpIKaWJLa4EeTT
	oJwRxmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tozHF-0000000HKiN-0p36;
	Mon, 03 Mar 2025 06:27:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tozFe-0000000HKbj-0iRw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 06:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740983164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N+ANXerGfs05Qx5JuBBnd1YtOYkq281duKe5pNwiLBs=;
	b=BsfwMXdKu8dHDIrwAQBX/YPaEqKRiCIBjv0rwzpVIz5QCn+H6p9flS0jiivcRyJbD9q1I5
	KBrYi5xXlu+NFdf2Ws9zLuO8kdcbsdf6OADOKC9QrqVbLTw1D1uA5MyPuYJg2Zs6l8BPjZ
	kynFTICZUlP0XS4U9RBLsCuT8qQUn3I=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-79-3CgPSq0eP6iNp0rkSHf8pw-1; Mon, 03 Mar 2025 01:25:58 -0500
X-MC-Unique: 3CgPSq0eP6iNp0rkSHf8pw-1
X-Mimecast-MFC-AGG-ID: 3CgPSq0eP6iNp0rkSHf8pw_1740983158
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2234dddbd6fso90789275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 22:25:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740983157; x=1741587957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+ANXerGfs05Qx5JuBBnd1YtOYkq281duKe5pNwiLBs=;
        b=oCea5xr0CrJpXQ3GVwkW8hfXi8fMNtW6e9e29IwuMZfn6hRNbpgUt45VmD40PhMb+n
         JyInRNijpl+eFtv0V+T5dm1rS3gOIMzT/7gZoyCoR7NjmqCdAnLWaOVMPcpZWrMfOX44
         vt4L4o81/7cRqZG/HhHrYF5TUeGW17N758isAazqiwRePvgQNcTc03LHScpg2FBD6zTx
         65m2uqTX6s4U1GagtDia9Xoa/lNFCWT6Vqk4MRXs7nT3BQnlLAbVD6YM+orBG3KrA78U
         DR2lcUwVkvIBKvlHI/CHtzN8I5iNAqim8lg+bU1xdGBU75z/Q0XNF4y7j51EPG1svXP6
         TpaA==
X-Forwarded-Encrypted: i=1; AJvYcCXb1GFkH4ZsG+YUvA60PPZrLFXYcXB/OxDQXIuwWMcFVMAsaS2dbjwmFFbfMEMt4/+WZwmoP5y+DDBQrqIDt9fC@lists.infradead.org
X-Gm-Message-State: AOJu0YyoQhOO/LsT8+JgGu6AUj4iLiLytrbbPbF20ZRmJvGLKGVq4JDr
	zdyMYtidhjVh7wePYXeV3SuxAYerb3TpcOnso1DeO2PaHpnDjb9ozC1bItBszTBFQ84N3LLd0LK
	cVo5zMhzx2AN7dfESe7hCvdf/Ze4RVACME1emshatLHXka5ZDUW0YRl5hFU3EteUyvVsi7zbG
X-Gm-Gg: ASbGncub7jr1HhOvcm9/hlqEfiwaYEa+Pxr/8U7Y8kZDbzh1hse4iuLFTcwVbcOshQB
	Gz2MasUEHUK/g5AM6QMTLpQBWCPhGN6kN/ROmPwFQQLciQRSdmrlB+HSTv2QFm/6Ej8ezaZ37VY
	k1Uz7cqj6g2aMzeah5nFGkQ1WQFNvDxkEHXBrQ0kNA1/hlvzHA3qs1OkHJ1ECZeWmk1ix5BAN6M
	QYF1zok0A9LD6Dg2e+00W9lFfyLxmdktdCr96VQuY5cLeWFC1RoYN3/iDVFVIPZopQu0gAaRmhm
	a3sf3eTBCoeTiYAzdA==
X-Received: by 2002:a17:902:e5cf:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2234a4891c5mr239752295ad.14.1740983157570;
        Sun, 02 Mar 2025 22:25:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFpXtcArHUqT2hI5ax8evJjGCyGJEtPHCAmH1OVzs9dnw0tbzauezRsGnlG5Grz1mEDveiZtg==
X-Received: by 2002:a17:902:e5cf:b0:220:ff82:1c60 with SMTP id d9443c01a7336-2234a4891c5mr239752075ad.14.1740983157279;
        Sun, 02 Mar 2025 22:25:57 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c59e1sm70112765ad.158.2025.03.02.22.25.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 22:25:56 -0800 (PST)
Message-ID: <e432ee67-6afb-40c8-9542-48770834ee40@redhat.com>
Date: Mon, 3 Mar 2025 16:25:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/45] arm64: RME: RTT tear down
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-12-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-12-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eFbkUWxOToOuuF0eaRQ4bXq0GNtTKnKyuCHXJAONEiQ_1740983158
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_222606_287833_5C00B0DC 
X-CRM114-Status: GOOD (  17.10  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> The RMM owns the stage 2 page tables for a realm, and KVM must request
> that the RMM creates/destroys entries as necessary. The physical pages
> to store the page tables are delegated to the realm as required, and can
> be undelegated when no longer used.
> 
> Creating new RTTs is the easy part, tearing down is a little more
> tricky. The result of realm_rtt_destroy() can be used to effectively
> walk the tree and destroy the entries (undelegating pages that were
> given to the realm).
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v6:
>   * Move rme_rtt_level_mapsize() and supporting defines from kvm_rme.h
>     into rme.c as they are only used in that file.
> Changes since v5:
>   * Rename some RME_xxx defines to do with page sizes as RMM_xxx - they are
>     a property of the RMM specification not the RME architecture.
> Changes since v2:
>   * Moved {alloc,free}_delegated_page() and ensure_spare_page() to a
>     later patch when they are actually used.
>   * Some simplifications now rmi_xxx() functions allow NULL as an output
>     parameter.
>   * Improved comments and code layout.
> ---
>   arch/arm64/include/asm/kvm_rme.h |   7 ++
>   arch/arm64/kvm/mmu.c             |   6 +-
>   arch/arm64/kvm/rme.c             | 128 +++++++++++++++++++++++++++++++
>   3 files changed, 138 insertions(+), 3 deletions(-)

Reviewed-by: Gavin Shan <gshan@redhat.com>


