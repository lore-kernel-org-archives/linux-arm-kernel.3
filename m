Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF1CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 21:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhCzQpUuv9UhFSVnjO3fXTIyMGdXXq6zKsNxodXiKs0=; b=e3sZkvezNI33qeYin1Ra68Epin
	J4Zg+O2XrhWsZ1bLubAs4mTFueCMn0ICTo01Z+6yG56b2bBO10wyOpmrv8tlICHAX4IOTMs44mmMn
	q3fMUYXkS8Ah1rV8ngc/5AMWORe/oBER6yApwG8axSM40zusK02M6r6OZaDaNbQF41XgcdruHuMZU
	pGowQiF9gfnvXxNg2KGlaR3X/Lcg8UPXHZrXv6sqJbwwAtYJdQw1d08a92fLF2U0pekpAop1PQe64
	/gWNGL5C1ZUVtS3Mpu82xN4ctqp72bFIZmKLaC8HRkMiqEQf+AtKxT8wrr1r0gKBHpkOnkdG0AKGK
	+1Tm53Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgXQ-00000004N8w-2VUM;
	Wed, 22 Oct 2025 21:38:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBgXN-00000004N8Q-26Io;
	Wed, 22 Oct 2025 21:38:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761169104;
	bh=n8Zw4/wL2Bpk+jmRSKZmBt8iLjAPrPIC2YC696U3FzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VJLcnh4ayIO1ND/GoKsNFJdVA/pHuQxF9EjhZPaze5oYyuV2XxVy1RgsGoBbS9e3R
	 LxfwaTNytcnZ3SHg4N+wIxhbuFKFSyhLtuGg7QSZEmIvFbxKwvXrW89NVknVpWuM9A
	 j/KZ2Limkj9/FbGzuIHFuNacceSReGYosvvPu4w3+x1e6O+J8oRdgpE7w2tEsjfix0
	 4E1fLU9qWr9QWCWM+ZD5vwEAYDv5t2O42PpmF7otv1MGxjZLPlSIHNcghyvSFS3SbM
	 TSZcZ0I87q2UY8tqjLbUpSWfoDhuhschIAn7cID9uD0KoRGmDsXiUfrn9i6OIE8fWb
	 ZoF+qOUJ4obvw==
Received: from [10.40.0.100] (185-67-175-126.lampert.tv [185.67.175.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mriesch)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF2FD17E00AC;
	Wed, 22 Oct 2025 23:38:22 +0200 (CEST)
Message-ID: <9063b2d2-d496-4577-8e71-885760e41410@collabora.com>
Date: Wed, 22 Oct 2025 23:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/18] media: rockchip: add a driver for the rockchip
 camera interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>
References: <20240220-rk3568-vicap-v13-0-da164b4918fe@collabora.com>
 <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <aPkM8wD7rbFaeO2N@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_143829_713871_05F83ECE 
X-CRM114-Status: GOOD (  10.73  )
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

Hi Sakari,

On 10/22/25 18:57, Sakari Ailus wrote:
> Hi Michael,
> 
>> The driver can be readily extended to provide support for the RK3588
>> VICAP variant. In order to keep things simple, however, this extension
>> shall be submitted separately.
> 
> I can't recall whether you already did but -- can you provide a
> v4l2-compliance -m report on this version, please?
> 

At some point (maybe v7 or so?) I did provide v4l2-compliance reports,
but only for the video devices.

Now I gave "-m /dev/media0" a go and the tool found two issues with some
of the subdevices :-/ Sorry for that, v14 coming soon.

Best regards,
Michael


