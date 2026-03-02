Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07996E9B37D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:References:In-Reply-To:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=; b=iXHGX+PFrSCMb/pAuqMietDbRp
	fkZrl76Z3yel4bKo+eq1HILA4pAZWtofc28hEoMC5yXIr6NMASqcRnO6Hv1JogvkmZH7d5eYatx6u
	MjYgi06pkG5dJupHhc2LAHkEo04Z6ZeiFxb4d3t8qo5R8JSDjS29/2H+hhRcaBhq9oZn34/UEM33j
	unqOQjeQgMReEPgnhLH3xl8wx4ufB4zkplI5eKDok/Ws9z/sUFsC39JzeKaej509O3HmfCrgmD3b9
	BBG+VDkCBbEEmpy9BQMriFiVPWQHIGcW7oOxMWIY5U/AMpW4sUXZR+K30+PHihiyKSMPjEmJSUHBT
	NMJErK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31K-0000000D4A9-2jQz;
	Mon, 02 Mar 2026 13:09:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx31H-0000000D49M-0XSp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 13:09:09 +0000
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0378B4013E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Mar 2026 13:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1772456943;
	bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=V0oqPwpgSX8HMYdTNuIHFhencAcdIT/Vvcso30FXPH+rrOfpzxXCR0nMHjO3m1xBk
	 nMJhM3amfo6T18tbwbaE3+b/i/jOz6j8qcueV33lCG1Good3C2/aaI0vYY5rIRcLLw
	 lkVsw4VCDb7q6StqlO3f0hgzvZvZW9z6UxZZqMnpTbExBTvsitgs8jj6mUiWNKJ/UR
	 r02blw9yqAreL9OMOy4J22N6YYnQH9b/mdB4Dm3oTyDV+6AUN2iW3JHGOPWKV16ouB
	 8sCCNQ1qEje6Fwpkq3X+ULJPFM2nUiBvTT1UQbEWmaR7QTKUOu3wxkkZ4NpuI9Nutl
	 ySfNJj2rYYvjEC2UBzHc2ecmS/IcLdCilD+qyHML+rAkkr7C55OkCGmRRTdm1NfVck
	 +bEHOPTUK88dk6rtxefAUQf4eFv3nd6N6/qnDGakTSippuFCPKxv2rFhfJsikX8naL
	 8xZJ6H2MgeUSidQRNrVznGbtQUz47WH3B3cIlECRbhBWexrP/XkKdbOxEKlZjN+j5F
	 x8Rac5VRVxdLkV7tDRejKVc8M6Dy+4Egb4qhKubSRQ+3PxDQZFNpw4bqF+wVvf8YQa
	 CJKQNHWxEn25rbicGdj2jSMQ9UDgAn1CGsQKcKDE8SO47NjySk1zDnHw8ZHmEJVURs
	 p6C3tTo8RMWXKddAVxG60QnU=
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b935cf0a2e2so514791466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 05:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772456942; cv=none;
        d=google.com; s=arc-20240605;
        b=fG4i4KnhBcn/kYmsUIQPYOY8lMpzo3Y4clELukE9ZxUdLgBV0wY8yhJww/92sQGRw0
         zHqu5/vzSX0Slk2mA1xHW+XRbig8E/D46YEjReJS05wL/NQPR5dqXU9T69Ey/4UXIEiT
         7Ssx/5FM3T80lKMiRQuYnuWUZm3H40tsJqfvAm42NT6iwfICX+X4siYCbC3soCjFeSt1
         5vVCxM9J5YKlMQ+fURN87Q57PCtap0El8cRt/eBlvmnFv3KfyBEfM7BLQwvHJpnv3Nrv
         2MrQ79qNP/5dQfNCDskx/1K20AF+nIVYubTGXkmgbZMGfJyobz43ou7TzQ2M0d16yt8R
         OMyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        fh=D/ZsmYpHp27cN7Zkbem5UGmkEpChOxGeV9RQziHjdHY=;
        b=JRhj2XztboozQZfH1AdQYQSVwSaNCf5dq1e9P2UxiGvhr5tRC2Ftzt1Q5L9JbYLdQR
         MEI00FynMKVAPiNHjURDtOMYpd+VRiGKiNf+IeL3AlvliJkPxWxwem3HLbwOSc5dqWCy
         FhzQj3Bk+3j2Y/B/YIxMpyQHA83OGLB/v/ZsuW0PUYpXSjIplHx+eQFytuMS723VHRk/
         nOemz+KX0OeRcHURtAlLAaD4XkHBkROdGWZKqkxYSiB44ajYmVTAoA22OudHjza0xYOa
         WkwzRWmGVMQm2wwzzB17toLB8teg0s3//YBezh3VDxZvZeA6OYviCk5VXXKAOewbuKfN
         U/Tg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772456942; x=1773061742;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ECnSn+s6d8RzhavbIFJQEnGNDdcB3vQZ0KecCsizik=;
        b=lEBB3uxhk5/jGJkyMrU5lcvMgQ2rdyLqZel9Wr82qIpHIoRRZLOd3xwlq3nN4lnctk
         wzfkZywGEaEyN5ELv6x9ljqgx3iEe6K61qOaWP5Tf/GVA3EDlWBhT0Q+QPYaTxMTmfNK
         9ja1+9H76an+xA6we298CtogH1MgngbbW92UsybMGFgVP8jRJQfolDbS/qIUBxj2uRsQ
         LR40X0xX4HY4dDg1pQBS+I12LheJMl3/BoV86y1qHIy7wGTgn2y/8UHizOMCA+RGrT7C
         HOdQf2sYr/ah/lHzFUnC1GGSNRNPxcHZ4oOlZszJS8oOHOc3M9kh4rdblvmoDKMOq2hq
         nJTw==
