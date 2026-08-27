Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDD5C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 11:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KY+T/6XExnwTOFlRMAmJAfIzA9puQ4tyCTxS8psGZk=; b=hfj1Pr84xGIr6Akizyq48xz4zT
	WQ02sl3cMD2XcuRk/5dIFBr6HkkhtSgxst4UlOe6Y56B1jISB1WH2YSTyjKP1vNcOMfhHM0z/8PeJ
	qQV2mLtiIMwMyv7xQu42rtJWHlh9SdC0ikVEqSiSnP9H8g5z7bIp1Gs65kvu0XoiVz3W7eLKoQVPv
	dwsAOGR0EuXySYTRCN/Jawf+zmsud7jlHggAfZAUF6vkLPDC51DNuXf7LIRtrTZe9z4C4L5WmlRbf
	/AAwKNrUvvA8RtgDg7YG4dab0bk3Jxng9wE1vQp8Hi2NKzkn1qZYHD//KbtaFRROKYDx1uGtlsfW0
	1auyPXLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzY87-00000003siW-3cap;
	Thu, 27 Aug 2026 11:18:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzY83-00000003shk-1nXu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 11:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787829523; x=1819365523;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=l96QKR1qSNS2rRA2a0GsZJo3vHPe31giO0jIcFVZ3zQ=;
  b=MVBTKYyIZAzuOHhWsW+/klHcaUN5rQFP3FxY8RwandpKnOrQBiMIXwnF
   iL41SUQCGCki/miD0N6xkuJMPtfKKP4QTf6Siq4DFY/dD6ufwlegVFCAV
   FSKiaifw6uMXyWXqwg0J8TEnQU6LF8rG7Hre5ymoeEs8fMpdAvd9yAsTv
   foJRGiGEoZBUIWG3e+rhQP4/+EIhGrzBrPoRBEEn86Bk4DJnw6pPiYY91
   pCNWZhLShKodRljY8ePnI4lS1UGma8yBuyt0PMfFkN46YV0m/YzB8fvIR
   aqOkJ/AKL0ehwqKqDnnhq7Ueik0BYEGrCk16mSxn5qXUTaMlImmOFBhb+
   g==;
X-CSE-ConnectionGUID: QNjRJ1JeTdO8OgG6Qe7F9A==
X-CSE-MsgGUID: NdHPSxSJQKaOue0owqLo1Q==
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="229862350"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 04:18:42 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 27 Aug 2026 04:18:41 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Thu, 27 Aug 2026 04:18:37 -0700
Date: Thu, 27 Aug 2026 13:18:37 +0200
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
Subject: Re: [PATCH net-next v5 12/13] misc: lan966x-pci: dts: extend cpu reg
 to cover PCIE DBI space
Message-ID: <20260827111837.2mjyx6sicuxseq6g@DEN-DL-M70577.microsemi.net>
References: <20260520-lan966x-pci-fdma-v5-0-ca56197ae05b@microchip.com>
 <20260520-lan966x-pci-fdma-v5-12-ca56197ae05b@microchip.com>
 <20260522190157.02e1e3ff@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260522190157.02e1e3ff@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_041843_530585_5CAA64D2 
X-CRM114-Status: GOOD (  11.92  )
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

> On Wed, 20 May 2026 10:12:24 +0200 Daniel Machon wrote:
> > The ATU outbound windows used by the FDMA engine are programmed through
> > registers at offset 0x400000+, which falls outside the current cpu reg
> > mapping. Extend the cpu reg size from 0x100000 (1MB) to 0x800000 (8MB)
> > to cover the full PCIE DBI and iATU register space.
> 
> Are we supposed to take these to net-next ?

I think the original dtso was merged through soc (maintainers are CC'ed). I am
not sure if you can merge those two commits through net-next? Happy to clarify
in the cover letter that patches #12 and #13 are to be picked up by SoC
maintainers. Let me know.

/Daniel


