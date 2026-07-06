Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0DAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=; b=wEUk2sVJ1OIC83qixU0NBCZ1W9
	r1nMeUMsjwbYIK53PC8OGxdTCdLRyp5uGKSxbjSSQhMSIGf6Os1Yo3nEPs0pHJlCT3IJGtkkKzX/V
	yeWusWgRCfpyjfjsQaW+/lzX5uDR1nTEwZ6YBCTXi+pt5ywht9MxZBQLV//P+0N6YRTr0HuwBVJ6a
	ztYvvQfJoGS1YS6K9jwQw18XC6MfuFqsV6U9EhavL78GuALtGs9tEf+eneFTBejmH3daHUOYJYAKs
	tl9bgfGL5lKi9UoJ7T+gbVKhoDDQfTsufftua34RevjeM6sYcdHIKgBUdl+smI5xZZIStCM8JZ2IP
	gNHjlQog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmPq-0000000D6Fz-3K8g;
	Mon, 06 Jul 2026 16:43:30 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmPo-0000000D6Ek-0pSq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 16:43:29 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cace7da66eso30438675ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 09:43:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783356206; cv=none;
        d=google.com; s=arc-20260327;
        b=lYTFkwPtAj2qS/bl+qCWXhAgeEDUk8enAPaH3EPxHMArYyEjMkvFs8tw7dBno85N+W
         cbPNOCvgSOj/uU/8OdBVkbZXlSdPVJTlfvvgQM/H/Ih/QTSVte/pWbdjp+WhgUbvoSK7
         n+b/GsjYk+i/GJRQ/f2bvxqftyWSUEEpV2H2+IXcM3ZpUK/xRBSqaEfXlbaVhRTHfwXU
         U1ooZrlk1qxypiXaK6s4wlq+Rn3gTssnhm0oBEpz8T/43QpUO2QJPuZHNdXlivpsBCO4
         1eM3jzlJQCTPtnFMvGhZPnF8KEgjOAxC2G2eLRlmXIs+kdcczNdIn4Eh+/VAw6YtAvx2
         w6BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        fh=kFfZe3nNr1GotCM1bJ+5yyQEa3b3ZzKYyYdaxFlVvpU=;
        b=GKiVyIG3Z1LmLxB/hLCuWh/6FJ12bXNCYJJQJyAfdaM2GPs0buHuhxnf1yamPjZS33
         TOli0/ZKwsCMGpBhHvEUgR4ScEFAFKM1DaOlHmnMYPz8Y9/7rzTplps7NC+GwgMNBAL1
         ioz5tjJv8DmDUEKlhfkZA4XZmrCSSJJlzI/4VMNzdC10wvbaoYA8JACwEkOPEHgV1bQK
         CenNJJzsIrGiM25Wr+WWvWRrt/G6idR83zj+YXTJgdTNuNdbkyS1UTOtH/xoJY7Z71Pm
         njXXisX11GM2Ibrpv9vqJqQOa/5pOsC+lJZV5ttB0mbXl/WdPpm1R4W2fY6JAJwYDTMe
         h8tQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783356206; x=1783961006; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        b=CizWtWJsVz0egxRs1aejHE3zZb2owbz8dFpel5xmPhe2bxgdB0UtvcIkPNlpUEqS6A
         G3sgfEGmHoTLMqOJHYhuako7UOZbeEXRjuWt4LBvjF8ZLduma/MhhPCUg4ElpoMYiGQb
         l4aVxVnT1Vpd1gvno6AkP7q/veXNG2wlcSV+91PcjKd0mWzbPCiKYuLICHVzk1dlQL3V
         tLDh/i1c1ErxRoTYNPCnZ17GyEK/qAN7dsiCzmkaH/hxYHEhl+zdnKJlhXbl3u/mHXSD
         RCusHzClCAIDQEHzgTzBhbB0iSvoM19+cP5aZQM3shkoKXgI0+vmqKbA4nP1YlcQKdAS
         gYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783356206; x=1783961006;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AUlAAYq1P3NlBc7es7tK425G79dZYYxCv/As82Uw0UE=;
        b=tS/QG2/Ie/2V56SRIaPzUKgHSJYeH8VsTwQBY7KGgdO/1PS6esBgxXsZyfZD/BDnHm
         OFP1dyIuA5aDZZ163CGXfhs8ZjVBjvFvSbDJ5ZJA0IY/vEsnIn/mxqdZlHYYXLge4EY2
         bb8viXLnS/vum8/pXPvunPOPcO/ygTKJG4ZwosmNKNhZfrSoJJ+E/QPknLf2h59QJoON
         oNKS1QQg+1TCDz1lfPwHOacG8NGC77Bcgror+tiTYjh+t7sL+enrDxntbM/JdSZS6d1R
         lyLKsESRqP80Pce8vPLrvmB6E2DS8fuP1xm5/LkysKN6hdAFNL0R/pHOkJV5HTW8nL0Q
         RN/g==
