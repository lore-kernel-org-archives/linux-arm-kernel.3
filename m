Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E2C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rezyicakc8bTaXPqt99+WXV0sTaLlKD+nbSaGZIN9wU=; b=nPRgFajWnhZp0k3aJukuUjwZ97
	R7/UaeSo8HzE1bTU+4O/pDyGz0svQhM6veHN/N+b3QunuLwgH1jqwywjtg7HpJVbjdZvuk66BWc4E
	RM96f282y/J8+e8uTCx82zqZNmFOELdO18Kev7PvJf0bjoipFIfIc/J5NINxLDYWrCRBgU0ZOXPY+
	7Sn7VD0xLRALzi47JO/azI/EoU1TieVKV2jpyVHnkR6Iv5qneJHSpgJMvZkr+RN6Y7ecEhBdRvy6C
	d9jlmjJ/iNnSx99J7Xr1/V9+oYtJ0LOwoHXrPUfLd2am6dwoWmEWx11GZVGD1JoiWE4dsrwbrq+oo
	V7IiyqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkl-000000079qU-0NzB;
	Mon, 20 Jul 2026 15:17:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpkj-000000079pz-2dCV
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rezyicakc8bTaXPqt99+WXV0sTaLlKD+nbSaGZIN9wU=; b=d4VYwdf0NjDyNzJ1pVNFQkUUFs
	MVHZckkR9fqlLMDvAXyAZUNhIwzlOWb7yI0Ebk8VhW4qdkcDIv7Uqge0koo64IU56M8FK8FAThL5b
	iEMyWOCt/GDAM4kzijdwoiEyxmrCoHKlwE5y/yjV9QwcV/m6CdM2/yQ+LSyO3BhI3+C2aZq9KJaId
	ljgglTxu/WpfrluQMkZNiCruenX1CEYiBuUEj9Y6QBudfj7YPrsZJa2+N79sumUsim8tGd2jFxLtw
	svDrvGHU4iScsZTqipatxiDSvlM5yxCIGtRdy96ovgRSY44dXXbMU/ujvxHeeiXuOaKkrZajcEq5D
	MnkBbD4A==;
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlpkg-0000000Gitw-32Hd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 15:17:56 +0000
Message-ID: <6ac12388-60de-45aa-a8d0-62fcfaf7bea2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784560670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rezyicakc8bTaXPqt99+WXV0sTaLlKD+nbSaGZIN9wU=;
	b=Sm89W4qeh+Bs2jMuaxXsYbrngKGfDXoKETgLFkT4Er8q5C9jrJqcDPZbP6jZ/Myw13dMMI
	HTTsOnYHqBrbR9xx6BWZ5cIvELkFmY8HHCclKa+gMyQ8l7F9og6i7JMv7Y2dr3GALayGX0
	fh1So6VdD8N5qL3yq9PTd+Rm3SHCTwo=
Date: Mon, 20 Jul 2026 16:17:32 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: Simplify ioctl handling
To: Andrew Lunn <andrew@lunn.ch>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
 =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260718143848.677531-1-maxime.chevallier@bootlin.com>
 <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ae82997f-537e-4a2d-abce-d163fcf9d868@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_161754_905111_EFB87886 
X-CRM114-Status: GOOD (  13.93  )
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

On 19.07.2026 17:13, Andrew Lunn wrote:
>> Looking at this, I'm wondering if we can't just get rid of SIOCSHWTSTAMP
>> handling in phy_mii_ioctl(). Looks like we can ?
> 
> I'm not sure about that. We need Richards input.
> 
> The code in phy_mii_ioctl() allows the MAC to be bypassed, it goes
> straight to a PHY based stamper. It could be the MAC has no idea the
> PHY has this capability, so it has not implemented the .ndo?
> 
> It might be we need to hoist the code from phy_mii_ioctl() into
> dev_{sg}et_hwtstamp()?

Hi Andrew!

I think I've converted all phy drivers while removing support for
SIOCSHWTSTAMP/SIOCGHWTSTAMP from netdev ioctl. I believe it's impossible right
now to reach SIOCSHWTSTAMP path of phy_mii_ioctl via ioctl on net device.

Is it possible to have ioctl on phy device directly without involving netdev?

