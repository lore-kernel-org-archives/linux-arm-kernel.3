Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21860CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 14:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5D41lw9AvoFAu/NxmqiIH7K74Pst1YSUgBSfmtz+LE=; b=RjrGDmHXvqaPJz7sJjL8JpPCvh
	kuhun9iNoBrck90wdui2408htP8uhFAXvFTbQbxKakLp0sdiNhWRhoAx/kpTgBUJxZf24WYJk+41B
	EkCfr8eVjcxMSCGJKC06K7ksIkcsSPHcwR6rZYXLBmxGMnjfvyRkHkBlxOTWdgYSrH1ZwzvtBhNuM
	xJBh/koUBbm3o6wBprfoag5FTZS2wcC/suXPRdkxkEJS0GZ8tjUhT4tMzPImlNlEVl6az9d4dnbvH
	UumaH9v6S06zjaPeYfDo5JnsingoPAb/DuSmfNyY98EnksAyJ+eK+meswjut0vdMl4jtOQLkOQBW8
	WHEk89jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXq9-000000089TP-48NI;
	Sat, 10 Oct 2026 14:14:21 +0000
Received: from fhigh-b8-smtp.messagingengine.com ([202.12.124.159])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFXq4-000000089T0-42Qg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 14:14:18 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.stl.internal (Postfix) with ESMTP id D789D7A008F
	for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 10:14:14 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sat, 10 Oct 2026 10:14:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1791641651;
	 x=1791728051; bh=P5D41lw9AvoFAu/NxmqiIH7K74Pst1YSUgBSfmtz+LE=; b=
	m7q9KgvzaoOqlvH3uyt6b3NRUrb/XshVsTwIZQ2MkfanF0l4UbzyCYCQP5QsVdO7
	QObIizevkTWPs1J3Eyafl3+cxjni0izy+xUgCD4QSFJTAQ8NZ+IjQrl+GNKH+Sj6
	DTZG2joS2hA8z0CRIKW6hbCDPHPqPJAMQVTTNyjjrH5ejFNLlzzbdhg2i6iCgqiw
	ynpLL+C5qegRlpTwfli/z8PsbPObF2fc2zBJCzIvpnhvHKRumzg0vKaNGE+lWI2i
	YdaqaQzc/KhGDjFxOxm7D6F3P9/4wtXFW5ogT6Ksw154eCSThk+cmAUjnwlwBdTL
	FlenU3ZU3igC0stXSolVHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1791641651; x=
	1791728051; bh=P5D41lw9AvoFAu/NxmqiIH7K74Pst1YSUgBSfmtz+LE=; b=M
	63IUeVKUTLQXGMaaDRVP9jD1qL3IvASSLQLZtYt0//+lXu/swC0urIJwP69vAPCJ
	2RPhlox0pNmX3eNXSgE3TfOuwYJo5EK4afJSOxfXFL2r58OBXMVZ9dGpxEiSeHnc
	cQtud6OJnXczfu5i1XhbZf59N37iNEDYU3bezEVubu5Ou5rUTQXmXA51KYmH20Dp
	ka3/pXMjefonMqX5UBDfs4qhvlJrGSUTlzTxFAc0qgIKlvEozD9FXFqPQnj4kmQj
	b5iJsJ/DjLecpNj57bCm5Q7sabACuBTkvbSTWtAvCLBAl+vGCGXPoyfs/QbWbE4g
	1I2XGdbnUWeF2V5LZqZwg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1791641651; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:NWk1MwNn6VSSWvZZvxC2lZ10Od7gvGD7Zk1Vdl7sk6KmpwM
	9aMecimtLOmT4fRvTx030QeAXkJYd7Sui2EVMTKjlklU5A1xIdt238S5jll7sdun
	rI2FhY6FCXs02fpWE/pZzOiqSUI+OC3YxYGjylofT9jcDixtfHC7mXYJyWsNBtdV
	F69js0X5FBlsr5BM14q9fpJZN7w9AArCJGBT0znQDftFyJh2/LIjXSIR3eyf+8NF
	QaeAcNYFo9FrLR/LcyKdWyFxj0S4Drz2g5iwQltLkDo7ijGyKNL1k2ef2pHuWA2w
	4n/uchWR5xy6Q1vEQIhTyp5yv2Hp5jZkO2FgBRg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-06;
	repo=github.com/dkim2wg/interop; date=2026-10-04; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:E0iXCI5C17X7FFLF5wpNyOXtmHUPYySvSTLL/Nr0UuI=:xTBFcM9TkpWzcdbid7SiEiRR1QDxfB9ux5nHJ2vCvfg=;
