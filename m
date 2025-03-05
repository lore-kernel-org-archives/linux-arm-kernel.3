Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61505C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 02:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=; b=p0xPo19Oz9EmFG/+TRN/7XBHkI
	yYynL8D4tNCaGdh+VbStq5HmN5QRudkTNA640J4iAitSN+BHHbKV5aaz9Xp6ULhuGwCjZVNOjykoR
	LzInvZjOKqhfE8NTy8nAA15zZZaNsYo70XCBGHvQgo1uKQTcoGxDOg+D85xxDZsLkpq08Wkqi1stf
	uT0MhzVA0SYh2LPn0ezD24EerL9i0E6QoxhoRfLNAn44WbP+FByo6tMePxA+Y0H2nSJUIkVlU+LdN
	ijXmyM2wM411EvsGmvz8UY/J3H9rAQw5beH1RZsKKPg0FjRO9+YOlE6xbA9T8CqBdpIXlyHIt3ye8
	tW74Y/hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpefL-00000006og1-3Shy;
	Wed, 05 Mar 2025 02:39:23 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpedl-00000006oSf-194x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:37:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5497590ffbbso1993738e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741142263; x=1741747063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=VovBAMj5CQTtjIr6FNeeVfGvi6oyErb8PeXKqA0qxzSf4HpHumPGLX3JGSPi0amo2L
         bLAiX1HVifZ/x7gp8Cybkxms35Z/eTM/90NVvqp/TX8oP9UCwGC6ihV7HJm5qwCl8G8T
         u2pBh9jfiuFewyUc40UReN1/5vu/ZasT2N9643H8sSMs0/rFRTpUOwxy8wGVS7wSIIm6
         xMWEPxa3tkPEckcv6lqmP5FeaerK1yIc9RdVrh/FFDfIj8vRS6sdcXjy1vSnInlfiZey
         X9PLKIYhVL+cA61XoURtYSIGszdM+gMNPLoZph5i2C93jxPbKo7TAr+3plp5XeQfeRTM
         Johw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741142263; x=1741747063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+97ZVr2GLGNMwRJ+JHGTl73f9HD8d4XIQHgo+B51+A=;
        b=ghXrv/qvDG8r7hUZPiOC7beTot0lC4O0ZBT85dzxxh8ZDGsL8Ej5Y8x/XKGPQaZVwk
         ox74DzslkPsjCLT0NW2+0tJ6+o2iqAVbIafZjhdDyPSdOBJRL9uNjZ6f87nZN88FlJQg
         2mNsK4a2+3L6kuu7ac0+AI1PdYnNq2Y1f7pUicWoioLdFY91ZDLnQBvIFAONAY56V18s
         UAz5EZAiDSEIyB7fcX36vQu9ots4tW2zXoKvty9Km+nhQJPrzZwDmJYBMwEQ/rzeTnm9
         owCA3A3cKo1yXSuDriN5zhlt7jGm8exxNCXnb5ayZmva7lhap8P0DTneC3v3XjDssJ4A
         p0xg==
X-Forwarded-Encrypted: i=1; AJvYcCUSbasJdCJFaed7dXTly6qvFRdosdgMxUpKw7AuhJulIQC+fRAAOQa9DzJXCLMZ4TnVurpC7zTbLSya/ah8FQka@lists.infradead.org
X-Gm-Message-State: AOJu0YxEkJusf9eMJf3K6V9sfDFzklFDTjnOmt/jdhycuMVncGEEbnJ7
	jIv+mXFMOBFGFuqRu5GIDz4JobBPB/msYgq3wZXnQXFZ0S/jTtbBb8vqtV4qSw4=
X-Gm-Gg: ASbGncuXHeRUgw20BSHTVYdhhVcdPDOkfVpkZhx4glKJTRFjRjyrCeMBfkuGx7l4thV
	Qons7g+zF2TCc7k724mYmJZNXZmMXvYyqUFL4CLHLMMl0nUWK/eKm8ReB8logEhu7mV4PNx+VOZ
	H4GAlxVebwXuY1FYNToBgi0W8Kdw4KhnWzCoUjMjky2E81OYe4zAsMmWGVagLBI9wvjF8CWgYdu
	titdHl9XndAkZgMaNZnY5pu3N1PVSck0jIbN+xXt/Ky+HEdirceGu0jqntKantSCta2629cR6V8
	51Q5W3wooV1fB2RNQfG6i8qbjTcJtWxwCbo47O7gXwLaBq2+iFngV7tIEy1w1Vqf6wvHQZPF339
	92YFIq6hgzYHVH7lvAS6x0ZSn
X-Google-Smtp-Source: AGHT+IExjENqSk5hjjIhys2YXSgdpIqL5VVjIyb8jsl9tsSbsyXgT3nWgdPRJ4khQWdE/LA6vVB24w==
X-Received: by 2002:a05:6512:693:b0:545:c7d:1790 with SMTP id 2adb3069b0e04-5497d336432mr449658e87.22.1741142262813;
        Tue, 04 Mar 2025 18:37:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5495ba98c6bsm1058122e87.232.2025.03.04.18.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:37:41 -0800 (PST)
Date: Wed, 5 Mar 2025 04:37:38 +0200
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
Subject: Re: [PATCH v2 4/9] phy: qcom: qmp-combo: Add new PHY sequences for
 SM8750
Message-ID: <jr4lvgumvnjhybvwuo7crpjhaogjvet2d7llt65qzstjnoekuj@zx6z3npa37xg>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-4-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_183745_302593_BF842CE0 
X-CRM114-Status: GOOD (  13.01  )
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

On Tue, Mar 04, 2025 at 01:56:37PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Add new register offsets and PHY values for SM8750. Some of the previous
> definitions can be leveraged from older PHY versions as offsets within
> registers have not changed. This also updates the PHY sequence that is
> recommended after running hardware characterization.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 221 +++++++++++++++++++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-usb-v8.h     |  38 ++++
>  drivers/phy/qualcomm/phy-qcom-qmp-pcs-v8.h         |  32 +++
>  drivers/phy/qualcomm/phy-qcom-qmp-qserdes-com-v8.h |  64 ++++++
>  .../phy/qualcomm/phy-qcom-qmp-qserdes-txrx-v8.h    |  68 +++++++
>  drivers/phy/qualcomm/phy-qcom-qmp.h                |   5 +
>  6 files changed, 428 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

