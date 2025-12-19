Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56785D7879F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dY43rN6sGRL1A+mQKUSkpdwUdQZGE0/OzYxKG9vYgOs=; b=klgJ9tNs44BaSAR+Eu9anut99a
	+yed5tiWiVl2hl1vYbUQqZ4Awio0OfgH7TNQBQ55Gu8QeJcpKhfO6sPtELwCjyIhY9TKG6oqnaSYZ
	hCiIfBFpNxE7dFrZtW1Gnve64T9oMnsejSOYqvCjTr79HXA5pzCThwPQNLoaxFqGqmzI2xVuosh6q
	ZI0wzNlQjkgJCPYFVUZqFa7nmVN/aen+Je1YeGZFwdg2GDBf/DRip2iuFbIkwuFvRCA2zF61EtCAT
	gqLOihJRAP7/3+d+mZ6X1KPoLyOeQ+YplUjSyHOwLTrVUk/AotAeG5qNv+S5caFDHMlnNEW0DaGXZ
	jbT2J1gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf1i-0000000Aosz-2ZD6;
	Fri, 19 Dec 2025 18:16:31 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWf1e-0000000Aoqx-2Hln;
	Fri, 19 Dec 2025 18:16:29 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4dXwhm5rhhz1XM0pZ;
	Fri, 19 Dec 2025 18:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1766168181; x=1768760182; bh=dY43rN6sGRL1A+mQKUSkpdwU
	dQZGE0/OzYxKG9vYgOs=; b=yukFyBaxKlcca7WoTKsi0J7Y2ejfaH+EHdsQwjnQ
	okYRSwOUnpUAZPAdxxUqTz6A8ETwGuGfWcnyexyMjsWu2oo/JJRv5UIJW3kwoPRw
	Tm0LUvdAPEGQtZ4niTr9UkkCzmQ668FJ3DNHIbEHmkTuqQY7Pn6Oqqj9Onn9FTuL
	Qc7C56AXgNTY9K5EE7RX2TIpWSKjyx92mS6HLgryxcKaq86nK5A2PMlwxtHa9Ekn
	VOjK4LZVrnkCq6GiqKlKWKS9KaEZ9fsElGddaaQcYTKGy69PlT7n+u2yalpr21kF
	8a73PCc3wuq/vI78bhpTN1HC1E1+yPj7ko/o8UHxisRZUA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id ZYtMLHKht-ke; Fri, 19 Dec 2025 18:16:21 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4dXwhf0nybz1XM6Jc;
	Fri, 19 Dec 2025 18:16:17 +0000 (UTC)
Message-ID: <4594adaa-6ff5-4157-ad40-df2009126f89@acm.org>
Date: Fri, 19 Dec 2025 10:16:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] scsi: Make use of bus callbacks
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 =?UTF-8?Q?Kai_M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Peter Wang <peter.wang@mediatek.com>, Bean Huo <beanhuo@micron.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Christoph Hellwig <hch@infradead.org>,
 "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, linux-scsi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1766133330.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_101626_608830_1FF3387D 
X-CRM114-Status: GOOD (  16.56  )
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

On 12/19/25 1:25 AM, Uwe Kleine-K=C3=B6nig wrote:
> this is v2 of the series to make the scsi subsystem stop using the
> callbacks .probe(), .remove() and .shutdown() of struct device_driver.
> Instead use their designated alternatives in struct bus_type.
>=20
> The eventual goal is to drop the callbacks from struct device_driver.
>=20
> The 2nd patch introduces some legacy handling for drivers still using
> the device_driver callbacks. This results in a runtime warning (in
> driver_register()). The following patches convert all in-tree drivers
> (and thus fix the warnings one after another).
> Conceptually this legacy handling could be dropped at the end of the
> series, but I think this is a bad idea because this silently breaks
> out-of-tree drivers (which also covers drivers that are currently
> prepared for mainline submission) and in-tree drivers I might have
> missed (though I'm convinced I catched them all). That convinces me tha=
t
> keeping the legacy handling for at least one development cycle is the
> right choice. I'll care for that at the latest when I remove the
> callbacks from struct device_driver.

For the entire series:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

