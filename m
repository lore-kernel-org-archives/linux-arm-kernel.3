Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0509C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=; b=0FO5CEnZ9D9HD0xGyYPNTIj73U
	hNY/H4Pt6sEOTQbEqlvFsuIcgOIiGEr817fLHa5WTbMf7xZtb9UezODKE/x7MYkatBP50Qxs+w7Jb
	vkUqsgnVhtm4QBVwNsndh5MgaEFNsZ1oL1tsJ3PrlIUil8NUSgj9Q0xIpuWuFLE8BCDHnJSmmId95
	59JI1Q5m4a+pUzumKYpGFsUbNh1T1ZBxAGDS3uuC5cQWuUXNofAR4TbZaB2bz2qMpczrzoj1ogHms
	YQGUteK8rK2MDDbn7J9r6IvkCnBwOVyUk2gXsyuj/jagC1T7XMqJIdTR8hnyLEdRniG2bQSv+L6C0
	PQMmm2sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQhM-0000000AWVC-1sjJ;
	Thu, 17 Jul 2025 15:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQBN-0000000ATNr-0UBx
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 17 Jul 2025 15:06:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=; b=bK0S7BV5KqA6OYr0TZgARK6fqc
	wKiNwFrz1bp8b1/Au/FKKp+TMPgj/GEkknl6v+wsl6bEf7KZJz8gKpN9MeX4xEPnBF8jtlyDMjQHT
	DwEK24Zvs2H+dTt6Nh1AMLNa+jLHXM0WjtJArCe/tD/AitQjx/B5PAwQQu+kODTxZ/hm7eo0QlEVq
	6yTg4rsuikK13iAU5IMyajncI5V7KvPQQA6TPiC6ZyFvbjPo9rOjjQPVb5L8Z2C7aYgoCxrp3bUJd
	4yflNChFZUhKQixkVLu/sLrvQufZ0BJSrLeQX7Jl9LnRUWgP+nmx5Ku4kYgaX0pPEL6TjMnoMuHCN
	3pi3T8uA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQBK-0000000AI9X-0cA2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:06:00 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b31d578e774so1569059a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 08:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752764755; x=1753369555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=;
        b=B4ZGa7b+jVJ84P+IUSDwVBEp3OZh68ZKVGm9YL7OWcNp/NXUmLorDlsAqxMEpbf9mI
         NlllI+k3CUnBGfMTrgALPzlC/82jTMFkgWWbwl6/DHXKJcodhaxs1WXF64HlVPIM7UrY
         xQtZ+lPOXagROZAXQs9jfWXRWi+2ncZANV4177Es+6qBZtENXYrLcqKpIIQn1PbMv+rn
         yZN6X8w58UrVm6orsH8fuFqygIA97UYugOf5YDYrcAUaHDJ7d/CWDftHct5bQ4iNQn0g
         vxt/1aEZ7Q89uhc7wMEhG1pTAGL9s3vzBqF6suqlbKKcM2K3mVUXkSgkV98Jy03JFi56
         S5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752764755; x=1753369555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRGgDk68DjbbOF0Mf8ErVPDVdO2Wa0CpF/l7W27oV/0=;
        b=jC+Juv7Xqxfxw/dKHMZnnNGB+2KZD25H0pF4espCHraAs/rvGfGa/ARVykFSVQMMFY
         t1QUp3DxskiboQlJgu5E9TTuMXmSYVh5YxLvUbpCeuq0FaL2V4bXAokXa4i3HPvZfDk4
         /YYRQLlPQILEtcNCI8dS5z3lYSUd87FjNuUoZwinHd3bBfayrJkgYIpb9zQZEA9EDJ1Y
         FJ/MFAsWVyP1eTOAfBlc0gkB3NcTl+0CcRXwVMdCiSe4n3qAOXdQYtET1Ge/glMrPP41
         cpGdVwkh7I9+sT5cRy3JHiKSPIXHml2xA0/K1k1t6i9qPeIOSNokOrB+JQz5CaTInYm7
         sNxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUn7nbFjAHIT/4FmAx/GJjschu2+n/Y6w6lilepBubafODo/FUd60lWBVrSUz2l+3vcjLsfEehwueOHoXheMPqi@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl5HPTwA2OqG3WOD9VIM/kbcLxcpN7YpvgJXKNtU3HdjGsh1Cp
	d1F9hKkGkGml1/ikWGPubzkjmoYdnSU7kg5nGOAI90oUXpvfbcJjbtP/M47Ft3Usr5Y=
X-Gm-Gg: ASbGncs3i0YHEumu7hVn/y6cUhLl+61+lUVL8ug98/CeuWKSf2Xs6Z8kDTQP0nrMKOE
	3zf9IYRpSzuRBKmA9QSeAfpkBpc2CxXFhHl5WN5ZCupkG3FSPsXOiQgj1lybVFjKlFhlQMEpuut
	/IBEb2k1mZd+EWt6O11QV2uYRyIGCWnYlnLxdJY7oRUoOSEplAccq+hf3ABdl0szNMv2lTmiVNB
	boiJfNNkBtUle1GA/SaMIrltU20mfbXGWSlvCyD6mo7COku7SJtM0gYzwp2KBSog6Q2vg8utBRD
	i5sTMRT8kAebSN9JO4rFF2+co8AY7tQf3BxInJHV32ICHICz6Uyfp3EWnnV83lk5iwyz+OixkRg
	xnFFFJn/1nyv0ju679QFXuVA=
X-Google-Smtp-Source: AGHT+IHlh4bBfrPfyZ+HtoQSqJqUSTaWT2KGepkcnD7iDpNKpIyWaajI2q3Ei5DglAzRDFNmmwxtvg==
X-Received: by 2002:a17:90b:2804:b0:312:dbcd:b93d with SMTP id 98e67ed59e1d1-31cc045a7b9mr187971a91.14.1752764755374;
        Thu, 17 Jul 2025 08:05:55 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2874f9sm3475334a91.24.2025.07.17.08.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 08:05:54 -0700 (PDT)
Date: Thu, 17 Jul 2025 20:35:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: st: spear: Use generic "ethernet" as node name
Message-ID: <20250717150552.6kj6xqksc2xxpxli@vireshk-i7>
References: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717142245.92492-2-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_160558_345814_60E52BF5 
X-CRM114-Status: GOOD (  10.83  )
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

On 17-07-25, 16:22, Krzysztof Kozlowski wrote:
> Common name for Ethernet controllers is "ethernet", not "eth", also
> recommended by Devicetree specification in "Generic Names
> Recommendation".  Verified lack of impact using dtx_diff.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/st/spear1310-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear1310.dtsi    | 8 ++++----
>  arch/arm/boot/dts/st/spear1340-evb.dts | 2 +-
>  arch/arm/boot/dts/st/spear13xx.dtsi    | 2 +-
>  arch/arm/boot/dts/st/spear300-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear310-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear320-evb.dts  | 2 +-
>  arch/arm/boot/dts/st/spear3xx.dtsi     | 2 +-
>  8 files changed, 11 insertions(+), 11 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

