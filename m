Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF7EAD49C65
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 07:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=; b=TUX5JSaPVnTAcCIp9up/+s6ZPk
	1YkgUdabPzl001ZRJWUMqjtxGMM7wEuMAUmcCcATbqsDOsCVIsJLCCFpKKQGtdStwtTXIMlz7IFLa
	iFDJ2Aq1V1nyBQVPb0x34+DZM4mxASHS4ho+WP9Rsgk1ps3HWfF3Ic6X1YCc14PJJpyERleMJNVmJ
	0wbhiueSDhzvEmJzvRohgAb73gqjABta+iysBDNy8WnPu75Nc2iTJJZAFz8DxrO4gGznua8jw4B0d
	SEzRqLLKFPZSX2jnaqGv5YoiO/nwMeXtx8XgoN5CLawcRvV08RqCtsarEzE+DHwYBzX9NzGq2sRsn
	W8o1dB3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlinh-000000018e6-2f7H;
	Fri, 30 Jan 2026 07:20:17 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vline-000000018dk-40Fy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 07:20:16 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-11f36012fb2so2305850c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 23:20:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769757614; cv=none;
        d=google.com; s=arc-20240605;
        b=gE5Vxwsarq62Kw9x7JVA4nB0oyaiegh5/Xv83isNhHLxthmrWDO0HJlDfZ4BZXeqJ1
         IHBJk+Dz5mPUCeqLVuK+qzXenX7HYU9nG80X8L81ODsfdSh8tSDQ3VfwBR2OrzS9I2C/
         k9uAUzNyI03zTJAWatg/djH8mN9L/k/IfCmesVIfUrJbLPQwCj54mz3065Pc4uh+U0CC
         ZiVYkMY8/nktD+jd7s2jcE4/uIjrNHUihwIAMhkEewvziRvstXOcwtGFVupugJH6NjUm
         mHJK29CtZ/C6fl2YnRt7x7y6fJzbQuIwmr9/B87e9TklFY3pAEWL54x97qNglAFqgiav
         Cq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        fh=cnINmFzNVar5PQ+swYMknAKAeuKypL06jOYGW5KnPas=;
        b=ZJdNlzhBV7IGqDeOymcFQ1YlgMOXiqeVbTqJ45+Qm26pYbSf7ysiKorlRqe5fIp/LN
         BfHiHMQfaa2rh0ndakVI8TGEreIdTIV5IGZeSLdnq6L+9MFpsOPz1qjIC9Yixqu8rC5p
         VbjFr4IXqdlEFDv3JANTJcGc574p5yOyIAtIb/WMG9wixPNPRuvHanVl6ehYgZXP7L2B
         3DEdQ0yOFWyUckiqlM79Gdp5w16hK0xJ19mE/S57HkyqSNxY3Ca8PjOC9jHkw/oo6hsE
         SwDoSnJ9wC+xefNwAoFQ07+6HAgN9jkEQsVuW1ufxRjqXfTulCHEA7pz+miHGm3rAXBY
         QvGw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769757614; x=1770362414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=kN9nJUgsLu1pMZbYjd//WtL8DDeGNtI5VOhfUDMdc70xIbEM8Fmw878QaBMtrWadql
         TlhszJMg6j4equFhzpUdhkaM6VPKFEhZMX8doDuLLn25VZLmg73GcipbNAfKvJzNFmxU
         adzWJuuYIp8Bd3jXtfYasPR3CtXpRC0cdimoUcGDeGh3iivNlVi/2L1w1ZLHkU0csYbl
         mneE1HFnHnFTlq0KkVDsW5umJ7+cs2mZ8GrxPuS37fpfmSuJBEb9hJnLbh1Jl8VGSpzI
         slN0JIicpvJ185Joi0MYu9VJcWNbj1UpGmOvp+ZXtCp6PzlbAQnrgZqIQTSx91xut8RM
         xjKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769757614; x=1770362414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yiCInPBw07YvtBtb/8UPQ6O9jfSpvmf7nJNZXF9oh5Q=;
        b=TMcZisu5u7iTd2DwJ/RVjKNnB8f/UVCoCLq98zkQbL6lBBmBHLJ3QuQyrbTRVNMqIW
         6AkzJa+qs1ecjYqLApgiHNH8ma2puitMHQ83HaWBnTEdAW1+PMBm+iFV+iuU4DBgCoZX
         XPeqs51qi5DqETk1Kg8swg9jMu930d2wa/rD464oXZVnYTKI/HC+pyx2AC8CyYEgZBGa
         WF8jgDj/imEtTqc5Ia3/NGVFY98P0LwWLWnWIeb8NtloAiFMXH8R/Hs6Y5nZNcs+LkEr
         zOdjBv0tP3mKGu6vLM2ZSXQS9okN+FXmmnKY9QMeAieVm7Jxe/ZGRRrkx5Sn8iBgB4RS
         byLA==
