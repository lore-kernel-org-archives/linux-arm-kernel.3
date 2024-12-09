Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA213E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X5GxAyEJ02mNywENRB0ow462CYy8FP4+RIO5DD9Q3DQ=; b=qV05KkSXQK2Bujs7vg+vF0C0cC
	E3QHU91J366OmTThywHYl54e8fPP1kqN8hCDZdtPj2OteqWzOL/7H+RzAGcpwhP73lMqU1uNbXqjV
	0K/37NCGLtxtr2Y1tzDkXtX15aeYzas+u1opJvnfugBfydukSfmuFIlFPpuVHQoy2g4nNykKmxwge
	DgJyG0pSKlPrkligdQg1IMZeIUFzfaqH4lKl0ClemC7ONft7kYoeIMGGcBJBdPYEBSgBZdHR2py9u
	ZU/dKufy3vf0J1OrtpnnbqXV7HzNOtyO11KQh+pAbInt/FhSdXZbjkdPCYtQJWvEMlTg/4ns01PsL
	ZaDpBURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmu4-00000009WCS-2nP4;
	Mon, 09 Dec 2024 23:11:00 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmt1-00000009W38-3oCq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:09:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e3778bffdso3480431e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733785794; x=1734390594; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5GxAyEJ02mNywENRB0ow462CYy8FP4+RIO5DD9Q3DQ=;
        b=v3nhpoyILeDB8oxbWuxwTtEhWyxAGONgu/sHgriuxZ+4H6Jo/iF7VIh5sKZt0cFex6
         jhp7qbrO/TuiZTzPNZjS2GO5Y4kFq7vJqhDTa8Gw3Q7BjhJUq+n+64ZtGlm/FxE+3Svt
         sipZakObRzCd3quDKK7VvnMFKjdwl6hXojJFY6esBnV6L0VHw0mbQFH4F4tVh0Lxfowm
         hozCZZr39Bi/lnTav4VikclSlRAdbLIEwtMtHe/teNMywEhvOY4eH+7Obn4+THaunNPt
         iH1ezYB7hikGlQrvmKn3PKrl6EaIRzorf/6yW7hpqHnt/teqb73JN5hGENblKRoMSMr/
         Rr/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785794; x=1734390594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5GxAyEJ02mNywENRB0ow462CYy8FP4+RIO5DD9Q3DQ=;
        b=gqI1jHQtGoKwyAyRRV8rHYj+8F2w+MCrgH8Thw6DAZvO2xkrjEQnhAmQ95mEtYvb5Z
         wEZHHt2SCLwXfw8umlqTylWR4zKvu06/i2a3O7NjGv3WQ2L9J2+ETJXuTM7uJTcxR6Mk
         fbD0kAO5qPz/i8srajVrRh30AVgc3Cw7cWi72CxQYW0e6/+SHNFPEqowuwtrBT6jUCnA
         5AQ6DinZltKjvIX3INjkN9wk+UKBIddWdRh4cJo8GRpwL0ddugNfCEPnmmS3GFEtvRsL
         6cbS4/kgKIc4MVLo9vnNz7ll4ECCTb2193nypND18ecBhZk5cV8k2/EtA+oA0ZaISM3p
         oqrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsmejQAyjRcaU3OIuXTcgt0F/Tf5lb6Hy2V529urnWwMwxrQSfdBR8SgeI+x1eKHz/DnOhKQcl0+hIZoaH5+3N@lists.infradead.org
X-Gm-Message-State: AOJu0YwrTewDpK/PcGz3xeGvqojHnJ+xRQbp5oNpQnhIqSTxjDXCl1T0
	e3Sv0C9FEjB8aPxwJeaQ/1xsSrrwTdxfC07ncDymXAZFRh0pfA9c1ONwISGkFiw=
X-Gm-Gg: ASbGncung7vqhUcOkuMF0N/MfERtSsG6mQeNAPL9NEVEi63osdWGzpNjPEv6LXtlAcj
	5Qogyc4RZFoBywyIALN4ruE57ZcQPcQtEJTcyk5PQX+b0iPt/x5uzQ47jWmXzQSOC0DDFUCt1+X
	X5sEm9638z8kyrzl4UHUjYjS8MPzvCnxR6HRpaePEbm/w05SE/DDc0MOC/u3IF71xJOjx/P1o/J
	wJcfBHyb+UpKc4DlVBKgVQfVCyfxrcKqP2At4ZpOC7jdQGaKrW92XIfPI7Qr2/ycBUl5NxUv8q2
	livCmf+8WCMV8Rws1KAWwM4KhrgycW1sbg==
X-Google-Smtp-Source: AGHT+IEWUgkaAToyp2VN/parQthrjJOBjUFhHTXot4xiCZm20ehVs3l2DKi/nv5nOESXxYx9J35VJQ==
X-Received: by 2002:a05:6512:3990:b0:53d:a321:db74 with SMTP id 2adb3069b0e04-5402411a69cmr871586e87.50.1733785793813;
        Mon, 09 Dec 2024 15:09:53 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e39fb61d3sm967973e87.22.2024.12.09.15.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:09:52 -0800 (PST)
Date: Tue, 10 Dec 2024 01:09:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] arm64: errata: Add QCOM_KRYO_6XX_GOLD/PRIME to the
 spectre_bhb_k32_list
Message-ID: <tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.6.I722621804be859e4ae4b7479ce191c5e3367b37c@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_150955_958926_B4FDAF44 
X-CRM114-Status: GOOD (  20.15  )
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

On Mon, Dec 09, 2024 at 09:43:16AM -0800, Douglas Anderson wrote:
> Qualcomm Kryo 600-series Gold cores appear to have a derivative of an
> ARM Cortex A78 / ARM Cortex X1 in them. Since these need Spectre
> mitigation then the Kyro 600-series Gold/Prime cores also should need
> Spectre mitigation.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Yes. I know. This patch DOESN'T COMPILE because
> MIDR_QCOM_KRYO_6XX_GOLD and MIDR_QCOM_KRYO_6XX_PRIME are not
> defined. Those value needs to come from Qualcomm or from testing on
> hardware, which I don't have. Qualcomm needs to chime in to confirm
> that this Spectre mitigation is correct anyway, though. I'm including
> this patch so it's obvious that I think these cores also need the
> mitigation.

SM8350 (Kryo 680) identifies itself as 0x41/0xd44 (Prime), 0x41/0xd41
(Gold) and 0x41/0xd05 (Silver)

> 
>  arch/arm64/kernel/proton-pack.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index 212481726f04..67aa54017dea 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -860,6 +860,8 @@ u8 spectre_bhb_loop_affected(int scope)
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_X2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N2),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_V1),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_GOLD),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_6XX_PRIME),
>  			{},
>  		};
>  		static const struct midr_range spectre_bhb_k24_list[] = {
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

