Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6AA1049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmEJEiWdI/ndYS6mHJYLRy1VeeMXyLew6WklNqnDoTI=; b=Ba+B6zamL/zFfpK+eshn8an9wq
	tgNAQLSFUiBhoGn/c19KVQrVrsOIvlRYu6dspJO/01mWKNT/DN+VPgoSj2k7OxVcVSF25sf7cNlEV
	3AAMSJg3QaSdfzQ0h1uoYtAIEErVlkjZavFCCMA9opTDELlo1AyjPhSLz8xadL7lkg4e7s03QdGYy
	fDsMBiXqImE+u4ePgOaxGOckS/gbJgJxWDFFGkRdjVyf7qg3BtL/hFDonWUvhH7zsPaBUhYK/hNgX
	TtGUdwc1Zcw8rcTXomvuLriBmGDfo+ahBGa2Fy0cIWZbzoZ8oen+3kiuygqjI+oX2yAnac5zrWxU/
	jAJET3Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gm6-0000000BQC0-3kAR;
	Wed, 11 Mar 2026 10:26:46 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Gm4-0000000BQB0-1sZE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:26:45 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-5091ed02c54so405051cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:26:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224803; cv=none;
        d=google.com; s=arc-20240605;
        b=XZvrzT6vlAzqZFrFgAjq2PZA/8domhzjDZ0T0yZR7nd1Fmvbbu+QOEx9mdQMJuj2PW
         TX63/Xk+iuTPiMVA1h3GSZ1oAUMCW95oWwiDPwH8ZCziyIsUt7up5USL2csd1kd6xx+K
         mJkmgewZvU+Rpa3x/+YKmjlv+pYbh1vBG3fvho8kLbVrW0h9wBLysUK2Nft7hkQXE/wq
         ED+xjQgSEmLEuBLZnIRDKLLPl70UgDzzQMmglc4IHObFy6DUS5RmH9IHthT4d1KCS4vD
         5azP4+dw+tIifbMOIr3bPxR0WYk3T+EabyClIk31OZ4JU/8aDuV89+KtIrc9mjKGCHQb
         olgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fmEJEiWdI/ndYS6mHJYLRy1VeeMXyLew6WklNqnDoTI=;
        fh=q1FcEPhg032+Ewp4D/qtS07s/e6d7LiUUgMZz9GjNGQ=;
        b=HnQyKMPPXtrki853R7QLWcHi14YE8VvFIDOMpkycuwGu1+YYiPgXjG39pd+D7tkASy
         3v5QbozYpypVBZcJ+bMdczXEs6ivIFYCLet6oGK3ghLG77DwPVY9yLuNsf3wNCzfO3Vt
         c3qV38AW1zPO1B2jHzIouKuH1dUDtd3RySIMYaZknz4RNGGSKSB1d8HVM9EDP7Z3OxJZ
         lv99lX1z2XePZ4sFkxfl7Em5oBgf8BDBlph9ndwxDrMZYxve5UjiX5HQDVF//omCDEKh
         mizIt+39v6P1h95uMBXXKltdsZ7ZMhYP2s0lSFzEeFXeOpfyCmItztBsSiDslvVB8s9E
         o61w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224803; x=1773829603; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fmEJEiWdI/ndYS6mHJYLRy1VeeMXyLew6WklNqnDoTI=;
        b=w0u3SEnlRO8kALcD0AkYhsIvqADi5EzqL7rwqg8FYKioy7jiaPkHz9h7iPpMrh7WDo
         Z/j6d/rmyKNg3WqEy6dOWUOTawyz6Zp7EoPHdky4OVapu+BZ17hRSAV9ypAzr2BWsoPt
         Pt6jfkP445fcmYODuwmw4l8snRP2LCHXXuT29Q1ke4VlvYFF0JKlB/QbLyP5eNXUQ+4M
         5DCJiwhVcK/SrbaTzwZtVxwYVt4A2x9IZ2awatyEa8nYS/lEkQMpU68OyJilyeSf0hmB
         aY+q1c75yqIDdz14Ev4w8BfZO4Ulqew8QA+KsRgi/YboRgzypEk/XjpPKJjgRGtj3yqc
         b20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224803; x=1773829603;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmEJEiWdI/ndYS6mHJYLRy1VeeMXyLew6WklNqnDoTI=;
        b=OdFXoXjHRGKE6haA0g1/q8berXPfF6BJPcblf3Kxx5SRQyAsSgbuH+RcNaR/v/7fEb
         VjtgAfq5riBeO6ONktkQssgKmiHpbVqGoFwzMEtfG2gjCXj7kxYx0KjS0QyrOsmz6y5a
         picObmsqo827oLA8t7EAC6Z9HA5wG2EFlz0fzMczlLI6x2H4YlitKP1sp2+Mp6/COKjX
         2ZJb59v5SOZt93WZzP+W/XzzctZXY0BMqrnH5Sn05Yl9znHR45fz0IVIBq8rdGxi+Xq8
         MKcQCA1sLKYq3p/RmgrbyVyM2FdC1mX1qarHHGzQJbhKgSVEoJ0M0i+DAdxs36p8vImi
         6CvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW19K6gKal10m+eA38PUjPCXmxn5HgQdy4G9D8SV0izBCUnLy42NK3CN6QyoD2D6xvlk+ZZBN9uYw+aUnQAGI9@lists.infradead.org
