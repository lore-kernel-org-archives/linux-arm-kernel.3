Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80A88E6ADDE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Nov 2024 04:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRhFfCU54K+2vGl9KCGpU43DH6Z3TBwkPWpTyROlHtc=; b=2XK6qKicXrustUWfD1QIQU1IGH
	151UfIedykmemiyS8cjwg9BwlzI+A3gNkTXIE4QaLm8sdpYtpdII1w+lsHegWUb6PTgdHCpZ2U6oD
	664Y8pXq0e91Yzw0MPvX4nWlyCsyOuk1HVVOfWGT8gin2YMKHWq4YYzckOD2FAfR8V7PMxQQ52R65
	YE339FXM1b7RdobLpqvqiYfMhbJ/Bl1gmVQJT8xpB/pngJ9/BuH8VIljBUM1zwM6jiHrr8ItT9m7Z
	QrZLrDWHZzywFv4e/hV+HJoj2vKKo1FxMnSsGIFgWVs0BdqCfEPXsv1pD3koiOhGsFAudEucWzzN1
	trIwKxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEhiT-00000003kLv-3CuA;
	Sat, 23 Nov 2024 04:25:53 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEhhX-00000003kGM-0Sv0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Nov 2024 04:24:56 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2fb3da341c9so30761781fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 20:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732335892; x=1732940692; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rRhFfCU54K+2vGl9KCGpU43DH6Z3TBwkPWpTyROlHtc=;
        b=gUZeIwcOnQc3jYaaZP4RX5hk4RD2EF93HT2e9SP1HLUlWFIVHlpAySeYsvclUUqjEX
         DUSFvCIM30DPo87aOtSjguF6+seNwk2DcLZ+d3/DgZwkIV53IP8et9zyqCXRS4vc3k0v
         sQ2qYh+ib7J4MBFkHVqZtmvy53UK1b9DDdtwafcl5pEedAEVsU1FktPTyealhu4A2Mjb
         Du8DwyBJkIYmBQk2LyNJORovhMX9xMd430mC9in61gwv5mCXQ0v69KyvGjeIQP9+zWPV
         VOqLzrulPmajxd2lLQe+f6KO+A0WTkxZhGkti1zjJHX6C5/pScSBY8TOnSo6UAjJ5tjN
         IhxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732335892; x=1732940692;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRhFfCU54K+2vGl9KCGpU43DH6Z3TBwkPWpTyROlHtc=;
        b=MX7lkV1+qFgzVkGQsqSCTV+A6cGK1t6LEBm3VmR7tv37AfvadIIxWEPd07vGgES/kr
         DSty2g07la73UDIO/t4NveZxoD+n1s+lT/55gXw+5U6/aKzPxKZ2aUI5cOXCWZvwwAF+
         ACWlUA7pgA4YUzLxKnoaJ+Jw/s3kI4F5OZJbPZA50DeIJ+l5eNYJNJqgUi7Bc1l3li/3
         jGFovANzSByDjYfsvRA6TcFOTQ1RPDHY6XPbpFegkVQvzRbEf2R5nOSr10VzvtnuxWzp
         PTVFdafmABkgS9/Y+YFD3jwfilJSaUYkC+XrfSfnJ/jrjLqvyyRt4qAroRNT1yBNajSq
         LqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcHbNVQqTkBbtN6qHEdLRxAw2jTtY0plFOZZrgShv26rd9kr/2wSYqempS8Ae3/JzaYt3L7Dj5bNDVDfB0pl5f@lists.infradead.org
X-Gm-Message-State: AOJu0YxFB/bzb8Rr4Eq8o78g72NVPHDJxMjtOvy/xKuJvmgODsxwOo6w
	zArKxuNLjjMlB/xoMJIqE6XNSJA936Gudl7mRw4AwtsiZExn2ANM6Acl0FFx01E=
X-Gm-Gg: ASbGnctQsDYj4vFDcKoQcGEZr7Ra7TO4+rBxurTr7qwMLuu/lCxCTmCnu7t9TKw1dbN
	vAr8EWGrSpjOwSKn8+0VzqWBrbDDzkBN08Dd/izNj0sVloYreP4yU/Qb6VR9Wd9mzTjAgF7npAE
	ELkW5fcDI5P9E4EjUaBiiOME5k4oEKxxxAEZTOp5m6qoDcDxsn9yKnuP5yilXEtfeXgXRQHUvxp
	1LqhTyEq6BgZl/UZIj4H+bbmfHYM1g3WdOen6jOMSdwfbNc2gvCdhjPrlIaEYcabt8CUk4kn+6G
	0rpNSgoMkKRZTDS5nvxPBWzdEBDBJw==
X-Google-Smtp-Source: AGHT+IFdByuwlVrForEzT8tv23srj0gnAIFOKpmn1yRMnyw6GbJuVEjWF46wgEUprlaX5HOFYnyPnA==
X-Received: by 2002:a05:651c:1594:b0:2fb:cc0:2a05 with SMTP id 38308e7fff4ca-2ffa71c4f76mr33073991fa.37.1732335892280;
        Fri, 22 Nov 2024 20:24:52 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa5375d8esm6320591fa.89.2024.11.22.20.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 20:24:51 -0800 (PST)
Date: Sat, 23 Nov 2024 06:24:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: robdclark@gmail.com, will@kernel.org, robin.murphy@arm.com, 
	joro@8bytes.org, jgg@ziepe.ca, jsnitsel@redhat.com, robh@kernel.org, 
	krzysztof.kozlowski@linaro.org, quic_c_gdjako@quicinc.com, iommu@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v17 4/5] iommu/arm-smmu: introduction of ACTLR for
 custom prefetcher settings
Message-ID: <w3rqdjygedgwsacn4ybajvv3fwuhhaaazo5x7zqcip7xdtf4lo@shwsl5acgqzk>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
 <20241114160721.1527934-5-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114160721.1527934-5-quic_bibekkum@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_202455_260289_10746CC0 
X-CRM114-Status: GOOD (  13.66  )
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

On Thu, Nov 14, 2024 at 09:37:20PM +0530, Bibek Kumar Patro wrote:
> Currently in Qualcomm  SoCs the default prefetch is set to 1 which allows
> the TLB to fetch just the next page table. MMU-500 features ACTLR
> register which is implementation defined and is used for Qualcomm SoCs
> to have a custom prefetch setting enabling TLB to prefetch the next set
> of page tables accordingly allowing for faster translations.
> 
> ACTLR value is unique for each SMR (Stream matching register) and stored
> in a pre-populated table. This value is set to the register during
> context bank initialisation.
> 
> Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  1 +
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

