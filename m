Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9C6CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=; b=soMATOtjVWMNral0ugzlxP1TUZ
	SJ5ctXXS+3ZfJfFSdHk9enYnsKMhtZ7e4/YQ8Fc1yK8a0lO6cgU7kH90X4REDMY48u9MIaJ5jpmO8
	vfh0t74Pbe+uQ5ek/I9PKTxBW6yezs9TDEtdGSffLTW5L1ZZ85BxaWzV08LJILT7WHl62VFumfVSJ
	IBUDrOJDl42hzAw6EX4EQT2S8oLTriQWJkiuKL91hVlEYcL0eX1fwAYAU5Z54yUVTL893/QA7YBiR
	n/Rq/IyJJ4Zk5RFErqUsJUEi8QwrcarqmzkfZUh4Bw55jR0xlK+W3TvJrp3+jr0XN+/jooKwbjyBG
	KHe2WUwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcq6-00000003pTh-17Y0;
	Wed, 22 Oct 2025 17:41:34 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcq3-00000003pQs-3fCv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:41:33 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77f67ba775aso9171310b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154891; x=1761759691; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=g5xoL/m7vlFsFjtbOCUjKZlbRwWstP0hsGOby7LPUypr0ALYJratFvFEUiJ4h44aqr
         UVFfdrmtqhmaDdY02T2w3z+zz+GY2Gaeca7zmunchM/Ft9i8+Ese0hgvdZGdMDUhurvt
         sewzoct8lX/9bgG0Tx3gd5WuAzMTD75Et1PEjVwP3IDBtNimOyU8VX+fnrnHLU7nwWj1
         g7d3VRaLTO+LMnTdX5wRz43z3LdX45MOvS9UpFlXZcX8osrybOLT5s3QgmBK6SiFdUtd
         NQfV3YVZVW+sd1UR/PKvbkIuoMZPzdXYKkF/VuZI7wBEjcpmMiphDgQLkhFZTyEi/fe6
         XeTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154891; x=1761759691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/yVbcNYBKxI7HZmam8giV90V8J7uwfsDvse/7ETWpU=;
        b=BtsFUhlSgsttCV5oXuD6lZaosFMrZ5iJPWKgng2takIJDoa7bXBRyP/ZyP32PcEjEN
         N9aL1V3oXGvu6gV+9yVkiuO+PH1jsjCYvEKe1+RUCt2qnYXrfEnUadINOScY3dJ7FGy7
         mNLeGYlhD+yDJ7L2fiZqbcPpKeAGliAAyj7xh7V/XZpYdIvj+20k6lkjvP56uk8EvG6O
         o/wwCjNK4uzN3n/9YSpWPgi9PkKa2FPrtQaTlli13dDNKbctB8KHWBkHIRLopfsGFwh+
         xfQiADSrJTyAsfxKzow67IJ8x1rapdT9+s703HDj0aFSXxidGyCDcpK7cgEITQszwQmh
         KJjA==
X-Forwarded-Encrypted: i=1; AJvYcCWUeQJliy019AOBHsMStNTFPw4B/xJQfBmbwJrzEh/sSRI83gaQAZn3gsCSEYQOMJOctaxIZ7Cjg6E9F5ZPG2T4@lists.infradead.org
X-Gm-Message-State: AOJu0YwRzCMj2sqwM0GVMQGc8mDyRJ1IgPXGLu+Bf0bmu+YEUvx2SM7O
	bdlPZy7CTSEMD716RZZCuO/06zMEMEbPKpoW+joKwHx/4KSya/8Yxz0e2RxuVE5rYNo=
X-Gm-Gg: ASbGncvEXfwl+ICmGnAx1DBSYacHOb85YJtmWpzDYYRc9BkMyA5B9sh3bpVpqqnkwOb
	p8lSzxd9oLaOoYZuIHoRpu394pyEdzuTGLaZn+QLFRv1t6RRxS4fwrN3ogBmQF1WThL9BSL3T5U
	0cvbMzk9i1/Lrwr1SR3cCexbQ/dRJ2oTSZtEOeUeHk9I7+kFZ5F+XVFI6v9uscXX6pND/LEGgB7
	sYPMhl3/tFb8lT9obvsalyh7uyMjDp1IYRiUIt2AUp05C5OZdJLTnJ3aOZkZxByZDoGFfCGWsZ/
	GyczmEZzLTJYmm7fyv156HpfSQpYq0bOJws7HRY6df11eFzV/Ue8ujuWh+IaFw/JRfbGObp5j9E
	L3tvdh1EQkh+PAN2lCjsmCm8UQ5jbxtKgFDvkqGvWM1Mv1hG/BFwrZous/Gf7TEy7D94bonagHc
	1+H4s+psykeZaZyQ==
X-Google-Smtp-Source: AGHT+IHjwdJFhyPffGM4FBkB+w0a69ezxil2LnB/hHwjzMGVo9Ioll+93XMe3fLrl1LPLka9UTkijg==
X-Received: by 2002:a05:6a00:9a0:b0:771:ead8:dcdb with SMTP id d2e1a72fcca58-7a220a7e712mr26747780b3a.8.1761154890617;
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:7843:84f1:e4ca:d99d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff39654sm14983897b3a.31.2025.10.22.10.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:41:30 -0700 (PDT)
Date: Wed, 22 Oct 2025 11:41:27 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] MAINTAINERS: Add an entry for i.MX remoteproc
 driver
Message-ID: <aPkXRy7TsPCrq_s-@p14s>
References: <20251015-imx-rproc-c3_1-v3-0-b4baa247358d@nxp.com>
 <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015-imx-rproc-c3_1-v3-5-b4baa247358d@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104131_913815_3DE36EED 
X-CRM114-Status: GOOD (  15.49  )
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

On Wed, Oct 15, 2025 at 09:52:59PM +0800, Peng Fan wrote:
> Add an entry for the i.MX remoteproc driver
> 
> Acked-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c9cdb95dc150a55df405adc3cb853c61f4c2b467..02dea709a5a5d591f156becd35640dfd93fe62e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18610,6 +18610,15 @@ F:	Documentation/devicetree/bindings/clock/*imx*
>  F:	drivers/clk/imx/
>  F:	include/dt-bindings/clock/*imx*
>  
> +NXP i.MX REMOTEPROC DRIVERS
> +M:	Peng Fan <peng.fan@nxp.com>
> +M:	Daniel Baluta <daniel.baluta@nxp.com>
> +M:	Shengjiu Wang <shengjiu.wang@nxp.com>
> +L:	linux-remoteproc@vger.kernel.org
> +L:	imx@lists.linux.dev
> +S:	Maintained
> +F:	drivers/remoteproc/imx*
> +

Here I am suggesting:

M:	Daniel Baluta <daniel.baluta@nxp.com>
R:	Peng Fan <peng.fan@nxp.com>
R:	Shengjiu Wang <shengjiu.wang@nxp.com>


>  NXP NETC TIMER PTP CLOCK DRIVER
>  M:	Wei Fang <wei.fang@nxp.com>
>  M:	Clark Wang <xiaoning.wang@nxp.com>
> 
> -- 
> 2.37.1
> 

