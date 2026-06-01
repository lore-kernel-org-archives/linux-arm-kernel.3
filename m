Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98EECD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=; b=SawSi2oOHQ/aCrbAQrybae04QF
	fm7VGzwmVRem8ycC0ZkwZxXHpP0pHVWy4hDYWxsdjq+qvoeIH5xwnJrTxMh2KYaJoDcDEHHMducCJ
	XnsnkNFwxb/4yRwkkh16Nm6ySwO4kZsLrpmNcg8IeNu4unKznZ95Bgrr8jxDQVmsmsnBxKbmzUaa+
	OxmzQ87r3foBVCUcMtDwT5FGgNgsk3t08hifbCdYldjPojHFPnpAnaDsXZwqWqQW6IJkptitKDolX
	jqPNMSJRlfA5bW+dE7+6jjSv5DVWSlNafDl0lMpVbwFfoYVSvztuQ1Ad1MkZYEErrTRnJ3hV/RJU7
	v+uloa/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9QY-0000000BoYy-3VRY;
	Mon, 01 Jun 2026 20:40:02 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU9QV-0000000BoXz-2FBt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:40:01 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 6F7ABEC0096;
	Mon,  1 Jun 2026 16:39:58 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 01 Jun 2026 16:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780346398;
	 x=1780432798; bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=; b=
	eWJDqxGPAtFjEdSVmZY4J622llJrXbYMLYgbpMcwFbygTFtCdOVSYasqaJm8Zxyr
	1uCTVFymzRXuJ02kYq4zPhyDmzhE9qLoNqtnzJmwe86cu6PKI0vbJZvKniX2zJ7w
	agYdHJddAkOr919SgU/PDNDS6q0n4fvvBFeqnpoZNHbyMgpyAnQYJG6zUqcuqA7M
	UeDPAGivLh4NnC6B1ABSBEtTbUcrYyExUzHmQswlv2UbU6E18tJRQSfUX/gGP1xB
	kVI/dKPzF/SXfrHTuWSkW6429ETs8zz4B7dnZClTEFCFbendfqf0Cu1Av+4JSB7t
	B93skT5XELDqBY+KAcJOEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780346398; x=
	1780432798; bh=KjDPQTzWZgJz5hUkpxM6NuNPlWaV6iGvvvHZkVbr2qM=; b=H
	fBY7E3MWeja328cgtxscYL97ZfX3h2fmwNwio7McM1ebi0mo9DSBmFdf97Mnc2r4
	0r4Ry1lx0YtxLJ+ETelWlOG5tgLDKYSQHRvrtdvlLsq3xyuV5jOAFyT8fElW7uw+
	4LaT+xBOv/c52pboyKIooraeeKDkiHbRUsWrgYBO83aydYDVAMCKqsdNI9S0bK26
	kRuWsCY5JbFtrud4qW1lSwDreDA/iZ2oveDFQl63yYQnU+oIqhZjXVZaTIPHuMxY
	Kw+N2ibwG7Qs6zBE/xDss45vErJFKgyy3hPHYxaWdFVaFxxLFIQg15UmV8MnTH4Z
	9z48uiHiQOCePBmlWKL8Q==
X-ME-Sender: <xms:Hu4daoNub5iPtLrcqQVBLF7tnBW3ACKF2qdO_kJOJ0kVQSYBk_09Eg>
    <xme:Hu4dapyTDluyT0dxtnKsHcDfmWdjwvvAAvpBnpN2GlO6XdrLC6vB8XTbm-GeP0ued
    X2HNgp_SPx3sK2BQVHpg0AiGnz2LIdll0Dt2bXA0IkRy1XvS3plok8>
X-ME-Proxy-Cause: dmFkZTEWdFgTB/a1EXR3n+DHCYsPeOwAGlI+f8u79hdOcqaflmwEeLZ1XGHgmFWttt+yLl
    28v+hhkpCjDuPdg8e3sQCJIFAYRgvKylemfqi7r2EndfBrv77oQ761C8xrLxhbeE+bsj3v
    TAenEDXvx2nQb4tY5PRUA58yTAG3LmV010UwgUlS/zhZeQPEmMGY8GVZty4umkqG84s6wV
    /L21+tj8B7pJETB8vf3StkS1r9gJW2gT4lRLyM/iWee2QmOanodV9tBi0rtYwl4lieewA3
    Jgxe3xna1N13P34L2ZoRWsfcDF1drjOcp/nrzht/m+l/rgibXh2Sw232MZUXNNiR/+ygeh
    p+2osWEICOTvadAp0J719ZmHqIBBPG1uLN+VQDVUS45UZdrT7FcQ1hFJ21yu0P249Ksi+J
    du9ZH5kzIVvlYZMQoJVbKTw+ZysC/e5K097K+PmYKOUh6prURNcGf24T3CK7etiK9oTN7I
    xbhTxyn0OPMDQzV8bZlI++UKbB1kM0+LCtlFH+SMFiozU01nBtjjoyIMWiB7RabwOrIcrp
    +Y8LFMBqD9Idfbky47MtZ9NMKuHAjXv2FeODy1lGn9Gdc1gI2Qv32IDwzdNeoWbNtDSw+/
    TC2C+jdqZe4qYJdgT8+DdA2np6Pnb9QqvJYCSETaStdo5swfYGGXmR9G344A
X-ME-Proxy: <xmx:Hu4daoLQ1r7PyBecGvbD4ACeaWlpnHjX_mhbIrryyn-0OFEKKbniVg>
    <xmx:Hu4dav4Wbh24UZSe8vSOc5m8rmFs5QdXHFITSIdDmYHnu_hpUSVv4g>
    <xmx:Hu4darx5EVHhn5L3ySn-rSQJTr7yl14WalxrnvcrYOsVgsZTPbu5Og>
    <xmx:Hu4dajY-sYO5JrkP6OYj4IqXzEVDbXeD3ZffW9szLm8c3ctasYKUrA>
    <xmx:Hu4dau3_QYW4vzGe_FBIbLwNgMJvOhYcLwAhl_TjfUjJCuA--XgG6311>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EFA1C182007A; Mon,  1 Jun 2026 16:39:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AXmBUbiQg2Mg
Date: Mon, 01 Jun 2026 22:39:36 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michal Simek" <monstr@monstr.eu>, "SoC Team" <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Message-Id: <b56b09af-cd0a-4061-8cce-5e8a50033b4f@app.fastmail.com>
In-Reply-To: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
References: <CAHTX3dKWE6DOPLXPq31wRiXfjac0TVqSOAOLP8itHoGYpF9eBA@mail.gmail.com>
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_134000_000240_580398E1 
X-CRM114-Status: GOOD (  10.91  )
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

On Fri, May 29, 2026, at 12:15, Michal Simek wrote:
> ----------------------------------------------------------------
> arm64: Xilinx SOC changes for 7.2
>
> firmware:
> - Add CSU register discovery with sysfs interface

I looked at the contents here, and I'm not too fond of adding
low-level register access interfaces to firmware drivers,
that is usually a bad idea because it ties the interface
to a particular platform.

I have no idea what 'CSU registers' are and the ABI
description does not really explain that either.

What type of userspace would access those, and why can't
this be done in a portable way?

> zynqmp_power:
> - Fix race condition in event registration
> - Fix shutdown and free rx mailbox channel

No objections here, though they look like bugfixes that
may be 7.1 material. Up to you, but don't be shy about
sending things as bugfixes when they address real
problems, it's better than waiting for the merge window
and then immediately asking for a backport.

      Arnd

