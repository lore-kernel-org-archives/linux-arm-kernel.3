Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C3BFC72CE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jruzd6NkqjuAAF2rHJBm3v3faoRwpO4fCUwyZnfsofw=; b=Y4BKg1OVOVSuFbzPLLhcM8MTGK
	kt7u9sQ7CWKVD8k5kHg1rWYRdOLzycVIW9mkL7FZbIt9Lf8lE+4jIVL3jQwPCzPXbdJRaBSaKdeau
	Ii9nYK0bm63MPwjwvAGAbfwIBRy/1cc+FKRfiiLwsH7xJnajpmnI9XMDmoOqbPGbGs/6L3093Ajgg
	fbZT08NG4zFm29329TtOhkNTuVUw8QhwopVLDDVy423WvWO+C921FBtXLEVMBPr9ngfeuJ7Y1WeIA
	VV1Qkvm2wJfoGD9CTCz1EoZTVqZIL71rI9pLdTdCrLCLJOC6NY7MSH89OKsQRldAsB36jIFckQasC
	rnD7uIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LBS-0000000FTp8-2lv3;
	Sun, 22 Mar 2026 15:57:46 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4LBQ-0000000FTof-0hfQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 15:57:45 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-50b30d61be6so935071cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 08:57:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774195063; cv=none;
        d=google.com; s=arc-20240605;
        b=lmRk8jPpQB5F98Gv7MscT59RMdjuoYKQBUZs+VYa7swu6m9oJX+TawiOBUiSL88yDr
         gKFHyLY1L2gRrfxnhz9Rf6vgactjFDrkT7EI/YrF0qx5sH7gbremMl5PdwR9KqCXcYP9
         fONF1WDVkujey6Djb3NeBvKduQXoLuZqxdoUcOee6czyCcYDCyQ54uDX5FMrnkq6R/wa
         +bNBdIIob453CzdV7qyGWX7GsAYrxnZM9mVv84KSb3AlM4N7GmzGTnucHhiNlbhU99nc
         XTidZKq06HrjqnoqKDCduzU29HYhNXkGrflZ4YOau3MikOlsBsSWIyj5fPS0/lGAe6to
         g8Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jruzd6NkqjuAAF2rHJBm3v3faoRwpO4fCUwyZnfsofw=;
        fh=ouIFlk+yc3pjZCDR/6aIf93jDVApwRu9fr5cMeaTRac=;
        b=UeZdgKBx1ZNhle7AKIQm64OhKmaaY0W+ZlBLc4sjEtlqC3Cg3gAeHRJn5C9Yv7ceFJ
         xLPzGVgN9AyuKlWEFSU5tjme5JECRuR8uXt8Re91rVcLe/O0Z8VV4dcEUOo5TznlzfaC
         Xo8Fz2E6FK0oo1XfXeR2RDqmzI2xFUiZfr0VgnbKpC/LYj9nEKlcKC86ZmPw/PnpddCi
         43j4RH4JQ0cEltjnY1pjR/wJoD5C/rhYVEFF+p5b6FDhBzeiSdm+DA9euHTO3cpnXmzj
         5NG3J/fJezT4MuKq7T0L8HriKCas+/BQsDuKBv95zUs5nb1dSeRlXPUvZs1Q/wBVzZyN
         e7RQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774195063; x=1774799863; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jruzd6NkqjuAAF2rHJBm3v3faoRwpO4fCUwyZnfsofw=;
        b=MTZ8b3wuRliWpQ0HXufYJYWwh7JWo0Xh/VbwAae3Y0yTQzlibovHVAfw5DwJBIgb9L
         C5JWpB2Ag65lpWRPX7X1pcCLHSFWk+h2nksLoVt+ZdyzC++V9GsLSUqFHBM2kMdcx/Ql
         TmEU1jn+xunvW0CEsckJDE2+ZIpk0Y3mlgzEBFaca3TRY5KGlGBPTm0H0kKHDtjHQJHg
         hoYcSTWHn0LNDHvNHYY0ksUWkaZn1aB5pOTpOsGFuQdXiu2Pl+Fy/ogcVHs5U8aOr2Q2
         K1U+0HKCzmxdSe910yJd72tbDNIarghgPcJ+3hNq7nGvRI2TdruZZakxteIeY0fjRaj8
         iXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195063; x=1774799863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jruzd6NkqjuAAF2rHJBm3v3faoRwpO4fCUwyZnfsofw=;
        b=EAtYXzMcFZGJe+vbYzAHWEtLhsPOccpqM8U82glG/xXTMAQihrSJvPpiJbicPfD22U
         s+3mzL0PtbkMgHxYZSa0PQ/0Sy/AFzP7cvZ8mdBiKFPda+fB41kHyao7CJL2TCisWzY/
         8wcB10lMt1FwPRl5lx8lett+6tAzOYmVHw9PvragdXzqfCumdv2JVlEYBx/STFEE6V8g
         KgmnVqVpaDa7SdHhDKqgJUhNyVgxWNk1r8HrNMDb4vbONeN6PyG2Iw+aguQG2/CCwmmh
         H8vVZH6CTxAz1TxWTdztgxI5p4mjSlWVDi+FWEzrN9qmi7nL7NB+Mp4leGd5hLjS+C7/
         jIfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFnPmZBZfiytv2HZEEXqKBuLM2fZ5zEVbsF4WWonE+WcrBmGg43bIX8GZI0j6ooe0xrpiCr/ytSa8eIaV5Ujor@lists.infradead.org
