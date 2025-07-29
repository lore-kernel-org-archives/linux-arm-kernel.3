Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E8BC87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 19:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIZ5gV0vjwE4JXxeYjnPae2gDv7uj2USnLj7Ki4n/7M=; b=T3iJuEI4SWBwpMuHkgB66otNPK
	rm9rAdoPmlp7aMQmyAP8g6dr3CdS3teIV6XCcFZ9CwB0WHVate1C1XX33+W2nRJE8awXU5/1MK6dI
	7skLJ/0xKFLXeBP8FPfmxjoq47bvcImzAp2qoRhiJc0frK3zbA+9+AQCbWJz+ljK0QfdVx048OppE
	KDbGKrKUUNkiyiFR2CssL55QUOVZ/Klp6DX+UQIbMfbPdWTOmYU3UR3Iu86tihmtfnSQq9HtMeJkF
	32jQh7uVbuV1fJxvQHGLnriUWPVnYuHt+HpOz+f2mAaZtU2N9PGPqy15haQQBp2BLv+SPEk+DKZVh
	Gnlk0XlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpkM-0000000HXM4-0Gdx;
	Tue, 29 Jul 2025 19:12:22 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpfu-0000000HX5A-0xu5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 19:07:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1753816062; x=1754420862; i=markus.elfring@web.de;
	bh=rIZ5gV0vjwE4JXxeYjnPae2gDv7uj2USnLj7Ki4n/7M=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TlmBrXLHykYnQg8sirN716GLRqFCiRZ5xc724lZnymyvBhRWlldDYvim42ndo7XX
	 75JYTqxxm1V1Ua8y64B/IoGB4RmuYzb1o1/JmAHEVPG2xORqn49B5/skawXYZZzTE
	 w0MgOvDf6WpyqlBAZWSU33u0PD3LWsG6TJjQlx5l5pvAhMXDc9d+sbc3Kz1MqqO5N
	 t4wcOdLZZ2Vsp8mIWxXLJbdkOrHXTMa2Ke3TAmYe7d7kG7XeDrmuzQSlerTMXUbQO
	 1MCOH79cDto9LFFc+sm8DRD8u0He1dxgsv5/bGgaA/+h3yoN6ky6yKX0FkzhhzDr0
	 jLOGP3EO5nUiMpwNKg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.201]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MTfol-1v5x9k2uuD-00LOr8; Tue, 29
 Jul 2025 21:07:41 +0200
Message-ID: <ec847f0a-7e99-48d5-8f31-9151d58d3da0@web.de>
Date: Tue, 29 Jul 2025 21:07:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Elad Nachman <enachman@marvell.com>, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20250729084826.3222785-1-enachman@marvell.com>
Subject: Re: [PATCH] irqchip/mvebu-gicp: clear pending irqs on init
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250729084826.3222785-1-enachman@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BiPrboK2rIHOkyDq+zdKEak6l79hHqE2gbNGijJAWTZZl8j/lN7
 ZLRwn4mJkxBqgVr6PoI83g0dpAAEOz1bk0RRSH6YEg3A569EGeO/4mtQSxwKHgXewRzB/YS
 tpNhC8FArqUj5qKKtFk8UKq4RGjlp2zC/zPh2Qhw2n2DlzWaeTZjowTnknHzzeRLu+srGxm
 +D6xsSQBUW2KQ14FtD2jg==
UI-OutboundReport: notjunk:1;M01:P0:q2rq4npRCKs=;PJ1A+gkCCbgNzMBKuBf7DORFX2H
 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_120746_573793_C2E5C144 
X-CRM114-Status: UNSURE (   4.56  )
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

=E2=80=A6
> from the I/O SB to the NB. Clear all pending interrupts
> when the driver is initialized to prevent these spurious
> interrupts.

Under which circumstances would you become interested to put more than 56 =
characters
into text lines of such a change description?

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv6.16#n658

Regards,
Markus