X-ME-Sender: <xms:MEjKaqDEMS5-Z4qDa-vxFYxQbwCbgjv7Q5GhXah7AisdAUWP-AjfEA>
    <xme:MEjKavVL50CGShenTs_TEkfnp_CIQFtbhAI8U_J-cDh38mxrvCPGI-acbk5jvRrca
    8W-eu4PAjtzObfXv28Q2zmOmotic-u-yMWROrpqztCiR9q28ZrDjBFc>
X-ME-Proxy-Cause: dmFkZTE+WwUgTuhZ2nzPZll+5Ah43fS038CZn0JVBdoDxLdBIrf6sxasJG3xkgrPmZmn4S
    HSz2okafCVJ1UU1wacBv64F4E4AzJqa09Wmid+lUqrRFlVxtQq5+o9SKZQkBVDS8p2U0Xe
    ZkCVuL+d8f+2xvCMm3tYEEqqf9pbWbzbyxUylQj/AkyYsjmOO+eA/IcWRTNeZ3/SEMN/63
    BRKYQhYRrQZ36bwzTVQb0yzoz6qjb2pLS2DVKRr9EfCvuuFP5kfxAv/DhodSQSQK5WcTcT
    Q98csWRayBVKvHWUbdoa5rjo55vzsfCKSVcrxQgzoSIyi3L0Nx/xi2bdx6o6e3zrGca3jd
    qMN7jcmH97a0BGjwQgNvzFUwHwjK7NyjQwXb1eOa7QiaA1LWe4HZdNyqEG9RGQsId2ewYp
    sJtojqacXOn7DegbHl+c5dm//Xiol1oBYzekMNb+zvdVEZ+TGi/vh4YifLjOz+Sr031+XU
    xp5INLx8XqJcWp3oqE/JWo55Pxv0mjgIsr317yMNKsFT88ez4dLYZ6fmITIB75BNr7kesL
    ENUES6w9SddiCBsm18RmZOu69ZYJqAdBVo/59AILBbJD97kQ3v0YQ8eeakYszncABuVusA
    MnxtTmhjQ4hQlt/KVdIHEiyzJX8MaUF4DPy1gJAZHFxTuu3x3Ncm50HpwQEA
X-ME-Proxy: <xmx:MUjKap_lO5Jvkt0XXg630MQAcs8mUah5St7s-Xc_OQnY8g8IQMgqxw>
    <xmx:MUjKaipU7rEH2vVmznbM6JxoQgfIXzTIilnb5w5lK12hb_Rge8J4Ow>
    <xmx:MUjKarTBT2aLbgQW4oUoz6SoqJelhb55zBuJPQu0kHLeCyWFJ9eqEQ>
    <xmx:MUjKatPnjvP79VNggcDZPrKOeUVkhuhGiP2IrxlW2QIN6RyzlGJv7Q>
    <xmx:M0jKau0LLNEyKw5bAbR5ZuLzklBYbtsT-Lg4v4-X7M682hqR_OJ0lhYL>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 0308532A008E; Sat, 10 Oct 2026 10:14:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AV9a5Jwtb8Lw
Date: Sat, 10 Oct 2026 16:13:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Russell King" <linux@armlinux.org.uk>,
 =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Message-Id: <b6dc1056-63d9-412b-8abb-a032dae83d46@app.fastmail.com>
In-Reply-To: <20261010130024.177503-6-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-6-ghahramani.navid@gmail.com>
Subject: Re: [PATCH 05/24] ARM: zte: Add ZX279128S platform and CPU hotplug support
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_071417_047328_07A9E53E 
X-CRM114-Status: GOOD (  10.53  )
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

On Sat, Oct 10, 2026, at 14:59, Navid Ghahremani wrote:
> Support the dual Cortex-A9 platform, second-CPU startup through
> bootloader SRAM and CPU hotplug. Keep existing ZX297520V3 support
> intact.
>=20
> +ARM/ZTE ZX279128S SOC SUPPORT
> +M:	Navid Ghahremani <ghahramani.navid@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)
> +S:	Maintained
...
>  ARM/ZTE ZX29 SOC SUPPORT
>  M:	Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscriber=
s)

Hi Navid,

Since this is really the same platform, I would expect to have a single
maintainer or team of maintainers. Since Stefan is already established
here, I would ask you to work with him first on reviewing the code and
deciding how the two of you split the responsibilities going forward,
but I don't think that having two separate platforms with separate
maintainers is going to work.

     Arnd