X-Forwarded-Encrypted: i=1; AJvYcCVi0tK+9zMDd2c75c4YVOBYoPH/Q60LNPJgtuEucKqjvGY0Lfir/oEHcl6xPlQ3ecGgO8Wpz9+X1PC4SL3iDAi3@lists.infradead.org
X-Gm-Message-State: AOJu0YxKd36A9WSqw6Qdb7bb/sLdLUg4aWkHkA4rxsbHlLVNqy8ZPQBq
	xxPlYPgjoYQKkQzlzrQ6QbGopuur+nrw0inw2CpyjSmv5q9TrkG9aHJHxCHU9ZJwpSzz3VfHbzq
	C++T9KKAGcObuLxNlFOXq25JA9dbpVIbTI9i1YoxBeCq9UNRtdN6I7l95ft36pzuxF/yBjlr5L0
	oxxvrON1SCVrU23nmSjJo1UtAZUtcISYtyZ0g8SdKFSEIckTu9paaO0ur9oXEOOQmG1kw=
X-Gm-Gg: ATEYQzwxYqU2jUqSOQ7vO9pmUj7ZCkiZF9v9V0rTqwo61pHm3KZ6JL6+x2D7LAlkA64
	1LVMU6MNUlnybEh3LNkpqTwiCjwFIsRXhikQnwiBEoHfmwaQEfVdKyxij17gqanFlBawyIX0+Ow
	QphvPGKOJebc2Qc/xgK+jKoJsLPCpuSarM2ijXxUjhh4soe1hHCZqrzJM94laz9ERnXG5ag5gzM
	R5K
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id a640c23a62f3a-b937657d99fmr789093966b.55.1772456942087;
        Mon, 02 Mar 2026 05:09:02 -0800 (PST)
X-Received: by 2002:a17:906:9fc8:b0:b87:efa:8786 with SMTP id
 a640c23a62f3a-b937657d99fmr789091166b.55.1772456941578; Mon, 02 Mar 2026
 05:09:01 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Mar 2026 08:08:59 -0500
