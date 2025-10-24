Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB44CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 14:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fNgqejn0snMI7/1tTSNTK/NI2vBJ1tJBuHbuhBMpg0I=; b=HLClkBIVBHlDsTA7FKhce5EQNz
	DMreUcW+YQ/xQ23wgpfNrdX4zhNZxjjHaODcRpmKQ99jkaeKW4l4mzuP5d30uJ1DxW8ybNcaCW0B7
	ixgrCFcN73VjulvIU2M3ehsFhuFNVwWr5uG0690GEhbBHRPbaqKAta+Uh66IvXpLtdGsTCglwpfrb
	jja4+a1RUID843GsJeWlSQfWRLwYGsySgS591jJhhP/YQFz28NBfdnU+HD8KPz5L9XeVKhstuY9C1
	sIoAq/BlYogcGhBT3xaa1/q/Sjr7fjvPqZF6KaWZ+17vrdcMZmWhYHNbfCbERLFk0N47HHqlZxsqT
	tNLpRtFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJE7-00000009jrV-0Z54;
	Fri, 24 Oct 2025 14:57:11 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCJE4-00000009jqQ-2a2x
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 14:57:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-793021f348fso1928028b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Oct 2025 07:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761317827; x=1761922627; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fNgqejn0snMI7/1tTSNTK/NI2vBJ1tJBuHbuhBMpg0I=;
        b=qxS2GSe1uvbVYDDcCp1GTD/9gK9TGM9eTXy9Nm0YE4Eq6oorqhiqpTW9a2ZMfuSp4n
         WlhJmOFfmLth3cEAjkiYLZNR3ott0NkkSXK5U4EGxW457KGNu5QpQCuyPvy9EwcBT+gn
         Jx1bYk9xWUrdjV0tsw1pdqjYSxtxbLvAxD6M30h6rJ44l+DHYkmdzgrPh/Nygjss3Q2C
         Yst8rWF8V3MHKhH+ci1LnCbbXCmDZC40PMVN1i19sx7MePvsQTB1t5v2fQnlnIKcOt4a
         BxiET8s1jwKvE3ouydzeSY1kRmL8WXQ3fzV/37RhZzjlgel7oksVBweLPWgcdbdUN/kf
         eP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761317827; x=1761922627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNgqejn0snMI7/1tTSNTK/NI2vBJ1tJBuHbuhBMpg0I=;
        b=hngpTtMn2Wmh915Dr2z1W4q9LmVkhyERItk4aSvIM+0Ym2tRzuE1UgYbHRCebyedct
         qF+mDD7QlBTvXtFo1cAhGjLkdvZ/ZQp51tUmKFzAHpB1mkEePkKXjEZrwPbHQ39bPzd7
         PteEuN7kazOQQWzE2dUS8LE1AL/Kf+uVpyQu68ER5DWzvavUpFJuC81O+Y6vDRI7WCCa
         Xbi2gI9uUgVGNf6PECqJ8Pco65tlkFv4ytT1O10WUO0wOl1PYfGHD5q4ALs3dcfQ0tsp
         GgjDp5M/dWdcy/r4jIOI24wbM5vsbpOExb5oV5hbBisunBIsfGtTjRkiK1Vn/z9zXPqC
         JZJg==
X-Forwarded-Encrypted: i=1; AJvYcCWBfnCO6B7tE5BMsr1qdgrcAFeErXdvRFMOrKY1XUK63QSCsOcjzkGrI6JIYdAImNo/AJQcTSiSfu5ZZ0CY4iG/@lists.infradead.org
X-Gm-Message-State: AOJu0YynlhJQQhi3rzfBYWeQmMLibsg3qnJyYM0rd+SkrAL2ssTsbuXL
	gsERnhb1SiUdaZ5zus+GdFzrYLf7M4ViTK0SanF27dpzZHCeBimORP3OIsINcKqf9B0=
