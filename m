Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447BD65C79
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 11:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pLMacRKlPet9p5fPMuCaelfMhnyBJl1PynSOsqosTbQ=; b=fIuDi/BGGbccvI1F7X/aAo3E6l
	WPWgwK3bC4TZXUsYshvC8Ho7VJjvfiZOPcy5UbVUvbGLz6GagPP/w8Dqqayt/0hvFi1JuvGFzdNyH
	hdp90r5lVN4j+wEGZ8QbiTn+L3++VUwSpi2Z9epMrfhwcKT/zAuuu6YI354zprj9OJdFVRP30nLr1
	zqjp4cPSCxWCaODzOIAxnwv1+0ClJC3F6m8F7mNTbcxB+QGISuH2C0mWIXBKw/dlHA/ys+fAKar9f
	AKWouLhJ0KXw/qr3vCcHbeOmbwvVnkZ55H6tFgROhIyWoRj/uQvY9wI8Ps9s8YU2zpcyvLltCTqug
	yosXoLGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY7X-00000009kG7-2R4d;
	Thu, 14 Nov 2024 11:34:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXDj-00000009ZEt-3VLo;
	Thu, 14 Nov 2024 10:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580621;
	bh=vdcjX5fDRMTd/FV31avoaAW6wAwBl2Cr+rjm7WpH6Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3bOK5V99lCM1rcj6Qfp1JPTdBJChP+0o5R7aiQNeICN4e8JYWhhtuWVgqIEmgIis
	 Ff88QFmjFvPIHG4fvIDtX+CefMVJvHHkvoZBvaiVzepIry+mOmEOCe9ShPluApwJlZ
	 WN/P4FYJB1ZlwbiRCqyLZIng9tQvWLANgxb/emIY4LDWJnRaaJVnFNX67ILYkkP5jC
	 QKn6yQccLcJBrUCtU905WuNfeqhTpG471tgLwDuRmOHpxBSUQPdEjq6jCBpj2AgM8g
	 QFq2UN2Iy1HYvttFVcNsJ+fr0V48rDVRIoWWZWgB6C4rRJCp/sDvtucXT+RzY7q93j
	 6SI3h/q+C6uCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 318D117E35FA;
	Thu, 14 Nov 2024 11:37:01 +0100 (CET)
Message-ID: <a01c0703-5bdb-491e-b4fe-6374dfc1f49b@collabora.com>
Date: Thu, 14 Nov 2024 11:37:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/7] i2c: of-prober: Add simple helpers for regulator
 support
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-5-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-5-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023704_096166_F1BD7C8F 
X-CRM114-Status: GOOD (  12.16  )
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

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Add helpers to do regulator management for the I2C OF component prober.
> Components that the prober intends to probe likely require their
> regulator supplies be enabled, and GPIOs be toggled to enable them or
> bring them out of reset before they will respond to probe attempts.
> GPIOs will be handled in the next patch.
> 
> The assumption is that the same class of components to be probed are
> always connected in the same fashion with the same regulator supply
> and GPIO. The names may vary due to binding differences, but the
> physical layout does not change.
> 
> This set of helpers supports at most one regulator supply. The user
> must specify the node from which the supply is retrieved. The supply
> name and the amount of time to wait after the supply is enabled are
> also given by the user.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



