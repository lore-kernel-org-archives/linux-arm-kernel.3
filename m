Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF065C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 10:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=disdJJLVJor4H1FoWQdlYlI4wsvgR73dhH5ZuRqkDtY=; b=vTNOJGEzqFczy2lPRziBb1XxD3
	De8Q+hCp96gWhhrFYiwTZu7yeITuhAO/xBGTP+7a5xDncoZwXe9CBou/XTStmikiCLpsFT+qiUVau
	wGrfY8DietVMUuAwlUrL+IFKqKo2FVbf9+xEHwLkT96LD5KMpB7e7b+6VmBrctIHeQgclfJ0s6LP5
	4yaLm1qEem24o0PjSLmKT6COoW7VsXRBPBGvItD1/EQBveSHg1kUK4wQY+zTd8KpUAxplWbnozPlb
	1mkUoyfC2penTyhLHAU/bTnvs3aLhtnYlNhadP/3yDsPmV0aVBY7L2Jfx93K7htLc0Au58ayU3iXF
	w3VMo+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjSC-000000000Wt-3khK;
	Fri, 17 Jan 2025 10:19:52 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYjQu-000000000RZ-3kjd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 10:18:35 +0000
X-QQ-mid: Yeas8t1737109026t788t53021
Received: from 3DB253DBDE8942B29385B9DFB0B7E889 (jiawenwu@trustnetic.com [36.24.187.167])
X-QQ-SSF: 0000000000000000000000000000000
From: =?utf-8?b?Smlhd2VuIFd1?= <jiawenwu@trustnetic.com>
X-BIZMAIL-ID: 5973032802346409785
To: "'Russell King \(Oracle\)'" <linux@armlinux.org.uk>
Cc: "'Andrew Lunn'" <andrew@lunn.ch>,
	"'Heiner Kallweit'" <hkallweit1@gmail.com>,
	<mengyuanlou@net-swift.com>,
	"'Alexandre Torgue'" <alexandre.torgue@foss.st.com>,
	"'Andrew Lunn'" <andrew+netdev@lunn.ch>,
	"'Bryan Whitehead'" <bryan.whitehead@microchip.com>,
	"'David S. Miller'" <davem@davemloft.net>,
	"'Eric Dumazet'" <edumazet@google.com>,
	"'Jakub Kicinski'" <kuba@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	"'Marcin Wojtas'" <marcin.s.wojtas@gmail.com>,
	"'Maxime Coquelin'" <mcoquelin.stm32@gmail.com>,
	<netdev@vger.kernel.org>,
	"'Paolo Abeni'" <pabeni@redhat.com>,
	<UNGLinuxDriver@microchip.com>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk> <06d301db68bd$b59d3c90$20d7b5b0$@trustnetic.com> <Z4odUIWmYb8TelZS@shell.armlinux.org.uk>
In-Reply-To: <Z4odUIWmYb8TelZS@shell.armlinux.org.uk>
Subject: RE: [PATCH net-next 0/9] net: add phylink managed EEE support
Date: Fri, 17 Jan 2025 18:17:05 +0800
Message-ID: <06dc01db68c8$f5853fa0$e08fbee0$@trustnetic.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: zh-cn
Thread-Index: AQJuuL6961zeRYLpn6fcQniPsxo8VAIOTZqlAVk2ssyx2OG8AA==
X-QQ-SENDSIZE: 520
Feedback-ID: Yeas:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NRkWGnbnkwTm+3wKgnyuuRTtwb/kgnqiV2BXkTG4ItlE8YpipApasYNg
	P9P56E2XRpUUBNPuFYxMp6dI3pom77b/6N8Q+DzS2ZBh7XgDFsE6YwKIFiS8x4MFEjlvQgg
	ACaV5qimYbsGASSJ0SXTLrXrQE/Eab8gpWhow6gTRC4J+A5lcUPvSr5PBQ8Syi1UCNIiirI
	4vinBdvuWqcw8sH0g5on3iuJXIy+Vwmc9fkslnbSeWUJjveH/9vTWEDzpv1ZztBnzVaMB47
	rI5zRNZ5dvNb7Im2tgr6rIDZcED6rV86UZyW0uIWo38CcTMtsCh9XhZdWiHNpPVUu0NNChI
	W205rDiMGK7nUhwpyukswegMQiRsqAbaMONwwlQNe8GB2tjFe2mznLMuJrYNSTvjt0QyOlG
	PpHwFZCbi8Ii6vtwRxaEFhPxCpRJ93NZ8JLdqlJ90Iq42P/Ph9/ZD2D4Fll2Cktk/MGIvpA
	fdtV/WzLYayJa4DAmM+Bd1dvJHlFfN58qyIUCYaBSCy4GkyNWEpYvC/xSPLD5XSpTf5keK2
	91ZN+JLMKknYEfsqVzgyTZFEfqB4Kih/0iyxiuSeuN5PH2Uxez4WqUsq/zBn/J0pHPvMLJQ
	dyX6WHBdAp3o7GHdrcp2XokpQ9lryQBUW7gpnEejxmvtHIM66GMadHaWrSOuQ3uPk8wywRu
	k6qOx2gHCdQZn3n4OcbfqqA4sXj9z2we64xl3B0+s8UNyIA1nKPB2pBaelqiC3husmJ8v+w
	vLe2iGtruIS9gPnGGUAkBfrRjIEM05f4AP2Hr8vy5h3MErkUfZU6MLCSMKbZlsJpZKHTPi5
	K4yw4MIP0RQZG9A/gv1OJRlQQPi7J6fFOS8z1c0ySywAM4fWBheRkV1V/NuXxhs4obQmfl8
	7iwtxZFNkpRb2lUXab4OqsQAgRMdt3D62dMi3OhSA3AnMj7fRj2Fu9mW0xIOakwS24nXgcB
	4awXoewxIvp8GM0+n74ARb48a8K0rsrJXhXUcuZZW5cYZV7vKNymm4iTsKc8SxWLPkad9kc
	rpf6Hr/cx24JxH0qlXmUePFn6JFzxm7tZydmJwkS8CWK9Vf1Sj
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_021833_483444_523DC7C3 
X-CRM114-Status: UNSURE (   7.73  )
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

> > Since merging these patches, phylink_connect_phy() can no longer be
> > invoked correctly in ngbe_open(). The error is returned from the function
> > phy_eee_rx_clock_stop(). Since EEE is not supported on our NGBE hardware.
> 
> That would mean phy_modify_mmd() is failing, but the question is why
> that is. Please investigate. Thanks.

Yes, phy_modify_mmd() returns -EOPNOTSUPP. Since .read/write_mmd are
implemented in the PHY driver, but it's not supported to read/write the
register field (devnum=MDIO_MMD_PCS, regnum= MDIO_CTRL1).

So the error occurs on  __phy_read_mmd():
	if (phydev->drv && phydev->drv->read_mmd)
		return phydev->drv->read_mmd(phydev, devad, regnum);



