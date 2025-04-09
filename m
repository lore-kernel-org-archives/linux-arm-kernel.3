Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C756C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 04:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSI3UNKYofTp543q1/Qr6IAWFz5MtsY1nglzBATd4M4=; b=scistyvAbAPsS6Fzkl3YtzOyBz
	6BZRQNcieCk3WOaJaUsx7BK3p/ebbslWRsNr/mkvdGCVM8Er6TbOs8CL6AtwFunrIpqF/ALaqyr1R
	1Ti1wnPK64hBKGQvO65gOpgyQI3GODPR6pDcK8QO/wylaA3TLoLoUeZdRf3re7D1oLl0vMrqt8MEl
	L2yKcfhOu7Nv4sJwUNaMhb9f9GKWQgWD0tMGZW91b062Y2lV7U6ca8/2eZdcymmhJs2urs8bOCbA/
	js6a2/UogC/GzBvdiBZNszZcnDeg11elws6SHHaQeM5GbMHBEHpi+KFVPUp6qqe8Aj6y1QZv6wuLX
	OgnIKtBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Mmy-000000064Pm-3yzB;
	Wed, 09 Apr 2025 04:11:48 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2MlC-000000064J2-2obJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 04:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744171797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mSI3UNKYofTp543q1/Qr6IAWFz5MtsY1nglzBATd4M4=;
	b=JaN4Ti/wuIMV2O6LrniomctCa+cmsNzXFpD/3piWJP1uTRGuITEhexjN8EG+JXks5A5qIj
	nT87/wU1wWWWMrs4nNSHj3X+UQqd2lFOPeUe/ZLpxVKI6WAEXnV8A3tHHWRP8sgtZu/qnq
	lWFvE/+nlTDzF3vdPGUTAwJoU88TfHc=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-P5EIm_IeM3O2lMUA_Baixg-1; Wed, 09 Apr 2025 00:09:55 -0400
X-MC-Unique: P5EIm_IeM3O2lMUA_Baixg-1
X-Mimecast-MFC-AGG-ID: P5EIm_IeM3O2lMUA_Baixg_1744171794
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-224347aef79so87291715ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 21:09:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744171794; x=1744776594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mSI3UNKYofTp543q1/Qr6IAWFz5MtsY1nglzBATd4M4=;
        b=sLx3AeMaVhIuaVgAehi0omh+4ZEiS8YZZrun05hOI0t4PZtU1T8HzhIQeag/9IizCd
         0igbT+50N11KcdAxFXXhBeW223m0kz9vUm5LYPY6c17J2TDWDJUQvNt05/VBx/B6mTss
         QR5Yt+kslu9eMCIi0B9dGpPaUIA3Qoke6lkFvstk6a+P6bKsxbem2xzpltwR/5jvAx51
         TR9Ksas7XQhf5OIPF/4oy1JYerE4qQ2PO4vJ+TBNsQrcNa/LA75IVcsrZ0uMf2Lfizxh
         7QgnoGQ5hgJZpziUTX7iGjpJaSb+yXJnGFgpWgAis4O2DcJuj+WIPgTt43CPFpiMCre7
         RAhg==
X-Gm-Message-State: AOJu0YzcP7zgtnOlwho9tcl9JKmteFyYxrDjIdfV7zqFDZUnG580ToOB
	6LEO5KW4XGDHYRL+/eSm66EbAqfqRCIU51XdgofM5gohxx+eMM8kPjxhb0b6VkYAU7UWuYSbk+w
	A+UZnDKp1cOKG/a7q01BTAPHsYjn8RDlyRQjyzwZgfMCw71i7mWqDtSMQ4ZiERNGGN9GdGnAQ
X-Gm-Gg: ASbGncurhQ+A4HE6ze+s0wCOeiEsrpBnuocVuxBdy7sr2AjHeOweJz3dQSABrLk8N7L
	0g327iWq8pH2+WDL0X/NivSotSoaOIoNiBru3WTUwYVGyD3AWJ0vliGiOkUfY+weizGmk9XaiN3
	Cv4TkTfdp5TJxRtSv+LrTr1F3zM9FWmo1nZLckUfFqqpm5MnP8+dTNAIBtC4uVadLOv4AHIPkL3
	OdrAPlK17JANdI7cCd6ABeV0fGaJ9F+xgMsItz8VtZrmKTGiWF7fOmpmQMGarqYvZJEPFedbU/E
	a4Q8XRRwuu4V9RLt
