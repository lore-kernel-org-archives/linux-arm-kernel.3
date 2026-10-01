Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBB4CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDJyio79knKj0re/byLa1b13NjMEeAfKBhItlxqNUIQ=; b=i3ltgIRZJtTXRtVeDi59FELXRm
	YTNw0V9kk8rGu4bA5yT7vqqxRpLU1tHMcRvHGLxkpRgAJSjTFH2SyuuyZ4wu04o/UBzC8b5AswX2+
	DQ44/gLdMT7WB1UBVq0QAg1VVenP8GfZMFTnrn1rdcI/achK5Jecc9DzJRRk/LPoUT9tiJj3lYx/8
	o36PCHg1waMqvnaNCACc5aonRAKpwiuY52yJuA06gAVUktxEe7DnvBec9k6JmH3m5lbhp/sSkrhbc
	WccpgX1iWvbwrlfMnri1gM0aglqf/fIsxrZcI5htET5aVJ4CfFqCV2yp4dMGX+TqfkoPrlTqazNBS
	yVdHg6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGYd-00000009BEo-0qt0;
	Thu, 01 Oct 2026 13:10:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGYY-00000009BDm-2HhN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:10:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790860234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DDJyio79knKj0re/byLa1b13NjMEeAfKBhItlxqNUIQ=;
	b=HikDdGP4t+tysFssAY0FAHvBKwISyLlHj9t8ZJZTzubUYWDnE0VrGAjetBvPAYEiieNLgf
	mvslt90nhwgtr/Z/TtiGNtALDpfEhkPACCRkEWLOPgX6lnWNcP6hMIJx+FSArJqtAh9OhX
	Yy4iLYJgLZ0g6IhWyyiKdVHx1M0qsDc=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-B-uc9Bo4OY6Qziz5Z0Ompg-1; Thu, 01 Oct 2026 09:10:31 -0400
X-MC-Unique: B-uc9Bo4OY6Qziz5Z0Ompg-1
X-Mimecast-MFC-AGG-ID: B-uc9Bo4OY6Qziz5Z0Ompg_1790860230
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so6393859a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790860230; x=1791465030;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDJyio79knKj0re/byLa1b13NjMEeAfKBhItlxqNUIQ=;
        b=UUIHYH+MjWu0Ab7O5sAgr44qlcwPL5OYVDySoHbHVAyy0n7QrEkysCC36p3Er8AQIn
         AIGEO9l737cLlf4+hVWUlWqatliT4CjiTLwy95nrRcouqKEkOTkN0Y0i/ORNYebjR5kH
         NdCsxLbTHIzk9J82oM8WyySgadwZfXlnEioxQA1jFXvSGOzq8KsY1w+gONG3eIdv30qv
         ADu+7z15l8Wm3NjPeW0ht+h9Aq7zMGjAOYexVibbDiGLF31u14n5QXb5bABN3fdAPSSI
         XYTiBzYXKLIT1nrb3x7E+uXhDT7ceq+VXk7+U0a+fJimiyJ51EKkE0umfhCN1TmE+X5F
         Bj5g==
X-Forwarded-Encrypted: i=1; AKwUvBzZU0Ld2T7/xoNaS0z0n296P9HdrfG/2VTHzOmLBYlMMp+bCYWlPsPEhS14Stk+VvVWE/Fpjoj/bjih23abJylj@lists.infradead.org
X-Gm-Message-State: AFq9FYISdnjVNC3ozI1jvJ/NddWqoYdSLIsdMi57+PbqqiifQblkvuBH
	43jcPZj8RqVl0kFpBs5Bea05ar0m13ejlp6jtBEbePUiU0eaeSQtKQkjbipR7ekN9Wo9hbxa2mI
	gyq3JLS3mI8SpKjXapiAwQGzbBd5Lm4qM5IxFNfWQaNTU9CoLR8FttbS7J16hLOiI95+5e8mAum
	RP
X-Gm-Gg: AYBFou1RZH1qz5OdYQcxcVO430Apj7A3nIJX1QAQIYMoKqgd7Ml2EyMFm/sMSO3cGpj
	zuPmukwJ4Y4nIgXfowDw+4tFOItCHQBp/pRhAxVWlynL0VfwDiKfOM0wvPLzgjHPZbL7OJ196DW
	ldRwb2uoFnroogtKS6UulS96ZoHLr8Yij7hmDUEatr7ityarNx/+QiKchfZu3gziGOj2aQTHvlT
	eQHUKQVn/a/B7sppo1998/h/iIML34Xe/JP1ogjNpk3UT8Chv/1PLMtKxR1cz9LGgcsLyPGI2ux
	V0o63+GoTpd/B95xfpDL532dH1pdjrDTK0ay2PDHLnsYn52FaqEUdCuBdK8qkgaYrU3RKiW/6wn
	9wbmc3cSjnn6Ca1N3DEI+02kbYePFkLD0fPtJUUFbDA==
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr4364892a91.49.1790860229927;
        Thu, 01 Oct 2026 06:10:29 -0700 (PDT)
X-Received: by 2002:a17:90b:4d09:b0:39e:6c69:f472 with SMTP id 98e67ed59e1d1-3a4d18c0f59mr4364841a91.49.1790860229444;
        Thu, 01 Oct 2026 06:10:29 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f6fb6438sm1829850a91.0.2026.10.01.06.10.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:10:27 -0700 (PDT)
Message-ID: <79509ef8-6b7b-4499-b2bf-f400b1c197bf@redhat.com>
Date: Thu, 1 Oct 2026 23:10:19 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 9/9] firmware: arm_rmm: hotplug: Skip memory added to
 ZONE_MOVABLE
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
 sudeep.holla@arm.com, jonathan.cameron@oss.qualcomm.com,
 David Hildenbrand <david@kernel.org>
References: <20261001084555.1456543-1-suzuki.poulose@arm.com>
 <20261001084555.1456543-10-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20261001084555.1456543-10-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iwzZN9fHDnlgclh8yxm-kDYRHZgn6VBeKrMwlqJN4Xs_1790860230
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_061038_666275_13744CCC 
X-CRM114-Status: GOOD (  11.74  )
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

On 10/1/26 6:45 PM, Suzuki K Poulose wrote:
> If the hotadded memory is in ZONE_MOVABLE, we could allow that to proceed
> without the RMM having fine grained tracking, as we won't allocate pages
> from there for guest-memfd or kernel allocation
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
> Changes since v20:
>   - Use is_zone_movable_page() and only check the start_pfn
> ---
>   drivers/firmware/arm_rmm/rmi.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>


