Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210ADC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rLGnKKW2QVH83jr7sLdLSDsyrmFRn2bnko/hsD8r/Pg=; b=nB5h2YfWSOXY0S2I+NFWoSJS0H
	bSHR0+ylanaZVc+DwNeFsw0CXvlb0+k8WHxrfltD1ghlNBBxEFAI/rpzxsfHzodJ8izsRa1+hPC4u
	ivVh/aKrBnHlTMh8LUnkD7Nk/kn3oCc5j/DPo2vx5QqvMTATCpUBjI5POtfeXKb+AYBe3DKacUqNQ
	qU5uycXqikUm3HUMTWKGYA4SaYe1yORc0q485AInvUsS+XF3daxW9qnvmUspJXDlp3FnqQGRaUKhM
	cZxz9BkjTe6XXLklOFf2M/vBtJ77Ty82AqM1G1NL4f5I9ry3cwQZDaY5cy8kf2jHRzEG2389pcUF3
	KienU7Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpegu-00000006oxS-0pMi;
	Wed, 05 Mar 2025 02:41:00 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeey-00000006oc1-3oyY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:39:02 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30bb64a4060so25262081fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142339; x=1741747139; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rLGnKKW2QVH83jr7sLdLSDsyrmFRn2bnko/hsD8r/Pg=;
        b=WIPkfMBfo9/6jYmrT3j7KgRd/Sp5QPVIeXLXFN2yhy+VoBpXNYGYMOENg1nxxLwY2I
         z3hYJEh2TL8edIHsqk/0DdZ6k6+J+mUqW3BM8hYVvzh3YMYAmgTdMSBqmt75ivLvWhH3
         d6C35Q74YDtp1g2LywBqv6QiKl5DVBCSDkiwBPkq/h9fZ5dgvOSG688A8KJDKp5eZz1k
         7K8hiO7/6zlda44gYXfiKqrrcb38Jbwen9olHroI/Yx4hY8CW7/bz4hAnNSHIgavR8+8
         5HMdVBxEikk4e1HX3BcOnOtVMcwoKVkvZlCX2u9KnWh4fZwSlVq1M0SO3GMbR3HeVfut
         1vMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142339; x=1741747139;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLGnKKW2QVH83jr7sLdLSDsyrmFRn2bnko/hsD8r/Pg=;
        b=drPetDW4mSEr/NH5OPwCibofa4KxE4OExDXN+NIiuk4vF1ssMNRZQoFjp5bzpGqMnJ
         DlwumRiSSCPjZgMq9oZJcgz86hUNUnC0ibDal4yzuhRn/9qIm54XBw06ApOZeqzeLdPh
         anq/t8ifSLvCLkRHEmU1FnKRi4y3EPCp80Oa88Borl7ESNjsqd6OrxUhIl3LYb2neHMR
         yyoXfOnRt2wnjTAfSDws8xrDpcangY2i1Xl/aeJJr1DxuttInjDa+S8aJ2IeRl5gaiNY
         WGaDAJ3g2ieziqqUPHOclrzVlTHm2VX+TfASd6BDJPU4P2f6kHH6ozv1mzxcm7wv16CS
         N05w==
X-Forwarded-Encrypted: i=1; AJvYcCU/Ya05KPeRNt2hMlVxsIJebr+mOJ00cpQlEVCgWVz+ZUsgQLrx+nqqN2+WHWLsKmz1XegU4mzePMScSomGy1qI@lists.infradead.org
X-Gm-Message-State: AOJu0YzQcgyVvR59xd1L/b6bhz9une+BMXpGP6cEGFoeTsJwYeAzm/AO
	EBb1f0mEdI84UrP48X8gGpNj4bcsZ+rr12pVHi/iVQ2cUlcZVEe7n4M2XDu3jxQ=
X-Gm-Gg: ASbGncvLinsGjU+11MA5hyBsNsagpkQhdYg6VIMyzxYHAexasHf5dyLZ/fufZwN7FNo
	nnf0HtGw5/PyaS9als0X7V+pfR8X9lujh77XyPSIHvdWwKGvuOzN0JTa5sVlGyjIE47FL8GGkZw
	oBCFwKa8re3OFyeWU5wAmWX+4HjFy/AUWDW5fL5ss0XFTlhwLylkz9nnkTnzI9MxKsj63Yx4rKW
	XU660Lkm9EJr5MC48gt87OWDNIqS6FM2WP6EFbsqz8nZfcbw0dpuee+H8mJFGxUcgAe9pe1ml+G
	GIsniY7BevCsCilijzvans4eja0GUoQwTjSzc5BI208uwXUQsTU9pfaI8Ck2SwnVFAFgIJmpsj+
	Wx+x7AH9c1DOAEnK+zffkt+MI
X-Google-Smtp-Source: AGHT+IFcXeQaKKWQj1dnu4UH8WH8BgBFKYFWB8PfbtIdp7r23eOpCjIksDm9zsbkHWStqwV0YfIVwg==
X-Received: by 2002:a2e:be10:0:b0:308:e5e8:9d4c with SMTP id 38308e7fff4ca-30bd7af5da7mr4043671fa.28.1741142339042;
        Tue, 04 Mar 2025 18:38:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30bc7264141sm5553261fa.13.2025.03.04.18.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:38:57 -0800 (PST)
Date: Wed, 5 Mar 2025 04:38:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 5/9] phy: qcom: Update description for QCOM based
 eUSB2 repeater
Message-ID: <6e742b2dke3pcqq3v6nzs3gfvwau4sk4gtadzgca2zk5merzvi@ubc6l3hsafok>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_183900_947347_9FA1446B 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, Mar 04, 2025 at 01:56:38PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
> different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
> needs to be updated to remove associations to a specific vendor.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