X-Gm-Message-State: AOJu0YwFk1VN/BDDhglSKM1tLwg2SwXJt7pFzDrLSmPmINWdG/LKw/Kt
	CAcg7LT7nn8UL2jhXaMzGApjVYQN1YTGs+AktKQ2r7zEfSbfNsReilRHXeglsHDk+SDc8K5kkNl
	MMr+SiqI53j1bnILKf5GPhyta+yw0QCXN4dbjizZ+
X-Gm-Gg: ATEYQzxYI+pVwipHEwQQmWi+3LG6ecCvCqMgUWwigHWdrw/4bdvhrLlt4ZK8jDOHam4
	h7b8ta54NTqQRdPmbxdTdQWAAxKNJrSemaT3Sywww7d8gxMv1h0CYcru4Gs2udtDqicmAeYTrYT
	gvuloLaqgPz17OkN1nWjNlGJsEMuBp4J6nZ6CKwjpUjfTKG0iB7YCapIbM3L8F0liceMxPk7thK
	MwQ+RNS2Pr85O0wkr+iD9LOCCho9cq92KWdbJdtuLrAbIdUR3DUfATMNLppfBqazRI1/hPqIQe9
	llC5Rsk/
X-Received: by 2002:a05:622a:1211:b0:4ed:ff77:1a85 with SMTP id
 d75a77b69052e-50b480dbd8emr16496101cf.17.1774195062641; Sun, 22 Mar 2026
 08:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260321212419.2803972-1-maz@kernel.org>
In-Reply-To: <20260321212419.2803972-1-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 22 Mar 2026 15:57:05 +0000
X-Gm-Features: AQROBzAJIzRJ8D-goNBVthnfORrFTafE31L7zl763iq-2MUJoVzQZfSh1NnQFOg
Message-ID: <CA+EHjTyqYQhCCYCRyZv5Purm1_2gL6KGeq_Y24sgiSZgWuGT1Q@mail.gmail.com>
Subject: Re: [PATCH 0/5] KVM: arm64: pkvm; Rework aspects of the PSCI relay
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Mostafa Saleh <smostafa@google.com>, Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_085744_213035_031633AC 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, 21 Mar 2026 at 21:24, Marc Zyngier <maz@kernel.org> wrote:
>
> Having recently spent some quality time debugging [1], I ended up
> reading too much of the PSCI relay code and felt that it could do with
> a bit of spring cleaning.
>
> To be clear, this series doesn't really fix anything. It simply adjust
> things to my own taste, which may or may not be everyone's.
>
> Comments appreciated,

With the copy-pasta fix to patch 4:

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

>
> Marc Zyngier (5):
>   KVM: arm64: pkvm: Move error handling to the end of kvm_hyp_cpu_entry
>   KVM: arm64: pkvm: Simplify BTI handling on CPU boot
>   KVM: arm64: pkvm: Turn __kvm_hyp_init_cpu into an inner label
>   KVM: arm64: pkvm: Use direct function pointers for cpu_{on,resume}
>   KVM: arm64: Remove extra ISBs when using msr_hcr_el2
>
>  arch/arm64/include/asm/el2_setup.h   |  2 --
>  arch/arm64/include/asm/kvm_asm.h     |  3 +-
>  arch/arm64/include/asm/sysreg.h      |  6 ++--
>  arch/arm64/kernel/hyp-stub.S         |  1 -
>  arch/arm64/kvm/hyp/nvhe/host.S       | 11 --------
>  arch/arm64/kvm/hyp/nvhe/hyp-init.S   | 41 ++++++++++------------------
>  arch/arm64/kvm/hyp/nvhe/psci-relay.c | 39 ++++++++++++++++----------
>  7 files changed, 43 insertions(+), 60 deletions(-)
>
> --
> 2.47.3
>

