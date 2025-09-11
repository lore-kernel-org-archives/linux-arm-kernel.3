Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBED6CA1016
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 08:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3X9+A0P0F92W8xd1mm/wdAzjQD7bN49SA+/OJzzCmm4=; b=v6SaYUkx4VAxPw
	wSjgHEMUmAOlD0ZoxnibevI1ty97fJTuqEQgUUypbTp4CdrAIqWucDsMVG4kGFcLalGGWoEI+Vp/5
	3vDa81GFwz4J9pnCGH92U21dNaUejcWHqW6XsyuxPs/bYdZGQGATvubnXiAaIP/PhcUkT48FhhrFg
	05qPmFNIra9SgDzWzqHGXTgC/wXzMsNPo9lqIJma/Itn9WjOwV8BcaUgYkXpdYwOBiBLMiVlhmVUc
	FRM/kvRBkZn5u/twVdy1EnTgJNMebCT5d90mHZE5qc3zq40cPoH40qQxL1XbCAdESJAqlrOdteAE7
	Igj0t0OcfBFdU2g/SQKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcQW-00000001klW-0lCz;
	Thu, 11 Sep 2025 08:13:08 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwcQT-00000001kZM-3Hn6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 08:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=3X9+A0P0F92W8xd1mm/wdAzjQD7bN49SA+/OJzzCmm4=; b=yg9H/dvZuy+suCTZ203CdRADS7
	nNXV+ibyvDbulq170sSwsMU8++kmF/wux1Q5JpPvos3Ant6WGGswNDj9aslDfRfJsKO0B8TM6gWTE
	PaYSbEw+R25eXbHqUitRQ6mUsmfsl89NaJkf9F0sKnxM9SCGsbS6ftGp8nwgUJZTnDla4+wI/iXUk
	pQWFiiUN9RyvXuHp3a5XKYhPdUuJ5qZTmlKihwZMU9tpPbe46RvjKzr/rDlPYGXTHxJ0mupfiyKoV
	etE7LkMzSBDcA3tzaSX4pJ19FmYyT7sboWO0MrXhD474LW4O7edyl0xL+xNej0n0gLMKJxTazG2Y9
	6+nZE4Kw==;
Received: from [122.175.9.182] (port=33004 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uwcPk-000000015ts-2XgD;
	Thu, 11 Sep 2025 04:12:21 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 526AB1781F05;
	Thu, 11 Sep 2025 13:42:14 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 2754D17840BC;
	Thu, 11 Sep 2025 13:42:14 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id N5Rg2jz0nb_G; Thu, 11 Sep 2025 13:42:14 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id C74831781F05;
	Thu, 11 Sep 2025 13:42:13 +0530 (IST)
Date: Thu, 11 Sep 2025 13:42:13 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1472700459.335961.1757578333581.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250908133019.44602174@kernel.org>
References: <20250904101729.693330-1-parvathi@couthit.com> <20250905183151.6a0d832a@kernel.org> <974157264.314549.1757343020136.JavaMail.zimbra@couthit.local> <20250908133019.44602174@kernel.org>
Subject: Re: [PATCH net-next v15 0/5] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: /Xec1/3639+TyIC3wc37Kq4oOeNPjg==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.couthit.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.couthit.com: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.couthit.com: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_011305_908428_6B9BF3BC 
X-CRM114-Status: GOOD (  13.53  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, krishna <krishna@couthit.com>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, michal swiatkowski <michal.swiatkowski@linux.intel.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Mon, 8 Sep 2025 20:20:20 +0530 (IST) Parvathi Pudi wrote:
>> > On Thu,  4 Sep 2025 15:45:37 +0530 Parvathi Pudi wrote:
>> >> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> >> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> >> Megabit ICSS (ICSSM).
>> > 
>> > Looks like the new code is not covered by the existing MAINTAINERS
>> > entries. Who is expected to be maintaining the new driver?
>> > Please consult:
>> > https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html
>> 
>> We will update the MAINTAINERS information in a separate patch to
>> this series and share the next version soon.
> 
> I wasn't asking if you can update the MAINTAINERS, I was asking what
> you will update it with. Since that's still not clear I'm dropping
> the series from pw, please repost with the MAINTAINERS entry included.

The new entry for the ICSSM Ethernet driver will be added immediately
after the existing ICSSG driver section.

We will update the MAINTAINERS file with the change shown below.

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..c7f04ff96cf0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25320,6 +25320,18 @@ S:     Maintained
 F:     Documentation/devicetree/bindings/net/ti,icss*.yaml
 F:     drivers/net/ethernet/ti/icssg/*

+TI ICSSM ETHERNET DRIVER (ICSSM)
+M:     MD Danish Anwar <danishanwar@ti.com>
+M:     Parvathi Pudi <parvathi@couthit.com>
+R:     Roger Quadros <rogerq@kernel.org>
+R:     Mohan Reddy Putluru <pmohan@couthit.com>
+L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:     netdev@vger.kernel.org
+S:     Maintained
+F:     Documentation/devicetree/bindings/net/ti,icssm*.yaml
+F:     Documentation/devicetree/bindings/net/ti,pruss-ecap.yaml
+F:     drivers/net/ethernet/ti/icssm/*
+
 TI J721E CSI2RX DRIVER
 M:     Jai Luthra <jai.luthra@linux.dev>
 L:     linux-media@vger.kernel.org
--


Thanks and Regards,
Parvathi.

