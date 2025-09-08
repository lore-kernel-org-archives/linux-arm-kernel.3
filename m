Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8059CAC581
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 18:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RwHTVi+PZizs+OV4gI3ySDrmg4AiYXrmj6y0oc0TQk0=; b=ioLArIi/ILJfJl
	ndhwAmjzULT1DSETfNxnW6Pg3Jmzx8ZbGmHAb0vPMeNzSwBIUEErw/vW+Mwo+aLNSo/bJObBjhllM
	BcF0XU07RLfU7hRkvSwTVvN0GV2BPR6nxaSh1aBbH9252v2jsbJuuEidTtLFQU1UGr7uSSIxhzgBq
	hTYejg4NQClHJS//TNKjZkUX0nOg7vya8ffzMs9x/u0ijChmiM5rp6Gdzgq9hd5Uz9rPbJ/2WGIc+
	s3IApe1fcGzbIjI92g9ctLTVz/WUejEyQyIF5g5TUXVWYYrNuaXms4VriNqSv0Svpb0loRTFSsd+U
	1Xsohiw0CSKkY2Kcc7pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvgF1-00000001Ot8-1VnC;
	Mon, 08 Sep 2025 18:05:23 +0000
Received: from server.couthit.com ([162.240.164.96])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvdD8-00000000Ed2-1icH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 14:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RwHTVi+PZizs+OV4gI3ySDrmg4AiYXrmj6y0oc0TQk0=; b=FWdgS11tTW2FrsBTA33kGxMseO
	2hxuaDQJNQX0m+psQxLqNUbQ80jTTeH5FtQGcZKYp3oubAx8OI2NGrRvoIsFkk/ST+WciC1t5Nwip
	DU2rbZbrkpTUvzV8VzecBb6z2DbY1c8VWLCqb5uS3d/hx4aLSgVXZSMDXuw3JrqvhksdRZKd6OgEa
	UpYPkd0z9iBZ7PsqtdzYHPNv1fPipuVELxLOWnbz2wAFna2ULbdohzG6tndYfND8tlSKFMpBDdY+B
	eflnKZ8oaUlPtWpO9G5xFyU6gsMxAcB6T7QImo/1TEk1d6m6dW1I+9XW9BKmjzeAuJKhBLIib9BSS
	ov0asiIA==;
Received: from [122.175.9.182] (port=63034 helo=zimbra.couthit.local)
	by server.couthit.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <parvathi@couthit.com>)
	id 1uvdCP-0000000G7f7-2Izr;
	Mon, 08 Sep 2025 10:50:30 -0400
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id C652D1781F3C;
	Mon,  8 Sep 2025 20:20:20 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 968B41783FF8;
	Mon,  8 Sep 2025 20:20:20 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id oaVUIR3lcc0B; Mon,  8 Sep 2025 20:20:20 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 44B6B1781F3C;
	Mon,  8 Sep 2025 20:20:20 +0530 (IST)
Date: Mon, 8 Sep 2025 20:20:20 +0530 (IST)
From: Parvathi Pudi <parvathi@couthit.com>
To: kuba <kuba@kernel.org>
Message-ID: <974157264.314549.1757343020136.JavaMail.zimbra@couthit.local>
In-Reply-To: <20250905183151.6a0d832a@kernel.org>
References: <20250904101729.693330-1-parvathi@couthit.com> <20250905183151.6a0d832a@kernel.org>
Subject: Re: [PATCH net-next v15 0/5] PRU-ICSSM Ethernet Driver
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.10.10.103]
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - GC138 (Linux)/8.8.15_GA_3968)
Thread-Topic: PRU-ICSSM Ethernet Driver
Thread-Index: lBuvfkt+lp1JesCVjb5URBl/aXb/jg==
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
X-CRM114-CacheID: sfid-20250908_075114_474115_C1A5F7AB 
X-CRM114-Status: UNSURE (   5.81  )
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
Cc: pratheesh <pratheesh@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, praneeth <praneeth@ti.com>, edumazet <edumazet@google.com>, glaroque <glaroque@baylibre.com>, pmohan <pmohan@couthit.com>, diogo ivo <diogo.ivo@siemens.com>, robh <robh@kernel.org>, krishna <krishna@couthit.com>, javier carrasco cruz <javier.carrasco.cruz@gmail.com>, saikrishnag <saikrishnag@marvell.com>, m-karicheri2 <m-karicheri2@ti.com>, Bastien Curutchet <bastien.curutchet@bootlin.com>, mohan <mohan@couthit.com>, jacob e keller <jacob.e.keller@intel.com>, pabeni <pabeni@redhat.com>, s hauer <s.hauer@pengutronix.de>, devicetree <devicetree@vger.kernel.org>, conor+dt <conor+dt@kernel.org>, ALOK TIWARI <alok.a.tiwari@oracle.com>, richardcochran <richardcochran@gmail.com>, johan <johan@kernel.org>, Prajith Jayarajan <prajith@ti.com>, rogerq <rogerq@kernel.org>, basharath <basharath@couthit.com>, ssantosh <ssantosh@kernel.org>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, rogerq <rogerq@ti.com>, srk <srk@ti.com>, kory maincent <kory.maincent@bootlin.com>, m-malladi <m-malladi@ti.com>, netdev <netdev@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, danishanwar <danishanwar@ti.com>, afd <afd@ti.com>, andrew+netdev <andrew+netdev@lunn.ch>, parvathi <parvathi@couthit.com>, horms <horms@kernel.org>, michal swiatkowski <michal.swiatkowski@linux.intel.com>, krzk+dt <krzk+dt@kernel.org>, davem <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi,

> On Thu,  4 Sep 2025 15:45:37 +0530 Parvathi Pudi wrote:
>> The Programmable Real-Time Unit Industrial Communication Sub-system (PRU-ICSS)
>> is available on the TI SOCs in two flavors: Gigabit ICSS (ICSSG) and the older
>> Megabit ICSS (ICSSM).
> 
> Looks like the new code is not covered by the existing MAINTAINERS
> entries. Who is expected to be maintaining the new driver?
> Please consult:
> https://docs.kernel.org/next/maintainer/feature-and-driver-maintainers.html


We will update the MAINTAINERS information in a separate patch to this series and share
the next version soon.


Thanks and Regards,
Parvathi.

