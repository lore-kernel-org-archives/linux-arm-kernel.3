Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC8FCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 02:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=; b=D3ecoZZCs7Yr54RmISEry4aWS5
	f9NAPDwbJlZ5s5haH/MlGOJTMJcw0AAagIYLe7M5YUVAHTuEPMBr7HzixeMR6H0WMFyaS8shq47wi
	xCVEkGFY38r5FolNetARV2PMfH5Pdx2zhWdAspPDQqssY7etAaI2yc9RdfwjWvoCnVt9Uj04RI7Fm
	XR88Ghop6JhYGF3RvJc+aCg/amHcEYVmKPuO8miEoPis2BtyBxn/eEGanPd46gRG2JPOr0q0sGEx2
	siqSfsjVn9ocuvc8XjLoDu8xfaRjalJeYwsquB1KtQhRUowsFjhMtq91P5IIbFnG5jj0OAVTI/yYe
	x5Dk5SWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAK0-0000000BdFg-47Jz;
	Wed, 10 Sep 2025 02:12:32 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAJy-0000000BdEg-1xKC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 02:12:31 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-620b2171204so2221769eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 19:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1757470349; x=1758075149; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=;
        b=ILCMNBQ04/7M56H8hD3YleomPQ2g97dXvYXavnj4G7LLza22On0IgWtjbva0ohgl2r
         KMQQF1M+YWxYtQ2TD9IDvCRnoS6FbhnhvmJFbGAfJpjJ8XnTzuIsGiyc26HR3YO2Vb0+
         0TzO5QBWNTwQeUr2YHu4dq+R6I/X8dySEiJmruByzzjvyGsfnHz3g8iQ0fD8DSs/LZjP
         KZQ0JJmTeIqIwLo3q7GaYmOk8TJh8hhswTQHg1JfmBpRrSvSm+Ex2vsYOG1+IeqgSAC/
         mgRUthrzbCB//kD5AGnaBERquWBUK4CXhm9mkTdCw9i6Ez1xsbrALurki/AcgyfvOgKh
         IXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470349; x=1758075149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/ZrTEb1zaDJxW36CE3QTF6qXM0oKKYNei/9YnXXPso=;
        b=ffwueNDQCahmu+jnP4KbyyhrrnoYxdpX06OSUzuiNDrHTcI5JBzK2ddhXbz3Wp4ZRB
         YjIcHiRVzb+4ZWrsFCqOJfrgmK+zg972/pdeRjEwfeyDCx79Glit+1lcayCeD36V/X/R
         zzCseMKyYCN03SkEVWhUI1z16rzG9jLAy7tH2iwKLBHEASnEGfRQu41kYo28cqVsSV1+
         hpU8NQxwlsjRa3v6hhxRDMjKdUwlKQikJzexRrBkNjSJlJTxVIY2tJzb3ZYuMuooJEce
         orUaJMCb7b6gp5fxFCijRMv6QFwpBrXFZx3HYHAQARmv+01a8YOgOZIWtD4wPiIdozGs
         m2oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoe5LJMh3Z0aTEevamgV7YRk6uw6YUkyQAGloQGCAMNBhVa2k0KBUQbh2pPmEHiRGqN9HJ9WHPLreljdU+zDUl@lists.infradead.org
X-Gm-Message-State: AOJu0Yxv7lAAWtXL7W3KCPfBqW0EKMjvSnTwKPXjZt5WjeUjdYGEGz9J
	DCBx60ZTyJXB8Ru/VdWtp0rPQ6ASxq3m3A7B+nygVkuW9Ag8erD+stN2+u1leQ+McqfkBNzDPHy
	5Qn9SvHrltYIWosZK+1J+aVBrd2a6r/ISr+eEvbzkYA==
X-Gm-Gg: ASbGncsoPwDq7agdFTPn0ZWVNtyy4ozJVZCYFGB3xMStGRM1mjX5w/SZKsfWlLz6s2z
	jbMRShqB5iee807R4Ls9BdtUBb8wLFwn28n4598XeTxERweGm2gieQ8tGbYP3MBjV3VBz+NcjQh
	Ge0HS/qYs0tSUu7dHRge7IgrJcV4mvtJ+XaI2uB77qvc4R9BN16OtSQP7BIcgIsVmNPou1iXTT/
	RC9NIM=
X-Google-Smtp-Source: AGHT+IGYzcv+KGeo8D/B/3mzm8u727rEyHjHkqpXMnOV+fGyUvGB1T/ymTmP3km0I0jXSqieUCPPm6rwERicf/XL/fc=
X-Received: by 2002:a05:6820:624:b0:621:72dc:3dee with SMTP id
 006d021491bc7-62178987debmr5886756eaf.0.1757470349286; Tue, 09 Sep 2025
 19:12:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250815-imx9-dts-v1-0-e609eb4e3105@nxp.com> <20250815-imx9-dts-v1-8-e609eb4e3105@nxp.com>
 <CAJ+vNU2hro_ZoRvmQ9yowKsX25AnrgZdGMn2D-RCkyJA02CEhA@mail.gmail.com> <20250909043327.GD20475@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250909043327.GD20475@nxa18884-linux.ap.freescale.net>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 9 Sep 2025 19:12:18 -0700
X-Gm-Features: Ac12FXzv-yx0rHpHYzRFsf11y5WuQG_up-EtuFq-TzQXC2JvCVAePG_zRuL6PxU
Message-ID: <CAJ+vNU3=mwZFBqQRNz4i28EjWXX6=Nf7iAsYPEBgpqkQw4wgtA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: imx95-19x19-evk: Add phy supply for netc
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_191230_511299_5762C408 
X-CRM114-Status: GOOD (  25.92  )
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

On Mon, Sep 8, 2025 at 8:22=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wrot=
e:
>
> Hi Tim,
>
> On Mon, Sep 08, 2025 at 04:43:25PM -0700, Tim Harvey wrote:
> >On Fri, Aug 15, 2025 at 4:50=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrot=
e:
> >>
> >> Add phy supply for netc emdio on board.
> >>
> >>
> >
> >Hi Peng,
> >
> >I'm not sure where you are with regards to this patch but it indicates
> >to me that you may have the enetc_port2 10G port with the AQR113 PHY
> >working on the imx95-19x19-evk with upstream Linux. If so I would be
> >interested in knowing what other patches you have for that. I'm seeing
> >the interface fail to register with:
> >nxp_enetc4 0002:00:10.0 eth2: PHY has no common interfaces
> >
> >I'm wondering if there is some support missing from enetc or the
> >aquantia phy required to work with 10gbase-r.
>
> Thanks for raising this.
>
> This is just to add the missing pieces of device tree.
>

Hi Peng,

Ok, but phy-supply is not currently valid for netc_emdio

> For 10g port, it is still not ready for upstream.
>

For 10G it looks like at least the XPCS support is missing. Do you
know if anyone at NXP is working on this or if and when it is
scheduled?

Best Regards,

Tim


> For 10g port, it is still not ready for upstream.
>
> You could only use the rgmii-id port. This change itself does not break
> the rgmii-id port.
>
> Thanks,
> Peng
>
> >
> >Best Regards,
> >
> >Tim

