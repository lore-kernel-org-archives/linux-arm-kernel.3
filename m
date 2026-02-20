Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12796C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 12:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8euMMd7ovn1uCyxnqZ+G2FrrL0KvzYCdQUy11Pfe3E=; b=39r8sbyQ9T/H34qjCRM8V5yelf
	2+/7HbhvTL/Qd6RMp5QCLKvbuKsCQlfub7/pxwIeWy+2RpVET0j5qvVdXX42HN0vFw4TyjJxk7u28
	OqKXror8dIJHiDD/JE7Xs8SKYrWGsiwXZK8sVv1WhVcozieXMT/aEAfrQc2A5VooN0+MyiKAYWHS4
	sUAke8pZZwk3v81D/ClpkgudDkqj7Do4AhMpRCiigtEDsQqtDpVlerjUfe7Ux1PVbZJ2ZyTSL09dP
	wRuQsPfv6ABl/as6DeZFGSI4Uqb5aW7SLr7vffEJiEu2szVRw47xiZ2FBPLjROSsTT/SzBlZcPwiW
	RbxTLtvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPLj-0000000ETRh-30zF;
	Fri, 20 Feb 2026 12:11:11 +0000
Received: from mx-relay10-hz2.antispameurope.com ([83.246.65.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtPLe-0000000ETRI-1DYR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 12:11:09 +0000
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Y8euMMd7ovn1uCyxnqZ+G2FrrL0KvzYCdQUy11Pfe3E=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771589449;
 b=GEc7lMyovXqBEL7sewWkF30gkXjVLZMMXm/u9zs1qSdh7xe1GEhhVq+Y++ag9tUY/+R/tfoT
 urnaQaK5bxW7JV0+RcbQ8GxE8YnXK6QV2v+XA9L39W5DVhwTHrQmqLikIwiFelKi8oNDz0XPRXR
 Hi+96KPB+0iZiw0kDmmnTELGgqrjyzzF+yyLb1eu446nJV6Mdpv5tt6VItuHyQh65x27Jvd0HOb
 wwvhCpkfapkJXC1TDxJJcfUzD1WFfnY1aravFkFz1ROj00ohb/4nDBx7fEVrdLcT7Zr5wX0M/N2
 kIywXlULxeLz5FQ9Xzbm8lIJjP0UOfWU0TXOausZMSVUw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771589449;
 b=aX7RcqWvOkFim9NtD0R05nya7VW3JKQPcCSNzTemW/u/tZc+q+XjGntubd+cER+COwxsUJ2g
 ibuusDks70hLPK1UsVImrVa15E/itxA7Rl5oogeCcintKxtHV/B3qXhjN9UvHzVO0qL/bvEN2Vq
 +jZphCnaPTHkN81SRERNxDuyWIAgbX4mQlfO62qDHyqttnQx8gMRLw/ymgrgu/8jXhkPSLFH5Rn
 2AEIWZ2U/la8YUpseAShFOTPCTmBGKJhij+j++imq1l94/YBSDAVyePPBG7PEk3OMg0Ln9cEj85
 K7F8R4pR9MP6QrozXQOD3aKWxm7mZrH1GzKKgvax1NFdg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Fri, 20 Feb 2026 13:10:48 +0100
Received: from [10.123.75.134] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: max.merchel@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id ADD93CC0CB6;
	Fri, 20 Feb 2026 13:10:23 +0100 (CET)
Message-ID: <be39b302-a29b-4dcd-a3f1-1f3781476951@ew.tq-group.com>
Date: Fri, 20 Feb 2026 13:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: imx6ul/imx6ull: add boot phase properties
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux@ew.tq-group.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <20260218132339.32157-2-Max.Merchel@ew.tq-group.com>
 <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Content-Language: en-US
From: Max Merchel <max.merchel@ew.tq-group.com>
In-Reply-To: <CAOMZO5B5k_i_q4cd7SMNAkicF4WfEYNVUSrg8AamQHNpGys5mA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: max.merchel@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: max.merchel@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4fHTbN2hRzz4FJRR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: ecebb1631c20b4aa5b2d1e856db1193a
X-cloud-security: scantime:5.080
DKIM-Signature: a=rsa-sha256;
 bh=Y8euMMd7ovn1uCyxnqZ+G2FrrL0KvzYCdQUy11Pfe3E=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771589448; v=1;
 b=o3jxS/aqas1SLTgPk5280q81Oxaw0OCPtNpwuSZkovlRkBgxFRXi0EQ+k7MLyY5IV/81wIhc
 B7fQzXWcA2xqhWbMNGjsyniIuILLq1IN/mMWv2gMKbCKWz/s/VIH7ydT3IpjcxEHD8ZQxf37Xem
 dkUUUG3qWMOLcXy6G/3JX9hWxK9tqa+wNrng7/cRSg+ANp+M1WUCuTYtFqeouxRSQ7/hH6LlxlI
 4WqOgEVbob5pG8fM0p9UrDHHOD5MO2A3nogxRTf14xqjO0KTNpxb9eMZ02vOGfNj49cx8UdZXNB
 NmWe1xjND9fyPEjcEoQT5OOeFgNvEPHzVHkbJ1xMA0NNQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_041106_615372_306E6D5C 
X-CRM114-Status: GOOD (  13.03  )
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



Am 18.02.26 um 19:14 schrieb Fabio Estevam:
> Hi Max,
> 
> On Wed, Feb 18, 2026 at 10:24 AM Max Merchel
> <Max.Merchel@ew.tq-group.com> wrote:
>>
>> Add boot phase properties from U-Boot device tree.
> 
> The commit logs of this series could be improved. Please take a look
> at these examples:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.19&id=256feb5be482315a91c1bd1a1808276f57ef76dd
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v6.19&id=2285ea3f8065f47a6a1b62e6fcfa85105c8c261b

Hi Fabio,

I can add sentences to the commits, including the properties, for example:

dtschema/schemas/bootph.yaml describe various node usage during
boot phases with DT.

All SoCs require buses (aips and spba), clock, iomuxc and SOC access 
during boot process.


-- 
Best regards,
Max

TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