X-Gm-Message-State: AOJu0Yws2JDaMvd2mOZgOvAQRpJEV42WEMr6+tQYcWRoIS1hAvO2P2PP
	WPGpo/e9qlxKqillmGDnI0BSYU8lGVj9rZ8eCT7fszIjqqvCoExto2FFiTFBrq0qBub+Fchr8g9
	LCAbxSW/JQSPiUEG2r/PQKT9/508fOJfefvewsZoP
X-Gm-Gg: ATEYQzydWxbZc+0c+9JBiepY3NANaUC1olqvh/S/v5O8u9F6ZDuyxILhUnY/AfQ2DUl
	7p3NzeFhw54vmqRBuL9sh1cZHYdVsU/xPCx1PiVVzx+P5gsuWQ1XI2axNcEo+omF43FWg6muXkC
	UjnqUu4q7kCkezd/aT0sgA6sZcpudx/SDKmp1YPknicOhV/6oMLs/LQZ4OV867Atx+SPpmAwYlO
	lWKgb2t4wnCwtFkBuH9d4FLbP39aRx7PP6JMhEwdaOifxKhDuG5zXovxhXFrxhEOeMTm4/8R2re
	fSoP+wkW7bW0Z1SxWRDVWZ951o2Uw3msxzJc7f+CW+HHOVng
X-Received: by 2002:ac8:7dcc:0:b0:506:a3c8:d44d with SMTP id
 d75a77b69052e-50939a11387mr9323501cf.9.1773224802760; Wed, 11 Mar 2026
 03:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-37-will@kernel.org>
In-Reply-To: <20260305144351.17071-37-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:26:06 +0000
X-Gm-Features: AaiRm51zEMoCeXfjJ-x-zNdci4ij7U1702jzJU-AnR7k6Sx6ZBflApT7dTXZez8
Message-ID: <CA+EHjTxAZEtw=3wjxONDDpVHei1-E9dR3L-kOweUzctdPBLaAA@mail.gmail.com>
Subject: Re: [PATCH v3 36/36] KVM: arm64: Rename PKVM_PAGE_STATE_MASK
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032644_492054_10349F83 
X-CRM114-Status: GOOD (  18.17  )
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

On Thu, 5 Mar 2026 at 14:46, Will Deacon <will@kernel.org> wrote:
>
> Rename PKVM_PAGE_STATE_MASK to PKVM_PAGE_STATE_VMEMMAP_MASK to make it
> clear that the mask applies to the page state recorded in the entries
> of the 'hyp_vmemmap', rather than page states stored elsewhere (e.g. in
> the ptes).
>
> Suggested-by: Alexandru Elisei <alexandru.elisei@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/kvm/hyp/include/nvhe/memory.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/kvm/hyp/include/nvhe/memory.h b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> index 4cedb720c75d..b50712d47f6d 100644
> --- a/arch/arm64/kvm/hyp/include/nvhe/memory.h
> +++ b/arch/arm64/kvm/hyp/include/nvhe/memory.h
> @@ -37,7 +37,7 @@ enum pkvm_page_state {
>          */
>         PKVM_POISON                     = BIT(2),
>  };
> -#define PKVM_PAGE_STATE_MASK           (BIT(0) | BIT(1))
> +#define PKVM_PAGE_STATE_VMEMMAP_MASK   (BIT(0) | BIT(1))
>
>  #define PKVM_PAGE_STATE_PROT_MASK      (KVM_PGTABLE_PROT_SW0 | KVM_PGTABLE_PROT_SW1)
>  static inline enum kvm_pgtable_prot pkvm_mkstate(enum kvm_pgtable_prot prot,
> @@ -114,12 +114,12 @@ static inline void set_host_state(struct hyp_page *p, enum pkvm_page_state state
>
>  static inline enum pkvm_page_state get_hyp_state(struct hyp_page *p)
>  {
> -       return p->__hyp_state_comp ^ PKVM_PAGE_STATE_MASK;
> +       return p->__hyp_state_comp ^ PKVM_PAGE_STATE_VMEMMAP_MASK;
>  }
>
>  static inline void set_hyp_state(struct hyp_page *p, enum pkvm_page_state state)
>  {
> -       p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_MASK;
> +       p->__hyp_state_comp = state ^ PKVM_PAGE_STATE_VMEMMAP_MASK;
>  }
>
>  /*
> --
> 2.53.0.473.g4a7958ca14-goog
>

