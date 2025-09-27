Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF22CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 13:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odZJScnngEm+S3AtxQrvpSQkKV7osaJFzsa1SO+IUKA=; b=Wl/n7/jTt6qV4U6N9deqDIE9ht
	V1uMI1hmVs3hqLs+rM6EISNyr9nqjGUrVHzIsErqUie0ZTAwaw7IYE7/XFQZkFvaCcEHVGfd9/a5B
	FmrNpX358WfhvRRwiEr9Jj3VxiPPsSZ/DoOXhGkpIznz937JZ2fwBS8t9VhjtZuTfot5CpfCVBFBX
	TRPTXrofscyt5VJkx6lKjyXQoalRzOU1AJ8slh+QSV2ki7J+H8BCMlS4gbe9HROwCmCvJghACRv5t
	JETZZdWl5T6EK0lhmNOPAc1BihAQ2HuLBxfGGdZqPG6Hp6fM5REP8kku6fAlgIe59YrZgbHk3VmWZ
	Js/Gtk0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VQw-0000000AA3m-46nt;
	Sat, 27 Sep 2025 13:57:54 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2VQs-0000000A9yO-0GGJ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Sep 2025 13:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1758981457; x=1759586257; i=markus.elfring@web.de;
	bh=odZJScnngEm+S3AtxQrvpSQkKV7osaJFzsa1SO+IUKA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oH+Ba3zt0+dGiYrIR2WM0YBhFoc70T1i3hRznjrp8QyqGPS4QLddjKiUNnjoItGl
	 yNYrypUNBoa/6l9Yy9deXPIxq+iRrmQjr1Flbc5348AQaK5dHQLvsN3V3qWrzPiLk
	 ZH3j6IO7JKbIIW3bmoBFRBoyfL/IstSemIWsYU5NsjAey0vn/RNf6DDi3bOmH4hir
	 0n2oxG6poLIs0HIRS07/+0FFYm6+uqTYpv7SY/kBiJ3r7cr6zud912+CBYyR4Fytz
	 KDVrGM2k6Ibnr2ZIlXMjBZY3StnS/2UiUEV6Ak85H0EikrI02kgMk9LNR4uVYioc9
	 Sf+zZiTlbI8QmyCjvg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.221]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M5QqN-1v17qu2Caj-00FIhH; Sat, 27
 Sep 2025 15:57:37 +0200
Message-ID: <1bc9a4b3-7a8d-4bcf-9481-36fdc76e066c@web.de>
Date: Sat, 27 Sep 2025 15:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Lee Jones <lee@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
References: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Subject: Re: [PATCH] mfd: macsmc: Initialize mutex
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250925-macsmc-mutex_init-v1-1-416e9e644735@jannau.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:NP8BtfQimdEvXv9Rq7e//xfDrOyxRsxFbOjcZln17pFcUU25ON4
 01QEjVcgNfaTJiqNG74TimTsw2+MZj+3bWvyq1HELeHmdcSOrRGA/RNyiqjhuFFg2nwuvwB
 pg6rNtB+MYSqxA3JHX80TfCeicnMrDFyuFYwbcb4ELV1SPOaihhAPBNPS879GjrHhYYT4Ai
 t22PzWDqTBLP7Il49U0bA==
UI-OutboundReport: notjunk:1;M01:P0:syKLplIkyV8=;m9npGcuZVIwJ/6WdKlV27+G+lGw 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 S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_065750_410906_5D69D932 
X-CRM114-Status: UNSURE (   4.00  )
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

> Struct apple_smc's mutex was not initialized before use. Surprisingly
> this only resulted in occasional NULL pointer dereferences in
> apple_smc_read() calls from the probe() functions of sub devices.

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.17-rc7#n94

Regards,
Markus

