Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B42CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 09:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Vu+OzUk0MIMBYSS2c/IxqZ4LiwoE9Nz2IqLhJSI37c=; b=cjegBe9b2hmYf8EMoTrQDX6cHv
	7pZ53cMwuJUiRgoQrCMG83aUr6HqABgePT8qVLPn1f3GzqPBrdtDrBukaF1xXAkQOEBxxJWcuaUiz
	lWLHyxIwhuzvJIrhgF54Yu1rRrQ0LN65upjLMbMBTICStEVQxRgf0NfZKswdFos3q+Nqp6b8g2Moe
	EbdqkxLEbhBHcrtegvIiymP/4asqAp/5MamIMqmjzkrYu6ovl7t7h8E/42Q3m++Fz4iDuveJi1dnU
	9UG7AExJ2P0RWEUcG4eF3h+3Hb/Z3yztGppgEWZ4Mdn7ZIE18kQxEATV1aJCCUkGAP+nkTHCjO0hT
	a14Ae6AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYRz-0000000COmK-2Z64;
	Tue, 13 Oct 2026 09:05:35 +0000
Received: from fout-b2-smtp.messagingengine.com ([202.12.124.145])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGYRx-0000000COlH-0X4k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 09:05:34 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id 865331D000C5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 05:05:25 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 13 Oct 2026 05:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791882316;
	 x=1791968716; bh=5Vu+OzUk0MIMBYSS2c/IxqZ4LiwoE9Nz2IqLhJSI37c=; b=
	idd7msZSsfRL3u79KkWVHMhvQE2Iq5DPnSingn8n5pygs5gk1oXJoa0gUNnua8Hq
	Dwy54W32VjKEA9er6JthFzKN2QcJHy9huiaG/Nq5Lu9eQQtytY4zXDb1d94GNUuI
	inIrY3qWfHcUao2bDYhY72QHLTHCj/1UEY+fd4l3lxug7yQpG9nWdyoY0atlyzq6
	WTX8f8X9USO3Hk+w/u+XG9l8KSJA6oni56Fsgkcepcs6P4sz8Py0tA+d9HqSe6N2
	SweMD5e0016IudfYfbt53fkaUGMiA00mr0IrZjH2Ig5F2TIGKq1nRBuTmhP0PuWW
	Co2Torw8uBXcBnPdvvU6iQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791882316; x=
	1791968716; bh=5Vu+OzUk0MIMBYSS2c/IxqZ4LiwoE9Nz2IqLhJSI37c=; b=r
	ayI3YWzKU5LUBrAzpF0W+HMthGVmZhb+z8sSbJN6Bzr3im8LedSX22LqhBIZ9TNn
	tHB+d8dcFyH/YO8YUcW/NJOVvBnrIxzCLIX3IRHQH+rXGSUq7DeGoUkzb4Y6GCJJ
	I12bNBQpgiR49p6GvdAkJuxIG9/dnkhRuuVaUbK95mErniixIgjUcQwV/EpAizbm
	TdIa/WzNoo/gaUBVCpTXIeCIvKIi2HzamF6IqrsLjjlB67HnSwFtWVZV3xbQFM06
	JL4V5axHJMMNwlEall2p5LCid7cQwO3lnTeoFaJwSdwzxKPoJCAgecI803/W18qA
	GeSbnXs+3LYFFm6pYJtew==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791882316; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:aqAzTaP3wUXUwcbW6aZ6k6zlEcUJBWeFR8CK6m+eVLpZ+oi
	bvF5lSjeVfv0tnIIoInwCZPhvqur3C4Mo/hJnsKEIypekAjCHcQFNXWmb8XWQBtj
	8I7yFZ1LnqAdpEHnGOFYIPFJ119s6DwnDLUh+N1BOXL8kysjRVh2PcOMYLeWkrxX
	5t2m4M4/0qyoWfFu9FpJd7MQjkRPiax1YzWnMLcrpOhczp+e9VUJPajuY/MiGT7r
	VSwM1zBLA30ws35kMfMZxyXIinyzKEm2H26+Gk1i3KZVSZRneenhZlqarCIG2Eob
	tnh0V7EeEFK4opqX2ug57WNlMSA5Z9aQbnr5beQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YlRJbN86xwXuiKasg+HYpYUGf7FUWur5wgJz9NO67zo=:ZFmLcCeL3cuHdz8AwMbttcGTR73WQSlfkvmtDN5wQf8=;
