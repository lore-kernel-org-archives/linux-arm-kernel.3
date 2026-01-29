Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA09FD73E84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 18:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55DBf6vGz6h/IMUX0dUx145BpEo7/T5ZyZBZO9eqOec=; b=HVUhQu2zciYQdxWBffLHesKi8g
	rubZ5NThsDEU/Zjp1PgIP852+0NGwV/j99/FRUpy5Rd8dAlWDKtyMMPhdyrMmy3vQJEyK+yHv8pdh
	KuA3NXLnZg24hRrna1oL0FYmfF3m+oU66+yUC0vDhmmKOc+HaBNdEDZcLF1sHoTiR6v4xvY9ZcUXB
	OSLVXaViARczCfLea7sqicZv2tDo7lYoOBQRo4Pp5cJ2gNZgrtC6X2b8398if+pl1+vcfP0G3UL8j
	/YzwQbE9jh/tmHINeNq5DAbNBtFMmjMMbMVHM/V0dBT/B6SOgatV0uEwVBWe/1dd4LEdGUx8xKd8h
	t57dtOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWWq-00000000Uh8-21ME;
	Thu, 29 Jan 2026 18:14:04 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlWWo-00000000Ugm-06mM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 18:14:03 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-5033b0b6eabso4791cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 10:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769710441; cv=none;
        d=google.com; s=arc-20240605;
        b=jCwvulXBZCUcB76/TIX4FmGuyK8UbnbwREeI403GWw790z6FUsHP+rRz0w8i6cxUtq
         gqq9YkhBm89gAL55SvOiaiZLezl64++HFPo8J5pAwtrtLWwuH82AUk0ZZQTf+GPP4/3F
         mrxQ4DgBrB2YyOIXE+RcwSAlGRf5T6PPEGRzoIL6heRH9zT6ahpDatRTAtmJQX1pVjTr
         oAh5x23297D1IkDJR1jJEY41jcyg5aCqisHmvQQpTOCE9aBrGUU7he7hEu0Df4nicSnx
         BhBJqAX6glRTBe3QQNv9VT/ri2VR213ycBzOy5tAmU26dDp3OHk03cn3wfAwGiJ4FEtV
         qK7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=55DBf6vGz6h/IMUX0dUx145BpEo7/T5ZyZBZO9eqOec=;
        fh=B8968iYoW8ztD69s2A1nbXL2/WK6CkwgF+/fbxb9jvQ=;
        b=O533Hng2fiVJswFvz/T6tXZ45an0GdE+mGZwo2mamJkOtXfqhteehV2cPBVsn5D6Pb
         CYoV99XxmfZVf2JRSUPSiaF61JkJVKl0f4zbWPaAkuLh5w1FoULzkGDYdHZUh62T58Ar
         IBwKulFDzYi5E/IowNVkpT4JjDOAqLG13Fm17gk7Drof8u1m0jYXJp+eJlX4u2gIHFnl
         /+XGIe/++TbVoV6vhFU3DstwMTkE3EHuLvCScCOVN4DNGQTi+HoXUbc1se31yj28ICyG
         fdF3WDB9GuVpjcrXr/8NrkcYGNqCkMH68NsE8Xzq+2zp+Do4LjGNg4ARL5spSaMV3qOC
         oPrw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769710441; x=1770315241; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55DBf6vGz6h/IMUX0dUx145BpEo7/T5ZyZBZO9eqOec=;
        b=mOuDKmlCDJ7DhPUww2W8X8kuNZezzH1rc/dRiVOdKZy/DyLb+60+OX2+zVvh4Rmk2V
         PeYd9lrpsNWkX6gX/cQC2bMQm1Qqb8mGmf+j/lmmW85oTj0vjRkLv3A1vPzHBeuieVHV
         afeMNe4Jj0HXaSkRrEHtE6unaZN+ZPdp6SeRgb873/hukv5KFuvon4ffLa9WHzDBE74i
         bhtB8pLqS4Gm9pesU2qX8ziz58FbytbvOQiCzq4E2pTHk9KpkXlgyLzqGeqUfyBhVVX9
         Z2tScZ+I3iZf2RTWQmH/udVpTXP+6LyoNcDOkIIU72sxaxWtc3MjTot/JV1irGjqtQv2
         aZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769710441; x=1770315241;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=55DBf6vGz6h/IMUX0dUx145BpEo7/T5ZyZBZO9eqOec=;
        b=I4f7+ySaqCH3XUox0Jfy30pn1Q3s1ufoZ4mqjYT5pIm0U32RNkJTxnELIK9jXooZL+
         G4V8KYcc2cu2EO95g5u4Eya/3tz0zDmMozPDWRUmlH4BjR8VWTyHOl8fvtDntp71wOy2
         yGiLW8eMc0gCj/prg+PvB+vtxIzcwSwBKXGvRSPYD9cEKg3NutPayj0qLE9P4zg0jMhl
         EGuoUx7Gg0eyOCowPRLjS5w8SzF3swg9kjtMYSOnh5XjlKL6Io9uQwJhjgquiqM8rkn8
         3Oy6Le88oQVzFjO44UzkQ+/Dn0px8dWY9UIEljEWiQJwRSuq8fFfEIW+flqTFmRtIk1D
         tF1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwhafuIj4vwVeVX6QnvKuQRxp2lmvczW+pqMeNtDVF3nvyPPhwMqy/YIfXKILcjzjpe2rZobUpr933eQKkFTJB@lists.infradead.org
