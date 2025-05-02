Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9653C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPvLBOo8PUEcZ+zsiAT7YTa/Enfgl6yISRpYWQq4Xlc=; b=ksBl0RsETjijVS4nmcaqBzRsOs
	Wwx8t05THLpYBKhOa8AwMbyUqaUfC/buQX0eUjAn7qe3Idvhz4vwIM26k2lyEdJU5ZUvut21B+j8H
	l3HUeMPNitA5cfJr4qdkvzd59m8iotJBHCXZNBcu/2M7KsuzdymbIefAle/8n9Cwbk/ua8xCeYCFi
	FJCozcm+mVmBLMiLv3u2hGmIyOp+dxhXlbRPaCOgn2wCE2QJtCKM6R0kt/bWdnFp23rHqr6yZPBku
	HzeO5ueRWgIBI5aDQO06YdgUEJ5c+/VhuLlCGpzZV525lBSI1gbcB73PSI4iXD6LKU8+80irZEHgH
	9LRYVTDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArlW-00000002Fc6-1Hr3;
	Fri, 02 May 2025 14:53:26 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uArdh-00000002ETt-3gIg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 14:45:25 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 542Ej9Eq3882499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 09:45:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746197109;
	bh=mPvLBOo8PUEcZ+zsiAT7YTa/Enfgl6yISRpYWQq4Xlc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bHdEVZl0TvscsOYtOezU7MGGu/rOW+hkUvb9WjiPsl1BfbI4gxKyCEmE87tqPaajk
	 Hmh0Ifvc6ROm/hZ0M3nA0G4v5XYO5Toap+U/YD2l939CpLyjxq1NXmhmAsww6Yx8V2
	 Op1sKaIlHfyEcHbji5vg1wpYDJSet58n7KPOC+zA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 542Ej9vl002877
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 May 2025 09:45:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 May 2025 09:45:09 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 2 May 2025 09:45:09 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 542Ej9KP129766;
	Fri, 2 May 2025 09:45:09 -0500
From: Nishanth Menon <nm@ti.com>
To: Ross Burton <ross.burton@arm.com>, Eric Biggers <ebiggers@google.com>,
        Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
        =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry
 Baryshkov <lumag@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson
	<bjorn.andersson@oss.qualcomm.com>,
        Will Deacon <will@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>, Nishanth Menon <nm@ti.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: defconfig: Enable TPIC2810 GPIO expander
Date: Fri, 2 May 2025 09:45:08 -0500
Message-ID: <174619710366.3123420.14786223653329895426.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250421143926.2009535-1-nm@ti.com>
References: <20250421143926.2009535-1-nm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_074522_011586_C8FB039F 
X-CRM114-Status: GOOD (  13.19  )
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

Hi Nishanth Menon,

On Mon, 21 Apr 2025 09:39:26 -0500, Nishanth Menon wrote:
> AM642-SK uses TPIC2810 I2C GPIO expander for LEDs.
> 
> 

I have applied the following to branch ti-k3-config-next on [1].
Thank you!

[1/1] arm64: defconfig: Enable TPIC2810 GPIO expander
      commit: 42cfb00c919e5951ba5c4067a058c7e2cf2ccbc0

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
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


