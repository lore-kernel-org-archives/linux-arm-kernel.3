Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD611E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 16:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3/xnDJpLMBNaNxWDCIoa0OqWOlzD1iusnvOin0v22I=; b=Zns8q+RkTDsjvd4dilceElL6DC
	EJ/shJh6Gz52Q/RLrRLhfhgIAMGHMkc1+DwNeUz6t9fx3o7DnT1w2oTSWGpDIIDd8/a1NDG31GrS1
	0TRQKaSNOcAqSBJ9p7/97um40Ue7gHxSC47RWcet+wl+ESVkt7L9vWB65mhmD9yawUIUgHIalLLN/
	Jftv3+YrsESVnhLaWX1FRPoSzlxD75LvvIZ8Vpr0dcXlUHEBinO8oJt+CFEOGBDogLQ5jypOEhm8a
	yRt3MoJwBx+DW/mVF9oyBKVladJ/fJsPqoRhBREo6+u5ZzLHIb+oZ4d7UUtV0nRcjY9fPG7YCM86H
	T9BQQ2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8ah-00000004Ps1-3y3b;
	Fri, 13 Dec 2024 16:32:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM8Zb-00000004Pi0-0uUs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 16:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734107484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p3/xnDJpLMBNaNxWDCIoa0OqWOlzD1iusnvOin0v22I=;
	b=PzWHo1OXMMn8b5UThIfLYCmfmyqu0XK7mAhqRrovsNV04IEAe15/u1s6A+Pejy5l5ylL0Y
	nUKT38rIF7AimPF5E2VJ+NQg1He+2SUrCigNOjSf+m10xk41Fgfpn4WZ32ZorpWJGGxo1m
	5luWMKm/lR8LxST05bWNblqR1gsw7n0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-278-mpyomBqIOHasjf_3xBetJA-1; Fri, 13 Dec 2024 11:31:22 -0500
X-MC-Unique: mpyomBqIOHasjf_3xBetJA-1
X-Mimecast-MFC-AGG-ID: mpyomBqIOHasjf_3xBetJA
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385d6ee042eso1187118f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 08:31:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107481; x=1734712281;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p3/xnDJpLMBNaNxWDCIoa0OqWOlzD1iusnvOin0v22I=;
        b=FaK15wn7ahO9ViwcVNRK7gQNbIoLkSh10eDBpZXmAh3Fmx91CiAwC2LESihxbDUrSM
         dcJu8UTT0ivsgI9qHw2GJqq6fHCwaT2moMEusckPdwqcxxb+44Yh0x6NRdhsCQzSliek
         xLescruuZnhFZoswxZdfdixeAgJwB/WZkVachgEiyJx6syTqX3f+Xu3vyBvZhB7V5RQe
         1XOavGdJOb3m0j3Ae5ulYbelJyZNqTJcPfwLqMVJWd1SnsrSiZ0ZwYPo61oplPfGLCt9
         qhtS5tqd+2uABhwogAU+RPHpz9Tv8iCz7cielEk1aJ1BCB4VpbWNXRbvnVM6p7oAmiUp
         hK7w==
X-Forwarded-Encrypted: i=1; AJvYcCV8XPkPSzQbyZKAp7y1myzHPz8BQqVXs+pHM6VNLdJnRWARh8rXadN/Dj7OoN0PwfdCtu8ZJ6UuNKCvNdmr9hpp@lists.infradead.org
X-Gm-Message-State: AOJu0YwfdnBvp2n/s0z77Lg8v2XDTGthsLc9rZq7DXXwLzhMwfO9UQDU
	H6wi5KIwKLlFuwteCb0jKU4Ja3iBxKZw6PEwWJ7slwcZxgtib6polheJOZsP7Q/Rll3o77KChRI
	TPImVLb6GkNk/yYJ4dO8z4GLgIOu/KPRnvEt02n7XkzgBHlSZj4QkN4QHaLzChG3pTAg0yo/S
X-Gm-Gg: ASbGncuhAttTOczeb3/yDmuBCQ6JfZAXDSXVCBAXiWwazVq4s5P+dqtEZS9RLhDFtPg
	0EU7zZG3nDRS5iJgJ6a3Xqv+7tAGIdJJkyMVnAE318/Y4ojXv3pQ2oh6OdSy5i5s7weDsw2RQyw
	kK/twahzqcyNqwyIFJf4zgT9+IdNEoMt3o2WbhKYkE9tFvhlx04oJ2JGhoCYJce9j6EwTsGfDTI
	fS5uidfTDRp17UMcWwTRkq9hj4F9NGeZBAKCntOElikl1wWh6tPtNp42yd/+PlAu8mbKTLIBVTl
	mS/ELoRrrgoR0NSVtut9q7/pyYO0
X-Received: by 2002:a5d:64ab:0:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-3888e0ac6ebmr2695121f8f.22.1734107481383;
        Fri, 13 Dec 2024 08:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVFCmPFbp57wTYLAPbI8HYsB9OAwsvaj5ytvcDH1OeBZBEdtlWfwdOAOyDHVc4IIscc4S02A==
X-Received: by 2002:a5d:64ab:0:b0:385:ed20:3be6 with SMTP id ffacd0b85a97d-3888e0ac6ebmr2695094f8f.22.1734107481057;
        Fri, 13 Dec 2024 08:31:21 -0800 (PST)
Received: from rh (p200300f6af0bca008282df582fad0b68.dip0.t-ipconnect.de. [2003:f6:af0b:ca00:8282:df58:2fad:b68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514db8sm7671875f8f.84.2024.12.13.08.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:31:20 -0800 (PST)
Date: Fri, 13 Dec 2024 17:31:19 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v3 1/3] arm64: Modify _midr_range() functions to read
 MIDR/REVIDR internally
In-Reply-To: <20241209115311.40496-2-shameerali.kolothum.thodi@huawei.com>
Message-ID: <fa044f16-bfd1-7807-0810-301965e0f60a@redhat.com>
References: <20241209115311.40496-1-shameerali.kolothum.thodi@huawei.com> <20241209115311.40496-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hhWs_6s4XSqLxHgLF4Sg8jMLW2-7HWZbGnnT7TROP-Y_1734107481
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_083127_322116_1571499C 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

On Mon, 9 Dec 2024, Shameer Kolothum wrote:
> These changes lay the groundwork for adding support for guest kernels,
> allowing them to leverage target CPU implementations provided by the
> VMM.
>
> No functional changes intended.
>
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Reviewed-by: Sebastian Ott <sebott@redhat.com>


