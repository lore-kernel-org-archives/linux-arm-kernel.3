Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E11F5CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkjoUVrkEbxgoQaDk5ZZ3XPrtdMLBaFU+7TZ7EnSAjc=; b=QkXU+/zwSgqJRK
	4/+K9P8t6Czc3glQFXnoYUdPmvxK2cCG1FRhtyixIY9WhWk1rUIq89GbhYbIt945r/pHUgh5jOUoS
	zXqkiNXdRnoCkEkT1sXPGmi0DRAQRo7bff5GkH0W/mf9SRMaJzBLtmZDfBYZcj4ew6vlQawck0Wfs
	cqW2z/zA1+qk8ZCP4EQrQlgBARh63iZcDjzllCwJrL2JySHHZtMC3OFRm4gN/v0uIO2Lwwyh8VdkW
	3vz8lpBppCF1Zd+OUFvP3Y4ojH3vCl48BiVHmm+Gpkl5CX3QSvQ3doV+IZcu5XZDYA4qVd/2K8a9z
	6pTVQ+s0/a6/9dZx9LTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojEB-0000000Du9Y-07uu;
	Wed, 20 Aug 2025 13:51:47 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoibw-0000000DiyU-02QI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=FkjoUVrkEbxgoQaDk5ZZ3XPrtdMLBaFU+7TZ7EnSAjc=; b=UTZuHWwC+2InavEBSqseZpQwkk
	HFv0y6A+LZKM4LSBCnb0FXrm4N3Rki55rC2HaUcF6w4mqri8P4R/PksgIB0sNYE4TFH981obQ6nkN
	vhTt88CmcJy3d0WpfJm8BEWrVDXeoOFrJWCIECPtjG1oKvHZyLPp6Rpc9SDctPeloCkcxv59O5xyv
	KTEynBButoxre+2YWfjoGzr1/rQmp6vnCZzGrsMoYfHqXfGcWIA5K1Uv2g7evSz/7bUtOVz9Ce0R5
	AIPA2wCWELkZLcycT6HYWE4GgrYJlV5QU0LSz0UPfdNQHfuddWI0Vo1Tlo8f5OcHiXxTsRor2VAoz
	NFGSRy0Q==;
