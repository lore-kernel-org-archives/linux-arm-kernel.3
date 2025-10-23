Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59997CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+ZZiNFpfo795JzyW1U+Amyk/9XvcQWSem6gcToDr+s=; b=kcn2LsGN4Wm7GFfas1LFcYsS7E
	pSyeBRQ0P6iusz0pc9uCtVwZwfDXOmm1B6E2rsaZ/HCO2U/53ntNtwpUlSGOXAN89FLD8IXhJsb/h
	MBcM4rJmfwtUhmNVLITFa5TxZfQqRwK86cGpzXkYSMyEeHr1YPAi7Fkc/AU3UOlGMZ7c6Sp9R4bXJ
	H/iNT6YYmDdm8U+SmTFHVNEwYwgTpbOa3ulOrIYxpuTasmg660V9xF7hSl1A1+ruxyuPLEG0Qz8K1
	iXfXVVBSdAOSl21wAHtzFGwoz6hwG34toZ8WUkCWgjcCCPQ9NtMQirAI/H4VpbmwnP610BZFGrPWu
	9q9UOYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvrn-00000006VRg-24NV;
	Thu, 23 Oct 2025 14:00:35 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050:0:465::102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBvrj-00000006VQj-3twu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:00:34 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4csnjn6y8Lz9sWh;
	Thu, 23 Oct 2025 16:00:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761228030;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+ZZiNFpfo795JzyW1U+Amyk/9XvcQWSem6gcToDr+s=;
	b=j4ynUv4c+hkeEzlSosmR194vZWb0Fdr0vD8ariJEQuViaQ2jbcsfyGrruvx2A9TijA6PYb
	ZHDDAXA/ahvyEMf3UDaaHPQErvSvycVz3OV2oQ6D2TbnR9+7ANj6b1MPDHSBzbs8e4bpTg
	4SYq/NQypjJLK385LZysbRcyTDQ6Uquu9i9c4AJxqrTRK6LF7FruskUxudUq8ZeAfUHGI+
	6CW97s0HexEQMx1dWO4d3Ca2JN5pTh5JMSdmtq6H5/6BScpftK1GNRzPcfklW+8nRRQkHk
	pJviiO9qcGpHxl34oJK5tUK6QI3ln8U/ljegOIv4Ag/w3OsKyTQX/0gX23HMHA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=g+S6XF76;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <70554674-7020-4582-a4e7-dbee34907096@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761228028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z+ZZiNFpfo795JzyW1U+Amyk/9XvcQWSem6gcToDr+s=;
	b=g+S6XF76RadfsTIRYoIuugAO45PbkGlYNXpuEd7ASeoTlGOBKBhay0nf37U/4TVEiOa8r+
	rZOoibxEn7k26j2OfE8/3znmepCmeZojymvyyNVEXPrPM/4bHdInrDbY4eaWqUr6I6lKr2
	DcJO1NeZv4qLsvPt4JisM7w+gmacYqySTdcp6vNkKyl2XoLguWTXiN5bHUleRpdmJ/Mlw0
	gDw/V/LvZ3FbLRZ5q3iVpZ3E4L1A2k+CS3E45LTEv+HK6z0PloZoMsaEdqC6a506TfGUBn
	4qnXfHrgCk/5RGoxdacf525cyI3iVFkZH4NeBbqOaeP8Y9ln4xnGrjKfLvPo7g==
Date: Thu, 23 Oct 2025 16:00:18 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: arm,scmi: Document
 arm,poll-transport property
To: Cristian Marussi <cristian.marussi@arm.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20251023123644.8730-1-marek.vasut+renesas@mailbox.org>
 <aPoxfH_TLrsMxMVQ@pluto>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aPoxfH_TLrsMxMVQ@pluto>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: jp916jjbwe3rtwcy3pk4agiykqi564ug
X-MBO-RS-ID: eaba31ded376d5d287d
X-Rspamd-Queue-Id: 4csnjn6y8Lz9sWh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_070032_302914_0670791C 
X-CRM114-Status: GOOD (  15.70  )
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

On 10/23/25 3:45 PM, Cristian Marussi wrote:

Hello Cristian,

> On Thu, Oct 23, 2025 at 02:35:57PM +0200, Marek Vasut wrote:
>> Document new property arm,poll-transport, which sets all SCMI operation into
>> poll mode. This is meant to work around uncooperative SCP implementations,
>> which do not generate completion interrupts. This applies primarily on mbox
>> based implementations, but does also cover SMC and VirtIO ones.
> 
> Hi,
> 
> ..indeed I was thinking a while ago about exposing the existing force-polling
> switch but in my case it was purely a testing-scenario configuration, so a
> no-no for the DT, things are different if you have to describe an HW that has
> no completion IRQ also on the a2p channel...

Correct, at least until the SCP on this hardware is updated.

> ...having said that, though, usually polling-mode is reserved to a few
> selected commands in a few chosen scenarios (as you may have seen),
> 'carpet-polling' non-for-testing for all the commands on A2P seems a lot
> inefficient and heavy...is it really a viable solution ? or these
> systems use such a low rate of SCMI messages that polling after each and
> every message is negligible ?
> 
> ..just to understand the context...

These systems are early in development and it is likely that the SCP 
will be updated to generate interrupts properly. Currently, this is not 
the case, hence the carpet-polling, until this is resolved.

-- 
Best regards,
Marek Vasut

