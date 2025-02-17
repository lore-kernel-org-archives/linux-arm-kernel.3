Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC2C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WovgSGbvNWLLRcAWn+Mya6CHxmCESkWIMuKX5gtD5aI=; b=EL1+6nBgszbfExCbg/k5dxFSrx
	40NlMyC41+2k08sHQLovr9qJkzFU4pINiu2UwbOerIqUhdVRc3LbB0xdKgDw0O62iIcFAl6t7rlvJ
	ILjtkSeQ22WwkVFYFU1i0sb01iz3nMYKjFMDhANF4SdI3iKSRTIWGQKMd+HJlQN/l4tVOqucXyPEK
	YlsxEjI/tKcWaD+Zbqj9Az5TfopnwssfS6mSs7n48xNdz+BLXWqys/tuPn/BUA3JTVGtnIqqpI151
	SKmeaxcfYRtntGPA3rISliEnC/kz0ohEnR1n1KYuzR/IAHG7cPeOIrxxAgSKbjqOsU8lpOEfbzzP4
	b2q/4DLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjylC-00000004Bgs-1Acr;
	Mon, 17 Feb 2025 10:53:58 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyI6-000000046Jt-0pYo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=WovgSGbvNWLLRcAWn+Mya6CHxmCESkWIMuKX5gtD5aI=;
	t=1739787832; x=1740997432; b=P0PL2KDJsZ/Yd2p9G6f3agUrAaVSe3pKr7t12JiG5i8jr8l
	11M56lu1McK7QGGO1dDqsx+/LJGrWgIT+Y+BLUELrLyyRIl4k5ub9ouklIFvZq2dcclwyZqa/E3SN
	LWbrGR6l2NB465NwnxD+d88YRReP41ny15LX5GTg6EO3W7TCig4qBIBFVrT6n1GN6qTL73OK/p3oM
	UqLUMN7UZ1ORFghbhDVuEh6dqhdzk4wmZPtQCLXJTNDdjDJc6Bp5bb0fvAOtMvv0s/89/HeXSKYuT
	Nmy177uUWDbKKp2DHCJZc9E+HUkJ3MfM/TZdjB8e+GwqMPrUhzOU/YMj+d4K+KNw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tjyHp-00000000GpA-1DBY;
	Mon, 17 Feb 2025 11:23:37 +0100
Message-ID: <c4b48faeae8531e670ea5909800d1a0bfed69862.camel@sipsolutions.net>
Subject: Re: [RFC][PATCH 00/10] pstore: directly mapped regions
From: Johannes Berg <johannes@sipsolutions.net>
To: Eugen Hristev <eugen.hristev@linaro.org>, linux-arm-msm@vger.kernel.org,
 	linux-hardening@vger.kernel.org, kees@kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 rafael@kernel.org, 	dakr@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, tony.luck@intel.com, 	gpiccoli@igalia.com,
 pmladek@suse.com, rostedt@goodmis.org, 	john.ogness@linutronix.de,
 senozhatsky@chromium.org, quic_mojha@quicinc.com, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Date: Mon, 17 Feb 2025 11:23:35 +0100
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_022354_513841_3A1819CA 
X-CRM114-Status: UNSURE (   9.88  )
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

On Mon, 2025-02-17 at 12:16 +0200, Eugen Hristev wrote:

> This series comes as an RFC proposed solution to enhance pstore and
> devcoredump with the following functionality:

...

> This patch series attempts to solve this by reusing existing
> infrastructure in pstore and devcoredump, and provide a copy-free

...

You mention devcoredump multiple times, but it almost seems like you
don't even know what devcoredump does? I don't see how there's any
relation at all, and the code added to it seems to have no relation to
the actual functionality of devcoredump either?

johannes

