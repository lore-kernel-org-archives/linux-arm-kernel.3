Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06786E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyJVB/MdWCZT74nUitnmXi2YZityeJBphbDZSlGPeZU=; b=URyMwSzqD44N5q/DuOhr7qv2A2
	jXjboz6Ma95OF+fSn7YOpdcqDlmtfPZ32ifZJfN2gqqwZ3FiYiO8p14V6phujSmMfx1p0oWuRJCu/
	/2hBuYYQxsBbThFehWNLHaBiT69LdDrlweg0eSK0JZKgfcYj0qINvw91AgbmXMrBRGZDLCtKe9G7B
	il9krwrRje0dQ8ENiBkB4BGSzRT8Ru01Jgmp9grRPLSeWmPCwDgEs+KUtelvE9FaOYYLmLrcEKZqa
	TWY85IPCr6y1iBhy7eUBDk2yzZkFMqEGSsYX4pTDmykJqoRNlIyNI54/gnzWQhrnQG0JdlTq+vOCb
	588ItQug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMc5-00000002uX1-1Wt9;
	Thu, 19 Dec 2024 19:55:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOMUq-00000002tVE-2ZDX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 19:47:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 60800A4292E;
	Thu, 19 Dec 2024 19:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8731CC4CEDE;
	Thu, 19 Dec 2024 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637663;
	bh=Gypsu5NU4iuo4uY79J11EnxjesDJMDTZYpXBwXuU2M4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2olWgsvDnuBPf9lK6b/NPtTM0tjb0ukt6trrWtb258yTmiW0Ng7DMkIlVBeLCKqN
	 UkYGl64xmKMy79C+dGcAieCfWhObFX7ZF6jc30hDuWkQlcw8H/UKzFduexaoEsEgOI
	 U4J0fG138yswUfhe01y4em4jGqW64ofyEJDS9lUrN7LXY+FN9NNxzU8D/Tlu+H+Ika
	 V4Iph5yBXiUCzPpci7QSZuFaceGMsW4CID3/R7+Q3IknnMpnslEbjo6FRJUlpF+syE
	 kMtNJw82jF+H7pqSPKBebRJJZxhA5ut6bEYSsFBOuWFku5YfGY8y66owTbV+khQOD6
	 NNYM+FYWWAAVA==
From: Will Deacon <will@kernel.org>
To: Frank.li@nxp.com,
	mark.rutland@arm.com,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Xu Yang <xu.yang_2@nxp.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH RESEND v3] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
Date: Thu, 19 Dec 2024 19:47:14 +0000
Message-Id: <173462343305.3913401.15165333302624535869.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241212065708.1353513-1-xu.yang_2@nxp.com>
References: <20241212065708.1353513-1-xu.yang_2@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_114744_713760_5BD1950F 
X-CRM114-Status: UNSURE (   9.58  )
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

On Thu, 12 Dec 2024 14:57:08 +0800, Xu Yang wrote:
> The imx93 is the first supported DDR PMU that supports read transaction,
> write transaction and read beats events which corresponding respecitively
> to counter 2, 3 and 4.
> 
> However, transaction-based AXI match has low accuracy when get total bits
> compared to beats-based. And imx93 doesn't assign AXI_ID to each master.
> So axi filter is not used widely on imx93. This could be regards as AXI
> filter version 1.
> 
> [...]

Applied to will (for-next/perf), thanks!

[1/1] perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension
      https://git.kernel.org/will/c/f3edf03a4c59

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

