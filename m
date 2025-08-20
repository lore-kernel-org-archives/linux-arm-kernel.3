Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38353CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kjyyibg+wnsB9xvjdEV1H8HvE9Jnw2qmWLH9c5mLoEg=; b=od56fzrtyR6uKQ
	Aapfa3Q04BWjHiTR/BAG0g5O1+A9BBAJdJUVec7x84aqEKcvQhZ/MnxNGek2+e+0N+RINndrCJO/L
	HoEs0VTMPjdfRXqLSgYxAkxcgHuyEWMgjfuESCS8l2XYSyCyz+h+RP50QREwcyZKc5SFTFhX6SQpu
	IL2jqc6BUjT+3vWIn4TXfK6YUj6iq5ltFdFOQpkOCuE1FC3dhpjq8jw/9UPQ50AkXzTuLwjJqYxtM
	6XW0N3qkR5HQFtvb9r5fYXJIC9eQ4FhVbGy0gGNHODC8o6YHFi47jzmxnPil2m3sIWstCzMfD0XrW
	vfLdJF/W0qP89sxbpPjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojBc-0000000DtWL-0kUb;
	Wed, 20 Aug 2025 13:49:08 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiYv-0000000DiSC-1AgO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Kjyyibg+wnsB9xvjdEV1H8HvE9Jnw2qmWLH9c5mLoEg=; b=CU2fgwUW+jWZmeRnhjwoWTpuFM
	ABZ7xClo+oMu9gFyv3so9YBfaiwHpECY8HzfCgyBGmWYNrdnTiJwgkOs9DQ8G2KC/fUMKMoYIOGhj
	RE187O8Y4wl0BRCg6uu8SWDRJOo/ZLk+GUFImIfQuVJuJm8DX22f9G7XRsl5XRhtm1UeEpOa0hYNE
	8k+ZSCX4fk/rnyD0goX1zuBsLgT/raxu/nDlaqqXmN/gwP0MGkb6TSQ5B2F6DrlRJJF8N8gvpRqdg
	rUUHOc17XgFUG9//riERJikPBR/qwT8OrwEbhj2x9XkgiJLpWphsPYtGnzvXff/sFaWh6iw6vlyy+
	nfyhragw==;
Received: from [122.175.9.182] (port=64641 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uoiYC-0000000GE8f-2wAe;
	Wed, 20 Aug 2025 09:08:24 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 5878E1781A82;
	Wed, 20 Aug 2025 18:38:18 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 32FE417823F4;
	Wed, 20 Aug 2025 18:38:18 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ygfb58BmiwQo; Wed, 20 Aug 2025 18:38:18 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id D5D421781A82;
	Wed, 20 Aug 2025 18:38:17 +0530 (IST)
Date: Wed, 20 Aug 2025 18:38:17 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <1714979234.207867.1755695297667.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250818084020.378678a7@kernel.org>
References: <20250812110723.4116929-1-parvathi@couthit.com> <20250812133534.4119053-5-parvathi@couthit.com> <20250815115956.0f36ae06@kernel.org> <1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local> <20250818084020.378678a7@kernel.org>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: rWG3COPtPBb60rDF6O1ULILOZDFtmA==
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
X-CRM114-CacheID: sfid-20250820_060909_344754_6337A181 
X-CRM114-Status: UNSURE (   4.11  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, krishna <krishna@couthit.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Mon, 18 Aug 2025 18:39:37 +0530 (IST) Parvathi Pudi wrote:
>> +       if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
>>                 enable_irq(emac->rx_irq);
>> -       }
>>  
>>         return num_rx_packets;
>>  }
>> 
>> We will address this in the next version.
> 
> Ideally:
> 
>	if (num_rx < budget && napi_complete_done()) {
>		enable_irq();
>		return num_rx;
>	}
> 
> 	return budget;

However, if num_rx < budget and if napi_complete_done() is false, then
instead of returning the num_rx the above code will return budget.

So, unless I am missing something, the previous logic seems correct to me.
Please let me know otherwise.


Thanks and Regards,
Parvathi.

