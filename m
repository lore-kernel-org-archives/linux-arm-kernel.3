Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DD5CEE334
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CyDkLmPEbdh4EVyfKiiEMb3jmOinKJvABWPtOOckPaE=; b=LlSZYVesEoT5ul5CP1963OAiNu
	jM2FKiXh9NhuyGO/EWHlqVslj1vjqQkGOzkKEhSsWNRwm541ctYD8H2EUbFhoTPdSDQFxO47fk8al
	1nXakfbRDsQwpMNhWgS9Gr/fwtpTd7Mczafoex0P2ebQ89nyVQLo8IZ2O7fCs1JBF81gJWpIyiw3T
	ismbSGs+ej14yFgbz0pGgNA+Yp8wtdNq49Q5KsZGT0PNa3119kI4gwexgrOzmN/GIw1JjBQekdQk6
	hURZOIve6ZwYFWmPQ79ZytO5y4ihmSGYhhJX0052c4Y9gK6bKIEgngComjr35dWMy8wZcnW1aAU97
	IWLPWNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOjI-00000000lHX-3u2b;
	Tue, 18 Nov 2025 16:38:56 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOjE-00000000lH0-3mlO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763483929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=CyDkLmPEbdh4EVyfKiiEMb3jmOinKJvABWPtOOckPaE=;
	b=Aj361unl225TflpmJ9ZFUZQ4YwS83w75CcY6mRNWKjbX+MXJCPqHPIizQYAV/f5DS2rk3P
	ckhvMF/C677p6uLheePo9pUcCXZTjt+FBEojdm0g4Uq1O2RuSBE/CGekFBcVnHwJ65va35
	wDhZRojB9hZZ7THHOX4DrmLbcB5vgsg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-eqk4kvSgOL68BkcPajuwkw-1; Tue, 18 Nov 2025 11:38:47 -0500
X-MC-Unique: eqk4kvSgOL68BkcPajuwkw-1
X-Mimecast-MFC-AGG-ID: eqk4kvSgOL68BkcPajuwkw_1763483926
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b736dc23d6eso383772166b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483926; x=1764088726;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyDkLmPEbdh4EVyfKiiEMb3jmOinKJvABWPtOOckPaE=;
        b=iu6hg7EzCHVLVUHHRnu2ZfbZ732MDliTATsvI4ANMUD+yUHpyO5OTXru0V1TKGbLvR
         QcDz9kgqViDcgoCpO6lZ8fDpxfAUgdcQIQoOSnkDPO+tH0v7M3bjnCANYVR7/3DbHFio
         d6EHVeiDwYL4IU5k0UaQk+GqZPHMAMPDoheIR82N3eAAFCSAWFV5ehq8QtAG+rGRX/uJ
         ZHpY72NdAbJ++aVE7M36IlZNoDRYRfzaHYJ9oSr/BJZpxzTR3PjdImUTpf4gGWcp3RC0
         MzbFd0qPjctWM6HlgFb8dQiDCMEyWNYp05FtnhyORYUmDM9Rau70m822YcW+PjFyLqSC
         PJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9gSBNAig/QOC0dDE0rRjAXk4UKaSGMb+2pprliQ9YNDEHE2QO440hgiSIOcbJ2PN0ZMue3FDDGvY6CB4OWwyi@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqnb895puFPoAYnJC6sNIlYzZx+bJ9fu/HpzFylPgusP9zUW7p
	mHLpFysA80fa+LDMsGY3D/+I4O92vW12hVLzBVwoeDl7chmk2enjg81tnE6rA5yMfyRvrIBfZib
	4AEsNckJ5g+sCkl0QfIdUXiT8/fDH3s0vidfctxZeJAZ4RtHhxOj/7rtSeQcwyx3DCEZu4K5drw
	ar
