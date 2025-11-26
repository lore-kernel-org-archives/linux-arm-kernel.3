Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E5ED1037B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dozOQajCfPCmlZ4qwydvj5nJX30xNOiaEHSaYSaYod0=; b=qJLplb1DMbXXF8tBN+sA5453RY
	N4EWEjDzMhJpZXPasYbBb9y+HppCQ7yoJhYJkxdiTK4rlU9S4iryuB9hrayaNsBJok8SGcw/FjviA
	4BSd1D4QFIjgUP0o2FY3nu0CdWPcIDlKRJTIC6CfIWWYPPCqhZQJM9yt48X2j8zPGMyH0PlDo7WlD
	6zyYMTvqglLL5bVeou7EpS9W3WMnc8ikC/+xaJeKEs0P0sXjvw4qemdzL+9NPi/Tm+zAkFs6iv0Mv
	6iXCJiWHzwEu4xpkJo1444SJS4wdcBghjJhv8Fr6alU53phekTHnGG55eA5xH5LWrIjyZNUmUB7zN
	1qPuixSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODGx-0000000Es8l-005i;
	Wed, 26 Nov 2025 11:01:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODGu-0000000Es85-21n9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:01:17 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1vODGs-0006Fy-VP; Wed, 26 Nov 2025 12:01:15 +0100
Message-ID: <f2dc1479-e377-47c7-94c5-8bb41ac1645c@pengutronix.de>
Date: Wed, 26 Nov 2025 12:01:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] scripts/make_fit: Move dtb processing into a
 function
To: Simon Glass <sjg@chromium.org>, linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Tom Rini <trini@konsulko.com>,
 =?UTF-8?B?SiAuIE5ldXNjaMOkZmVy?= <j.ne@posteo.net>,
 Nicolas Schier <nicolas@fjasle.eu>, Chen-Yu Tsai <wenst@chromium.org>,
 Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
References: <20251119181333.991099-1-sjg@chromium.org>
 <20251119181333.991099-4-sjg@chromium.org>
Content-Language: en-US, de-DE, de-BE
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20251119181333.991099-4-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_030116_568364_D91A7E5D 
X-CRM114-Status: GOOD (  11.05  )
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



On 11/19/25 7:13 PM, Simon Glass wrote:
> Since build_fit() is getting quite long, move the dtb processing into a
> separate function.
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Nicolas Schier <nsc@kernel.org>

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


