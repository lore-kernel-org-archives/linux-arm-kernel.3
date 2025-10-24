Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D36CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 10:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1Ao409MtaPgUYRpBahYZXHRywkGhOPNNwYQ3CbOmSk=; b=JU6P3p53FSb8Shs8IN62OiHUB6
	WmjSoWaRLWSBgOMyKkirtuQOeCsmul9fiO21iyoYZOQJhmk23flaN6GVS4tTPtUtngHv6y11B7eg2
	A6wZ7AW2aCp3Ts1/Ozv8KNOf8WyJAtmZkj0yUy+3anCPA1rqio61JT3czkskLi+wILD8C8pX3cmLk
	fRkQLPd0iMqwzq/PEhlMUCHtQKEWAzqOogY9952nncyIw8DOJQjMoHK+b1R1F+ZSa+dR2aSmhh7Dg
	vXuaOJqmKjM1sw/Ps8QJ8D6iK4JW13d9YG92EccU4ruVF3+b/De5t7xvUG/883eVcLUUfM8xWCo1M
	KakQElmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRH-000000095W2-2EFv;
	Fri, 24 Oct 2025 10:54:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFRF-000000095UZ-3UYY
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 10:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y1Ao409MtaPgUYRpBahYZXHRywkGhOPNNwYQ3CbOmSk=; b=Q0rLAhnPUX9YW8gQxnTv/RQuE2
	+dAxI4MIiIHKrodcy8Kcr/fj3SnkSItPdxZhnUxSOoUpYWVVwokAGgUy0osIeME6cP3Ep/BdyYgYr
	/NY9y0D/lQKdQ5FdU4EXQzu8R7oAGI+urBgM71Phbe2AeACoeC+8+0mzNzJkrhaGqBERgcI87gIrv
	XtcI2eYRHddszESL5X5rr0QmCY+ilgf5pV+lGO3Q634CVm0k4emz61EfU3B57DZis5ju+nMH+WedU
	ALso7817ynWq/gxL5/QC/+6Jel1YrpS1GdRvJPcLOJ7j/dR58FxQRRY/Ncabx+FnC0TwkLAJpa45W
	q6zNQ8wg==;
Received: from smtpout-04.galae.net ([185.171.202.116])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEZY-00000002DX4-1UEH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 09:59:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1BAB3C0C40F;
	Fri, 24 Oct 2025 10:53:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ECEF160703;
	Fri, 24 Oct 2025 10:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 96ECB102F2355;
	Fri, 24 Oct 2025 12:53:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761303255; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=y1Ao409MtaPgUYRpBahYZXHRywkGhOPNNwYQ3CbOmSk=;
	b=wFOTnljMgZcJ9fFHGVUItDYZLELl/nQ9UUjZkKVBZJ440S5fcemvTZjmbaMAdRgSKyuPz/
	8lsfoDzhq2GxO9LzzfOwG4pEW1uh+ApYVf0cjxtPFBmz3Z3b41IxtAqXOjgpkrg4ZMVwRf
	LsrdvvwKXqgxFfBn+dwd1CAiRrutSKALKw/kGdv9Xuxfu8LVqJ4+jn821L91R9OTL6Mdu6
	NcFpnAtXY3nHeQn1imhGR8o123Lrkivf8wYdoLljGN/f/V2m/fW7MHsCuz0u2op1dJNw5L
	6yL9i5xDEF+X/qPX1MthiIvhw+8BJruccXktW9g7OJwJ8DS4bhbeNq4ZuA74Sw==
Message-ID: <1a1cacb5-0005-4b32-8e68-624644a38f92@bootlin.com>
Date: Fri, 24 Oct 2025 12:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/8] net: stmmac: hwif.c cleanups
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
References: <aPn3MSQvjUWBb92P@shell.armlinux.org.uk>
 <28d91eca-28dd-4e5b-ae60-021e777ee064@bootlin.com>
 <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aPtZg_v3H53hiQXo@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_105900_544580_20BEC4AB 
X-CRM114-Status: GOOD (  13.82  )
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

Hi Russell,

On 24/10/2025 12:48, Russell King (Oracle) wrote:
> On Fri, Oct 24, 2025 at 08:44:07AM +0200, Maxime Chevallier wrote:
>> Hello Russell,
>>
>> On 23/10/2025 11:36, Russell King (Oracle) wrote:
>>> Hi,
>>>
>>> This series cleans up hwif.c:
>>>
>>> - move the reading of the version information out of stmmac_hwif_init()
>>>   into its own function, stmmac_get_version(), storing the result in a
>>>   new struct.
>>>
>>> - simplify stmmac_get_version().
>>>
>>> - read the version register once, passing it to stmmac_get_id() and
>>>   stmmac_get_dev_id().
>>>
>>> - move stmmac_get_id() and stmmac_get_dev_id() into
>>>   stmmac_get_version()
>>>
>>> - define version register fields and use FIELD_GET() to decode
>>>
>>> - start tackling the big loop in stmmac_hwif_init() - provide a
>>>   function, stmmac_hwif_find(), which looks up the hwif entry, thus
>>>   making a much smaller loop, which improves readability of this code.
>>>
>>> - change the use of '^' to '!=' when comparing the dev_id, which is
>>>   what is really meant here.
>>>
>>> - reorganise the test after calling stmmac_hwif_init() so that we
>>>   handle the error case in the indented code, and the success case
>>>   with no indent, which is the classical arrangement.
>>>
>>>  drivers/net/ethernet/stmicro/stmmac/common.h |   3 +
>>>  drivers/net/ethernet/stmicro/stmmac/hwif.c   | 166 +++++++++++++++------------
>>>  2 files changed, 98 insertions(+), 71 deletions(-)
>>
>> I didn't have the bandwidth to do a full review, however I ran tests
>> with this series on dwmac-socfpga and dwmac-stm32, no regressions found.
>>
>> For the series,
>>
>> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> 
> Thanks, it's good to have someone else testing. I do need to post v2
> with some tweaks to patches 2, 3 and 4 due to a typo that gets
> eliminated in later patches. "verison*" -> "version*" in one instance.
> 
If it's only typos, feel free to keep the t-b tag :)

Thanks,

Maxime