X-Gm-Message-State: AOJu0YyCGeaFLoTvgDTOtMLIIVYeP8UxxyQy8om7tA/ucVkWurJBUEIY
	jIs2OrtCHvmJIVfw/LwHaTYbnZ0t4uJH+dk6gfu+vAgUsZ0AMgMBZYMfmXd6xx3o8DH5/lQJ68c
	/KJ53MO1k/5oDN+k41G7MYAreXIKSZQXr/vkM3l7X
X-Gm-Gg: AZuq6aJj+ZC2lTkpRFsAYYJXQSBpMMFQ7pFKsoXAdu7D2hmiJ4s8ncapfM51XaZTmfH
	t5mohp/JRn4DRikAMIitwGRnJEUZ1ZxgFwYarom++/17JoSYshLPF6xiqy1/uMkdVj3LbpAmxFX
	YBOO/ZigGbl5jAyMJ5Y50tHoK/AwlyYEW1Ii/qB7u47c7pY968TJV2Hf540JXEneFNu0Jz1Ohjt
	sqgK3qmC1Q7wX+0sZImeTX7VIlJnlvJboIwghpxjhtZk3WxlQ0ppmJAAjOeAR6Kd6P4XuXH
X-Received: by 2002:a05:622a:34c:b0:4f1:a61a:1e8 with SMTP id
 d75a77b69052e-505d29ee0b0mr171561cf.10.1769710435542; Thu, 29 Jan 2026
 10:13:55 -0800 (PST)
MIME-Version: 1.0
References: <20260126121655.1641736-1-maz@kernel.org> <20260126121655.1641736-14-maz@kernel.org>
 <CA+EHjTw_4WJgiS7vTUprvJOjdNrnW=sjhazCkU9eQW8BUYuZZw@mail.gmail.com>
 <86a4xwbakk.wl-maz@kernel.org> <868qdgb8ct.wl-maz@kernel.org>
In-Reply-To: <868qdgb8ct.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 29 Jan 2026 18:13:18 +0000
X-Gm-Features: AZwV_QgctsLMiyW-LHXWNuYMwH3G1Jg_V-pn8ePMlloILfrF3aUeUb1VzhoKoQ0
Message-ID: <CA+EHjTwxS_xvQqsOJw7PzZBD5Z-oM14z1VwSTC5dCS+79DEpfQ@mail.gmail.com>
Subject: Re: [PATCH 13/20] KVM: arm64: Move RESx into individual register descriptors
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oupton@kernel.org>, 
	Zenghui Yu <yuzenghui@huawei.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_101402_075046_BA127807 
X-CRM114-Status: GOOD (  18.94  )
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

>
> Actually, this interacts badly with check_feat_map(), which tries to
> find whether we have fully populated the registers, excluding the RESx
> bits. But since we consider E2H to be a reserved but, we end-up with:
>
> [    0.141317] kvm [1]: Undefined HCR_EL2 behaviour, bits 0000000400000000
>
> With my approach, it was possible to distinguish the architecturally
> RESx bits (defined as RES0 or RES1), as they were the only ones with
> the FORCE_RESx attribute.
>
> I can work around it with
>
> diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
> index 364bdd1e5be51..398458f4a6b7b 100644
> --- a/arch/arm64/kvm/config.c
> +++ b/arch/arm64/kvm/config.c
> @@ -1283,7 +1283,7 @@ static void __init check_feat_map(const struct reg_bits_to_feat_map *map,
>         u64 mask = 0;
>
>         for (int i = 0; i < map_size; i++)
> -               if (!(map[i].flags & FORCE_RESx))
> +               if (!(map[i].flags & FORCE_RESx) || !(map[i].bits & resx))
>                         mask |= map[i].bits;
>
>         if (mask != ~resx)
>
> but it becomes a bit awkward...

If it becomes more complicated than the original, then what's the
point. Up to you whether you want to try to pursue this or not. From
my part:

Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks,
/fuad




>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.
>

