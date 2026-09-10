Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF05C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=; b=DHw+mk6jf2Gzr5GjKtRCHCG67R
	2nQQWIfg61wY2oOjt8LZMjcpHuQmKXNz/4DmpEY0dEyX5Ca8D+QpGYE/0Oa8Cdm7rNsXhnQeUYMA9
	e7hwIdrTCqV3x0LuoPB68UW3kbcwtRhtLPfHJRcfXOjmymd3NF9BBGROh0WLzMatDj5FshYKpnlU9
	4CzbujKzcZet01d/BYIxIVgd5amKaxGB5z2IpzxiPvenn+CLeAIPM4TOFPvSZ6v+mpYC3tB0otK9n
	lLffA/Ib+Xxi7kxIbByx/G6WNg+sYkH4JstUJgGTPg0b+I4wvvYjw/jKHJDCSBAnA8J3SYzAYTieK
	xUANdqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVn-0000000E87L-0fkI;
	Thu, 10 Sep 2026 11:00:11 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4cVk-0000000E84m-1WqS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 11:00:09 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-39b24d114d4so7551786a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789038007; x=1789642807; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=U1Aw0CqQvxQGuc8x2nM+IKJ9zkzgfAhvCpwiO2BotjcoFUas+XPnIVzqIo0GS19PA8
         M70e+LRKUEvgiyQJdg+hpYci04UVMmVZ2GhvbfaB6QQZpDvYnEhadl+ElEE6jFelwOD/
         2Pb69B3VolBVHEuRBLzmWyCeAOHuUVL2vcLC782DxbEk31CgcGMSTmpFGDMDQv7UOiN2
         ANloE9Xjh3i7Dh1Cnt4w5gmpfKH1pPRH8ny8IcXGCtrlGqH5cWfoSV0DVHDt/QtKuZwu
         rm4YNqN/NdohxcBqLEusvox1OOHZeo+12liZr+A8TJbyAhQAxQ+1L9BAej2cZvNqTskD
         g24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789038007; x=1789642807;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NSugWeaGjWWxPTsA0WEUYFCIdkRuKo99PwV/yfMvTEg=;
        b=WYdbV7K0YAt2cuXPqzhFy5cy+Imsw9jr6TWsR9J3Dr+VmclpBaIBKkql7rjfsMQYNq
         4pxLfsAckSwqegX0+yJr5jUxkDbpHOzvSHOHVwQnztFT6CRwDwmR6ljsjDF4wKkqjD8D
         1LoWvLCORl57VP6vQKkPpzWLmMQDMnEt7yW79GKZ7FF4sAJ5W2hVRrc+yDp/URwLUMUW
         GRKQsOxJygnq8h1ffjYTZDLqkks8GVuhAjMsPjrEvJMgUrl4kTNtd+fDEDidOAFCQ+UU
         dgHMpfrkDOGHYppon/oWnS5aDmdZM360RKP6dwETwRg04fCZ6OO0uwb8BphrmpZLEx7b
         xgTA==
X-Forwarded-Encrypted: i=1; AKwUvBytTuaIz385kAVyxZHc+KlskGcuotCXhp5+vHdprnfy7uhMfRVeaxVXdEa9HrR2UVB3P+cNP7h+oHJX77iZbszR@lists.infradead.org
X-Gm-Message-State: AFuF++mvByZw5k3PiHDvMyKRuBPfs8OrbcE6QmEUKAegnr8NnicYYLyp
	gnv1QAXfm0S38Xfg9e8AkPZMW2ZudRm2k5Jlukm8si9+QSNh9o9ym7D2
X-Gm-Gg: AYBFou1H+eq/PAAu/BnGZ4jfUrZhH4vUQ85QHZ47x/Mz/56IjE+YTfdErntlTrsSAa9
	kNJo31K/oxepqIFVGQrR0MeSJxlOmyDsAc0KoPXHMhkLsWILaL+a/nCzE5112V1sx0ylNdXTJ05
	LyIKVYbImgNveHkMGa9Mxb7EaQIYtx8zguhroSVQKdRTnEce3B1hBsal3luib5vOTlqyn2Ox1Pr
	0irwfzj8sggFfx07teMOwnfu9DyeUz9b6Y0AO5YGrY7QoDvXkNtXkcVmZ8MsEUfZV0RC31PoPyO
	NXxAF+7urZrvspMNs1lT1B05NKJEdl6pYNCuv90MJ1/JfE+R2FGhr+ShZ/+8H/AOMuKZN8nympr
	MVRIUjNy7iBbl5Vf19zf1oR4KPdm22MzXKQeccOZsdtke7YZGtfPQ2M/2jJYLUPOTu1o7gxejnM
	RO9kt4QIq/fekQ1NMu/lAvk88xYmFfbowRLuSdbeLQPhgEivSnpEth4xp8Hak/JkT35xyGSrLcW
	N/84IjtDBwgFYDLoKldbQan0HwVb7CsRgGSdjesBW5t4cWoqltJ+n0=
X-Received: by 2002:a17:90b:3ec5:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-39b26277673mr58529054a91.21.1789038006053;
        Thu, 10 Sep 2026 04:00:06 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-143243f780csm46703778c88.13.2026.09.10.03.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:00:05 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/20] KVM: selftests: Use the innermost page allocator API in the memslot perf test
In-Reply-To: <20260902164123.2546762-9-seanjc@google.com>
Date: Thu, 10 Sep 2026 16:25:00 +0530
Message-ID: <bja51im3.ritesh.list@gmail.com>
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-9-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_040008_566883_2B2498BB 
X-CRM114-Status: UNSURE (   7.83  )
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

> Use the quad-underscores physical page allocator API in the memslot perf
> test in anticipation of converting the outer versions to take the memory
> region type instead of the raw memslot.  Stating the obvious, the memslot
> perf test creates and allocates from multiple memslots, and so can't use
> MEM_REGION_TEST_DATA to communicate which region/slot to allocate from.
>
> No functional change intended.
>

Agreed with the reasoning. LGTM.

Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

