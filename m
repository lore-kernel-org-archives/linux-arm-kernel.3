Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD0DE63CA0
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 13:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bvtCjytnh3m0w4xXt7ewKdUhvsuqlVQAf7Vxj7DBbXU=; b=ntUVnwPkId8NPDBJg2JBpt6t/O
	pwLSokSaFe9fFD8oNFZdy8xRrNtfiESj4PBcu/Jt0rDIxrN93GX0fcplFGxor/9+UW/6miFP0Lwpr
	CNbEGeye6zG+U3u//G2dgS/9GtdRr/qPdeFTzqBJ6BUAEXImcGPoI4N7dF4ma08WhsXX/I0dTmUBN
	J44fk8hi3grlce5cVSudnogyFRgtCPYROzG7LuGhiUdiOMzMWY9psRi5WW/H3NOVTJw4O5Ob30Aj1
	KgGSkjhG01WVKd1TSAEEXBVoXX4BAxp/guJ745LozeU26dETW0ruzsbTAs8ecMO5fC/bm3cEIhGef
	T50T5/8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk0W5-0000000BDLn-0EZo;
	Sun, 25 Jan 2026 13:51:01 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk0W1-0000000BDLO-0Kxr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 13:50:59 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5014b5d8551so603861cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 05:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769349055; cv=none;
        d=google.com; s=arc-20240605;
        b=esTRXn4gRNuWK/oo0HQn3mlFCTg+JVBZxlbwtkDegSYsAdqMGatx6Gk9aVaDcR0OcL
         7at/LAOa5mevKeCRBBSU6BAziZnAoESQ0PmcFlWOzJ6Mi2/XsSN5g+SjE4CZPehLaQfr
         aKn3fsapEl9yrAyz70/fvs/FKHXrjGdUzGDiHIkdWSKx+2FdLGxX65kKivAIEvHZL2C7
         tqDujFtXugQX9eLCZ3Qo4xSrkWwYzgkRMboOtq0jN5OO/uHPjp+J4Hf81PYgfEIWsuW4
         fO3lzOa4ojMmfGbyVuZMsdrlASsKyK6GhhkfmQ+kNwumlvks3C8VNu7V5f/M+JeUJtj/
         kfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bvtCjytnh3m0w4xXt7ewKdUhvsuqlVQAf7Vxj7DBbXU=;
        fh=Ym29f6E7yEuqJnj5yEY2GR0tH3vQhfeWTwS/ueSrt/w=;
        b=KlNmX8XdM0JWuRn6ObeyW8HeX6I7xw/prjK5MPvwAbN9x6gtAKqN2Q5UAnsurFSOqH
         CmJ+B2ui5y5u3LTUhA3KEhp08Q1209yHbblnw+m5FLQkPSmjuUdqTV3iC9eh3ct7vji+
         sagA6Yyga4saCIzYi9zPK9bbBKnCqFjCvk+YqnpeDePG7zC9J2CM/19lEOlhbBUDqcsT
         YUxbwKFjSlpkgk6b+UudGFMPEwUlGxeeTWYMtPNK1CrVC2g3p7sFd5aakxkgkAn/NcT8
         6k+SECBYw6IWKAwI9x4i8aL8C4QnUh/8irIz0ay/OU0zP3EOTUFh5fLkJeG3aBFEz6nn
         R5cA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769349055; x=1769953855; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bvtCjytnh3m0w4xXt7ewKdUhvsuqlVQAf7Vxj7DBbXU=;
        b=WioHOre8U4CvnT+nVrun32hndp0EIuWfXYQtp9O6iAJvpHB05hw/CXql58vwv0Qod7
         6retB+S4hWOSpJo1gkg+62eklhkw8C5c00HT3zWZs0Kd9uuiG/ZwDjWJik85+kcvukaA
         gDgHDrtVNwa3Nl289jjlaX+rSXisjObY1f1J0cnzEOB3yoeOtvws1yR+H5milXfH8NL7
         M65xSulkmgBklEhIgYXwoPIQY8SPIZjCs7i6loSYz5w3L4G6XmFEy/CkkHCscpdS9bcT
         fNvd+ai2tr1ezD9KOmS6mnTuOIx9El6Vn+uLASWLrRMipnbsFd1iCB4W/BoAgtt9MwiH
         jPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769349055; x=1769953855;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvtCjytnh3m0w4xXt7ewKdUhvsuqlVQAf7Vxj7DBbXU=;
        b=NqCpNU83QRIfbvFvFZmY3/0quk5me/ei9TMTPbt1W20i+ktxTZyq8R2f6FCRJL5sLV
         7KeMoMEDaL4bEq3ADvLlqDjs77xyhqOjkn6b67ef37MU9vVb5EMfRgiG7VQ97HzWDd13
         tfmJ2tAUONflxwaot9VuAVSn/kAojapAZA5y+F++VoHHZEFYmQqOWY3hgLzEK1R77+d/
         YQd6hCaJsOhnDbN3ZGqTwWljzI210N0i596+r01dlCTI7dgzV+0c7/fckAjqkSc31JKl
         +dN/JMs3BSCj+L7DGuN4IA8aFfk14KNAccy07kwCR3Dtq5eP9knjzIfp017EDBbGdCdj
         NHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDBxuipGQ+1lq/h9PO5aUnrODM6qRul+Gd98JwtE9toLaw4fBWXEYRuQoMh8G9FBZ5yeRKwvGxpjRw8PCNv4+3@lists.infradead.org
