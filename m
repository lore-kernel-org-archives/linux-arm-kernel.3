Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD7E0CF6A88
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4TCcFkYFmaIFivChqdLskflRGtlFlV9wAwx0evbQiU=; b=siwDRFrR70xE6NMcBEfU/ZuUaT
	G5gOggLNGZ7eGRbxxAiosURcHqiz9ZlPrMnWTJUIwLDezbHo+EzoKLASYhF9QyjO5ZOWajv0KR7NB
	uNBV1tWTLO8I5+7zloIlUU71EXff0KbxvRT8RK4AIsFSM9B6v61/+lzEgzbqEy9s9hKw0U5Ga84wO
	ArsJ7RVmHLVoke2JJnXMlQH7rrr/HBlmsX6lt328bQoG7cBNoL3reVk0LBOQbDK0QPpdoYQ3q4YWk
	aIqlGxIIV2MrtXhd6YMVjxNoiHN6Fr6y5CRglKgFgqMruqJQCxj5Jh2jfWh1yT+5ZSZCIAOHWOkA+
	yF4gIKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdm8h-0000000GPiH-0huq;
	Thu, 08 Jan 2026 09:17:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdm8d-0000000GPhC-10ms;
	Thu, 08 Jan 2026 09:17:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1767863819;
	bh=pf1GMbVTykZwhfXBrZExf4VWzpjh5hKk5lemY56B1oc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwgIcuBDhAznIucBWIlQUrV/YF0Ifsmu9P1uNUD44NDsCwNXwEhlHZfoVasE/CZBH
	 xMyK9pkZ6KbLswJSW1F7cZUDOfkpxb3rIsavS2QiMPyKJcHkSqapge/jL8DTV/0GF5
	 B6Ihn373AWfeq+jJmQMNVaNnv03pNt9Dp5hOVKwEfwXt7X3QhfG3uj5N4LyS33OoRR
	 fC+gT9ujB5Urv7/m1qPZFXiVuhlafXMK4pY3bSXQdIXUglUqW0KkpFDJcJ9uW0+pzk
	 EGRdY3qjjxqPpdKE9qSOFiHsnffdGbZkM9BuEijHKkfsoVckJDkFS2oRUpt+jGhS79
	 5AiJcxoUNyQbg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B08717E11FB;
	Thu,  8 Jan 2026 10:16:59 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com, Zilin Guan <zilin@seu.edu.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
In-Reply-To: <20251228162636.3829733-1-zilin@seu.edu.cn>
References: <20251228162636.3829733-1-zilin@seu.edu.cn>
Subject: Re: [PATCH v2] soc: mediatek: svs: Fix memory leak in
 svs_enable_debug_write()
Message-Id: <176786381930.9526.15054540392000699829.b4-ty@collabora.com>
Date: Thu, 08 Jan 2026 10:16:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_011703_438854_21E036AD 
X-CRM114-Status: UNSURE (   6.26  )
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

On Sun, 28 Dec 2025 16:26:36 +0000, Zilin Guan wrote:
> In svs_enable_debug_write(), the buf allocated by memdup_user_nul()
> is leaked if kstrtoint() fails.
> 
> Fix this by using __free(kfree) to automatically free buf, eliminating
> the need for explicit kfree() calls and preventing leaks.
> 
> 
> [...]

Applied to v6.19-next/soc, thanks!

[1/1] soc: mediatek: svs: Fix memory leak in svs_enable_debug_write()
      commit: ebede2ddeb047bdf7ee660a18403592c45d020d9

Cheers,
Angelo



