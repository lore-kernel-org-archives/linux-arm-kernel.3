Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED963D3A66D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tfxRcEl6yujaoJeBe/6KC02FQAg8zOwmpFzGDqZ1dbc=; b=PhG0Oq/XHklqZW1ZckoTNcm1uE
	Blo1KO9ZMYsl//fEiZ+AKoQMKtJND15ssaMqQPC3xN9/Ld2lXQPSfxWRrMtzL/Tf9CDTXU+hohnbO
	Ft0MEgR0eFLZX0uvmWzKRXIzv1RPnefNjBLzItAcF+oEK+yl24SVvqm02tlK7ZcAwhyct/qDtyUKA
	MWSjZ0Zbs7kXzdoR+46e2PqCbIqlOv4YYlG6Wz7IbD0QuoOi2ffCJHsbM3FkpZeLKnykzwK04agVo
	QHPgqnBNa4SsXZcSieewXHeOBz4k5II82Y0bqKpa3lI/unI9oTXelcLim8cGpXSCEcANCKRtSgVrR
	zv8IPWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oas-0000000F29m-0QvD;
	Tue, 29 Oct 2024 15:57:18 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5oK1-0000000ExJZ-2RCV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 15:39:55 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49TFdbqb015864;
	Tue, 29 Oct 2024 10:39:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1730216377;
	bh=tfxRcEl6yujaoJeBe/6KC02FQAg8zOwmpFzGDqZ1dbc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tGJEk60nkEi1Xj5urMOa2cgwRrLMH45WFwXUx/n0DjvqjZMoKUD9B67maQJE+c3FJ
	 zATcVg2BigwW8JmWnIKYeRJ6VuEiBD/i73ZoNXO/XIHYGuvxa1zeFgCtmyuczNg9bp
	 IafzDaTljI5dG0NCYLMo+JDRVfigX+T01/LtTLLw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFdbkd001965;
	Tue, 29 Oct 2024 10:39:37 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 29
 Oct 2024 10:39:36 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 29 Oct 2024 10:39:36 -0500
Received: from uda0132425.dhcp.ti.com (uda0132425.dhcp.ti.com [172.24.227.94])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49TFdWIu073456;
	Tue, 29 Oct 2024 10:39:33 -0500
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>,
        Wadim Egorov
	<w.egorov@phytec.de>
CC: Vignesh Raghavendra <vigneshr@ti.com>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <dmitry.baryshkov@linaro.org>,
        <krzysztof.kozlowski@linaro.org>, <neil.armstrong@linaro.org>,
        <arnd@arndb.de>, <nfraprado@collabora.com>, <nm@ti.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <upstream@lists.phytec.de>
Subject: Re: [PATCH v2] arm64: defconfig: Enable PCF857X GPIO expander
Date: Tue, 29 Oct 2024 21:09:30 +0530
Message-ID: <173021636094.3847953.6331486710052708801.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241003063642.2710384-1-w.egorov@phytec.de>
References: <20241003063642.2710384-1-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_083953_768411_8E24A7CC 
X-CRM114-Status: GOOD (  11.72  )
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

Hi Wadim Egorov,

On Thu, 03 Oct 2024 08:36:42 +0200, Wadim Egorov wrote:
> Enable the PCF857X GPIO expander which is equipped on
> the PHYTEC phyBOARD-Lyra AM625.
> 
> 

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable PCF857X GPIO expander
      commit: 8461bcf0a3d9d39ff9d858c06c2c820f711a8182

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git
--
Vignesh


