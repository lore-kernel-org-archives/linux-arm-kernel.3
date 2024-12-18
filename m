Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4366AE77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0M5yzmodrb6QvRu0lmn5F0ReljCcDYnE5jjY1Dj680=; b=AzipAEVU1zhih2omjKfjihQ8WU
	+yUQmXW9DFhC+dbIPZSK3g95E6feLQ3wQ0ucv9v2a+YADTLIOS/57RNT379M5Gds5KU7abSo8UiH0
	LsbY7R8qaaFmOJzxvMmvIPU4UEkPbJbUaRw3VhVcWvFH7otWiEPOY+Ye9L+gW8uHKcgbLLKY/Q8xx
	huIP+UmtD61KKGJv3rNgIGH6M0kMi9asDz6CYQbjOZdg0mp5KhXIEuJQ/cio3Kj6nQuEH1YwgHwDM
	4lWIvqVjTHcyfJUk5pgZzp/9VRHJqQp17x0Pqruwe1ENYcfy2x+zbamit2u66Ox1f+J/hEl57nveM
	k5OdQGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv8q-0000000GriH-3LG0;
	Wed, 18 Dec 2024 14:35:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNv7k-0000000GrV9-2mpo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 14:34:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734532444; x=1766068444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x+ouAiKcuBQkZ/37Owdf/1ycla1yjKbXs8ztdlKCfj8=;
  b=SsLYOuM2k38qrBofRrBG6L/rRm/Qv02MK8XbhfJQaXgcJxDtxgTY2hG8
   kA2aRiWtPdsHeB8MkoZHmycMiZCdfuG9eqIIIkvg5eOp9jObs+0AvEFuA
   SfKURJSBZDFCRfxny1pnQoZlhs3qw8XQpfFFMaAHMJY/ptjFRH6aPlsp6
   5iZBUaPsfVkJeQGHwyIt/ln/60uDESQ/TB3sCrs8UYFWzhsgePzbVD6WR
   wKzelncHAlhQYXax8Jl/xKjqpk2P0EPtkFFncNEs9xVa7368KdDdRYzac
   TVyylMFbbFc2Nuc1SFrL+zcmWBpW1CWR6iPvADqxuBJKwgdwvCIBoZ6Av
   g==;
X-CSE-ConnectionGUID: 7sKZ6qhWRXCBO0C3T4e5BA==
X-CSE-MsgGUID: FGgQ9ZKBQfCEZLpy9D4ImA==
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; 
   d="scan'208";a="266920911"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 18 Dec 2024 07:34:03 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 18 Dec 2024 07:33:57 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 18 Dec 2024 07:33:54 -0700
Date: Wed, 18 Dec 2024 14:33:54 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: <UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "Lars
 Povlsen" <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, Horatiu Vultur
	<horatiu.vultur@microchip.com>, Russell King <linux@armlinux.org.uk>,
	<jacob.e.keller@intel.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>
CC: <devicetree@vger.kernel.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<robert.marko@sartura.hr>
Subject: Re: [PATCH net-next v4 0/9] net: lan969x: add RGMII support
Message-ID: <20241218143354.eh6iinemupxncblj@DEN-DL-M70577>
References: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241213-sparx5-lan969x-switch-driver-4-v4-0-d1a72c9c4714@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_063404_915320_1BD3D142 
X-CRM114-Status: UNSURE (   8.07  )
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

I would like to defer the pontential removal of sparx5_port_verify_speed()
function to a separate series (see comments on patch 6/9).  Any chance for a
maintainer to give the OK for that? I would like to give this series another
spin before net-next closes. No changes in next version - except adding TB and
RB tags.

/Daniel 

