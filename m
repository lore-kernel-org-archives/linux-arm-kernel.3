Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19161C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ufr8jWio+k3mAwH6vRZeNy2DQEzSjS0mBeDw/wYCdD4=; b=gr/yXQfAcIxfZBq+dm8Gk6Ytuo
	GMpBy09b7mWl03ttDKRmNvhjTKPJZNCHByWDXI+HsdFKfLuAU6IsSVnE7jIPL33tqSAQjN8noMNar
	q5NCJPOiUiMqAvRPnD7aEs7KubdrjJ6kgpSKm8aDNM6qvX7RfXTA40XYW2sM+92YtoVEjFjklZzFU
	gOWrDFKUUxBjKMk+WRd1ohSdnndiFBCrogQw6QtB5zs8QwW9v31qb5b2gvp9z8koWsB7YI4xkPipg
	WuP+1V3uUG8wq3vm3ObEwxO9QiEFpNbqVUdSen4oceG758yHro4EiFJ29P5wohq4sTgGxldWeuz8+
	T3l/gAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVmb-000000029Wx-17hn;
	Tue, 01 Apr 2025 07:11:37 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVkn-000000029Sb-0Tx7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743491360; x=1744096160; i=markus.elfring@web.de;
	bh=Ufr8jWio+k3mAwH6vRZeNy2DQEzSjS0mBeDw/wYCdD4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Y91gbEPe2PvFijeQx7sRP5oA0Q5+VIo/JfWWiyD11JVH9aKFAvIch1IBglox9gvT
	 E6znjNfVeFnLimFJb4XD2N+khT1TsltCTf5qynBEckisMw8cRWkUS3AjEp1QKtdcC
	 nEPxED0VWH/7t4da+tRcE9ZCxXfLXA1+OXtitoVcpQVXh0zP6quZVOJFMSRhYly8h
	 qkrzDNqZv3rBZaOTEA3JfQzcr8lxdqQkiZzRlpRTEETcdNu0vOrw+Ur3/CSotVMIq
	 CobrEVyiXuMLHSH9BgfpcxTqu1aMEeS14laI5zS4HPsm6tyqbnknj8iyk62Bdix4n
	 TOAGKr7YsyoOwjqM+Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MAtwr-1toHKj15fl-00GGYs; Tue, 01
 Apr 2025 09:09:20 +0200
Message-ID: <03d87a25-02ea-4e4a-8d3f-c2fcdc4d068e@web.de>
Date: Tue, 1 Apr 2025 09:09:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v3] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9ghQMBunowstGfr7Qbdl++g5f/BvUsX0AoqlPh8HYvKL8GZYMsX
 yZRQOWRRNANFr4jw2YfJLK5EUbUmnVuuo5hJwu5tRWtS9qgDOAmpFJN5ZUeZY3fAv1uXZub
 RMxnWZDvwUIR/Gk68FCUk72oaFPQdMhOFkgBxBjRH+6uf5v2boobf9GcQSk1/SnGrJuZqXW
 TZfhrRgSY8F1Rp7gXIaHA==
