Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC196C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=; b=oUe+zZcd0ciDMW24Vnz6M5Sftz
	h3K3lGrAekxpvMlVjQuyxDX3WuqynYM2Yt9wijiI+fUMZUL+S0C0SZO4CRdjZd2F5ynZx598LJOyk
	PlBUcO3uEFVUmfvMGScgkZKKuuEZulcR0GjUZWwMP+5bDIoEDM3a1jabWBioeKQ/HAR2lgd8v7NJT
	0EDYQgBeS6FGiQghWan44SHv0gzUtj5rhSQCW/RFF8G2jVADTyHF+hAgwrMSe1J3LUA5FiDpK9gG5
	PWARc24r5fXd18zOpImhWzuAJfg8P3O8Z6A9QpLhOl8rJZeBWBqfB9rh7UXMro5LAyeHwcs19dGAo
	ZBL8xvXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zmo-00000002Orn-0OH7;
	Mon, 14 Sep 2026 06:03:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zml-00000002Oqx-0FQv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365802;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
	b=OwD/xBOM2NQKXsHftUTqBP3+3QMbYeQL3+9e8qcuyvPWy+QC+obWoHyrXWpDQZzZKB3ePb
	lXKLl7vSkUVbmMUJ82zAA58nPsHwpK9ytXzPDTPmxDO7jldYMrD0XIn5qGpaqSuyidxxxB
	PJKDcfwPzrMZ+2qQQOD/IhszFcGBxc4=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-C5QrpShDPuWtX99s4TRU2w-1; Mon, 14 Sep 2026 02:03:18 -0400
X-MC-Unique: C5QrpShDPuWtX99s4TRU2w-1
X-Mimecast-MFC-AGG-ID: C5QrpShDPuWtX99s4TRU2w_1789365798
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so4982303b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365798; x=1789970598;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsxFcMrXf8D+H3BBw/ZjDBf99QDmuUAygALVfxwRxo0=;
        b=Y5xdt8LBWeIeVs3jb9VLXQMEj5QKNLELQbE/hKfJYOJODDKrN23O8RUAxukgBfc4Ad
         J7TBCBkigG5mYWLJqUxuGqZJ1cs5zGwlmUqcpL42TmIjda4ndawyIx9TChKCLUgtvU8X
         FjNeZEfw2JgCt6vZSgssRRXSSL+PyXC6Ac3ETWefH57HnilhWLtVOwRYtWVc0M8AKr1d
         ii6urP8GnuCZ8B30y3Nnlw9hoVTpKoLWabZ3kBEBew+mBJOFzF6EMnyICEhVJVdlZrOA
         6l664UY0wvCtjVUHkNmIFYQFOVKY7QAfUq3uZLW+usLGrHHS6lmWf7OymYuog0k+peOv
         ADZw==
X-Forwarded-Encrypted: i=1; AKwUvBxu8x4CNe4GpHx2Ki1GP0Xi9+XONiXkQrukj36QI/wwtug/QjHr8Ig70DIzX+EwapWVpbmXL/jxshqKUcO6/Caq@lists.infradead.org
X-Gm-Message-State: AFuF++l23TCkuP4Jmd1zCWu7CldhmuqjAY0Ijt2s3Fdj4ozx9q2lvACs
	JDvDSmAuOMW3vVvm1S00H+4mc4+c4Nc6xljp/nObgBmykB8AhrAaWNOtP9rHpBEi/taPC/mtk7s
	SbM9J3yuRTqhq19jVHpisTbsRIohM/dMx6oXMPEw1YlkzIeYU9tp3l7jIIb0+dVbO+fQBQWY71k
	FJ
X-Gm-Gg: AYBFou3KclYFiDrXW8oMUJpLNc7eC/UiTIKJPK/r+vxn1yLRoUEcoRZ4XnNDJ96rQ6m
	6YBX/iRQjHDaXh0i8kLRGSoYARZG4f1TbZPSSbCS3dksa+QB43iE6tVcpqVyCvC7f+q4zjDSzI2
	wdzeJHxTh0x0RMAZ3yEZ3dquAifZrLEiXCn9fPUavZFM7GfrzstKtEyfDrKRPa2GlMY5lAn7sSm
	iJaxT78W1tMhFcjs7fvxhCqm31ysuys5/KACtvI67bBZJtp1Xcp8vcSWQnAnU1oJJfsaPxyVd86
	AiR/d2H020lV1x9QPDh97oFDz7zlnQzG+EVZYDwfIXpKeXXN9KrNmkigpWQU6Z9uOwfwImd40sq
	aY0wjt3+I9GaOSQnxcVEvZGjxYcpmZm2HgeUjFuhmlg==
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512982b6e.29.1789365797642;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
X-Received: by 2002:a05:6808:1a1b:b0:4b9:e65b:8c2f with SMTP id 5614622812f47-4c7b47b9d66mr512943b6e.29.1789365797101;
        Sun, 13 Sep 2026 23:03:17 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9b359sm23715686eec.14.2026.09.13.23.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:03:16 -0700 (PDT)
Message-ID: <647592d0-d488-4fae-9deb-ceca00ffe52b@redhat.com>
Date: Mon, 14 Sep 2026 16:03:07 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] fs/resctrl: Factor MBA parse-time conversion to be
 per-arch
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6ojl5lNngi2EF5zeyrQf2IeAlRtHtO-Kcute4qEbM_k_1789365798
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_230323_180834_3B711440 
X-CRM114-Status: GOOD (  17.02  )
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

On 9/12/26 2:36 AM, Ben Horgan wrote:
> From: Dave Martin <dave.martin@arm.com>
> 
> The control value parser for the MB resource currently coerces the memory
> bandwidth percentage value from userspace to be an exact multiple of the
> rdt_resource::resctrl_membw::bw_gran parameter.
> 
> On MPAM systems, this results in somewhat worse-than-worst-case rounding, since
> the bandwidth granularity advertised to resctrl by the MPAM driver is in general
> only an approximation to the actual hardware granularity on these systems, and
> the hardware bandwidth allocation control value is not natively a percentage --
> necessitating a further conversion in the resctrl_arch_update_domains() path,
> regardless of the conversion done at parse time.
> 
> For MPAM and x86 use their custom pre-prepared parse-time conversion,
> resctrl_arch_preconvert_bw(). This will avoid accumulated error from rounding
> the value twice on MPAM systems. For x86 systems there is no functional change.
> 
> Clarify the documentation, but avoid overly exact promises.
> 
> Clamping to bw_min and bw_max still feels generic: leave it in the core code,
> for now.
> 
> [ BH: Split out x86 specific changes ]
> Signed-off-by: Dave Martin <Dave.Martin@arm.com>
> Signed-off-by: Ben Horgan <Ben.Horgan@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since v3:
> Parameter order swap (Reinette)
> Reflow commit message to use 80 characters (Reinette)
> Adjust comment line length (Reinette)
> Add Reinette's R-b
> 
> Changes since v4:
> Make Dave the author as he wrote the patch
> 
> Changes since v5:
> Document that the rounding can be up or down
> ---
>   Documentation/filesystems/resctrl.rst | 17 +++++++++--------
>   fs/resctrl/ctrlmondata.c              |  6 +++---
>   2 files changed, 12 insertions(+), 11 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