Received: from [122.175.9.182] (port=37861 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uoibs-0000000GEBr-3E16;
	Wed, 20 Aug 2025 09:12:13 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 1937A1783F55;
	Wed, 20 Aug 2025 18:42:07 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id EE3171781A82;
	Wed, 20 Aug 2025 18:42:06 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7Zh1uusK_KgJ; Wed, 20 Aug 2025 18:42:06 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 973CE17823F4;
	Wed, 20 Aug 2025 18:42:06 +0530 (IST)
Date: Wed, 20 Aug 2025 18:42:06 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: Md Danish Anwar <a0501179@ti.com>
Message-ID: <723941373.207922.1755695526505.JavaMail.zimbra@couthit.local>
In-Reply-To: <8ad6bb71-9ce5-414a-bbf6-b9893b88cb4f@ti.com>
References: <20250812110723.4116929-1-parvathi@couthit.com> <8ad6bb71-9ce5-414a-bbf6-b9893b88cb4f@ti.com>
Subject: Re: [PATCH net-next v13 0/5] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: yzIaHTMGcOq0ItatwNI8VBAAqPuE7g==
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
X-CRM114-CacheID: sfid-20250820_061216_083459_6324E723 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On 8/12/2025 4:35 PM, Parvathi Pudi wrote:
>> Hi,
>> 
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
>> 
>> Support for ICSSG Dual-EMAC mode has already been mainlined [1] and the
>> fundamental components/drivers such as PRUSS driver, Remoteproc driver,
>> PRU-ICSS INTC, and PRU-ICSS IEP drivers are already available in the mainline
>> Linux kernel. The current set of patch series builds on top of these components
>> and introduces changes to support the Dual-EMAC using ICSSM on the TI AM57xx,
>> AM437x and AM335x devices.
>> 
>> AM335x, AM437x and AM57xx devices may have either one or two PRU-ICSS instances
>> with two 32-bit RISC PRU cores. Each PRU core has (a) dedicated Ethernet
>> interface
>> (MII, MDIO), timers, capture modules, and serial communication interfaces, and
>> (b) dedicated data and instruction RAM as well as shared RAM for inter PRU
>> communication within the PRU-ICSS.
>> 
>> These patches add support for basic RX and TX  functionality over PRU Ethernet
>> ports in Dual-EMAC mode.
>> 
>> Further, note that these are the initial set of patches for a single instance of
>> PRU-ICSS Ethernet.  Additional features such as Ethtool support, VLAN Filtering,
>> Multicast Filtering, Promiscuous mode, Storm prevention, Interrupt coalescing,
>> Linux PTP (ptp4l) Ordinary clock and Switch mode support for AM335x, AM437x
>> and AM57x along with support for a second instance of  PRU-ICSS on AM57x
>> will be posted subsequently.
>> 
>> The patches presented in this series have gone through the patch verification
>> tools and no warnings or errors are reported. Sample test logs obtained from
>> AM33x,
>> AM43x and AM57x verifying the functionality on Linux next kernel are available
>> here:
>> 
>> [Interface up
>> Testing](https://gist.github.com/ParvathiPudi/e24ae1971258b689c411bf6d8b504576)
>> 
>> [Ping
>> Testing](https://gist.github.com/ParvathiPudi/6077cc7ab71eb0bc62ef0435ce9a5572)
>> 
>> [Iperf
>> Testing](https://gist.github.com/ParvathiPudi/54aec8d6aaa1149b68589af9c8511b23)
>> 
>> [1] https://lore.kernel.org/all/20230106121046.886863-1-danishanwar@ti.com/
>> [2] https://lore.kernel.org/all/20250108125937.10604-1-basharath@couthit.com/
>> 
>> This is the v13 of the patch series [v1]. This version of the patchset
>> addresses the comments made on [v12] of the series.
>> 
>> Changes from v12 to v13 :
>> 
>> *) Addressed Alok Tiwari comments on patch 2, 3 and 5 of the series.
>> *) Addressed Bastien Curutchet comment on patch 2 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v11 to v12 :
>> 
>> *) Addressed Jakub Kicinski's comments on patch 2 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v10 to v11 :
>> 
>> *) Reduced patch series size by removing features such as Ethtool support,
>> VLAN filtering, Multicast filtering, Promiscuous mode handling, Storm
>> Prevention,
>> Interrupt coalescing, and Linux PTP (ptp4l) ordinary clock support. This was
>> done
>> based on Jakub Kicinski's feedback regarding the large patch size (~5kLoC).
>> Excluded features will be resubmitted.
>> *) Addressed Jakub Kicinski comments on patch 2, and 3 of the series.
>> *) Addressed Jakub Kicinski's comment on patch 4 of the series by implementing
>> hrtimer based TX resume logic to notify upper layers in case of TX busy.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v9 to v10 :
>> 
>> *) Addressed Vadim Fedorenko comments on patch 6 and 11 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v8 to v9 :
>> 
>> *) Addressed Vadim Fedorenko comments on patch 6 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v7 to v8 :
>> 
>> *) Addressed Paolo Abeni comments on patch 3 and 4 of the series.
>> *) Replaced threaded IRQ logic with NAPI logic based on feedback from Paolo
>> Abeni.
>> *) Added Reviewed-by: tag from Rob Herring for patch 1.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v6 to v7 :
>> 
>> *) Addressed Rob Herring comments on patch 1 of the series.
>> *) Addressed Jakub Kicinski comments on patch 4, 5 and 6 of the series.
>> *) Addressed Alok Tiwari comments on Patch 1, 4 and 5 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v5 to v6 :
>> 
>> *) Addressed Simon Horman comments on patch 2, 7 and 11 of the series.
>> *) Addressed Andrew Lunn comments on patch 5 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v4 to v5 :
>> 
>> *) Addressed Andrew Lunn and Keller, Jacob E comments on patch 5 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v3 to v4 :
>> 
>> *) Added support for AM33x and AM43x platforms.
>> *) Removed SOC patch [2] and its dependencies.
>> *) Addressed Jakub Kicinski, MD Danish Anwar and Nishanth Menon comments on
>> cover
>>    letter of the series.
>> *) Addressed Rob Herring comments on patch 1 of the series.
>> *) Addressed Ratheesh Kannoth comments on patch 2 of the series.
>> *) Addressed Maxime Chevallier comments on patch 4 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v2 to v3 :
>> 
>> *) Addressed Conor Dooley comments on patch 1 of the series.
>> *) Addressed Simon Horman comments on patch 2, 3, 4, 5 and 6 of the series.
>> *) Addressed Joe Damato comments on patch 4 of the series.
>> *) Rebased the series on latest net-next.
>> 
>> Changes from v1 to v2 :
>> 
>> *) Addressed Andrew Lunn, Rob Herring comments on patch 1 of the series.
>> *) Addressed Andrew Lunn comments on patch 2, 3, and 4 of the series.
>> *) Addressed Richard Cochran, Jason Xing comments on patch 6 of the series.
>> *) Rebased patchset on next-202401xx linux-next.
>> 
>> [v1] https://lore.kernel.org/all/20250109105600.41297-1-basharath@couthit.com/
>> [v2] https://lore.kernel.org/all/20250124122353.1457174-1-basharath@couthit.com/
>> [v3] https://lore.kernel.org/all/20250214054702.1073139-1-parvathi@couthit.com/
>> [v4] https://lore.kernel.org/all/20250407102528.1048589-1-parvathi@couthit.com/
>> [v5] https://lore.kernel.org/all/20250414113458.1913823-1-parvathi@couthit.com/
>> [v6] https://lore.kernel.org/all/20250423060707.145166-1-parvathi@couthit.com/
>> [v7] https://lore.kernel.org/all/20250503121107.1973888-1-parvathi@couthit.com/
>> [v8] https://lore.kernel.org/all/20250610105721.3063503-1-parvathi@couthit.com/
>> [v9] https://lore.kernel.org/all/20250623135949.254674-1-parvathi@couthit.com/
>> [v10] https://lore.kernel.org/all/20250702140633.1612269-1-parvathi@couthit.com/
>> [v11] https://lore.kernel.org/all/20250722132700.2655208-1-parvathi@couthit.com/
>> [v12] https://lore.kernel.org/all/20250724072535.3062604-1-parvathi@couthit.com/
>> 
>> Thanks and Regards,
>> Parvathi.
>> 
>> Parvathi Pudi (2):
>>   dt-bindings: net: ti: Adds DUAL-EMAC mode support on PRU-ICSS2 for
>>     AM57xx, AM43xx and AM33xx SOCs
>>   net: ti: prueth: Adds IEP support for PRUETH on AM33x, AM43x and AM57x
>>     SOCs
>> 
>> Roger Quadros (3):
>>   net: ti: prueth: Adds ICSSM Ethernet driver
>>   net: ti: prueth: Adds PRUETH HW and SW configuration
>>   net: ti: prueth: Adds link detection, RX and TX support.
>> 
> 
> Can you please use prefix "net: ti: icssm-prueth" instead of net: ti:
> prueth" throughout the series?
> 
> icssg driver uses prefix "net: ti: icssg-prueth" so this will be similar
> to that.
> 
> This way grepping in git log for,
> - icssm will give you only icssm patches
> - icssg will give you only icssg patches
> - prueth will give you both icssm and icssg patches
> 
> --
> Thanks and Regards,
> Md Danish Anwar


We will update the prefix to "net: ti: icssm-prueth" in the next version.


Thanks and Regards,
Parvathi.

