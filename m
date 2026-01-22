Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE89D3EE75
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uIqUtHaa3fDMkmu3xX2bwporJYMUaefca/7Wsj4lcEg=; b=qajm0xGXaF83pclDUekQ0xXQjg
	85pd5hp4YBt7Rc2z6pzA44nV5WzpkIPbIwy0SVdKhAlG8CGztHgprjetwvUBObNXlCoyWeBvnBDBv
	vA6AQsqqKtDjEpXfw/Brkpd0QzgwuQNaPvAlTOAc2TXYIWodZUPBZ6C4vEZtzzWOzGP48HG85WNsN
	mvOjx79vqBrfInMstJh4jzZaEz9T/bgDptuaE9Jurj439Yy83CSsp7xwcDgSoy64NHKFvcObfz5n9
	kcf78MAcTyMN0OpSIJaXTjiLciaGPgfFZrIE2Bsf3vv+y7UuKnEq7FIcQZb0ugsJV359a2NJ6UHKC
	71gD/cxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwIW-00000007IkM-14HW;
	Thu, 22 Jan 2026 15:08:36 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwIP-00000007Iif-3MRK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 15:08:35 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5014acad6f2so419861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 07:08:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769094508; cv=none;
        d=google.com; s=arc-20240605;
        b=Dsymz5mRl/ve9MrCOBeaqUuwqDm8fgqcmON07VvbB3B7R8HeGXHP7nJaLR7zYYmGTh
         TF3MUqDo/Tp+07v3pbqFf0N20SEjxgwCK5A0ypEtnkNWTnxt2sXppOEeAu/yzfvTnG6H
         Eb12uuJfkiDZENfjhCyFGCEcAglZbhYrTfr70MiWa054t7CkjRzrOwyFeJqAf7HVLXtS
         YXzKMb6djWZbESS2PKQpWiQsWCF/hWxhH/hEJLukUpfDGo9e8N2zRYPMwO2s1oDpZInD
         aL+NxBgluYRXGTTKpQ9K4tbsOyQ+S+dY2Njdso9tlK4u6T8Ba6jrUCWeLmpqmKqty0sl
         +a7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uIqUtHaa3fDMkmu3xX2bwporJYMUaefca/7Wsj4lcEg=;
        fh=/k/IbvMOhtTUibOHYfbtPIFkni6noxat23hJpOHP5YA=;
        b=PJdXHJJNO9VCqn+YPbiRy0SfEJYw6ZvlDlBCwUptpFoN7ToXYuajdgsKrNZ+TEquTp
         FFEnKNX39Ojla61L9x8ZFQ+IRFEOazb7Q/AQm/jNYMCw9znSUU8CnwePmm7au8EXqXHz
         /pHp5k4/t1HyTe81wRsixVSDNL/C56YpGVq2XCiub7r7rNrHBfDelTrsj4IvCsPU2/OL
         mqKbT+xQJ3G+u3RrPfeR2aAnG78MjEnSKU6c+ns6P7eAMulbx8UiP3PHf2tvQHA15+Yo
         lBsnxQrGOKOQ5+vnMOlNyaSkY8DN0501SdFw7NY2i4h/aTAKF6TiOf38R4s3nbyqF1F8
         /r7w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769094508; x=1769699308; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uIqUtHaa3fDMkmu3xX2bwporJYMUaefca/7Wsj4lcEg=;
        b=Ta/trT/fw/rYj6XEaKwF60sd0o1zAKnw7RcedE47JDUMSZvtTTUTtrSTiDF11qk1rD
         608101qb40kAgjz+EhqWiKekcpPNthY7j4kIKsucIC0oyo56XOnL9RpMDtpBRa3sqWCa
         rjqIdV76NPUj+OcNvv5nToDZloymlX16mqi5Pr9AWJzuw4xterJZTtZeLjatX5IWe3pF
         hfwXdpZLSbpqgLL6BL0EMHtdgmsdBQyk7Xn9dS13ES2rDwz2AQVxpt/QNq0tQG1GqyGz
         skUAZdEfUBimtdVLmSKeaiuDCdAqMQUZ4OxcRDX90EbYXFCCawRc3MDNpRr0sGAr1Vcc
         s09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769094508; x=1769699308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIqUtHaa3fDMkmu3xX2bwporJYMUaefca/7Wsj4lcEg=;
        b=XYTVDodBVnBfNMlB2j+Piaq2GNONh5uUTz80Fx5V1CPZvAIcNoqNfEkoz5TFvUm3gk
         b1lZKWzRlaYg4B9YRb1WWyTFWNhotzuFxP84oo89AhfqGXlWZTIpP/PZAo2xe9lfNff1
         gltNVgBiot1ZbtJn5ESMxHt58zc805CIldcG1sCHE3QJx14KwzdFnvttqhI0/6BVE4f7
         CNy1i41d0flIFKLl24+BVfVKVFqbkIF0k8cO5qFadg7Af0IaWQKsBqcb/ukTYHQirjat
         vUALtd1aLdSwUdot5mLvH0w63tl1CU/y+rMkhVFGXBwPVmTFeTsk/B2Ck48zI1ttj8OO
         Zaew==
