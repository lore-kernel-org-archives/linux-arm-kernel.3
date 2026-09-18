Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB11BC982D2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 06:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBjsY1OtvUVEirV+LkhZEW2CPS1W9mE7vZyQAquK5g8=; b=if33rpFlJTxSHgfIlcvNz2Vw57
	gjeC+aReaK/Omtfqm7L9/O8x0JzrYTlm/yB3KXLsoMrLsEZIPncR094iseNrrRp0J4AMv959xjCWa
	Sz9Vhv+Lyrc4TLp3Y1JRw76FVkWxw4OG6kfuFcGTFGzPGBq4WOT4MzZpe6+bhDhkxR1zsqBAkrwTf
	F+G0IHPHs70GEumBJKGqUuQ84PeAyXdZfgwWHnoghoZH/TKqcwqf8z0kDzpdWZ+jwrNX3PCF7QVG2
	QrXgCbT2i77AxPZLBR1nvjA7/O3ue2clE524vOCNujWBTCWREk20vt/fQDYg/myHtNcEeJsbWJ6BC
	oQm0Y+0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SQp-0000000DcGb-2QXZ;
	Fri, 18 Sep 2026 06:50:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7SQn-0000000DcG7-1Ewb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 06:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1789714245; x=1821250245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lzO27TDxIULlI2uv8uwh01ObA3Ym1uCEMM5Rkpb91pQ=;
  b=rWBoqEXNr5cwPvC01gX1gNYsoAqmjMHfgcwq2y+cUyUWxm+f+qk3B0nw
   X/mHS2Z42G3CjRNOtuD+aVyD4akz2hs4M2w86mdEM5GDxmPlZXZXxLx9p
   zrEIOvDSsqDR4z/8TbCmtdL6V6ftxvt60FIcxhT5l3+J+HQvwLkFuTuoM
   NyTkCPI8PB966wTw1pCPLtJug6mbwUKAR3unjOIXEqIV6w+GZHayPPTE3
   xA2ZWaBKnjtIzZlIWKKJqxrENU9U5zYCKNSyUTcJdc3pbnRQgjwVg8oaP
   DJB91AOffSQPodtPNsodkmvk7QCkrUZumNQuQ3zFnLXFSLEnkFOOORNZD
   g==;
X-CSE-ConnectionGUID: NjezbUk0SYGudewq8HMiog==
X-CSE-MsgGUID: 1gxp3NzKSy++vdXcREIq4g==
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="73876652"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2026 23:50:41 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 17 Sep 2026 23:50:40 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 17 Sep 2026 23:50:37 -0700
Date: Fri, 18 Sep 2026 08:50:37 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>, Brendan Higgins
	<brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar
	<raemoar63@gmail.com>, <linux-kselftest@vger.kernel.org>,
	<kunit-dev@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] net: microchip: vcap: Stop selecting DEBUG_FS for
 KUnit tests
Message-ID: <20260918065037.bs2mcha2laf5efg7@DEN-DL-M70577.microsemi.net>
References: <20260917064736.77354-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260917064736.77354-1-kmehltretter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_235045_569380_DD6239EF 
X-CRM114-Status: GOOD (  17.37  )
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

> VCAP_KUNIT_TEST enables DEBUG_FS even when the kernel configuration
> leaves it disabled. Remove the selection, following the dependency rule
> in Documentation/dev-tools/kunit/style.rst.
> 
> The debugfs implementation and its tests are already built only with
> DEBUG_FS. The other VCAP tests can run without it.
> 
> Fixes: 552b7d131aa0 ("net: microchip: sparx5: Add VCAP debugfs KUNIT test")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Validation on net c9151088f167: x86_64 LLVM builds and QEMU runs
> with DEBUG_FS disabled and enabled. The other VCAP suites pass in both
> configurations. The debugfs suite is present only with DEBUG_FS=y and
> all four cases pass.
> 
>  drivers/net/ethernet/microchip/vcap/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/vcap/Kconfig b/drivers/net/ethernet/microchip/vcap/Kconfig
> index 97f43fd4473f..1af30a358a15 100644
> --- a/drivers/net/ethernet/microchip/vcap/Kconfig
> +++ b/drivers/net/ethernet/microchip/vcap/Kconfig
> @@ -40,7 +40,6 @@ config VCAP_KUNIT_TEST
>         bool "KUnit test for VCAP library" if !KUNIT_ALL_TESTS
>         depends on KUNIT
>         depends on KUNIT=y && VCAP=y && y
> -       select DEBUG_FS
>         default KUNIT_ALL_TESTS
>         help
>           This builds unit tests for the VCAP library.
> 
> base-commit: c9151088f1674fd29ff26a20f5fc687acf53a2f0

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

