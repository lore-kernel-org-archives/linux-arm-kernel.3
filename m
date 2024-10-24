Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614E0CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/1/sAyVSibd5hLQyAm0VwFvDlH9FogTkRBA3XUw/H7Y=; b=eUcxo/5F9pXF5NkLTbgWdm3VLE
	y3UCxJEfnCm3d6x8Gil+LbslC816oINicfdvIYf33/Z+2hHVoF25BFhCl9vQLfES77Gi5vNtU7Kr6
	KFDnEGTuv+s8V1lpMJVXwA8WgSVpuD93WrtTvTmPwmo1yQA8ksig1zf/LxALtJugtBFIU5MMWfu9l
	RUJAOPk150J+XZNiWjb7HoTF3gIzhehHa2Pk0IZGv739Hg7tayNsvEfvnrtP5Z+fbg9QMAc9pbg29
	pTHF3r67V+3SK1ZaLwR2ZmAyMSG1JY7f3zWcyk6B9W5pQWlR/JHVZPR12sBhw/tmOXXbNbGlU/5UZ
	j+uhZzoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42dD-00000001SgB-4B7w;
	Thu, 24 Oct 2024 18:32:24 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42bf-00000001SZr-2Ivn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 18:30:49 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e3f35268so1575227e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 11:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729794645; x=1730399445; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/1/sAyVSibd5hLQyAm0VwFvDlH9FogTkRBA3XUw/H7Y=;
        b=wVHRSUYEgpd/kRq8u6Pa1AxqOmiTlugGRH4edeMI2q5HyWBAUxfb37pKTsrv7txve9
         I+MubiVgluOtSEalfNteHKYv1CsyRMjaecMB9C7It47Fs9t6ld3BIW5tNMA5v+j22Rv/
         NnWfDvnYWoSS9dmYDRz777KXPcDz6e/mAwKXsqTrunTQGwNqtF75PP2irwfsXhgFLchq
         nSRHCDTSkDfFj6qa9nUyBSsrmaSXoa4onLb61juLnA5B7RBtP57Jc0hi1u+vCBvGwJqJ
         AseaGKjLCOy94DMbjrE1lX3M2usXTz/6dR2J+GEQV3ccE5iQEIZ5LsYOTwR+UM/9Hkrh
         Rxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729794645; x=1730399445;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/1/sAyVSibd5hLQyAm0VwFvDlH9FogTkRBA3XUw/H7Y=;
        b=A9bsLV7aiMeHAq52s5DbCRX2KYq1oHeafWARmsVn0BKNON+AoKPu9ou4Zq51/C8DL2
         FshWqUvwC8LMyg9yqtRTqS0+vNGAgKQE0WdUhdtqx6dZtSccQb2KrEbFE3R8kT5yq8CT
         aLRuMaUoIVTPyshS5e79MW5OUKAL7SwjwPDnS6HGsLgeisfXt1Po2+r55rkDZWoVh9xu
         8Mp3f8No6qEf9t+L/EDYnxOLoL6tLpgbkrGRUAIkhgrG19gqKrLlsoSWvAUSCyyWeXMA
         0PW6Die04OjqYRiW4Td4EnfYVcwSl0rhT4tsqdwjE62n2hsTnM6iC5T1twrBzxJEE0tG
         zigQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8j7BU+L4GRUOjIcxvttll3GhOTaIxsoVF+R6pIb7hQnUhGk8uxozcqFhn/Cc5a2VUi1m3kqtHirNQOES7z2OW@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2pk7y8oDtBciyjur/s1JqtRhGCrsHc5HoG5re9BI/9pnG4/rA
	iOOFxVsMDRm+boAP5xMFr1gtQ2BKVFHi8v9ABcULtR9dtjLPCIPQpD29LHi+SZc=
X-Google-Smtp-Source: AGHT+IGrzoUBynCTOp+oNLSSYcxeqavz0ElVUXCpaD9ZGmZJS9xhP5O/rMH2mwesCuRuN19+XBvTWQ==
X-Received: by 2002:a05:6512:2254:b0:53b:1526:3a63 with SMTP id 2adb3069b0e04-53b1a373bd1mr4614519e87.56.1729794644786;
        Thu, 24 Oct 2024 11:30:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a22431454sm1430864e87.212.2024.10.24.11.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 11:30:43 -0700 (PDT)
Date: Thu, 24 Oct 2024 21:30:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: defconfig: Enable sa8775p clock controllers
Message-ID: <amatk3cl4rayggvir732jtopirqfjzvra4dspohc3xoctonfvs@zuxbjhncu54d>
References: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024-defconfig_sa8775p_clock_controllers-v2-1-a9e1cdaed785@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_113047_621928_682677A6 
X-CRM114-Status: GOOD (  12.29  )
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

On Thu, Oct 24, 2024 at 11:22:55PM +0530, Taniya Das wrote:
> Enable the SA8775P video, camera and display clock controllers to enable
> the video, camera and display functionalities on Qualcomm QCS9100 ride
> and ride rev3 boards.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Changes in v2:
> - Update the board names for QCS9100 [Dmitry].
> - Link to v1: https://lore.kernel.org/r/20241022-defconfig_sa8775p_clock_controllers-v1-1-cb399b0342c8@quicinc.com
> ---
>  arch/arm64/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