X-Gm-Gg: ASbGncst8xq9l4t+Y2oSUibWeYkbG+1udGZjrj/qLMPlWJEClz69YYKBpmG2Iq6K7T3
	3+M2svOp/aMsis64z3QIwEmjXTU7qdG2awkiN+EWNdQR4BkOSqTWsmquepGOCSEjfmQpgmnLzPf
	h+2eKlhQAZa3+AD8lBekLSdsz8BkQU+EvCCvAu36JGPy1/5eTgYReT9bXlfBGkJG+aL5KxxzjUU
	Ry008bZ1PVdLBnTkyyens7ORiRbjIB+Y4CWG8ZwshP0OzVyT42/2vTglEHN9Ml7HFid/0R/dm9j
	oJzIJFudHxFZfO5dvUiZwdaOgF/0iizkVuPyPaWSXWa7aGfwjRkqtA84p8p416XB7hhOw1gGzgt
	xE4NkG0zx5NwtOGjbir0N/gKq3f8BceJE494OVSPaxAfDp+nxf48wNgJEjS/0WLjUc6XnwJECOM
	/ErYcidPe7YJRh3g==
X-Google-Smtp-Source: AGHT+IGnvRnOZR3DiY7JhKO8SRec8hM8slbNby+lqNU1ekdPW6OjTB5ZanBZl2r0I0MYXIlNVfB9eQ==
X-Received: by 2002:a05:6a00:22cf:b0:781:1481:897d with SMTP id d2e1a72fcca58-7a220b16cd0mr40051833b3a.17.1761317827102;
        Fri, 24 Oct 2025 07:57:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:c4aa:f655:2dba:5bb5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274a64d75sm6192792b3a.13.2025.10.24.07.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:57:06 -0700 (PDT)
Date: Fri, 24 Oct 2025 08:57:03 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/4] remoteproc: imx_rproc: misc clean up
Message-ID: <aPuTv5RCWo3eGc5y@p14s>
References: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-imx_rproc_c4-v4-0-af83ed3fdbba@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_075708_656800_8E11FCB9 
X-CRM114-Status: GOOD (  21.26  )
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

On Fri, Oct 24, 2025 at 10:51:27AM +0800, Peng Fan wrote:
> This is the 3rd series to cleanup the driver.
> 
> Patch 1: simplify clock enable logic
> Patch 2: Add a platform detach ops which will be easier to support new
>          platforms
> Patch 3: Enable runtime for all
> Patch 4: Drop method assignment
> 
> This is the last patchset to do the clean up for imx_rproc.c.
> After imx_dsp_rproc.c moved to use platform ops with swith-case removed,
> the method entry from dcfg could be removed in the end.
> 
> Tested V3 on
> i.MX8MP-EVK, i.MX93-11x11-EVK.
> 
> Tested V1/V2 on
> i.MX8MP-EVK, i.MX8MM-EVK, i.MX93-11x11-EVK, i.MX8QXP-MEK, and i.MX8ULP-EVK.
> 
> Thanks to Daniel and Frank for the internal reviewing.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
> Changes in v4:
> - Drop patch 5 which updates MAINTAINERS entry.
> - Add R-b for patch 3
> - Link to v3: https://lore.kernel.org/linux-remoteproc/20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com/T/#m68811fc8e9fc92d2c091926b0d5e699e8d888fc6
> 
> Changes in v3:
> - Rebased to latest next branch
> - Resolve the conflicts in patch 3 to enable runtime PM for i.MX family.
> - Add A-b for patch 5
> - Link to v2: https://lore.kernel.org/linux-remoteproc/20250920-imx_rproc_c2-v2-0-3351c4c96df5@nxp.com/#t
> 
> Changes in v2:
> - Add R-b from Daniel and Frank
> - Update comment in patch 1 (from Daniel)
> - Update commit log in patch 4 (from Daniel)
> - Include Shengjiu as maintainer
> - Link to v1: https://lore.kernel.org/r/20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com
> 
> ---
> Peng Fan (4):
>       remoteproc: imx_rproc: Simplify clock enable logic using dcfg flags
>       remoteproc: imx_rproc: Make detach operation platform-specific
>       remoteproc: imx_rproc: Enable PM runtime support unconditionally
>       remoteproc: imx_rproc: Remove the assignement to method
> 
>  drivers/remoteproc/imx_rproc.c | 90 +++++++++++++++++-------------------------
>  drivers/remoteproc/imx_rproc.h |  2 +
>  2 files changed, 38 insertions(+), 54 deletions(-)

Applied.

Thanks,
Mathieu

> ---
> base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
> change-id: 20251024-imx_rproc_c4-89967b4158b6
> 
> Best regards,
> -- 
> Peng Fan <peng.fan@nxp.com>
> 

