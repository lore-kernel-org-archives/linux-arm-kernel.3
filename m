Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6F5C88E67
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=; b=cfW+ymhSJhgJwGatKxmHx/+5co
	V8G8wHIN6Lh/VTisLj8Wg/iYR/GA36Co9nkDTkIqpRk7+VEDrwn0xwfCOWjmyAyp5VJ02Le1G8ARN
	CKbnXf/H94vKfJau/FmLsnZL8FsoaDQzLaLd/JY6kv4PpH1rgHSNdbw+8831JtVBbqAatWJFJEIDk
	QA4iuARs2Jt73u5wBmNl0hnXuOHjh3N4Wyo+wdB2tLt5FIO7AJ2Blarw9sIvkg8C80dCDJIR50ReN
	UTouGAJ2KUy74svAVJ+UwFH5crjMHGGj1YVtCxqErkjJs5hnX/LEstJ0sakw3tzEhLSIlSwj+fzGs
	tyWQyVqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zmA-00000002OkN-2vbx;
	Mon, 14 Sep 2026 06:02:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5zm7-00000002Ojz-3cei
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789365762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
	b=bTpWR15PmjERwGX1kwfkPrXh0t0DobS/kZG138rf5AtwlhyHwdr974jvy2wAWimQW+jb3D
	Fu67zVCs1eihSNgkGKG6Me8IoxRH0iwesdmlrBJvhDJck/q7gCc7lfIJJ0RQebYFZvo1qq
	XPTY2SgEFxAanDuH0rTwa+cYI1EgxWY=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-32BzUV4bOF65aqp0jSTtAQ-1; Mon, 14 Sep 2026 02:02:41 -0400
X-MC-Unique: 32BzUV4bOF65aqp0jSTtAQ-1
X-Mimecast-MFC-AGG-ID: 32BzUV4bOF65aqp0jSTtAQ_1789365760
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c153bab4c3so2655679eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789365760; x=1789970560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jR3AopfYN87ksUtB3meqTk9HxnnS1LzTmbbTTCKyMFM=;
        b=kbwbd1XvHPYLtnr1gAX8b1bBfq4E2qAY2MGGMkkpdPbV93pyzhhk4WCd9ZdkY4Uy0K
         k6u/W63FgeaRwuQXmJ+c7DhK50JbmzueBJTnAYRi7EXu/Bo5RH1xtP+pLgALPVkIamJR
         2DJKOuQASPpFOiOb1gEMlXXpKVEyyo9hebIQjvQzv7FzmtM41o190iXSjKauy7v1Zydw
         WFelFO6mG30M2NzFECYPdEUbnA+fI+cmORNbgankXGMyEmrgFf4rfePEJuHApw+ePpTq
         3uKTxBOB3uvq6iqxO4IA+bCqc4/ClUjOsSp7T3TsuRYZx5f+YkV6gHLBFNkcxqJhySxk
         5COQ==
X-Forwarded-Encrypted: i=1; AKwUvByAO8mStwHC2dznRcXAXaHXNbsTZ6Idc3mw438cK+nQ+bKKIMEDUB7gHZwY5bFx7JMg+HLwKNFJR2qcGk65Wulq@lists.infradead.org
X-Gm-Message-State: AFuF++lY9mYq86JY5bF5uZDhJNasYY0MMFvkwtN7eFRRUw2ajsFbnVcn
	gO7CNEzFOwixfbQLpbJrW0M+ilKFSbeeO6G3hUiTLcjtVQdIApFAmAGvraWtRhxkcIF/SHmPE6n
	DnLBQJ1XeC9aUYN1D1g/lzHnJGDBC2KWzxMBwQWkAxwkqhGWarm6w4Bvsq04oerDjNcjFg+u/ki
	UN
X-Gm-Gg: AYBFou1RmS9OE46so1+1mwUlA0WyTA3EJBr2gXV+ThqnGf6MCzgdaPQb9dbM5BUm+aZ
	k0Y+7BGzbej46qvIXqX1FrqLPxKcNb+EFr/xlUHcT57wgku6pVa/Vqc7kZxav+gmBAc8ZWKrml8
	BDSXe/CudOWnC/4ZHg201f0zAGcJHri1XGurIEcA3aNl6l/0XLB1TbI2mBtiOznJEnYinyd5MaA
	Aphtj293tzshlptV07pS/ZoYnYMMN7ub1xl+6f01grcMa1xgInMcgoiwyWGRrG0NdgiWIJu/Tpo
	KYo+1nGJJOqNiqDs9tXdquEz4FCSiato8MhKow4Bc6Ehg11qnTC7BbeyapHFLv67k+k/sG2I2mA
	lC2GCudKZt5P9KRAPc6OonoFW7cdyggHGUeq6KL89XQ==
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578889eaf.67.1789365760268;
        Sun, 13 Sep 2026 23:02:40 -0700 (PDT)
X-Received: by 2002:a05:6820:2008:b0:6be:8d11:a077 with SMTP id 006d021491bc7-6c542d2884bmr578855eaf.67.1789365759829;
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm27179423eec.16.2026.09.13.23.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:02:39 -0700 (PDT)
Message-ID: <554580db-4ae1-4308-92e6-2f010afafdfb@redhat.com>
Date: Mon, 14 Sep 2026 16:02:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] x86,fs/resctrl: Add resctrl_arch_preconvert_bw()
To: Ben Horgan <ben.horgan@arm.com>
Cc: james.morse@arm.com, reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, hpa@zytor.com, corbet@lwn.net, x86@kernel.org,
 linux-doc@vger.kernel.org, dave.martin@arm.com
References: <20260911163613.1131447-1-ben.horgan@arm.com>
 <20260911163613.1131447-2-ben.horgan@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260911163613.1131447-2-ben.horgan@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iHxpQMFqDSd2Pqb3SxeK1VX1Qw3XTh7OA-iMHIW623U_1789365760
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_230243_987248_B8F13547 
X-CRM114-Status: GOOD (  17.77  )
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
> On MPAM systems the rounding behaviour of the MBA control would be improved
> if the rounding in the fs/resctrl code is removed but this is not the
> case for x86. To allow any rounding or conversion of the bandwidth value
> provided by the user to be specified by the arch code a new arch hook is
> required.
> 
> Introduce resctrl_arch_preconvert_bw(), and add its x86 implementation.
> This is currently unused in resctrl but when plumbed in it will replace the
> call to roundup() in bw_validate().
> 
> Signed-off-by: Dave Martin <dave.martin@arm.com>
> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
> Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>
> ---
> Changes since Dave's v2:
> Split from larger patch and add commit message
> Update kernel-doc (Reinette)
> 
> Changes since v3:
> Swap parameter order (Reinette)
> Change summary prefix include fs/resctrl (Reinette)
> val -> @val
> Add Reinette's R-b
> 
> Changes since v4:
> Set author to Dave as he wrote the patch
> ---
>   arch/x86/kernel/cpu/resctrl/ctrlmondata.c |  6 ++++++
>   include/linux/resctrl.h                   | 19 +++++++++++++++++++
>   2 files changed, 25 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


