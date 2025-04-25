Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1217C369D1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qd3ans2EkaBFSKx6PD7a98Rs0x5sNPpf7cnb9HK+FLY=; b=OrN0CUIWkyDNFdcn5F5qlUuPBf
	AePGeIvF7GH/53NDfIp9N+eyOD/S0zMRTaFslcmK6JqwuD4h8z75vXhTSEhvxklDraQce88ggJai5
	B+s9RfX2NmqspNJoW9YVEvuPbZ/hxn7MmBSDZ9UA+6sbZf+9H9125RmKkjO8idcIFjarBgB+plM9l
	QsSERSMo9THC4iUJvjtXPsO6gMIONczwtOdBNFoHlsqRyuj+46hHdxquE2f3g864VXnocbxZ/5ZGK
	6vtp2k2lQ1m5I4pK6QbGkGxdJSRqLZQrfNgrKiG98DzkL0P1QPnf16eRyINQ1dppnIS0GLq6hbCRY
	SY4biN7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IwS-0000000HFVh-3mND;
	Fri, 25 Apr 2025 13:18:08 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8I5K-0000000H7Bq-2ni6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:23:16 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PCN8SK2140246
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 07:23:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745583788;
	bh=qd3ans2EkaBFSKx6PD7a98Rs0x5sNPpf7cnb9HK+FLY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=LTX0wYqBk2O2QL+9ub+Nx4C8e9rQ+tTj1vmNvrDt/Mjg4srwkoXVoaI/iCOxbB9dW
	 i18HMg57N8kc30AJ5bYk6Z0rnTY6FX2apUMBJMtn+ZWusO6nCwnaMSSW3XnQHmCrEm
	 KP51QYUBeQU30x83PNAf5vxmBZZZQMgYMwdHnwWU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PCN8fE012517
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 07:23:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 07:23:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 07:23:08 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PCN7QR014264;
	Fri, 25 Apr 2025 07:23:07 -0500
Date: Fri, 25 Apr 2025 07:23:07 -0500
From: Bryan Brattlof <bb@ti.com>
To: Judith Mendez <jm@ti.com>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] Enable PWMs
Message-ID: <20250425122307.4o257gnwq52ctctv@bryanbrattlof.com>
X-PGP-Fingerprint: D3D1 77E4 0A38 DF4D 1853 FEEF 41B9 0D5D 71D5 6CE0
References: <20250422000851.4118545-1-jm@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20250422000851.4118545-1-jm@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_052314_791169_82E1FAEB 
X-CRM114-Status: GOOD (  10.02  )
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

On April 21, 2025 thus sayeth Judith Mendez:
> This patch series enables PWM signal outputs on am625 SK,
> am62 lp SK, am62a7 SK, and am62p5 SK boards.
> 
> For am625 SK and am62 lp SK, add pinmux, eCAP, and eHRPWM
> nodes in the k3-am62x-sk-common.dtsi so as to not duplicate
> nodes in the board files.
> 
> Judith Mendez (3):
>   arm64: dts: ti: k3-am62p5-sk: Enable PWM
>   arm64: dts: ti: k3-am62a7-sk: Enable PWM
>   arm64: dts: ti: k3-am625-sk: Enable PWM
> 
>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts       | 40 ++++++++++++++
>  arch/arm64/boot/dts/ti/k3-am62p5-sk.dts       | 54 +++++++++++++++++++
>  .../arm64/boot/dts/ti/k3-am62x-sk-common.dtsi | 40 ++++++++++++++
>  3 files changed, 134 insertions(+)
> 

Looks Good! Thanks Judith

Reviewed-by: Bryan Brattlof <bb@ti.com>

~Bryan

