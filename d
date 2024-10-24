Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78B05CE8E9A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 18:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD/MvoTUjjchDlHO31PqaPi5FVCTTnWec43Dr2sc5uE=; b=mABrOTsF0gKwPYZsRc9/M7jveq
	/qRbpVEpLMH4LGNm8ARRwmybN1uNoC5fUHeREVGWpzsvY2woL+lMyVN215+veZAHp2hNqBebxMUho
	gdM9TjgOaxpB/hoOkBfCEqISQqTeEwmPyWqq0Xyhw4zU7z8fk8kgqkbdVZo//cLsBzC/1A4F5sKKv
	YBBDDcNXFjHIKL74PauM/BzfLKBvyTBELS6L9YgKNyv8VMAvV6t9ObMsT/d+4xjNKFBhvTqJp28CM
	uQn/cAC668MD4cf377klhzgUQ/sXm92Q9qzSbxeEpz0qYpJkecqo3Omri/+9DJu05Q9k0Ig81aHqY
	Wa9Ld8bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t42Mu-00000001REn-2ywn;
	Thu, 24 Oct 2024 18:15:32 +0000
Received: from mail.notyourfox.coffee ([92.63.193.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t42IO-00000001QCz-3Uui
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 18:10:54 +0000
DKIM-Signature: a=rsa-sha256; bh=zD/MvoTUjjchDlHO31PqaPi5FVCTTnWec43Dr2sc5uE=;
 c=relaxed/relaxed; d=notyourfox.coffee;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@notyourfox.coffee; s=mail; t=1729793394; v=1; x=1730225394;
 b=JHSUzjKls5Wm839qvhA6nxJdgjfFHYyuIMcFJC4py2Th5/lRpBJL87itZiTg0D7g72byla2/
 RGt9j0YQZcrrSnTMUigTkonLFjKQ1wty2LN+88I2MCPC3PFacLmQ6qZhW6CFbZFxlrquYkL2uWA
 8n/E59Ut+LmSKvFcVYkl9wkkdRh8MLTO73De9KCAPILQIWuDQToZmui76W//DdF1v3lfmvIwrLC
 00BhABRp1gebdHeZoI70ehEYTqlEw8KiEoYc1vSAp1tKTck0QShQZ9gBb/1Ia55r4kKsUVkpN30
 gJICGzIIOhLel8x+rFvTjeBr9jYMQEnr6fmrnHA+6Rz6Q==
Received: by mail.notyourfox.coffee (envelope-sender
 <contact@notyourfox.coffee>) with ESMTPS id 1345da47; Thu, 24 Oct 2024
 18:09:54 +0000
Message-ID: <c58172db-e3cc-488d-baa6-f095588a8771@notyourfox.coffee>
Date: Thu, 24 Oct 2024 21:09:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vladimir_putin_rus@kremlin.ru
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
 dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com,
 geert@linux-m68k.org, gregkh@linuxfoundation.org,
 hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, jeffbai@aosc.io,
 kexybiscuit@aosc.io, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fpga@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
 mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
 ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org,
 s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru,
 torvalds@linux-foundation.org, torvic9@mailbox.org,
 tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, wangyuli@uniontech.com,
 wsa+renesas@sang-engineering.com, xeb@mail.ru
References: <20241024140353.384881-1-vladimir_putin_rus@kremlin.ru>
Subject: Re: [PATCH 0/2] MAINTAINERS: Remove few Chinese Entries
Content-Language: en-US
From: NotYourFox <contact@notyourfox.coffee>
In-Reply-To: <20241024140353.384881-1-vladimir_putin_rus@kremlin.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_111053_066611_D2EBEFDA 
X-CRM114-Status: UNSURE (   3.26  )
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

And what were you trying to accomplish?

On 10/23/24 1:45 PM, Linus Torvalds wrote:
 > Ok, lots of Russian trolls out and about.

You just made his statement valid by showing yourself off. Thanks for no 
help at all.

---

И что вы пытались этим сделать?

On 10/23/24 1:45 PM, Linus Torvalds wrote:
 > Ok, lots of Russian trolls out and about.

Вы только сделали его высказывание верным, решив выставить это напоказ. 
Спасибо за абсолютный ноль помощи.


