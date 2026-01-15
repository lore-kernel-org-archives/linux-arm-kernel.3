Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE3BD3CCA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 02:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=blWj7goxRVPsavzwT8Xk5BJGCREI4FlPjxR03xc0PiQ=; b=y6O4nSGHuzOYqa64EYIYV9wD38
	gEMOgef7wTj99Rum/iZNLpGSBvSqwB4kwe8sqnUFyZF/O6CnK5cPX1iPmV6GU37lb95h3E//qjprC
	gse2y1foJacGOh9F/txdp4zw0YGq7pPumqK/z0qydv4rrzBTtwxIY1BzZ1yhg8+Vl8Rs6H20KXxn2
	yjJeAXJQEarBhn3mmcLC9xr4eGwiAZMSD6IB/k4mMtlieQ5IblDD96vTNMNyF2wUVyU/XZ7aVKNLH
	Qc/O3o4hEehFzrJYyXW2PU1r/a4QdAkZFj2hloz3Rbcn+YZPwOfSa+mbOWxSfOWIh4S/Zzlic0t2c
	r3Z52H6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDBJ-0000000BYP7-2FI3;
	Thu, 15 Jan 2026 02:33:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgDBH-0000000BYOU-1WZh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 02:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768444430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=blWj7goxRVPsavzwT8Xk5BJGCREI4FlPjxR03xc0PiQ=;
	b=EQjiJINHr3ZsB5yJwWk+Os1pJ4wFeZWU+c+KFoGgbsmZXSO+mLR7DysFtuFihhsi0Zr4+X
	rz449jOcZCVF4fH+xJnVJUBZ23axk42XRwWP5EYjE9gPG2tmauKOTzTpYd1AQRQ1pjQBCn
	gdAFr5iUecDkVvrXC0X88ODPrcR+86U=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22--u2cbroQOfe0b8FoWMF_3g-1; Wed, 14 Jan 2026 21:33:48 -0500
X-MC-Unique: -u2cbroQOfe0b8FoWMF_3g-1
X-Mimecast-MFC-AGG-ID: -u2cbroQOfe0b8FoWMF_3g_1768444427
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a58c1c74a3so3561635ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 18:33:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768444427; x=1769049227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=blWj7goxRVPsavzwT8Xk5BJGCREI4FlPjxR03xc0PiQ=;
        b=JIIeFtUsM5CjeBHqDbVduZsL2AoOZsh7u90uGao+lhloysojVMYoK+pySozl4u42IT
         h1IL/61beAf57VCeatkzj/BAWUEfHLNDgdIK1aBWtNmzBvjOG+FfndDKSp4QOh2Dr1Z2
         k+kI5ik6QaFZ/xFTd6ifdSwFo+9Ten2PpT0qyaXKBgYUNR0CJGwvKFflgRIgMT0aatvZ
         8V3Wyliqtvucbl8i8aEMV3sDrUOSXLUBpvpAvjwva9uxqhhZYrjisdAZ53l3RAN5WPnV
         YqoHuQxE8hW3+d11VSTbzE58ZbaJlN77AQuKh55jXtUDLt/kkP4c5Qdpdm2KPACCQX57
         9wmg==
X-Forwarded-Encrypted: i=1; AJvYcCXaLDXFmkefk6ZtcNFoQqusKG1io/52RvDWqyQ44t5q4itz/HX78VtzJmhM5RxpsnS6qMuPGWrdsGQAy6IvQa71@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhu9SoRjVEvZs4cldEmlYYw1kXmd5OUx8X9pDMnjjia8E/wyMD
	4qy8rqiCralmQ3LajHbxLAZOG31Xolwze8T/RIH3x3hUxHYG4oyXc2G/+xbRUWqmjIi1/IrtCgg
	I6huyYsuG6FV1pnKgUEVSJ6g7gGSvs+AUIY1oIC8QczmplXNiHfuA8MkBkAcbyKtoknDH4OVClc
	rx
X-Gm-Gg: AY/fxX5zVliBi5ol2IJmlvHAw/x6j9rUV2ztgRCDjSfoUom1ILgZylR07v7craVJbSr
	/25sdffoEwb9EE3I4JMg4qheXX26UevBirNY6RJ++c4Zh2Nz/Sdfqje0obX4zsDmsKqI8Rkj4IL
	PWrkDERz7/i1lTMY3RN2sNhf+tN4p/p/OsIfJRmITF0o85GkBSHFsCWzxaWzdpBQLTJChgNwCgF
	UPc5IYoKTyl4cCFu7dZLe2mLTaAtPXT+izJEi3La/3Wqi0eRG2dQ+YQP2sJbnnXxJqDoHY0LO/I
	giivU4ZASQZERPqYMUyaeWAg3LP8jJvJ9uQPAH9R17dvmvmse69N0EK6nRWCpEUkMaXhOJQxkBn
	xTGzum0nMPU4=
X-Received: by 2002:a17:902:ef09:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a599e3f37emr47430695ad.46.1768444427027;
        Wed, 14 Jan 2026 18:33:47 -0800 (PST)
X-Received: by 2002:a17:902:ef09:b0:2a0:e223:f6e6 with SMTP id d9443c01a7336-2a599e3f37emr47430395ad.46.1768444426637;
        Wed, 14 Jan 2026 18:33:46 -0800 (PST)
Received: from [10.72.112.168] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2fe3sm240569515ad.59.2026.01.14.18.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 18:33:46 -0800 (PST)
Message-ID: <d0b95ff6-6b69-4ee3-a494-a3dd278d1021@redhat.com>
Date: Thu, 15 Jan 2026 10:33:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/47] KVM: arm64: Preserve host MPAM configuration
 when changing traps
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
 joey.gouly@arm.com, suzuki.poulose@arm.com, kvmarm@lists.linux.dev
References: <20260112165914.4086692-1-ben.horgan@arm.com>
 <20260112165914.4086692-5-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260112165914.4086692-5-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9y_BDxlnv4d0CiRoVsOxhPZubR1uz60xXql1K51fBMo_1768444427
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_183351_500477_BA9E9CA1 
X-CRM114-Status: GOOD (  14.11  )
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

On 1/13/26 12:58 AM, Ben Horgan wrote:
> When kvm enables or disables MPAM traps to EL2 it clears all other bits in
> MPAM2_EL2.  Notably, it clears the partition ids (PARTIDs) and performance
> monitoring groups (PMGs). Avoid changing these bits in anticipation of
> adding support for MPAM in the kernel. Otherwise, on a VHE system with the
> host running at EL2 where MPAM2_EL2 and MPAM1_EL1 access the same register,
> any attempt to use MPAM to monitor or partition resources for kernel space
> would be foiled by running a KVM guest. Additionally, MPAM2_EL2.EnMPAMSM is
> always set to 0 which causes MPAMSM_EL1 to always trap. Keep EnMPAMSM set
> to 1 when not in a guest so that the kernel can use MPAMSM_EL1.
> 
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   arch/arm64/kvm/hyp/include/hyp/switch.h | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


