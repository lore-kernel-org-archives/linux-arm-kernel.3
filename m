Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951C0EF36E4
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=; b=eybR+7mQpWB8IY6TQJpd8ny62f
	3VAk8UdyQg6txhh9cism/fZwW4tFr0k+3HMxkpZw88l5N/ohCQc5jSEf8l9AhevRYM7BPDq1b/3ar
	yc09t7pa7g0TXyCRjQ1yQ2me1YHwrY2S4qRFqnctVHauhiyaN3lpTWDuNjnwfvBvHa5oUHoO0YAMb
	oIscZx2wuCJ4q9pVn57KdOV/AWtd62r9XH426CVe+LMHdYexcJ5MN04xU2V8Cl4PQwx9bTP8pIKda
	/KSqHQNRqUvctaXPeMmGpsg4WWz02TKDY5ckCeEEINzFH/DgdLKhS1Tp6GZZy55Q9I7K8wx0E7HEU
	6sBZV7cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUNC-00000006kz1-0SeA;
	Mon, 09 Mar 2026 06:45:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUN8-00000006kxp-0dea
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773038745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=;
	b=hRfAZg0KzfL0hZHIdUgs8HcubyCx+19UhrN6TamvkmC5bS9lzXNWlkpTq4b75AL3KN0us6
	eoQtyh3alijIYm5eUeGRe+ygBMMzjncjbax57D1F0lH//F5Y4Hn0farCTFJza+NiRFrm76
	itvnghQLt4mSDOA8PiWgMxnBXjIyNIQ=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-LvTFLkhaN0OWEzqlfubnHQ-1; Mon, 09 Mar 2026 02:45:43 -0400
X-MC-Unique: LvTFLkhaN0OWEzqlfubnHQ-1
X-Mimecast-MFC-AGG-ID: LvTFLkhaN0OWEzqlfubnHQ_1773038743
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-358e425c261so10109917a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 23:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773038743; x=1773643543;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=30KVmZahPHcWNSCxYdF/dWg9gkm2uvgSkG/Do3sMyq0=;
        b=AutGI2Awes5OSZ32m112/g+BD4ng1FZ2XUbmxRVpgOSuwwlehR6Fbod4ZIu7R8/f3p
         GYvu1VZOAeOQgZLBsrqZP2k6uqY8O4pXaxyJIn/rNBf/14erZX6DkbGMBFqlgZz+Pv/e
         KARKRANMAyAHgB25asnQHCRzP06/Zs4XJUcDfnrFjGI09/TsHntGqBn88qqr+Ku6co2r
         KJUC+geyiex0G4/7KE9/kIQ6Cy4gvtD0hSNIogeQUrNoVaIQLhOadUiO1tz38GQ6pcx5
         I6ZXH0M4gd1VV6JoobBq63GS0gKW/6AyvlJphwfRLBvjRZxFAEXcHa6TsQD4X9qzwjGV
         JLng==
X-Forwarded-Encrypted: i=1; AJvYcCWL+t3c+PwdXHliFYHJ2zCLP3laQemX3XAQ7LAD9jIjTuzODihBqTQtKjC4Up5usIJ9MSbXFV6WHg3FiFp3+AtF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw78iqCNo0gu4qdkARqC5+n/MbbCyt7oi94ax9vGB9/5RLZAvYj
	hZHHYnrNtfIo1Ovia1/L0owIlbI8tH+mQUueLOe4x0MyF+xyFP66Smz863g3bBT6KGTYb2d2U5C
	BF1mT5gpXVfrRlANYTDkFs/scHmYBY3iHN/lUpUQLW/s2mU63XE8514+HRlGHb7wfsw3/jk43Fw
	iW
