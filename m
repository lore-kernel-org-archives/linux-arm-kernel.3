Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F0CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNxP0LFln0zgtOWEPbGccnsmPf7gfq1YwGA1WaBfZX8=; b=k8m5whxTsLMSkeqPIn2LrJEyL3
	6gffanwJq/kNbtxdNkf4qprfnMjLaZz/HXNBDoiszlF27BLjG7yovkzIcLrZSA73oboZ2yAloJfC2
	BpiBJ8spfTSPqEd6fGdCdF0BiWAssNtklDH/Uk96MyjpuX+8/Qv5oS6XpJlgZeIqdPOWgh5hk6Ctv
	s1I2Zihg3GA4xEqxSFSD7004X3NvO+l5l2BWKZ7Ao0WlPERNPuf9u1vS8X7S8Dn0oJqoE8m24bu72
	GF+R8CS7qhhNfQnZ0Qleg0jVQdneLOMNhaGlhlQXKcIwRq/1jDLvM5dnFwZikhyJ2lWfYtWYiSngY
	EDQaKE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFc5-0000000GwW6-49DY;
	Thu, 05 Dec 2024 17:26:06 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFS9-0000000Gu9c-41Xd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 17:15:51 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53e1f673ca8so1335296e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 09:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733418948; x=1734023748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNxP0LFln0zgtOWEPbGccnsmPf7gfq1YwGA1WaBfZX8=;
        b=CEkpbSFzL0qXSrz7ZjCTBkexTpedsA6NkmZZ+kzIhdE8MbqrVn9cRjY3KBk3HQiMKj
         5B8G4Eb2fmoSuQAkPTMMavDsLO5ZEZW9xOHVaXJWpnynO80F71oxgULk7rYs8jixTG8F
         wGD9B5CIET9cwArY0uusrEtAGVIMwE423v7BggTjQMKMzV/HiidzPnT2DEFwTx4PY49L
         NAK5vFe1QwzuDv15J577XMxN191gXdJzfGjSmIYYMnFVvU2Ny9BGdaKn/ue39KClgc+I
         RLdw1hEFzfrCvUZakLxL3JSuBtUSqhCg/y4zAWRpGVIJlJ6V57fShuxxzS1uSmKMu6K4
         H23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418948; x=1734023748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNxP0LFln0zgtOWEPbGccnsmPf7gfq1YwGA1WaBfZX8=;
        b=cO5oXot4lhMEMlwiT+/FVq2zfhfJxbbYt7eKxxFYaGHQORvLL1SG6wngZz1eeQ8QsS
         pmfaUKk9dHAcNi8QjD6qCaTEgoQ+CCXvi7vw8BbbK/99UTnfrMm4YPhTbX0K2nbPxcbf
         1dRiSaReft5P6txufSzUrRpCTcWfd/xInOOrXs+alRPkIb2iiW1XdahAkWkDB7MvJcb2
         pl1j4ZoAq46kFsuLnvI5GpcJeBvqw1ezyio1irowY4+G5FfpMGZ3aWFlOj0KDQYJAusH
         ZmXNA1+QcwwT0TW+IRB178L2DW9ueAleIrnl05mD8dVd28ErE2Bl8GFmqN06DRY8vTn/
         /ZLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvbIcjtCO2t9XGPUb7oWLFDPhtYrpwEVtZ7plM+N+tw1tll7cNY6x9D1IFYfM6om4pIsgKSk7SRnlBVOwcA9ML@lists.infradead.org
X-Gm-Message-State: AOJu0YyZRJC65GQr+kBn7oNt7JvgqIKcmJMkK/vjY1Ore5huGyWyicFL
	ebNkiZf9S/cCBsf4bo1aBGppOO88AEMg7o6aM260ruWGrzcDTg2oj/K2PMSEy5ge2Q9WytlAeS3
	s
X-Gm-Gg: ASbGncvJvUlUYx1mpu8KecLn0UKHGzjz+Aq6ULVcrjVLBHPM0TzDedSuJBZf94/JeVV
	H12n0ylD2ujvnV2pmzFDrvMGeB4QtTn9FoJUYlOWoK211PBb3Vw3t459asgGES4ldPNwJ0hW5Bs
	r+kOvcPSNfq5Tad2wwuX6CiojVRporZnPepFEzp+XGpZAjoxN+QBl/gcO+J3rkGYySCUyM8rNbL
	ffees8SV8Aq7qS9FnWLmzKJwOchBiONitQ/4T5olj2jNwTQ677eZZ4/bah9KMWiSf2hH8XFdvPs
	OJKj/56rwHlU+ICauGDZKECJUFn0mw==
X-Google-Smtp-Source: AGHT+IEyfN0BrcIPh71fjjX8E4/Bx32mFLWHQVrIs1Vx7rUsYWJpnXHHPExUIEGLfLu7e/b8DQpJFA==
X-Received: by 2002:a05:6512:3087:b0:53d:ed89:d78d with SMTP id 2adb3069b0e04-53e1b8785eamr3514553e87.5.1733418948210;
        Thu, 05 Dec 2024 09:15:48 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22947384sm293663e87.45.2024.12.05.09.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:15:46 -0800 (PST)
Date: Thu, 5 Dec 2024 19:15:44 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jishnu Prakash <quic_jprakash@quicinc.com>
Subject: Re: [PATCH v3 2/7] arm64: dts: qcom: Add PMD8028 PMIC
Message-ID: <jnqgccc6penjqmkhursdlbc46xctikvovfa26vlsvttxwqo5zv@uwh7fhixrmrz>
References: <20241204-sm8750_master_dt-v3-0-4d5a8269950b@quicinc.com>
 <20241204-sm8750_master_dt-v3-2-4d5a8269950b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-sm8750_master_dt-v3-2-4d5a8269950b@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_091549_997739_6E857FE1 
X-CRM114-Status: GOOD (  10.21  )
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

On Wed, Dec 04, 2024 at 03:18:02PM -0800, Melody Olvera wrote:
> Add descriptions of PMD8028 PMIC used on SM8750 platforms.
> 
> Signed-off-by: Jishnu Prakash <quic_jprakash@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi | 62 +++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry

