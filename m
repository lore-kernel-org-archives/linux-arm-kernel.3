Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98E8E7C6FC
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdROtjQ53tW5uBhzacYH5tIr1qBfl/2gKaXk/kAFCb8=; b=XXw3SScvqniCf2qshU4k6YKv+F
	vQWffFXDpsh+wJ0zVM9m1CL08wmCEEUyKmjChxTTmgdXKb9Wgn7Y9EHfHwn5GwBtJlRIqQYkt5qz4
	3GekkBLt4qcbPilqZn5V2Wb0V4LTXTTBNfdFTIuShZHOjWHwZU7caXRAEK6OtJfvc9Idv6DmiSzKM
	kwkTH9kfo7aAMDQ7uPENXaRSg2Tlr4pDZ4VnAUdlDzddTkUVi36AN9VUQoA47sS5yc8uYoCAdvP8z
	do0Bm4DD8DTD3ixr/NP7PQnTAbL2EnzigPkLSTVUJvPswg+4N7VsDlUNiJaRi6evH8P1549avf+mt
	cHES0xVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmThf-00000003Odo-3Xro;
	Sun, 01 Feb 2026 09:25:11 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmThc-00000003OdP-0ZVg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 09:25:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769937902; x=1770542702; i=markus.elfring@web.de;
	bh=mdROtjQ53tW5uBhzacYH5tIr1qBfl/2gKaXk/kAFCb8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bqtWw6AvizV6PLitw6Th0K+pjFG6xvXTCH9xkbFaSAgTQQzkgnTxYNZdmZnaG8n2
	 kOfla0w0t2HRSIJtaWXEx1XrIp+cW6uVHfZvSNa00VZLXqSlWK7ceFrH1Hpj7BwmX
	 sWu1ebkNZYNqWsyQNpA4/blUWZwjWL5jfjOvoHT1Z08Svvdi1fN+c/ZggrDbmCwSx
	 SG2uCLvYj+oWruXGMWVBkO32XIe823cVniB9LzN3GOO0vaMmWM29hc4wZhe1fJsrc
	 SbG4NMpQvmrcUVjMV0eJrNg7kBwcaTHK55JO9HAhCcCwGX0xa4Yi+gSgsG4HINI0D
	 ETtRKX8HzfuUUQK2XA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.255]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MumJD-1w3SDm3qGh-0165Ro; Sun, 01
 Feb 2026 10:25:01 +0100
Message-ID: <f7639c7e-c462-4314-a81d-ca2f4ffab3bf@web.de>
Date: Sun, 1 Feb 2026 10:24:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260131-dove_pmu-v1-1-1b40989778d1@gmail.com>
Subject: Re: [PATCH] soc: dove: pmu: Fix device node reference leaks in
 dove_init_pmu()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260131-dove_pmu-v1-1-1b40989778d1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:DCZ61rvwIuAmm1Z+iuHThZzCH3lVFyC9zYjDZIjkXpXrCGwR6GK
 DC5hl/XVfV4C85gzuTI2EGUHetAeoJ+AjdWJW0SIQApAUMOI6sQbkVdPA6w7/OBiXnAZytJ
 wZzUTzMWFVLxTEMOp6hRsvAqR3kpel/1TKQgb21MOAsyoLC+J9DJcdMsQMhKYy0R1dsh9ds
 WVI4JIc5JQyaqGqqEVntw==
UI-OutboundReport: notjunk:1;M01:P0:5QjNRXV5bAA=;eZBRhLzBBLClKvo5jjT2/rxbE4+ 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 NRhCNrl9mrtLzIjhfkzW3SiVdvuP/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_012508_606669_AC94B134 
X-CRM114-Status: UNSURE (   4.87  )
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

> Use __free(device_node) cleanup attribute for domains_node and add
> missing of_node_put(np_pmu) calls in error paths to prevent device
> node reference leaks.

* Would scope-based resource management become relevant for both local variables?

* See also once more:
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/stable-kernel-rules.rst?h=v6.19-rc7#n34


Regards,
Markus

