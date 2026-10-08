Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44E1CC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98BllSELTtMwTS9G4NJHiYpWYpGi2N2kFgYm1YlwlnM=; b=yT5F0j6T8YyGGjhY5rBh0yEhlu
	C14fMyaVFoVnWcQK4Uy2dVS8CS/sVexHtMPjwq1NV8BKBHpfXW4pM6uOiwcb8DCukK/13Be88U2Ji
	UccgAIrLKxUlUpxAxtIsystR6YPm2dAQXsZAp3M3zHA2HgRNAl3x6E5ybfYBYM043gePExE3RFAE5
	vI9SiyDay8ElEK4UAulpLJh1p24xiZT4l2x6V62C4fQz+snBTKclZnUSE7xr+I4KhbFdBkv7dZw+w
	y4sVEH4h+Libqk9h4lBpE2DaX+h8iR9JvJMtNQTQdgI2Davo4YC4BjdwT+OkwZTu5+MZtynsrYAfX
	sQVBepNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGge5-0000000Dkza-0reO;
	Tue, 13 Oct 2026 17:50:37 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGge1-0000000Dkz4-2kaV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:50:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 279ED4E41214
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E71BB60362
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 17:50:31 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 6344111D717E5; Tue, 13 Oct 2026 19:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913831; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=98BllSELTtMwTS9G4NJHiYpWYpGi2N2kFgYm1YlwlnM=;
	b=woG/hwgRlsjKvXVi8wIYh8rzCTc2yizq+Wm6nknvGc8453HeN+v/G2cWlZ550h4ibhRC3Y
	Y9maRbPxzvUXeBD5Dw9YEeMhn5u4iPn8wX6MwiNNDmV5hjdgLRZhHHXcONPxaIiSW7HUyv
	5k11lxGgu4dlJJOaVC4htAsCIgepgAQakv8QzN2+APqDWlk9SRDMhxDvdPTqkz9nX97HFD
	oj7nP7Qk5OqB2uLSVbu577rqHxv/NXSC4hNPwGTwzENYPpc4IMxya3UgXYGb7p7XYCkb2f
	E914UyGM51toQXQTsyTx4a75NmMDLaSeS7IGDtRWzMNWmgTRKVNHdOhSEtxq1Q==
Authentication-Results: mail.galae.net;
	none
Message-ID: <7128e50a-20f9-44c6-89d2-6322706ab6e7@bootlin.com>
Date: Thu, 8 Oct 2026 11:19:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: ptp: switch to gettimex64()
 interface
To: Nicolai Buchwitz <nb@tipi-net.de>, James Clark <jjc@jclark.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261006103610.98277-1-jjc@jclark.com>
 <573ab838519f1fcfc19b5c03c23aa72f@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <573ab838519f1fcfc19b5c03c23aa72f@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 6344111D717E5
