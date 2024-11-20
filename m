Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B2CD63926
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke+Y0bo9D4LeEuck6JKB2/v3763RWlIAJVKqP9ToUtQ=; b=gopq+nfE+T9jJ78ltzMbPaxEtN
	gNz5uMH8HODtXU21xbprdUMwPetY2rPgAVMzYNKgmcFMZNKCYCAKEanbMsgJL3tGDPg23MChKMax5
	BdjV/dNFa+Kh00egkoIKVgoLG68nWITj4K6X1hrNFIfFX1Q34GUM+JDxAUuecQxhAbHSU6qx4EB63
	zKTukKjChJw4nPqzg/uw0GCY906hnow55Zq8+MwmM7x2CZ9tjCGXTk6w37qMFkxB4Fc6lPbcdO8vV
	usbIxmJ+M97b2wUtXdqDbKYabf6avYgvC7mppt6N6hHG8krX6Dz1gA2befRnwpUwNT6bXZ/t+ZZJb
	3Vkis5AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiKY-0000000F6R6-3ydb;
	Wed, 20 Nov 2024 10:53:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDiJc-0000000F6Gz-30Lh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 10:52:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1732099929; x=1763635929;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DQRkqPQ7KKWFWhiQ+UDyS/VSm50G31LKA/NUgqhkKDs=;
  b=RXiT/1QOo6YETgSpgN+tmGfv/YjTGRwFMj8nTAkFoQegSEmsGznkGQd+
   N25JHDdbcEsh2zcZIGgHASFwlwguETMfFQJNzmd2qK7Xk1qFqCaO+8WTA
   LVaWnJZ39zKz6J+yFz1UNbLmAC8kOWLxJjO9A1PfdbA8SOf2Na2TkLKVp
   LTeft0NpcfX0Sz4iF1FS59Y8fyFaS7x0kK4XjQJU1enWN+HEa/NSu0zwV
   M/hYk2sGDZiPxchjwWCuqmhx7pqrSSaMHne5aJcSj+aMJRStRc7AOROvd
   hUvxMZNzIezU8ai/tv+d0SYAIzddUy4Bcq1JpA47D+REgTHbOKLupUVt3
   Q==;
X-CSE-ConnectionGUID: JrZ1f6mESWimvMFQPOoHiw==
X-CSE-MsgGUID: XgJw+zkXQ5Sthtr9YnRH0g==
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="265717816"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 20 Nov 2024 03:52:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Nov 2024 03:52:05 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 20 Nov 2024 03:52:02 -0700
Date: Wed, 20 Nov 2024 10:52:02 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Lars Povlsen <lars.povlsen@microchip.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, Andrew Lunn
	<andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, <linux-arm-kernel@lists.infradead.org>,
	<netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND PATCH] net: microchip: vcap: Add typegroup table
 terminators in kunit tests
Message-ID: <20241120105202.cvmhyfzvaz6bdkfd@DEN-DL-M70577>
References: <20241119213202.2884639-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241119213202.2884639-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_025208_755754_846801F6 
X-CRM114-Status: GOOD (  11.65  )
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

Hi Guenter,

> Comments in the code state that "A typegroup table ends with an all-zero
> terminator". Add the missing terminators.
> 
> Some of the typegroups did have a terminator of ".offset = 0, .width = 0,
> .value = 0,". Replace those terminators with "{ }" (no trailing ',') for
> consistency and to excplicitly state "this is a terminator".
> 
> Fixes: 67d637516fa9 ("net: microchip: sparx5: Adding KUNIT test for the VCAP API")
> Cc: Steen Hegelund <steen.hegelund@microchip.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> resend: forgot to copy netdev@.

You are missing the target tree in the subject - in this case it should be
'net'

Apart from that, I think the fix looks correct. In the drivers utilizing the VCAP
API, all the typegroups are "{ }" terminated - also with no trailing ','.

Thanks for fixing this!

/Daniel

Reviewed-by: Daniel Machon <daniel.machon@microchip.com> 