X-Received: by 2002:a17:902:fc50:b0:223:397f:46be with SMTP id d9443c01a7336-22ac2c27a77mr26295035ad.47.1744171794387;
        Tue, 08 Apr 2025 21:09:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmv6DnXKtojfENv0odMP0dosLKhvs41f17wSDjBrU54GG/MO60a3AtYyuTyksYyTBRpOZlUQ==
X-Received: by 2002:a17:902:fc50:b0:223:397f:46be with SMTP id d9443c01a7336-22ac2c27a77mr26294775ad.47.1744171794048;
        Tue, 08 Apr 2025 21:09:54 -0700 (PDT)
Received: from [192.168.68.55] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb344sm1556945ad.216.2025.04.08.21.09.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 21:09:53 -0700 (PDT)
Message-ID: <34a4bf01-6324-482b-a011-32974d68e02f@redhat.com>
Date: Wed, 9 Apr 2025 14:09:48 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] mm/contpte: Optimize loop to reduce redundant
 operations
To: Xavier <xavier_qy@163.com>, dev.jain@arm.com, akpm@linux-foundation.org,
 baohua@kernel.org, ryan.roberts@arm.com, catalin.marinas@arm.com,
 ioworker0@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 will@kernel.org
References: <027cc666-a562-46fa-bca5-1122ea00ec0e@arm.com>
 <20250408085809.2217618-1-xavier_qy@163.com>
 <20250408085809.2217618-2-xavier_qy@163.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250408085809.2217618-2-xavier_qy@163.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 31szoqE9WB1yEz0_19Bt964bak_HLp_yvRV44dtBcVA_1744171794
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_210958_780593_0E85658E 
X-CRM114-Status: GOOD (  22.29  )
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

Hi Xavier,

On 4/8/25 6:58 PM, Xavier wrote:
> This commit optimizes the contpte_ptep_get function by adding early
>   termination logic. It checks if the dirty and young bits of orig_pte
>   are already set and skips redundant bit-setting operations during
>   the loop. This reduces unnecessary iterations and improves performance.
> 
> Signed-off-by: Xavier <xavier_qy@163.com>
> ---
>   arch/arm64/mm/contpte.c | 22 ++++++++++++++++++++--
>   1 file changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> index bcac4f55f9c1..034d153d7d19 100644
> --- a/arch/arm64/mm/contpte.c
> +++ b/arch/arm64/mm/contpte.c
> @@ -152,6 +152,18 @@ void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>   }
>   EXPORT_SYMBOL_GPL(__contpte_try_unfold);
>   

I'm wandering how it can work. More details are given below.

> +#define CHECK_CONTPTE_FLAG(start, ptep, orig_pte, flag) \
> +	do { \
> +		int _start = start; \
> +		pte_t *_ptep = ptep; \
> +		while (_start++ < CONT_PTES) { \
> +			if (pte_##flag(__ptep_get(_ptep++))) { \
> +				orig_pte = pte_mk##flag(orig_pte); \
> +				break; \
> +			} \
> +		} \
> +	} while (0)
> +

CONT_PTES is 16 with the assumption of 4KB base page size. CHECK_CONTPTE_FLAG()
collects the flag for ptep[start, CONT_PTES].

>   pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   {
>   	/*
> @@ -169,11 +181,17 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
>   	for (i = 0; i < CONT_PTES; i++, ptep++) {
>   		pte = __ptep_get(ptep);
>   
> -		if (pte_dirty(pte))
> +		if (pte_dirty(pte)) {
>   			orig_pte = pte_mkdirty(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, young);
> +			break;
> +		}
>   
> -		if (pte_young(pte))
> +		if (pte_young(pte)) {
>   			orig_pte = pte_mkyoung(orig_pte);
> +			CHECK_CONTPTE_FLAG(i, ptep, orig_pte, dirty);
> +			break;
> +		}
>   	}
>   
>   	return orig_pte;

There are two issues as I can see: (1) The loop stops on any dirty or young flag. Another
flag can be missed when one flag is seen. For example, when ptep[0] has both dirty/young
flag, only the dirty flag is collected. (2) CHECK_CONTPTE_FLAG() iterates ptep[i, CONT_PTES],
conflicting to the outer loop, which iterates ptep[0, CONT_PTES].

Besides, I also doubt how much performance can be gained by bailing early on (dirty | young).
However, it's avoided to cross the L1D cache line boundary if possible. With 4KB base page
size, 128 bytes are needed for ptep[CONT_PTES], equal to two cache lines. If we can bail
early with luck, we don't have to step into another cache line. Note that extra checks needs
more CPU cycles.

Thanks,
Gavin


