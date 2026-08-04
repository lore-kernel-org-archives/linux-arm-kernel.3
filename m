Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B62C55172
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKpVVOy/vAF//iLEvNyTANx2jy7aUA2O60ZeWWvd0cI=; b=wuSpPegp4o103euNLgKwkbg99t
	Mc+8F8MQLViw/EOlbtlAJWe7oguKpcmaYhNNsb90rjph2V8UUgEfjG1XB5s9aAKCFT9hFydAJSMTh
	9xnMPgrO+yjmrOIe7O8mwlfqvrvoFVYvJO7GlFII8LdYuuhMKH9N5FyCoFL0CoOs9vwpalKN7fS2b
	/2wBYRJKxiCwdcU5mO3Hqgh7DRYtl6iV0I/na85w9dKLavi+q7B4P/8+Xa//4U4L4lVw80O9IknAg
	IoCgu/VyLIhNI2qD6Jco6W8L5tsVYOaWjLtHsU3bcXlhD3j3s2NWyLnBoaos0QEWZyzd09R1YYOTn
	9YPRJlNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9mw-00000001G31-1jcA;
	Tue, 04 Aug 2026 07:42:14 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wr9mu-00000001G2a-0pzh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 07:42:13 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.stl.internal (Postfix) with ESMTP id D61C51D0017E;
	Tue,  4 Aug 2026 03:42:06 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 04 Aug 2026 03:42:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1785829326;
	 x=1785915726; bh=EKpVVOy/vAF//iLEvNyTANx2jy7aUA2O60ZeWWvd0cI=; b=
	E3cUNDBeFEZJr5XV3ccwz3OQo4YOMV5Fu9Xl648bD/u9qENTzEeJRU2b7cf3GWjn
	vvWvX665VDZv6uqm8VO2p1NJOMTEccHjU4nyfz4gaZAPQeicr8GMzc9iyjWxd3mB
	uqzWCpoalPb/loA0/Uv/8RGrmtQcsK9erLNcrrQj3phn/ypEMOme9DGQqSlk4TOn
	Nj4ddwJlgMZmJGRLjw/Tv201uFvMXyjKIAmQ+5q2qyIp5YtiUsfkfE03Xs9Isofx
	XOL4pcsi+1O5Nzc/ynCUl0jNbZBuZTpgoc8FAXMJfScL1T+nuRjVNY2VOQ5HG175
	+hu55k/qDhSrBj8BD+vUtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1785829326; x=
	1785915726; bh=EKpVVOy/vAF//iLEvNyTANx2jy7aUA2O60ZeWWvd0cI=; b=h
	GAN1CBVgDGmxdvV+vmGhB630VE0hdiJ7m/TmMkq+20yZ4jOd8qrK+B6OmwnhGtLY
	vCI2JZ2H6h10Uokd3WozGEBYuv/rlSccGG6ov/xKamlbaTLY1v9jZVRiKKIKk7fB
	JkOj6Q8pV3q5ucs6jNMR4JAakZyPZ07/QfWj/eUa1WJQGxKT3PZP8uzLbe9QRbqi
	BuZLWGnWqftU3n0ESZ6kZRHeXf1roypeDTxAPiKPRIP2ehEZUdieJVCp2jR1SzCl
	uhKk0vM23KUOakUz0gQWYCfKw5/piVue4zT0P57d9d/F61a02ACAUPaV2W4GH7Zz
	kboe7xS5jcCeeCMorL7ug==
X-ME-Sender: <xms:yJdxahP_t8ETQrjfILkhbK48-JtAbMq73jgPjFMSuTRVZ9VDY8TDjw>
    <xme:yJdxauyAlUVu3CCQdjEWbJ3oc-o0p6FsBE8IUXn-_BnXxoe5JrJ7QJFKA5_bWfOYz
    YGKzuj_7rDjAcR_QXLiVycrtOCTrypBADFJD6a-a6hLuHXBMIB23Wur>
