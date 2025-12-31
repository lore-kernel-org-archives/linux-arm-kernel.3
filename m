Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A995EE57D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMKqMGemPPjdCG84b9FHntGq+a5h25At3ePNUELMt3s=; b=F4/y+XKZMbzXS/3pZEntNUHxsq
	kc9nTX4tvKmoufxl00+v5y6AH/ZG3VlahvTO1HhCIIJ5NuPyfeh0W0xsFZkVyHl7ZpNBALCU3RsYF
	S9xPBfgKge9kU8xsPYsc4LvL7s1W1xONDWJ7iyL3lFDxEYu/N2uBAwSDdAyYGbkLMUVCH940dD03B
	wc9CFjbZtH1UrzQJ637RwXC8NPlm7KPUWM1UgDCEDIqRDymZhM/uRuPgDUSI0sStnyV/ye7EgNJtG
	gVx49qJMWyfCnFsFQL5HIylIOtGk+HICUWSgDtHU45PxCg6FcamDQqacaGF6Pv3Xd7W8q3KDziU1E
	MqTgcStA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varfw-00000005nO4-3DsK;
	Wed, 31 Dec 2025 08:35:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1varfu-00000005nNi-324O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 08:35:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-34be2be4b7cso7047996a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 00:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767170121; x=1767774921; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lMKqMGemPPjdCG84b9FHntGq+a5h25At3ePNUELMt3s=;
        b=Z6VOZeUiBDzOnsqeANpWxrfh4ItL4ROyJj/Tq9eWDJ77zsMUs0liUSRqnnZ6QntfE5
         SohX3dHmtBbHfstPROsbaRQNIuC1IbNUYbpZJHm/KmmTfYTmgEadi5ghB4JkAvLiTqdy
         SQvd5jugdgcoahZPVvsTyEBoh6pJ+gQ2jljM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767170121; x=1767774921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMKqMGemPPjdCG84b9FHntGq+a5h25At3ePNUELMt3s=;
        b=codZTPBiIyDAVTXBp4LNAFT2whdqqNAv8CUz+KJaQAYPLy1aWHjZXgVN9K908S0s8u
         D6G8L+finr2jEezt6+Xli97rLZI/P+d0ZrWq6UDqiq3Z2p7egjoheGf/lWtnVibfMChj
         iEvC/sa3VACe0U9EAVtPbPKSEjEW770ufTb67Kdsctos1lFtluPgCv+6CEyHOQ5Ohyba
         ATSmcZtkbUD4PQ64jWdxdiUi9MWjZGsNox2xgokYsOAxz9nxQF08nHrjKctr/wfspw1h
         9B4pJL+mnoHmgzi8XyDN6nGWD/Z9rDIX7Rob2zvlkuheCjrUXdUBbhopq0JyG1/py7dU
         uAyw==
X-Forwarded-Encrypted: i=1; AJvYcCUAwjoRDM2jE2nmxzxGifMbPEzyHTvBeZiqmKeqky3nTGhEin/HSUyxnTvxfGSvKq8erE0M/LKYEnRoWl4wdyAm@lists.infradead.org
X-Gm-Message-State: AOJu0YxoAfmSj1AXys567zn2qEWxim1SfPA/RjYLRjjigDzyOz1arkcj
	EOBwTlqXX9NCLRuVF2cWx7bwFkKHpCVu7R34qbslU4NpGtXZ3HAmi+Dr46FVSd60/s7HshbjNaC
	4xm3++z1H44kPl74fZSYSyPlOpW7MUcS/ySR5SsZyLA==
X-Gm-Gg: AY/fxX7ILzXJiqtTAY8Sda6Bo5FUOQmOwx/msM+ypjKZ7/krfzf+ILKsi7CytzRowx4
	KavpBoI7ucSyElLGi6uHLHXXRNoswevqFn8kzKpjSwxclbiJ2pz2w0ek12nPDcd85asGt4Wjz5u
	mz/QuOfDN0iLSFWpGQjXJ3qrgc6AQ9DGqW0FFsGNVNM9bHQZ6qxyxl1ZVavdpUVL/+zhIfG3ibR
	PN+327w+EtURmejCSPHoj9AqwjxP23w4y+pV61uXJHyqGPXBwnl9VFz6EMR9xeD0ByGGppe
X-Google-Smtp-Source: AGHT+IFoAaoYC/2jANrrzdlBpQP2Be6bS0pCmSsvTo1rvhbI3foA1mfq71+S0MT/S4+2Ark09EfKRcG1W6gnHMKK/Bg=
X-Received: by 2002:a17:90b:3f90:b0:340:bc27:97bd with SMTP id
 98e67ed59e1d1-34e92129212mr27573326a91.9.1767170121490; Wed, 31 Dec 2025
 00:35:21 -0800 (PST)
MIME-Version: 1.0
References: <20251231025502.1139168-1-daniel@0x0f.com> <20251231025502.1139168-4-daniel@0x0f.com>
 <ac0f8b8d-f6e4-4d60-9931-e820417c1abc@kernel.org>
In-Reply-To: <ac0f8b8d-f6e4-4d60-9931-e820417c1abc@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Wed, 31 Dec 2025 17:35:10 +0900
X-Gm-Features: AQt7F2pd6uk6EOEYDt0DN6OMY9Af8Mwtizy1eUP8vnmKR7fOg8OiJOk9tsIY_jY
Message-ID: <CAFr9PXn_-Ep9HzwTEErZ4Wmm9X8Q2ZkRP1LfmaAMhbYNfJVFuQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm: dts: mstar: infinity: Correct opp table name
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: krzk+dt@kernel.org, romain.perier@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_003523_005790_133D48C7 
X-CRM114-Status: UNSURE (   6.75  )
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

Hi Krzysztof,

On Wed, 31 Dec 2025 at 16:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> These two should be squashed. Don't align node names with bindings per node.

Sorry, I cannot parse what that means.

Looking at the example in
Documentation/devicetree/bindings/opp/opp-v2.yaml it looks like it
should just be called opp-table?

Cheers,

Daniel