X-Forwarded-Encrypted: i=1; AHgh+Rpbr9/Q2PezpH+frVEcsHoYbFAmlPy1B9S8Vg+jJtr3uAyUr6Q6h4OEyXz0gUx4nasJ7kWZJD5hwRUZN0Zuxd9z@lists.infradead.org
X-Gm-Message-State: AOJu0YzhnzzpeKcs9IXhLgUKDBqEj7CpGvSwsLbSVXvXoar6nev7HcPP
	MXG3zJCTop9bWdLXyy65nJiyBWQi6yO87CNxcu++96sqN/xVJJ6wuD8wLOqReF6Z4J0XDMMTuQd
	nuzy9OqxoF3ciZTYO8kFvjy894futOpYDxln/DYh+
X-Gm-Gg: AfdE7clsscQ5SC45xVgQGV7awlAv1bo4yl4hhZCyu3X25n2Yy2Q4zWHXruhWoMC3FY6
	Uc47ZTIxKZpIG4Pw9A35EL+WWEzT90j5OCxmd/UDRXF21YwaFiJcbfsKc6dN9MPVxOO4mltEOuE
	L8urXMzdLrCVSW7sNtFLWQh09rJ6QMxJerHKmJjx9bXy++wbi0TCnZNdH80UTrLb1Tv8Q8qd+su
	CUs82sb6hZffgYDAv7J9lmuNkCcfGL9D6d+jF4fTlsX/8MI8RXXJAHhRi0RvIGHzIA7+2+Jegou
	lKX2r+kshEFNQahaNZYvMwiOxaMO4fRsK/V4jh2BC1rtTzqla4C4uKX2ERI=
X-Received: by 2002:a17:902:e5c8:b0:2c6:90ec:f601 with SMTP id
 d9443c01a7336-2ccbe50a8f8mr13298475ad.8.1783356205420; Mon, 06 Jul 2026
 09:43:25 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 09:43:24 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jul 2026 09:43:24 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260513131757.116630-27-steven.price@arm.com>
References: <20260513131757.116630-1-steven.price@arm.com> <20260513131757.116630-27-steven.price@arm.com>
MIME-Version: 1.0
Date: Mon, 6 Jul 2026 09:43:24 -0700
X-Gm-Features: AVVi8Cc7UELd1-7ZAYEyOZ88G8y7OqpaGYaDp3NNsXOnmH1AvIzaHGeBstkVLUA
Message-ID: <CAEvNRgHTu5ZDAamO_sXkqP3V=_5MhFjdzTYmJn4i=a9ni=9tfw@mail.gmail.com>
Subject: Re: [PATCH v14 26/44] arm64: RMI: Allow populating initial contents
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, Lorenzo.Pieralisi2@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_094328_240793_92265B66 
X-CRM114-Status: UNSURE (   6.02  )
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

Steven Price <steven.price@arm.com> writes:

>
> [...snip...]
>
> +
> +static int populate_region_cb(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
> +			      struct page *src_page, void *opaque)
> +{
> +	unsigned long data_flags = *(unsigned long *)opaque;
> +	phys_addr_t ipa = gfn_to_gpa(gfn);
> +
> +	if (!src_page)
> +		return -EOPNOTSUPP;

Came here from [0]!

Sean recently moved this check to before kvm_gmem_populate() was called
and returned -EINVAL [1]. I think the rationale would also apply for
CCA.

[0] https://lore.kernel.org/all/114e2488-97ed-4740-a8e8-1edd991f26c5@arm.com/
[1] https://lore.kernel.org/all/20260630213711.479692-3-seanjc@google.com/

> +
> +	return realm_data_map_init(kvm, ipa, pfn, page_to_pfn(src_page),
> +				   data_flags);
> +}
> +
>
> [...snip...]
>

