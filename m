Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0013C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZ32ri9UvCA0ZFnxXbOjw3nZYx8ajIN2VWmbh80DLjU=; b=CMHyfu3UyqEa7THe8BrFw2alTX
	U2z2hpmtvjQb5uzIFvVvWeMQv28NBhXfC6v2ymik9YpI6+ipoOOTRdvFu7yzrVivKmF9BktMJ14/z
	xQ3KCiyUynWnTm6Rnb/UzFkDr4Kgs5kYlUJ7BoEh9AXViCM8ptcapzzVlxPLnpQt3u4bxqa++58q2
	PaoJJ/t0NzNte8ei5Q478o2cmEKVrWsfh7Ytv8LTpc3RVKFSKHeK5YZmgaKRgfvu8FwMvMU3eheNC
	Uh3iznF3mgUUkysX96sEW6yMdbJcPupTfUlbTe2u3K2MY7eN1T9qgoffyb2Ql6ideyXltsjbFwztn
	JXmYB9uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4oJ-00000007Pm2-3Wwj;
	Mon, 02 Jun 2025 13:02:39 +0000
Received: from forward501a.mail.yandex.net ([178.154.239.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4m7-00000007PXa-2n3u;
	Mon, 02 Jun 2025 13:00:26 +0000
Received: from mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:160e:0:640:a44a:0])
	by forward501a.mail.yandex.net (Yandex) with ESMTPS id 89D6961677;
	Mon,  2 Jun 2025 16:00:19 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id F0aS6QbLoa60-v1prNre5;
	Mon, 02 Jun 2025 16:00:18 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0upti.me; s=mail;
	t=1748869218; bh=oZ32ri9UvCA0ZFnxXbOjw3nZYx8ajIN2VWmbh80DLjU=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=EzcWINEr1YcBsyckPUR3nlN3K+/LMzSaQKkMLqlbcJj6CrPBngXx/eDKc18C6WbJ+
	 RJztATJ/WAvys8DZNnSxo0MbSn+9ezY18d5m9s1x9LMmcGUTwkR4lIQP67AAm6ZkCd
	 Gv5gMnOxTZ5Oaa0NtUAkqX5gKrFUfqZi7JSa191U=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.iva.yp-c.yandex.net; dkim=pass header.i=@0upti.me
Message-ID: <2894a781-4d4b-4e3c-9f4e-7c1f04122f8a@0upti.me>
Date: Mon, 2 Jun 2025 16:00:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: phylink: always config mac for
 (delayed) phy
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Eric Woudstra <ericwouds@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, bridge@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250107123615.161095-1-ericwouds@gmail.com>
 <Z30iUj6DE9-fRp0n@shell.armlinux.org.uk>
 <4b9b2a9a-061b-43ad-b402-a49aee317f41@gmail.com>
 <Z31CJS1YUvPGiEXs@shell.armlinux.org.uk>
 <98234080-946e-4b36-832f-113b185e7bca@gmail.com>
 <Z3-Tz5WdLCat91vm@shell.armlinux.org.uk>
 <9cc913d7-7e5b-4b6c-886c-ca9778c3f970@0upti.me>
 <aD1lRha-enQ9Pw0g@shell.armlinux.org.uk>
Content-Language: en-US
From: Ilya K <me@0upti.me>
In-Reply-To: <aD1lRha-enQ9Pw0g@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_060023_888498_41A63E27 
X-CRM114-Status: GOOD (  19.08  )
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

On 2025-06-02 11:48, Russell King (Oracle) wrote:
> On Mon, Jun 02, 2025 at 10:19:22AM +0300, Ilya K wrote:
>> On 2025-01-09 12:15, Russell King (Oracle) wrote:
>>> On Thu, Jan 09, 2025 at 09:56:17AM +0100, Eric Woudstra wrote:
>>> I'll look at what we can do for this today.
>> Hey folks, don't really want to necrobump this, but the original hack patch is the only way I can get my weirdo Realtek (noticing a pattern here) GPON modem-on-a-stick to probe at 2500base-x on a BPi-R4. I've actually tracked down the issue myself and wrote basically the same patch first :( Is there anything I can do (with my extremely limited phylink understanding) to help move this forward so other people don't have to suffer like I did?
> 
> There were two issues that were identified. The first was that when in
> 2500Base-X mode, the PCS wasn't reporting link-up. That was addressed
> by the patch series:
> 
> Z4TbR93B-X8A8iHe@shell.armlinux.org.uk
> 
> then, the replacement for Eric's patch was:
> 
> E1tYhxp-001FHf-Ac@rmk-PC.armlinux.org.uk
> 
> So the problem should be solved with these applied, as when the PHY is
> attached, "changed" will always be true, which is in effect what Eric's
> patch was doing, but in a cleaner way.
> 
> Please confirm that you have all six patches applied.
> 

That's weird, because I do have all the patches applied. I think this may have been broken by the pcs_inband_caps changes, because without the patch I'm just getting "autoneg setting not compatible with PCS", after which it bails, when it should really reconfigure the MAC instead.

(resending because I replied instead of reply-all by accident)

