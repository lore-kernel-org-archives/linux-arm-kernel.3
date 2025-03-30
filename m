Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EA6C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 12:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ESHn4nXeNvwWIGWrCtfYc7nnFnjQEwfayhsX3AOyDs=; b=zw9ra92S+q6Yom7UBnrXWUQTnq
	kiiS38ATReRs7GRWjIkCUSBB1XFLnpyAs6hYTOWiIRF4C6dD5RydfUPYJptsCbCIR6twGEJxMxr7t
	PnGO4nBVIIHJTOEgLwDG5rPQpq0bLgx7e7jIAp+NbyNK9OXgdPIyf6BGS0BDFydRCn9mr3PnPFYkg
	jOptFp6Ur3i/7BPeC+2gD2IWbKB3LxezzCzftBRZ9YmB7U2f55mTmEtdSdEtN0jvFOm3XJ060Bdfy
	rGVklgzfcne3z6E2efMCUKMyFhHA7SZ2G1KInhKlDqIFpg+NZfenHDyndvu8h3kSy9aqS69LyLxnS
	tjAJiS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrOR-0000000GAfN-0q9o;
	Sun, 30 Mar 2025 12:03:59 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrMg-0000000GAXT-2W9g
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 12:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743336094; x=1743940894; i=markus.elfring@web.de;
	bh=/ESHn4nXeNvwWIGWrCtfYc7nnFnjQEwfayhsX3AOyDs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=wudO0rT4Aixa0UPD45im1c5awgJR8WZRu8s/SnyjmKbed/WGwS7ES8VmL7Mn0yof
	 nr4B3zmIZTMxpn8K7+3uxz2ekMnHCno6TX2HP2aqFzLdH/o4xltOG1075vvSP/gEm
	 FltI/ziqd1e6f6RiXX+oGQfx4nKuZLPhI3Xrm9gEUPwYuHWT7r8hsJ6r9+HlI9lVL
	 XPemjVslhQ2m31ouMTXBeD3kGCKToDhxImB2QXz294eT5gUL64UoOalGkMHF3opZm
	 T3aQSPM7kBbvbp3oB1yvSE4dWQsVdT/Is13JmgWkvDth0TR/F3baZV4apyOScpuLH
	 plu0bAda9wlZM5xerQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MnX1L-1tHnNT172L-00jFi1; Sun, 30
 Mar 2025 14:01:34 +0200
Message-ID: <e911f15a-51d5-4741-89ee-b1422dec07ab@web.de>
Date: Sun, 30 Mar 2025 14:01:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abdun Nihaal <abdun.nihaal@gmail.com>, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Johannes Berg <johannes@sipsolutions.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Erick Archer <erick.archer@outlook.com>,
 "John W. Linville" <linville@tuxdriver.com>, Kalle Valo <kvalo@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20250330103110.44080-1-abdun.nihaal@gmail.com>
Subject: Re: [PATCH v2] wifi: at76c50x: fix use after free access in
 at76_disconnect
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250330103110.44080-1-abdun.nihaal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:YE/2h1DGVA5MlT7jpl20t2UskcHoOi2G4Kjo+hXSMIOEESdqHvL
 l6xWADl1yEG7Do9oaBtVkCniaVaHECTUb71PSyp1QM77/jPRUu+tL1nmjx0XaAb2t36zy/h
 kfWzZ4K7tpyL0RBynV+ACLl185Gq2v14Lvwf3vqu6OJk8SfuYHyJMR4s0D2/KzKKxa/xoE+
 m9+jXnYuOOS7WQ5kVArpg==
