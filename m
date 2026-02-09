Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9C4E81BC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 13:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TyHXhjhKIZ4jF+IssHH0ukgke8PH/IJg9cisxhd+Myo=; b=R9pGtJmI05JwUYR3WgTFgIgk4B
	fpQlBa7hfHVkrUSYpzJ+/mBxN8v7CYDU2ZObuOqdLlhE+U5mmbF7JMhtLgb1+hrDatN3yEuyyTcPY
	o+3x4pt72pHp43Sy3WFY+rY9ck0yh8qLcYvV4xwX/VUvax7XEmgEYkQzCYEUOQw7XnZiLNl68TrQ1
	zyTHn6GnmSAUeTtPxzFhcW5xQKMYWU8bB34QNLaB182lSzTG4KuYdHjnRmrbZuXoLRFGE7b86skZb
	L+4BQnHwSoXG4ROd4UnU6sbYtQR9BJi/I5GJljN1VTj8/y26rqO/M6E4VeROqe3hVDhua7F/FgjdZ
	m7HglTOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRJR-0000000FROT-1qAz;
	Mon, 09 Feb 2026 13:28:25 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpRJO-0000000FRO9-29fm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 13:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1770643703; x=1802179703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TyHXhjhKIZ4jF+IssHH0ukgke8PH/IJg9cisxhd+Myo=;
  b=fGgrvZoTluMcgUv2X45QHQx2IsrjN2GtTQ1ozt3AC5vzn/A30GVPCYbi
   6006Z38ANka7FXbenwIK09reSCX4ZHPeFw9Y8lnf8vo8+LvvOADi9Pjr4
   DaJwtYYjl2iJGFMtpbJnZl3OLolI1Y7f4bic4VLjRx+TYYaNwGBbSPG0Z
   dEm8mBfE2sYF99XT+VOpBzOkOuVYDt18Mw1o/wJ0x2TCJn8LC5b9iFqo4
   sKXYOADDRaUgcJVtxoeHdjo9UO/EUSPAsZeZ5UIfHj05bDqHcFAeLko19
   5JGzGdDqZvuOSox3ZwnraXUWdLnYo4mQTmpSSK5ctSz5r+MP3kBOPnReq
   g==;
X-CSE-ConnectionGUID: 62xkbNDBQQ69o78CWVJMmA==
X-CSE-MsgGUID: hsKOhGa8SmOnAx65M7ZSKw==
X-IronPort-AV: E=Sophos;i="6.21,282,1763449200"; 
   d="scan'208";a="53132515"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Feb 2026 06:28:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 9 Feb 2026 06:27:41 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 9 Feb 2026 06:27:35 -0700
Date: Mon, 9 Feb 2026 14:27:34 +0100
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
Subject: Re: [PATCH v5 11/11] arm64: dts: microchip: add EV23X71A board
Message-ID: <20260209132734.i2yx3b3qjbeqd43t@DEN-DL-M70577>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
 <20260115114021.111324-12-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260115114021.111324-12-robert.marko@sartura.hr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_052822_578697_05060C07 
X-CRM114-Status: UNSURE (   5.74  )
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

Hi Robert,

Tested on EV23X71A.

Thanks!

> Microchip EV23X71A is an LAN9696 based evaluation board.

Acked-by: Daniel Machon <daniel.machon@microchip.com>
Tested-by: Daniel Machon <daniel.machon@microchip.com>

