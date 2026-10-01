Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F87FCA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 00:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=; b=A97dcF5CXSsDXtPpuwCBP4YgwA
	SKFuDaYwuUe3UHwPVveplbjzURpFKTIW8C7mvhvk1sW2IMlU3iGsaf7VuVTj4nwbop2YCdtNu3nso
	wS0SgpSyFh7a6AVtH2GC97xJ470ND7JyVnS8CTYEWv+zpSc7bc9coKhgQsMFYPV8cFHm5ZU66xnbU
	WHheuC3UchHuZ6hbH1glOaZzBOYfg7lN5ThEPJwlCZ+9DOsSDW9twRMd3eLxK23RuSJ3ZRu/IngoP
	m8P3A2NxcyZsxoapJUZsUM7E7b3pPAQUnAo6PrsEg+wGqsbHFQhUOK1ju5Z1u9Mv4LvvAcAoIRUrH
	sFOpKJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4e7-00000007Vk7-31cO;
	Thu, 01 Oct 2026 00:27:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC4e4-00000007Vj0-08Uk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 00:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=;
	b=J4TSmKTHWiyiGi4BxmklrzEDbZGRK5cQV0wjFBuEE+qseaqntyxWE1Ahm65qcHx78rPVql
	ibjg/rsuUVMOgwHOGtqcqP7pVrC/ZQpdz6Bv26vErzwsUv8vIKm2ilwzzAm/i8txesdPIp
	bxKB69lcbwKz+0tvS+fKJdhLQvc8iPI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-m425PZcAMiuLnX1GfKntdg-1; Wed, 30 Sep 2026 20:27:27 -0400
X-MC-Unique: m425PZcAMiuLnX1GfKntdg-1
X-Mimecast-MFC-AGG-ID: m425PZcAMiuLnX1GfKntdg_1790814447
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5337b591609so12847911cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 17:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814447; x=1791419247;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=;
        b=UFoaZkIf7NtrMYfYdeMvG3QcBy3paCcoBcm3aRYoykb5nQm1XwRyrRYjMYDVQu+ZyS
         oeOINbkCyVbHyOlBhB3hHqV9qUh5My3W3693u807scoU5XJHlCqV46Dg+rj2cv+YANE1
         il5+vZQm5AN3npm/+PlD1vHvQHkUZcYN7YBbEaqrVQgvIhA+9DrbBhJppO3/MW2ESUfe
         PU67E+LP6d8+TgpYBvte2JlDph2g0bHVpH6sazO7iYIN5OY9SsnZMNItKIBblx1jPfJc
         97+ay0PlEDLqkRH8kzzYOguH88m5YIrtv/Ri8yI8uFZhwUAjuNOgwurXbU1CmQxDvBc1
         Sbhw==
X-Forwarded-Encrypted: i=1; AKwUvBxV51iDLxn4qhB3rpeRc2JnW8/iR/bxQdTXx5UwtA41qbT675JLpqxt7ixZ3qcnPXxRwBYVuwhhf86vdD1c8t4S@lists.infradead.org
X-Gm-Message-State: AFuF++l8ugm5b6iPppYwKVYzMhW1LRb4kFzvyYl0WDZVPLTwIymHz0/d
	fvKz+vQxk/vVXMqS29bssK2QRxmC3gstctH00DDvme3hDfw7jsFxBH1F8z5UKOAMyqBhzAFzZzg
	rp1HYOeODx6nVbIdnVZDZcX+slTPKyGznbNLQRqzr7ZaNBPn6bsT20hGUpjx+9f7trti6VvzPUx
	f0
X-Gm-Gg: AYBFou2NP+eJxEdm7cxZg/zjFDD1M0v5VS7nurTX/YMribJvGlV5IpfxKnfc/fecLM3
	7w8tzvhwkLHygXg3vfn/iHKB582vHyW+MbwVC/4wNnuHpEkL7FgIcq8Ms6AWHq2ge05i4Bps9Bu
	pSswo7edSoEXUGnbrrGASt4Qj1HbmwdRdau4oozdHWK6yVppeaEKtMvkN2aDMUmIdkfTI8DTSmF
	IgLAfqG6gdeAYTKLrJU92aMOw8IaEvWB/tdaJ0VNcY6yOLP+q0fxS8u4DMsiZ1qkIEmQvYbiVgl
	1Jvbr9buV5sm8TM2ANWzqzO5FkOZhXb2bGSP1hzwgKg1tKrtSma7fjJpqVhtMrEjjQ7mRbt19KW
	cLsv/dM96u94YDjqKBdTFD1wjHEkAXbL4qVM=
