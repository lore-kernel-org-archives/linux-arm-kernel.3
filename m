Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B235C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 17:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhurBa5mwUKpezcbMzv1+OspD1kqhRvpFJ2L8Bz2kqU=; b=VqUVJB3JFUq9SdxHlHkkjvZ+BW
	ajHyuv8Yij7VWwR+S7p4K9zMF6hVaHo/sJk8O7UbRcCX+hHtmNiGV/x0Ag/oEfD8t64F3jp3Wq6Ym
	CAfbw7mZLVTqydXoT1KvHnj/CaBrRzXYvEvvCOCzYBNG1+z2i7FpPKhZcsUjqz2L6UPGZB+KBVLpb
	X4iojcNG6+yQSdz1B5okXw6QfGDei18PsPnR2zD7ob+KCnCRk9SUHDenkHOHTypiqzTTYPYay0JdT
	r71mEdJCcgG6ATYjmic/JTuhqbiqaEgrPHNNG5hHa+RJ03Ua0yMP5EVFHJZVQo0uuGjTk4kO5upl7
	cmyxuwPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucobZ-0000000DBWO-06G6;
	Fri, 18 Jul 2025 17:10:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucoXA-0000000DB2i-3qtv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 17:06:12 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so1932992a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Jul 2025 10:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752858367; x=1753463167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vhurBa5mwUKpezcbMzv1+OspD1kqhRvpFJ2L8Bz2kqU=;
        b=nPzvUulWGiQfSFqmwVp6MJGNDsV/d4bFdx44didPg6dPFhDNiusGy9en4ygMa+96D1
         Y6E/Hi1YWJnAB6i0bczSwrG6X2tvmfTUCnemOSmqLnJU7jBqrfzhejR7iZm1uaznR7CD
         kc1mVovX0675qAH2SX6bZw+6jYQQ4YZ/jjaAOaYbb6J7nxhnP200ZTzMWMBYbamEXl5B
         xCshvL8/22TFpfe6VNmruWM8jVEC1FVTxvvzMWoJ0tXaSLn5zA2al/UNrWvQ6HUDEinW
         h6aRhUJ+uFB7AzHS3ZR5z1jaD8K+uJB4vYOvuPDASJogupUPFyjL3NVZvBbvZvjWXtpU
         vTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752858367; x=1753463167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhurBa5mwUKpezcbMzv1+OspD1kqhRvpFJ2L8Bz2kqU=;
        b=M6DxxPweHSd9IuIMgZPpX1dq0SZde9OWkn4BtgRhLdAFHMXWK5kqGyEi7jytVVjeeh
         fJ38XPaWVAFDLlQrOtEKE8nFaxrC1mMN2s+iVDh9e9Ww1OtGDzJUeUU0B+eY2bK4UsLX
         uDoSaVA4DvbFpAl29Uvuwr1yIasFKVJdf5vFYBXHcmUJhVCZ7q8OsdT7isftmTe8OcBQ
         3IVC50Y3aEKRessQDpjAq8AGZKH9uU4ZAMpCHGtouYIvUfw0/YdokzSMAcG+V8MDgiUa
         H74YKCWU1nlKxmAwuVBu4pUmZpGcczkOTAddI4d0ZCDYYltRDMLokC095unhinFao7Wy
         jbcQ==
X-Forwarded-Encrypted: i=1; AJvYcCULV2r5a4MwmvyxvrJnm2ycYDx975+bMDvndTzrtZktq15WL3AJPHl54VHE+FSanlzGH/4/7H80ER/qCNMcq1DH@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2jmsxb3MMTxRhyip1ygHOg3D8aIVOLzgAUc81EYo5D0xQiRf9
	ILv8n3zGpDEsWTzAPn8/LHE7keh0PLoZSKyxO2xDSBqftDIho5lvZz2pUdB1Y5PFvQs=
