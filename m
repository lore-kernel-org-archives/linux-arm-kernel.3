Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2912E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3Vv9Ii4oAyb2xBXKP796hUiYRnbIlEgJVRU6r0oeJ4=; b=KAW6ZvJL22Ee4ifL5Jhek0+TFN
	oagU+9cChEofEQ7zJQXDrbq9xxdALOppDmuCQAE9DtSlqY7UARX5SlTxY+vlaDGr+rjWZpHDm696Q
	8HPPlfzDFnkzlrLbnL7yZZdIILkO/abranGrmT5/351LQE42z/W26X+3Qf+08u90NACkclrGvHKIv
	PYvNvFUJ8hpn2ciXHTMbWQRljETn0CrHVDrE1CD/rJjVCDStIODR2vK2E+JdIsKhW870TxNRsfUAt
	FWGTEBcdMTrYKyujUpmpRjQTrt4nAYSWQ63spTrHJD0EhtoczqoQnVpukHAir/xATexDL9jSHAbwt
	NIabwkuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9eq-000000050S9-4BJ8;
	Tue, 07 Jan 2025 13:30:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV9bY-00000004zxA-3WNC;
	Tue, 07 Jan 2025 13:26:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=I3Vv9Ii4oAyb2xBXKP796hUiYRnbIlEgJVRU6r0oeJ4=; b=EDja036ZoNSxV1Bflk1hEMKrwv
	l0MQhjpbFvH4DGCtNaEnCqBfs6+ja+sdJ1+3MFUfHdGSYEMEM7+COya16k8YkTYHFpea2P28anFtG
	g4Lm82NEcjog3dGCM5Mq1W8AwefLmTkWSOhDaxRexOJgqBfG0zlG2lox8z8tCa4GCMVc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tV9bM-002Est-OJ; Tue, 07 Jan 2025 14:26:32 +0100
Date: Tue, 7 Jan 2025 14:26:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Eric Woudstra <ericwouds@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
Message-ID: <a5beb529-5769-4310-b6a4-0ddccd85caf1@lunn.ch>
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <Z30pMSxDn-R3Cy5S@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z30pMSxDn-R3Cy5S@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_052644_874929_9F447A37 
X-CRM114-Status: UNSURE (   8.46  )
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

> The PCS doesn't support in-band status in 2500Base-X mode, or at least
> the implementation isn't compatible with those RealTek PHYs.

Is one or the other not actually 2500Base-X, but SGMII over clocked?

Overclocked SGMII cannot do in-band signalling. It could well be the
PCS is 2500BaseX, but the PHY is over clocked SGMII, and so the PCS is
not seeing the in-band signalling it expects, so never reports link.

	Andrew

