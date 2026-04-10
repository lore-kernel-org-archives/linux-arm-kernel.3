Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FA6F45A0D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upbTpIZo8uvInukjvdO6tUJ082xAFWKiDkEgBHR2CeQ=; b=jkaSnvPMfQPjrzFB+DCQTKJGjI
	75ABxvUPXj3lLASfC2pO/Pfn/XlRUZsbHYSxsLvZvVW1FE/xXgwJKf3yUuwURyvw7J85KNXfEfJ3N
	C03aQqioPji7Ch6RhbbVQ8tk4OQKfwPV5uSAgB9qdMrYOGj79Sp9ljCkBUmYm05A8q0m6yYvP+T+v
	PtM3l6bmv+56Qi8ZSzURCMiUxT447pZ0PB2dOBfYU9zKG0C/2vRsO19lVU6t8hqbV8V5Fr6vofdqI
	hPlRGW8Y5sqHEAWEVcTzPs5qPn8GdAtekjABJlJch54R2s06I8TYtypt6kOXZ/Wjnf4wKPucu20Xh
	+7njafvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIoT-0000000Cmum-0UTK;
	Fri, 10 Apr 2026 20:50:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBIoQ-0000000Cmtj-147A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 20:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775854244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upbTpIZo8uvInukjvdO6tUJ082xAFWKiDkEgBHR2CeQ=;
	b=dEWS5uiWSml/30PGzkXJ5BVU96rxmrUHxHr5vTTfRypY3a9+Ud8pjjUUbAxMWhNzrVAJzH
	nCDrLj2UGfFMJc19aVCoNGE1sm4FY52V646OFZAXcMGARITNY4/tRfXmJyXsYVDHjr3Olf
	o88Y+FU+qrfkTsfyy/s1bxRwwOOLgZk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-ExOTIkIWMj6v_i6nTj6cEg-1; Fri, 10 Apr 2026 16:50:42 -0400
X-MC-Unique: ExOTIkIWMj6v_i6nTj6cEg-1
X-Mimecast-MFC-AGG-ID: ExOTIkIWMj6v_i6nTj6cEg_1775854242
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82c1e1a6cfbso1877847b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 13:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775854242; x=1776459042;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=upbTpIZo8uvInukjvdO6tUJ082xAFWKiDkEgBHR2CeQ=;
        b=bxAUl4YaG4QRxT7Kx4fKFQEhWnLluTNvRH5M1cT2jzU5tbsOtx3oCzO7x9QzwzfVYl
         9bxNUpXHTGbE01X8r0dOcYhrAcMr6+UT4yA63FJDp96c/IxUPdXtAzgKDww/tDAQK+yR
         Mg5lx0eajMsW7z3d1R262aU/D1L3BnxXtX7xULeosax7980atmofSU5dFsPOfTrY87Lj
         VjR0MwFsKkFf3kduroV+/OLPC3rwla8t7d+fZ7YXlDvT4Nptzwp5N5VWnVoPWyJhIz9R
         oS+lUjgyWehR4J42L1VCHRjZZVtzXFsnWZVdpPVyjdS1T+Dy+eLMdVTo2iYMHJoI7Npt
         gsWA==
X-Forwarded-Encrypted: i=1; AJvYcCVkpTeY5OScCLnJuv9P9a+KQMS3o685MOMraJwte6k4Ei/Ug+XXG7Qf5+jUZHe5UVLA1RyUUc9NvRCi2wP59PXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9AR7HXUwMiPnI5hob+320nbmefAHwwpc/UCoq/Xkl+6T8H0ba
	XMGDStck1FsF8AsoUDNbokxi2KUQv4CNF+n9kzHfwBo8+V+G84/oYf6XtPBOmYLZYp6QtUjvUrG
	iv2qqeDD6qH6/8Ykay+hFDWjWg7cGg59LdTCjAGMh7xbyg66J+qhQ9vInqonrokjyyLGW2QOre4
	+Q
X-Gm-Gg: AeBDiesvjpXURvTxgzwRd8hsJYTsWQkuvPgFtLsjvdfXAwv7bDjQbDFX0RCwAv1saGQ
	18/OyJmdr5LHQSq3YQ86uxkr6rm3fevijEdlTx1szf+jDldVrlZ/Ht4NYDJimI7FmKYt2ddFUTE
	AzflVYGDaNGzGdPldTt2WpXBgqfQF70tG8N1mzPgd8qJ0TsHVQDE3lZBcL1ZzSqKW8nk0PjKLsK
	m9KAy4FFTKzZ/X1MOPnf0Rjejk6dmLFGjRALiWP/xfTpEdNaTH1cS3mGxwYNZDKLUVdFzXZlruQ
	Rim/ALzcTJU8nf3vLftnVCGRo2+ASEY8PQWDaeQB60i82M7Y80Xd6mlyldk169YePj4iOWPN1w7
	04WiGjPrYSCv17J2y8D/8lUSp964JQXh8gvSJt4aevzJEZDhzp2XL+5VcBaSST5od
X-Received: by 2002:a05:6a00:10d1:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-82f0c29ed5dmr4540275b3a.15.1775854241746;
        Fri, 10 Apr 2026 13:50:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:10d1:b0:829:8cfb:df45 with SMTP id d2e1a72fcca58-82f0c29ed5dmr4540249b3a.15.1775854241264;
        Fri, 10 Apr 2026 13:50:41 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c52cf05sm3839795b3a.61.2026.04.10.13.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 13:50:40 -0700 (PDT)
Message-ID: <36a332d2-2963-438d-8d3c-0738ec1a799f@redhat.com>
Date: Sat, 11 Apr 2026 06:50:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] virt: arm-cca-guest: fix error check for
 RSI_INCOMPLETE
To: Sami Mujawar <sami.mujawar@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: catalin.marinas@arm.com, will@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, YeoReum.Yun@arm.com,
 Jagdish Gediya <Jagdish.Gediya@arm.com>
References: <20260410163636.259443-1-sami.mujawar@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260410163636.259443-1-sami.mujawar@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rdjRq_IkGP3ikfU5XY3M5fdnhjp5lDg0kkNz_kfKlis_1775854242
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_135046_366048_31B2661E 
X-CRM114-Status: GOOD (  13.66  )
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

On 4/11/26 2:36 AM, Sami Mujawar wrote:
> The RSI interface can return RSI_INCOMPLETE when a report spans
> multiple granules. This is an expected condition and should not be
> treated as a fatal error.
> 
> Currently, arm_cca_report_new() checks for `info.result != RSI_SUCCESS`
> and bails out, which incorrectly flags RSI_INCOMPLETE as a failure.
> Fix the check to only break out on results other than RSI_SUCCESS or
> RSI_INCOMPLETE.
> 
> This ensures partial reports are handled correctly and avoids spurious
> -ENXIO errors when generating attestation reports.
> 
> Fixes: 7999edc484ca ("virt: arm-cca-guest: TSM_REPORT support for realms")
> Signed-off-by: Sami Mujawar <sami.mujawar@arm.com>
> Reported-by: Jagdish Gediya <Jagdish.Gediya@arm.com>
> ---
>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Gavin Shan <gshan@redhat.com>


