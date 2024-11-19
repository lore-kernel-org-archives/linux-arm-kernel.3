Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5605ED44161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 13:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBFA36f9mwneGLAymy33gOv/5Yduj/hhKC3md9CBVt8=; b=eHdYMW8f/FeyH4daj0XHqv/TAi
	t1VfoqRwmgJD+0hNPU62UHtXHvEzX4vPo6zb/5ZiadN+q6JDrpt+MN/INKYytNgEGVbHXQSLk041N
	MYL9Kj3DejwqTBLnr7Q0RqQCl6e3V7ASH3+B7Zy2BRAsSejLIZZq5TnmdwDOc25grvp5j/LRnA5iE
	RuKYzyT2fllw7QSp6Jd817LP9OkudX/gS/WAKuh3rkhbwmIp3jd2myaLpLalNY06A9HMKgFp2k8IL
	blccgCIuYlPqqFtjMdgmOn8K+LmGMvx9YEOkTxqRxrtntCvxw0CoPGlo+C7VlbRj7lyLc81Knhp8A
	CAK5TeOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOir-0000000CbIf-3ZjN;
	Tue, 19 Nov 2024 13:56:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDOhl-0000000Cb1U-0hoF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 13:55:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8513D5C5537;
	Tue, 19 Nov 2024 13:55:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0853BC4CECF;
	Tue, 19 Nov 2024 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732024544;
	bh=9LG7YsYWIp1ZG6/QT8ybq/ypWUP4L1y8uQRWVVB9QP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsJTgP7OUZXIMWJKyeMZcw4oMRTjB1QzhjHU/XJieZKkFtaSxjcm9jGsL7QOnJKKP
	 9wsiTgZtAdfc5ex+Z8lcLcYfEiEn+9Afb5BCY2x10kZlXSoxFZp83/ZWqLdJ2aCf1K
	 CuJLa+09f/K/pMwUbFhndD9j3Ot270HHENLdGagME3rJY+CzSLulnnciXpoC1OoZgn
	 xu0c5/sedTXc9/qCF4BgPlYIVeZ3JAIs+Lx12ixMbYd8anoM0NBDZ5EghYg51zSHl1
	 YWKHDpfs9BTixmrv5H4BiUZOx0uFpLhD31mnpCZS8gn0RBoLVY9jc8Cul0SbE+PMSw
	 hB8/YN7rz4kiA==
Date: Tue, 19 Nov 2024 07:55:42 -0600
From: Rob Herring <robh@kernel.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, catalin.marinas@arm.com, will@kernel.org,
	kernel@pengutronix.de, festevam@gmail.com,
	francesco.dolcini@toradex.com, joao.goncalves@toradex.com,
	marex@denx.de, hvilleneuve@dimonoff.com, peng.fan@nxp.com,
	hiago.franco@toradex.com, frieder.schrempf@kontron.de,
	alexander.stein@ew.tq-group.com, mwalle@kernel.org,
	m.othacehe@gmail.com, Max.Merchel@ew.tq-group.com,
	tharvey@gateworks.com, quic_bjorande@quicinc.com,
	geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org, neil.armstrong@linaro.org, arnd@arndb.de,
	nfraprado@collabora.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, ping.bai@nxp.com,
	ye.li@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: fsl: Add i.MX91 11x11 evk board
Message-ID: <20241119135542.GA1076739-robh@kernel.org>
References: <20241118051541.2621360-1-pengfei.li_1@nxp.com>
 <20241118051541.2621360-2-pengfei.li_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241118051541.2621360-2-pengfei.li_1@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_055545_249875_574356D1 
X-CRM114-Status: GOOD (  13.82  )
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

On Mon, Nov 18, 2024 at 01:15:38PM +0800, Pengfei Li wrote:
> Add the board imx91-11x11-evk in the binding docuemnt.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>

You missed Conor's ack. Please add tags when sending out new versions.

> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 6e0dcf4307f1..5951317ce900 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1332,6 +1332,12 @@ properties:
>                - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
>            - const: fsl,imx8ulp
>  
> +      - description: i.MX91 based Boards
> +        items:
> +          - enum:
> +              - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
> +          - const: fsl,imx91
> +
>        - description: i.MX93 based Boards
>          items:
>            - enum:
> -- 
> 2.34.1
> 

