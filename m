Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5125C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYBveTePjjg0G5po0SOfHr83wVb5AGXhVTAccd5SD4g=; b=Cv0wOsmB6kUP9kotFvP9YGMF5H
	ZCBhR2YSgDXvurMyJcc31iFsayLifEO5y1k4s6FuQO+yaRcNmHdxE2yK/ifwlo+6GWRKttBKd+uuh
	7nrL9XN5vkp+u3eRnWwu/+XKupxAomDjeXlh87CSwEudo6KVs3Zhm1wwmYElybcAnuAZzheybhOFH
	J9PsHBcV+YsvqKDxgmVygQhDygWkFKZ8V1i86c8zaJETd6EmIIaFmO5x6gOvFN8xWL8KT3ATzg1tJ
	6EYAUQz1WlyBfjWT3p+vclfxvjDz7K6masJC8rXT/WgxkAkJWP99qwKoBBc2iUrywheYSwuIcuudl
	RVhoF3Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXON-0000000Bx8Y-2qaR;
	Wed, 22 Jul 2026 13:53:47 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXOL-0000000Bx8C-1q3F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:53:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784728420;
	bh=aYBveTePjjg0G5po0SOfHr83wVb5AGXhVTAccd5SD4g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=fEQu2ZN89/ADwPeDBwqIgGB7RT/+duAZmOpolZwsvs41wXMyxS0AN988MBdnA95t8
	 jcVTG2s/0X/6CRBniv+S/am1DLwKsA3gwntAfWsRRV8JzdVwVFh52QYJW/10NSDJ+n
	 H6dJDydNPG+Zg/RTFCW1liCW8FEFy/W7G/OZgoZ1nJlGYq2CyL0PTsBjH7lYesllKG
	 TbR+LUJ2g+HMi8GhmKpjgh1Mvf/7xPs2Uj9yR0nfYrzedY2yJ2kolwJyNKWZgyiJbM
	 Rfi01af3VFlK546aBfZ80FgmfwUCrtxabQT4Ar7+JsW38Yc9/8xMnYi2VJY8J4WTkh
	 io1WMi8IZL/JQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7F4D865B37;
	Wed, 22 Jul 2026 21:53:38 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Yuho Choi <dbgh9129@gmail.com>
Cc: Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
 Benjamin Fair <benjaminfair@google.com>, 
 Russell King <linux@armlinux.org.uk>, openbmc@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260525033846.1346744-1-dbgh9129@gmail.com>
References: <20260525033846.1346744-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] ARM: npcm: Fix OF node refcount leaks in SMP setup
Message-Id: <178472841877.1739993.4789559545976492167.b4-ty@b4>
Date: Wed, 22 Jul 2026 23:23:38 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_065345_674942_A5B93407 
X-CRM114-Status: UNSURE (   8.12  )
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

On Sun, 24 May 2026 23:38:46 -0400, Yuho Choi wrote:
> npcm7xx_smp_boot_secondary() and npcm7xx_smp_prepare_cpus() look up
> the GCR and SCU nodes with of_find_compatible_node(). The returned
> nodes are used for of_iomap(), but the node references are never
> released.
> 
> of_iomap() does not consume the device node reference, and iounmap()
> only releases the MMIO mapping. Drop each node reference after the
> corresponding mapping attempt.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