X-Gm-Message-State: AOJu0YxsRwhkIxdHqMpK5QD/Sugso1yN3wslZrTCNg4/1+56shJDRWZu
	sMoLaSH/uUtnnnrERw/vrdZZIm5QtEAGAK7nRKC1nOUlvjSNyya3dINa3CFhQ/iMfl5dddibQ5G
	DbqKUNGiNcofbMsm2Mksnwx6YUtuAY78FjoG8bXl0
X-Gm-Gg: AZuq6aJOi05WpBNxKl58mSHCCk+g/iJn/aGcdPibRAHHXCu7BEF+F1gIf3DTFjoCa8k
	WFArnXRCL+ZzlX7SCgHXOJwXXJHnRJUJoP6wejvjktDhpi/5lsnqHLEmxN85sp68r/GCVcLwhug
	yK374fRle15iHEKemJuB8mg2xb+oEaLZVZEDrCrV+7YW3bJRUJiahLYu5C5c6GDzMhzY4iVv+tc
	19DcfNBHQBhCtRG3E52vu3knIwZOZfPgueUJSW2MAh26EumW+gd4KWxC6UnUVjg2gq+i39q
X-Received: by 2002:ac8:5987:0:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5031428f089mr4086301cf.5.1769349054528; Sun, 25 Jan 2026
 05:50:54 -0800 (PST)
MIME-Version: 1.0
References: <20260123191637.715429-1-maz@kernel.org> <20260123191637.715429-4-maz@kernel.org>
In-Reply-To: <20260123191637.715429-4-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Sun, 25 Jan 2026 13:50:17 +0000
X-Gm-Features: AZwV_QgL4MA9dzU0hsWQWkYWo_GVTF-8xtdiRpx6vT3QpIK8K8eZ4J0wi3LqHIQ
Message-ID: <CA+EHjTyCLMpfwJ8_4hs2AZudQadvjqrRm7ULSsw0DQrsDEBFHQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Switch pKVM host S2 over to KVM_PGTABLE_S2_AS_S1
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Quentin Perret <qperret@google.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_055057_187874_8B7B7023 
X-CRM114-Status: GOOD (  17.29  )
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

On Fri, 23 Jan 2026 at 19:16, Marc Zyngier <maz@kernel.org> wrote:
>
> Since we have the basics to use the S1 memory attributes as the
> final ones with FWB, flip the host over to that when FWB is present.
>
> Reviewed-by: Joey Gouly <joey.gouly@arm.com>
> Tested-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad
> ---
>  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> index 49db32f3ddf71..38f66a56a7665 100644
> --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> @@ -19,7 +19,7 @@
>  #include <nvhe/mem_protect.h>
>  #include <nvhe/mm.h>
>
> -#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_NOFWB | KVM_PGTABLE_S2_IDMAP)
> +#define KVM_HOST_S2_FLAGS (KVM_PGTABLE_S2_AS_S1 | KVM_PGTABLE_S2_IDMAP)
>
>  struct host_mmu host_mmu;
>
> @@ -324,6 +324,8 @@ int __pkvm_prot_finalize(void)
>         params->vttbr = kvm_get_vttbr(mmu);
>         params->vtcr = mmu->vtcr;
>         params->hcr_el2 |= HCR_VM;
> +       if (cpus_have_final_cap(ARM64_HAS_STAGE2_FWB))
> +               params->hcr_el2 |= HCR_FWB;
>
>         /*
>          * The CMO below not only cleans the updated params to the
> --
> 2.47.3
>

