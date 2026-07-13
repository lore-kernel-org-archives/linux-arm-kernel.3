Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C070CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0bZgMafaspD5auo++lHPXkR534u0X7v7qtoj593mww=; b=csey+iENO0e142ut+oCOiEqkSG
	X35yyMsoWFC49vSIIVGfLKhsbdsPgEa4ELIwij1iVqFMy4cLKTZxYHkM78NsJc/lrMBeTRnRN6COD
	mh67yOYjG9RMKUXg1WHrNdQrOAwpAi1rRSgGiTD8Jd1V9TDF7mRnUh/Rbyql1naETrzMSa7y46jNY
	tLkIxEpSiLg4hYRRYHC4GOIz6TBWCN1LgywMpsyq1/80YAsON6rl1zqayYjAt0l0q+fdG/P8Qa286
	xxLV8lfAAC72rnP8DxrlEmdHL6G2L6BiL52LaCfpEiCpzSnL9uNoPNoIFTS76mYaKHmSNWujNv8qS
	SrvdNrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEH3-00000008vxT-3YIt;
	Mon, 13 Jul 2026 10:52:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEH2-00000008vxG-1VIv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:52:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D963A419A1;
	Mon, 13 Jul 2026 10:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A13E31F000E9;
	Mon, 13 Jul 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783939951;
	bh=E0bZgMafaspD5auo++lHPXkR534u0X7v7qtoj593mww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CMOjAr00a2IhCNs1x1rxiVyP8eQ0zW7JX/KBNzRuIpDVmmO/Ij4sqgqV2okBurHjN
	 LKCuWvQUbs+sS2stZwKMa8eYeDKDMsvBhWFN4NkZCi8Xj84TCMtu1c0M9Jf4l3ECbN
	 309UXAuskPeqqYNHLaDNPgFt5JdRW8Wx1rf95d39tff8adBIHW20/jm5Vuk1qvkddK
	 6+5ONkqgv/pp/1IH/OnPjqJ6NYe6KeV5zJZT3MRzjAbYsTNyXDG+FtTtZkYHlasfOS
	 J9tuXTPj34s4HunRd/AfvksABr+5H16NPdPJBrmzFCeY72jEJjYX0qYAL2b0QWyBZn
	 PlzuDt/w6kK6g==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Pushpendra Singh <pushpendra.singh@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	cristian.marussi@arm.com,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: rate-limit queue-full warnings in IRQ context
Date: Mon, 13 Jul 2026 11:52:27 +0100
Message-ID: <178393984320.1815229.18150523678943559735.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708072339.3021140-1-pushpendra.singh@oss.qualcomm.com>
References: <20260708072339.3021140-1-pushpendra.singh@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 08 Jul 2026 12:53:39 +0530, Pushpendra Singh wrote:
> The scmi_notify() function is called from interrupt context
> to queue received notification events onto a per-protocol
> kfifo. When the kfifo is full, it logs a warning via dev_warn()
> for every dropped event.
> 
> Under conditions where the platform sends a burst of SCMI
> notifications faster than the deferred worker can drain the
> queue, this results in a flood of dev_warn() calls from
> IRQ context. Each call acquires the console lock and may
> execute blocking console writes, causing the CPU to be held
> in interrupt context for an extended period and leading to
> observable system stalls.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/fixes), thanks!

[1/1] firmware: arm_scmi: rate-limit queue-full warnings in IRQ context
      https://git.kernel.org/sudeep.holla/c/a4447c069383
-- 
Regards,
Sudeep


