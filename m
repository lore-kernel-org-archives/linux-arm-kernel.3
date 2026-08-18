Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78F0C5DF70
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 07:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VofBgp1UVVxJjLuvlPPP1hBPGKApSo0zeOOZRAsVsno=; b=oJZxAY+UZ4gcT2DARmHaTzkle9
	OUhebWApCUByp5bW+V4gSi2ju8pjCvecep0ct5g5kiCCSAVWTu8QV3LCungMbOvDrhD6Lwhpv2qw4
	xA55jvWbMmy0ULAQG73VP9D9T0B59cFlb3XGbFWSghnIc/1XJ18JrWM/QVnHIXUGoID/Rcw/IvRCI
	7Br1gEz7n2f6lhSSo1Pq5MCKGX7ajEzEn6SGJ7bd9/vvLb7xaIxFKQjWPkry4uipH+8NbsQlXz7jM
	nH8ODZQ9eHEsRaoCQ/yqqny3cZFIyKZk1+8VFMd/lMdDzSXtOCppDsLfmuUNyFrx2m75kvjdA5dj9
	BEfpJaCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEIe-00000007SbT-0HRh;
	Tue, 18 Aug 2026 07:31:56 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwEIa-00000007Sb4-2BR9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 07:31:54 +0000
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 62AB4140003A;
	Tue, 18 Aug 2026 03:31:50 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Tue, 18 Aug 2026 03:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1787038309;
	 x=1787124709; bh=VofBgp1UVVxJjLuvlPPP1hBPGKApSo0zeOOZRAsVsno=; b=
	KXcvRNQwkIfLqneA738JVqiNrfy8aEu9CBhIQuR3/OlQQE12In3AZbg9fdvxorTj
	oqJlmqS7QLfiei4lbOK+cxvF8OAcIFp8M2JJsYIE/IcWHMVRh/e3C37Amk5EJ8cy
	+Uo6/oX3NUeZ2ky9PvhC2YfLm2z0ocYOd9f00N4bwuQYBjgJnbBBMJ6+RQBKCER7
	dPLohkGaKJ7HY85rEJw+QbCD36JFfqQr2ZIiLdl2WpaBSIjRj+tOurMKm6wBPUlJ
	RHULgBL1Ntk1wZcHvAmCiPu36O/Gi7cdGKpwk9kkHPkmeITo35x1U31d7F7reNtu
	OVzNdz0ni9FuRUSxJaaOJA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1787038309; x=
	1787124709; bh=VofBgp1UVVxJjLuvlPPP1hBPGKApSo0zeOOZRAsVsno=; b=l
	x06Z0xpUifeKs8rx7Z5i1z2wowySs0SIh4gpvAKluWG7x7a5ei5ZBP7xv0qYfhuH
	qtw7jK8Q06RN/aZ6y7Dlke9p1wyJhjLhrvjbuTY4A88PCGapp2MLMj+T4nGKhXyM
	vzKUwj9Rimyjlhy+VSUR/yRDUZUeXFOA6bqWWixx+xWDBvqxkZ0DP6Ythwa458zm
	5h0RClqkdfyM9Hm8TF8Llf5dIDrLpwcUZbuy6dL/hXlgqZf2+ovM+LZQP4WfwaUt
	0nCT0tF7jXkcgNQ/ilf2hEyyVgXZNnmBMaY2m+FpCr9gvb2PRNx9mGlmErJ3lSK2
	qPk7W7ALhZY71rakVq7sw==
X-ME-Sender: <xms:YQqEavSpjviV4PNJBXAsvT2xonFQWIM2Hvkf1d2Y2sbzNAsGjZm1JA>
    <xme:YQqEarlo7iE_DMmpp4-ECZ2BGd4Cyg7kA3mkPV_-pspnRDcVPMhQnl1_1_2zwLbxU
    0EXy_94-odl-nI3pe94my8vAZ6i1MWplGr9lH44NnhXd1jD50WqIvrn>
