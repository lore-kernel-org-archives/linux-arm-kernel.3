Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C14FC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 09:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=; b=vm+yHoFmhoNKBhYcZfl780MnGL
	91v8zUO61xP1d0vFtCEupWZZqGJLQaeXB64evADP+gUTGsh0Dxx+jhRcLC3XpIgGXkAYLxKANRtpM
	hvNjouPx3lgpyklMlYN1mTzwOArFzwFKhNr7yrHFkpVdXYFemU0DtNjnmBWnjVcnGeHHv6i7NHd8F
	sbbgjEz3Ba7tqbKvNWv3ILf1auzqk95SC0ju+e3J+gJ9ipXz4Nun7+mscyQt3hn035B3RzIgLj/Zu
	+5lXfabZ9fVVRfoerTsCfTcfL3q9re2Wn1JsTqPlFkYN2Le4SETNG6S7Dc1DZDM4AjNuAdiKhAiXn
	qNSvcZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJTjP-00000008SUD-0wgO;
	Mon, 26 May 2025 09:02:51 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJThB-00000008S12-1gMv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 09:00:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43d72b749dcso3527165e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 02:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748250032; x=1748854832; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=l7aqCa9VgZzoypNzoLJjFXcK7IcQOxdO/AFsskuOjS6oBIft+C7ORlWAaj0qFzb2C+
         OsgAEHGpF4jwb9aRQ1/EDH6Owm+xV7oi6laVkaPs/Fm7+abTziHARSEdVjcxT/H6tRiC
         H+6AfgmgOWjTbgR+dC96MgFOoTEYcLN4njDQ+NaZoGCITXfDs2h1mSVPjdaDBkpcM0y/
         E3KryETHgzZjiEKULVe7cRUCK/XOwjepNFNvNxYLkkUqFlZ5wzI8AGge/xdpkTuJtVPp
         uIV2rb2yS4O8gRJKK361Md3a7nnQbEf3GNFPfev+o4Wco0uCPXMydQofj3sen7XMQqWV
         SMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748250032; x=1748854832;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Px13KBn3Ab4PML/y+5ws+0a8JDTrznN8pyXvkr61Wiw=;
        b=Kh1Dm+yDGuEI6klRvfgZsGFk7Qkvloc6klqZV9Ez0hBpl11k3YEtSQpMIpdgDOITtZ
         2DzH+p7VVWC6M1FEwjwu+Dl4FgEqKl+tle0DAvC1h46o5/igYtkfM0WI+tdNv6qItuYV
         q8pjtLKLgP2DuNfYNtSG9szOHWVGplCPgrTDbx8jixtbV+s0pOyIME1DQTn1fYB46SIY
         yEM3PDT+pTf1hZp4DXQ99X41DL9Y2Ua92dKEaQR+yWZ5w6vYpjUcKzZi9+t3YeRyhBgG
         eIYkopqi7NjLyB1jBFcNxB/J1s2ZKOKEzcbEGZUI7nxeuOqhsitttBSYySsVmv+4jPn5
         Mv9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV37IqXmLg9O4HhKYvyBA/lmU3yTZuEl5U2fmQ/MlY9ZvP2MQK0s/0b8WyXM7dAn2uaMmCXWvEMZCN7iIPy115T@lists.infradead.org
X-Gm-Message-State: AOJu0YytqqTIxZrVIdL358kG4tuXU0wAABXcLIW0Z1ymM6R/VZS/9TA/
	ZAZv2pOyNQRvPryjSTk/07oZNSQAZt0WjqverRCJsxNRzE0SgtYdzF76zhb/cpMhd5E=
X-Gm-Gg: ASbGncv3rQXCC8KMHwdEjPYKaJTxagy02hGZTIslpDq4b52auat9Lu9oRbrzw6A7X9R
	TFyv3sj+mwN0zaePWXkjgO2KtlWlx5zIUMfuzCtAA8rXr3MSQGUr2vHtKoRh9YmBZdTVBVJgAOq
	58PEOk9ahuesOmrfgJg9dlBfUgcx7zy6vzW/+u5smpzBbwCa8obA5DMikimnHbVvxEcc10m1Nzv
	a2ueleFW9Fe2rtFTrZcO17x7HDIR1wuIWtgCJFfooHFhxARI5dNV+0j6nNqVExRo4wpn8TaEPuY
	m0+6ci83qmY1R/aBIhVaP2lbBmppdqahgNzGychTvVabixdwpPbM52P2CuU=
X-Google-Smtp-Source: AGHT+IF/tn9b6UQhPJeT+xCpvDd/FmqeY7qs1H9ffakgmE7eWhdvKQVPuHh5QupMD48NcHbdDQ76XQ==
X-Received: by 2002:a05:600c:1547:b0:439:9909:c785 with SMTP id 5b1f17b1804b1-44c935dd918mr24933285e9.7.1748250031502;
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b85a:a7d4:fa4e:bb11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd94f1sm235682295e9.35.2025.05.26.02.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:00:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 11:00:30 +0200
Message-Id: <DA5YWWPPVCQW.22VHONAQHOCHE@ventanamicro.com>
Subject: Re: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version
 to 3.0
Cc: <linux-riscv@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Palmer Dabbelt" <palmer@rivosinc.com>, <kvm@vger.kernel.org>,
 <kvm-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Atish Patra" <atish.patra@linux.dev>, "Anup Patel"
 <anup@brainfault.org>, "Will Deacon" <will@kernel.org>, "Mark Rutland"
 <mark.rutland@arm.com>, "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, "Mayuresh Chitale"
 <mchitale@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
 <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
 <DA3KSSN3MJW5.2CM40VEWBWDHQ@ventanamicro.com>
 <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
In-Reply-To: <61627296-6f94-45ea-9410-ed0ea2251870@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_020033_434462_C1598D9F 
X-CRM114-Status: GOOD (  11.53  )
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

2025-05-23T10:16:11-07:00, Atish Patra <atish.patra@linux.dev>:
> On 5/23/25 6:31 AM, Radim Kr=C4=8Dm=C3=A1=C5=99 wrote:
>> 2025-05-22T12:03:43-07:00, Atish Patra <atishp@rivosinc.com>:
>>> Upgrade the SBI version to v3.0 so that corresponding features
>>> can be enabled in the guest.
>>>
>>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>>> ---
>>> diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include=
/asm/kvm_vcpu_sbi.h
>>> -#define KVM_SBI_VERSION_MAJOR 2
>>> +#define KVM_SBI_VERSION_MAJOR 3
>> I think it's time to add versioning to KVM SBI implementation.
>> Userspace should be able to select the desired SBI version and KVM would
>> tell the guest that newer features are not supported.
>
> We can achieve that through onereg interface by disabling individual SBI=
=20
> extensions.
> We can extend the existing onereg interface to disable a specific SBI=20
> version directly
> instead of individual ones to save those IOCTL as well.

Yes, I am all in favor of letting userspace provide all values in the
BASE extension.

