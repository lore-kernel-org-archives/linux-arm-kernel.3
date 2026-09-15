Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C250CC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=; b=VFpAa4R1fMbTOaxhBRULAPhFLI
	Jzo7FqhiK/4jPgBwSUn6Sk0z2DcOZRfhlOlRpGqb+Xpgfj+10sgQpGKBD7RaA71+V6DSgVO4WwT46
	YnlXMRiOmFxL0Bidn03XaBH9vAoFvy5wZmkLvP3bOH/1cyqvRXOYErJ9QyVoHm3EIP2wCOx+5t2zs
	JUHJ1w0MV5KEE264fGkvpBhbrIAcg5NJTs5HRHyvY9CSYGGKXAHQggmhNLFggmij3hGpBgzxlsnQg
	MLO48gXkgf+3Q8gSopf2XLJsgMRjlc3lhOGwKOAH+5Xk8TvxHPABGYlAsGpCICKHykJLwRsSoHp6c
	QdFPZXsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sbh-00000006bTd-1ZiB;
	Tue, 15 Sep 2026 12:49:53 +0000
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Sbd-00000006bRr-0Cdb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:49:51 +0000
Received: by mail-pj2-x01.google.com with SMTP id d9443c01a7336-2dae660f31bso31695225ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476587; x=1790081387; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=M3ywVOe+TADQyZY+fVMlixNJFD0+M6ZssEjauOFGcytYu/Ve0wNxH8o2cnQbgVd6+h
         VeGSpUzBAcCP/Kp01nHBfEhoQ4SvtrolE7Z7kHf2Uw8vRu8NdMfQGnDh+jyGZ2qC6moj
         y8aMSKq+ZiBHS2R1vLRAeqiPnFfIP5PB3OHRNeo5N3dBAsJb4FgtKFziqlZDfnMJJpJS
         Wy03UbrfPUkj/ZegypepypCXToggrkg676Yl6uNCqgJ+cKpUpeU8X+dHhee+zzgFPvAo
         3ZrNKIhWUKD7DQKHu6SJQCEzhk2dYUOgTxtWkj24Ov1UADRxO/EfmNMqFE03JLFN7Sfs
         NiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476587; x=1790081387;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mP8qopDle1Sc4k8F6w5GND/XUp1RUEWcrZG95tdjUPs=;
        b=1/E45daQhcsVfD4+CkYvK3NTgf/eDoT9CDXUy1/EqosQvkKfrvPGG3q6qS3vUljCIx
         FZMdbD1T5P+jMmDGbfmcI5qIifRltoz62AyL4LjHab3pykcsrcJ2KxbbilRPLZGxOjXO
         VmPO1navKFdmLGB5UFydis+8DnBxinvmOc+mciv19/kyZluTV9uXkrgo4jQKbPBJf2Tl
         krWSL785Rrf3j/uiWaPil5sJTPYgUtuAHncwfsv9SNE4opQNsWckEDVphh2quFkcpdic
         S06AVb0KabpWLic76HDNwexxwwTWciRxrTPxLMJot8qloEQ7IvDsqOns9TsUHGUf4+qC
         Ll9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNLvKdnQqrmw1FlHmvc7aR4cRov5cArP3A6+Dg/WbpgeDF7ewlbEh4Cm1HmSvXwvin4pTnSX8z0AKouAEg2tps@lists.infradead.org
X-Gm-Message-State: AFuF++m/RvncH7LUmXz1mVvn5r3PE5HixDgB2DwboQCbCq6kXNADjEze
	Tbb37oZCu9yPzabSy8MRfCkZCyBC4rCE5n1ClLG1lY2Xii4kARylkuVh
X-Gm-Gg: AYBFou3adwFJs0LfPoXesqKdkGxMVA3KySN/zDchuQDkh2zzvlSEDLMfXczPiYy9jpT
	HP4csX0j8iMi4adl8jsB2hpYmCN4SaqksTchrZONxDsw1epn8pRxWk6CGxZ1haNMM9UiwwLVmoW
	j4sYnNx+3b79GsJ9EX/+WNgTObxOELDvmIes9QBEbM8jJBL+8x3pTh2F55R7cN0/4i1BBUZRQvK
	Tvj1uVG36i790bpqRuOYVZGz0XUwv+e9w91ewucRT86J602kGI5Fm90l5Oo9bYVvu0Id860O4Sp
	mhcsCi3tQ8dEgnIx5h00IMZLhrtkdQWfjbkTkBXrsp2qAjnV+YSUyL5Zj+j6/bXZgChIyTEtw/5
	4R5PbrOxkbIvNGzDzFSPdEHUVyKAP3YVMwbcPGY2LY3+mrUFOz2tl1blZ9GOcAQcYgG+k3dfnyn
	k7JimNTKLK9CUQ5hesZhkcGprdBclIb4qxFG4k83R2Tp2PZPWttMEknK2WGJ+GoU7KSs4HIDLwI
	0JeHAo=
X-Received: by 2002:a17:903:1a0b:b0:2d8:d4cc:be64 with SMTP id d9443c01a7336-2dd6c7134b4mr167097285ad.17.1789476587316;
        Tue, 15 Sep 2026 05:49:47 -0700 (PDT)
Received: from [10.125.112.20] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd6f8ebbdfsm26424855ad.38.2026.09.15.05.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:49:46 -0700 (PDT)
Message-ID: <86a09d26-2de8-4590-b135-31564e2c7049@gmail.com>
Date: Tue, 15 Sep 2026 20:49:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/10] mm: memblock: add missing HugeTLB flag name
To: Mike Rapoport <rppt@kernel.org>
Cc: catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
 robh@kernel.org, saravanak@kernel.org, akpm@linux-foundation.org,
 baoquan.he@linux.dev, pasha.tatashin@soleen.com, pratyush@kernel.org,
 m.szyprowski@samsung.com, mark.rutland@arm.com, kernel@xen0n.name,
 alex@ghiti.fr, hpa@zytor.com, ruirui.yang@linux.dev, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, kexec@lists.infradead.org, linux-mm@kvack.org,
 iommu@lists.linux.dev
References: <20260902073116.802752-1-chenwandun1@gmail.com>
 <20260902073116.802752-2-chenwandun1@gmail.com>
 <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Language: en-US
From: Wandun <chenwandun1@gmail.com>
In-Reply-To: <178936321614.3691424.10386784926753862087.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_054949_102687_7E286AC1 
X-CRM114-Status: GOOD (  11.81  )
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



On 9/14/26 13:20, Mike Rapoport wrote:
> Hi,
> 
>> Commit 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work
>> with KHO") added MEMBLOCK_RSRV_HUGETLB but did not add the corresponding
>> entry to flagname[]. As a result, memblock debugfs cannot report the
>> flag by name.
>>
>> Add the missing RSV_HUGETLB entry.
>>
>> Fixes: 7d163a75f821 ("memblock: make HugeTLB bootmem allocation work with KHO")
>> Signed-off-by: Meijing Zhao <zhaomeijing@lixiang.com>
>> Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
>> Link: https://lore.kernel.org/lkml/20260821020910.3428585-2-zhaomeijing100@gmail.com/
> 
> Can you please send this as a separate patch, I'll pick it to the
> memblock tree.

A separate patch has been sent.
https://lore.kernel.org/lkml/20260915124641.2498280-1-chenwandun1@gmail.com/

Best regards,
Wandun
> 