X-Gm-Gg: ATEYQzy5H+y4mH74yB0OWAqeSguRhFZViUcoBHsmQrQTVDCr2u9pRyOh7jubsI1u4m6
	nI20rWBhtKyBZhCBsaH5Kr0oBOCGlGxy4H5bQSPPIGnTwB4Sa+VkJ6W+XlzuqEY+Nif2vAsuUzl
	0c3lDEr2L6104+uv8bPV0A2WbRanP5dfLiVGE+sm+XOBWZEpWJM6jZdXfzrSQ7/6RhFdu6SA1RM
	ftxyaziksp+ryh2pCE2myG9VeyL82x9r9vkBqyVdx7PSTsln8UmLVIAxI1ythomvo00F0Xx4PXt
	mFFfRR7D3eES3w94sM7GVataXE5cn/8h7iBNUi2HGUa/VriGCNHmr5h7G5vOj73rFfYREwPwY2r
	TfIkirBAUpJapulDKBT1BkJ4NwiFYh1pPypd4ejSVofYqx6OMSFwZ6Dh4h1tcAcmE
X-Received: by 2002:a17:90a:fc45:b0:359:9224:6c26 with SMTP id 98e67ed59e1d1-359be238ec4mr9680064a91.3.1773038742751;
        Sun, 08 Mar 2026 23:45:42 -0700 (PDT)
X-Received: by 2002:a17:90a:fc45:b0:359:9224:6c26 with SMTP id 98e67ed59e1d1-359be238ec4mr9680051a91.3.1773038742409;
        Sun, 08 Mar 2026 23:45:42 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2e0e1aasm16842789a91.15.2026.03.08.23.45.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 23:45:41 -0700 (PDT)
Message-ID: <d4cef1f4-5329-4f0a-a951-7c23716ee78f@redhat.com>
Date: Mon, 9 Mar 2026 16:45:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/41] KVM: arm64: Force guest EL1 to use user-space's
 partid configuration
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
 dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
 fenghuay@nvidia.com, james.morse@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, punit.agrawal@oss.qualcomm.com,
 quic_jiles@quicinc.com, reinette.chatre@intel.com, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 tan.shaopeng@fujitsu.com, xhao@linux.alibaba.com, catalin.marinas@arm.com,
 will@kernel.org, corbet@lwn.net, maz@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev,
 zengheng4@huawei.com, linux-doc@vger.kernel.org,
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
References: <20260224175720.2663924-1-ben.horgan@arm.com>
 <20260224175720.2663924-12-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260224175720.2663924-12-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8sVWveZV9atlipTWvhgAWKUAIZmfK3ovuzDWw3_Weww_1773038743
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234546_272831_7395F3C0 
X-CRM114-Status: GOOD (  15.00  )
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

On 2/25/26 3:56 AM, Ben Horgan wrote:
> From: James Morse <james.morse@arm.com>
> 
> While we trap the guest's attempts to read/write the MPAM control
> registers, the hardware continues to use them. Guest-EL0 uses KVM's
> user-space's configuration, as the value is left in the register, and
> guest-EL1 uses either the host kernel's configuration, or in the case of
> VHE, the UNKNOWN reset value of MPAM1_EL1.
> 
> We want to force the guest-EL1 to use KVM's user-space's MPAM
> configuration. On nVHE rely on MPAM0_EL1 and MPAM1_EL1 always being
> programmed the same and on VHE copy MPAM0_EL1 into the guest's
> MPAM1_EL1. There is no need to restore as this is out of context once TGE
> is set.
> 
> Tested-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Tested-by: Peter Newman <peternewman@google.com>
> Tested-by: Zeng Heng <zengheng4@huawei.com>
> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
> Changes since rfc:
> Drop the unneeded __mpam_guest_load() in nvhre and the MPAM1_EL1 save restore
> Defer EL2 handling until next patch
> 
> Changes since v2:
> Use mask (Oliver)
> 
> Changes since v4:
> Explicitly set the mpam enable bit
> ---
>   arch/arm64/kvm/hyp/vhe/sysreg-sr.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


