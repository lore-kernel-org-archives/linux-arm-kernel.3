Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A928410A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=; b=auccNDOHn2ZV9zLJsCPeYIxtEK
	8ihML2zewGce7eEVBvvvmCB7TE8gWfRV4L5ltfqBwtYNeQohvHoPrd8dZsu2bu7sYUHd8b6cTUxE8
	7dHJyUcbmub76w0Fs5dfx7ZXpMKsS/GnnT1eiiEoLYAAcgJyhLM55NWrV+bT18LJrHSWAFcXQJrfB
	qEE0EcQiMAEYvZHNa53a4R/SpdNjlHxWYTWKU+GrRASfp3eDu+EGZseXpkE+h+EmBFyuLp4oYdEo7
	gMzK61kFflLLUBp47OlAxYgoESLgAUt7XLZpMRex4aeyDTTAGFZkxqMYnYMA/3jQLOSaR8zP2GB6m
	yULyJ4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0w-00000005TG5-3rQC;
	Thu, 26 Mar 2026 12:40:42 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0T-00000005T0r-0m7x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:40:14 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-38bd15d82bdso6804801fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 05:40:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774528811; cv=none;
        d=google.com; s=arc-20240605;
        b=AnDCqAKP/G/lGjntGC7V1PIPCq1Od6Q23ycswNcRIEaKWanQgecydjeM9TiYTEbhJn
         zd708pg2Jv0diA0FrJGrc9lW2fOoLn11voMGNJgMXInELeS86vJU5w3oI3m26hXrOy2e
         Cwe38QJw1UVKR3k+XL2K5RAHHwTcHmHBa88EhbMi+4AyOQqcje/TLV45mYHEAVS8Zr9+
         pgysCwn0F6+hxagcaraKbZR8ZpBbry9DFmWigzD76PbQtfx/VI+S692hgogSl3jpJBlJ
         kwUmDll0pv2ubQcvMsON8p4gTzu5QRTHm7h0AdrlIqoX3zOEKSZvburMl/dFmE4Q9sRZ
         k40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        fh=49jmiK6qBax38SWfCmHem6oPZ9ThA1ZIz2gJvkC9CvE=;
        b=JcoOYwbyBMYqLKXmGsP6ulziuCiCOz3p27iulwru1w2Aem5jjIna3qu6nAm3u9veQr
         l3uryK39toEh+1SpInocz1/JLzxKox7iHk2uVBwEYgNbqOgwCwLjVi25Ea+9/N9qpu28
         HMyZRh0PGrB69XfYkVijSxIt6EWbHBs5QnL0F5shFfdyZsWgxUeyam0QNmRYd1J04iXo
         kM1jGKPSYWzX5vg5M833R784es9CZ/1K7xQxLRtmjAtzs01rCLWOp7C4Bp/AemJiAprl
         l5+3VR/tgNNks6naFHyKtS623lNXhnDe2BaiEyFLd/5ET661ye/QlFWZMntIvjhvWQUE
         t7iA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774528811; x=1775133611; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        b=wxrVvWyxGyjiFZ7vWoiobwYNV7LZDjCdD0sA8XGuRpa+gsWphx1HXy5s7AIrisKTSk
         cJfuLddj2OPRnBgcQXmsuIYTw9M/DzDJmTUMF/uC69HdjZrSxd/jCsurvPUYJ5YT53Aq
         E49uy4swVeUQXqgpyx0sB0/4N2P+zbv0Gpe8+isuEZVV59FBLcDMRkiU+uQjr59HjNA3
         ldG0arYJq97/pyzEYk9E0ALb3mApwhVX56lDbZk3FUJf3A6Yoi9g/E6NIGnn05jzZ4JG
         VEFoa5pgd7KaubRlBAObt9p/ieN0JmOEZfTdvelf8OTlX/X1BIzDxAwdAAQabVZ2gMJn
         0xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774528811; x=1775133611;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48CvZ1Y5htSw0CsA/IUWJDDVtqJpwQfkps0eeueb7wc=;
        b=lN3MfLQWsVI1WDacb2nO1svY8tB27UUbyV0Ehmq79c6bCuhQJfhGFrESQXQvTckico
         26uvzNxIsmaQaU6pxH4EDcTYKoUa9SQUywLy0CwvE0FhDSXpGayYHqWxNvg/t+V2DyYC
         lWgzdvhNI1zXWw/wtCIh+1SbeWHSHNcNj7av7ilaEoBQQEbO82J1lPB+NKfiBlxtHJi1
         lsd+ObL2+V7c7KBuFwMjACuE0OBXMTsZ1ZMdrCQD9/6cVpN+mqFny8k3k/5+E3jjIhQC
         +GED1CbIdTppzVDgVor7XO70cJ5D91rciZXNRLa0k018h2cO8WG0faIdgEqoiu6g0Nsc
         wSpA==