X-ME-Sender: <xms:RvTNauy3DPzUGJinL1qQ5nkQ05tHOrXW9qg6p8T3rTOl4OSnDSp_kw>
    <xme:RvTNalErx89Iu7OGUtpLMtQG56nFAozNamFYO48-5ya37o5aYFpvnYfm__R2AzQ0d
    CyRCgdJmCZ8SjdBfRjZy57_MDmmjI3RMEUrLqkZiC63BXOKsSRRqb8>
X-ME-Proxy-Cause: dmFkZTEaKGcxRZWYC2ZzlxnfGYHVFhHnMmkDqoeW31U+gEtaJKhI6TlLUmnksXJOUEBrd8
    yBlHpJ2LC6dZ7XmxwbOaq1yRrnpd7SiaJ8Ggp8hbsA0vpEDveQTHee9kHbDkEYeDcNjOdv
    c8HHJ3t5VPwERagUysZAWfIV309Y3knQIFpnR1bJg5dL8c3RMwoJBFGFYOBxLcSsx6jCdi
    9bIYNQIB6RrnhaNg9/TRKM11VmCsaXs2HypU3I1uYaieqsG4ypc9LDuS9YAdzrEOdZqV1z
    bsoRPAvE2UAp2JvGmXQSLGlE92Z8vTGU7D1lzOPHEFReiYt6XM8zHN4tyC5Fi5hBPZFvfQ
    6NSj1S8McnVav/vuOhoHLYKRwxVO0jI7qJGxEcuCCL+XekWVn/arUhpLZn8kQqHiiCokqR
    KDFd61k7au6y8GK4/tKl9o7gwgUBm3z4a6yNnIGYFVPPiGJg8ndjVsQOntLn4KtX72lFwD
    0/g243eETcuARDPnkk5+ZOKc+FJcACtmYaIG28X/1Jgp2VS6fyYxCo+w3LxFB4/9bULbtj
    79IJxW3OIaHqkoPVpcDbVNzBW9Q/Qznqm6kTiVrKiznLIEX9uVKZmqf5QP9rO9WwEUrnbB
    GMIXPbPSW/zIFCpPIfX96ztVpdQ395de/GweoDXxgi54srp709yqGrIHxiKA
X-ME-Proxy: <xmx:SfTNajarx3o0JmpfaqmZ224StPTnpAxy7rWKLZ3KrGpPJrufNHzA8A>
    <xmx:SfTNaqUglVjJXHJ7xKHOjJCTZEBXNdVjEQFXcN7W4D9pzlcaoR_hpw>
    <xmx:SfTNatItlfZ4pjEJ0leoFl-hpcYJVsdOQFywJ6oo21IHfsVdu9D0-g>
    <xmx:SfTNagGMKnMqbFToTrE2FAcbBwgN8Vc7dQSe2xXwQh4_MYKpJSqxuw>
    <xmx:TPTNakG6G3To8SYyvfPexCKyGeW0-zHAIo9l4HWowG0eZv9kDsz2OWo6>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 91C8432A008E; Tue, 13 Oct 2026 05:05:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aj8tA9m21Bng
Date: Tue, 13 Oct 2026 11:04:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fil Dunsky" <filipp.dunsky@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Linus Walleij" <linusw@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 "Jason Li" <jason.li@cortina-access.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>
Message-Id: <192a1f7f-79e6-403f-9910-d46b871cae2b@app.fastmail.com>
In-Reply-To: <179187343453.3124451.12229499654368455627@gmail.com>
References: <20261013-b4-cs75xx-v6-0-37e8f3969b7c@gmail.com>
 <971b67a9-7e3a-4fde-a8a1-e5a78f8d6436@kernel.org>
 <179187343453.3124451.12229499654368455627@gmail.com>
Subject: Re: [PATCH v6 00/10] ARM: Add support for Cortina Systems CS75xx and Securifi
 Almond+
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_020533_655821_4B47AE6F 
X-CRM114-Status: UNSURE (   9.31  )
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

On Tue, Oct 13, 2026, at 08:37, Fil Dunsky wrote:
> On 13/10/2026 08:18, Krzysztof Kozlowski wrote:
>> Way too many versions of huge patchsets. I already counted 4 today.
>
> Sorry about that, my mistake. I will leave this series alone for at
> least 48 hours now and collect all comments before the next version.

Please just wait until all soc patches for the 7.4 merge window are
upstream, I don't think anyone is going to look at this before
then anyway.

    Arnd