X-Received: by 2002:a05:622a:4d9a:b0:533:3868:1f78 with SMTP id d75a77b69052e-53374328747mr61077601cf.51.1790814446748;
        Wed, 30 Sep 2026 17:27:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d9a:b0:533:3868:1f78 with SMTP id d75a77b69052e-53374328747mr61077101cf.51.1790814446078;
        Wed, 30 Sep 2026 17:27:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53385f87469sm6552381cf.3.2026.09.30.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:27:24 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:27:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Message-ID: <ar2o6yUzJP0H1YJv@redhat.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
MIME-Version: 1.0
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B8P-RcxuPYR2IjGOCpCBtIIIwgvO47ms1TekIS-X2Is_1790814447
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_172732_154573_25BADBD7 
X-CRM114-Status: GOOD (  22.95  )
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

Hi Stefan,

On Wed, Sep 30, 2026 at 09:40:12PM +0300, Stefan Dösinger wrote:
> Hi,
> 
> This pull request contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The patches have been reviewed and carry appropriate R-B tags by Krzysztof Kozlowski (bindings) and Conor Dooley (clk driver).
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> The following changes since commit b1470947e92aeedd522ddb7363369c956e55d6b6:
> 
>   Merge branch 'clk-pile' into clk-next (2026-09-29 14:14:32 -0400)

Please send a new pull that's based on v7.3-rc1. Or if it's easier you
can post a new version of the patch series with just these clk patches.

Brian


> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-clk-for-7.4
> 
> for you to fetch changes up to 89e2c0fa481f6a0da23ad5c4dc98bcd940f09fd2:
> 
>   clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-09-30 20:03:29 +0300)
> 
> ----------------------------------------------------------------
> clk: zte: Add clock drivers for zx297520v3 SoC
> 
> This tag contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> ----------------------------------------------------------------
> Stefan Dösinger (9):
>       dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
>       clk: zte: Add Clock registration infrastructure
>       clk: zte: Add regmap-based clocks
>       clk: zte: Add zx PLL support infrastructure
>       clk: zte: Introduce a driver for zx297520v3 top clocks
>       clk: zte: Introduce a driver for zx297520v3 matrix clocks
>       clk: zte: Introduce a driver for zx297520v3 LSP clocks
> 
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml    |  101 ++
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml |   98 ++
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml    |  122 +++
>  MAINTAINERS                                                           |    7 +
>  drivers/clk/Kconfig                                                   |    1 +
>  drivers/clk/Makefile                                                  |    1 +
>  drivers/clk/zte/Kconfig                                               |   28 +
>  drivers/clk/zte/Makefile                                              |    6 +
>  drivers/clk/zte/clk-regmap.c                                          |  237 +++++
>  drivers/clk/zte/clk-zx.c                                              |  192 ++++
>  drivers/clk/zte/clk-zx.h                                              |  137 +++
>  drivers/clk/zte/clk-zx297520v3.c                                      | 1657 +++++++++++++++++++++++++++++++++
>  drivers/clk/zte/pll-zx.c                                              |  576 ++++++++++++
>  include/dt-bindings/clock/zte,zx297520v3-clk.h                        |  154 +++
>  include/dt-bindings/phy/zte,zx297520v3-topcrm.h                       |   12 +
>  include/dt-bindings/reset/zte,zx297520v3-reset.h                      |   62 ++
>  16 files changed, 3391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  create mode 100644 drivers/clk/zte/Kconfig
>  create mode 100644 drivers/clk/zte/Makefile
>  create mode 100644 drivers/clk/zte/clk-regmap.c
>  create mode 100644 drivers/clk/zte/clk-zx.c
>  create mode 100644 drivers/clk/zte/clk-zx.h
>  create mode 100644 drivers/clk/zte/clk-zx297520v3.c
>  create mode 100644 drivers/clk/zte/pll-zx.c
>  create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
>  create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h



