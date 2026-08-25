Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB7CAC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 03:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxZ9cgvNltAK9q7EPBGQ4dIFVYNFcy9EDy4BATigJec=; b=MfvU1oP6uzdh/43iERV/wzSVIL
	Okc8NHpHekv9Ep0pCSX29cmqqqtHagC3XLpeRER3vijYq7cYagEQaHi/HIG+Th6wwq3xEPcWG5VPs
	4LpuyD9OfRkMxNj6CNos/S3FDHNpg9g7xSvX5BT8ytONvpjhX6hKErN98D/bd16FcbjIiEhGNnn9F
	5HxdggCUZFM6Ea5J20D4DfaMz3Iu15ElgrrC4Tny8Zk3ncxsNOAbq0jFHflm7VRutaaDKanieVH7A
	sk83kqj1ljM2nBdlawBAW1ThckLLtgLqeRQTRuePpni+c9Zq998ljt3mug6WdYecc5BGnk0i5iQ4M
	ie9bcxoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhTR-000000004tO-40b2;
	Tue, 25 Aug 2026 03:05:17 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyhTP-000000004sm-18w2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 03:05:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Kx
	Z9cgvNltAK9q7EPBGQ4dIFVYNFcy9EDy4BATigJec=; b=jdFDvFb20LM1C+Nx/d
	wL9xFWcmxjei/bYs+qf/zlOEwjfT77s3e4iSGMJlH1q2epmm8eGEfbvywYoJu3t7
	GdT94UCpl0k5JE660YTzln88cp+9NH4+8Ge2/wMagQqSohA7yqQMn25jqbYdcGse
	eYHf+bG1LfqZQS8BQX/VhJIGc=
Received: from DESKTOP-93MEKVV.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDn7wZVBo1qi9LKOw--.36731S2;
	Tue, 25 Aug 2026 11:04:54 +0800 (CST)
From: Li Dou <li8d6kernel@163.com>
To: maz@kernel.org
Cc: li8d6kernel@163.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	radu@rendec.net,
	tglx@kernel.org
Subject: Re: [PATCH] irqchip/gic-v3: Remove the ISB between AP0Rn and AP1Rn
Date: Tue, 25 Aug 2026 11:04:54 +0800
Message-ID: <20260825030454.1280-1-li8d6kernel@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87bjaro4th.wl-maz@kernel.org>
References: <87bjaro4th.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgDn7wZVBo1qi9LKOw--.36731S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4UXw4UuFW3Aw1xKw1xXwb_yoW8Xry3pw
	4aka4DZFs8C3ZxGw4SqF12vF18u393Wr4UXFn8Gr18KF95ZFWkGry09F4Y9ryqyrs2yw1Y
	q3yjya95Ga4FyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUPMaUUUUUU=
X-Originating-IP: [39.144.105.186]
X-CM-SenderInfo: dolyvlxnhu0vro6rljoofrz/xtbC9xaUDWqNBlbvnAAA38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_200515_682076_9FE8FA03 
X-CRM114-Status: GOOD (  11.42  )
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

Hi Marc,

On Mon, 24 Aug 2026 17:34:34 +0100, Marc Zyngier wrote:
>On Mon, 24 Aug 2026 03:34:03 +0100,
>Li Dou <li8d6kernel@163.com> wrote:
>> 
>> ARM GICv3 specification says(in section 4.8.4 "System register access to
>> the Active Priorities registers"):
>> 
>> 	an ISB is not required between each write to ICC_AP0R<n>_EL1,
>> 	Secure ICC_AP1R<n>_EL1, and Non-secure ICC_AP1R<n>_EL1.
>> 
>> It means we can use one ISB after resetting AP0Rn and AP1Rn for context
>> synchronization. So just remove the previous one.
>
>I'm afraid you have misinterpreted the spec.
>
>Within each of the AP0Rn, Secure AP1Rn and Non-Secure AP1Rn classes,
>for any value of 'n', there is no need for any synchronisation.
>
>However, between classes, you absolutely need an ISB. And this is the
>reason why, just above the note you quote:
>
><quote>
>Writes to these registers in any order other than the following can
>result in UNPREDICTABLE behavior:
>
>1. ICC_AP0R<n>_EL1.
>2. Secure ICC_AP1R<n>_EL1.
>3. Non-secure ICC_AP1R<n>_EL1.
></quote>
>
>While you can perfectly write each individual register of (1), (2) or
>(3) without any synchronisation, you absolutely must have a CSE
>*between* each of (1), (2) and (3). Linux being non-secure only, you
>only deal with (1) and (3), and you must have an ISB in between.
>Without it, reordering can happen and you end-up violating the above
>rule.

The spec sometimes is overly convoluted. Thanks for the clarification.

Best regards,
Li


