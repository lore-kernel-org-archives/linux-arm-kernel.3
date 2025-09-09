Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD3DACAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TfxcLFfDrPkIJiNUWhVN3N4fK2AjPT82pZU1A16szcs=; b=jrdX3V4/lVJZm2DUn/mkxcJfIu
	NTBKYoQRM5ZRTEh5co0biiVYXguqLXb4cEIaukolA73K2Xtd79KPs4suDBc/+uqIsj5VQrF4BQb/i
	p+YE5JlcQg5HND007zOibHmCSZ5CxJ7QptaOlsWnCo5+9b7kbkhXgc5ScGbVmU4ANz92KVpB5q3IG
	u01Xt/LquirUAlhsgimXoMUmtNdJm7tJ0RvWkVZxDqB5TwxQY1Yy8vOmo0YFle3Q1X06GGsgmZ+ap
	TohuHG2amVOymz8PVZ+H2D9E1ByYgWU8Dk6DXhED6MGSLezp72JV1W8xdsqeTFoY/2QtX5N/+ndWT
	+9PsWq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw37Q-00000009R2r-0Vxp;
	Tue, 09 Sep 2025 18:31:04 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw37N-00000009R26-2xPJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:31:02 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4b4bcb9638aso80161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 11:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757442659; x=1758047459; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TfxcLFfDrPkIJiNUWhVN3N4fK2AjPT82pZU1A16szcs=;
        b=Yiq5EuJukWIIoutxDaOAEHnDkKPww4qh3U5sG/JbwdiCs1IlAroe8oAOoZbnbKIjuZ
         4og7rqjoLd01vBPutPlPOUhdErowBMxMIKBFhPmytpkuUaQDiVixmg3BmSiIpJPh8wVV
         DEnY8dbFmlKBxbZe9RZAvCiEe/JHX8+oBEZT/cvoGaB7vT6MlqsxZRJL9DpPxwJlyV9x
         b+NLatiuFSc/C7oC0KkS8GNcUE/8QNNlkT0SBACKrBoig9HUTrRuyXz3guzcnOdZUGRd
         UKqeFOioIBC8BibgCNYzyKyFCLEipyisoye9kZVq+KNy12pGe6f30IabgXVFNvzeNN26
         AyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757442659; x=1758047459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfxcLFfDrPkIJiNUWhVN3N4fK2AjPT82pZU1A16szcs=;
        b=OQ81M7yfKO/PTPfTlxI+Ri7VmvARCTGMb/W09qFxdDXFRJGOm5VNOaGWFjvYpFoRQt
         vBk3mE+J6dRL5XX3FvzIGkqov0UsRM4PW9j3sfzRcZ3WNaVJUHXPULoYXt8BJLoRSsPO
         F/AayEMrkV5Tl3BurJ4pR8Oamnr3jcwu5C5vyolnvcGqcOJ2U7IpFabo5i8eiPshzoRq
         CW7RUGNUokkTeSDd1LrPaWRJs/ge4tHS5nNp4b8Chok6Es1Y1FoRYRSrePLp6fCWZH1P
         YUzwGL/nRTVj0FpcMCyWZBVKc2tZqoW/+HXRLfjm/1TOpKCQ9RIf/bpUsy9Kwp679Hxw
         v3mg==
X-Forwarded-Encrypted: i=1; AJvYcCUufkghMgfuobkFRPm4JqftkQutN+ifEZSAPqQgjJHG/xqmx7HN+Y40p6LnDPf/+3/mDGKhk2MxklSETvcPRpJ5@lists.infradead.org
X-Gm-Message-State: AOJu0YwXaxBT+hmWXmeARGAaXxtcE6a0qBuzO9y37k1xO1wxDV3FR0sU
	m6lPFJ7wA8gr/dhJsULX83rQ3JOFT2vkzdoBXuUQxZNZ3ZKZ06AghOFW1f5z60U7OKXSuF9Kzc/
	fM+tpztFhCVY8sWFsQ8u6j9huXA/T9nPxFWiFgsEM
X-Gm-Gg: ASbGnctYXqrDN+hds9arut41rTcYZ0uuNtzeXolIVQkjaJT/V+uk5R6dHQNsFsjxs8/
	+KlCioJ7DYnfZwmQxqXLh2AQIboDbi/sCYxkyfn03TGtck7oiCokL7BQSX9zcR4vROROAqq3R6d
	mIJ7tPKMmGMwZMEod9z3LQajQCPTnaXxC01WVbuATAa5LUGfhs+jwT5BqKjB8v+dDjZXQ3qRVeL
	tZCGw/sSjxOuYg2/NEUcg==
X-Google-Smtp-Source: AGHT+IGf+Q8hPzzej9xbfaEr60LoJgETjDgKDHy0ML31wiaO21T7Ktg8vRU8pvPgmGyM85KMJM70NWIugrUwyx3yAfE=
X-Received: by 2002:a05:622a:14e:b0:4b4:979d:8764 with SMTP id
 d75a77b69052e-4b62569f89bmr232071cf.19.1757442659042; Tue, 09 Sep 2025
 11:30:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250819215156.2494305-1-smostafa@google.com> <20250819215156.2494305-17-smostafa@google.com>
In-Reply-To: <20250819215156.2494305-17-smostafa@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Tue, 9 Sep 2025 11:30:48 -0700
X-Gm-Features: Ac12FXyo44kEPGnZiMSM0NG36OMtjkd65ZSJDU9pCejgoL2I9Mvg7O8L88TNYvU
Message-ID: <CAE2F3rDc-4SirDDrQeZJQDqjdv67-QFfQhHfwyd+O6f5OsBSpw@mail.gmail.com>
Subject: Re: [PATCH v4 16/28] iommu/arm-smmu-v3-kvm: Create array for hyp SMMUv3
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	robin.murphy@arm.com, jean-philippe@linaro.org, qperret@google.com, 
	tabba@google.com, jgg@ziepe.ca, mark.rutland@arm.com, praan@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_113101_746924_B5AA0C43 
X-CRM114-Status: UNSURE (   9.30  )
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

On Tue, Aug 19, 2025 at 2:55=E2=80=AFPM Mostafa Saleh <smostafa@google.com>=
 wrote:
>
> +               if (kvm_arm_smmu_array[i].mmio_size < SZ_128K) {
> +                       pr_err("SMMUv3(%s) has unsupported size(0x%lx)\n"=
, np->name,
> +                              kvm_arm_smmu_array[i].mmio_size);

Use format specifier %pOF to print device tree node.
If mmio_size is a size_t type, use format specifier %zx.
Align language of error message with kernel driver which prints "MMIO
region too small (%pr)\n".
I'm wondering if we should use kvm_err instead of pr_err.

