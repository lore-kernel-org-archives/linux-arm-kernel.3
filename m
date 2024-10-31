Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76391D767E4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 15:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R22eOld3HHRkg+3Pl3PxR0m2oHUBKxUm2voXqaP5CBw=; b=1hwhQ47diEVgsKxw3buJqeTPZJ
	GkQFe7d9kRQ7VephxbvCsg0BlOuiKbzw2UnZGjLt3L6bDPyOECSCFYE/Cof8vN57fiIFJG1hCKY8s
	Faya5NFdnFZ3lloXfzauSEh3Kt70OPuxH95xDQIt5M4MmbkLoGwR5DkHYmBvyRm7MgwlvoZTR4BmC
	f1uT+NntZaHj+xLpJkkeP12nKUbPsDmD4BNCCvp6LKTeB2FRI3PJNnxvneyekYHJtvyXV5sXxOXWC
	iZaI2RzfXDbmIoNKQucqD8d+1qloNjgHJA+rwT9AtwXn9m0eEfGF0TZi9Zq4onaWG6Lg87fpotrAf
	QrQtQNWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6XAm-000000040cb-206F;
	Thu, 31 Oct 2024 15:33:20 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Wgz-00000003u6C-0bep;
	Thu, 31 Oct 2024 15:02:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R22eOld3HHRkg+3Pl3PxR0m2oHUBKxUm2voXqaP5CBw=; b=3hMpARpK8n/hpooMl83HU00jwK
	NBJ+Tl/a6iXPc2SkonBtnwFmz1URwAiWfuGApM4wkkcCHe7Dk+LgsNk5yWcvBvZWDQJl64fbZwJ3u
	b9VHoP5xMKgKyuHYrVlvgo8Eo/RId6KkYKXDHrs6DSuzV9ZeCZHKf0mWemISu15B8C0Q=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t6Wgu-00BnOs-NY; Thu, 31 Oct 2024 16:02:28 +0100
Date: Thu, 31 Oct 2024 16:02:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: SkyLake Huang =?utf-8?B?KOm7g+WVn+a+pCk=?= <SkyLake.Huang@mediatek.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"horms@kernel.org" <horms@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"dqfext@gmail.com" <dqfext@gmail.com>,
	Steven Liu =?utf-8?B?KOWKieS6uuixqik=?= <steven.liu@mediatek.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"daniel@makrotopia.org" <daniel@makrotopia.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH net-next 1/5] net: phy: mediatek: Re-organize MediaTek
 ethernet phy drivers
Message-ID: <ce1343e0-1206-4c40-8eb9-b2981e276c76@lunn.ch>
References: <20241030103554.29218-1-SkyLake.Huang@mediatek.com>
 <20241030103554.29218-2-SkyLake.Huang@mediatek.com>
 <cd2f249b-6257-4692-ac2f-93252534cff4@lunn.ch>
 <01ed46ea6898e40b89de370af1b8a31a384e0044.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01ed46ea6898e40b89de370af1b8a31a384e0044.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_080233_204573_5A722A1A 
X-CRM114-Status: UNSURE (   4.80  )
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

> Thanks for the tip. Do I need to submit v2 to fix this to get merged?

Yes please.

    Andrew