X-ME-Proxy-Cause: dmFkZTGFCYPo2AGgkRnqUylk8j8MDUHYfufINqLmmmGhtrVudRIgPX3z8wRljbN9Mmir8Z
    64D3e+TnyDNB97KNPSHMAiHeS+vfJps4AY4A3UG7sZax+6gc++uSDuIJ0EgJidxXH4Nsgf
    z8/PpVCwLr0nsIt3a1eKaQ1eUEy/OmVVwjdckjWSb5GujX7PPoOsFBm8aFPGYLDJrniYq8
    vTIp1OUvHPGtCwt8oG4RkCOagbIl3RI0Xh3Apu3+X2wug8gtCM+2bXGDN3HfDu0ND4gGYB
    d/9W/6MVjtZduHbO4RDTTbqqfrEXpce03HIWbZQf+X/Qg9517uxzpcu92J4CCrqp5F30nN
    fomcq3IcinHtAvCFC5d3OzIbLdwtdLFjiu/ZBbf+fAb0ZhgJAz3Wli7DyLVCvKa3y9DBHc
    Gl6mH/vxR1a2AVj+LN16AZlU8VgEXWMWamLXH3n9gEi+IubVlCww631aVsbCNVUdNk7m3J
    Xgd2kYaD4jLquadTCLxWWDDfIsd4WOKVeUjLnG58XNGgWGnDb0d6W+zUGTZxWHc/JU8MW/
    PeffmGbL6KhOS1YCXJ43EOLoaDDVK/tI8AVFKVYuXvHqDNq5oLWc7VCwphe6gvlIxkef6r
    /9hjD5ivsRxIZn8KCqyuCWt+olO2zhfwtn8BHRMH4TrfD9rdGUXj5/HCLXKw
X-ME-Proxy: <xmx:ypdxahAJlverSBktLbs0rLAN_jwK9108VtXcF53G7IfTX79LjXcQ4Q>
    <xmx:ypdxasOHcH_gK2azF_-MugQDNtLjQSoor3cro4-fF3aSIqmrnhWZUA>
    <xmx:ypdxagfjlBhFzIjDOauEtHKbGiaDyBtU2lFk1VEK5aP0D-aYxd3npw>
    <xmx:ypdxal7nljWsEXbuQuQNTLsvhTO9_cCu-58hMTuv_DAgAxk2g6NuLg>
    <xmx:zpdxapy1AgxiUFR1PTPXcOfaJ42Vx-pMxOlso7F07eK8LTNtIU-d5AnN>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2BE1732A0065; Tue,  4 Aug 2026 03:42:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AdFLe7-IZaaF
Date: Tue, 04 Aug 2026 09:41:39 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrew Jeffery" <andrew@codeconstruct.com.au>,
 "Jacky Huang" <ychuang570808@gmail.com>, "Zi-Yu Chen" <zychennvt@gmail.com>
Cc: soc@lists.linux.dev, "Jacky Huang" <ychuang3@nuvoton.com>,
 schung@nuvoton.com, "Rob Herring" <robh@kernel.org>, krzk+dt@kernel.org,
 "Conor Dooley" <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <fa1d3251-817d-4095-8fc0-dbee0f9cbafc@app.fastmail.com>
In-Reply-To: <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
References: <20260708082457.460710-1-zychennvt@gmail.com>
 <5f2954e4-2e0c-40d0-b67f-933446c83cc1@app.fastmail.com>
 <825a3a1b-8891-4172-afd6-8de6077fa129@gmail.com>
 <6da6d2fa5111e479aeefd62da70974601acccb96.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 RESEND] arm64: dts: nuvoton: ma35d1: add CAN nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_004212_644562_51C86D70 
X-CRM114-Status: GOOD (  14.08  )
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

On Tue, Aug 4, 2026, at 07:13, Andrew Jeffery wrote:
> On Mon, 2026-07-13 at 10:57 +0800, Jacky Huang wrote:
>> Hi Arnd,
>> 
>> Thanks for the clarification.
>> 
>> Shan-Chun and I are still maintaining the MA35 platform.
>> 
>> I have reviewed this patch and it looks good to me.
>> 
>> Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>
>> 
>> We agree that the current maintenance path for MA35 could be clearer.
>> We will work on making the MA35 maintenance flow more transparent.
>
> I discussed this with Jacky off-list. Going forward I'll take MA35
> patches with R-b tags from Jacky and Zi-Yu through the BMC tree to keep
> things simple.
>
> I'll pick up v2 for the next merge window if there are no other issues
> with it.

Sounds good, thanks!

      Arnd

