Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A215C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u67R7lKSftEffzISQyom29MAqpNwsA5rnftI4wHCxGU=; b=C3u2BgoY+XBITMo8eAVqu9w/Qw
	9ej2MoHpwRfCzGxi7S4CFZ+0oyBqWTRwbHi3EydRdXA/7iAo7PUToHtiZrFiy8/mUzVVmn8rvsgRk
	PBA3J9TGIZ7wv6Gcqr0fjfIjWe6rmMFkTzQO107yWbx2UU4YODilRnUtMOx/ywS4nCY7/ss0aIXCZ
	y2S2KOcGUnyrv34Q69wU7Qwf4fC6YH2tiQLtSvzBmXiq/dx0kqwGI48Hq4mSHSL51hY3pxlCA7UxF
	eta95Q5qlaA0tlk+9zh2npZGp2yjLFgat2FZsk7aSMLBiR5f0IIBU7OpRDwrf3tpu89Q7EeSyfPIU
	ZjT5gXKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE5C-0000000GR1Q-0ib8;
	Thu, 16 Jul 2026 04:52:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE59-0000000GR0R-46Ma
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:52:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u67R7lKSftEffzISQyom29MAqpNwsA5rnftI4wHCxGU=;
	b=Gwr800qJuzDeeSl+GYO512uiVJyJZj33EzGtJ//mT6ZUzDaeo+vJCAPbEctQYlr27rJD+p
	mtmgrFgZg6TuNI+VCgb2OTp8llSI9Ac3lJbkMoHXzsDAatcsD26KXQo8VVbU45aANp07IK
	SYab1RgKbXPoGy8widhTJgInyzjm5LU=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-227-Ty8GgdvbM0Gq35KSDqt4Bw-1; Thu, 16 Jul 2026 00:52:20 -0400
X-MC-Unique: Ty8GgdvbM0Gq35KSDqt4Bw-1
X-Mimecast-MFC-AGG-ID: Ty8GgdvbM0Gq35KSDqt4Bw_1784177539
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso5204258b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177539; x=1784782339;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u67R7lKSftEffzISQyom29MAqpNwsA5rnftI4wHCxGU=;
        b=rVG16zoOeqrIljGLPHh9M8yTRB5Jp+yNp3zL8PFk1FP5tQhrvhh2fF93vd6E1m8mZd
         eREYrhCVHGsKaB/iYa5A1rgUUxPqhb76tf0L8SXGk6lr2llLLDfsM8qfYHGkj7aiQ8Z2
         GkleZk8L1yOnjG9fZj2kPxc1jfQfYN/bbxof6FVjcGy262FE58MT4u6P3gw/nxmszMWj
         eAYgYo0GQQVk+Sg4PjFCh5dBLkBq9tA/s6ELXqJdpmJE+VIzPX3GnNK5mpotfzTI0nrU
         LXPG46+Uzlk97y4plLZzAzAX+yY76XBID48olScO17tuoAAM8s22DkgtUMZ9/ZFABmvq
         PJ7A==
X-Forwarded-Encrypted: i=1; AHgh+Rr4B1uNrpBEuA/xjc8qL75s5uqa5/EEqeUFUUpQaYxDJqWsR4bDH5InNAL7XprwO82+HMWiLaMEflAnF7wIw1sj@lists.infradead.org
X-Gm-Message-State: AOJu0YwpnEw7nHcm8u0Xvt0pqU0gwsIK+JvmoFO61zhx3oaG4D79DKq9
	YQyUWPZHw/a7WWkfPBDuuV73WvC3T/BgTU4sFmzidinpgrQo7hlA4FFfRqyAhF00+qwIMy7nExL
	Jx2rtMGg5jMLh++qj4H6vcTWOxjD5QVB3bBCCN+b5KsQLzHBk514Xmv56AIFU2cbJBWV8bwWzbM
	Ua
X-Gm-Gg: AfdE7cnw1or52fSwycxmvsEiqWKgm6DJzBsnNOFoFE14hoxKv5U4Sok38T9fOxGhMX9
	+HQ/pAwrrQCAf3ia6vu+UhiO33rcrP5OFnA0EtaejurIFcFzDTFvzRpobeqbiyuAz54VbI+IEvh
	PsljnUY8evCRwHY1eDD88uGBb30EY+MzwP4MDWRdFde4svtAWBP0DDJhFdtYDX8mghuVu+PMY4X
	m7O+CyTsutuWPqH446w+JyGailHxibX/KjG24/YaSOjKk8302d7glJIFWhTs9YINUDVkWpNd+Mq
	plOaxvbKzD09Rr/6c4qimV1NZ3hZyFafY6Inm2rXloIqXnOnrMwQzMwwSC2qLplSSftC5IqRBGV
	+KkwBnexRg9fn8lGnQM/syigPmAxyrt3Bc2JWx6jyduM=
X-Received: by 2002:a05:6a00:a27:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-84889643531mr18852675b3a.24.1784177539381;
        Wed, 15 Jul 2026 21:52:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:a27:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-84889643531mr18852651b3a.24.1784177538928;
        Wed, 15 Jul 2026 21:52:18 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2778acsm4220043b3a.20.2026.07.15.21.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:52:18 -0700 (PDT)
Message-ID: <2751f277-6c94-4d8e-897d-73974b7c6e3c@redhat.com>
Date: Thu, 16 Jul 2026 14:52:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 10/11] arm_mpam: Don't loop forever if there is the
 maximum possible amount of PARTIDs
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-11-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-11-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BLFeY3hdiUNDG860WPKcdsicwx9RY547We6TKd_Ua60_1784177539
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215224_092669_C3B87A7D 
X-CRM114-Status: GOOD (  11.93  )
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
> On a theoretical platform with the maximum possible number of usable
> PARTIDs, 0XFFFF, the loops iterating over PARTID in mpam_reset_ris() and
> mpam_reprogram_ris() will never reach their termination condition leading
> to a system hang when register the cpu hotplug handlers when MPAM is
> enabling.
> 
> Fix these loops.
> 
> Fixes: f188a36ca241 ("arm_mpam: Reset MSC controls from cpuhp callbacks")
> Fixes: 09b89d2a72f3 ("arm_mpam: Allow configuration to be applied and restored during cpu online")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


