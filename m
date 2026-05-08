Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0973FCD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSZZrgOpw7cfjEQSWr1n0bcdUbY4FHu0Sk24TvUJj0A=; b=MasIA6dXup3MoT8YWVDVP9fJi/
	+sEYv8+j5YDqZchMCYLbhJXq27ix4YzJTlqv30B4hFxbW3UgtenXS7YIJyWwWjp+4kj6rssjbiO3p
	peVhvGw4n0uz1m38QuBoWy4/puqbKs3tXGmxNOpmLyPkRXf7DW67EqqsPjtIqG2q7+8Hayu9MEqpj
	qw0Z+jB9aTZWY3MdIYKcw4G3nR81iRJxdvgCY0dBMsJLimbdPeKJZ69mnA9QuLU2e/syhaqt8e6b7
	hWzC/BQTCfVz5VXEDGX6S7vHpTj0XB/T+ccxAF7pdfwQ+DVXxCBuKO/pXRDmxyqSCNev+PXT2TBSf
	+oYPYHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK4Z-00000006RIV-2JIl;
	Fri, 08 May 2026 12:12:51 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLK4X-00000006RHp-1Ojf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:12:50 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4gBp0T75jZz9tqy;
	Fri,  8 May 2026 14:12:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778242362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSZZrgOpw7cfjEQSWr1n0bcdUbY4FHu0Sk24TvUJj0A=;
	b=igUGQkq1Qgum4i5uly3XIvnas34fiFJEzCz1YSgK3g4judFZN28XucXGKTb0C5y7RSyf+G
	/jubVnTcJ/wLe9D6yOFcPHAXC1evYIt9luCy/g3IrsCjDSjkyiaZse9R2xI4dgVDuTS5RK
	T8qc5mVNDt+v7VCGALOmkwEt2QJNmnfzzyhND34pZK5IXfaFc+t5nfVqx/z4Zu7zIdYQx5
	BpG4SEFjCACMt1JpsomqcATItCbCwSDNPczkQ5f4da70920RHoKKKiOovGKdW4HYav/UMN
	9VFn+z5oNS0UL0Bv0cyYqc8YzNXTCrXwKYysz4fcRPtpd9KX017K4RlLmpEzIQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=GdGtGgnT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut@mailbox.org
Message-ID: <adbe4c78-2899-47e7-8529-49eb8f99666d@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778242360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tSZZrgOpw7cfjEQSWr1n0bcdUbY4FHu0Sk24TvUJj0A=;
	b=GdGtGgnTJkUqospHm6XSwRHJEXRKCDhqIib8UOwm27/2aixmEcsvbroWxpOKQScz6O+LH6
	+2D9KVeXOU70h+toSAPyI7rZwbUlzsrZBXpg8/qmW2hJwAlarlYcX1YWBjts43zXYrB82v
	Ds6Up4Bmm4XXFYU+NbQjHS5nW0ZVQ6rK3+ImRdnMamp9ktBzRu/u8+xouxBzVaUx0XNNfW
	DgX+OAW2u3qRpLeWW/XHKf2Ir5tSOKjg/Xk6FqF1dS+EmVY2lb0SJ9m3LqOSMYdVcmpXCt
	sZXsa69OB0jIvn0N5I/zcDdYU57pj8lBCkcr6LGEK36geCH9JqvJLZJkoVtqDQ==
Date: Fri, 8 May 2026 14:12:31 +0200
MIME-Version: 1.0
Subject: Re: [PATCH/RFC 10/14] dt-bindings: power: Document Renesas R-Car X5H
 Module Controller
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Saravana Kannan <saravanak@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulfh@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <cover.1776793163.git.geert+renesas@glider.be>
 <053c312d07445517d8f9c84bfe3cc8fb72d4cd9a.1776793163.git.geert+renesas@glider.be>
 <39879eae-39dd-4b4d-9469-d238cd7d120a@mailbox.org>
 <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdVumfXkBtxzVBY27SRngHG2eOoWP+cgbkWQDNDkAW1mOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zu4rz6kobcocxfr7aqatpn5ssy85cf67
X-MBO-RS-ID: f4fb5f452a7f67cf7c3
X-Rspamd-Queue-Id: 4gBp0T75jZz9tqy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_051249_561470_AEBE7BB9 
X-CRM114-Status: GOOD (  14.89  )
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

On 5/8/26 9:47 AM, Geert Uytterhoeven wrote:

Hello Geert,

> On Thu, 7 May 2026 at 23:53, Marek Vasut <marek.vasut@mailbox.org> wrote:
>> On 4/21/26 8:11 PM, Geert Uytterhoeven wrote:
>>> +  '#power-domain-cells':
>>> +    description: |
>>> +      - The first power domain specifier cell must be either the Module
>>> +        Power Domain Gating (MPDG) register index (0x00-0x3f) from the
>>> +        datasheet, or a Power Domain number, as defined in
>>> +        <dt-bindings/power/renesas,r8a78000-mdlc.h>,
>>> +      - The second power domain specifier cell must be the module number
>>> +        (0x00-0xff), composed of the Module System Reset (MSRES) register index
>>> +        in the high nibble, and the Module Reset Destination bitfield index in
>>> +        the low nibble.
>>> +    const: 2
>>> +
>>> +  '#reset-cells':
>>> +    description:
>>> +      The single reset specifier cell must be the module number (0x00-0xff).
>>> +    const: 1
>> Just one more question -- the power-domain-cells second cell and
>> reset-cells are always going to be identical values, correct ? If so, it
> 
> Yes they are.
> 
>> would be nice to keep the description: aligned, and maybe even indicate
>> in the description that those two values have to be the same.
> 
> I thought that was obvious (but apparently it is not)? The descriptions
> are identical, except for the latter not explaining again what a module
> number is composed of...

Please do spell it out in the document, this is a complicated topic and 
every little bit of extra clarity helps.

Thank you !
-- 
Best regards,
Marek Vasut

