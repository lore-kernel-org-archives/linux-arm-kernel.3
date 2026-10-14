Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68116CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 11:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y96IkeDxhN2mv/HtCGTf5fVU+AZ1Foo8ubrdmppnui8=; b=Xob+yL5b+m+i8l/iwWROnYih7K
	r9iq8BihSbVMWbRcSLHJ4v9lZhcHqhPCT+Q9X2AMK2iP+LMdAtA0/xLe8JhA5JpcrblynDD5gsv2E
	wI1aQIj/+OihRYz0eNPalCf25L6pxS4sYHMkSF8D+rRoYMv37TFDjC94TcxiFK5B+JBoC8DiNev+p
	VO15TBvdj1hE9YKgMNvflNDGS0INBKm+dIp9rqK6ThnRbMOiJsDW/H8XCW7QWSWb7FRY6GWfQxlio
	JdomkBaMV1FjhFv8C5aMgJzwcaFoaaUyT15+RKfp4uvLCf9JUz56Cioujq32/pznPhqZVJc7Pq7+e
	mEUtb5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwsr-0000000FIRM-3duA;
	Wed, 14 Oct 2026 11:10:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwsm-0000000FIQV-1tyi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 11:10:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD4406021D;
	Wed, 14 Oct 2026 11:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4171F000FF;
	Wed, 14 Oct 2026 11:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791976251;
	bh=y96IkeDxhN2mv/HtCGTf5fVU+AZ1Foo8ubrdmppnui8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CWx4n9R46TUqwkh7PD3NrIpvAN6CeIsqtkLYPEI3nayTP82qiokRVEOSoTXi7JDun
	 0T0Y0ZEdhNY2vwCweSoDYhfikgZsICh522SJERQY0izF6rslpI26wHSvQIRECpsgPw
	 3T8DjC2hYwURj40OV3fgiSvD+O4LbCMP2loE5Hb3qn0Q/X6ZDvxT8K8G6R8xy9n45W
	 XkCJlBrfGwp7E33utB0UnoF0NNz+aoNjOUT0mKmuIfJbZJpYRgX53yGP0t/xm9KADF
	 r5HiAjK5/IcJVwY9jbWjDDP9ib7KsTnjIst2A5lQBCczmVDW6JacaVfo5Wh07knVNM
	 ToBz+IPNA4kow==
Date: Wed, 14 Oct 2026 13:10:48 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Larisa Grigore <larisa.grigore@oss.nxp.com>
Cc: NXP S32 Linux Team <s32@nxp.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@sandisk.com>, 
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
	Ajay Neeli <ajay.neeli@amd.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Pedro Sousa <pedrom.sousa@synopsys.com>, Hannes Reinicke <hare@suse.de>, 
	Joao Pinto <Joao.Pinto@synopsys.com>, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, clizzi@redhat.com, aruizrui@redhat.com, eballetb@redhat.com, 
	echanude@redhat.com
Subject: Re: [PATCH v8 07/12] dt-bindings: ufs: Add NXP S32N79 UFS host
 controller
Message-ID: <20261014-valiant-goose-of-revolution-efec17@quoll>
References: <20261013103003.373156-1-larisa.grigore@oss.nxp.com>
 <20261013103003.373156-8-larisa.grigore@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261013103003.373156-8-larisa.grigore@oss.nxp.com>
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

On Tue, Oct 13, 2026 at 12:29:58PM +0200, Larisa Grigore wrote:
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: core

I don't get why you added the clock-names.

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - clock-names
> +  - operating-points-v2

Your opp-table is empty, so requiring such property looks like wrongly
written driver.

> +
> +allOf:
> +  - $ref: ufs-common.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    ufshc@4ac80000 {
> +        compatible = "nxp,s32n79-ufshc";
> +        reg = <0x4ac80000 0x1000>, <0x4ac40000 0x1000>;
> +        reg-names = "ufshc", "scm";
> +        interrupt-parent = <&irqsteer_coss>;
> +        interrupts = <211>;
> +        clocks = <&clks 0x92>;
> +        clock-names = "core";
> +        operating-points-v2 = <&ufs_opp_table>;
> +
> +        ufs_opp_table: opp-table {
> +            compatible = "operating-points-v2";
> +
> +            opp-0 {
> +                opp-hz = /bits/ 64 <0>;

Best regards,
Krzysztof


