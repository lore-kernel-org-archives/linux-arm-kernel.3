Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9955E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 08:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WV1SumrajbXcBiCZh7cR2oodxjaKHzLM/ljKxiy91EQ=; b=JvODEctmjpYqyYMpgdmi9bXsM/
	laRI5wVY3osHEc5grxMYHAnWqHxdYGqV8pH+vPT4klxuiT2CDa72HLGtO/ABXZvBulnz5ggq/YJeT
	1PGNEaTblRsLBa45I5L72Egg5fzkK1RMXJCGWRQqtNuD3K3rJk+hhdUuI1jH3c0z0wTkDY/QTkIa6
	rB7WiY4RLkmyx5fdjCSrekIey9UezNyNmCgBJD4DmpEUbqtFCBmHA+XNp62iLu950P9lwzdqYWKWn
	t743HmqdqyDTqe/0mdk8tpREibXXZjVc/Szlgxyxo4XEeIrmxMSOpX1p2Vil6pRl8VeZT4duW9SNg
	cfEIZmVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTp3-00000000wg0-0j0t;
	Fri, 06 Dec 2024 08:36:25 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJTo0-00000000wRD-2hWQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 08:35:22 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2F6B6000D;
	Fri,  6 Dec 2024 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733474115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WV1SumrajbXcBiCZh7cR2oodxjaKHzLM/ljKxiy91EQ=;
	b=NVR9hKjEAG9vYhynz6REfbxApCyedl4pC+K9g0c2uoNtqUXAlwha3VTqMb83md9W6qHwE8
	i1vOcNCALO+W5ixz/qgDbTPfXuT/cTweM3YXwRJYAHlp3gH8rS3GQYuGs5+e+Z2nzniDFo
	3xGH11k7Dv1XpB4QExEFuhFAc3QyF10SbwZprHXbECJQzDobU6sE3VFzOMQpVuxddwO81z
	Fw0+J8uu6XyXEw+IzVXX67VfUjaTyv+19PRbSpDwoAwVEywL7EAojFtOygHBe/f4Q6Q6RW
	BMtpe7eYdhKeJxZzRZ36VMASdxxtYZplzL/4nXFgg3kpT9JA5NVieyb2LbT+kg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Dec 2024 09:35:14 +0100
Message-Id: <D64HAEFFEGS1.3FJ6VM6Y6F1M1@bootlin.com>
Subject: Re: [PATCH] i2c: nomadik: Add missing sentinel to match table
Cc: <linux-i2c@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Geert Uytterhoeven" <geert+renesas@glider.be>, "Linus Walleij"
 <linus.walleij@linaro.org>, "Andi Shyti" <andi.shyti@kernel.org>, "Wolfram
 Sang" <wsa+renesas@sang-engineering.com>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
In-Reply-To: <34b6ee90437fe19526d9388f2f304d175596cb1f.1733473582.git.geert+renesas@glider.be>
X-GND-Sasl: theo.lebrun@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_003520_830422_C6FDD7CE 
X-CRM114-Status: UNSURE (   5.32  )
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

Hello Geert & all,

On Fri Dec 6, 2024 at 9:28 AM CET, Geert Uytterhoeven wrote:
> The OF match table is not NULL-terminated.
> Fix this by adding a sentinel to nmk_i2c_eyeq_match_table[].

I had the exact same patch pending locally. Sorry and thanks!

Reviewed-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