X-Forwarded-Encrypted: i=1; AJvYcCUtcuB92fdQAiN/OeEZUcI1i0eBoo7X2FdBXMxe42Pnj2zlSCgZNWQsu5+7fKJ90tFYclVezkohxy/E5wzE2Z4Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxY6t7xwnKFdlb3cmahCmFm0TlxfktOUaVEw+4Zum6X8gglf2TG
	Jp24Q26KrKp5QlGbsVzaKWORtZ8WPc6WbHSLWcivj6Lafp4/0LbArV27lFQ/Gx+WeLGlf+jHUpW
	fb+2gPDRe1YVjxJXXKEGKrgh7QIgDELr+brH+eKzJZg==
X-Gm-Gg: ATEYQzzxCPAc5VzCR8UfYdRBEeLb5/xSTxS6Dz9AdKauz3Yg2RjMBR95KhKKHj/FAwz
	fmPSVJ/H4LIZPPUAEcKtgx4mAX8A90qRw7KclVU15aEO+XWXmISz2KQBg0b4WcJlrpywddtaNPf
	oLNmXQ8LoEItLgHbYCgxRltPaNZIRS3wgo12TzNORTCpVHlbow7/ttBbD74RgaS7Pfd5O+pxQUs
	cL9B/nQlxyYsIVAWrU05aB9Z83mVk65upEyMS8yKp2Fp2elEQ/oYyz650RGt4g6Ps6C9VAKMGBl
	GemETP0=
X-Received: by 2002:a05:6512:1306:b0:5a2:7d1a:4043 with SMTP id
 2adb3069b0e04-5a29b99d856mr2665316e87.20.1774528810562; Thu, 26 Mar 2026
 05:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260325225439.68161-1-rougueprince47@gmail.com> <69C51640.8070408@hisilicon.com>
In-Reply-To: <69C51640.8070408@hisilicon.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Mar 2026 13:39:34 +0100
X-Gm-Features: AQROBzBmRNtgc4rNYofWXMIcZkHCVLXnq4xnye8DD2kjvOTL1AOG-2hkznear-w
Message-ID: <CAPDyKFq6F3PZgqTtHXZPQPPBvdPhsQPtUVHiZV6X-QXvS42+CA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
To: Wei Xu <xuwei5@hisilicon.com>
Cc: Bhargav Joshi <rougueprince47@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, zhangfei.gao@linaro.org, linux-mmc@vger.kernel.org, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_054013_486967_C645EEBA 
X-CRM114-Status: GOOD (  22.59  )
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

On Thu, 26 Mar 2026 at 12:19, Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Hi Bhargav,
>
> On 2026/3/26 6:54, Bhargav Joshi wrote:
> > This series converts the Hisilicon dw-mshc text bindings to DT schema
> > format and cleans up legacy node names in Hisilicon board files.
> >
> > While testing the new YAML schema, dtbs_check flagged the hi3660,
> > hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node
> > name prefix. resulting in warnings.
> >
> > Patch 1 Convert to DT schema
> > Patch 2 updates the Hisilicon dtsi files to use standard 'mmc'
> > node name.
> >
> > Changes in v2:
> >  - Patch 1:
> >     - Grouped compatible strings into an enum.
> >     - Replaced raw numbers with proper flags.
> >     - Fixed property order and removed invalid hex values.
> >     - Added explanation for clock order change in commit message.
> >     - Collected Acked-by tag.
> >  - Patch 2:
> >     - No code changes.
> >     - Collected Acked-by and Reviewed-by tags.
> >
> > Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
> > ---
> > Note: this patch is part of the process for applying to GSoC device
> > tree bindings conversion project #
> > https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> >
> > - The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
> > - It is used in following
> >     /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
> >     -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
> >     /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
> >     -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts
> >
> > Bhargav Joshi (2):
> >   dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
> >   arm64: dts: hisilicon: Rename dwmmc nodes to mmc
> >
> >  .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
> >  .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
> >  arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
> >  arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
> >  5 files changed, 124 insertions(+), 80 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt
> >
>
> Series applied to the HiSilicon arm64 dt tree.
> Thanks!
>
> Best Regards,
> Wei

Usually I pick DT bindings (patch1/2) for mmc via my mmc tree and I
also just did. Would it be possible for you to drop patch1/2 from your
tree?

Kind regards
Uffe