X-Forwarded-Encrypted: i=1; AJvYcCXV4jCcNety8T9P4JMKEJCwVfSRtGSXF7VjVQyQb1xH8waHbofFOSmBb34oQsXFvEIdYatAqtXQb5xl+X/2hCI/@lists.infradead.org
X-Gm-Message-State: AOJu0YwuEozqecHWfs/ZqBX6vxb9XcLhdQuV7OVTt23g/aU+Ftxtjm/V
	WtyRYYyXDYn5AJ0khPkEOLJIpTUmjRnx8KeT7tz35EfabWmg9V2XanU1MgOwapG8cso7CqtMeWz
	ods7b5bsQJdL+cZp5AqoBI+1pooLMVpQ=
X-Gm-Gg: AZuq6aKc0ZQkmqUWwEzmAF4io6J/wWvWQd5271Tk4bCE+KFMvCX3yTX/K8AJZhSOcTY
	YhfDTdPw0r23cjv8Z6LII9nc8WSDmfRpAQ+8tKeBy4vZK1jJTbVvOB1BlR7SBQ+MKRLYGDYyC+4
	X8Tc9x1kpsMZ6+IIQ8GdVDiEzt5NRfs7MrngEb1lCd0+qb9orff2Ios+wWx0mqfwlzyL/fn2aX6
	bVCL/OvXVQBk2P4iAWXUx4Z27UpmbADVxX1rjUXQapfCzvLwIu9GF4Az6pdS6+bCAi5ZMVuY/rb
	cF9Y11hWu93asYgvFxMSKrg60NQM97I/MlRc+HtqmIAHJXdmCIKH6Rr/KtMoAlfvssnG/q4J5H2
	8hKhs8pLLDA+dzA==
X-Received: by 2002:a05:7022:207:b0:123:35a4:e8be with SMTP id
 a92af1059eb24-125c0f8d01fmr955848c88.13.1769757613717; Thu, 29 Jan 2026
 23:20:13 -0800 (PST)
MIME-Version: 1.0
References: <20260130054330.3462544-1-shengjiu.wang@nxp.com> <20260130054330.3462544-2-shengjiu.wang@nxp.com>
In-Reply-To: <20260130054330.3462544-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 30 Jan 2026 09:20:01 +0200
X-Gm-Features: AZwV_QhrTfQ-UYZ4PfDVoCm6fliDdKe2PvVXhTLbJKtRrXqH5MmZHe0lNlu_Efo
Message-ID: <CAEnQRZC5umZYoxemGO_yc5xT328uQxUG8Sg8yZvgDowhLP6UPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ASoC: dt-bindings: fsl,imx-asrc: Add support for
 i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_232014_996928_38B8F384 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Jan 30, 2026 at 7:44=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Add new compatible string 'fsl,imx952-asrc' for i.MX952 platform,
> below are the differences that make this ASRC not fallback compatible
> with other platforms.
>
> 1) There is a power domain on i.MX952 for the wakeupmix system where
> ASRC is in. But it is enabled by default, ASRC device don't need
> to enable it, so it is optional for i.MX952.
> 2) The clock sources of ASRC are different on i.MX952.
> 3) There is a limitation on i.MX952 that DMA request is not cleared at th=
e
> end of conversion with dma slave mode. Which causes sample is dropped fro=
m
> the input fifo on the second time if DMA is triggered before the client
> device and DMA may copy wrong data from output fifo as the output fifo is
> not ready in the beginning. So there is specially handling in the driver.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