UI-OutboundReport: notjunk:1;M01:P0:eZ+Nt2no3dU=;DkVENrzOHyKdIoYQFckkrElKk6r
 iozWdYwwXxRSHYuXpKlvYCTLvEf182GW9UqprZZj22TATsWMgEz00FUhnh1XtRZK3+ZZzJpjZ
 iwhhi8j9z5bH0GXoFID1NX0kcG19269obnPIxpGvf5zDlbG2YhR/aPSJH5J+3U8e4acK71Zl6
 pGo39XfF54t6WVI5c2tO8YLZBxXHdmrGtpO75fW5Gc2IJwE7gVyq7KZeIszYzol6aVw2PXAhX
 EtBFR+HLthwDynHbD3EQlEJ7yw8FWgZ+HLFbRPoi/zATltt8m9qS7vs8xf0AbyCSL+I/i8KJK
 O9XxWau1NOIDpf1v4pUWrlY4PUzh9enNvLl2hZ3NZwC2BIVFih2doBKSyFIPncQXUV+cICG8r
 HGddcbKaGGKSQFd+OaK1k3wof3OJ8UvNzdJa/tpwaJPy6bd5fOaEfB5/LZiuhVrlH09w0eE2G
 NoNauCZT8adwj9UjhiJXtRa7JDFZx6/N/iRYL5sVAEldXhb6vQjn2HYZPBJcwIGFkJ3D08fA+
 g7w8N6p7ttjITxCztmY+VVPfuPrP60D4hDvzGMHik6wo+HWzvLircAVoexeF3wDvacwIE1rZl
 A/oIdbi/3LsGIbIS8bAxmrqo9Q0WRP76mxIyP45YpPNhQSEb0vhnf2xScfMCrT6FUt0BuVJwx
 YVYjBG6Baan3MBdj5dKEzP4x345cwbmQoG2SBMqzexXvRhExk5rbclbnbBUxNBrSdPcAFtZtR
 JJtIv4PBsPmmgGJmFtsbAI7GDkzrgFwjrHxYgh136haXOpfhkp53n3MdcaubzWdjVfIGRAEAd
 R+nXEzbpfX2uxb289FO370nbFNgka48cHRzqBHQN4Nx7TyTrxWVi/34Tj2GoODPbvayENPvii
 HCUuhEyO+JzlF9/CXKTYU6vQstnkM5hUY7/KDPPXqg+Zf19c9xa4V/QcvtpWmzDL0jM2XZids
 3v8zfatUeN8HdG8ri53us6En6UszfeOJj4/qFDP+NGbkClqsL2zavaKsABo18zfg+mzNVbtk3
 YhrP0lVBLCcb3xQlSKDmuZsufJiIUC+1nF9xakqzXDwY0P6PjjfIPIpLfba9E0HG4ub7a7KIx
 T2xVKLW90q3AchhFumV6SfmBoO9tYIHBF6SKC3Sp48FrZ3jWyOyTHCQAdxrkfWGrG8uNY1pg8
 4AO5LitlNiZ7f5tea44+VHoD9A60jcVH7mRdvZsL285onMcyKAFuRy48f+E3gega9+LszbfVP
 Ejp+15BPe4t7Lr1BTQ0dR/yVy9kPiqyDXKeCA5liEIrUbIEMvP9MtKANneC8G6t1f8ogBmxWg
 VStoqRgH0zF05FJJw0d57i4jYeJ5gM3p6xKR7y8/E4tzIifJgvOt+oq6qcT+Cw2wOKfiliRRU
 T0SCh4XZ/dvNSpsBbZ9s9orl7SQAIw1noyrnYaWTBc1D/U/o2/PoYcZhxKzh6wYeJwbYmV5Nv
 SFb9qbgX62aiHVsKuaO/M7ypE4xa+9HkpL/RPfjGPHFl/NLz7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_000945_445592_9DC06304 
X-CRM114-Status: UNSURE (   8.36  )
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

> devm_kasprintf() return NULL if memory allocation fails. Currently,
=E2=80=A6
                call?                               failed?


> Add NULL check after devm_kasprintf() to prevent this issue.

Do you propose to improve this function implementation a bit more?


=E2=80=A6
> ---
> V2 -> V3: Simplify the arrary access and correct commit message.
=E2=80=A6

* Would you like to avoid a typo here?

* I imagine that there is a need to offer such adjustments
  in separate update steps.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/t=
ree/Documentation/process/submitting-patches.rst?h=3Dv6.14#n81

* Please choose a more appropriate subsystem specification.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/=
log/drivers/soc/aspeed/aspeed-lpc-snoop.c?h=3Dnext-20250331

* How do you think about to append parentheses to a function name
  also in the summary phrase?

Regards,
Markus

