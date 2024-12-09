Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CC4E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 23:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NpfvxMNcE2evx4GUMkzffrViZXHtVJ3SlF17hKgOXT8=; b=vG8HxJWE+DTxEiorieZ1cFtJPQ
	Gt0NdYN71K0aq1wZxGvrSy688KBe1yh1kHoLyA62C1y0nZRRFqqRmnKtfWAImkoFSwex6TlxWf39i
	UXuX4Y8jgOUARio7fRORRMANl4an40eS00GDmlAxIZHi/UkeP4G0/wlk+5kL9T19dA07sm8f6ybOM
	Gm55a/JeXcXP0Z2DvQQ28fqSZzAxAilPE7RMM87hIaNAdG1HgTmgF+5SQjyQ8Kzq5724jy5ZjT/CC
	t3xk8/gw4fYyrUrAW5R+3zkdyHl8OBZe6OlimzmFoYX8z9f6wyNL1xBX8HcDU2th+0QZuj7CXWiGg
	5EUvQbRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmrw-00000009Vwp-40rE;
	Mon, 09 Dec 2024 23:08:48 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKmqu-00000009VpT-1Txi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 23:07:45 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-540215984f0so1229597e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 15:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733785662; x=1734390462; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NpfvxMNcE2evx4GUMkzffrViZXHtVJ3SlF17hKgOXT8=;
        b=CUQDMyJm8R6TzYN3zIcd5zwoIqa1ccLGitbEei+40GCB9rCU8oUbhrv9Dw6/qoBht9
         Vvn1/8riS/ruSse9ASMgxMPcQl0D41sxRGBqAlENakqlMhp11yF8+Nn8jF/jE5WmyDQD
         tfBGcV2hnwDBuKOeHbDxJsz0zhlzM5L5xTGNYIbN/RqfG+ALYYz60CsdYKT+zr/WlI8U
         0FRa7qtjVY3okWHMt2do+8LUvkb3YeNFBe9gDGrxvjI5a4kJu3B8OBIu2ly83dUcMcvC
         5BmjqCrLQZYznR7YtjncI2UBvzkgB5hzzaG67/lfVPL1z2/MVOr5xHzn34V1XFOfPoTD
         tGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733785662; x=1734390462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpfvxMNcE2evx4GUMkzffrViZXHtVJ3SlF17hKgOXT8=;
        b=qunMJF16+ktG12V6nVkgcL09FpA+K8no2HcOI5aNx/yxkhgCodq2VERnpqaKgGeBnm
         BvZESNkCBWV/blTnZZkaXrw4ToZyDv1AQlhpnRnGGGHvalzRB0tGyGgwOXoyZjmQDfAt
         BHC4hiTGU8xsdlXrUAAPN7VdWM2seFSBodV4kYitSgSYGr5HouTihdb3IBAn6VSqLk1X
         LZfzZfTrlSeGXmPRuXNmXpGIuFZba58KkrmGcFEKTfGd0CVkMymLNYRqkoQ2o/6jrOb2
         xffmaCCmN5jJNsdGclcp8Do0N1CUWPp5zy3Gm6ILWB9wvbJO9krWxte+NrTq22z4A6P/
         xFYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqW0JOawAjmeOHeBybAfnaaJ2p8TQ39PUjgaYvraodqTBAcCh97Cx8E6Q1rSC6a3O5AwpLlZid+x90Wqk00uVt@lists.infradead.org
X-Gm-Message-State: AOJu0YwpXxrIPj9oOLCddIFUJilRm8sgDlvgceDdjU4BBmh5q39bj7gx
	BrbwXsRkYLEAJrf3g/j2krwtUxuzs5++Qx1T20kbrynFYChjR2G82MaXR8i17Tg=
X-Gm-Gg: ASbGncsGdnX3gqN3/+jAK9cybOyvabK6vqUp/xQRU/eH6Y6cKyZ3XvbGWrIjz/MHlpN
	WxX76iUBC6guiL3jXBicIlHYgquwp0DLtV+Xl1SGb4l1kOyM0Ibnbbt9eZf90S7U7X7kqlIX8HR
	7EfK+z/7yRCw75Odh4VCZkuCQ0RPNmuemkL7zNa3VF5QRfQ90FJkW1jRKTLExyOHY2zT4EiKOZe
	mWLExjZNqQ7Y2rg0/kGnfCnhJtTjlVr9HOUH6xBhT+TRF7I6exmNqWxbSb0Yx3tyWN2VT/2VGGK
	NTUMtFuVNLXv7E+UzbGQ7YgOTWBkHSEqSQ==
X-Google-Smtp-Source: AGHT+IH/GhAQu8ZUGtenaW6SKJAm4VqyvLWgGVL9JvGyxgiMhFhjNXvESpDyxAefkm3AWRhsFA+KBw==
X-Received: by 2002:a05:6512:4024:b0:540:1ba5:75d with SMTP id 2adb3069b0e04-540240bd1afmr870079e87.20.1733785662363;
        Mon, 09 Dec 2024 15:07:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e378c4264sm1081287e87.239.2024.12.09.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 15:07:40 -0800 (PST)
Date: Tue, 10 Dec 2024 01:07:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Julius Werner <jwerner@chromium.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Trilok Soni <quic_tsoni@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: errata: Add QCOM_KRYO_5XX_GOLD to the
 spectre_bhb_k24_list
Message-ID: <l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq>
References: <20241209174430.2904353-1-dianders@chromium.org>
 <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209094310.5.I41e227ed809ea607114027209b57d02dc0e98384@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_150744_401185_BE28642C 
X-CRM114-Status: GOOD (  20.24  )
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

On Mon, Dec 09, 2024 at 09:43:15AM -0800, Douglas Anderson wrote:
> Qualcomm Kryo 500-series Gold cores appear to have a derivative of an
> ARM Cortex A77 in them. Since A77 needs Spectre mitigation then the
> Kyro 500-series Gold cores also should need Spectre mitigation.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Yes. I know. This patch DOESN'T COMPILE because
> MIDR_QCOM_KRYO_5XX_GOLD is not defined. That value needs to come from
> Qualcomm or from testing on hardware, which I don't have. Qualcomm
> needs to chime in to confirm that this Spectre mitigation is correct
> anyway, though. I'm including this patch so it's obvious that I think
> these cores also need the mitigation.

Kryo 5xx (SM8250) identify themselves as 0x41/0xd0d (Gold, Prime) and
0x51/0x805 (Silver)

> 
>  arch/arm64/kernel/proton-pack.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/kernel/proton-pack.c b/arch/arm64/kernel/proton-pack.c
> index b1881964e304..212481726f04 100644
> --- a/arch/arm64/kernel/proton-pack.c
> +++ b/arch/arm64/kernel/proton-pack.c
> @@ -867,6 +867,7 @@ u8 spectre_bhb_loop_affected(int scope)
>  			MIDR_ALL_VERSIONS(MIDR_CORTEX_A77),
>  			MIDR_ALL_VERSIONS(MIDR_NEOVERSE_N1),
>  			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
> +			MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_5XX_GOLD),
>  			{},
>  		};
>  		static const struct midr_range spectre_bhb_k11_list[] = {
> -- 
> 2.47.0.338.g60cca15819-goog
> 

-- 
With best wishes
Dmitry

