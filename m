Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE469C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXVMGj2qEWMUPG1DsPQovOwGHTN54tYzirg/1nSfgGM=; b=jjhjBBctCnNzPIjzlDhz/GEtN7
	/4ZfcmGKdYzIEbVzNEKSH4SgMT0fpYST8JNAj3Ul7rTvp3NXaAHZXzZbtrdkPAHhr2vHnsP1XB+vI
	Mhc+Nttl0GbuROBIVQj/YZFSBhy0lMYm/iI959N00T/gTfRONLPl4tysFvFOg5IxEsUVeqMVuM5KA
	d/nZu2tezVCjkvD54bW2HFLuobtPsvRxF9czT4CR1lu/hVtaQ0ChIbjkyfxyjFpFBYzHBCKUOR1v7
	YIvI96VYmnT9/tY/qAHtNqw4ohEfcm10P+CV1Q4AjlM08T5XhWzz+dMO0cA8WhmXk+N7H4ZQJajh/
	YwWWTT8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE4f-0000000GQvI-0Cbe;
	Thu, 16 Jul 2026 04:51:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE4d-0000000GQuf-2EYx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:51:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXVMGj2qEWMUPG1DsPQovOwGHTN54tYzirg/1nSfgGM=;
	b=cd3aCESdbErS4yAOOY8A1gy30YxSSFHxb5taIzsJcGswjyUncCM+n8uPrGhHRwzj0oTxOU
	RPGYXCw6RCB8hpcfJPC6gMLhyGAeg6Fkadl0sx8Y0jiaD6cHQLw0va9Xv83Srfc2WzAGi2
	xmUDdGx25e4hgEhzdUrp8Qnpc0eLxKo=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-6ZLDXMBHMq2hGWn0OvJQOg-1; Thu, 16 Jul 2026 00:51:48 -0400
X-MC-Unique: 6ZLDXMBHMq2hGWn0OvJQOg-1
X-Mimecast-MFC-AGG-ID: 6ZLDXMBHMq2hGWn0OvJQOg_1784177508
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca5d2474c7so76698285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177508; x=1784782308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pXVMGj2qEWMUPG1DsPQovOwGHTN54tYzirg/1nSfgGM=;
        b=n06ngCXhNojgnsi0teThosLXTy0ba5YShWZLZhpY2q2F8sMaRmbT7Qp6bV87Ob3Hjb
         oQ8fSZuR6WLgUiBeKzg4Ganrjf0hdees4+OIXr3ZMEaYYtpNdH9Law91/X+5Gjf0XVHa
         7VdGI3oqlnkup9eINNi4MqsIO+QJXHFhalJ2pcd62+CDtObwduN5YAVYRMN7SQcT6EG3
         IHAt4evU/b5JQoEycvYWE1SUChAIsGWrQHP97p86rKfzzGuO2IS39KtJz7E4PIkHv8EV
         s7wfHp+LW440xyTKSR7ARHM3+Os+wtvN2kb60jU2XJx5iixAClx43Uu2ieElRIOZ8EFm
         tl0A==
X-Forwarded-Encrypted: i=1; AHgh+RquHKDCwg5BXcqoPlB/MzaIQ75DyN0iKPtmvdcWhPPKkCHzFHHKrDZwi0WMuc2AI2k0u9L5Sq5Ut1G6o0bffOYX@lists.infradead.org
X-Gm-Message-State: AOJu0YyNFOqK6lh0OAKjEOfcz5QFQoLWpZmtP8D1fWqFyX78kSC29qS8
	Vpln20TjNn1MPoPDGYEDPV83rNn9DUHd2cET4sFRP+tJH/AsjWDNYie7KOmZmOb85x6QJaWknjy
	6svehPu/1p9Ek9NVxmrzJxmABajJVIUDNHXOWDmjCkFDeV9IWZ1tyzof/fKpBuHYGwlI72mKcFs
	S8
X-Gm-Gg: AfdE7clN94yflSFDDwtZVWLBx4ZhLUBkxohZphxD19cRDJmyX/ek2d5B5YRt4klTMhI
	Y13WOzNaELxCqYShIaOoFnHlGESiG2GOcBZLe+Uvpx/29afRv0zprTU65lPTSxUI38IBoaaZgPU
	Md06zj64a2VDHbgahJGOp1A+avG5rlBxWwbeXct7l+ociLscCywiuqvBQ+8G2szqyLt7cuohtcS
	K13NPrVVNXRLANqErCYxJP/QketthVLahxdL4FaVYeFy7hZyzy5NTrEogbREwA4BvBHm4nGhjiq
	GnFqtA99oxMN3RHiRUm554CkN3Wor3B0X7CJh1EoyjbZJ64bZshhwTRlP/fhi1npZwdhpPXw+hK
	iV3hi5OIfozhQbvhfIagfpOhDqGTcF/KoIzmGDwzkJGs=
X-Received: by 2002:a17:903:2bcc:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2ce9f174650mr178857085ad.46.1784177507852;
        Wed, 15 Jul 2026 21:51:47 -0700 (PDT)
X-Received: by 2002:a17:903:2bcc:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2ce9f174650mr178856915ad.46.1784177507406;
        Wed, 15 Jul 2026 21:51:47 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf100e44e1sm13300595ad.6.2026.07.15.21.51.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:51:46 -0700 (PDT)
Message-ID: <b543c1c8-b5c7-4d2b-bb97-1e6e9faa3f0a@redhat.com>
Date: Thu, 16 Jul 2026 14:51:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] arm_mpam: resctrl: Make read_mon_cdp_safe() self
 consistent
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-10-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-10-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oZ8a2MaOZOiVnq3tx8gVwTXkWvMBo0AIIrr6jBLl_xg_1784177508
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215151_647234_30826895 
X-CRM114-Status: GOOD (  13.23  )
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
> When read_mon_cdp_safe() is called with cdp_enabled equal to false then the
> reading returned in val is the sum of the monitor values for the given
> component. However, when cdp_enabled equal to true it is again the sum of
> the monitor values but with the initial value of val also added.
> 
> Change the cdp_enabled equals true case to match the false case. All
> callers zero the val before calling and so no functional change is
> anticipated.
> 
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


