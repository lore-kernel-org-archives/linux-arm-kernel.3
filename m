Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 685F6C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 18:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N67EZfp2e+e+HllfTzxdaGv4bPaFmFho6lPpUSIO1DI=; b=3ERbRZ5mnrj5cOUeHFHTQ8uKlv
	6aq9CvmGfZcxKA38fXR8i950E1Z87A8pcdiZ1rb0/PjvK10aqjKwa9m3yqmAYoAWxCRpABu1EDy/N
	0/a8kdnwI1VChNZSpXzz5vhr54+eDQu0dwl9H17FwY9Vb9en/3ZsG+LRswjIfr+mZPskEBW7NFKff
	Fzl6Rp23iEV4zN7NRF2NddOmfE6LCkGk6pgH2EKPfxto5Q2hPz/UYGBWTm3dImuf3VizvQ4hD+XI/
	Xw9fbG8XmEfCVFHif4q4HFsRSjjYP/4oq9Hwoi7Kc0AeHxEF5WER5uBzyVxetTCC5r1hpaby7LR3p
	48r2mXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkl5-0000000FAR6-3gXo;
	Fri, 04 Jul 2025 18:03:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXkSj-0000000F8C2-02A3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 17:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BE5646159;
	Fri,  4 Jul 2025 17:44:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACA0EC4CEED;
	Fri,  4 Jul 2025 17:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751651076;
	bh=v4HqrO/Loccpnm9IAZIiomMoOx53gCodU0/+eM3L62c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEi8pj/kCMl95J2lMztV2IxkDV8mgs4XOj5do6SyB7RcJ2kfsBK4xKMnFKuHFMxwC
	 7ZvMJy9KuGqDeHL0ZihnSDnxIEZvVlIRgTtK06oW9mB5aWdW/YPoVUF9bzYQgp/ibE
	 7lsO6jb0mEzBe5/S286MAekCB5dooB3Av9pNnlUCDjDiBy7qLcwgyMSAz1M+lU7HEo
	 zTk6cWB8Dgo2nmUD1kCJ+j6vMQzEfF9JExGzusMbiL20MHHlcjQPwKzYGegn6igtfU
	 00JTL5PmJeoLZrojg/I0nqwt4jtwodMdWDZsFBpiyw7qlAmLalCww8CN9fYC8BWMmY
	 wn/u5S88Z2dpw==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	imx@lists.linux.dev,
	Colin Ian King <colin.i.king@gmail.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] perf: imx9_perf: make the read-only array mask static const
Date: Fri,  4 Jul 2025 18:44:12 +0100
Message-Id: <175164874778.4003522.7716174042065513096.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250611133917.170888-1-colin.i.king@gmail.com>
References: <20250611133917.170888-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_104437_066852_25D9200E 
X-CRM114-Status: UNSURE (   7.23  )
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

On Wed, 11 Jun 2025 14:39:17 +0100, Colin Ian King wrote:
> Don't populate the read-only array mask on the stack at run time,
> instead make it static const.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: imx9_perf: make the read-only array mask static const
      https://git.kernel.org/will/c/b6e37b27bf68

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