MIME-Version: 1.0
In-Reply-To: <20260227075718.2243818-1-inochiama@gmail.com>
References: <20260227075718.2243818-1-inochiama@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Mon, 2 Mar 2026 08:08:59 -0500
X-Gm-Features: AaiRm52b-jdW2UNX8CSDWuKrreJ-aGAWnKXn668LfKMnXa2Ks1b4qAF3c1WKw8E
Message-ID: <CAJM55Z_soPhC9P03edfq_A-GN07PbGqu31aHgE_5kKhkQwkMmQ@mail.gmail.com>
Subject: Re: [PATCH net-next v5 0/3] riscv: spacemit: Add ethernet support for K3
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Boon Khai Ng <boon.khai.ng@altera.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Choong Yong Liang <yong.liang.choong@linux.intel.com>, 
	Conor Dooley <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Jose Abreu <joabreu@synopsys.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <pjw@kernel.org>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Shangjuan Wei <weishangjuan@eswincomputing.com>, 
	Yanteng Si <siyanteng@cqsoftware.com.cn>, Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_050907_554126_6852A102 
X-CRM114-Status: GOOD (  21.21  )
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

Quoting Inochi Amaoto (2026-02-27 08:57:14)
> Add initial support for ethernet controller of the Spacemit K3 SoC.
> This ethernet controller is almost a standard Synopsys DesignWare
> MAC (version 5.40a). This controller require a syscon device to
> configure some basic features, like interface type and internal delay.

I don't know how we can accept this when it can't be tested since it still
doesn't come with the device tree nodes. If you don't want it to be part of the
series, just share a tree where this code is working. There are plenty of free
public git hosting sites available.

/Emil

>
> Change from v4:
> - https://lore.kernel.org/netdev/20260130022705.1059214-1-inochiama@gmail.com
> patch 1:
> 1 Apply Rob's tag.
> 2 Adjust clock description according to Russell's suggestion.
> patch 3:
> 1. Add set_phy_intf_sel() and get_interfaces() hook, suggested by Russell.
>
> Change from v3:
> - https://lore.kernel.org/netdev/20260128072931.875041-1-inochiama@gmail.com
> patch 1:
> 1. fix the uncorrect compatible string postion
> patch 3:
> 1. add "CTRL_" prefix to all ctrl register definition
> 2. only use delay config 0 to calculate delay code.
> 3. fix typo in the comment
>
> Change from v2:
> - https://lore.kernel.org/netdev/20260121071315.940130-1-inochiama@gmail.com
> patch 1:
> 1. remove not needed compatible for select
> 2. drop empty line in "spacemit,apmu" properties
> 3. add spacemit,apmu properties to required.
> patch 3:
> 1. remove misused phy_fix_phy_mode_for_mac_delays.
> 2. use local tx clock instead of the clk_tx_i in the dwmac.
>
> Change from v1:
> - https://lore.kernel.org/netdev/20260120043609.910302-1-inochiama@gmail.com
> patch 1:
> 1. remove phy clock
> patch 3:
> 1. improve comment and include something special about Spacmit K3 dwmac
> 2. reorder the included file
> 3. fix wrong delay macro used in spacemit_dwmac_set_delay.
> 4. add check for maximum supported delay.
> 5. use DIV_ROUND_CLOSEST to calculate best delay configuration.
> 6. use assign for the ctrl register initial value.
> 7. fix input when calling of_property_read_u32().
>
> Inochi Amaoto (3):
>   dt-bindings: net: Add support for Spacemit K3 dwmac
>   net: stmmac: platform: Add snps,dwmac-5.40a IP compatible string
>   net: stmmac: Add glue layer for Spacemit K3 SoC
>
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   2 +
>  .../bindings/net/spacemit,k3-dwmac.yaml       | 103 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/Kconfig   |  12 +
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
>  .../ethernet/stmicro/stmmac/dwmac-spacemit.c  | 226 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_platform.c |   1 +
>  6 files changed, 345 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
>
> --
> 2.53.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

