Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5124EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZ8WmE2oVMcuY+D5rgASzXIuAkJx2FsjYv4FOWBBAgs=; b=ZZOSfzCYemLQwyioehhDDi6Zaw
	stHV54izz4t56ElA7h6mULhLNuNDIbzYxn3ktWii38+/K6n+1gRpsWsEUT0FWAB2zfJteuG4DT1/n
	VE1KUWjFzSO8ZbPBM3n3ryY0aVbQRRaqtwAjnRyEHCq41ZzT6CSg0lddTbRC6LRFNN4UX8/LYtXRg
	oLukq05PP8+/1SsSrPBx9AHALo/daF4HsxLpxxGZFSpBvAmDqxSxAc55E/rZDfuCclMYhbLpGwBh+
	HwLtE8WHUD4AAtKUBrwDayOk0YkEfLhw/cbk+9F38inxiTcTT26oWvyij2C/uEyTIjBkJ58JiyXD+
	FMziv8OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMnU-0000000Eyze-33vF;
	Wed, 11 Dec 2024 13:30:36 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLMmQ-0000000Eypb-3vis
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 13:29:32 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso637800066b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Dec 2024 05:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733923769; x=1734528569; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pZ8WmE2oVMcuY+D5rgASzXIuAkJx2FsjYv4FOWBBAgs=;
        b=Aj8n02mVGBIJKiiAQRHJyhZkZHueLnc+rmJcacI1XHfnWSs4om5/3B95PPXLW+z8te
         EQgzNdx3/BPRxnPkBzHWvGi1oMH92a7SdCsh0Wqcz/DHwMdXSyYhUnWNTinZ0lTkrH8O
         jCTZ+CfI1znvXPcjV0hvUHbmLrjZppKE5ss/hS4xmMd/w3uCksi7pGqL4ARx2Njvkpbk
         BgIe2IcyxN0BXziwRtq9VqGr28y6d9rqmhU9q1arK9XNzhb4VKWP5ANexC1FhM3PvcW0
         ut9+PItI3LzyuuJuKUOXuQqgjZr1gd0EeXOa0gK5GosfXuQEPBR5v+BZSfbSMrBVfflq
         folw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733923769; x=1734528569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZ8WmE2oVMcuY+D5rgASzXIuAkJx2FsjYv4FOWBBAgs=;
        b=jH4y1ZO8CqIlzbzk3xXmXDkGW4mji+IwZTKxGiU/ZZ3TkIYb3hZJgOws68+8otE+KQ
         JSCAiuSUwjco7N9+fItZtfAzBnfdQad3zje9IEMKFjmMvYOIWBLD7jNTunPxrh2K/zEG
         acG0EW2mIzrrKmFyAge3ri40AxmxoKf1pdXO8zhIL99+PeNd2RRD5HKlSdyvjdslzwTu
         uf9UU/nc2H3g4UmGQufeAiHQo8p8z41kTfw0ILe226Wc6dRHgs7zV18Xc39wD8vcqf4B
         OlSyEf08Fb1652aeb/tFAXtXWmA4aeLlFbpRrvawSWGfCIvEysGerxmyZ4qT9EUqNgmN
         0jSg==
X-Forwarded-Encrypted: i=1; AJvYcCUt68FFC5GKgwy25QnZXgm4oT5SrZoRpm4KTM3eA90E6JoPDMtEQsH9O4IbFYDkENHIvh5IQIipDSUqq4htQDbW@lists.infradead.org
X-Gm-Message-State: AOJu0YxoLQoxg+ulPF/6kqZxOL4mvLk+qKsvX+r34WRiCmQygoZsX63F
	xH3a3YqhxTv0zC0WXcO/Ip5YQ5rztpzWKtPa87OBAQQLOwsTtrHg20JHId37s0zJp7kUg5dJ2Nm
	lkzB/
X-Gm-Gg: ASbGncsGNI3bi9cCN0EEPOWtAZhAzJ2RzgIEAoOrwbg2jlGF+4CwUM7rdeVYk+ryLBI
	EmFjlS1AffrPIGDU977bIAHQIs/cVRZijiiVF5Xu708WjDnEY9TvJV9uCdN38I6S1jmQ0yUKMDm
	1xLBiHU/5+Rs6rTuHETgtjbF10IMAa7LTwIYWoAeXN2U3WuGr7fk0/9KnoHNl1gWwSl9iSH3+z2
	/bHowqdokmYRFByjb8HuL5EnCp3/uJV5L9Ds+qSalAgKyUwqBsY9RTJQPyAgP5d1AywukfQOv5A
	RQ9vfADFm+ar
X-Google-Smtp-Source: AGHT+IHHtuhS5qRK2Vs4YR08EkU42S9jU4/gGJNdMqiKWPhEwaUH1bEnXVsl3kwAZG7CQUix98OaLQ==
X-Received: by 2002:a17:907:7703:b0:aa6:74a9:ce6e with SMTP id a640c23a62f3a-aa6b1179ab6mr244042966b.16.1733923769090;
        Wed, 11 Dec 2024 05:29:29 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa685669acesm483241866b.189.2024.12.11.05.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 05:29:28 -0800 (PST)
Date: Wed, 11 Dec 2024 13:29:25 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 04/14] KVM: arm64: Use KVM extension checks for
 allowed protected VM capabilities
Message-ID: <Z1mTtS9nGvVM-BIq@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-5-tabba@google.com>
 <Z1MwAomiLhnMn--k@google.com>
 <CA+EHjTy6Y6w9RyU2Vn8O+DDviSJf=P-Y4c+xVFqY-3GmHBv3kQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTy6Y6w9RyU2Vn8O+DDviSJf=P-Y4c+xVFqY-3GmHBv3kQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_052930_976794_D59726A3 
X-CRM114-Status: GOOD (  16.36  )
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

On Monday 09 Dec 2024 at 08:14:15 (+0000), Fuad Tabba wrote:
> Hi Quentin,
> 
> On Fri, 6 Dec 2024 at 17:10, Quentin Perret <qperret@google.com> wrote:
> >
> > On Monday 02 Dec 2024 at 15:47:31 (+0000), Fuad Tabba wrote:
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > index fb733b36c6c1..59ff6aac514c 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > > @@ -329,34 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> > >
> > >       bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
> > >
> > > -     /*
> > > -      * For protected VMs, always allow:
> > > -      * - CPU starting in poweroff state
> > > -      * - PSCI v0.2
> > > -      */
> > > -     set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
> >
> > For my understanding, why do we drop this bit?
> 
> Since the hypervisor is responsible for the power state of protected
> VMs. This should either be a separate patch or I should explain it in
> the commit message. Any preference?

Gotcha, perhaps make that its own patch so we have a commit message
motivating the change?

