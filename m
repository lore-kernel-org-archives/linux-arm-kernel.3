Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7D6CAC586
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HViEJAJtIasUDMxy95AazLJM2TcmtxxJAuZu2hzNvWY=; b=4HvaeEuZFJHMroz81eaiaHxFtt
	OPdVn3JtgbWjLMjlKC34a3QEfM0uCqHy6376cs+HbVtsCpdLvm+PLmEYv6J2fJoRLXNnK9mw8WGHu
	EHS7toQi+ur9cY7l1oHH6DvAFl77BcZwuSI9uQjoZi787jf4CHf/jWRsm2Zyge0pFOdZO5TQsW+OH
	oaVx/A92/LaRUCEzWPZXRaKQ8XlLGeMO3X5hvm8DHhqdGzYEMDlPIkdEcUy/HleJdN/yg2eUR3E2A
	BdxA2aiM5cmBr8WSvp60dy3UlapDukxzJ/Fntjb2mcYHtieO2WbjkAtRev6m83bz9UXBcRXevjOSB
	x69433qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabd-0000000GqA6-2af8;
	Mon, 08 Sep 2025 12:04:21 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYJy-0000000G5Xx-0uss
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 09:37:59 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5889bruo3765935;
	Mon, 8 Sep 2025 04:37:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757324274;
	bh=HViEJAJtIasUDMxy95AazLJM2TcmtxxJAuZu2hzNvWY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=MYXV/gWpLq85Jc6hXNCxwhhqMuUjRqO1z2laLlj51kRCP5mmiRIIWU0pmYfm0imz6
	 nhjZBMrJUptMKKFpi+V2cbfpokqEPsS6KWePEYRhLzEsR5hZaWxg4Ik1NmdyA1LpB2
	 5itliTHgQanayE3l5hdnesW/tWFyJRz8Aq5JyKxI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5889brL22871363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 8 Sep 2025 04:37:53 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 8
 Sep 2025 04:37:53 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 8 Sep 2025 04:37:53 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5889bqgJ386168;
	Mon, 8 Sep 2025 04:37:52 -0500
Date: Mon, 8 Sep 2025 15:07:51 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Beleswar Padhi <b-padhi@ti.com>
CC: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <afd@ti.com>,
        <u-kumar1@ti.com>, <hnagalla@ti.com>, <jm@ti.com>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Wadim
 Egorov <w.egorov@phytec.de>
Subject: Re: [PATCH v3 30/33] arm64: dts: ti: k3-am62-ti-ipc-firmware:
 Refactor IPC cfg into new dtsi
Message-ID: <20250908093751.2chmawizotlo3gm6@lcpd911>
References: <20250905051846.1189612-1-b-padhi@ti.com>
 <20250905051846.1189612-31-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250905051846.1189612-31-b-padhi@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_023758_344281_ADFF1AB7 
X-CRM114-Status: GOOD (  13.61  )
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

On Sep 05, 2025 at 10:48:43 +0530, Beleswar Padhi wrote:
> The TI K3 AM62 SoCs have multiple programmable remote processors like
> R5F, M4F etc. The TI SDKs for AM62 SoCs offer sample firmwares which
> could be run on these cores to demonstrate an "echo" IPC test. Those
> firmware require certain memory carveouts to be reserved from system
> memory, timers to be reserved, and certain mailbox configurations for
> interrupt based messaging. These configurations could be different for a
> different firmware.
> 
> While DT is not meant for system configurations, at least refactor these
> configurations from board level DTS into a dtsi for now. This dtsi for
> TI IPC firmware is board-independent and can be applied to all boards
> from the same SoC Family. This gets rid of code duplication and allows
> more freedom for users developing custom firmware (or no firmware) to
> utilize system resources better; easily by swapping out this dtsi. To
> maintain backward compatibility, the dtsi is included in all boards.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> Reviewed-by: Wadim Egorov <w.egorov@phytec.de>
> Tested-by: Wadim Egorov <w.egorov@phytec.de> # phycore-am62x
> ---
[...]

Reviewed-by: Dhruva Gole <d-gole@ti.com>

-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated

