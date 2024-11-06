Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCF0D44D5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=; b=tiU3ewjnLvUNnVd3UipKU7466r
	c+eYz0nOHPCimbi1Ehrg0eBp8c7MnXBaxbRNec3pRDHCquQs9oTqGL7JRgZRwj6+xx2afl9317aqs
	1yyQFRERXvSv1SeqX9i3HiuG2ILtA7skrjx+ak39JKK2Nj1ZdOVimYYD5BYo8XQNq26rs9vM4XPBn
	sw4DmQssLfH+Q1LaUKfu//DgDGxVFZuVtGvrF/KC2XG58I0G/C0hx5iC/1Mv6Yt0f6vqdNWQmIbUp
	Ezc07D3yu88IXFfymZRTKz8fZZbQaxbX5n4ZpZjJP/gEcL2WSYvZ3Zco3THKTvU1KpPYdrN7MT5KP
	Bwe4AVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gAO-00000003QqD-3LJc;
	Wed, 06 Nov 2024 13:33:48 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8faU-00000003KjH-3qya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:56:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1730897795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WRp/7Hu+GZ5KYKNjcI0S36YGbzuDlAFdnfopa1xr5Qissc8C+gRGCBpHor70uBaTTxQ3BIPtM1cgEp+gzHwnob5QCBo4SOOXG54ymwoab20T89uq6crC8lDExXCozHN3ABfQdrbWWBV6M+9Zn2fw60SdIMhJGU/47pEUj1I61pc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730897795; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=; 
	b=kQWeXfW4U5uw5S92h02C2UmratF8d3jrS0EgboCUvVm7VhagrreDkGt6i3RomVgAzs36y/h7peOeFbmIjjL9j5cZoLP5ft8x/hT603q38voayOYFcdYGpjsP7h/uzTa0vA/irhm3E6vV6k6Cxfi0I+bahpGfni42/4cs6xT2/j0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=benjamin.gaignard@collabora.com;
	dmarc=pass header.from=<benjamin.gaignard@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730897795;
	s=zohomail; d=collabora.com; i=benjamin.gaignard@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=J+0ET3+741mDa43G0HbwmzjwqQmYyHm7Vok+NKjfzFQ=;
	b=lJsrc0luwNqqOBxI8gKUO4UXqPl6yRirEjtDqJfFb0erhz5Wv2/063X5DFZD4ftW
	aUTJtm5atUrYuPewNPUFPqc8JDttMf1nx9F3XMqQUFuRAn6KDzoNQQMxHsYhlkRGsiz
	ROrPNjNxafY8wf5xbxMiWhjax/aMfbhXlltX5+9A=
Received: by mx.zohomail.com with SMTPS id 1730897793985463.4704130607637;
	Wed, 6 Nov 2024 04:56:33 -0800 (PST)
Message-ID: <1ecd57a6-6872-4494-9472-0fa904991a39@collabora.com>
Date: Wed, 6 Nov 2024 13:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: IMX8MQ EVK board not booting anymore with v6.12-rc
To: Fabio Estevam <festevam@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
References: <83aac8b2-f80a-46b5-93fc-3369b30cbfc7@collabora.com>
 <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <CAOMZO5A3dtic1CZS4RJ3RoBP_rV0PpK5oin4J8531XRebkb0ag@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_045643_030701_0E33B878 
X-CRM114-Status: UNSURE (   9.91  )
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


Le 06/11/2024 à 12:12, Fabio Estevam a écrit :
> On Wed, Nov 6, 2024 at 6:43 AM Benjamin Gaignard
> <benjamin.gaignard@collabora.com> wrote:
>
>> Have you been able to boot IMX8MQ evk board with a kernel version since v6.12-rc* ?
>> I don't have any log since kernel just don't start.
> It is booting here for me:
>
> https://pastebin.com/raw/h95JZgjk

I see the difference, you have compile the kernel to support only IMX SoCs so the
size of Image is smaller and u-boot can relocate Image from 0x40480000 to 0x40600000
without overlapping DT area.
It is working for me now.

Thanks a lot,
Benjamin


