Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 894D0D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Dec 2025 20:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7ZnXGxKhhwonAbIYoP4Tqgk8CKODIyRTD+Tp0bmyzc=; b=A5Tc6f61Hbs9aw8LXrtNHZPCl5
	0PAjIVLFhtKVff7ARrQnILgrwzHLuloW7HAALVCgsiGUDng1Z2dFbQbIYlJLwftJ0FjdjlpxvqbGV
	aFuKD0cRz0Yt1wRNbXzxw8jizXS3uWYpEu7j6I4tjovJ5fRCPsvW4DIiwbqlBOpwqwDQ+mAeJ4Sm/
	mBWxSN2lBRijV5/zm5NLG2hXssZxxohSBFgTZ1yh68GzpwGFo/aTz5nzMrF7Vji5ulBXKz9xWdyZ3
	1a24hCk3X1bK5OhIy/d/JgyHqHpMMaU98jmEYpNeqOCOcyvKb9vaS0RolkwPOc7yW54VE6dqEN9Ve
	I6MWJi+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiAd-0000000DWu2-0EZE;
	Mon, 08 Dec 2025 20:49:23 +0000
Received: from mailtransmit05.runbox.com ([2a0c:5a00:149::26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSiAY-0000000DWtZ-41jK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Dec 2025 20:49:21 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <daniel@gibson.sh>)
	id 1vSiAO-00EY2P-27; Mon, 08 Dec 2025 21:49:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gibson.sh;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=U7ZnXGxKhhwonAbIYoP4Tqgk8CKODIyRTD+Tp0bmyzc=; b=HyWhzDTtmrAA78y5i3OdbtChpH
	CgHlgZCFe4oZh1E34H+h5l5lbkNz4oldEis4vsKojWCKNKK8xSQ973/MNeUB6/jDG4ZPwOJGJHEBG
	0CPOKMBuHhEcB3NVAg6gCEdcGdLDlScpvaa5eABzkNGoS7gK4Ap2Y3zTObalYCksJqi8seoZ5tbo2
	cB9qAV4N54BKTFJ9BXKVdBWfs5lMabo5Z9sjEzjL6RN6Wmj4XYa2yAWV2ReTs4/MN13J8hNWuVWTX
	F0B1QAUmmZs8xwrpFLLc2ZLhSbaUdVyrT0v9AkNOBCWpf4mJqPrgYbt2DTYydW1nSC99p3/vgruEu
	m2djTlpw==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <daniel@gibson.sh>)
	id 1vSiAM-0000cK-4Z; Mon, 08 Dec 2025 21:49:06 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (1104311)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vSiAC-00An5I-7t; Mon, 08 Dec 2025 21:48:56 +0100
Message-ID: <22ae55db-261d-4bb7-a83c-12fd00fa5527@gibson.sh>
Date: Mon, 8 Dec 2025 21:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
 <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
 <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
From: Daniel Gibson <daniel@gibson.sh>
Content-Language: de-DE
In-Reply-To: <CAMRc=Mc8ViSPyTn9Brr-us2V+D7Jv3u+B8Ek2nuzF36yH70RAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_124920_359059_A6E7CE45 
X-CRM114-Status: UNSURE (   9.62  )
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

On 12/8/25 05:48, Bartosz Golaszewski wrote:
> 
> Thanks for bringing it to my attention, you're probably right and thats's
> just an unintentional omission on my part. Do you want to send a patch that
> will fix it or do you prefer me to do it?
> 
> Bart

Thanks for the quick reply!

I'd prefer if you do it, I'm not too familiar with the kernel workflow.

Cheers,
Daniel



