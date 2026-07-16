Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B91C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+iAuWhpmPBcbQsPKH97utiaOa99c/Fq5q8vft2DK8c=; b=RB/OX+HbQ9hU5MRaFrmCW3FxQS
	TsHDuQYB/YyMjTUC/UkNqXf3M0OmuzStNzaXT08o2Ers66yf+qllN8TDPhOlOgH1sAdE7hOL5nDg/
	G87aZe2Hwo1rGxCDAoVMGiaF+V0xqCeqVxNhswbbsyNGf+RyF2owHJ8q1f/S53RWoS9ywPqAu0kVd
	hcFBqAZw8vvt2zLbaltB4UaPC38oP+yTl+RcOz1Vz/4tMcgpnrkACEUGy1wRA8pqd/q0II5giyGz3
	OysLzbF9tjnTbnhl9ivQAj+pRIiGD9SOBwsvkt9f1Gf0Gn/0gd9kVZM6iBBNDTvj6bD9vJ/nT73qb
	L7STIHug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE4P-0000000GQs7-3mYn;
	Thu, 16 Jul 2026 04:51:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkE4N-0000000GQrd-2E3f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784177494;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+iAuWhpmPBcbQsPKH97utiaOa99c/Fq5q8vft2DK8c=;
	b=E/MQXvJfCmVU8n8CWUWdcxjca3S9J6GdP4Lh8w8PcJYEew+f7HxRe8ectO0IBCy7ECIkjF
	ykgbdaBAHWwdD5WU9DfVcnxj/3eSLiPv0lqfXzzQYHIGA34rahZGLuzZvHCIr3j/PDml/8
	3vLfbOp0oueI574SHQg/W0i2TZ+kUM0=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-Oxf96WoQMeqzZFvWrjuMdQ-1; Thu, 16 Jul 2026 00:51:32 -0400
X-MC-Unique: Oxf96WoQMeqzZFvWrjuMdQ-1
X-Mimecast-MFC-AGG-ID: Oxf96WoQMeqzZFvWrjuMdQ_1784177491
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ca860baea9fso6898480a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:51:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177491; x=1784782291;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a+iAuWhpmPBcbQsPKH97utiaOa99c/Fq5q8vft2DK8c=;
        b=ZEyEUE2F87Cvl5RfNYkNxiH8MbkDqfmReqioqrCqURjQ5i2HaRwcnsMQ3uTwoq2eCB
         spfRbaU62+2/mR42h2OKV0IrW+oMNZbuO6CF4Jc00MmapICrpOL2djyDBzGHTE1rmINY
         VdevhcXKV7feTLEvpTvjPdeVC+63CMxrATsVaLu7DC/FuQwSHWHuzSUn5hWtYt6EcEMQ
         8xRiS9UOWhNhVc2QTw79mOoJbtxm6Ei9+pV1g6an4aAbH9WnR9UMHOhH/G8Sir7K44Nh
         VURxQe1NQv0x9j0ayyWzpsIURxREND4EOA20OPFprL0+UmmHmPdcu5gUyyd8ZjSAPgdK
         KSvw==
X-Forwarded-Encrypted: i=1; AHgh+Rrki73O0HkpoYHMgTFB/zNApv4THcfqwDhXy9n9JqhtYhkOyq8yhzq3/uacR8dAT9c7Gjt+vNrN+V7UtK7VHhiU@lists.infradead.org
X-Gm-Message-State: AOJu0YwCKXGhAaGXL0bxQAD6YR4lvQAmvNsQzA3lZFkOtdBolSIBKg70
	RbC7cLxvJDa9rInjWUpwe5yfRJY6u8PNCjCKQ2vr7mM0JITjdHj4bz1RBoUSkrf18sUK/9qQiFs
	a0f+opV5hwpnsnL/v8dR8tFQuC6AA5bE2JWAXQWSSzi9Ge3HrvsaIio/0StkiVYOjPSaA17gPBa
	oU
X-Gm-Gg: AfdE7ckwj3rvlHtHhMK1+eAacduuIKASaXAevzgBpqy8jobE5vu5+/AaV6XmcSz5z+g
	GoBQ9m0yBdpftOQAVGIZU25BPBq6ry1HN+IYJDjL6pTpUwp4l30cnkdxA02Bm1IZdhQktfJOq0x
	mW1avgnR8ZoMUhPLa9xCMZAl+0KaEwl/5pk8AgAd69a0vUwQH7Rx14Q4HFf1SeN+oKdcGgCNy5C
	pr8nAN6vDcee3kWLJBXSnXdGzgFjLghWain0/Besvlz430nWiuUr/1mJzVxLtvQoybo9tZQ195c
	MDof/77G9sSuPqPrYKjqd8Ljr6SV9w3o4Zs/0/kPkr8rvUd6dt6CvANwamKRFlWULCfLDxCQlZZ
	I/38fmTso/66RQfq2Nz0fg+TPr7pEgpfpb/Gb0ULFy28=
X-Received: by 2002:a05:6300:2290:b0:3c0:9c1b:d0c1 with SMTP id adf61e73a8af0-3c110a535a4mr22121134637.76.1784177491101;
        Wed, 15 Jul 2026 21:51:31 -0700 (PDT)
X-Received: by 2002:a05:6300:2290:b0:3c0:9c1b:d0c1 with SMTP id adf61e73a8af0-3c110a535a4mr22121111637.76.1784177490664;
        Wed, 15 Jul 2026 21:51:30 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb258ef7d3csm1162644a12.14.2026.07.15.21.51.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 21:51:29 -0700 (PDT)
Message-ID: <88d6316e-ab5c-4852-bfbb-20f6b984c079@redhat.com>
Date: Thu, 16 Jul 2026 14:51:23 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/11] arm_mpam: resctrl: Correct check that existing
 class is L3
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com
References: <20260710115546.29644-1-ben.horgan@arm.com>
 <20260710115546.29644-9-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260710115546.29644-9-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JniWb_qnCXFcdOiPLtTfMD109uNOz3aaDitMAYJPyWw_1784177491
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215135_704093_2172D443 
X-CRM114-Status: GOOD (  14.36  )
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
> The class used to back mbm_total_bytes can be either at the L3 or the
> memory. If a platform had candidate classes at both the memory and the L3
> then, as the check for whether the existing class is L3 or not in
> counter_update_class() is broken, the class that will be chosen depends on
> which order the classes are considered and so the probe order.
> 
> Fix the check.
> 
> Fixes: 1458c4f05335 ("arm_mpam: resctrl: Add support for csu counters")
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_resctrl.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