X-Gm-Gg: ASbGnctZRNDfqAaTod2ohBGY9TchA8J3mfZeRMg92tGnKkDxiqNj6TE5B4Ow/phAp2W
	7N7t/mAnVYNqU5Q4MCPytlrtY/5SPJdXuA800KP2JMTf1SoZMkikTWgNqEDgJ2HF+jdQhuxJ532
	uyvO5DOnXx1djrlPfHym4TEGH+RU00DQZynJ4whqfL+dB0xVlyulAD6YCENTrF1KklqlvBaFMVu
	7yPxAvJwR3K2kZUsY3Y77coftEKtNfShxmcZ/UmqcRbLh03+29fy6uXdCaw7vlbRX6wOjwSqaj4
	OHxkQgf9TIKlgB8wfXemQqo2V71wxeeqHh4WUaShiAsvqTyIC0TNryTJCqwcnqqWVCplpa2Sy2E
	PU9DvVOd5Y9xGW6b9b6fs3y0ccIM3wDPhe3o9KOtJFiPvKZXY6r0qpUf0bs82KWiX9psAQrc64+
	oT9HMnMLePR13/E4Y=
X-Received: by 2002:a17:907:7f02:b0:b76:31e6:2ee1 with SMTP id a640c23a62f3a-b7631e62f01mr102265366b.18.1763483926301;
        Tue, 18 Nov 2025 08:38:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMe3P2lDhvef1j0kFOUzz5ARTSXWKhfn0W9nGpOzbOGXUPzG/TeDHySCcVXMMmB9qwSapzbA==
X-Received: by 2002:a17:907:7f02:b0:b76:31e6:2ee1 with SMTP id a640c23a62f3a-b7631e62f01mr102262566b.18.1763483925892;
        Tue, 18 Nov 2025 08:38:45 -0800 (PST)
Received: from [192.168.10.81] ([176.206.119.13])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-b734fa81172sm1377513166b.15.2025.11.18.08.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 08:38:45 -0800 (PST)
Message-ID: <62dc0550-340e-4126-8368-1869609bbd68@redhat.com>
Date: Tue, 18 Nov 2025 17:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/arm64 fix for 6.18, take #3
To: Marc Zyngier <maz@kernel.org>
Cc: Alexandru Elisei <alexandru.elisei@arm.com>,
 Mark Brown <broonie@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251114113415.3217950-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <20251114113415.3217950-1-maz@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KakObgw8dqf_5S4VmRkXIAl_E8c37Kkqn3MyyC1E2Xo_1763483926
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_083853_023724_12D099A9 
X-CRM114-Status: GOOD (  16.78  )
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

On 11/14/25 12:34, Marc Zyngier wrote:
> Paolo,
> 
> I'm back with my weekly routine of collecting patches, plugging
> another couple of regressions (the FGT one is particularly annoying).
> I hope this is the last one for this cycle, but my gut feeling is that
> we're not quite finished with it yet...
> 
> Please pull,
> 
> 	M.
> 
> The following changes since commit 4af235bf645516481a82227d82d1352b9788903a:
> 
>    MAINTAINERS: Switch myself to using kernel.org address (2025-11-08 11:21:20 +0000)
> 
> are available in the Git repository at:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git tags/kvmarm-fixes-6.18-3
> 
> for you to fetch changes up to 85592114ffda568b507bc2b04f5e9afbe7c13b62:
> 
>    KVM: arm64: VHE: Compute fgt traps before activating them (2025-11-12 10:52:58 +0000)
> 
> ----------------------------------------------------------------
> KVM/arm64 fixes for 6.18, take #3
> 
> - Only adjust the ID registers when no irqchip has been created once
>    per VM run, instead of doing it once per vcpu, as this otherwise
>    triggers a pretty bad conbsistency check failure in the sysreg code.
> 
> - Make sure the per-vcpu Fine Grain Traps are computed before we load
>    the system registers on the HW, as we otherwise start running without
>    anything set until the first preemption of the vcpu.

Pulled, thanks.

Paolo


