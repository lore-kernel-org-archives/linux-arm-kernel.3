Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD17BCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 04:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NDALMvpxEE5GrrhnGfyySJPUVo6VRGRmsTzB/IQS94=; b=WqQKk7yaXRZ9weUMiPlKo//HM9
	apjOD+b/RehsXZoYSV+kBMnymr/pZM5AfOgyLpnxfkRiqiKD/9AiKky/DXZOPg5z+CJhNDxbjIG1c
	+xvnq1WfCt/z67xfyN0+WkvCA2drbMRUcpcGc7Vq5gzY9p3hIRjIT7uHzanHf+DiOmpLGPaRx9tfD
	xV+wQmf/Y0nJd5jHsWkONYK1r843O+qdjxgp9vvYAeaf2YhH0a9HctXCXIm/Lz6pEDTNFYAvqpK5n
	DTRT/g+PvGJ0TYDUTdDwSQcGA2ax11U1JhnzLCjIEcbABX99wGDviZf/WF3JwyKPcKe411GAhnv9A
	OoRYp1SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRsr-00000002o1P-1I3Y;
	Mon, 08 Jun 2026 04:46:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWRso-00000002o0w-3GCM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 04:46:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780893999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1NDALMvpxEE5GrrhnGfyySJPUVo6VRGRmsTzB/IQS94=;
	b=E/A6CYroGQxS/SyH4J6EmG+ET19waP/y4xj6CNam2tgbUXnkCOyFxHgFCP10u55u8bk2f4
	DtTrwgKyHB3s7154UNi+bGoJpY+rlRWtCBgfbmLkxcuL2DcwDvGGJwE3rmyCkU9XKNwbmv
	D7A1iIuPRG/6XaZ+x2R332EHqrA9DeI=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-zAPNiCvaNVCdO1kzc0X_2A-1; Mon, 08 Jun 2026 00:46:37 -0400
X-MC-Unique: zAPNiCvaNVCdO1kzc0X_2A-1
X-Mimecast-MFC-AGG-ID: zAPNiCvaNVCdO1kzc0X_2A_1780893996
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0c3315d31so42959295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 21:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780893996; x=1781498796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NDALMvpxEE5GrrhnGfyySJPUVo6VRGRmsTzB/IQS94=;
        b=BlmfMWn54ppDPA/H357+bcRUZCuo7MmGaSy0uLSUhTGN719PW9+m84FLZNw2/gLet0
         q1r0yYmaA6/MfNGVNqNlql35sR5H8RgUD4+u8C9B9EsVYxIgS1Ve+ZpV42bwDbByl07X
         iWWCnMuVmpNhbMhPPIRLQT09W1e1bvkxJRzjTRQ/6RiWyCVfl94ggZqhRYkrS1qaQDgp
         ASwyYf4z/n/97xJ2BNbFTRYDLoupowjif9KD6kqERYtzohg6u8ifdx66MyQzqP60jyM3
         +OHPsZBKyK/Tit4UqQge11nduCOC+z/fz9OGZuQ7MPVg67nc/mZF13MW3DPB8GepFs63
         ITag==
X-Forwarded-Encrypted: i=1; AFNElJ8xlvaeDjFovB5jOpJktCCMxyMTr3YQOeWZ3yXbElD1BfOnS73yNLQ5iSzZWHBNnk2g0A4Ajkb4iFy6Pa1LAnVt@lists.infradead.org
X-Gm-Message-State: AOJu0Yywta7RyaeNSLLALk5240uzWm6rxGjUjoycR2vuhW1p/cyTn/fY
	B6SdN4TEf6oYKIQe0/P5i3861/XPQmRrpeeNaqYJ/WKZcdV/VThzvwWx6S3NJyMTq04ilHSVO2F
	s0nPIabpgYjSQA7xkxWWAptqcnh1M8+GLugvt/0bPgnryV/CaAbQZlBm5afwCNDzLav7JzvUrOd
	Se
