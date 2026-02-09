Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E47E81BC2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/JFFSSdXz21Xwy0PVHHauItjrrsvw406j0rnGBJUAk=; b=G+FU3FkTJujJmZ42MHaLElLawJ
	DFmccDUBCHDpUn2rNfRHsiJeIPd92ITdwKYpTScWBmw3xHaDvmNFBDJ6YEPbyb9NGmq/1AAhcsth3
	P4BwYnu1oqWDIrb9MDYC+OUxx349aSdn1TjMfy7s2RJzXQeQ5qRXKQMG2qoKwiuUOmKAoc0SUQXW8
	YxJpHCE1xV3dqUPtye2HIDcD5uvD7WGMatT2GbN7nhasEHjBhzLrdZLZYD+b8D7L2lsRDbda6pEFm
	CMqlU4MlOrg/KAC2McBpDBOrFhFXX3XqWSpcAbyarXPtGcJGlt4DUakWHagSTTbU2LQCocQthp9lc
	tRXdR0LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRGg-0000000FRB1-3HMK;
	Mon, 09 Feb 2026 13:25:34 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRGd-0000000FRAB-48tf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770643531; x=1802179531;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x/JFFSSdXz21Xwy0PVHHauItjrrsvw406j0rnGBJUAk=;
  b=d5oY8tj5H9z6UHCeg4iRp5aHMSiIXUHflES3/YkNlmZL6bsFZuyx3tvX
   Cz3RBM5Zf2uFUMr7ORUsl/nWzS8hVIKNpzJjyDzmbLXdVeQayrzBxM6sP
   8VusOyc4hR6idS64scCIs5bhmaUv/qmsme2x/rBxjXwXwv5JR6Iwj9rCS
   a+OJ8qifjLopCYCfxSfNIlVnhoBwnGV7kkuwQfxD+TB+TYV7+hBYqR8f/
   72MUTTY+8kZv8NTCUAX8IuvCFjTWpJ5sNp+knTIQ2St0V48/sg90rTAjI
   /U2OWn9x0jX4m5E74jIDtv/CxQFJXXbiBEg63udPP64GlMnFagnFPkA89
   g==;
X-CSE-ConnectionGUID: oP1LAc5MQFujvwkAhKJHHQ==
X-CSE-MsgGUID: IBJrM1wyRPKl5KcA381PqA==
X-IronPort-AV: E=Sophos;i="6.21,282,1763449200"; 
   d="scan'208";a="60392621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Feb 2026 06:25:28 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Feb 2026 06:24:58 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 9 Feb 2026 06:24:52 -0700
Date: Mon, 9 Feb 2026 14:24:52 +0100
From: Daniel Machon <daniel.machon@microchip.com>
To: Robert Marko <robert.marko@sartura.hr>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<nicolas.ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
	<claudiu.beznea@tuxon.dev>, <herbert@gondor.apana.org.au>,
	<davem@davemloft.net>, <lee@kernel.org>, <andrew+netdev@lunn.ch>,
	<edumazet@google.com>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<linusw@kernel.org>, <olivia@selenic.com>, <richard.genoud@bootlin.com>,
	<radu_nicolae.pirea@upb.ro>, <gregkh@linuxfoundation.org>,
	<richardcochran@gmail.com>, <horatiu.vultur@microchip.com>,
	<Ryan.Wanner@microchip.com>, <tudor.ambarus@linaro.org>,
	<kavyasree.kotagiri@microchip.com>, <lars.povlsen@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
	<netdev@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<linux-spi@vger.kernel.org>, <linux-serial@vger.kernel.org>,
	<luka.perkov@sartura.hr>
Subject: Re: [PATCH v5 08/11] arm64: dts: microchip: add LAN969x support
Message-ID: <20260209132452.avsmiidcyjcqys7j@DEN-DL-M70577>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-9-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260115114021.111324-9-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_052532_070286_3A17FA97 
X-CRM114-Status: UNSURE (   5.84  )
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

> Add support for Microchip LAN969x switch SoC series by adding the SoC DTSI.

Acked-by: Daniel Machon <daniel.machon@microchip.com>

