Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6502C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 17:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n15bf8E4w81YIQXcbn52KewH85spv07PWBoufUb1/Zw=; b=TXVeBih2J3ecl3rFsknWzUYfWY
	xns9thzmIvJM668kb00H7f5ftBQ5sTdxjD1rcCGvYw27sQX9QnADzeRKMkLTR4QOwBw13f2TsH8sf
	66/Eo/bcnqi8t77iWhoBZ6SvhYIVntR1JLDDSNKrDbjnFN1hnI8/F0CJb/5SnVHVS0yfZrXEBvtnl
	jpGBwUbCwW+BaNYfrwI8eRylW7PlwuZGGuQuOJs8AIo59o+DmtNhe5m3htYerc/OXsDy4X+f6WbZc
	sGj+9fQNx7+G3HdpkFDi9umr7Z7Fddwlc1Joz8NOqlbh4D7xHAmkjvpHi0nYY0dPc6Ol+3uVWKoYL
	aqQAolcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlAYp-00000002Byy-2FBw;
	Thu, 20 Feb 2025 17:42:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlATa-00000002Ah0-1DU5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 17:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740073000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=n15bf8E4w81YIQXcbn52KewH85spv07PWBoufUb1/Zw=;
	b=MYyvorWmWManwk1iS1Z/eBaLHsRdX/RoNBHai/2bZKkW0n8tNb6pD8WHlN3Hsx+luK6BsC
	oz42lZA1vzLXayeEFYChp7vg9WkdElbef2cqlJsjZ8PsetMUASfu6nyIRCRtBjA152hfuE
	MeGkqLOv/ZOkOimLe20PsELQ6uQ8Qs8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-u-pQNiezMm-fbXRvOABG4g-1; Thu, 20 Feb 2025 12:36:38 -0500
X-MC-Unique: u-pQNiezMm-fbXRvOABG4g-1
X-Mimecast-MFC-AGG-ID: u-pQNiezMm-fbXRvOABG4g_1740072998
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43935e09897so8880225e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Feb 2025 09:36:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072997; x=1740677797;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n15bf8E4w81YIQXcbn52KewH85spv07PWBoufUb1/Zw=;
        b=kIJpUTz/prClwjxf9PN6v0FPTFlmVprWORZA0UyjFtiY/OXmYdYwH5FXsq3lYkjirU
         rwNBzpDbdpne2097a70kBusQAvi90raDRBBfGRpC940CmiM3C+otnYBQSJqMW8sJ+CHP
         1IjU3UM0+QRc8OJkXV5DnUwO1PQ6hqCLZUwgaKMnpxjWwwEph3xXGHiADgKsVpmxhJda
         TzuQmDitJOmk2CER7T9dsHU0VoJ/qJQPOESmrBVQg8ZBy41l6EShAdEJ+0cFhWieekb0
         a/ugV9oG60lo8dNxHLgHqO9ypOI+XmxOkRjNyJi1hwUU/sh4e+DnBEebr2Bcm1Sz8E+S
         dPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzo+3rkMziHODBFA7qexWlZlbaCQuL63mLysokWKwJ+EoWmNn0UKcs/juzDYau3cLIMLSmxVpQlRmYwbvoJciu@lists.infradead.org
X-Gm-Message-State: AOJu0YwE7eOsV+/lIdlxkh4N53k2cjG7sjlA9SXgwZLbCYS+1XaOQjyP
	lJ04Bh3BvRgG4k3yK7EtMSthR96NAIDRXGF3FaJQ+muAq6vsfYQuVzoAGMv+htvOa2UII31TOKZ
	U2ZtDejAvMZKyYnN5TILvYgDrx6MaWO+Jq2VkYaOqcDBOcl4IhnhyX9GnbEgGhT8124Ql9zAs
X-Gm-Gg: ASbGncuIlLpy4PCNVOJMHCik8MpyxvoLcH9wolzYGD54cU1y1yr3xiDYM7M08WPt779
	r/iaxulwM7d7XmAR/Amg0VFQec0OSn76LVwLItgAq6DEiDfhofe5yE+MX/MAp7iYIhjcR8w3EwW
	jNeUkTsIRuQ7+sfNKtVd4+Jk5a2afcELnY2tR1wBMHmNgGrJ9ilIG5n1eCkPS6WQgvqbYMczECA
	//k2zpYDFwfqq2w3tyvJqcq+kJdg9gasG11mJVTSJLFtC3ypUWEYz21nPE3Abr0jURi3ovShjS+
	FWurhEb76wKt+C813vEq9FhSt+ZM96aitlAG75KrInmgXtK6NirahA==
X-Received: by 2002:a05:600c:4e8d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-439ae189b90mr2045225e9.0.1740072997619;
        Thu, 20 Feb 2025 09:36:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHy5FnqR/8AjjY8RLPAgdr+NGtk75Kqe0crbyEx5UtstYLGj4EGzUk8OPNUhCk+6xcuGov9Tw==
X-Received: by 2002:a05:600c:4e8d:b0:439:643a:c8d5 with SMTP id 5b1f17b1804b1-439ae189b90mr2044905e9.0.1740072997264;
        Thu, 20 Feb 2025 09:36:37 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398872fa85sm117119635e9.28.2025.02.20.09.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 09:36:36 -0800 (PST)
Date: Thu, 20 Feb 2025 18:36:35 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>
cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
    linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, 
    Eric Auger <eric.auger@redhat.com>, gankulkarni@os.amperecomputing.com
Subject: Re: [PATCH v2 02/14] KVM: arm64: Hide ID_AA64MMFR2_EL1.NV from guest
 and userspace
In-Reply-To: <20250220134907.554085-3-maz@kernel.org>
Message-ID: <af16f5bc-4300-54d3-b480-c559ec070a44@redhat.com>
References: <20250220134907.554085-1-maz@kernel.org> <20250220134907.554085-3-maz@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ALhjylGKciPfaxCrw6fwzgrFv_gLq5ZOzk5TbBrsWog_1740072998
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_093642_394530_4BE86802 
X-CRM114-Status: GOOD (  16.50  )
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

Hi Marc,

On Thu, 20 Feb 2025, Marc Zyngier wrote:
> Since our take on FEAT_NV is to only support FEAT_NV2, we should
> never expose ID_AA64MMFR2_EL1.NV to a guest nor userspace.
>
> Make sure we mask this field for good.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
> arch/arm64/kvm/sys_regs.c | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index 82430c1e1dd02..9f10dbd26e348 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1627,6 +1627,7 @@ static u64 __kvm_read_sanitised_id_reg(const struct kvm_vcpu *vcpu,
> 		break;
> 	case SYS_ID_AA64MMFR2_EL1:
> 		val &= ~ID_AA64MMFR2_EL1_CCIDX_MASK;
> +		val &= ~ID_AA64MMFR2_EL1_NV;
> 		break;

This would cause issues when you update the host kernel while keeping the
guests register state. Could we allow to write (but ignore) the previously
valid value? Like it was handled in:
 	6685f5d572c2 KVM: arm64: Disable MPAM visibility by default and ignore VMM writes

Sebastian


