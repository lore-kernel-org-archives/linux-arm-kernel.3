Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C22CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=au0sTz/mm51+Sa4SRsMXgzQ5QH8WFCLiHSCeaH4jd3Y=; b=P4/2KlRCx8oTBh
	VidMbjlhJrXy77bkVwpM0ryoI4SxttyjtPhS0VyuJQjwves2TAdRwzJ6oFr1kaq/836LATpHqR+uR
	vE6mFy5O4QLiWGuLZ6GMKS52tLV5JEQqGLr1YuCAkFXF9QE/edH4IghQ6gnMWvYoaAZFv5FBzhrlp
	DhkXv/TXmP8Km9aG8PWtMLsSXB75aIRqe2UaAknIBQ8aC5mqwP78a7VebiPpFIcCNfoNIYPX8DkRz
	NBzBir1LeZjxQggJHEYTcegesBUyDGrAR5q3FidI6xAFX5HgOQQ0dI17cpEqRfy93DYPgP9orXrWc
	1Jb32hx8F9LNoZYrls9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1B7-00000007prK-1uU4;
	Mon, 18 Aug 2025 14:49:41 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unzdd-00000007PRt-17N8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 13:11:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=au0sTz/mm51+Sa4SRsMXgzQ5QH8WFCLiHSCeaH4jd3Y=; b=C6YX7csNdrLRHWSgSvP1mSzkpT
	UJi4OaAf6/9RVP7vxZOs0dUgljVQrkiR2XtkmqX8uzP3OzTt6YNZTZA1TwrZ0sTJbOA1qs8rkxltG
	F5l+bi9JhRl5Q9F4rgzkW9pG76GmCEaCg4JQuULtpLfwYqbPQjTjpyqpc0y8z2JlJmZCGGeun1RgN
	GuosDbCfIpQagSF4TEvMm7EMku1SB2O8+UiJxbxK37BF8yF9sYmrbyJ4/ZWhWcPp3wtRLdWIUx7eB
	Kv4JxXfIRKw3IOifi9jboHfDpNbM5FHMvfD/R7tVH7ogcOWK9eOc2Z5gCpTdixRtIBbkRjqrGiABS
	EZk1/Mlg==;
Received: from [122.175.9.182] (port=51937 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1unzcl-0000000EI4Q-3NDO;
	Mon, 18 Aug 2025 09:10:08 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5A75317816C0;
	Mon, 18 Aug 2025 18:39:38 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 345C21781E41;
	Mon, 18 Aug 2025 18:39:38 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id QVAtmhKDmHst; Mon, 18 Aug 2025 18:39:38 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id CF63D17816C0;
	Mon, 18 Aug 2025 18:39:37 +0530 (IST)
Date: Mon, 18 Aug 2025 18:39:37 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250815115956.0f36ae06@kernel.org>
References: <20250812110723.4116929-1-parvathi@couthit.com> <20250812133534.4119053-5-parvathi@couthit.com> <20250815115956.0f36ae06@kernel.org>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Mac)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: xgy3E4VeZd17NU5MI/nMZAk8d4Qe8Q==
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
X-CRM114-CacheID: sfid-20250818_061101_528674_5D81B91B 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan@kernel.org, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Tue, 12 Aug 2025 19:04:19 +0530 Parvathi Pudi wrote:
>> +static irqreturn_t icssm_emac_rx_packets(struct prueth_emac *emac, int quota)
> 
> Please stick to calling the budget budget rather than synonym terms
> like "quota". Makes it harder to review the code.
> 

We will address this in the next version.

>> +	/* search host queues for packets */
>> +	for (i = start_queue; i <= end_queue; i++) {
>> +		queue_desc = emac->rx_queue_descs + i;
>> +		rxqueue = &queue_infos[PRUETH_PORT_HOST][i];
> 
> budget can be 0, in which case the driver is not supposed to process
> Rx, just Tx (if the NAPI instance is used to serve completions).
> 

We will add the following check to handle the case when NAPI
calls with a zero budget.

@@ -766,6 +766,10 @@ static irqreturn_t icssm_emac_rx_packets(struct prueth_emac *emac, int budget)
        start_queue = emac->rx_queue_start;
        end_queue = emac->rx_queue_end;
 
+       /* skip Rx if budget is 0 */
+       if (!budget)
+               return 0;
+
        /* search host queues for packets */
        for (i = start_queue; i <= end_queue; i++) {
                queue_desc = emac->rx_queue_descs + i;

We will address this in the next version.

>> +	num_rx_packets = icssm_emac_rx_packets(emac, budget);
>> +	if (num_rx_packets < budget) {
>> +		napi_complete_done(napi, num_rx_packets);
> 
> don't ignore the return value of napi_complete_done()
> --

We will update the code to check the return value of napi_complete_done()
as shown below.

@@ -840,10 +844,9 @@ static int icssm_emac_napi_poll(struct napi_struct *napi, int budget)
        int num_rx_packets;
 
        num_rx_packets = icssm_emac_rx_packets(emac, budget);
-       if (num_rx_packets < budget) {
-               napi_complete_done(napi, num_rx_packets);
+
+       if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
                enable_irq(emac->rx_irq);
-       }
 
        return num_rx_packets;
 }

We will address this in the next version.


Thanks and Regards,
Parvathi.