X-Gm-Gg: ASbGncsm7OiHzlurnds/ST9AlRHDB7hxjB0mfb5vh/Ekjuu2FYykGWVS5muc2VoYQz2
	BZTkGO1mQmsoQCn6zdf83JI43sl6a4NGShO8kvCWldBSp0ubvO5lr9I10Ln97z1xYEN2QAlzgTe
	Eit5ip5eNbgMTLrQ3L1I7hMrrjLzVYd1mWFyijzyXBogBIK+PgXzA72uaLNHh3DdkmRynjXVnXb
	47Hk6TLOY93hK/wWzRegegF4ssrBKYSu7XQnlrRTvqUltGrClhKn2veeqA7UIj+AN3ikEtoA4Dx
	5+07iDHN9d5Ldnf+VjpWj4IEe6lHqHp/5KcoJVFlMriNhuzRM7sUGunRh30uXa4q/iwoxlL8FO6
	s1wxP0+GeSAmJp3as3lz3CuNtW3/OWbTz7SL9
X-Google-Smtp-Source: AGHT+IEx6ySB6V3hyKXChSRvGBgPCHaeNn+2Yrx9kNMJebeK99RUGW1gvTuZy2CawEeN7hsJkrecLw==
X-Received: by 2002:a17:90b:55c4:b0:311:9c9a:58c5 with SMTP id 98e67ed59e1d1-31c9f44b9c3mr16334749a91.12.1752858367484;
        Fri, 18 Jul 2025 10:06:07 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:2122:eb88:47da:7caf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f2c708sm1623990a91.30.2025.07.18.10.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 10:06:07 -0700 (PDT)
Date: Fri, 18 Jul 2025 11:06:04 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, "Rob Herring (Arm)" <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Frank Li <frank.li@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
Message-ID: <aHp-_BRk7Iz81OFp@p14s>
References: <20250710-imx95-rproc-1-v4-0-a7123e857dfb@nxp.com>
 <175224423523.783161.17907302929832941912.robh@kernel.org>
 <PAXPR04MB845959EF2767C96794EAE6DD8854A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <aHkNS51jgV5ulsNB@p14s>
 <20250718082033.GA25126@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718082033.GA25126@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_100608_968940_C2D13D94 
X-CRM114-Status: GOOD (  25.36  )
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

On Fri, Jul 18, 2025 at 04:20:34PM +0800, Peng Fan wrote:
> On Thu, Jul 17, 2025 at 08:48:43AM -0600, Mathieu Poirier wrote:
> >On Mon, Jul 14, 2025 at 11:52:05AM +0000, Peng Fan wrote:
> >> > Subject: Re: [PATCH v4 0/5] remoteproc: imx_rproc: Support i.MX95
> >> > 
> >> [...] 
> >> > New warnings running 'make CHECK_DTBS=y for
> >> > arch/arm64/boot/dts/freescale/' for 20250710-imx95-rproc-1-v4-0-
> >> > a7123e857dfb@nxp.com:
> >> > 
> >> > arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb:
> >> > scmi (arm,scmi): Unevaluated properties are not allowed
> >> > ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were
> >> > unexpected)
> >> 
> >> Same as replied in v3.
> >> This is because [1] is still not picked, not because of my patchset.
> >
> >I won't move on this patchset until this is resolved.
> >
> 
> Not understand why hold on this patchset. I suppose you may not
> understand what the error means. The warning is totally irrelevant
> to this patchset, there is no dependency.
> 
> Others added a property to arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi
> &scmi_bbm {
>         linux,code = <KEY_POWER>;
> };
> But this "linux,code" property not landed(missed to be picked up) to DT binding.
> 
> This patchset does not touch scmi_bbm. I could help address the warning
> in the other patch, but I do not see why "linux,code" under scmi_bbm node
> could block this patchset.
> 
> Please help clarify if you still think to hold on this patchset.
> 
> BTW: with [1] "remoteproc: imx_rproc: skip clock enable when M-core is managed by the SCU"
> merged in Ulf's tree, there is a minor conflict with patch 2. Please suggest
> what I should do with this patchset.
>

I was afraid of that.  The best way forward with this work is to wait for the
"linux,code" property to be picked up by Sudeep.  I suggest you make sure that
he, or anyone else, picks it up for the next merge window.  If that happens
everything should be set for you to resend this patchset when 6.17-rc1 comes
out.
 
> [1]https://lore.kernel.org/linux-remoteproc/20250629172512.14857-3-hiagofranco@gmail.com/T/#u
> 
> Thanks,
> Peng

