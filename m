Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7C5EC145E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtZl4GKtGgoXKB3Ht+zrsFdv8HOLRY0L6GMQM5yR7QM=; b=CYVuhb/10bvY9qg8fU7jzc2Qp4
	NMuBQ3cokcPMGBb2amG62nTekw8+gjvinFy6x48BM8N9lAj/W9lsTz6YutLzn/wqurDnW/3gnahkD
	ZRV4xuCuucvt8GKx4RNYZpM8V37SnBHCOzoSL14JqeRN7tCNf1OslAPiTjipi9RUru4bfjarahIh0
	QAuD6UwkGJZwppWkXVQOpr5L8mo9pDpovPluvI6bjUg1BgrW5qEyxC/ema4pxmwokccYSnshV5OF6
	UiftPstOZudOPilKcQljLpySvJThG6AbGOwHLuBixc1nezqu9qbEkOS22xKTOIT2+QO17zqNyC0Rs
	Xvcw3LGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQsp-0000000FL9p-2eEI;
	Tue, 03 Mar 2026 14:37:59 +0000
Received: from mx-relay90-hz2.antispameurope.com ([94.100.136.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQsm-0000000FL8o-2oP4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:37:58 +0000
ARC-Authentication-Results: i=1; mx-gate90-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=BtZl4GKtGgoXKB3Ht+zrsFdv8HOLRY0L6GMQM5yR7QM=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772548670;
 b=Yc2nRzkwlITttjn1KC8wV4drinUPKIUteDCfGJR7uLKtKo5cgAHmI7pge6gTPCJu2+b9GVdm
 /iVhkKamT6k03sdTT4lAWXeKg/GgqU9Yk4z5TUTsUOZIPOhArP0550QRmsHcfGrSc991hQGt3n2
 v28q4U5e/amiIoSWd6OiXvuovH37ddiMya1b/55HMTUYuBPoOp6JoQqODzoS96/WIh2QhNJCjbn
 FT2v+09yK67/0OWeOxhVmKsIdL/KtRRkF17Vb8k7PJ2bEoi/uIn2crEhgc6nnuT0CdtKo9eWZEv
 1orfvIwK7/xlhz4OcDQthER0EKUJEQc4pM3qI69GujDcQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772548670;
 b=W3xbbENrjcTNEvX/n1R0m4VWoEtw24rcGhl4SWzSQ4MsKymWWjBiPFCRQy8DAcpxTey/BeGs
 oOqvPuHsAuxlywa+ZWo4/Xa5hL/4AQsRLGcSJs38Wus3i7b1LaHAwJs1uobWLdQdfOXH3Dg93Zb
 MySRyjQhErnNPdY8b+dpjCHBBwxosO0WmjLMGmSZMFSOAqauApZbuRG2jZSpep/WpDqXjWnwcT3
 2wsMb41r5IIvPNnQMJEam3j0FrXy2PTwPSjjTCbvr2htdK7QYkvfGz0IXlv2DfyTgabkIy1Y97J
 Uak7eDHuFi5AtRHlIlAGGSCZlDF33YSUs4QStZhHev2JQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay90-hz2.antispameurope.com;
 Tue, 03 Mar 2026 15:37:50 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id DFBB7A4079E;
	Tue,  3 Mar 2026 15:37:40 +0100 (CET)
Message-ID: <113446c6-3b1c-457d-a29b-682cdc9e5577@ew.tq-group.com>
Date: Tue, 3 Mar 2026 15:37:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: TQMa6: modify for use in bootloaders
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260220143008.186851-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay90-hz2.antispameurope.com with 4fQJLF4WpFzX1Yg
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 9fd46e5f27eaa805456295327e3d5223
X-cloud-security: scantime:1.206
DKIM-Signature: a=rsa-sha256;
 bh=BtZl4GKtGgoXKB3Ht+zrsFdv8HOLRY0L6GMQM5yR7QM=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772548670; v=1;
 b=XF30V0zp8btvnn/filrhFOF82QZxubzajibzevz+w3fm6NGjykBT0gcpw6IwFVoH7fldU/8z
 Ujjlzk+uAJLBIPeNlA2n7s2/FG6035Qho3mhecz2lPr6sjDMR8sPpz6aUswDckFdw2dNYD4nxnk
 /DcFUwGmf6ajqezYsEh22GQAWTW0BU20t2OuyhQu1QKIYj0k8LDc0RCoJtPVilLKXfGNc2UQJm1
 JqOjFUxMiPvZoctYQDaYVHyRtgnIv0wWH44K2WeCQBV9K8sqJgtg4EVl8TS7UWt3sRcyRBEx/Ch
 hEGkXv2N+4HFkPdhzoMQXMx8DhUwMvwoG8qSASOBCKtJw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_063756_857382_F386C7A6 
X-CRM114-Status: GOOD (  13.46  )
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


Am 20.02.26 um 15:30 schrieb Max Merchel:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> Changes in v2:
> Improved commit messages for commits that add boot-phase properties.
> 
> Max Merchel (4):
>    ARM: dts: imx6qdl-tqma6: add missing labels
>    ARM: dts: imx6qdl: add boot phase properties
>    ARM: dts: imx6qdl-tqma6: add boot phase properties
>    ARM: dts: imx6qdl-mba6: add boot phase properties
> 
>   arch/arm/boot/dts/nxp/imx/imx6qdl-mba6.dtsi   | 12 ++++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 11 +++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  5 +++--
>   arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  6 ++++--
>   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi        |  6 ++++++
>   5 files changed, 36 insertions(+), 4 deletions(-)
> 

Any further feedback on this?

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


