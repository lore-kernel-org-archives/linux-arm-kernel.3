Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09A5CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 22:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qszVEd2EhaYW8OmOJGC6rnTOzggaCtkQFOIJf3q1+Ps=; b=HAtqpLubbk0Xi3L+UxUa42eSj8
	8R/P+IgZEDWrgpvIxbCx3AYPi7mkbxBuWPu0+hHADo+v5OxS34joBEvnl4LTUF5IU+6QkfbpV1qJP
	v4HDBqPseHY6oTXlV8SoWbilT95CfPOs8imTrCYNw6WpxjKO6/KS3ZIHIjAhdrHFvGRRs72nD/d1/
	AnC45atyqCTaVX9pzx6IjmPoiOoERENo630zF5A3PNZWk7z1BKjyetU+fFk1Vagf0YS+baZHDDUeU
	Kchy4mgSfCFMFSZDMXAS7yLUtfDI2pscXEcZE0ZCS/G+IBpMLfNUa7FBJGLDWxFcCYvPnNXwOdfl4
	t7exOWxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umKEo-0000000FBcH-3OtZ;
	Wed, 13 Aug 2025 22:46:30 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umGQt-0000000Ej4r-2tWq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 18:42:45 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57DIgTiZ2135662;
	Wed, 13 Aug 2025 13:42:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755110549;
	bh=qszVEd2EhaYW8OmOJGC6rnTOzggaCtkQFOIJf3q1+Ps=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=V4xn0GSuS7+ZpaLAJ4RtxHYRSx/+9PUTZvNos9KBTLeImQLktx2GgBOiUWznS+jXG
	 aQK2WgxeVFJTGepVuG/vTb5l6BOqRnh01AXrzIrtvrKxvB+//6HTg0pLWl5Wf/aWzN
	 xpEB3K+ntOA3PbAKitLWd4ZEx+3KKvS/OPHpnyIM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57DIgTpo261105
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 13 Aug 2025 13:42:29 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 13:42:29 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 13:42:29 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57DIgTcG2728072;
	Wed, 13 Aug 2025 13:42:29 -0500
Date: Wed, 13 Aug 2025 13:42:29 -0500
From: Nishanth Menon <nm@ti.com>
To: Randolph Sapp <rs@ti.com>
CC: <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <d-gole@ti.com>,
        <afd@ti.com>, <bb@ti.com>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <detheridge@ti.com>, <matt.coster@imgtec.com>,
        Michael Walle
	<mwalle@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: ti: k3-am62p-j722s: enable the bxs-4-64
Message-ID: <20250813184229.dhgpqvi3b6aat46g@managing>
References: <20250808232522.1296240-1-rs@ti.com>
 <20250808232522.1296240-2-rs@ti.com>
 <20250813151721.nc5fr3qmro5grlda@steam>
 <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DC1HS8D8KLIF.2MN7D9EXGQQ45@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_114243_770934_FCB1ABE9 
X-CRM114-Status: UNSURE (   7.47  )
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

On 12:56-20250813, Randolph Sapp wrote:
[...]

> >> +		reg = <0x00 0x0fd80000 0x00 0x80000>;
> >> +		clocks = <&k3_clks 237 1>;
> >> +		clock-names = "core";
> >> +		assigned-clocks = <&k3_clks 237 1>;
> >> +		assigned-clock-rates = <800000000>;

btw, as per https://www.ti.com/lit/ds/symlink/tda4aen-q1.pdf (page 86)
720MHz when vdd_core is 0.75v (default)
and 800MHz when vdd_core is 0.85v

0.85v is set in the board dts and higher OPPs are enabled depending on
board capability.

You might want to check the assigned-clock-rates based on data sheet,
default should'nt need a assigned-clock-rate.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource

