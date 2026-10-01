Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D01C6CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 06:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WSGgZzQnESEoMyPhtWMXXdXD9xVOiDbP1Nsb3ROZGMs=; b=aLSTlnnVYDE6a3AMCTpu5ZT6kN
	oiuuUUt4c9BXTbYhbBIqwmNFQiD0V+Uhzo3OHjYExellhahTGzCB+0ShBWc5acNLniRAYxQ6mqn25
	YwaV8vX1QACQMyBjbvOapsVwWSecDtzf2gnbxUMaj6cBl1aX5gt0PtBShgEuv+3/BwczpSM7UfZ1J
	9VOEndzaPc0MenOYZmoNjsX9z6BSTTO6t8Ah9ll6pWUtxCANSoaEZZhMfzkhFQVQQszF2BvKT2S5C
	8m+KH2Ov2UCz5tjsFcDp/0HmHJXOoXhrXfzWjFnWjo45H1CkJJPAnGmKPTjFef/q4yq4y6lRM7DMs
	4ZDjtJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA8e-00000007sab-2J3H;
	Thu, 01 Oct 2026 06:19:28 +0000
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCA8b-00000007saC-0sYT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 06:19:26 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4A4967A0032;
	Thu,  1 Oct 2026 02:19:22 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 01 Oct 2026 02:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1790835561;
	 x=1790921961; bh=WSGgZzQnESEoMyPhtWMXXdXD9xVOiDbP1Nsb3ROZGMs=; b=
	OpX6Fux2Un0TEJSycfB5lJgiM3lkZnmrQRdIJl73OGGdRZRKq0pIPbPbgC4f8Kwf
	980L+shNFWWrADbtRrcNonFXo1NSjDrTqPQayXxidLH2QiVVzWbIl4QS6oiNyog7
	clNJ4sendjW4+F0mKCfeipargTZ3QNsTRmaxfHU6ZoEiK2y2SkhesbTIAKvj94zU
	8wtSnEyFtXyzVTKiE6FnLKH1Wxp7pQJbBOYb6d4Qf4iUvCt3fKV0iVfXrdDFD+ow
	pbQ9tOF2nbUQ75bRXFEJ7i9l520ABLc+rfP3eszC9RGXBwirvLKGxIKwkmlmsY+T
	Ile7Zm6QXTmkVgbtV9FhKQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1790835561; x=
	1790921961; bh=WSGgZzQnESEoMyPhtWMXXdXD9xVOiDbP1Nsb3ROZGMs=; b=B
	E+3gW+IIdnyC+klq4hqg/lQ/QtNWQ5SsifeM7mwu4XbP3/UAeZ6WNUB8Gb+Z71YZ
	ilZjHZaFodsKzhOzd0GdbNyhtOubLso8GfOWqHi46fXmRnGLM36E8Beua67/0+Xq
	5Xy1iiHXWfJAcRktu7mEbEhL5daqbeZK3qjxqx0vEa2Kysqt3+7eAdiAUnh/iGIy
	QobUVgHDN48qcRBTK0RwfzNL/Axg+RsPJimyhxgN3dvd9NaggYQgFVFBsdCkUx/p
	6zv6KBP4+z9dBganQmZQ5wsQDDpQh68+p0aBXPXmDDnSvEQHGLrh6HoUwSfkCISw
	IX2BYk8hBI07W/Zq2T9Rg==
X-ME-Sender: <xms:ZPu9alSuqW5a6601kbL4rNvTZBKU55iN9nYfSyn9r7137BYUHwRvRQ>
    <xme:ZPu9apmF3fns008eIGP99ZXretlqw_59KyGVpLTqlz0J0jTSb_Ezr5k_3tvUKTpXU
    Tj2YAn1wlfx3Ea17Zi0msYj-eqJEKmIor1ky-FnMrGbqbc9c5lTE_lt>
X-ME-Proxy-Cause: dmFkZTE+kwCH61hB0/aBEMlYN1ECNGWRt1yz1v3KEVbjyO+0syRCfpET9a60dxxUGUJFZL
    5nzEOEC+jb7ym3HdioM8/YP/gmeYmjv4adlMH5/FeC0SzoL73OrlnPnlm2dYmbp3AXPYfz
    ISp2FqssZJbOV7FKeOgAlOfoCjZjiMST1Sn4np4FG2gREjqq/n/1PzwCTOGXyhAAkFanBM
    voE6gw1R9RrqENqPDlMUNAwE3oM5Km0uReGVfkaQRvOEOBJf4ZuBw1Jszazn9z0Smnr/K/
    Td0ryNAUPBo3mAH2GuwXcm3NaXqV7xqTjeLO7S6LMAHIxIeRg68CO7UKg5nOMf0kAhUytj
    Rlou6p0FVSlrvMpSuy/vmLQXk1NpwSP2WHNq7c7CFmnquJAClqMHqPkcOgaCTdDM6l0lig
    5l9c607x8QX4VvEP77Gm/SA3htjjq+jGJ2aQUnFLdkyEnShAI9FJ/5GETbe2+jMg5s+pPl
    AftF1PkDMz3dccMHFPz5nzl9zHQG7F4vsgpP/46tm2MtZ99HWHtpg/A3+6y9AHAIQI4AZk
    ShwnZWBDd8nXRNLa92ORi3VJvbhgv/uCbZowIA06aL0cRMI8ellxsuz2LqfyI1iq6JGJJX
    WZu7YhpQUWQYIGVyewfA/3nkDQiQNp4HXSQw+RQmh7KXviF8ucO/pumuVZBw
