Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF7ED132AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAOjh0XmDxTvZHf6jM5CouCO0muUY1p/Q5Sn/b27kuY=; b=nFqUcSkeNSig90v9s3NrU7NSku
	KAgpEJXtK5nRiQmxUzysmJx8LJ14wwNdbfFcGE1VV6cicQ/qfuOqqlHwAQZnqkiBcP0n21sMoOcq1
	fkSswmRG15GWdp6fTB2FBEM/DbceTRsiudSXRAGU1PNIdT59igBJ7wNK4r0VhfcbKTJABz83gpNvG
	o2JqOJkYLNW3RVsA9bfBvv50JoZMSuIZy1cxQP0l2j8J7VEQ8Nevj9sjwprFj2mPSfS/k1Qh56Jd+
	i34T1SSMWRB28TJ2t0TrTV9LE3TtDCsLJ2INd58WL06+WsWzxx4NtmtfS3BlihWu9OU/Dw1HbYbTF
	MwIJHrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vC6-0000000DV9O-23Ay;
	Mon, 04 Nov 2024 11:24:26 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7v0p-0000000DSBr-32E9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:12:48 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so5191812e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 03:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730718766; x=1731323566; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EAOjh0XmDxTvZHf6jM5CouCO0muUY1p/Q5Sn/b27kuY=;
        b=IWgCsGfCImsoNoQY6e6rWZkstbkX9uyAw0e6Uy+So7Jf2ms0ThMP9ErFKYwP2DkOK6
         If6a/8NBCMGVAqFsvrm0Qyt6NOInM8+YgTg6MMakD4cIkX/4MHV1sZSeXRZUPUlm2OOA
         XCoeu8bS3t+lAX5VdNlIzE2sCZtdUI2hQjrlzCGtZBff7XYsPPz/G9sL882EiwI83KFM
         a3xLnTyUbmrZ0EwqJE6m9VyqpWw4eRQytRv7rOKlZyC1tjH6XfW8HBOxaufME6sXaBWv
         T+FbcJMBR0ucTYxWQFUch1IuSF3lQqBHVyIwhfu9O8BSco6zRYuWy6X3ZZfJhspsFuGG
         6PGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730718766; x=1731323566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAOjh0XmDxTvZHf6jM5CouCO0muUY1p/Q5Sn/b27kuY=;
        b=PQHWHmdIXXzCrM4bxneGBG4uk5M+LsHdd0N4nY99LoPqThASFWzE/2pw2+qje77pI8
         BvpyFvoBem10ejmB0wrz3shVlFHLUse+W++qvsA0s8sHZggRRoLb6G3Jgd5KNkmaIPws
         WfmrbBb6o1r1hS7tVBfI6yDr/IHn/5tNt1e+6IenTkj77i5/QQICPCnf7HXqE4TGlYoJ
         bP9grYrnCL77mcl/c0SHFKvHu00uWy8lrhfwH2EFNVgL5uy5Obyk1CfGqDhmrph+YHnu
         VjY9XXGILRcpBqgtMft/tDg+1YJI5Qg3qGjjDFOqcqlE1Zpk5KpjQacBz9KyYErwDD15
         klpw==
X-Forwarded-Encrypted: i=1; AJvYcCXcsm0oS3LNAjQFBCwJgyk9ra517D+XsR8BdZr+yZxFDghiIGFSBR60tZ0VPBnvLYfQus2XD0mHkm0SuUAaTWNJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwaoBgJYotQn6RrtKp6BZFgZPMY3umXSDP9AtdEfKHWsj0L9TeR
	I4Z9HFQHI0lm2SNvAf+Qx0WZW3EAAFgeP2cuO+jDVwU0bHEUVRBrJXafyUZvazU=
X-Google-Smtp-Source: AGHT+IFERsmNqkBWoMxQMqVbgM8msMLn9Gwm+rxaCEVGy4NhlS9KxmbTI5MDNM4EpBz5eSZ7MN6Z/A==
X-Received: by 2002:a05:6512:3e14:b0:539:8ad5:5093 with SMTP id 2adb3069b0e04-53b34a1943amr12925158e87.35.1730718765058;
        Mon, 04 Nov 2024 03:12:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bcce5c8sm1644055e87.141.2024.11.04.03.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 03:12:43 -0800 (PST)
Date: Mon, 4 Nov 2024 13:12:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: add base QCS615 RIDE
Message-ID: <27d2gjvgr7ajaf6ouk5maxhp5cms6c5z2wmybfpbqytet3lva2@4lu64yki4hyc>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
 <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-4-9dde8d7b80b0@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_031247_799522_343C505E 
X-CRM114-Status: GOOD (  12.84  )
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

On Mon, Nov 04, 2024 at 05:10:11PM +0800, Lijuan Gao wrote:
> Add initial support for Qualcomm QCS615 RIDE board and enable
> the QCS615 RIDE board to shell with uart console.
> 
> Written with help from Tingguo Cheng (added regulator nodes).
> 
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 219 +++++++++++++++++++++++++++++++
>  2 files changed, 220 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

