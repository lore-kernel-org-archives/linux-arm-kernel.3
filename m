Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49843C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=; b=F81kTcDXf9ZOQHND5hv0MBlA8b
	38YYD1CwtCkuOWq5WhMBzQjsjwOfQ+wtuXvphKm/+lOYY/nfpn3jOHcO7M8nXATw3pdrnBHL2d5e7
	dxa12+Zww6+FUAHWBZsT4iHwhvHYy8w2m4PLpMszhuPIvDReLWwm9U9tlDaMTOfojdF2hjO2tfCdz
	21nhUpX4dS+UKqlR5UlVT+aCzD5OzlZVrdom5D5Pv/jghtup421fXUvrYOjEF1PLLuI8LkxOCQBih
	LHhqHiFqxIaBdO82P42sfq7JaY2HFSQ/7gk7MyBbcHLQfNl27rJ89E7Y8Q6YarU2dap8LOIGSwGpP
	UGVyth7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cwv-0000000ECsW-12eQ;
	Thu, 10 Sep 2026 11:28:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cwt-0000000ECrO-2X5t
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 11:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Message-ID:Date:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=; b=MzqQJoZzaU6m9o8FPFmK+xznfb
	Y4S5UlbD7DgtLjq4+ZNIukDIozWrOLBTOPFQ+Jq7Vm24ZSNEpygvsJnBvKL/8GHXA0on9b696HVi+
	IrEsNWovA5a/1kNsJCv+I/gjAumxzdunOt4KmwlAZVwPk1E81oHrqwDKl5s4fiCzaql8nEgVMgxTR
	ibuY2q9IjPXW8wsiNWJIC87u9ZgQIZfeK30UoK9aYIor786UYzccBIx1p5D0tlMH3czTYbSqy+FXq
	BpXsn775CyRqD9ElelrZPfk3ChMaSvb+MV/khb9izF6E1ce5scX3NOsLbG0Sbo6PHseGfOSTZKYDt
	IkjEG8pw==;
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4cwq-00000002Oln-49Bb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:28:10 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4a451915d8aso6638585b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789039687; x=1789644487; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=pmqvuGVD4kDnZOM4VF8RLqiA7VQzj6moZH1ck1wRL11iW7H6dETDP1/CMsZrYpe3a5
         3BGXodmD573GRK4XuK7KxmZACPWw9RT+Ee6BYijpe8cZ12auHoR1VFgSYI9aNf8XdHBm
         wmi3QSneXCs7uxf7mXEyf8Df4yyK0lC4XUZD6G0akaFvEAeKBV8Uc0vX8Y9D/5Wp/Bs3
         +cMFPWM+YMo5L5s40MU+fzVAbitcgox7SSvvXBYxyEiTe9mr9RD02UbU+Tr2lYM7d0x4
         Qzx3ybefaFUNCH3P80Pj66p7PcbZRqrT2LBRaqKHcXg1ia77cds87DddcGjpzeca6BRZ
         Wi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789039687; x=1789644487;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rdvn6SlWN1pYD61UCQmrt7vWGIUZg8DLzgLld4sc614=;
        b=p63LgYEXfMONqAGLzgK1qCxPPJ69ZAsnAv8NBqy97u8h6fxxk54UtjWGSqsctEvhZx
         WD/C2un8oqq1Su3JUNwmWgFGpgfH79c84w5gykNKuS7Gb0jTFzzCuCoHp/4iILlig1+t
         D3mW1btztvr+BCjw8xkj14LlyfsigA6PLUG4qQiYvesnykH4Lr4kIzLyCMz2R7m3vc/K
         QoY0uNLgNwj0nQogwaDE3jlUIYpUVOVrp2lSVavAmkbGhO2JjeZWFLyOsJDEX4bCUKnl
         bACNYsbFcBzgTvzL+19t7CYr5Sl7QplD+UI7+NJlCinP37Q/4d/zNxwptvcyR1T3aiq4
         9VPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYzYVA1GaCX4H+2+9hz8+bkRCJwX1E9vUSsGOHIAhWp7+69W6mB5VgoCJJQvWtWdGI4gHYg/t5ZrmfuZWFNo8x@lists.infradead.org
X-Gm-Message-State: AFuF++k7147lMyR+Cj3LA/dKDhDUxC2iYjOOBJccCznAuJT7XcgRpTa7
	eoXI9Z6um8kCtQ3/DkpNfpv6STSozgzSoI5mT/gnCddEulVQDirgC6+/
X-Gm-Gg: AYBFou3z6rmbjfOsWg7PFxsiqJCXEpxAFLP30Jq5yH33FHuAaSW0Mt/s1gZo7qpB/v8
	suNaK537uFxiAkI1+g5f1F9qc5mRoNl8+FP7mx/wtzL4sPFzB/brPa352ZJ+Vz6CPG/1GlATA5W
	1edxM6O9BRIPKkKRuOgMK9o94rZCOLUIrbx/8kZsNKb8KvbGkOcVvVk6EQX8ZaFef864DVf1ZUZ
	aKbpuOuKvTsq3mLuctDBt3DU0WYwrq2/HYq739Soz+RECSzFP4OvKa4k7j3rtq5rZuCwXuTbuYl
	ovVzEkMxQfAtm+XrZz6o4Zev070hnBvGhtL9dAaYF0P+r5c3NPPA70LqL2/fJ7KLNsYMgz9ESYo
	YFG9lZGeo7XuuJFpC5E6QrvY3P6Tl+0bq2EQSVo5GWYVc65HOOXDl0PbW91RE05/mL9yzhicHzm
	/Dw3HMLDaDlGKlwCe8QjpwOLFkfPmSoKkQYoCIcnTOOhPQHkviAv/EkTEeO5I8C5H3nnVtjrMB/
	iIeaYkCvDDk6I3rzPkae2h+IKkpNMGxVg4d7G9bkDa64OygAbPUBK64ZNX2UHOcBg==
X-Received: by 2002:a05:6808:f09:b0:4b2:8ee8:8a38 with SMTP id 5614622812f47-4b95db6da80mr27637088b6e.0.1789039686755;
        Thu, 10 Sep 2026 04:28:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm49398440c88.8.2026.09.10.04.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:28:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 18/20] KVM: selftests: Use TEST_ASSERT(), not assert(), in vm_get_mem_region()
In-Reply-To: <20260902164123.2546762-19-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:57:29 +0530
Message-ID: <4ifx1h3y.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-19-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_122809_122206_63111A07 
X-CRM114-Status: UNSURE (   6.28  )
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

Sean Christopherson <seanjc@google.com> writes:

> Use a proper selftests TEST_ASSERT() in vm_get_mem_region() so that bad
> input is guaranteed to fail the test, and with the standard error message
> format.
>

LGTM. Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