X-ME-Proxy: <xmx:Z_u9aoo4s65TZ-fhT4o3hQtOXgqirP-eapU4K6H10zvGggIFub7YjA>
    <xmx:Z_u9apXn-FTmidFbyuh3Wc8GSaecroyrJ2INf0O2RMVWInwH5lJgmw>
    <xmx:Z_u9aj0rJo7R9qFqajjIkOoKF3RBPZCXbX_v0JegQrVq_MleumaW0g>
    <xmx:Z_u9aq3SfTBHygUmK3Y7IOSFZxQcysU5Zl41hwTbZ2qOHGaXCyuQrQ>
    <xmx:afu9airAUf_-3-GczsvuISYRtU8oGRsXP665OVkbopgwYt-grBidEzyu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id AB56F32A008A; Thu,  1 Oct 2026 02:19:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AxcX56erMFXV
Date: Thu, 01 Oct 2026 08:18:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Fil Dunsky" <filipp.dunsky@gmail.com>,
 "Jason Li" <jason.li@cortina-access.com>
Cc: "Linus Walleij" <linusw@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Drew Fustini" <fustini@kernel.org>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>
Message-Id: <3ddf4b8e-14b7-442b-9d4f-5167875e3d64@app.fastmail.com>
In-Reply-To: <179083239972.193541.4791387611943615705@gmail.com>
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com>
 <20260930-b4-cs75xx-v1-7-4617c4463529@gmail.com>
 <CAD++jLkzcf7gJB82XT3-xb4jLujtWSNz1kT2r1-4N54rRfRNMA@mail.gmail.com>
 <1d81c2ef-7a5b-4306-83d2-ff96b0eb6a06@app.fastmail.com>
 <179076749140.3134070.3869742286743401078@gmail.com>
 <SEZPR01MB42087271C56AD1C7E926AF35A28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179082517588.138645.14615134489246049313@gmail.com>
 <SEZPR01MB4208B8B4A5A7F48F7FFE0C9FA28A2@SEZPR01MB4208.apcprd01.prod.exchangelabs.com>
 <179083239972.193541.4791387611943615705@gmail.com>
Subject: Re: [PATCH RFC 07/10] tty: serial: Add Cortina Systems CS75xx UART driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_231925_637947_D005CB78 
X-CRM114-Status: GOOD (  14.51  )
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

On Thu, Oct 1, 2026, at 07:26, Fil Dunsky wrote:
> On Thu, Oct 01, 2026 at 05:14:59AM +0000, Jason Li wrote:
>> We agree with the approach of using a single UART driver since the
>> CS75xx and CA series share the same UART hardware implementation.
>> For the Device Tree compatible strings, we would prefer using the
>> "cortina-access" vendor prefix for the CA SoCs (e.g.
>> "cortina-access,<soc>-uart").
>> We do not have concerns with using a neutral driver name such as
>> cortina-uart. However, for DT bindings and related documentation
>> describing the CA devices, we would prefer the wording "Cortina
>> Access" to distinguish them from the legacy Cortina/Marvell branded
>> devices.
>
> - drivers/tty/serial/cortina-uart.c, SERIAL_CORTINA,
>   SERIAL_CORTINA_CONSOLE;
> - the CS75xx parts keep the existing "cortina" prefix
>   ("cortina,cs7542-uart"), the CA parts get "cortina-access,<soc>-uart"
>   when they are added;
> - the binding and the Kconfig help name both families, as "Cortina
>   Systems CS75xx" and "Cortina Access CAxxxx".
>
> Arnd, this also answers the prefix question from patch 4 for me: I
> would leave the CS75xx compatibles and the dts directory on "cortina"
> then, and use "cortina-access" only for the parts that Cortina Access
> made. Please shout if you or the DT maintainers see it differently.

No objections from me either way, but I don't quite understand what
that will mean for the older parts that that are still sold by
Cortina Access: cs8032, cs8022 and cs8124. If someone later adds
DT support for those, would we use 'cortina,cs8032' or
'cortina-access,cs8032'?

     Arnd

