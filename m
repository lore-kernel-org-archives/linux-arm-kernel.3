Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFEBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wZWBEhc+7XW/jxCHi0HvycEodKoaIiK2HmKP8Gx3AQ=; b=BS80xgb8V4BQ5daU812ozW5IaF
	FzX9qRORGuOA2jNmF6P50kb/WAs85zmZP8xRWTJhkZE98fPYy/sFztSSNNxfewCNFdbUi3mzL+oSx
	WSikNW4yuEQe466jyfDN0OMQ6vu9nyRgpn1igkIRINO3aU3+/Bn1sjCrGyxpN5eeil3mThrRM9Q3f
	9b+XlByxXB00RJKOAXFAiaiW+IgNQMY8lfPcCYRCb+AI71yTHED/pe24Wb21oQhBy52kcHkunK/lj
	dMKZgBB4LJwM6xgmFvewsdM0IyIu5/rRkXGzbb/OYRy9qGikEgL6J/zKNZc1RNzUJLhbhU3URQCoY
	SfnrszWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0EP-0000000FqRY-0OVP;
	Fri, 14 Feb 2025 18:16:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tizaC-0000000FjUw-2Gt9
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Feb 2025 17:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1wZWBEhc+7XW/jxCHi0HvycEodKoaIiK2HmKP8Gx3AQ=; b=kReSjhp7lg7D5b7YH8Yj4kK/xZ
	M0Rr/02ZOb47mukUGdX5NbukBhVL/nTbdwXzM9T0edNRL3IiMgh3v1H5LvUpLVGVDlVaTotc1N+MF
	UadeXKRz8sTNMoZUBje7cuSnjAW0MH6uC/TMDy9Aw0SmgN/GR2tPvPSP/O94aOnjF08+SnfKTINKK
	dPQ35wVlo5cPBzv35RHvWL6v7RIk0jMZPFxpOww+uO0P9QWgHR+FrhDl0X6fhH/STqQZeJXIF80JT
	OMzm9aloHFLP7OTuSjREkQ0IdNLRwBcT4iL1YfU6CAk+Rs1c12hBLvn0ek7uY7HQJQgzjYM+v1Gfu
	J3eSxotQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiza8-00000001Hur-1qhn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:34:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739554465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wZWBEhc+7XW/jxCHi0HvycEodKoaIiK2HmKP8Gx3AQ=;
	b=GyLGMU5La87E3vgLWHZzb4g3NdVXQtdziyYEoVZxejqmkcNx/++88LUYRz3UIECu9j+fS7
	bxDzmZyS4ZeYzQz8wHcLk+6o7/EmWjfaqPS5xMSNTKGehkyFrzNmWXuj8Hi5dhD2QqMuCY
	196a3Uwn67SKTh0otEGGu5SX6lKP9rc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739554465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1wZWBEhc+7XW/jxCHi0HvycEodKoaIiK2HmKP8Gx3AQ=;
	b=GyLGMU5La87E3vgLWHZzb4g3NdVXQtdziyYEoVZxejqmkcNx/++88LUYRz3UIECu9j+fS7
	bxDzmZyS4ZeYzQz8wHcLk+6o7/EmWjfaqPS5xMSNTKGehkyFrzNmWXuj8Hi5dhD2QqMuCY
	196a3Uwn67SKTh0otEGGu5SX6lKP9rc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-369-1brIfTPgObuADSD-sIidtg-1; Fri, 14 Feb 2025 12:34:23 -0500
X-MC-Unique: 1brIfTPgObuADSD-sIidtg-1
X-Mimecast-MFC-AGG-ID: 1brIfTPgObuADSD-sIidtg_1739554463
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38ddba9814bso1514372f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 09:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739554462; x=1740159262;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hV8JhFPYcrWWOCZKVjI7/hmlqDr4nhneUKbFw+hGcGw=;
        b=nRc46mhRgolbOetbHHZ0EJ5qieZT+my1+nYAK8dHuQQHFsXpCquGVXuVCOndJEQTlt
         fbWlphtSwfesKXr85B0+6Pj0Am9hME7m37dp9+l9mX8sg3E+4j3dqulTy92J0NkwhTza
         bdMFBip9OUUtBy44J2uDwX16BD+bx2/ZwHCGsaeGE34WYG9QipWqyyoCFjAPZp5Yx5H/
         9/vHL3EFMM7lv1BVbNRSUOHBhPeHAc6UxIMcLH4QHZxoen3SUmClreWSx9efha12lh3M
         awRpAyUq3N+yCnywWa3gCcs8k2IkZoNmkuTAYB820iEsjzgfE/FfAg+0ABFrdsDWwCXj
         TTSA==
