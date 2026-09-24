Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73C6C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r8FIy2V4CP3oxdXEppYFft9HmteZ9fPAPGHJHwLVlg=; b=dap6amNwHAN/afkPUHFaNj9de3
	Dvn8zfUdsmQKN86yVmlQTSb2BcaWbP4uni4il0jgpTckCuevmbJTasWjYA7aFOWqsHEnOlJZ7aPRi
	nRkBO0I7oWFwtxPylRvN3CpnEgDOZv4wV8K8MsWYeG6D5K1F6RVpjGvfxibuAyu3YjMz3OHqAEREW
	3EFQT8lL/VPuS48Rpkv+CRMjC5jvk0C3f4uEnxdl26Zy/quphXyN9Ey9YEaGLfwEf+F0fmR4q7Yky
	zrwhL/q6rwhDenPjaM7bnqv6rXhnkpGMrGbqzSO0xmdNVF1b6Nadkv/cubhR2QVte4yzozh+DnQpn
	EOfyRDog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mFi-0000000Baro-187k;
	Thu, 24 Sep 2026 16:24:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mFe-0000000Baqa-1iP6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790267090; x=1821803090;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=057w4K6AIH+2cjgtX4h1v5myM/zTrovsfRnreCXZXgk=;
  b=0uCJTkPZyHaJQbnlHIaGBFxrMTR5J5jKg+Ef1zRvASpxarK1NgQ/71G/
   Q9YVYD6YtlRCbBLiWBSl54yzeE1RxQndM1hrQWDyUX4eLM7LcKj5PBETK
   BOPizbi0A2Xf12woBjRNfYcjozGMGs8EiiTc6j/LmbdQkz0queAkFcR+h
   EpHPGIV5FONNRSObpfZWhlBrOEu8Hs0u8nBDSdI/kTrrfYJ08O207Vald
   OL90Y2kURSeg2CPGijecHmPqW/fjRzIDr2rvrIg+LYxC4odzGfHuL9lKD
   TjXy1ssT6ve146ocQuN5qHC7cCxgCvRahl3DI2E33gHFSbykg7V5K2FcX
   Q==;
X-CSE-ConnectionGUID: W2R9KMarSxa+DEZ33B5E4A==
X-CSE-MsgGUID: jaEIntY6QkyEU8YyNCAOvA==
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="64409041"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 24 Sep 2026 09:24:48 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 24 Sep 2026 09:24:47 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 24 Sep 2026 09:24:43 -0700
Date: Thu, 24 Sep 2026 18:24:43 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Simon Horman <horms@kernel.org>, <netdev-bot+sashiko@kernel.org>,
	<andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <horatiu.vultur@microchip.com>,
	<steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <hawk@kernel.org>,
	<john.fastabend@gmail.com>, <sdf@fomichev.me>, <herve.codina@bootlin.com>,
	<arnd@arndb.de>, <gregkh@linuxfoundation.org>, <mohsin.bashr@gmail.com>,
	<richardcochran@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v7 10/14] net: lan966x: add PCIe FDMA support
Message-ID: <20260924162443.5vmx3dx5c4cx7rrm@DEN-DL-M70577.microsemi.net>
References: <20260918-lan966x-pci-fdma-v7-10-0ecc179c8a2c@microchip.com>
 <179008205148.2160803.12818321368571406375@kernel.org>
 <20260923084538.wgkw2nt5ergoxcot@DEN-DL-M70577>
 <20260923180730.GV13925@horms.kernel.org>
 <20260923201155.lbbbtx22adz2ilhg@DEN-DL-M70577.microsemi.net>
 <20260924064617.GY13925@horms.kernel.org>
 <20260924083141.67eecb6e@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260924083141.67eecb6e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_092450_720800_A9387E07 
X-CRM114-Status: GOOD (  12.49  )
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

> On Thu, 24 Sep 2026 07:46:17 +0100 Simon Horman wrote:
> > > I am a little reluctant, when I cant really test it properly. Sashiko gives
> > > another solution - adding a LE dependency to the Kconfig of the misc PCI driver,
> > > maybe that'll do?
> >
> > I think that should be a last resort. I won't hold out on this,
> > but I would prefer the approach I suggested.
> 
> +1

Ack. Will add the big-endian support in v8. Thanks.

/Daniel

