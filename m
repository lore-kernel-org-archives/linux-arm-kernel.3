Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0481AC9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ev1RphJmOUwTwyP1Zq1ADAaAbeAIOq+4OhI9af6F6U=; b=Tsnd/B4Q18JXoxA30TOKWDHYMx
	1SnYgCQKA+eZwYLvjaC0eSgydQ8SM5oo78evomXUSwxleTC6luQlIyKJkVuekKiXhKe4YejDlV7F7
	IhvEDoI0/+L/GZQeZtuzIW0fytoK80LDAOmaGerEY4X1+egpoHkMmtK1yuJ8PJCmxRJqOkdMq84QF
	wNXWB3tUOm4fKXgJjMDi5gU78yPU1bPx1CWoBh+93CRDnRdYl0ngFKcMBX25meat3hQ1FIX/AXu/v
	fsRO7LNOUhV7IhWQpGgjUXoXNJTbD0TnLZ35TDMduuKRXoL1ELO4/8jhqVCJzjSxZHn6h6QdgyXMm
	5od6f+ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5dd-0000000HWhH-36RI;
	Mon, 28 Sep 2026 07:19:01 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB5da-0000000HWfl-238m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 07:19:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 424CEC5CD4B;
	Mon, 28 Sep 2026 07:19:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21E58601BD;
	Mon, 28 Sep 2026 07:18:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A879E102F1E76;
	Mon, 28 Sep 2026 09:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790579933; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=9ev1RphJmOUwTwyP1Zq1ADAaAbeAIOq+4OhI9af6F6U=;
	b=ITUSOQjF8Or/MddMYmkAfGrRpGJFB+t50R0v/RALVTMUn6bdVFoa6B02oRNTTSgva9y3H0
	HuXtZpygzofKnNumRcfAg6UvmvoklYRh76irvYhx3nJIcTuq/SG8qC8mxHs6afUYK1jAjO
	4Y6kNsjEc2uJxbN6uERvaVuZUPJ4wuNdOY+Gx8TMvlPYmc9G5Of4x9/o9EEwQ6OVTjt6Ax
	BPTgEmiZzDgg0eU/lRCOMVfZW38i99XzpDQCzErX9u4CXSlmrxzOTZWWtDnty9+oVrlYvq
	1DixhozDTnTuU1dqgfO7IAtopMgaI2lyl7o73Xb6AaLpyxZaGKVLT39xkodqhg==
Message-ID: <2cd3b581-2f8f-4e46-a487-a03a3c45a8cf@bootlin.com>
Date: Mon, 28 Sep 2026 09:18:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: stmmac: Don't set or get RSS parameters when not
 supported
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Russell King <linux@armlinux.org.uk>,
 Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
 thomas.petazzoni@bootlin.com, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20260926093343.292181-1-maxime.chevallier@bootlin.com>
 <20260927154603.47253d19@kernel.org>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260927154603.47253d19@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_001858_700293_FD2F9F03 
X-CRM114-Status: UNSURE (   7.29  )
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

On 9/28/26 00:46, Jakub Kicinski wrote:
> On Sat, 26 Sep 2026 11:33:41 +0200 Maxime Chevallier wrote:
>> The RSS kselftests fail on stmmac, and this is partly due to the driver
>> reporting bogus data for the RSS ops :
>>
>>  - ethtool -x reports an indirection table and a key while the hardware
>>    doesn't have any of that
>>  - ethtool -X fails with -EINVAL.
> 
> this is net-next material

Fair, I'll iterate with Nicolai's fix.

Thanks,

Maxime

