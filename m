Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872C7606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 10:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X9qwSrAR;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=cDWb3qT/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=3Nk0nU24+meLVqI1sm3rEuY4RzCVvkveZrzwpOYwNYE=; b=X9qwSrARnDA6/g
	z1tqMPlQaLgx1B3MU0ZYmbjJ4NJ5Y3Mreay5YyCuZOwzHaig/Hd2jZaACBYIxx8DdLWCPo+0XmU/L
	te9Z22x/hbPo/uW9CTLmpcQ0ipaabroP8z7otZHL+J0mPPQ+p47FPoYvZuXd1ko1PwKRz1vQuDML+
	DOxRUydHNS1LJdr8h7e8tfzTRJTvlaRjjHwMIc3tYBd7iaDr5LM+OMNR/MBNWJF1NCOjmvZ1BQMSm
	Aw49YxkMfsHJQ5N5lySFUEN052Ls34MSF160mHiUrP/BUG+hrCO/T86f6koaJz8ppwzRmb9E3rhRf
	rabQAaUdlbmq1U+wP5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHMR-0000000ByUw-37m3;
	Fri, 06 Nov 2026 10:39:55 +0000
Received: from mx5.mail-out.lima-city.de ([91.216.248.207])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHMO-0000000ByT4-3gTA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 10:39:54 +0000
Date: Fri, 6 Nov 2026 11:39:46 +0100
X-Lima-ML-UUID: 554dd730-d676-4122-91f7-1c59d9d713b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1793961589;
	bh=y15sNDWn90awgqBw5hBeSKcVrhfHO2rodDf3pddDytg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cDWb3qT/u6wg+nMEavmew+22jeSdKRDqohx2EHrtipzkYn+T9LYUUDohbAust8DWM
	 IStMWlE60ZIv4cBqdQFjVf9ZJGt6Im1FSzSMlSRGQlE+35xVl2F8QqhEFSCvDHQrIM
	 OYY8gnwlk7F8wcaCXHW3LGsESqhT46xTZXK9gJ7uC9dt/n+H+XJD0Z009NAtp7BQ/y
	 9nsk3WvnOasOzgTDxlpInk6WB6+mSTlIgfZTXcBJ/HlKnR6XZOmnVB5EZoONaK1OQX
	 4raLUYRZ4v8DDGXeV6EVFkwlEQ9DZdAh+d8HiY0T3V9l4hz7ESop3P0x4dGJmG5L/U
	 /wYFPqtcQKk2w==
From: =?UTF-8?B?QW5kcsOp?= Eikmeyer <dev@deq.rocks>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: Myria Sarvay <myrialsarvay@gmail.com>, marcel@holtmann.org,
 luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, sven@kernel.org, j@jannau.net,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Yossef Osman
 <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH v2 1/2] Bluetooth: btbcm: raise ACL priority on Apple
 Broadcom controllers
Message-ID: <20261106113946.60c6c5f6@kait2en-mbp15-1>
In-Reply-To: <CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
References: <20261105085750.120392-1-dev@deq.rocks>
	<20261105085750.120392-2-dev@deq.rocks>
	<au1uH6uxtsw2vHfP@macbookair>
	<20261106083339.677cc75d@kait2en-mbp15-1>
	<CB3B84A2-76AD-45F5-B2B9-39E5A9ED3BE7@chaosmail.tech>
Organization: KaiT2en
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_023953_412602_30212644 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 6 Nov 2026 10:40:58 +0100
Sasha Finkelstein <k@chaosmail.tech> wrote:

> You probably shouldn't, or at least base it on v2, not v3 (that one
> ended up being a bad idea and caused firmware timeouts, so Asahi
> downstream ships something more similar to v2).
> 
> In addition - have your tests included entering and exiting stream
> with an ACL link active? That part always caused problems for me.

Hi Sasha,

I tested both on the BCM4364 (15,1) with 2.4 ghz wifi under load.
Your patch (668d849694ef) and mine, each with a reconnect, plenty of
A2DP stream cycles and profile switches with the ACL link up.

Mine sends 0xfc57 1 ms after connection complete, before AVDTP Open.
Yours right after AVDTP Start. Both complete with success. Neither
needs it again when the stream is left and entered, the priority stays
on the handle. No timeouts with either. The short glitch at each
suspend is the same on both, so it comes from the stream restart I
would guess. Scratching my head now. How you wish me to proceed? 


Andre