X-ME-Proxy-Cause: dmFkZTGSPXZmTKbVzD5fRDu6Plm//uKp67jlktJd9fu0QOF2thqk7Jc4vDVCqNAPP0/g79
    ApVfOBD/JPRDYzt4RGKrO+6ded28SNpAiFhpM5ZFfzvEH5Qt9l28O/BzVkt6vcaogDC3/8
    V5NGh885O4zZPahCYWfP4kppVWOj5kH2+/ELdHN9VmJTpLxOpgKbk9CR41aFWrhDdcI+cF
    QNR5y5p77kclzCUY5tBhVvhWvGPHjmIuNxxs/g7CSGRrUWgDqo88F7GRaXKr+AiWN8xfNp
    WexlxXgojWO5qBX0oeEpu4hRYypj7bwbvdrDtWehAijQh/zQEcn3/y3NBjzjzTHPCMPJpN
    NDbBi/yp0RhP6cF8pzEdscdHajn6DFXDI1vXT7i1ALnKBZvZGmwQTuURjS1ZtLvhTc884c
    l2daJuWE8NpBHAn4fxUdFGJQsLUzi96P/a+JRR77hPYsxUWirZ6ZstmQN5Nvves4SnpZwy
    ariFpDjzG7dyLHoifXS6JzwOYN1W4CFgPBTcwBRJ4lUtXgwVq8ErAaj1vK2hCGLGvbWNxu
    o8BL/vzT7uN3jI7uqAc0mq+9eAX5m2xrazJmuvnWANUEftfaGP/cDdIwcYGjze8srsBREw
    C4w3cn+zkn9shgwEo2u1XYVhkSdYYSVGAoXmQ9c+HYc4VCQM2CZs+Av6t3xg
X-ME-Proxy: <xmx:YgqEak5bNx1rrXoSYeqydv7bpSL-GWqwAnlLb1iWsGyz-On-WfZMhA>
    <xmx:YgqEav9Tz07Iwb0N3Hez69b9-mGj0fWNjD6VPZBFsFF58DR3BSX0iA>
    <xmx:YgqEajU5rNhvJgoauHd906s8PfzoOCfJeyzxnYwKAYFVnCwYulXUSw>
    <xmx:YgqEaqr0_j1zuh2oWmpLKINZ7Dnp1jrdt9oQWUkYXQLFDijpntayMw>
    <xmx:ZQqEatqgW5jS4_JNtleIgkaSgFM4_Kihg7w0v2iEhRfRt69aeaTNhkuo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 2ACF432A0071; Tue, 18 Aug 2026 03:31:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Aqm_jcT6PvEF
Date: Tue, 18 Aug 2026 09:31:14 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Mark Rutland" <mark.rutland@arm.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <e3c463a1-81ae-4bef-b65b-fea1a4eda5bc@app.fastmail.com>
In-Reply-To: <aoPKzPb9YUVULlXG@gmail.com>
References: <20260817000231.21311-1-kmehltretter@gmail.com>
 <e238944c-9349-497a-9d30-0dd2edd7f115@app.fastmail.com>
 <aoPKzPb9YUVULlXG@gmail.com>
Subject: Re: [PATCH] arm64: compat: Keep alignment address arithmetic 32-bit
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_003153_295998_5B828875 
X-CRM114-Status: GOOD (  15.01  )
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

On Tue, Aug 18, 2026, at 05:22, Karl Mehltretter wrote:
> On Mon, Aug 17, 2026 at 11:15:33AM +0100, Arnd Bergmann wrote:
<
> The 4 GiB wraparound case is possible with a rather unusual arm64
> kernel configuration, and correctly handling an individual word
> crossing the boundary would require byte accesses. That seems too
> contrived to justify the extra complexity here.

I don't understand, what is special about the configuration?
Isn't this exactly the case you were trying to address with
the compat_ptr() hack?

> Just to be sure by "both instances" do you mean the nr_regs
> declarations in both arch/arm64/kernel/compat_alignment.c and
> arch/arm/mm/alignment.c?

Yes

> Changing nr_regs in arm32 alignment.c would not change the generated
> code and I guess probably not be backported, so that would create a
> divergence with stable kernels.
>
> Would you prefer changing both files, or only the arm64 implementation?

I would suggest doing only a small change to arm64.

     Arnd

