Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E77C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6KlOvnCgjUvf/hwOUGs49yrmKu6ncKhQnFDuHDtvwgQ=; b=vikFarRVSacAgwCSrqtBZuTPHH
	2rgNlpWh4Y9MQQXL84AIUL458H8ROAM5iuSBH3Buy1S5p4EYNSh7av1IDbnM7SCPWAHpigJXnB7NS
	2sYYY5DhRwx+icohZULDMVxGMhjrjbdOBz/JtsaysyPVP0wRmQK06t3G1QH+4t+in6qEUxLB1IfLX
	h5EU6OLpCRIlZhu+IkZpuMg7s8wd/NvVR4d7GYT7vfYhmynxiWZExNMccSOsvxFsSaL49lfNaowt4
	bOEr4Mm8AMYUpioe8KVTQEkxE839P/quahqJlM+t/1sIuz0QUWPYLGi7ihuHmCNvKdtIH8U1YE90H
	7dTvoFbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqyDG-0000000Gwzp-1YUa;
	Sat, 08 Mar 2025 17:43:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy2C-0000000GvZw-3twg;
	Sat, 08 Mar 2025 17:32:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6KlOvnCgjUvf/hwOUGs49yrmKu6ncKhQnFDuHDtvwgQ=; b=QN8MP1kHxb0Np/W35RnQkOpic1
	WVCeb8wSEbrJ0Ca+YXMn8Jl5YmZZFMuP5euqnrCCvVUEVtgQ3UVRYW+0WbrIiJ3aFJMN9kscEduy/
	J9vLK02wJpOVs0Q008QPK15oYbhZv6SF5PnsMZ3OenbjMYdB9sb0tE3HELerPy/Y2y6pYMJu6DHRZ
	xb6oPg8CB+79apEeHdJIWbCiC/dbNZtn7tTKS7lWQALEv5/I8vdz3Hr8ADkmunoyO89tA1xcwIxCS
	oZ2odHXe0exZhHIQJyys5VKdlfkYV31hemzIkOFTb4ebpLjI6BrZicpot/rOwq/QXC0p+eR7CBHZP
	Ymzq2iGg==;
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy1z-0004Tx-4E; Sat, 08 Mar 2025 18:32:11 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
	Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Stephen Chen <stephen@radxa.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Liang Chen <cl@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	Frank Wang <frank.wang@rock-chips.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 0/2] Add SPI support for Radxa ROCK 4D
Date: Sat,  8 Mar 2025 18:32:02 +0100
Message-ID: <174145503578.101861.6708020460490531029.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250228145304.581349-1-detlev.casanova@collabora.com>
References: <20250228145304.581349-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093224_964668_1EEAE38A 
X-CRM114-Status: GOOD (  11.61  )
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


On Fri, 28 Feb 2025 09:50:46 -0500, Detlev Casanova wrote:
> The board comes with a SPI NOR chip connected on the FSPI0 interface.
> 
> Add the SFC nodes for the rk3576 SoC and enable sfc0 for the Radxa ROCK
> 4D.
> 
> Detlev Casanova (2):
>   arm64: dts: rockchip: Add SFC nodes for rk3576
>   arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: rockchip: Add SFC nodes for rk3576
      commit: 36299757129c897ef8c7ace6981070d367d89f89
[2/2] arm64: dts: rockchip: Add SPI NOR device on the ROCK 4D
      commit: ba82f56bbf20e4166c988621cd0507509872848e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

