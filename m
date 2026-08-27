Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA37EC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MF89Uf7k+xB6voM5L0mPleG7/yXORja7Y5ThfQaKxAk=; b=tB2i6fcRp9nXdMDBSXGZqlfvAM
	QxX+p73Vdy+jf/U7wNCW2J41Q1o1pD8l/TxDf3pcNhAn3ZueEWPHpc+TMMOfV9Y58mf8nzE7ULXG8
	tKlqyHiip7o+Fo8BFUxl3tTtX5NkvuSDD7338DGiaz3Uhr4YcRsPOpbr/AZurarFtWZ93t7Z0vqPe
	xCUYQOaT3UJzj16kx21BR0Op9TwyPCM4rW4s4r1ZO5cNZx/NQ3wluJxGE6r4RBbVcLTMVuU5T8EKM
	2fmihTHJZSysd3cNh8E9kLvncsZ7EVBic6yPLaf3/iYUnPvh4qTMNM57t+oGpousZqrua1MV/2sgx
	Af3Nx/tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWYn-00000003lLE-33xk;
	Thu, 27 Aug 2026 09:38:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzWYl-00000003lKE-0ap4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 09:38:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787823494; x=1819359494;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=e81a7B7e6BAfdUxEoq1bxfDYdozfWoLcX7ktH1Mvil8=;
  b=mA2mzJl6sZC8YI6X5DszZlwNacyGXMO+TDD65on/4OC1ssIGVNIHaopV
   t8w8UbFyXx9ARg6d+vUMYZ7uJqZ5Mwz2y0OQwkOt2F83xPkJ1KxcfWNMd
   MPn7M+bsdKB1LHL3VjcUzj149rx+K5tFyzQOqxPDdVUDDIDie82anj/XE
   iI5JSnN6hMwjepDWe7LTe3nw84hHjPLm9VXstYk1TGW/70VGBUhjFcObt
   Sr/p8zU15B+xin3MKZuMyXp2gHmMEkj5OLcURjocvtzqkYB+hLKKO47Bx
   K2z5N42VFMngKJBOWoWllKvSOYz2Yk9pdgPuR3eQBzHJ5b3nqug5CQusR
   A==;
X-CSE-ConnectionGUID: PrlgIxWMRKCL5XyvObe2DA==
X-CSE-MsgGUID: 7V1sKLlKQhajAyfDsq9g9Q==
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="61841232"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 02:38:12 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 27 Aug 2026 02:38:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 27 Aug 2026 02:38:04 -0700
Date: Thu, 27 Aug 2026 11:38:03 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
	<pabeni@redhat.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, "Steen
 Hegelund" <steen.hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>,
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
	<john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, "Herve
 Codina" <herve.codina@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mohsin Bashir
	<mohsin.bashr@gmail.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH net-next v5 08/13] net: lan966x: add shutdown callback to
 stop FDMA on reboot
Message-ID: <20260827093803.nhsmd4shql6hk75a@DEN-DL-M70577.microsemi.net>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
 <20260520-lan966x-pci-fdma-v5-8-ca56197ae05b@microchip.com>
 <20260522184545.43e00be3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260522184545.43e00be3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_023811_468364_AD973A40 
X-CRM114-Status: UNSURE (   7.80  )
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

> On Wed, 20 May 2026 10:12:20 +0200 Daniel Machon wrote:
> > +     napi_synchronize(&lan966x->napi);
> > +     napi_disable(&lan966x->napi);
> 
> Why the synchronize() before disable() ?
> napi_synchronize() is a simplistic disable() + enable()

Agree, the synchronize is redundant. Dropped in v6.

/Daniel

