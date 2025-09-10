Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0CCCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1Ebb9w5fqBtupSY4zV28bUMBIdK5LzwZ4K+oC1XGvY=; b=HO8k0XY2mRADuNA3+aC710pueM
	95QMQeg2Ck+kK/T8FttpiYzxMZ5WlYLk4NVdLZVA23dsZPlPQ2jo0TPQVwCwQVXM5Zb/GmL9vJDXB
	YQa5abTNciuEJH3DHSazX8QRBvhhSp8JnNjMPxG7K82vJJLVZ5B+E/xLXYGvyePqlIPJ/rWL8ZM3h
	81lWkaEMycTdu35mVhqm+DX4KofF8/b005PauCXwF7IYeMKxbxVEk9JXLvmoebBIDJxl1X3vRHkFa
	SrAPEucoCmNrufQA8lrFNlMSaf3QeJJQ5Q5+PwcKMNSDR091/Bkfcq1Ie2feQ7Ecjk4fXyrsm3O6t
	Asb7xdwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIyL-0000000DodN-2Qop;
	Wed, 10 Sep 2025 11:26:45 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwIyJ-0000000Doc3-0nJO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 11:26:44 +0000
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58ABQe0v048886;
	Wed, 10 Sep 2025 06:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1757503600;
	bh=l1Ebb9w5fqBtupSY4zV28bUMBIdK5LzwZ4K+oC1XGvY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Fjflndpgss9fCb2kIKVOChniUOXQR6GVokG1+NxmFYY4hTlb2Th+bJfgJQFlk7osn
	 xsqPwm02pK6L/CLUIn2G3b/ErsYMNYzSBtzLKXeks1rBdxaPrNKgrEUf/QcfKWaaO1
	 ljmQQo2icD539ysEj0bqaORZMRJGR4cNhRc14UiM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58ABQdCt331890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 10 Sep 2025 06:26:39 -0500
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 10
 Sep 2025 06:26:39 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 10 Sep 2025 06:26:39 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58ABQc7u402547;
	Wed, 10 Sep 2025 06:26:38 -0500
Date: Wed, 10 Sep 2025 16:56:37 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Akashdeep Kaur <a-kaur@ti.com>
CC: <praneeth@ti.com>, <nm@ti.com>, <afd@ti.com>, <vigneshr@ti.com>,
        <d-gole@ti.com>, <u-kumar1@ti.com>, <sebin.francis@ti.com>,
        <k-willis@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <vishalm@ti.com>, <s-vadapalli@ti.com>
Subject: Re: [PATCH v6 2/4] arm64: dts: ti: k3-am62x-sk-common: Remove the
 unused cfg in USB1_DRVVBUS
Message-ID: <1cae6fe7-2d14-420d-ace4-54124206a0d8@ti.com>
References: <20250909044108.2541534-1-a-kaur@ti.com>
 <20250909044108.2541534-3-a-kaur@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250909044108.2541534-3-a-kaur@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_042643_272333_0A096DEA 
X-CRM114-Status: GOOD (  13.14  )
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

On Tue, Sep 09, 2025 at 10:11:06AM +0530, Akashdeep Kaur wrote:
> After the SoC has entered the DeepSleep low power mode, USB1 can be
> used to wakeup the SoC based on USB events triggered by USB devices.
> This requires that the pin corresponding to the Type-A connector
> remains pulled up even after the SoC has entered the DeepSleep low power
> mode.
> For that, either DeepSleep pullup configuration can be selected or the pin
> can have the same configuration that it had when SoC was in active mode.
> Remove the unnecessary DeepSleep state configuration from USB1_DRVBUS pin,
> as the DeepSleep control bit is not set and the active configuration is
> sufficient to keep the pin pulled up. This simplifies the setup and removes
> redundant configuration.
> 
> This reverts commit 527f884d2d94981016e181dcbd4c4b5bf597c0ad.
> 
> Tested-by: Kendall Willis <k-willis@ti.com>
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Signed-off-by: Akashdeep Kaur <a-kaur@ti.com>

Acked-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

