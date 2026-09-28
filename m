Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE51CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zaTS6uB4WcyniVZOVP3q4q82V5du32H4HaFf+Tc2HJA=; b=YDQ4xYnPgvR34VX5DlUh+eg/Ph
	y6rZJxq39zm4lLx75PWjcwfDLoOt/3mEFiIa/JcqzXIL5YHIxC739xb1CTwYjHcATUDu3Bn2tLZ7b
	zU2l1xVWt4EV5AiI1OeQcygmaAefbiFc0T9JGh6w9nntlSt8trKCTvkzGWIzT+RaEjyqnrE9ZwCHj
	N3uEqCMaYwITZM7NqDE1nZpYUA624nhnzyNjIamoWC/2i3b8SwHgZPubjl/KVBC2OtVUWFA45Fh9U
	nXcwNOeIFkFhbVvj+IekdZULxxg/u0OvQQ/ni8j5iVwkzUmbcyjBlqYHJ7YSNkALBLQrC9zTv7Ywg
	ACReJkRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9P7-00000000R2J-3dKH;
	Mon, 28 Sep 2026 11:20:17 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9P5-00000000R1o-1ScW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:20:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790594420; x=1822130420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=eVKVz8zyU/xkTeKcO8zjXPp4Q0x6ugEWp8ba6melv2o=;
  b=tub8NfbyTgyJZQwGE30zLMS/3P5O8ZDE5+uGJpJsnUfKFc2GC9Rs+73W
   8Rd9w+PANSCcXD6mLEeTlDu0fp2hRwbk+2mPOOJrMKPSXxD/J8S0UmSau
   RZYfpY6Rfqam6Mrm3FIL7378I4NiJ04cEc9f1gIOcV831QQZ7RddblB/y
   gHgGtJmveLBXabLI9+vajcvIfCBYhhzJpNctWRAEhBQ07ToCBZQxAF1yO
   /DFj7k0FPySNSVUQKlISfbCSmHKTQ6v6S7tEgmog2q1A2EyGdcMZTNtGN
   DB7IEoy9fTX4UDdEwniCD/t3MlV5mZZONrmvBvSaJza2hH99/r3TT4l9m
   g==;
X-CSE-ConnectionGUID: Rcqqv1qZS4SmX2CMsJEirg==
X-CSE-MsgGUID: dGnnbf+FQx6LrQWEDpPxLA==
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="63313098"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 28 Sep 2026 04:20:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 28 Sep 2026 04:20:13 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 28 Sep 2026 04:20:04 -0700
Date: Mon, 28 Sep 2026 13:20:00 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Quentin Freimanis <quentin@q-lab.dev>
CC: <netdev@vger.kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Bjarni Jonasson
	<bjarni.jonasson@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: sparx5: make ports inherit the switch base mac
 address type
Message-ID: <20260928112000.uzvaqkbaapiyjd2v@DEN-DL-M70577>
References: <20260928045012.30178-1-quentin@q-lab.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260928045012.30178-1-quentin@q-lab.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_042015_459088_3B50950C 
X-CRM114-Status: GOOD (  10.52  )
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

> When the switch uses a random base MAC address it does not mark each
> port's address as random:
> 
>   $ dmesg | grep "MAC addr"
>   sparx5-switch e00c0000.switch: MAC addr was not set, use random MAC
>   $ cat /sys/class/net/eth0/addr_assign_type
>   0
> 
> 0 is NET_ADDR_PERM, so userspace thinks this is a stable address. Fix by
> tracking the base MAC address assign type in the sparx5 struct and
> applying it to each port's netdev.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Quentin Freimanis <quentin@q-lab.dev>

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

