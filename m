Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FEE2CD0438
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 05:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fFZdK8UUvenzvPm6N9koDU/fxnR0ekW5TI24xZDY6kc=; b=elSEztMEerRpxFfnYvc0SannrY
	qf0TBfDgT64Ms8Ubveft0dNzl+0xsk7TnPKU6gIJ4cAYlintO+y+fbL9V5VU5EULFt10x8/I2qIuX
	4E4/pjkJiZy0RsB8Kv6gv85h4EcvgIU8O0w+HiAHeIjnECGcsCK+YpcOsVxsx5/L+rw8v8w2ydXSS
	fLTmQfqkK7S8rdBIIFpHSCQWhTeodRLs4SiaY82laFUAqNLh/1ICLYZsau9LsjXcMHp0TvNfUGApT
	rkyliwdynZ9/SUmlpSAYAC/Bo/nJaYbZNZ/fdMrCjTcfyjU9kpGpo9d9/Gbr/mlgqeiZPiyConHIc
	sGZManvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczGH-0000000CQgs-0eR0;
	Tue, 06 Jan 2026 05:05:41 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vczGE-0000000CQfg-0Yxz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 05:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=fFZdK8UUvenzvPm6N9koDU/fxnR0ekW5TI24xZDY6kc=; 
	b=YCBTmcleUU2N0rXwpVT4Xw527tlZr0N7PHGhoRYbFxi0V1yz0MspEiuaUgluwOHJi7UgUWJeaCo
	aI+V2pDwpQLlu76KzkCMgTJfa8l73o4xERcZiC67fI6SQ38NHKqBernGbeIoTm6iaacIGzGhOr5GY
	a7chkrDVBcwvZvi4K0hkD8kW9kADwG6VB2ySGSO7s2ZMuzQq0jjPbzgahByLEVKD7zpOn7S8o+0U3
	CubE9wpUlCoN7q0wO2G+XJMN/qiJZ8rSECQv2HK4BVh6Uiw6J4b5giymeUTqeEWc7scenPFiItIlz
	iOppOn/L0OnchT/HUMcryCLJmTDYf6itFTjw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vczEy-00EaCi-33;
	Tue, 06 Jan 2026 13:04:22 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 06 Jan 2026 13:04:20 +0800
Date: Tue, 6 Jan 2026 13:04:20 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Garg <sumit.garg@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Huewe <peterhuewe@gmx.de>, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-mips@vger.kernel.org,
	netdev@vger.kernel.org, linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org, linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 00/17] tee: Use bus callbacks instead of driver
 callbacks
Message-ID: <aVyX1GXxdJXv438W@gondor.apana.org.au>
References: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
 <CAHUa44FrDZbvRvfN8obf80_k=Eqxe9YxHpjaE5jU7nkxPUwfag@mail.gmail.com>
 <20251218135332f323fa91@mail.local>
 <CAHUa44GpW5aO26GDyL9RZub9vVYvVcJ7etwO0yXBN_mUi0W4AA@mail.gmail.com>
 <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHUa44HqRbCJTXsrTCm0G5iwtkQtq+Si=yOspCjpAn-N2uVSVg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_210538_829578_EC2321CA 
X-CRM114-Status: UNSURE (   9.55  )
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

On Mon, Jan 05, 2026 at 10:16:09AM +0100, Jens Wiklander wrote:
>
> Herbert, you seem happy with the following patches
> - hwrng: optee - Make use of module_tee_client_driver()
> - hwrng: optee - Make use of tee bus methods
> OK if I take them via my tree, or would you rather take them yourself?

Feel free to take them through your tree.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

