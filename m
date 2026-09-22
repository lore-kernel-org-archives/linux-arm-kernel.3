Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C00FC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 05:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=; b=qCsER4lSLs8rFU8rkbdLb9PimP
	dqySaPI/mRYbwLesQlZy9Z8wbSDjqRd2Z7zRaRfrlpR7UhlucLRO1IO3zzf3kv4cpZHQVGliE/y3n
	ljD6Mol18GSBy5yuctUVQqi2Wp2iBXopTT2UgdOGinnq8HnaSmcKB033YDwRCJVErlk8hwn/9iLbj
	yM+OLMv8UETbkLkzihTx6vJYvScSTLlLGsq+KbXAwwaS/4ATWj+i8NuWpTe/X9EmFW4AaSTQRszjr
	LQ6Wmdhe6DbpfzoNhQamaQVd6qAOGOAqVWBu/dZWraw4+NRr8wb/h8Yyb6AFKR7sA11bxWdW7pilF
	Apr24W+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tI4-00000004H2A-2kew;
	Tue, 22 Sep 2026 05:43:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8tHz-00000004H0U-32Mh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 05:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790055814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=;
	b=g6pHUuvRcoLuydNn/EpYedT+Xu8IwhLuALm73Wb1JKqSSb7m3gM+ym7TqJr4ylYnfBkrUS
	nd+w9ah5v2nlZi80SPCW3Q2P8GkOdIBbeWyVbxcEjIcZT52F8PqLUA5uJjppdZYyCovqyJ
	UuSIvqwhsK8pEowCaCbSV4tfMe4qj3g=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-283-J-_Kgpv_PRKcvRDIF4190g-1; Tue, 22 Sep 2026 01:43:32 -0400
X-MC-Unique: J-_Kgpv_PRKcvRDIF4190g-1
X-Mimecast-MFC-AGG-ID: J-_Kgpv_PRKcvRDIF4190g_1790055812
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-86fa6b15ed3so5329761b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790055811; x=1790660611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QV0FYbYtUBn0lNewuPlKQbMKVSurGDPtsklRfGOziW0=;
        b=hD/YZnCJ5D2MplvDO4SfcbMpFxu+7SSxzZNMWaZ26mHbMKpH7U4ua/fnAsBK9tNIAv
         9luTbIQM9g40EtYA/OY6f4gD/PnlUOKwmt6R4b4eWqvSrP4Z298mGCSQAzSxiWkQElg0
         yOuPTir8RUOpyE2S02KivXvMgcc7Mt/v79QMvWuzWeexOw3Kk0dsxqghj23rwJkt3K2C
         rYu4wp0Utb4OwEwMqCTpmk6usuT3jpfS8udk+iES2lDCc7sFQ42BvbATZ1wYTwsOnnpD
         jp1eYrEkLSrWx3jnrA6lUfdZzTqhSxRFS+z+S73pMt/2y/g3HgGgKap9OQVX0ztV4mbk
         VdKA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ4w1TPAxBUg50PRx3qyqKY/L0QjD1HgXpFwTvAogtre0vZIfNk+6+9YOq1QT0lUcDjndJsQAqMLWFC92FZh8k@lists.infradead.org
X-Gm-Message-State: AFuF++mFIizyMN9LjvdC5cvc5zY/u/JY83VgqxbYbdSjYqb+ym4RmA5n
	9lZThtZH4PcSRIi9sSFRdAuEyw6Mesvw0N1dv8uvGcsM08UEHwxRthD1xzRqTKCmF6M0BBbZ8+t
	cfbu4/txrvxBIbwKnKWk+GFBm73uLvvRd+f4lhLhZgWlIxfRD3GQDcvwgBnWcTeNY+kiMRu0iw4
	kv
X-Gm-Gg: AYBFou2qv2pPOacJbjSsZpxLwWs+TyR0FcX0xWEXXKJ/wV1/pU1LP6AVcXtYDYlH7uN
	cgSPWVfDDA+tbMM7VTBpGDiVei+8YLmGrWkn4Scr8YSMs/Nz41zBPtWmwKuDRLg5wtCgjQfphFE
	+wkpol/54FAAacEb6vsOvxb3wUu8BZvIhViwtwmJ+wqziAUpKYrTdjQyH5SzwWoO/8x+Ie1n7RD
	Msj/CXGoOHctwD6o4Dp60wisKnYl4982y6x+TQzolNbuihkVaB2bTHuUl3Ym2t00xPdW6/p5jpA
	nZhdKAnEEPAd7CH0V/GMJ8ANygDWZRI9LkLJMv2ppPXPcbANfgWjV4IlPwFKS4gdoJo8bY3Br7f
	ziwIzKey4wkuVzfrx0/yUUK/DwXalAWfuvjvUofZkPw==
X-Received: by 2002:a05:6a00:3a19:b0:87c:79d8:fe7b with SMTP id d2e1a72fcca58-87c855f70b8mr49668b3a.59.1790055811588;
        Mon, 21 Sep 2026 22:43:31 -0700 (PDT)
X-Received: by 2002:a05:6a00:3a19:b0:87c:79d8:fe7b with SMTP id d2e1a72fcca58-87c855f70b8mr49644b3a.59.1790055811123;
        Mon, 21 Sep 2026 22:43:31 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c32bba517sm277553b3a.40.2026.09.21.22.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 22:43:30 -0700 (PDT)
Message-ID: <46f77ab6-4f7a-4a40-b0e5-3ea92659d7a2@redhat.com>
Date: Tue, 22 Sep 2026 15:43:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] arm_mpam: resctrl: Correct check that existing
 class is L3
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-9-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260917145617.2202986-9-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: C3NjFr9Omo9EBgNv5c0NhijqIGZC-XV82X9VceCO62Y_1790055812
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_224335_842764_AA0E82DE 
X-CRM114-Status: GOOD (  14.99  )
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

On 9/18/26 12:56 AM, Ben Horgan wrote:
> The class used to back mbm_total_bytes can be either at the L3 or the
> memory. If a platform had candidate classes at both the memory and the L3
> then, as the check for whether the existing class is L3 or not in
> counter_update_class() is broken, the class that will be chosen depends on
> which order the classes are considered and so the probe order.
> 
> Fix the check.
> 
> Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
> Tested-by: Gavin Shan <gshan@redhat.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