X-Spamd-Result: default: False [2.38 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[128];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.02)[49.90%];
	RCVD_COUNT_ZERO(0.00)[0];
	BCC(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[infradead.org:email,localhost:rdns,localhost:helo,jclark.com:email,lunn.ch:email,stormreply.com:email,tipi-net.de:email,bootlin.com:email,bootlin.com:mid,bootlin.com:url,galae.net:url,davemloft.net:email,st.com:email];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	TO_DN_SOME(0.00)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_105035_005975_886C3A1A 
X-CRM114-Status: GOOD (  19.54  )
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

Hi,

On 10/8/26 09:44, Nicolai Buchwitz wrote:
> Hi James
> 
> On 6.10.2026 12:36, James Clark wrote:
>> The stmmac PTP support currently implements the gettime64 callback to
>> retrieve the hardware clock time. Update the implementation to provide
>> the gettimex64 callback instead, adding support for the
>> PTP_SYS_OFFSET_EXTENDED ioctl.
>>
>> The system clock readings are taken around the read of the nanoseconds
>> register in get_systime(), so get_systime() gains a ptp_system_timestamp
>> argument. rmb() is used to ensure proper ordering on weakly ordered
>> architectures.
>>
>> Assisted-by: LLM
>> Signed-off-by: James Clark <jjc@jclark.com>
>> ---
>> Tested on a Radxa ZERO 3E (RK3566, DWMAC 4/5) running net-next.
>> Width of the interval between the two system clock readings
>> bracketing each PHC read (2000 calls of 25 samples each):
>>
>>                                          min      median
>> Before patch (PTP_SYS_OFFSET):           875 ns   1167 ns
>> After patch (PTP_SYS_OFFSET_EXTENDED):   291 ns    584 ns
>>
>> On this board the 24 MHz arch timer counter advances in steps of 7
>> (~292 ns), so all intervals are multiples of that.
> 
>> [...]
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> 
>> [...]
> 
>> @@ -191,8 +192,14 @@ static void get_systime(void __iomem *ioaddr, u64 *systime)
>>      sec1 = readl_relaxed(ioaddr + PTP_STSR);
>>      do {
>>          sec0 = sec1;
>> +        ptp_read_system_prets(sts);
>> +        if (sts)
>> +            rmb();
>>          /* Get the TSSS value */
>>          ns = readl_relaxed(ioaddr + PTP_STNSR);
>> +        if (sts)
>> +            rmb();
>> +        ptp_read_system_postts(sts);
> 
> Additional thought while testing on my stm32mp2:
> 
> Would a plain readl() for PTP_STNSR be enough? readl() completes before
> a following delay loop, which is the counter read postts does. That would
> drop both barriers, like igb/ice/bnxt. Fine either way though, macb has
> the same rmb() pattern.
> 
> Maxime (Chevallier), what do you think?

I agree yes, I was also wondering about just going to non-relaxed accessor
and drop the barriers.

Maxime

> 
>> [...]
> 
> Thanks,
> Nicolai

text:
Return-Path: <netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org>
Delivered-To: maxime.chevallier@bootlin.com
Received: from mail.galae.net ([172.22.1.253])
	by 9e7fea892943 with LMTP
	id +FVJBOtjx2qxohkAtaWaaQ
	(envelope-from <netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org>)
	for <maxime.chevallier@bootlin.com>; Thu, 08 Oct 2026 11:35:39 +0200
X-Original-To: maxime.chevallier@bootlin.com
Received: from smtpin-01.galae.net (smtpin-01.galae.net [51.159.2.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.galae.net (Postcow) with ESMTPS id 95EDC1033384F
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 11:35:38 +0200 (CEST)
Authentication-Results: mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=I2YO4Lc3;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com;
	s=dkim; t=1791452138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:
	 list-unsubscribe:list-subscribe:dkim-signature;
	bh=fc5888mWb8lAIOg0TPjlG3hoHc4rEV/sI/NmUpZbsXM=;
	b=DaFgEqVZWiQxsl7uYGuAaXNr9mCcveu/ceMgNIliRB4WycWftcgENB9jy6hTWyLIuS8lL1
	vO1vLH0fTXEdykYd/eb6xe+DbWLHR9A/S2twPhXD2vsLHL+L4mqTiYSFo/ZVRGAWO95+NP
	WozngkxgoCCK5T/ewIK7j7rymSkMbr0bv6sErmDuXpXsTz/UUVIh81Ch9Xl1p4q9v89J0e
	HOQSaw18rmBGqFU5Q69S80iD8khpz3BDX+i5/oPvl2npq7xoqKde7BjQruxUazQTJ6JoYq
	wlwo7jHZSMEoWNsAeSvzOSRvp/qBfiKD+KzSV8sIuB2VXvUtCu0sdA+uctal3Q==
ARC-Authentication-Results: i=2;
	mail.galae.net;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=I2YO4Lc3;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1");
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.galae.net: domain of "netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="netdev+bounces-342857-maxime.chevallier=bootlin.com@vger.kernel.org"
ARC-Seal: i=2; s=dkim; d=bootlin.com; t=1791452138; a=rsa-sha256; cv=pass;
	b=u82zaV7isC9ONMThro9N0PAeSlhBjaks1O9jSIfvFfyhFunNiYSArxUAFYS8uHU0WeqW1Y
	KGGLXQHkelwiKeKHfAjOblnvWFnjmpPjQBJdkDin/L61+q4Ie/oxGki9LbdooNwKpsEQZ0
	8zqrUZaJrw+HTL39wkcdTZnkFuxouGHVbrOJ7/fT8cokMj/3S2UavFCPDz3LVfVAn4djxC
	nJeUEpt+8Y0BedXKiG4KgEueZnKXdR42jT+H1Uf0PcmkyYBjr9psbYPdOU2dT5dHPkHd7D
	0SCD+UMo6fb2X+ZdX6x7t9H4DxX96s0TlgK7/XSeDifl/3fK6ADs74brQ5M6YA==
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by smtpin-01.galae.net (Postfix) with ESMTPS id 0AEC0342E05
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 09:35:38 +0000 (UTC)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22BBD61B6C
	for <maxime.chevallier@bootlin.com>; Thu,  8 Oct 2026 09:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3653D48380C;
	Thu,  8 Oct 2026 09:19:37 +0000 (UTC)
X-Original-To: netdev@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32523BB130;
	Thu,  8 Oct 2026 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451175; cv=none; b=GqB0xCF/D3VJ6sOiZ2Ya0DovS7wj/JoyhZ2biJqPcIkbfp++APckoW3Fb1a1j5bz1KDtQQJ2ncJsPhE115PYWI0uc9lTbXQcuYyGs+WKE/tR8EoOQSqtvIEPhAWTgYwZL0wRPUu07w313Q2IjSyFUDc/orLv+uiBGW3CVC+i2VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451175; c=relaxed/simple;
	bh=oEsORVwhMiT5sbAk7DzWvYEw+G8J2qu3/NGjKjCwggU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KdpadSprJJD0+gnAWQpARdCqpsHZ1UovlelI6BPsq9uD/R9VjQAYqXancEokoAj3A8ftNrxljyJGdGvBBntekIwrP5IRIMbPE+JrY10XngHxDpzg0QvCIl1TQgz5aPJBqVaVKR9BfP6F8mIR7tE+IZYPtgh8/MMfi3qN1SYr6Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=I2YO4Lc3; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A9A564E4114B;
	Thu,  8 Oct 2026 09:19:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 76AB960341;
	Thu,  8 Oct 2026 09:19:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BE4F51033385F;
	Thu,  8 Oct 2026 11:19:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791451161; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fc5888mWb8lAIOg0TPjlG3hoHc4rEV/sI/NmUpZbsXM=;
	b=I2YO4Lc3oGxBcjpnypvPP2m5eoAqnV5yHOuPpXJs+ZvGq9mSflpuzoPAKVleiaY4DpENdj
	AwtJoXh154tQcYDLQRPhI5/KeGXkSCru9B5Gb1YrYz91aI0jDcCsGs1W9sPFJ1/GFG51tf
	/fIs5vgPG8VJ5fyUzVIPLdYU82cVZzQK//PqivS7uQ1ZDbMgmtcQbhCNrQtGR6A2In5ZoM
	xnmYUVOhYP2tA+jjBtk+vuk13KuU1JDzi0zCWUhBqVPOvRlkWl4MEfZK6ooq2NfX/RP07f
	HrOQquYfSRy2ahaKs+bptqRbINy795st+vAgYc3ZADx4wMxYymAHX0tZ+aIHqQ==
Message-ID: <7128e50a-20f9-44c6-89d2-6322706ab6e7@bootlin.com>
Date: Thu, 8 Oct 2026 11:19:17 +0200
Precedence: bulk
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: stmmac: ptp: switch to gettimex64()
 interface
To: Nicolai Buchwitz <nb@tipi-net.de>, James Clark <jjc@jclark.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>,
 Miroslav Lichvar <mlichvar@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261006103610.98277-1-jjc@jclark.com>
 <573ab838519f1fcfc19b5c03c23aa72f@tipi-net.de>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <573ab838519f1fcfc19b5c03c23aa72f@tipi-net.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-2.15 / 30.00];
	SUSPICIOUS_RECIPS(1.50)[];
	IP_REPUTATION_HAM(-1.41)[asn: 63949(-0.40), country: SG(-0.01), ip: 172.234.253.10(-1.00)];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAYES_HAM(-0.07)[58.44%];
	HAS_LIST_UNSUB(-0.01)[];
	MX_GOOD(-0.01)[];
	TAGGED_FROM(0.00)[bounces-342857-maxime.chevallier=bootlin.com];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_MAILCOW_DOMAIN(0.00)[bootlin.com];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	TO_DN_SOME(0.00)[];
	BCC(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[172.234.253.10:from];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ARC_SIGNED(0.00)[bootlin.com:s=dkim:i=2];
	DNSWL_BLOCKED(0.00)[212.83.139.233:received,100.90.174.1:received,212.83.136.155:received,172.234.253.10:from,185.246.85.4:received];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maxime.chevallier@bootlin.com,netdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lunn.ch,davemloft.net,kernel.org,redhat.com,gmail.com,foss.st.com,st-md-mailman.stormreply.com,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[netdev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DWL_DNSWL_BLOCKED(0.00)[bootlin.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	EXTERNAL_RELAY_AUTHENTICATED(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95EDC1033384F

Hi,

On 10/8/26 09:44, Nicolai Buchwitz wrote:
> Hi James
> 
> On 6.10.2026 12:36, James Clark wrote:
>> The stmmac PTP support currently implements the gettime64 callback to
>> retrieve the hardware clock time. Update the implementation to provide
>> the gettimex64 callback instead, adding support for the
>> PTP_SYS_OFFSET_EXTENDED ioctl.
>>
>> The system clock readings are taken around the read of the nanoseconds
>> register in get_systime(), so get_systime() gains a ptp_system_timestamp
>> argument. rmb() is used to ensure proper ordering on weakly ordered
>> architectures.
>>
>> Assisted-by: LLM
>> Signed-off-by: James Clark <jjc@jclark.com>
>> ---
>> Tested on a Radxa ZERO 3E (RK3566, DWMAC 4/5) running net-next.
>> Width of the interval between the two system clock readings
>> bracketing each PHC read (2000 calls of 25 samples each):
>>
>>                                          min      median
>> Before patch (PTP_SYS_OFFSET):           875 ns   1167 ns
>> After patch (PTP_SYS_OFFSET_EXTENDED):   291 ns    584 ns
>>
>> On this board the 24 MHz arch timer counter advances in steps of 7
>> (~292 ns), so all intervals are multiples of that.
> 
>> [...]
> 
>> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> 
>> [...]
> 
>> @@ -191,8 +192,14 @@ static void get_systime(void __iomem *ioaddr, u64 *systime)
>>      sec1 = readl_relaxed(ioaddr + PTP_STSR);
>>      do {
>>          sec0 = sec1;
>> +        ptp_read_system_prets(sts);
>> +        if (sts)
>> +            rmb();
>>          /* Get the TSSS value */
>>          ns = readl_relaxed(ioaddr + PTP_STNSR);
>> +        if (sts)
>> +            rmb();
>> +        ptp_read_system_postts(sts);
> 
> Additional thought while testing on my stm32mp2:
> 
> Would a plain readl() for PTP_STNSR be enough? readl() completes before
> a following delay loop, which is the counter read postts does. That would
> drop both barriers, like igb/ice/bnxt. Fine either way though, macb has
> the same rmb() pattern.
> 
> Maxime (Chevallier), what do you think?

I agree yes, I was also wondering about just going to non-relaxed accessor
and drop the barriers.

Maxime

> 
>> [...]
> 
> Thanks,
> Nicolai



