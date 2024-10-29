Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141B0D13594
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D4ct3CvxUUnSvNxEudgCSRthDl/NoDac/oF8Y2JEJ7k=; b=sm7htu7JCUsmM4ZLwatAyvSw97
	YcIZsV75cwLu1qlGVIMPLNGtT3FV3UAlLLNhG6lhBFlMFxrGGZI6hgfnqgIflaNrauQfHw6VzRsP1
	ZqFh+jWGIVgijCdbMrmzDd0/bcV23NSJ87B0UDcMnconoi/9iUUrWLmTme/492N5nxKY4UprpjmdW
	CgvJni6F/lcA/snXSh2HFE/G2Cy3v/+GMm7mtZJft4K7dcnE/Dkn4DSwr7F+dg6Gkrp9kuiHFpdT7
	Yg7+jMKeYdfB/D6RUsHxmIlHK3Y7j+fL+mJvejhrNok1In03p3O8mTTPZMQiLIEC+WVAu27XX1tCV
	h1KRhUkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gN2-0000000DRyj-2kyf;
	Tue, 29 Oct 2024 07:10:28 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gDB-0000000DQi9-3WlP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:00:19 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49T70AZo108569;
	Tue, 29 Oct 2024 02:00:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730185210;
	bh=D4ct3CvxUUnSvNxEudgCSRthDl/NoDac/oF8Y2JEJ7k=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=zVqbGtaVXrjnoj+uKOsMu25ccE5aZNei8B+nK1bU0gR97IJC45L+zQCZp4fdYxdmS
	 v7BZz5qk28cs8BShWK6Ikxa0PsN2WkJxdtpFjdvfbwud/bh41a04w6yYeT0xXcQypV
	 Y2nT7zHXZiBSlrt3L+UTo8+1RCLlLkHw8JUG6gzI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49T70Aum079437;
	Tue, 29 Oct 2024 02:00:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 02:00:09 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 02:00:09 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.227.226])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49T708cc091693;
	Tue, 29 Oct 2024 02:00:09 -0500
Date: Tue, 29 Oct 2024 12:30:08 +0530
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
Subject: Re: [PATCH v5 9/9] arm64: dts: ti: k3-am62p-mcu: Mark mcu_mcan0/1 as
 wakeup-source
Message-ID: <20241029070008.u23edl7hzuntp6aj@lcpd911>
References: <20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com>
 <20241028-topic-mcan-wakeup-source-v6-12-v5-9-33edc0aba629@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241028-topic-mcan-wakeup-source-v6-12-v5-9-33edc0aba629@baylibre.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_000017_993405_D2E5E684 
X-CRM114-Status: GOOD (  11.60  )
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

On Oct 28, 2024 at 18:38:15 +0100, Markus Schneider-Pargmann wrote:
> From: Vibhore Vardhan <vibhore@ti.com>
> 
> mcu_mcan0 and mcu_mcan1 can be wakeup sources for the SoC. Mark them
> accordingly in the devicetree. Based on the patch for AM62a.
> 
> Signed-off-by: Vibhore Vardhan <vibhore@ti.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

