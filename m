Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52B2C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 04:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EfiRw7gB8e/5MLrWL0BiJdfLFcVW2LHs3Jq0FFdnVo0=; b=W+qnLUoirjSuNLo6O+zd9TfG5a
	Jq/Hb+BeIiAaB4p44fxKrvxxoSNQcAPbfy/axUHOyGXFNj6mq1iNeZdQSOo452YiyVstYp6N+ww82
	pRrNQat9UDxlacVOe1K5afz2MB9j9mYIFtDoNbdFG3RzA4Qoazr7T1jLplFV4a3ZORRZHIO++VZAs
	k9ZaPb0EHYjdSgAtvmuJBQe9HLoTSUaiAOlFKTLQPqxP/XGPt99LgzpDIbyqURvO9TJE1G9hH8//d
	gswvYVPlMzEsgbexQ4EFeMFXB/z+ubfmVqDI7RNh1A5ihKsZHDeerdfgB5K7929Kk2mWJuF6/zCp3
	TgjRYG9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tenk0-0000000EWAv-3vOC;
	Mon, 03 Feb 2025 04:07:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tenig-0000000EW2k-2CxU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 04:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738555556;
	bh=EfiRw7gB8e/5MLrWL0BiJdfLFcVW2LHs3Jq0FFdnVo0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WqdTiAAetAQKzDnEKAxG/R3ri9ZP0gG2mu2AqTf9zfCQLmvqRHEeqcjlFbxI8q6Vy
	 YF5PJSeqgtcjFe1LFbJC7ga2/nTFHbxtubP0f891BE/g+tFzX+zAEmsWPgNql1/yKH
	 uHiZzlkHo2WpAr8ze2u9IRE5+90PhFevbqvS2n05CB4w7oDoh04u/2/NzwBDNdx5IU
	 YFqjgAhGJsfgGdg4jsPZzQSN5fuH55Opp9YUfK3r9NjHNEIBHIchSz5Z/eKcreUbdu
	 u76oHkujWbGyHwDUgfpE207FzjXJlYYVk9mp1TR4ZW1v5gqJmFWdMqaVj5IAEVElvk
	 /VSJ7VAFCHPzQ==
Received: from [192.168.68.112] (58-7-156-140.dyn.iinet.net.au [58.7.156.140])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id BD4E773C54;
	Mon,  3 Feb 2025 12:05:51 +0800 (AWST)
Message-ID: <f01ea3f0184cb598cdfcc22d304ea31ef5b7dbbc.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 1/1] watchdog: aspeed: Update bootstatus handling
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, patrick@stwcx.xyz, 
	linux@roeck-us.net, wim@linux-watchdog.org, joel@jms.id.au, 
	linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Peter.Yin@quantatw.com, Patrick_NC_Lin@wiwynn.com,
 BMC-SW@aspeedtech.com,  chnguyen@amperecomputing.com,
 aaron_lee@aspeedtech.com
Date: Mon, 03 Feb 2025 14:35:50 +1030
In-Reply-To: <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
References: <20250113093737.845097-1-chin-ting_kuo@aspeedtech.com>
	 <20250113093737.845097-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_200558_770413_2A0F342C 
X-CRM114-Status: UNSURE (   9.38  )
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

On Mon, 2025-01-13 at 17:37 +0800, Chin-Ting Kuo wrote:
> The boot status in the watchdog device struct is updated during
> controller probe stage. Application layer can get the boot status
> through the command, cat /sys/class/watchdog/watchdogX/bootstatus.
> The bootstatus can be,
> WDIOF_CARDRESET =3D> System is reset due to WDT timeout occurs.
> Others=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> Other r=
eset events, e.g., power on reset.
>=20
> On ASPEED platforms, boot status is recorded in the SCU registers.
> - AST2400: Only a bit is used to represent system reset triggered by
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 any WDT cont=
roller.
> - AST2500/AST2600: System reset triggered by different WDT
> controllers
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 can be distinguished by different SCU =
bits.
>=20
> Besides, on AST2400 and AST2500, since alternating boot event is
> also triggered by using WDT timeout mechanism, it is classified
> as WDIOF_CARDRESET.
>=20
> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>