X-Forwarded-Encrypted: i=1; AJvYcCW2Ug++R1fxEjUbizTZLRFHtV277o28PFkudhfXZrJmo/Az5J3AggxaOyqJ4nazmZ2UnC7OYLHhROpY0N/f+t1r@lists.infradead.org
X-Gm-Message-State: AOJu0Yx71s2vPNsbpF2QmCTixN5cXpCR0ad3ESghdqZZf41/9YFnspZa
	vUhYU4TdEM2EAfNeE1Eruqj1Lx8HYniV9yofKaQzqmOxg5KvAO7Nk9dgbfLtFZA6kRQmhWA0lW/
	aotIsKOJ0yVJWC9D5G47/OPE9vwVBeAxQ4BnduuKT
X-Gm-Gg: AZuq6aK9gEn2L3C7/h6c2J6dIgQTlVr7rdxsvB5x3zvJwI6f9DtI99UJPgv187cxzBL
	UQv6if2e/F8+iOyleyxrXh28n+T2ewICEHeeH2dX7/+D+moWcUkby8mnjhQl4Tr8vNq5gWyTiG0
	MCNj3zOzYORBA4sfMyOA3b5lK4DDLzqs5BkX9D8vJxIOWln9r/5oIKdupil3CIJwejryNdzldj6
	jLkaF/lqtyW+do5qAdXNkXu3LijRopYKWbXFrD8GrVShfTOxxkLON6J6zhoPy5FJ0dqOCPiUmL1
	dEJCpsyJYXnOYqdOR2qQ5H4nmQ==
X-Received: by 2002:a05:622a:1394:b0:4ff:bfdd:3f46 with SMTP id
 d75a77b69052e-502ece37d74mr9505941cf.15.1769094507375; Thu, 22 Jan 2026
 07:08:27 -0800 (PST)
MIME-Version: 1.0
References: <20260119105651.255693-1-maz@kernel.org> <20260119105651.255693-2-maz@kernel.org>
In-Reply-To: <20260119105651.255693-2-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 22 Jan 2026 15:07:50 +0000
X-Gm-Features: AZwV_Qh6OJ3XDx0KYwplAZkpiFx5faOmuYbi-9K2EsoJeKTcMmvZRwIumA1kCv8
Message-ID: <CA+EHjTxiGSxG6DpXxY8Qw3uSceYn46QBsrYi2de1j+1Q0j6qkg@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: Add MT_S2{,_FWB}_AS_S1 encodings
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_070829_961429_A45B29A3 
X-CRM114-Status: GOOD (  21.99  )
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

On Mon, 19 Jan 2026 at 10:56, Marc Zyngier <maz@kernel.org> wrote:
>
> pKVM usage of S2 translation on the host is purely for isolation
> purposes, not translation. To that effect, the memory attributes
> being used must be that of S1.
>
> With FWB=0, this is easily achieved by using the Normal Cacheable
> type (which is the weakest possible memory type) at S2, and let S1
> pick something stronger as required.
>
> With FWB=1, the attributes are combined in a different way, and we
> cannot arbitrarily use Normal Cacheable. We can, however, use a
> memattr encoding that indicates that the final attributes are that
> of Stage-1.
>
> Add these encoding and a few pointers to the relevant parts of the
> specification. It might come handy some day.

The Day that Never Comes?

>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/arm64/include/asm/memory.h | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index 9d54b2ea49d66..a2b7a33966ff1 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -175,19 +175,24 @@
>  #define MT_DEVICE_nGnRE                4
>
>  /*
> - * Memory types for Stage-2 translation
> + * Memory types for Stage-2 translation when HCR_EL2.FWB=0. See R_HMNDG,
> + * R_TNHFM, R_GQFSF and I_MCQKW for the details on how these attributes get
> + * combined with Stage-1.
>   */
>  #define MT_S2_NORMAL           0xf
>  #define MT_S2_NORMAL_NC                0x5
>  #define MT_S2_DEVICE_nGnRE     0x1
> +#define MT_S2_AS_S1            MT_S2_NORMAL
>
>  /*
> - * Memory types for Stage-2 translation when ID_AA64MMFR2_EL1.FWB is 0001
> - * Stage-2 enforces Normal-WB and Device-nGnRE
> + * Memory types for Stage-2 translation when HCR_EL2.FWB=1. Stage-2 enforces
> + * Normal-WB and Device-nGnRE, unless we actively say that S1 wins. See
> + * R_VRJSW and R_RHWZM for details.
>   */
>  #define MT_S2_FWB_NORMAL       6
>  #define MT_S2_FWB_NORMAL_NC    5
>  #define MT_S2_FWB_DEVICE_nGnRE 1
> +#define MT_S2_FWB_AS_S1                7

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad






>
>  #ifdef CONFIG_ARM64_4K_PAGES
>  #define IOREMAP_MAX_ORDER      (PUD_SHIFT)
> --
> 2.47.3
>