X-Gm-Gg: Acq92OHgSTJGKLFXyF8VaCTGhhVZ4rRKlP6BDH0y/49KFYpvq0Qin3bl+1cDiI84wvS
	4xp+PhP+BXGnl8zPQOFFt8AeWr3FTVD0lERKacshE82eELGNusSXoF33tKgSQUmY7YtUjYiGQ1J
	NicIgxpYQjAB9gXzdMp7hX06hGg6nCo559KXOoeHgpLik0U4JcHV/reKzKc7rTz/u8czG76x4lR
	QROMfvpblD5iLsbRS1IqvdvfNvbxEFwYCRd27pZTOMyG+ggXqn2tqk7s7BUKDR7ANzLUfJu0eSx
	B/+7jO88RNmUtDxXlmgmiGR4xyoPH5Lqr0qvaLtXLy6QNFK62jyqJZGyUdg2RyPbgUcZm+yOean
	ON+kmaWG+KuC2EJjNDWV90md0CdSIET1RfKtdit+DUcTo9B30cOmzIBu8sd3K1sTuVh4NJTc4k/
	w=
X-Received: by 2002:a17:902:ced1:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c1e7e5267emr153260775ad.15.1780893996231;
        Sun, 07 Jun 2026 21:46:36 -0700 (PDT)
X-Received: by 2002:a17:902:ced1:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2c1e7e5267emr153260415ad.15.1780893995744;
        Sun, 07 Jun 2026 21:46:35 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6cea3sm161971445ad.7.2026.06.07.21.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 21:46:34 -0700 (PDT)
Message-ID: <1a9e10ef-266e-43c7-8722-eb61a1af1565@redhat.com>
Date: Mon, 8 Jun 2026 14:46:28 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: Fix MPAMCFG_MBW_PBM register setting
To: Fenghua Yu <fenghuay@nvidia.com>, Ben Horgan <ben.horgan@arm.com>,
 James Morse <james.morse@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Shaopeng Tan <tan.shaopeng@fujitsu.com>,
 Jesse Chick <jessechick@os.amperecomputing.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matt Ochs <mochs@nvidia.com>
References: <20260607050925.252475-1-fenghuay@nvidia.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260607050925.252475-1-fenghuay@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rsscq00xF9uaWaBZMBF5Jb06GuXFdvjkBMRuA4JISe0_1780893996
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_214642_913421_9010D649 
X-CRM114-Status: GOOD (  21.28  )
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

Hi Fenghua,

On 6/7/26 3:09 PM, Fenghua Yu wrote:
> MPAMCFG_MBW_PBM is written from cfg if cfg has the MBW partition feature.
> It is reset when cfg does not have the MBW partition feature.
> 
> But the register handling is reversed. This may cause an incorrect
> register setting. For example, during an MPAM reset, reset_cfg is
> empty (no MBW partition feature set), and cfg->mbw_pbm is 0. Instead of
> resetting MPAMCFG_MBW_PBM to all 1's, the current logic will set it to
> cfg->mbw_pbm, which is 0.
> 
> Fix the issue by swapping the if/else branches.
> 
> Fixes: a1cb6577f575 ("arm_mpam: Reset when feature configuration bit unset")
> Reported-by: Matt Ochs <mochs@nvidia.com>
> Signed-off-by: Fenghua Yu <fenghuay@nvidia.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

The fix itself looks reasonable to me, but two questions below.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 4b93e89c2678..d8b0383cee92 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -1570,9 +1570,9 @@ static void mpam_reprogram_ris_partid(struct mpam_msc_ris *ris, u16 partid,
>   
>   	if (mpam_has_feature(mpam_feat_mbw_part, rprops)) {
>   		if (mpam_has_feature(mpam_feat_mbw_part, cfg))
> -			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
> -		else
>   			mpam_write_partsel_reg(msc, MBW_PBM, cfg->mbw_pbm);
> +		else
> +			mpam_reset_msc_bitmap(msc, MPAMCFG_MBW_PBM, rprops->mbw_pbm_bits);
>   	}
>   
>   	if (mpam_has_feature(mpam_feat_mbw_min, rprops)) {

Which machine or system where mpam_feat_mbw_part is set on RIS? As I can
remember, this feature isn't available on grace-hopper.

Besides, I don't think this feature is well handled at present because
mpam_config::mbw_pbm is only 32-bits in length, which doesn't match with
the maximal length of the bit map (4096) as documented in the spec.

Thanks,
Gavin


