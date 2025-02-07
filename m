Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D068C02192
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 03:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KyZCs8qd3314ZlqPy/AmtZCpaiNemEYjj2AFav3eno=; b=k2IOtPoq2sJuj70D62ZO0L4el2
	xkzIK7v/N+mTEZkblpi6LQ9MQ6CPxnW+cSuKqWEDCllis0VcJava7jgSDgLAlppxiqHql6Lyx5Pq1
	IBahdY+QQwYXzkoSoZxD/YDM+LTM022MTV84/y1CKbz5azYfD1z0UmmRTlUQt9WseTdplTcWxQ+ma
	65+x3vC6mJAnSWKO3ew1RAMMR3KXHT8vVykG8N2km6hVlggjEKC4yDNr/mPr6wt8cNQWbEd8iV8t7
	UTA2uHQdByqV+3IBPJFY7LqQFKv+6MlefZQqL+Vs55YRq0ifaXE+5aHm12GgCudREjMYXzDywOTgJ
	D23MiR6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgFQK-00000008FPB-0hxB;
	Fri, 07 Feb 2025 03:53:00 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgFOw-00000008FIA-0bmL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 03:51:35 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5173pE5e2855441
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 21:51:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738900274;
	bh=7KyZCs8qd3314ZlqPy/AmtZCpaiNemEYjj2AFav3eno=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L/yjsi1bFWzokw220ffjHZa5zgitVMKp3w2YJQgnDnKRTIusfFEPN79Y6sBKNvsSB
	 S1JzeQxbfZxAQX6NUBOoTAC+VLwgqzKFM3d4DqVxbUlI2vwznmZP5CyxiWITRHO6h1
	 mfjKTxOiXd/ugcxQ74YDVGKskZVt4K17pYPg4YgY=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5173pE9c084941
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2025 21:51:14 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Feb 2025 21:51:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Feb 2025 21:51:13 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5173pDYf011862;
	Thu, 6 Feb 2025 21:51:13 -0600
From: Nishanth Menon <nm@ti.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <quic_bjorande@quicinc.com>,
        <geert+renesas@glider.be>, <krzysztof.kozlowski@linaro.org>,
        <dmitry.baryshkov@linaro.org>, <arnd@arndb.de>,
        <nfraprado@collabora.com>, <ebiggers@google.com>, <ardb@kernel.org>,
        <vigneshr@ti.com>, Vaishnav Achath
	<vaishnav.a@ti.com>
CC: Nishanth Menon <nm@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <nfrayer@baylibre.com>,
        <glaroque@baylibre.com>, <tglx@linutronix.de>, <u-kumar1@ti.com>,
        <geert@linux-m68k.org>, <d-gole@ti.com>
Subject: Re: [PATCH v3] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
Date: Thu, 6 Feb 2025 21:51:06 -0600
Message-ID: <173890018688.4924.16249045892209116945.b4-ty@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250205062229.3869081-1-vaishnav.a@ti.com>
References: <20250205062229.3869081-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_195134_272933_643FACCA 
X-CRM114-Status: UNSURE (   6.97  )
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


On Wed, 05 Feb 2025 11:52:29 +0530, Vaishnav Achath wrote:
> Enable TISCI Interrupt Router and Interrupt Aggregator drivers.
> These IPs are found in all TI K3 SoCs like J721E, AM62X and is required
> for core functionality like DMA, GPIO Interrupts which is necessary
> during boot, thus make them built-in.
> 
> bloat-o-meter summary on vmlinux:
> 	add/remove: 460/1 grow/shrink: 4/0 up/down: 162483/-8 (162475)
> 	...
> 	Total: Before=31615984, After=31778459, chg +0.51%
> 
> [...]

Applied, thanks!

[1/1] arm64: defconfig: Enable TISCI Interrupt Router and Aggregator
      commit: c7691aec5e991cec9c5c5fdab08c24856a1fc56f

Best regards,
-- 
Nishanth Menon <nm@ti.com>

