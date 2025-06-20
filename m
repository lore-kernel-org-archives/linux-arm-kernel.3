Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F20C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 10:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kU18AO5fHeDlpTLOvQ5TMfEqT+YYlTBLMsNF83QbMIo=; b=DWc4I53IL0vWknBv+Uw17Iy+dK
	3rrEXeYeNsQ1pZ2rJ3sQsnj8BVIo/8h3SQsfF00IMPCfnBqSN8kBlhy0W118Pu5akMpVjeMvKanIM
	6fytBAMwGhF7y3N5GrJIQN3Zxf85NtPcQYwLrIb+mqo6k7tUeC4n7nZ7/UnvH7dMwCnWvOi9tek/E
	cDPNNiJVIJQ8537rxOHRI/nYHm5oF511NxHzkf4+lyAf5GdI/AaeTS5a79gTfNOvuSztBSsZqZA0V
	SDct3lihmSdURKoYmN2za3PSZ+Kr/kTUY+OBCLCI1mnjl5hZ+teCVCjKi2mX6lsWb6QEn5eixTThu
	wmIaqMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYor-0000000FJXR-0Tiv;
	Fri, 20 Jun 2025 10:18:01 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXgl-0000000F9CV-1Hlq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 09:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1750410311; x=1751015111; i=wahrenst@gmx.net;
	bh=kU18AO5fHeDlpTLOvQ5TMfEqT+YYlTBLMsNF83QbMIo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f83o3sZbXzqo+s/sfu59GrqELmlRR0txGbkKRUjASCXGiE3CIndw6zr0Ag2FXjyZ
	 Idh4+mgs6ZVNXnmMjePt3ZcwYLZyc55G8uwwjzu8n2M+NC9jkis5cF9ZjEMDCre6Y
	 cdqbI0XBPRZtLqAoGuX/ExSSBhr9Af7CPm6RClFG1fnVhhB/mP8domh2OrnNWfeAI
	 3R2jaQpXtnxyavFK+OUdLs9a0mOiGueXsmpBLjQefbh0FS0GM8YtjHfBkHuygwFYf
	 s62uzDfI9h36ucTCsxyX8Lwo3JYkdHhf/qXrZ4xdTtpG5OI1iA+F57r0bYFqIEBOm
	 7noXz1j2mjVdqqCq2A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.103] ([91.41.216.208]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel81-1v0V3S0TGn-00iJdW; Fri, 20
 Jun 2025 11:05:11 +0200
Message-ID: <cb757d69-2e14-4b8b-9db4-5f3362be37dc@gmx.net>
Date: Fri, 20 Jun 2025 11:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] serial: imx: Restore original RXTL for console to fix
 data loss
To: Fabio Estevam <festevam@gmail.com>, gregkh@linuxfoundation.org
Cc: shawnguo@kernel.org, kernel@pengutronix.de, tomasz.mon@camlingroup.com,
 linux-serial@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
References: <20250619114617.2791939-1-festevam@gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20250619114617.2791939-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:Thch/4Ltr6WoV61mvpZp3tIF3t2DnKOj7DHP+dB60vdav7ssDNX
 ZO3ytzS0VzjdhkzJ6tP+jV1cia6LPtMqASFY9nMnhRQxK35n2gfWAm2tvxkrv0UQwlFXP2Q
 MrgTh46qzepn8cFbcny/fOMILpUZMLeO4FePFlSadTCNI4PdfTTVFhFEJVao3HAPG8oryFV
 UkJmeZDNMKAB3hl6qlTXA==
