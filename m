Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118D1C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 13:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxTlyCZnOk5Fb5qZtA1PgQTQKjHe1tm0Wp5tPNo+aX4=; b=cH5iREatkBODA5nyErA/gTX6jm
	8TIVZDw/5m0N7ti1FvFgn8lrDw9MxIMZOnjtOD7muP4P4Hw7+mokznU+hLeR/G0+3saI8MtadimZY
	AvzwliBmzKzbYsc4K40Jav5sTArfItHz+TmItLK20UY0xbGDg8YwfJ5eO735mJejriftOMz6LGDZH
	t2rLkXo5ncGY9TE9l+ZnRuddeOo966fNT0uFuUiBTzy+GdygQHYqpyoEP2noM9KemK0+NAhs6VoMt
	ul3cPmcSbQ6C0sFBwI8VF+CEv7RwdFne6riVBnrb/5K//1Q5hO+8UQE7v6Fka7/MYq//zXMRG2OEx
	ra3BFHag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OdW-00000006V8n-1HAh;
	Mon, 28 Apr 2025 13:35:06 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NUz-00000006A0Y-297t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 12:22:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCLrZi3537890
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 07:21:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745842913;
	bh=KxTlyCZnOk5Fb5qZtA1PgQTQKjHe1tm0Wp5tPNo+aX4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ry4+tPFP/1qA0h38zaAAQ8ugHBdCOWy3FjsVUrxcRQJGm+z/52ogDKPxV6rUS/UZP
	 OqsDfkMUW6qMx8qSnL8GuqxdHw+r7bv2RXhT7nu2LpAsgZ1d6yRZqNYhAMBqI6JZ+N
	 erMOL43QAn2JSB2Kzq2irFCxIuKd3Q3Jsnsgreic=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53SCLrhu009229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 28 Apr 2025 07:21:53 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 28
 Apr 2025 07:21:52 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 28 Apr 2025 07:21:52 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53SCLqlZ034680;
	Mon, 28 Apr 2025 07:21:52 -0500
Date: Mon, 28 Apr 2025 07:21:52 -0500
From: Nishanth Menon <nm@ti.com>
To: Meghana Malladi <m-malladi@ti.com>
CC: <vigneshr@ti.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <quic_tdas@quicinc.com>, <nfraprado@collabora.com>, <arnd@arndb.de>,
        <lumag@kernel.org>, <geert+renesas@glider.be>,
        <krzysztof.kozlowski@linaro.org>, <bjorn.andersson@oss.qualcomm.com>,
        <will@kernel.org>, <catalin.marinas@arm.com>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <srk@ti.com>, Roger Quadros
	<rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH] arm64: defconfig: Enable XDP socket support for
 high-performance networking
Message-ID: <20250428122152.kfvliea3ragsmziy@askew>
References: <20250428121025.246119-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250428121025.246119-1-m-malladi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052213_644730_66D02911 
X-CRM114-Status: GOOD (  15.80  )
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

On 17:40-20250428, Meghana Malladi wrote:
> From: MD Danish Anwar <danishanwar@ti.com>
> 
> Enable CONFIG_XDP_SOCKETS to allow for eXpress Data Path (XDP) socket
> support specifically on TI SoC platforms such as the AM64x and AM65x.
> This enables the use of XDP sockets for high-performance, low-latency
> networking applications, allowing for efficient processing of network
> packets and improved overall system performance.

* What specific upstream supported boards benefits with this?
* What is the size increase in vmlinux (use scripts/bloat-o-meter and
  add that information in the commit message)
> 
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 9e16b494ab0e..5c3abd51074d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -130,6 +130,7 @@ CONFIG_MEMORY_FAILURE=y
>  CONFIG_TRANSPARENT_HUGEPAGE=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
> +CONFIG_XDP_SOCKETS=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
>  CONFIG_IP_MULTICAST=y
> 
> base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
> -- 
> 2.43.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

