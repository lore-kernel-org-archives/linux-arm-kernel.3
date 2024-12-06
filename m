Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91FE2E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=doyX61/UjfisMnmB4zlyVxfi8RF1xe0m5OcRsC75Zuo=; b=O1ASe8dUbxlEcwjNDZQkqaYSdV
	x8AyHZ3KDg532awD7evUDZMkhN+DBv6mNc9fqRBO4sBP+hTTgaw9puuSLZyhRyBNA5iQBRa/txfzn
	HXp2LQ5PRT3q4ADZX5Rsnb1yOcgT0S4N6xUdKvOw6jqDAlfssvnR9jSeOGV6ZkJMcuzUCDDatNJrj
	q6rqqmTRav4KPwHzO9BwZz00ov9Kdq/560uC4nDBFNYy+s19nmbLHx0H/hqK3KeivfxqmYprW0Qdd
	5tUrEUO1ckpEBf5kqshzqobAKsemz+6H52WqB7yTVqvCRD89eTKwv9+N5n76C/fBwCHdGRRDMp2JJ
	2tDRzaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcCc-00000002M4V-3HvE;
	Fri, 06 Dec 2024 17:33:18 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcBO-00000002LrX-2H94
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:32:03 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a9e44654ae3so376360766b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733506320; x=1734111120; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=doyX61/UjfisMnmB4zlyVxfi8RF1xe0m5OcRsC75Zuo=;
        b=qfCHLOYkTvsyC48n7RUbQqo+xCh8FEBpUeuBE2NcIQyjokhMST9GjosuOkZjiwjTk5
         LbjNND+PlNNyzUMjo2vhLKWFR0joXLfYt1aFo6MHf4I1Zh/vyUk1OMQpDf7RJRKzFC9l
         DkfpbnTNYR/6APUOZoUG97OT22vbKImsK6kdej6tcq03dbRFxdVVzRrPBuT0fRsmou5B
         RHvdLPyIKuyjyzwkE993ZbA6g/0k4C08d3aAMHy3WhEZcdUfdAmQIDwNnDWxzgLi9aIs
         5zC14dJ69AXfNHVTKTRJhcvtltbjDeDNgNfGj+3iitREUeoazqFo9Jq+errq11ZQq+Ua
         9sEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733506320; x=1734111120;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=doyX61/UjfisMnmB4zlyVxfi8RF1xe0m5OcRsC75Zuo=;
        b=OBwhXoC08ghvBCfoNvYWknd5Lx1HdH0ia0hd3Y5LzUWzSzeli1gVyOIXrMM2cD77Qf
         s+xtNFJMYeWTTrM62oOMfdt9VirFG5V4fbaoJhWHWkaGnb73eIh44Wpr+uEDhUiX05fz
         OPxZTVOqNc3pEu7N4GvgF6NaLlHEsHVhoiJKUtuMruVwvezx1k3qVFeBkJtD/NN/cs3Z
         zWBcl+sTDiInOmUVj7ORAeVIodyVdk5hATLLnR8sVGgEtG1zg9MhiD9RuovTpMjtJCxW
         Snr21KDVlQ6eUXSEZwEWCiqF9DUQ44dyqlxTWw6YkkzosKOHmO9B7HqMGiFj3Uq3LmIg
         ZiWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWv7SPiR4e4JQTFaHQtYXWtvKadeyEE+zReQiSZ5ddoVlZTjuDYrqkS2MM2fKITzqofXB5y5wZ6Dl8LwqnclRIK@lists.infradead.org
X-Gm-Message-State: AOJu0Yx65laDXI/U6c4RJGlyM/tVzzKBWw34NLdC9VjXb4NIsO8YPXPZ
	CmsRKvw6ZcZckolNMgW60impbP2WgAI6Nmj++g0XdTET6xUchsTGGnVu9dhmRw==
X-Gm-Gg: ASbGncvhyeM+wLiBpqWI1rWN3Y93aR5WAEc8pzilgsRAYopeKo/3PlwEXblBLG3gt0H
	7SqsWr2U+y5BRMU9/A5vqiXpBa9JZWljJc8G/R4JyvgPzTNJV5p5hptGhI283WZDccVEZlUlDgJ
	rYL/AjAvr8EpugN52r972wvgvgjK4/YgGwkuKAVTos55BP3hmAsmJ/MxbzgcuodopeOLKyC0dJm
	EHFw2GZn3M/YgadoDbE74R8Rxjo0l53XZP9/R+J2GEmDsocr6xfjBDHpPIwetZyUEfvCN9AFWJS
	g/zWbxil
X-Google-Smtp-Source: AGHT+IGEieJLIbKw0zIu3BVBJZ8gMYSJUZuYoU0fobP25yd/vSbTF7HBZ8ltnsHPA+wF8CK2h2csdA==
X-Received: by 2002:a17:906:31ce:b0:aa5:358f:1eea with SMTP id a640c23a62f3a-aa63a00ac06mr351706066b.16.1733506320425;
        Fri, 06 Dec 2024 09:32:00 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm268395966b.87.2024.12.06.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:32:00 -0800 (PST)
Date: Fri, 6 Dec 2024 17:31:57 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 06/14] KVM: arm64: Set protected VM traps based on its
 view of feature registers
Message-ID: <Z1M1DYbvuqAEU5c-@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-7-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-7-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_093202_576902_91C43DF6 
X-CRM114-Status: GOOD (  11.29  )
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

On Monday 02 Dec 2024 at 15:47:33 (+0000), Fuad Tabba wrote:
>  static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
>  {
> -	const u64 id_aa64pfr0 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR0_EL1);
> -	const u64 id_aa64pfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64PFR1_EL1);
> -	const u64 id_aa64mmfr1 = pvm_read_id_reg(vcpu, SYS_ID_AA64MMFR1_EL1);
> +	struct kvm *kvm = vcpu->kvm;
>  	u64 val = vcpu->arch.hcr_el2;
>  
>  	/* No support for AArch32. */
> @@ -70,25 +68,20 @@ static void pvm_init_traps_hcr(struct kvm_vcpu *vcpu)
>  	 */
>  	val |= HCR_TACR | HCR_TIDCP | HCR_TID3 | HCR_TID1;
>  
> -	/* Trap RAS unless all current versions are supported */
> -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_RAS), id_aa64pfr0) <
> -	    ID_AA64PFR0_EL1_RAS_V1P1) {
> +	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, IMP)) {

I'm admittedly getting a bit lost in the kvm_has_feat() macro maze, but
should this be:

	if (!kvm_has_feat(kvm, ID_AA64PFR0_EL1, RAS, V1P1))

to replicate the existing check?

>  		val |= HCR_TERR | HCR_TEA;
>  		val &= ~(HCR_FIEN);
>  	}

