Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22564D13590
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=usfQSp4ID09XPptN/k4NYA3l+YM/MoIxTl/d5ntjX44=; b=ERIRXBliVaqra8S8k8+TFe6oSJ
	AGWaI0ZB2nnYvyD2Ai6Rpu6y9sFH1PuSsiRJyxgmjb9Wqm5HyWWe7wvqjAe2HiHWaOT8cTFF33ClX
	7qhx4QuuPNW6bmcGGlz1Kj9UfggMC24sIOUdflB3Kx7ae9am6FUI58mYjfIUQP8jXtvh+4iy3WlpG
	InTf/xOf9gk76fFCGWRAeW20KQHXlsMF5UgbTNSYh1kFjoQTC8t8aigShSRdqpeNof8LKKkZhR+X2
	xCKtPkr6ufw2IMdAbEuIHb3xIWvVxYIedst3prq1HohPzDhUoT9hdrC8luYhPXfzMduELzRtzTGg2
	xDWFCTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gIJ-0000000DRRG-17fb;
	Tue, 29 Oct 2024 07:05:35 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gCF-0000000DQTY-3sUL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 06:59:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49T6xCUp108247;
	Tue, 29 Oct 2024 01:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730185152;
	bh=usfQSp4ID09XPptN/k4NYA3l+YM/MoIxTl/d5ntjX44=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UHroTNxAUbb0j3rhrwVhF8mP2c016TJuwPdcR6zlppwzPKT1+4zIB36qG5XoC5Sxq
	 M81GNxZimPdMZivQBHHdppafHGntLx2+nGvnErHGpsOPIYNyoZFoUd4mEi5TWxEZQ/
	 oDkOyUkDAJ2zBWfhuv0xHmJgg7LVc3mZppd2SvP4=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49T6xCUl024126
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 29 Oct 2024 01:59:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 01:59:11 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 01:59:11 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49T6xAUf088949;
	Tue, 29 Oct 2024 01:59:11 -0500
Date: Tue, 29 Oct 2024 12:29:10 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
CC: Chandrasekar Ramakrishnan <rcsekar@samsung.com>,
        Marc Kleine-Budde
	<mkl@pengutronix.de>,
        Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, <linux-can@vger.kernel.org>,
        <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        Matthias Schiffer
	<matthias.schiffer@ew.tq-group.com>,
        Vishal Mahaveer <vishalm@ti.com>, Kevin
 Hilman <khilman@baylibre.com>,
        Simon Horman <horms@kernel.org>
Subject: Re: [PATCH v5 7/9] arm64: dts: ti: k3-am62: Mark mcu_mcan0/1 as
 wakeup-source
Message-ID: <20241029065910.yqzec4ileedx32ex@lcpd911>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
 <20241028-topic-mcan-wakeup-source-v6-12-v5-7-33edc0aba629@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-7-33edc0aba629@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_235920_138673_6DA8B04B 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

On Oct 28, 2024 at 18:38:13 +0100, Markus Schneider-Pargmann wrote:
> mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
> accordingly in the devicetree.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

