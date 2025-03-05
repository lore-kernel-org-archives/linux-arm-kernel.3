Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D00C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 10:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
	References:In-Reply-To:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t/i/ZYSpCCcaalSAZPE6RIBpR+1kehNr94nOWqgWFQo=; b=5F1J7h+gnVaaY6F220gXgvdY3T
	W4rTBIRtARP1BwoNrGDeT7DpSF6YsTHdYvYCnIDlV+ZYsOprkcsdaT8aLibAHZ7nsdO4aJa5/0tdo
	Iw4zIgS8qRdW3vqKh1FRZoiN0UlDzjNWACKiiLk0KZBpSRF73r5RwBtFIidO4wHVK+Slu6zHxiw1p
	CB+DU52iCq9CR6PXpQ0DXdkNFkzNTeXS2C4YdE6x6GreKZBVa5VPVXPIlusQtPvRXYuz7hFZoA2HV
	AVqrSaD9upxBNI7wrYHlnRTatUqTjvMhcP0ySpQkMxKq2qqmXOUvSgXBAurMSdHYna1w7ssegw7Xo
	cZ3yPPgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmPW-00000007lSt-3HjR;
	Wed, 05 Mar 2025 10:55:35 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpltG-00000007fEg-35x2;
	Wed, 05 Mar 2025 10:22:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 25A8A204D0;
	Wed,  5 Mar 2025 10:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741170131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t/i/ZYSpCCcaalSAZPE6RIBpR+1kehNr94nOWqgWFQo=;
	b=ED6gCxt9+D+E+Xnlpd76DBNkUVjEG/t0SiS3K1jmWMHm21BlSSePusLZ5xQ4KYtIwjO3ri
	DraOId/ugKydAwHutaD3tO1JHenfvXHELPfZf5SKRF2hlcsBQw7FyKXPx23ScoIiwWEUx7
	0VpJ7uy4rnxiZ5yzdqkK0EPiFdG9q1B4SIKPJFmmSiMenCuTx3npfnjW42+R2loxzYYFsa
	lPmRZfJwBnP93F1ciH/UKXT9p1i/kBV8+sqHj9F8BAQJt64Y1CAiuLEh31UIOnr4K4kPOc
	xj/plfY/t8/RqTB/zA5G1f9ruQjYBksXuu/3/1nz/JhuS+8J1OQI9tW5whqkhQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Subject: Re: [PATCH 1/2] mtd: spi-nor: sst: register SFDP region into NVMEM
 framework to read MAC Address
In-Reply-To: <20250305100134.1171124-1-manikandan.m@microchip.com> (Manikandan
	Muralidharan's message of "Wed, 5 Mar 2025 15:31:33 +0530")
References: <20250305100134.1171124-1-manikandan.m@microchip.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Wed, 05 Mar 2025 11:22:09 +0100
Message-ID: <87ikonydym.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutdegheeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledvrddukeegrddutdekrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddtkedrleeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedujedprhgtphhtthhopehmrghnihhkrghnuggrnhdrmhesmhhitghrohgthhhiphdrtghomhdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpt
 hhtoheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehtuhguohhrrdgrmhgsrghruhhssehlihhnrghrohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_022215_232425_1E3AA0BF 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mwalle@kernel.org, vigneshr@ti.com, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, richard@nod.at, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, tudor.ambarus@linaro.org, linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Varshini Rajendran <varshini.rajendran@microchip.com>, krzk+dt@kernel.org, pratyush@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 05/03/2025 at 15:31:33 +0530, Manikandan Muralidharan <manikandan.m@micr=
ochip.com> wrote:

> From: Varshini Rajendran <varshini.rajendran@microchip.com>
>
> EUI identifier and the MAC Address of the Ethernet Interface is stored
> after the SFDP table of contents starting at address 0x260 in the
> QSPI memory.
> Register the entire SFDP region read by the spi-nor (nor->sfdp) into the
> NVMEM framework and read the MAC Address when requested using the nvmem
> properties in the DT by the net drivers.
>
> In kernel the Ethernet MAC address relied on U-Boot env variables or
> generated a random address, which posed challenges for boards without
> on-board EEPROMs or with multiple Ethernet ports.
> This change ensures consistent and reliable MAC address retrieval from QS=
PI,
> benefiting boards like the sama5d29 curiosity and sam9x75 curiosity.

Do you mean spi-nor have a programmable area in their SFDP table? Isn't
this supposed to be a read-only area written once in factory?

I am not a big fan of exposing the whole SFDP area. I would suggest to
expose just the MAC address. You can make use of nvmem layout drivers if
that is needed.

Thanks,
Miqu=C3=A8l

