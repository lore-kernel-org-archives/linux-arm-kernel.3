Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECA1CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=; b=tcZ8dyfrreNDHugFYCsrv4yBBN
	P3R4bCEBjUpYQw+7Cgojp/XgpQh9qs6SwztqrlPyse+VmDPFat8Y1ujEAxWPIqgcJLVb1AO+fTPUb
	w9/lfWdvzY7we5XQwHJooDN4rTodimc8MgfM0brYRJHYcFmJbIxhfRcyy+ND1dwVbVUxGEzvIuRqA
	G3m+3obsBLMv1kDZyGFTD6Jb/yQWQ2jtXaGxHEBy4tvT6cb0dDg8pd7CDNvMw65hL/HVVWSC2U8qB
	U1ZLSdMLHMH76hb9cQJsBkTdmEVqbJrFGfmyysRpWAR65ZSX7lgGiWJag2k5MDIbv7fn1e4Zm8el0
	m9g5VELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xjJ-00000008AL1-2CT3;
	Wed, 01 Oct 2025 14:22:53 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xjG-00000008AIX-3ybU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 14:22:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b523fb676efso7027852a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Oct 2025 07:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759328570; x=1759933370; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=bfLXUTAhs69vO2Co8JcfgQa+d3C2ucyoJrMNCGfcF1bRpFmR2NnHIW90Rbf44ROuuQ
         nX5YYS2zNl9ebTnfCY9n5L/uwSZDpSVeXjw/ygjnxzE1EHL9Hlq/a4dFKGZfRknvHDgF
         s7hq5OVanbSNE7H5J7fIxVT2z1l+SCr1cmATCo6jzE7x82aMyZmrxtGMobR9ittHo2TG
         na/z1KqTMOlc/ECNXAv118vQ6Vn+F68OmleMj1VcVOs66rvpJ/iSZ6WnxZZpO19hqMQZ
         Q19rklmSGeAhXie5nylifG1X3yF/ny4qNkeKifqBYI1QArP8eJRy87hUXe4yGPESQbf+
         hp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759328570; x=1759933370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZWPPQ16OuhZ6r+akwzEf9yapy+ye4jCYQdCK+8Qq+M=;
        b=H5YJhAmFUD/+Q1WGOhJewrKzZK2Xl+mGCGG+4+dB2+Q8dxcToDidFMskvWIP2N2BLV
         wdd79qI6AukHFElNJxY06OaRuRkZW2mPO3E1HNNb9ajGJ4fsxEdZU5Vte7SiMit82V8g
         u9DdhJ/Iue9SbOHfraTCJavm7RSqzgWTKXG5vYQPAXRW6z/eOwy4IfO8m5eqa0rOLwyS
         fZFTpP7b8WRc5W4DXmUmr2+s6zgkEJZ/pAHFZFDxAIJbfkwKsTFwRMJDro9K0ah0XNno
         CT5MzWPi6Al7SjLpVkFIbm369cgYWovMtKxNEGNXfig+AOP5ArzVMp4F/nR1P9QS2eZb
         enpA==
X-Forwarded-Encrypted: i=1; AJvYcCUjryMujroRuiIiSnDKESDhOXeR1ss29t9cb/yaatfK35NT/vudAyDt7EOE2t+tnYWwkigW8FJfu3oFMiirHXzM@lists.infradead.org
X-Gm-Message-State: AOJu0YzmbrdBWwjK90M/izvrd0iO1oRPFqSoXbZlHuUZKIpL5hhy1MUZ
	zQIv7MAutoLLNNfoDEMYVK4a+/BVibWo5UIX3LDERGDEC9lBSx5dFDWuOQumCBVZ6ew=
X-Gm-Gg: ASbGnctWQt7gWC9Zoc1Sd4W8Asl5tTtC6fhAx+8949yJJxqzHKn6oVzdq9CbxqY/6oY
	I8Prj/8R5IE55V9QboJIakRoWFgCEI3qlIi3104GMObSIwEZwYImCCTj949hn9QxIT+OJsR0G+d
	XEXEHIcxVRhIqWbFbXz9Pr58N/jHO7kZXFJWa+1X2jqcwAXASFEkfvTZpa0lpNNmDx9tA1Hw1jU
	08L844vFyzUcYH2u1KjbpN/ZvxXDMvIBuJ/6N9YxBGy3AYf1A8NEdw22bLOTskUFyTUJu02Go3w
	/k4Tnb9ouhLvZIYaFfd3dJjnM1iLg9uDblDQ0WDeHUKBBQEs+HKZiqFZiGKcfqqTNmrfIfoccP4
	fYgTvilE90sreqGLMT2wDflZqquocWxYNTF+v8O25pyeCRotC/l33CNOWIb/AQvx5Vm+ogafI4o
	YOBq2ri0v1blm80gfDE8rHOuXFMlQFxiXZ8ksctcnke1M1O/6N
X-Google-Smtp-Source: AGHT+IHqVeD/wJUVy5+C2bUJIvZQddubc9m4Xd4Qgoes6H6s3Vr0Kf8vrqdjy3H/lxWJPRN6L5BOvg==
X-Received: by 2002:a17:902:f546:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-28e7f440582mr49997025ad.56.1759328569779;
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8417:c9b5:17c4:6237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6aca043sm186020025ad.138.2025.10.01.07.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 07:22:49 -0700 (PDT)
Date: Wed, 1 Oct 2025 08:22:46 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/6] remoteproc: imx_rproc: Use device managed API to
 clean up the driver
Message-ID: <aN05NsINB25lW_Lg@p14s>
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_072250_997645_5C9C646C 
X-CRM114-Status: GOOD (  24.24  )
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

On Fri, Sep 26, 2025 at 08:33:14PM +0800, Peng Fan wrote:
> Tested on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Retested all the patches for V3 on above platforms. And pass build
> with patch incremental applied with ARM64 defconfig. pass build for
> imx_v6_v7_defconfig with all patches applied.
> 
> This is the 2nd series to cleanup the driver.
> 
> Patch 1:
> Fix the runtime usage. This is not critical bug fix, so it could be
> defered to 6.18.
> 
> Patch 2-6:
> Use devres managed API to cleanup the error handling path and remove path.
> 
> Thanks to Ulf for the suggestion on the runtime PM fix in patch 1.
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v3:
> - Follow Ulf's suggestion to address the runtime PM in patch 1, and add
>   Ulf's suggested-by tag. I dropped Frank and Daniel's tag in patch 1.
> - With the changes in patch 1, the remove() is kept, then there are very
>   minor conflicts when picking remaining patches in V2, so I still keep
>   R-b tag from Frank and Daniel for patch 2-6.
> - Link to v2: https://lore.kernel.org/r/20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com
> 
> Changes in v2:
> - Address a build warning in patch 4/6
> - Add R-b from Frank and Daniel
> - Link to v1: https://lore.kernel.org/r/20250917-imx_rproc_c2-v1-0-00ce23dc9c6e@nxp.com
> 
> ---
> Peng Fan (6):
>       remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for workqueue cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for mailbox cleanup
>       remoteproc: imx_rproc: Use devm_clk_get_enabled() and simplify cleanup
>       remoteproc: imx_rproc: Use devm_add_action_or_reset() for scu cleanup
>       remoteproc: imx_rproc: Use devm_rproc_add() helper
> 
>  drivers/remoteproc/imx_rproc.c | 100 +++++++++++++++++++----------------------
>  1 file changed, 47 insertions(+), 53 deletions(-)

I will apply this set when 6.18-rc1 comes out.

Mathieu


> ---
> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
> change-id: 20250926-imx_rproc_v3-a50abed3288a
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

