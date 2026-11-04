Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B0B6078022
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 20:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kQFm35gi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=gYMcabrr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZfTs+ryizwPn0Cl3XX+fYi34UNKxEvbPC3g5XcJfRFc=; b=kQFm35gi6aiuHKpFH/ym5mVf0B
	6Bu9/isz+whfbCVSTgOU3Rw9r4mQ60HGuUk1CMov6TpIu3iAUjXxiXdJX+bpw4uf8GjSURK41VWF6
	+IjJTRZ0+hsyeH/TQmQeL3Ed6CMEDUtMVmb8Lvk41H4pL/+UH+P2UUyzr/YQw2SDR/5yZ+1Sf8WIr
	iZtyNukz1q1xTbPrspbnTAPv5sEvW8ySm/rqnYY6eHff928oJUZ/uIq/p55KvpbRQX7Vx4wDhXRVl
	pjgy30+GQrPzIP90H2UL3UJeDbP/OEpPORybt7imohqF/t/azjr95fhQtVl5A2285XYl7NYQUmyIf
	fG4HJQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhxQ-00000006wjB-1OrH;
	Wed, 04 Nov 2026 20:51:44 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOhxN-00000006wiK-0orR;
	Wed, 04 Nov 2026 20:51:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZfTs+ryizwPn0Cl3XX+fYi34UNKxEvbPC3g5XcJfRFc=; b=gYMcabrrRrrv8R/JgiDQxQdpoO
	B4xeVkOkMAmW5SkgjzvXAXfOQ6JqfSA21vWQ3ZWQJRkwxEO00Cr1X2Q8EZW3y3AT0vPDV9fkXqdBk
	gqDbevO66SBMR4liG1+Nj0cg3+SfEF6DPc6bOe2V8Dj/iZhjs/xwOY6jPcw98oWTSJ+c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xOhwz-00ENw1-4M; Wed, 04 Nov 2026 21:51:17 +0100
Date: Wed, 4 Nov 2026 21:51:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <68eecc53-ed61-463d-bb5f-c68b507be82a@lunn.ch>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
 <2b744929-609b-4529-8b6b-30feb3ebbbde@lunn.ch>
 <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6aeb7861.6171b307.11ae12.6b94@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_125141_236353_0AB5A888 
X-CRM114-Status: GOOD (  10.02  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> It's safe in the measure that the worst is that link goes down during the
> calibration... I will rework the function to assign the base address to the
> default address for port 0 (it's hardcoded by the SoC) and use the lock and
> read/write helper instead.

Are there multiple PHYs in the package? What happens if both are doing
calibration at the same time?

PHY #0                            PHY #1


phy_modify_mmd(phydev, devad, regnum, mask, cal_val);

		       	      	  phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
				  ret = mtk_cal_cycle_wait(phydev_p0);

ret = mtk_cal_cycle_wait(phydev_p0);

    Andrew

