Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896D7C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 04:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=; b=fB2yypatGXxfYFt3XlgVVN6m0r
	R60wlvxsy2vg/VDtqolEJnyh/ZTGCTqlJzX2qaoJ2KouetgBE0CJes7F4A4Q2LFh2carNpNWrFTXE
	QFFqX/7uxG3QDagYAvVQv258jEe8J5lPcjxerGGqT/cbniqY05Wu/eI9jk3k/Q9kZYxY3VJo3jZaz
	Sb+SXNDfJpWaOZB/P/7gn3NUFvpwZc+zAj82lpRk8LZRFtDhqPC/kXiK2WjmjhxNhwnf0tXJOd8Bq
	pnlsNXQZL3l1qB8WcoSy3/nwEeOG8pwg6b65JIHRnjrDmSnuTR5lwklQYXlCmM30BgR/CL2Rdwuoh
	V4utVfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpg9j-00000006wWr-1O2L;
	Wed, 05 Mar 2025 04:14:51 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpexu-00000006qQy-3ob0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 02:58:36 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5495078cd59so5177367e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 18:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741143513; x=1741748313; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=lXtBcqYrQSkAk4A2xxpDi4GQUDIn6Q0+DYGUCr/P0gMX55E1UMAEo/80z133DEhq/4
         g/TNiOc95PKHbsWrYoPIp0dvHLBx1w4RnyW4AQ1yc0e5mjynwR/3W7DOiEkIVLbQwPdA
         rpeNRvBLFx16O/QGxn0lMMnpNqMukSQH1h9Uhqc0mjBtAQ7zk9rbqLa/gEApW78q7pXy
         UTRLUVmp69vb8hQCav3lAQ5ZEIuh6zYuJqOuvxPCC0r3IlhfJRGcM/iyN4kPwh/98tmv
         sBU49vXEJFwMNkTFd/CAbduNiBnJflc3JUWcK4QVnV5FtliZ7iaWnaL5D++c1um9wdBQ
         gDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741143513; x=1741748313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmggHW8O01EPS0gGRQXTUF3PRDZeyIapChas5mXt/4U=;
        b=OJGTodxUMn9ycvWfvdfbP1BEmPSVeQv2qWLf2oclL9ufVM41/HktF2A0VSQOEp2Pqa
         i/FWKll/sckx0MtnKOuHYwA7ZGmJ6++KCwZMI7rbewBuwpjQtjC8gF9rd2jSiMA2fyBF
         /CGdEHZGjnLFhtbEoJVlamKaTKOCRl1fGztfyk8zSOb985aV1Epfm/Rn50BHqsRD7aS5
         D+1l1ELYDOEaA+YFxQ+scZ2+AWBLWG38bDUeGY+7fJ+b//vhGgGXJ+FLDV0R3/PoeOWl
         vivVjcgbq8p712mybGCaMI4q7PTTru4VsR+EZpG/Uxf/GcoVPwzHCgQtNIf0H6/vKkVB
         0JGA==
X-Forwarded-Encrypted: i=1; AJvYcCUQRv/OibSPOdHN8yB0f5kTqseV0mjpUwJ3hWnEoCKj4fTbIOm0jG6ami+XsCoGqb8SxXPJlzB6ZyskrhMTxTe1@lists.infradead.org
X-Gm-Message-State: AOJu0YxU8CFjVeppvnf9HZ81hOiZkoe9Hkhl6PGR8SjJ9wHWSkSaO6sr
	D+CCSBhqdvHHgxvKqbGFPRiXX2mpZQj556qzeCDwBenX3dknkH8NobK4mmz4Sns=
X-Gm-Gg: ASbGnct3C7EJhtjriQ/a5QXbd9R/dhalCNCmTr0YPHgas8XZ0BV3YJKIQ8naDbOFNzr
	gZz/vrqNPtbszqGINknqqg/DKxLMaLMMTFNfB1GGlLemG5Oiso7CRMMllbQtAH4ZrB8Zk3J6eZ9
	8OeZlbvtf7UrEr+BcoY9FjH3vbcBlqlRJSY2l3jdkdkb3dfztLe5d115ixCPUk2ICpZzo1ER5eN
	dOz6cRdmMQwcFLGTL5WwZGXZemnoSp/ccCg0b0ExShVaupbI6iJvKtwlXhj28P99jMoG2XzYT15
	Xtvawawc26x6L5Lq3nuVl5B6/5bCAtiALLzxudVKnpfo3A6Kvi6kRZX5PSNlNXQOv5Rf+6euJ7p
	yVY+q9wm/pALXogttG4eAYiik
X-Google-Smtp-Source: AGHT+IHEi7gu0pTeyCm6UNSNFzowmosNeq+ixhhTaaSaHiD2yIEwbXWQsqiTh1JFRh+rHJ1Tvh3IUw==
X-Received: by 2002:a05:6512:1156:b0:545:2544:6ae2 with SMTP id 2adb3069b0e04-5497d33624dmr555644e87.16.1741143512917;
        Tue, 04 Mar 2025 18:58:32 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549579424e4sm1320182e87.118.2025.03.04.18.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 18:58:31 -0800 (PST)
Date: Wed, 5 Mar 2025 04:58:29 +0200
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
Subject: Re: [PATCH v2 8/9] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP and QRD platforms
Message-ID: <6msx5eontkkunldl45npigj756b5sst7xjhmomlnummbsmncif@ca3hkdvtdo44>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
 <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-sm8750_usb_master-v2-8-a698a2e68e06@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_185834_974794_9F8A3138 
X-CRM114-Status: GOOD (  12.98  )
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

On Tue, Mar 04, 2025 at 01:56:41PM -0800, Melody Olvera wrote:
> From: Wesley Cheng <quic_wcheng@quicinc.com>
> 
> Enable USB support on SM8750 MTP and QRD variants.  The current definition
> will start the USB controller in peripheral mode by default until
> dependencies are added, such as USB role detection.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++

Nit: two separate commits please.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>  2 files changed, 48 insertions(+)
> 

-- 
With best wishes
Dmitry