UI-OutboundReport: notjunk:1;M01:P0:UWSfTPbmz2c=;DZwjpFZaApIPM5TQ7jLRttmMXwh
 o9YKRbw8Ac6lFegJx/EzNI7ADylL/HYPblxQ26fLlEMiNVWUkj2eEMrDWfe4vRxxOBNeHdhjR
 Vkyr6YCb1mvGjD2+2KGzLQAw6g+SHCx0gAV/n5VcCUSN2Pj0vB7Wh9KeVzj76uSuuxW01xf5X
 9zliJO7Znilz0IL149lVayXfusimerJAGGBbb72sINlJf3fQQpMNX3zB6katlCQpRO+fm+MV7
 +6fjx4CPTygcIpMSaSfSe65iKABrc4I/qEbVy5HuKoC41UpS6Gb80jEmStXPeUdIPQ9MbkCzg
 mwP8DxEFpu/GZoYc6CtWjBj0epLPgSHBnVv8qvn6mOPARQ9PLdcKnIEkdbWs05DhHclkLNYYH
 whpCJFKjrV9fjuPygjZi8tY3UhzsvnX4eocd424K9/xBNQq/4WOdOnjXOBsNJxrnG9FP1DbVT
 WvcAbBpXyDYv/0B75A+FgNCNHgidPh3pLs7nIJCeae6I7TqmyzeBDQvXaGHYNtFO5uHjy/FDG
 +7da7xn7He4e9XLfpsTwUBNwfg+qIHJ+taDBmxLaNfXCPY4OKZoYzFQejAN8eI5JENw97BHh8
 V0vTwBizooixgA9xaeoNODYKVyJl3HmXdp+Y+k2mAUbH8QYOQbjRZgQp37C4vNOFROcXUPDZp
 iv302EGt8YOXE6DZFjTXc/dUcGbKw/VDt624QewsLImrFlpUqHQY+yrfexl0zqQrTMNQ7g/oT
 sbSAvo5O2jIarkVlTYk73AQIX8joIjDk81wEAomhSuvEq9sIN5bjMftPjZ4IQXhzw3Eqx+F8w
 EO33sB3LIacrK/hWesyr//vqoYFRjMf0cpbBGVKaKQq6Ic2duZMmtxNZXI0b56tULJ/0q4lQa
 IWkT6nzrecijXL0dfK4vZzqyZqjSehcjkKHtWOedIGOCj4TiokB6JbGqL6q5KL1LVlbH9waVv
 xfm5KmKRjDJ0wbmhud1q2tBa4MMcbyDi9vWhxQGLwYriE0iI0BI5qW3pyQ7N3Nl5WZtDcDrPv
 XrwFx5e0jrQpWVnZHGd7FMepQT9AQmr3+4JwIW8EeLCeNJfBvOUDbGc6/dzWVkGTZaCS/31FI
 Uew7oJlR9MMmqb56ATVeRHgwOMfsHB4PUKAh1rS6fOWZKYOmMKBSdVsO2CzNVQmDJ+Jneqs+n
 3o52ushMUR0y7QCoK59GxWZa+MmaHyNMsqOBKeok97HaTHYxgf40Qc5YEosPmmFu8mLB5keZH
 NvS+SU+ALZbiI2jBa+XepUd44YIqnMctN75OQQCJDNPQ935P+2/VGarzHIWzz0+aXTx/4SnXA
 9ALj0/O9X9hZszRyZAqcbSS02SXry3vC1Zx0M1SvmHQxpP2kS++xNoYFnP9FMwxjXJ5kresrl
 5zcQEL+pzamut28+pzGCKV7prYJQV24CpHVOLlib09c9+bqC0lGzX5KCzHXAX7MxvBgabRvrs
 OWVuXUcLhfvKZRJ4oGJyqru7bZsnDwgA5Oltxa3b5xiJW570TF5JJ11ddjyvfbwImWpGR/A==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_050210_958746_A1A8559E 
X-CRM114-Status: UNSURE (   7.58  )
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

> The memory pointed to by priv is freed at the end of at76_delete_device
> function (using ieee80211_free_hw). But the code then accesses the udev
> field of the freed object to put the USB device. This may also lead to a
> memory leak of the usb device. Fix this by using udev from interface.

Would you like to append parentheses to any function names?

Regards,
Markus

