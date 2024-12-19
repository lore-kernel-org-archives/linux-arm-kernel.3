Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF336E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 22:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FFzGcow9cupWHpIZyQc8735bkdGhLQtdRInVDTKhJy8=; b=41q+/rsckrkfQ+d8PQIOGOwrCo
	fTiQArJgYunK8KYFi2IRB69YGQTYrxbVCXph+BoFxCQQn8fwdc5N6l8sWLO7S+aDYXTa4nTShuYkF
	UgEHt8hcJaig0Ax7sQJp34wJJl7KtRKMUM1S8LlZb6Gd0sSj+PJPyHaDdYLP/HnxgUFMSdYS6oYg9
	mscyP8K9eIk9hTknayRmyXTptAFzIl3E8Fx9hjhSJQkwXuugyZ5Cex7IBCE6BRi6lemmrfeHynjw1
	RNsHvNX8QKaH4AEgHtgA9T63i3mtpaJPWM9tw+1rXjxehHgWq9qj47J4m7bPuomnIuXurbdzi5wK4
	IYQxf2IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOaQ-00000003DVf-3sGT;
	Thu, 19 Dec 2024 22:01:38 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOOZJ-00000003DNl-0r9S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 22:00:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5401b7f7141so994920e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 14:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734645627; x=1735250427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FFzGcow9cupWHpIZyQc8735bkdGhLQtdRInVDTKhJy8=;
        b=g+w19Ek5JqCNHeeMPaxxHm32ChgepMHruyg97k1zU4bQDmmJQK4YcvtOYek17q9t9l
         9rBBnvP5vzx+ETH2RrHcdb59aDxHFq9tf50GEM82DRd/16HoaoElksNrPYhVNotlGgrq
         ohlyX5c1rlf7q3/mA8SdxFmP1/h5oK+HUXMwGIKcu44xR0Yi0fMXjt/Exc4iwqCkaV98
         nd9PT2NpPXEQ6XaWINY8MqR7/cmoBSnkqomI7iSx9E61TaHiB1D3XNvzdY0P5TBmht34
         IELyIZY+RDfI60mniADUQpLtU8a6A1jhe6z3A4nEy7+LDRPM33cae1Bo5pwhyoKHBYoB
         lvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734645627; x=1735250427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FFzGcow9cupWHpIZyQc8735bkdGhLQtdRInVDTKhJy8=;
        b=Ad8K3dW5vzva+HmcJehx40r3GA4Q92VJqTpkbOtmK3+/ntNrbZUFaPPOsJagSTSru8
         eYqBPz+YxvFRvCnuWbj75zjNTEOvL5cAFlrVZh6dirZ1cC2AHtLUGUBLU/llGwoHpP3i
         gxpO+LLsUIw/pP6ll/lwcPCx3xJBihipf624n7XL2SP2JDXAaRsObUk+ly/YiXdsbmkA
         z4XnKg4DkQBzun+8gohZwiiYTCVc1UtW91LjwGI77uN2GBSXaSANOLuP6mVIsM/ihKcs
         VPNWnd2PTSiroaKAg2e6C0Wu7sE9bv7qHjpKOfLQs2m83Waaj/gj/9231COQmeMyxVWF
         CMTg==
X-Forwarded-Encrypted: i=1; AJvYcCXrd3uxSQS5/LvQFtkOooMVpeL9WnLp1VGCNYa2p0o8mHNuTBPYssvAEx6+oJcFH1Kdq6FuuVsm0utafZyGjPJr@lists.infradead.org
X-Gm-Message-State: AOJu0YwmflP8AOPJvI+X3lpSXpZtWAdsZ4Vvkc75en/lycuSg02rJtIQ
	hGpGe0n1XyVX43pP85J1cR4XLbXMPNbOJs7FzO4K/XOTRjzyRy06Jfq3Z3Pw5+4=
X-Gm-Gg: ASbGncuy2b56WF9+N4fipmC+XiLVQOCDb7H9PTam1ZMLWG5X4FQbqDbj24qf8WW9q5a
	FfOr13AdC8vJCgbmpWmDe7+OHvDVyA25/mzSAUJrTQUkFOZG/wTdULsRoLXtDgCj8x1lqgx5joh
	K6qxKwHvu+7W8ykC+VNdX0HjMSHaNl5bopt3ayZ/Ip2PfLHSQPkj/PE9OujK4SCkuYMLcI/Ku9O
	NSkymHB1leRg+wC1wJxA3qU/7iYOabEbTGIZquzFeKQfYTaCRcBh3BFa5qhPPraCi3MwdVXT/Rn
	pK2nV7R8qoB+h3TcgwzO5SkeCBZYkkwO9flv
X-Google-Smtp-Source: AGHT+IHQBbZSkaVrRpWCT0IrdJegFxLytVpYTu6EC2PCFOGjuoGMf59MaiCeqFQIHDIIyb9fygWDtQ==
X-Received: by 2002:a05:6512:1150:b0:540:353a:7954 with SMTP id 2adb3069b0e04-5422957af61mr73815e87.54.1734645627457;
        Thu, 19 Dec 2024 14:00:27 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235f654csm286377e87.10.2024.12.19.14.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 14:00:26 -0800 (PST)
Date: Fri, 20 Dec 2024 00:00:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Roxana Bradescu <roxabee@google.com>, bjorn.andersson@oss.qualcomm.com, 
	Julius Werner <jwerner@chromium.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Besar Wicaksono <bwicaksono@nvidia.com>, D Scott Phillips <scott@os.amperecomputing.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Oliver Upton <oliver.upton@linux.dev>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: cputype: Add comments about Qualcomm Kryo
 5XX and 6XX cores
Message-ID: <6xubvdnyo4otwanapxersipmae4uuwkvple2jaxyuu5ucepjju@kl6lhbde4ney>
References: <20241219211131.2389091-1-dianders@chromium.org>
 <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219131107.v3.2.I520dfa10ad9f598581c2591d631aa6e9e26f7603@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_140029_259983_966A3D0A 
X-CRM114-Status: GOOD (  10.99  )
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

On Thu, Dec 19, 2024 at 01:11:10PM -0800, Douglas Anderson wrote:
> As tested on one example of a Qualcomm Kryo 5XX CPU [1] and one
> example of a Qualcomm Kryo 6XX CPU [2], we don't need any extra MIDR
> definitions for the cores in those processors. Add comments to make it
> clear that these IDs weren't forgotten and just aren't needed.
> 
> [1] https://lore.kernel.org/r/l5rqbbxn6hktlcxooolkvi5n3arkht6zzhrvdjf6kis322nsup@5hsrak4cgteq/
> [2] https://lore.kernel.org/r/tx7vtur7yea6ruefrkpkccqptahgmxnsrudwdz5uzcfxnng25b@afrr5bmdk2xa/
> 
> 
> Suggested-by: Julius Werner <jwerner@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

