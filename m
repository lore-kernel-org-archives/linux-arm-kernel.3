Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C70CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MP8TZmTt1aO0rpPA1VlRUx+vlzVRWV5nJEBr4K4uwl0=; b=xR3ta33vyt1PX1
	mmpnioj1nH+/G0qeiHJWjHiruj3SDmyeb2zLRrGOa+L+PE7hIb5UoT0lmwX9Kz7OzEemQplzVjAxw
	4Q4tGGUhkyC+cSx2WhnPohKQpFhp6hhcD8EgXNWOITUktrK61D7u5hI8Wc9iiXvSlnYJovrGDKQYq
	Z+tf+isqSKK3ndAo38NuFV9cSqu7hHH9Z7mNq/YkaMqOeSjzDDuFXhV50Fa98d3TVtRCf9jF0SSdn
	XLlJdi4aoKTBe33oEOFrJQiCrivxRazHfzk59pFu3XXVydUMjMbs8rjNVsjD7U6olbhYqVfD5o/uG
	Mik8Nj1dvS/ObzS2Qzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4a6-0000000GvUd-2udV;
	Thu, 21 Aug 2025 12:39:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Rm-0000000GZoH-0mFf
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 10:23:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MP8TZmTt1aO0rpPA1VlRUx+vlzVRWV5nJEBr4K4uwl0=; b=nav/Nch8kmimts1u7OWCbsFSyo
	PZh3GNQjbHy1YsjRP/wZrcGXnUEC+VsCNGij7y0HwgxzAMgg3z4EAphqch2EEV2OwUriHRoHCxqqu
	e7umoXMAArSR1KrIz0s+a62e3WJsZ30k/RorEwJkVjzgxIvAu5AHJTUE0hjDXmzKRtZjk475CbxEG
	PV9g8Wj1frllN6dUH08vD9g4VmM/GzY754a2/HJ88R1wZnty6uevvBpehmR1OfpIL9Dydhq7rQptl
	JZhw8v8DqlojfjT3G8pLcOUC6KYEcF5zrAgIFYp44/MxVHUBPslNy1zOTMsSkuDtGjEWExnNcq+PK
	fiug8nXQ==;
Received: from server.couthit.com ([162.240.164.96])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up2Ri-00000000WNc-1lsO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 10:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=MP8TZmTt1aO0rpPA1VlRUx+vlzVRWV5nJEBr4K4uwl0=; b=qz2uZRObXNze480DbNKjv5VPkW
	YLo9HqggwTP8dZEICRHFewux8E07N0TBIU5w/8BTYnnffMxo8cFxSMQFe0SRy9oSEaxi33XTtOKtD
	MXsL7ZvbvzkoMQYLm5d2nbOthDU6MHPR8kSuPTI3yQuzWT8GkpbXSWiUCvVqntGKF7aH2P4+q3DuV
	adYAf3QzqqcjC1YUQOpxbnTpoKJ+Z+3WI1XiCM4BD0b4/U1AtS3fi294mb62emLGR83Ewao7/o8CF
	df38ChQn9qVjHEm113uAnE4dV0i+WJSPVN53eKbVrxm3ofBKaJ/BUInqskoCT4DRcQBP/SPyl1qSX
	Azz7/mmg==;
Received: from [122.175.9.182] (port=17203 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1up2Qu-0000000H5N8-2MGl;
	Thu, 21 Aug 2025 06:22:13 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 3ECC81781F9F;
	Thu, 21 Aug 2025 15:52:06 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 159FC17823D4;
	Thu, 21 Aug 2025 15:52:06 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id vjuA_uO9NEBg; Thu, 21 Aug 2025 15:52:05 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id B84611781F9F;
	Thu, 21 Aug 2025 15:52:05 +0530 (IST)
Date: Thu, 21 Aug 2025 15:52:05 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <641170813.212171.1755771725482.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250820081713.2d243c55@kernel.org>
References: <20250812110723.4116929-1-parvathi@couthit.com> <20250812133534.4119053-5-parvathi@couthit.com> <20250815115956.0f36ae06@kernel.org> <1969814282.190581.1755522577590.JavaMail.zimbra@couthit.local> <20250818084020.378678a7@kernel.org> <1714979234.207867.1755695297667.JavaMail.zimbra@couthit.local> <20250820081713.2d243c55@kernel.org>
Subject: Re: [PATCH net-next v13 4/5] net: ti: prueth: Adds link detection,
 RX and TX support.
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds link detection, RX and TX support.
Thread-Index: 0Ddp1f2DlVt3suYoV83jhextCZCwAQ==
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
X-CRM114-CacheID: sfid-20250821_112303_085601_A739AECE 
X-CRM114-Status: UNSURE (   6.52  )
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

> On Wed, 20 Aug 2025 18:38:17 +0530 (IST) Parvathi Pudi wrote:
>> > On Mon, 18 Aug 2025 18:39:37 +0530 (IST) Parvathi Pudi wrote:
>> >> +       if (num_rx_packets < budget && napi_complete_done(napi, num_rx_packets))
>> >>                 enable_irq(emac->rx_irq);
>> >> -       }
>> >>  
>> >>         return num_rx_packets;
>> >>  }
>> >> 
>> >> We will address this in the next version.
>> > 
>> > Ideally:
>> > 
>> >	if (num_rx < budget && napi_complete_done()) {
>> >		enable_irq();
>> >		return num_rx;
>> >	}
>> > 
>> > 	return budget;
>> 
>> However, if num_rx < budget and if napi_complete_done() is false, then
>> instead of returning the num_rx the above code will return budget.
>> 
>> So, unless I am missing something, the previous logic seems correct to me.
>> Please let me know otherwise.
> 
> IIRC either way is fine, as long as num_rx doesn't go over budget.

Sure. We will address this in the next version.


Thanks and Regards,
Parvathi.

