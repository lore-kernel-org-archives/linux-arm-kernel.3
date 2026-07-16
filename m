Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=23PuyIqq3RXSlqltwOOMMD0f0XDGivtBy1U05nnBGDY=; b=3uM7I0FbFMnojqF5AS6tvpt/Dl
	qyho+Np4SpvsuZtZz4lzNDCSym3TpkwSobsgqd7FWr05CyUnRehE0I3H3k8Oh2kXL7a7yTNfWfPtW
	VnjhUfNMR2L+ZoMVGZvQuC8wQsA/JRR76wFjM2UPY5g5/sG1LBuMacL3YMMtgRfZvqMFEIyuIeNTI
	wElgVLlUYVwoZQ+YYhoJvmJQraO2Po0dD0GBOR8Wv9J/MeE63+19H1AAfZ4vvC0+ApFwLzvfee+iq
	7BOKZTykaHWcjrQcJKK5aBX8aYw67BR6b6R4rNzLvpt82hjeHEhXicMtHNJdoPe+3skn27EJ7FjxH
	AXUUtDSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDYV-0000000GOok-1qna;
	Thu, 16 Jul 2026 04:18:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDYS-0000000GOo1-32IP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:18:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784175515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23PuyIqq3RXSlqltwOOMMD0f0XDGivtBy1U05nnBGDY=;
	b=UP3y0uRcuRtBDAPwqIQx/VYPxgEEXqciCX5r7bYTLwqJfdSYiLxiCBlAUxMxMvXWLfUJ/+
	TH5OalDtYDoZwkJdNHNHZz9TtB1xcYBJV7xhq83XZiPC6DdzEinT1i8+7hP6UptXMAnwLL
	q96YUgv6cDFFZLCu1GqOPLXfKNH3wJs=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-692-KgclbVOiMq6qaxSzYhUXcQ-1; Thu, 16 Jul 2026 00:18:33 -0400
X-MC-Unique: KgclbVOiMq6qaxSzYhUXcQ-1
X-Mimecast-MFC-AGG-ID: KgclbVOiMq6qaxSzYhUXcQ_1784175513
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so8604338a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784175513; x=1784780313;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=23PuyIqq3RXSlqltwOOMMD0f0XDGivtBy1U05nnBGDY=;
        b=EQ3rl6QGX+VX0jyNhM3ZMziHrEk8YiK4rRke+fDvViFnTelpEKTHKaXVHCSL3xBIZ9
         ZvYJtGnebBoFEZyjd59D2EG1PWJA3tT+5Ukqf3A4DLLWBKQY8cDWh2swYJiVWWr/lGsN
         XKm1ifyKXXm8e1PNKHOG6roS5Ke+WH/5/AAXYmCpkHnTDuxML5yCDxGPbqWVXE3Fh0y7
         oF+dck/POKNdE6OLpPZA2pqx1GRkPga00HCqVvXuhqgp6p16VNTwRyO54NQAt22RtQWB
         E/nQod17Ogsc4zeBNcH9o0aMIpHS6D7sz1XEPIb4FHzoYMOQGhsauXmkeApP9ltobXQR
         fVfg==
X-Forwarded-Encrypted: i=1; AHgh+RpGNyKa4Pr77oR60d9I10qtRHn69mrKKY4zFQaiDvVFXmA6Fa1enbC6FVtBUlz5wvYN4GsbaZf0reiZB7jKjn2P@lists.infradead.org
X-Gm-Message-State: AOJu0YwtGppoijfKZMYIjGuObLSAgXIJ6msZ+7rksOFoJCuH6Q1hkzV/
	y023vUz5SXUu1OFGOiEuqjGKEDyqE4Z1EJeY9Zjlldbr7UPHRio9KG3yBn+KZGX/XxUYTzfyt2n
	zGWXXrvLZk4lj1ihZ0Qqgi/VApn+NnpInu3p2XD3OwxY71qQMyyywoZ74eKSWpdTU2Z0BnJWH3X
	ZK
X-Gm-Gg: AfdE7cmYxV8gXv3T6EX+zz+gWPEnx21jKbiX70nHjtfhTPcrmvXpjQOStzkrTeXQ1y4
	QCmCJDbnhcihbhCKR4xKQwVPFGfiWeIrFDcbynZrs1/LiXCNNMYkfhw+XNs/yypiXOXGE+a9uKn
	UoWDQSqDrQ3IRYJI37VKvf2j9Am4CnIc/fhfqICJszLX2FudIY7O9rnJ4wgbDuia/CGjWA6ePs9
	LZJt9rdX/ETsJPni4JOCOcRlXYAoYR9NvDuYqHEQebQhMNn9BRdpIQ+q7Fk2aKizDKOs5BvYZID
	wI827MBEbk22xyiJvAzQmTh0V38YKK/JP1s62bimaS5A2uS6z7suqqMGByVVdAHHrrE4U5YdIH1
	DC2KZ0IyMM6+90YDGHxcALx63Gv5qD4S5AuPx/wVkcJo=
X-Received: by 2002:a17:90b:4e8d:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e2a04e907mr5333852a91.33.1784175512656;
        Wed, 15 Jul 2026 21:18:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4e8d:b0:381:cef1:11b0 with SMTP id 98e67ed59e1d1-38e2a04e907mr5333821a91.33.1784175512073;
        Wed, 15 Jul 2026 21:18:32 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6e9edfsm6509039eec.28.2026.07.15.21.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:18:31 -0700 (PDT)
Message-ID: <c1779945-2ad1-48c7-9b13-1eea8afed687@redhat.com>
Date: Thu, 16 Jul 2026 14:18:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] arm_mpam: Set mpam_feat_msmon_mbwu_31counter
 when there are bandwidth counters
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-4-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-4-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZY_bdaKl95bCvH5-2e6UPg8n1bmyIHBxkAXIINAoUmA_1784175513
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_211836_843896_F44C7CF9 
X-CRM114-Status: GOOD (  17.56  )
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

On 7/10/26 9:55 PM, Ben Horgan wrote:
> If there are memory bandwidth counters then there are 31 bit counters even
> if there are also 44 bit counters or 63 bit counters.
> 
> Set the 31 bit bandwidth counter feature bit whenever there are bandwidth
> counters.
> 
> Fixes: fdc29a141d63 ("arm_mpam: Probe for long/lwd mbwu counters")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 

It might be worthwhile to put some context in the commit log helping readers
to correlate to the specification. What I found is something like below in
section 8.2.1.2 Long MBWU counter and capture of ARM IHI 0099A.a:

In MSMON_MBWU, the VALUE field is always 31 bits. If MSMON_MBWU_L is implemented,
the length of the VALUE field is either 63 or 44 bits as set by MPAMF_MBWUMON_IDR.LWD.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index acfa9a4dc2fc..11b10c3bc334 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -930,9 +930,9 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
>   						mpam_set_feature(mpam_feat_msmon_mbwu_63counter, props);
>   					else
>   						mpam_set_feature(mpam_feat_msmon_mbwu_44counter, props);
> -				} else {
> -					mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>   				}
> +
> +				mpam_set_feature(mpam_feat_msmon_mbwu_31counter, props);
>   			}
>   		}
>   	}

Thanks,
Gavin