X-Forwarded-Encrypted: i=1; AJvYcCWnJtO52IN06bthdnlQJwVtY1IgLqUu+oelr22Mtqts2jZ8HKR8zBV5IqqfiwtbYGDrTEOtaS7OOOduSeC2CAI9@lists.infradead.org
X-Gm-Message-State: AOJu0YziplrVBfyyhcRboV28B+P0gZ9hQKegfXun/UdzxhWfAj0qC5wS
	MJhBdcfHXBm621mDldJKSRx6+d0p2lRXuMp5Scdaxlcnr0L25lTKhCOzdQESyHhzyXaYivB9TdQ
	haheJN95QvOdEF2DSyRTk9U/Smp5yr9v03fp/3FVsf6K0SdGAHKdsjKs6573p2fi7fhdLePIn
X-Gm-Gg: ASbGnctiAvr//QiQcoItcyg/OAPqmf1HX+wY1XPgl7+ko1TcBNLNVjKvBGvqYyTRPkX
	fH5Qs3H5dmqNPIHTp0nqC4M8FYw6v90KSdIiKvkqS9mmeueyd2t/xAxWCq0g6edI3EL1hOe1LiH
	MTd6NE0x6SnZNYYE1gK6fvA36Cg+cHxm5yIOuEejU46dONcxMTUz0wAyFPpIeY935/UyIHI2Sed
	BvX6BpQua6zekpkRpVKNO4NlLnbdtOAHEEsArxy3C6p2j8vRmCwM57buk5pnihRArXSLabNAEMg
	qYSs0dzkSD2R/S4TEdqpQm5pMsxPiOYxSgjYH0bDMCA8hOChNA2gSg==
X-Received: by 2002:a05:6000:4008:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38f244d648cmr12747548f8f.3.1739554462560;
        Fri, 14 Feb 2025 09:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHLq9R9sFnDs+J8hpOwo9gOo3BsH3NCojh2IMq354S0SwWU05YmSPCHC41tpgN81o7+Z7dgWw==
X-Received: by 2002:a05:6000:4008:b0:385:ee40:2d88 with SMTP id ffacd0b85a97d-38f244d648cmr12747510f8f.3.1739554462192;
        Fri, 14 Feb 2025 09:34:22 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8115sm5200049f8f.92.2025.02.14.09.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 09:34:21 -0800 (PST)
Date: Fri, 14 Feb 2025 18:34:20 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev, 
    catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
    cohuck@redhat.com, eric.auger@redhat.com, yuzenghui@huawei.com, 
    wangzhou1@hisilicon.com, jiangkunkun@huawei.com, 
    jonathan.cameron@huawei.com, anthony.jebson@huawei.com, 
    linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v7 0/5] KVM: arm64: Errata management for VM Live
 migration
In-Reply-To: <20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com>
Message-ID: <0ea00cd9-0cdc-aef9-7a3f-f0101295e03f@redhat.com>
References: <20250214151343.61348-1-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Bb1BMsjAmKnS905WDOQRaSe1kIfgRO1vEmxbi8aoqhU_1739554463
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="-1463806286-568075231-1739554461=:19562"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_173428_681955_367C09B8 
X-CRM114-Status: GOOD (  10.04  )
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-568075231-1739554461=:19562
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 14 Feb 2025, Shameer Kolothum wrote:
> v6-->v7
> https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/
>
> Changes:
>  -Introduced KVM_REG_ARM_VENDOR_HYP_BMAP_2 register for new hypercall
>  support(patch #3)
> -Added selftest for KVM_REG_ARM_VENDOR_HYP_BMAP_2(patch #5).
>
> This can be sanity tested by the Qemu branch here,
> https://github.com/hisilicon/qemu/tree/v9.0-nv-rfcv4-vcpu-model-v2-target-cpu-errata
> (branch based on Eric's/Connie's NV + custom CPU series)
> Eg: to specify target impl CPUs,
> -machine virt,.., x-target-impl-cpus=0xMIDR1:0xREVIDR1-0xMIDR2:REVIDR2
>
> Please take a look and let me know your feedback.

Reviewed-by: Sebastian Ott <sebott@redhat.com>
---1463806286-568075231-1739554461=:19562--


