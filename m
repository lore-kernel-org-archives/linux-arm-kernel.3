Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4072CEDEBF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pF6V3B1qOpozco2GfEBhVD0JBZUNTaUDHRIurlyzIcE=; b=rChMdzaT5WQMTQEXCtlr/QoRS0
	brGADpoOvIVX3WHBYlIcYf6JiaUi4bHKMhgyU3VR+Xc/Dva/evkTBzZnTI16GjFpHUU/EeioelFEW
	bL/Qj4rA1jeOb8JTnQMp9Q4fHcAYKXbhWger/mjUYLVuaU9S2YKzYu6KR/p6fDILjEjJ1O94piRiA
	2lrQuFLKYEtrsO3rorrr4xkWltbRGmzlHHFTNK4mnZLNJwYXDGI5NAWHL1LNdCWeS+vCrxp9tjHGJ
	sPO2nP4CU8VNGOKwBjWtmtebT4oFonhQz/4kl2gFyjCBEIdJy/q0oOTlwcK38BlsLztwWBaUB2mBC
	vHBiFD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWDd-0000000Fu82-0RtJ;
	Tue, 03 Mar 2026 20:19:49 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWDb-0000000Fu7Q-0209
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=In-Reply-To:References:Subject:To:
	From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pF6V3B1qOpozco2GfEBhVD0JBZUNTaUDHRIurlyzIcE=; b=n1CNVCXEbTzgH8p0H2lMQsL+tC
	8dEHAF5YG21JDl7D80YMj9DZY9KFWy1AKJstoXtfsVi6584VUUq0RIZ2zmSQSdw8ajjbZEqKG1sHX
	1lvd/dFNNJ3yON2aCBTWNQe5AMpZeF6joZe5WTOzsanXr4R4GzvSW2ennRbAgURv6Rptx0WGGOwQ0
	4xClT5Z5Zh+yA05yT0x46u+10bfsIX41bMdikX5VzZR73mwiVrUeQzT/HokLIcwAM/2l2gC3zQ6yc
	RpGDWQ9zIozoHqnhy2/kgvdxOqlbzkR08kp840FrzxwqENVZkO5PQI40ONTHSFoRUFQHCF043UEMl
	k2M/8SAw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxWDS-0005V6-1a;
	Tue, 03 Mar 2026 21:19:38 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1vxWDR-0002Qu-24;
	Tue, 03 Mar 2026 21:19:37 +0100
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 20:19:35 +0000
Message-Id: <DGTFBXGJDU7C.3KAUWCSCGQFR2@folker-schwesinger.de>
Cc: "Rahul Navale" <rahul.navale@ifm.com>, <dmaengine@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <vkoul@kernel.org>, <Frank.Li@kernel.org>, <michal.simek@amd.com>,
 <suraj.gupta2@amd.com>, <thomas.gessler@brueckmann-gmbh.de>,
 <radhey.shyam.pandey@amd.com>, <tomi.valkeinen@ideasonboard.com>,
 <marex@nabladev.com>, <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
To: "Rahul Navale" <rahulnavale04@gmail.com>
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
X-Mailer: aerc 0.21.0-119-g0a449d4a7ff3
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260302072433.5091-1-rahulnavale04@gmail.com>
 <DGTF4AVSQZBJ.184UEIYAHWGMW@folker-schwesinger.de>
In-Reply-To: <DGTF4AVSQZBJ.184UEIYAHWGMW@folker-schwesinger.de>
X-Virus-Scanned: Clear (ClamAV 1.4.3/27929/Tue Mar  3 08:24:19 2026)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121947_043660_92A3591C 
X-CRM114-Status: GOOD (  11.54  )
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

On Tue Mar 3, 2026 at 9:09 PM CET, Folker Schwesinger wrote:
> So I think it's reasonable to assume that either (1) the change in
> return value of dma_get_slave_caps() causes different behaviour in the
> callers (possibly [2][3]; needs verification) or that (2) dma_slave_caps
> *caps, whose fields now get populated in dma_get_slave_caps() cause
> different behavior in downstream users of said caps.
>
> For the next debugging step I suggest that we focus on (2) but also on
> getting some insight into the callers. Could you please reapply
> 7e01511443c3, keep the RFC patch in place...

To quickly test theory (2), you could then comment out the caps->
assignments in dma_get_slave_caps() and check if this fixes your issue
or not.

<-->8-->

diff --git i/drivers/dma/dmaengine.c w/drivers/dma/dmaengine.c
index ca13cd39330b..91c5d7abb028 100644
--- i/drivers/dma/dmaengine.c
+++ w/drivers/dma/dmaengine.c
@@ -592,6 +592,7 @@ int dma_get_slave_caps(struct dma_chan *chan, struct dm=
a_slave_caps *caps)
 	if (!device->directions)
 		return -ENXIO;

+	/*
 	caps->src_addr_widths =3D device->src_addr_widths;
 	caps->dst_addr_widths =3D device->dst_addr_widths;
 	caps->directions =3D device->directions;
@@ -603,6 +604,7 @@ int dma_get_slave_caps(struct dma_chan *chan, struct dm=
a_slave_caps *caps)
 	caps->cmd_pause =3D !!device->device_pause;
 	caps->cmd_resume =3D !!device->device_resume;
 	caps->cmd_terminate =3D !!device->device_terminate_all;
+	*/

 	/*
 	 * DMA engine device might be configured with non-uniformly

<--8<-->

