Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7144E69183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Nov 2024 17:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3Ifp0rGPbm/e/7rhcYVsj05S6iHCWRwu0XzDIJa52Y=; b=0kLHk22sE6Ks5AJ46nZ29rdlYW
	dEWqeLiBLIAlSf1cr0rBJC9KaZfK3qr0Q+vDhWsLTM3a6wmuPT5JjWqizz83GOJjL4YBoqR+02TRC
	zPyWEmkKYu1/wmUJqs3zuxM/PpbgttfNDXFGiC4mj+kIE2TThebrxjcLgWfVZFG0n4SKkXH/7JSVy
	xIUxSR8Km6kSwjdNxWYpepGFN1PgTx5W279ARXSMep4JsqHikq5mxf3UHsAed9TqZOYaNl5dbgwNB
	11EFNOYsq8KibISv0g6JYQe2bvQjls4bpmPUUk2xnhiqnhGHb00bJBsFJtC6GvgXTs1ibUWPyjKl0
	16OcEBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXEz-00000002wcV-48pK;
	Fri, 22 Nov 2024 17:14:45 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEXE3-00000002wTN-0rVZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Nov 2024 17:13:48 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-724e113c821so859477b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Nov 2024 09:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732295626; x=1732900426; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J3Ifp0rGPbm/e/7rhcYVsj05S6iHCWRwu0XzDIJa52Y=;
        b=c4nvbxRFUKH3QPqbXR06OPCZTnhTK1X8mjddqCs/dg1iKLs+bkuIbIbcloP+ZQwXKR
         2OFruYIeFfoHUH/F4AwT5CXLjGJL1CLath+NtNUIlsbVrz1o6xMfjSMwg4rY+fZ2tw+a
         uz/k6ACmKgkGX/xQArjfMQTHbuDud4diCcZfXKZFEap1ldw9npF62YcKSxAYU63e0GT9
         05sq/41vSexCkIT3OWq+7AkQGGYk8AvSLt8pYAWCbNg8q2rvtF02hPRqeW7TK6lmxQjT
         mULvZQrlVsqQAlndYD5umoPKZdaRwICZxQkliae8LoYAhdFkI8GOaqKUkDR7cMXpAbwI
         ctYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732295626; x=1732900426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3Ifp0rGPbm/e/7rhcYVsj05S6iHCWRwu0XzDIJa52Y=;
        b=GoZNqwvzIuZfxCPvc6NEJ51jcDFCRnn0IHepUOacLz0ZANn6YmDS5HF8a5S6MCjAnm
         fmneGOqNRL6qG5Gaxfp2jlNRRiJ4ZZz50CSnfxeUAUBwpIpD6CFN/+vfaDWJl/mg2aSJ
         xSp5eaIxi+8MVQO70xKHsOq1g0V7PO0FXD5zetELOzUYT6mbgYhzfwSpu820CHU+DaJB
         l0G1GzJN3bBTT8TA1qpFxUgNgG49l6v62w7n0OPihfYwezz/D+ige3MiGsE03rn6rwch
         bUVQFSn8bEbbG6Kcx0gTi6bwiy+RXXAVOBDc3LtSD5of6U7EGysxckmCjlHOzHMEh1Jy
         1R5A==
X-Forwarded-Encrypted: i=1; AJvYcCU8C8CVZ4xhh/12183rPxabc5xN7H1HD8MRqX6j7JKbsPSPH/V1MwnLko8+9S5R6YHZXaBBIMsxWCFM3GdDXSqM@lists.infradead.org
X-Gm-Message-State: AOJu0YyKNj4K8a4r4Ww3iXvyU99hjx24BaNJqpBF1paIcKFWRulYdeXs
	b+psBButkvD2ZBK9hDc/fzeA8E9lHY4arVYoF8kio6jlCBHVnZvNcsqyKqXHKA==
X-Gm-Gg: ASbGncuw75rru8IAbFlz9NFwylndfVDKbl6NYIDFd6a421EI0n4i7iHu9XLGfG3QGCG
	3+mIYqdWZgIbjyzsdR1P8YFln93Ax6B7rI3wEMNaogc2ArUTT4Eya7tfHp0thpvKQcv40KDdSO/
	PGJlTKL2L2rU4+utE1lVBA2K/oUehSm5QxZK+Ff23x1GnyOfiYOMbaFELBg5PInvqMj8rRQaqDV
	Lveo4Fj9OSZqyumc+f79PIXZCf+zU5wESSVkwPpJoS0frlpSn1NDjaMVyn1
X-Google-Smtp-Source: AGHT+IFSLoW5PIBSR6LBkAITjbzrM29xeBOvFQPIeej5XJi4ofiDVZntpwn9iotOelT7YjAqhB/X7A==
X-Received: by 2002:a05:6a00:a8f:b0:724:62b3:58da with SMTP id d2e1a72fcca58-724df5de418mr4726297b3a.6.1732295626152;
        Fri, 22 Nov 2024 09:13:46 -0800 (PST)
Received: from thinkpad ([49.207.202.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724e0fca304sm1684411b3a.175.2024.11.22.09.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 09:13:45 -0800 (PST)
Date: Fri, 22 Nov 2024 22:43:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	bhelgaas@google.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 10/10] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
Message-ID: <20241122171340.4uwlddrwadg3vyz4@thinkpad>
References: <20241101070610.1267391-1-hongxing.zhu@nxp.com>
 <20241101070610.1267391-11-hongxing.zhu@nxp.com>
 <20241115071605.qwy4hfqmrnaknokl@thinkpad>
 <ZzeE0lR8DGG214qq@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzeE0lR8DGG214qq@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_091347_245862_9A82E304 
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

On Fri, Nov 15, 2024 at 12:28:50PM -0500, Frank Li wrote:
> On Fri, Nov 15, 2024 at 12:46:05PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Nov 01, 2024 at 03:06:10PM +0800, Richard Zhu wrote:
> > > Add ref clock for i.MX95 PCIe here, when the internal PLL is used as
> > > PCIe reference clock.
> > >
> > > Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> > > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx95.dtsi | 18 ++++++++++++++----
> > >  1 file changed, 14 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > index 03661e76550f..5cb504b5f851 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > > @@ -1473,6 +1473,14 @@ smmu: iommu@490d0000 {
> > >  			};
> > >  		};
> > >
> > > +		hsio_blk_ctl: syscon@4c0100c0 {
> > > +			compatible = "nxp,imx95-hsio-blk-ctl", "syscon";
> > > +			reg = <0x0 0x4c0100c0 0x0 0x4>;
> > > +			#clock-cells = <1>;
> > > +			clocks = <&dummy>;
> >
> > What does this 'dummy' clock do? Looks like it doesn't have a frequency at all.
> > Is bootloader updating it? But the name looks wierd.
> 
> dummy clock is not used for this instance, which needn't at all. Leave here
> just keep compatible with the other instance.
> 
> Some instance of "nxp,imx95-hsio-blk-ctl" required input clocks. but this
> one is not, so put dummy here.
> 

DT should describe the hardware and hardware cannot have dummy clock. If the IP
requires a clock, then pass relevant clock (even if it is a fixed-clock).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