UI-OutboundReport: notjunk:1;M01:P0:rkVqxm2aGVQ=;zGF5F+1kVEEo/LZX2VGPsSS2dfB
 fQhoVOT5jr81G3V8wOUPyfX19GLfFtj3n2CdLr4RUHPkW3mN1CvZeEMHLG9qzMSEzEyCMbcpF
 FWvPjo/mTJSlx/R0gtEIXN8oceeRilcsFHrousjL/C2z9exvh98CC0Ps/JQpIOUhR++Pn4Fze
 4fHbjqIBnbdARWETS+JfvLM6grVTkH92fxPOpegl0n6HNUUfaZs+Ppj7BvXTp6tqlGl1EZHE4
 i+9wk/StjEmO87uP9qYXvH6VvPR4GoFEH+bqFET3yNjXPdxhI+TYdtKYLLDEUKf/TcKU1gM++
 9zZoMGGiCbhEdQ0NrgdhG495QJhzTRg1/mXTXQUteGsDBx1h7QVm4q+PPA1sa2E+vT10XtfhG
 cM5VozZ/Ts5JEEw8f/eE4Ih0PL2+GSi+ycfQT7fS4LdelyHk+Sv1iIMZ7STTi1hJvdRbujS1h
 eA9NLhw1XW9WgwbtXWdbspFhsOEcDY7OX5qgu672uE0eCSuOLbGEu/2vDTX7s/RjxkE7cYhf3
 U0HaVTePQ/aaSp0WHKzjFXsSFCL8trOVFA7+r6k2iwQkJBaSvIcfQDGqUz9WBomFHcmViuvtr
 ZuT1Tj4RfWLTDCcoIA/95+J4B0CywXL5sztelhyeOt6ETslBmO6GoTFo68AA6mea4GAjJ6z3c
 6lHahpmPO89iZ9xkpybTzVNBC0CQawOmMHyo59xD8AY3Kj/bCX0kTQdLAcA0VAChHDPUKD64F
 0qUP+0mcAfHqs5XErKOOJF+GFF5PhaEfqZil0pLhz+R3aj04UkX1CpsBTCrUbrTn0I8GfvZP3
 wA4ilTGhhb1/nTp5DzTQRJARqai6/GPi2NwLOzRl+5Qj3YH2E/ICHmF0ogkyuOtOC//WEiqQZ
 +ISV4CwxBCKLy4aDbzlqGTtwKdNADFjNFi6AcbgbW5anIkwOtPVsqhARl1ABoLcfjzDyKgJ6S
 SC59L4GCzqC/fFrU4/Fqn4YGVl1zEWZxR7YgtrlF3tTf9yDR2glKKAkJ7NTgAgwhpLK9+HYp3
 Mg7mqx6LB3ZBew3xtlHXNVoyrF81SlkZalEaYn6r9sLfWSaonI+tfBc+M1cuSHtkbjROYaBwD
 Se92624KFVISiGep8L6fvN1Bc0YI6Bk1Dv0cmrOuTw+jSaqKe/IjgsaB2679K71UgMdTqKhVn
 XYiMwFGCurvmKzVJRZLaelAjr2RvLw1nFVTAK1HHfyMiSlh3sMK0VXTDeohcJm+iQxnW/QeKU
 TQq+2k+mKdAgZt2FCqybqLIbHS3XBjm/i3Lpg7PCOnIkzpbDMpjWoJ+b+RPf25XyINByZT24V
 tj8TREbYcdqBK/krzDFBzdaju0invTqtl8QnF5ohR8xvFffVqVZWA2abN9/w6Ai+mrfwEd0wp
 BUG0L445EEcdBFrFVlAnHMOxR+xems++8IJYgf1OeSoEASRrXjLceLTEbm7/HdBJFjAJWZm0U
 lUrGBf4tyrb5LIw3E+85G6yL6jzKer59I3JCnAdEnsFijh6HW8p+GFOUjuDBJjcO1F8Y7zpyC
 s+r4Ii4S7p54GYBvQwyMNeXpaRYZ6PwXsASHCXSmh/R0Ehp3a6Z8d8fgS4phn8NJGZCffF8YP
 YipUjxacdNq0Gw+Rt1swT7jMeerhDFlnVPJNhoUBJc47DjMq/IpREB9I0ecQPDVypzipZ7uZE
 fBZr+fDP1Ki4B2ul9Z7UcH/KM3WFuo+4UqAq80SeAn2BSaHh/15wUqgJckI3r9zzLGv/mQjM0
 MIGghjfvbap4LIDk21unv6B5jcc8NTD/VI2Oro7zAraxaDTqqK8GEihhifKnVRmTdWaJQ5bnU
 RyaG5A1FG8XY5uz0kWtXWdbHaqeVrBuy624+dOz+2ZyZXefn/wm7Ny5iVlivtqvc7ikK07k6O
 R61ZOvelvr/ZdXfWUvvRZbkQhY8te9g2OOoPIuEpt8+oFttviajzkYzboOpMveOnGh7jwJm1v
 TTFHP+ZcyyTWFI7NipBGQhyO9RvWgJKyYv+Hjl6nFT58sG45cQpDN9MNg4PSJPd1hvRkgH9rn
 5yJbv/hkJsF9zjZLo5xQ94OpyJr1jQytBQQn7eMf4vksDE/X8F9b13gocUo30QrhsyGHKJsN3
 P+jwFsgyBYRTCsALf9IprNPYWFOA15IOaehhmplgmj9RjmdqPRtYkzcCtpMgsLNtS1UegfWH1
 kotbctrqdlOgwn5ZHHIPfPe/V157gJFZEvYWZ6tkfYjPQ+AMXY7RMOhpsUuHQgI9wTWWyQ8r2
 0qdFgCDIpK4R05aAzVwtnX/bUGtXsPU7HuUm6/6dibtsISLnj6f2N76f2pToZXmiaZaOKV+pO
 bq8QTpgtgjFJFVNCBuEhbcoETWQZOK/ngTtUbEk8kjjnlSuga4hu4kbXoBcshW0zymLIZTO7D
 jWhJI69qtoxIbCGuFakvlvQBiRGfDKrdPq2py906VBfaaeOz3xdoyOg3tUBPfvjXGJXzZ+jRZ
 Fyw5HRm99UkfHxk2olDWYCpTnegnvrq+4UyUZ/5rUBwbOgN+A5dvK4iRRrO6VL5HTJVlYD0dT
 l937AP1Q3poJvpatPavuS59tWUlmKeioQLLwHHv3/KYLqVnV6mj0S9I+SI7lSQXpszFckUQrB
 IM6H/OsM26hhXZf4dwB3NfRqRA46UkR5uP6rcZ1HEb8rOaED9GkRXnUz/x9deT5xWcdMmGDY2
 OhzaY5kp6FhfHEJ5B/ay8wjXb8ROzwzfrIajmeJNj3UI5YsstbPYphSsHSXFsE7+dcE0m2rsB
 Z9OKK0De1BEHoaek8eFNh4crVKQA3TEp19nejVci8utGhK9kq0WzX5lRrNlS9Dz9n5ooYm1Cs
 kx5XwERi17JvB/2ii9pbbw00sn8hrmIjtXup9bXGVvUOQGkrw9ZN4IpP4vlLBLycOWxYDnZ0d
 ymJTMcT33kwnNk1UvJBf1JGKZEEt8pS8xpu1ifivNFFH5JckIQAsd6IS9HMWTXJV7xiUDi37D
 7IG8Q+Nzut5ml32yUxZ5Pj5dn/TeJDLvDQxMFa+ZxWc1yKZLHYlAJ+wWebuuGcJVhsdqC1if3
 3v7uXDo2eXOg9C0OGIzaVCjL3hKH0u6JlQfHoKjCzFfkNObsmWF8jSMcvHUNE4qYVbibxXxNM
 iDYp6Yo8Z+0Sx3zE5wHzXOkVPbs1ZNTDZhJjFVSwzJHBR2bYzeZiAs2QvCpewQsAyRmBMpcVS
 hknbjc7scOqSnEzcNY30SCeOK6pCHYoLEkZ4aYxTPZwNLFaB4rNwx06t2zvDSDpcsnFA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_020535_726625_7BF55590 
X-CRM114-Status: GOOD (  11.24  )
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

Am 19.06.25 um 13:46 schrieb Fabio Estevam:
> Commit 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
> introduced a regression on the i.MX6UL EVK board. The issue can be
> reproduced with the following steps:
>
> - Open vi on the board.
> - Paste a text file (~150 characters).
> - Save the file, then repeat the process.
> - Compare the sha256sum of the saved files.
>
> The checksums do not match due to missing characters or entire lines.
>
> Fix this by restoring the RXTL value to 1 when the UART is used as a
> console.
>
> This ensures timely RX interrupts and reliable data reception in console
> mode.
>
> With this change, pasted content is saved correctly, and checksums are
> always consistent.
>
> Cc: stable@vger.kernel.org
> Fixes: 7a637784d517 ("serial: imx: reduce RX interrupt frequency")
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Thanks

