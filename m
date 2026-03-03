Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD8EC145F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zT632VR0gROFa3F9kvU2rdhPuRa8nKqiAx8K/kUtGPY=; b=uODMNylWQ8kHdCebPoEiiihLrd
	OeREZZhUF76InHxorVjXdsftzUZSgGt9NF88vsSFP6qIGlA0X2l5q3ccsxmP2g9uKxaQfBYxNSXw3
	v8NIoRzgxugGjTiejaPxmS1rkEM+v39wfzx1yLgYbJ7KtUekRkdzNmi/j50B8px4wFsjFi2wURQv/
	EF5bPmlT54K55MlyzfSTe2DmARu0GcMDVWQ5q2Xt5YVilVMAxs+QTyHmBcI1zFttkGjKKoc405MSI
	JSHYCO228Xq0I0KbYeBS6kNbC+gCh1Xa33xJBOKnZ3ObdlWZyi1H8BmyW3LRXQmwa1cn+/b6oyPfY
	1QHnjmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQt7-0000000FLEJ-22VD;
	Tue, 03 Mar 2026 14:38:17 +0000
Received: from mx-relay32-hz1.antispameurope.com ([94.100.133.208])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQt4-0000000FLCM-0JW2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 14:38:15 +0000
ARC-Authentication-Results: i=1; mx-gate32-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=zT632VR0gROFa3F9kvU2rdhPuRa8nKqiAx8K/kUtGPY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772548685;
 b=lAw3bYIxZe6oHsatO90ksG6YWiNRr0hVRfMcGogRxybuS0mGR/6+I4yLbIwSIsr5GFdQ9c9n
 Dw5s6hwBq/fym0548Zot/7MM5hEujSvCRDzfOUb7lrccraFOfEaY7zBwKL7tlRMEsjh0ZIN5LVO
 n+imf5ffWxBtmmrn7lgGWMsonAu5m2xm+9+cBtDtJFE39casekYV39v3i/aCTSM5ue11tnkRiDr
 tyuivqfX7GHqvDlVfVvHF8MOmOXOBgBsfiKp6v/Ea78ZC/O/e5arZ+f7KfpKbkAAMvlpb5JCC5U
 umWEAbIJ/QiGjLn1/rQ1Usmn6PylveH+iad5AWrGvEEyg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772548685;
 b=h4EEN/+o0gefEKzuApJCtSymr4yfER+Nl+oLoFBXIU2S2j/NnkkY96SHAbHNN5qV8Mdl6yez
 eQjkWjXQHI5mN5uT0qnvtsRjyt9V3dtnw3+9R65NBbHzLZ2RPmeWFzIdc3OTTYQh64lS3Vq01ZH
 qZD89F/McLNuzbFAoTnHDW1hOERZzTX0rD/iUQpcA5vkVOb1ffTf9zjprVcoye9wh0plB4gsFJa
 ShJgWgOGuTNd9iBuYJHcBb5WRlrbsxFjKLGojxCFOeLTI32PMQ8FyapQ5Q3PC16uezmJGcdMspN
 xNuGIJrXoq3FvIAc6itmW0PKiwhc5yq6wx3I8g36J6WhQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay32-hz1.antispameurope.com;
 Tue, 03 Mar 2026 15:38:05 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id A5C73CC0E07;
	Tue,  3 Mar 2026 15:37:53 +0100 (CET)
Message-ID: <ac506790-fbe4-4902-895a-a94822f11b39@ew.tq-group.com>
Date: Tue, 3 Mar 2026 15:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux@ew.tq-group.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <20260220143107.186956-1-Max.Merchel@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay32-hz1.antispameurope.com with 4fQJLV27Cgz9022
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: f0f40d72e89aaf42e08c864d0bda316f
X-cloud-security: scantime:1.450
DKIM-Signature: a=rsa-sha256;
 bh=zT632VR0gROFa3F9kvU2rdhPuRa8nKqiAx8K/kUtGPY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772548685; v=1;
 b=X1l++LJ/5zFzYbQwBZnN+9B144N8x96mSGIt+RfiI+ZO/zYaopTxLZL3CKFFvKHjgTY2+h6n
 o68Kx1m+fWA8dhsqlgyZ07p0m1ZU3XfMaiXVek4V05U9VQA8pqJNbg/ZcebzqQXo5VmLoA/u6Dx
 57srhI08EeETdvjr3wXmQ0ZDwOqXLxp70/7CPhufp1O6ewWjnglcZkVcvlPynDdXqyccuILpH7p
 Fj5T78tcv+j3xU9ejqrM75FnzqO7K9uHG08YZSt0UddxJzsn+tJE8uupYl/n7h625IvhCilpQLR
 h8oPiAe6ovmDOF3hhlFYi4Dwm09yZo9dFgu53uDuuf9Sw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_063814_331493_0CBEE24E 
X-CRM114-Status: GOOD (  14.22  )
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


Am 20.02.26 um 15:31 schrieb Max Merchel:
> This series contains modifications for using Linux device trees
> in bootloaders. Changes from U-Boot bootloader are incorporated
> directly into the Linux device trees.
> 
> Changes in v2:
> Improved commit messages for commits that add boot-phase properties.
> Add forgotten boot property for the spba-bus in imx6ul.dtsi.
> 
> Max Merchel (4):
>    ARM: dts: imx6ul/imx6ull: add boot phase properties
>    ARM: dts: imx6ul[l]-tqma6ul[l]: add boot phase properties
>    ARM: dts: mba6ulx: add boot phase properties
>    ARM: dts: tqma6ul[l]: correct spelling of TQ-Systems
> 
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul-common.dtsi   | 10 ++++++++++
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2.dtsi         |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l-mba6ulx.dts |  4 ++--
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ul2l.dtsi        |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulx-common.dtsi  |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul-tqma6ulxl-common.dtsi |  1 +
>   arch/arm/boot/dts/nxp/imx/imx6ul.dtsi                  |  7 +++++++
>   arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2.dtsi       |  1 +
>   .../boot/dts/nxp/imx/imx6ull-tqma6ull2l-mba6ulx.dts    |  2 +-
>   arch/arm/boot/dts/nxp/imx/imx6ull-tqma6ull2l.dtsi      |  3 ++-
>   arch/arm/boot/dts/nxp/imx/imx6ull.dtsi                 |  1 +
>   arch/arm/boot/dts/nxp/imx/mba6ulx.dtsi                 |  6 ++++++
>   12 files changed, 34 insertions(+), 4 deletions(-)
> 

Any further feedback on this?

-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


