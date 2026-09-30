Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE54CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=; b=O6r2cadzLiSTeVmbtZ+a0ReQ+M
	mc4Yg4iBZA5MZpRYdTbl6DpKSMeZr/aLug7HcGThjzJt1zARlEHK3nbm9W16kneyKOV4S2CA28NkB
	x1axhfg405peff8JbbCKXde5eWQUcOdUTs9LiQpQkTCPk+sSkaFBZorzj3aNrwMPcZnYnZPaRBaVL
	ETKhNcxO1j8gAehN8OA66KdQmFiiZaZrTKyyjkI7M/z/L3OUxHurU/hHZkseZfeav9+HwY+ZPlaEM
	CEktcXDqfB/pVJIHZnc0I8LVCRtlYIfAxPQPa0rOZRTByjYsOjh5HjGpKixG+XOQgv9HaBfi/rm42
	JbvSuWPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBobh-00000005GCu-1yyd;
	Wed, 30 Sep 2026 07:20:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBobg-00000005GCM-3nLh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 07:20:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D1384085C;
	Wed, 30 Sep 2026 07:20:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B391F000FF;
	Wed, 30 Sep 2026 07:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790752800;
	bh=80POjU5WP6ctS0DqN7hA/63JAQ8Agh1hTny2C1kJcvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H1ZeUbIfZC5ycSUZAJzlMkNZj42855Q7MEIBZPwVCAPRX6gP3U9b+ELjNqab1/nlV
	 nkcAdh26pSvyMw+ytLfbvScigRWMMG94yGy7x2DAHWfRHDsYesriMumsQ+yfda1ewe
	 R+rc2h6i7o6PMOjI5MJhc2igLfJhR4O4yi081V7T05/Rp55rt/4gi3XBCCydvL5ncK
	 vscTkSJJm7w3ckqhaLqCxSO1ggTD0Dq+KxMIa90Zm3JNzMdCrUq1996MJwLR+ToBgr
	 kbGzoPFfw2M1wQdq58qixN19ypytkgDg0lsk5NN6tJ7/+2CGwl9ipELmjvwcOBA60g
	 R6JW3BfhHjM3g==
From: netdev-bot+sinfo@kernel.org
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, pabeni@redhat.com, radhey.shyam.pandey@amd.com,
 michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robert.hancock@calian.com,
 sean.anderson@linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4] net: axienet: cap the TX poll return value at the
 NAPI budget
Date: Wed, 30 Sep 2026 07:19:59 +0000
Message-ID: <179075279901.31693.4789169176025211757@kernel.org>
In-Reply-To: <20260930071536.627964-1-maimon.sagi@gmail.com>
References: <20260930071536.627964-1-maimon.sagi@gmail.com>
Auto-Submitted: auto-generated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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

Hi!

This is an automated message. This series looks like a fix, but its
commit messages seem to be missing some information:

 - What hardware the change was tested on. For driver fixes please
   mention the device (and if relevant firmware version) used for
   testing, or say that the change was not tested on real hardware.

Please do not repost the series just to address the above. Instead,
reply to this email with the missing information, so that reviewers
can take it into account. If the series needs another revision for
other reasons, please include the information in the commit messages
then.

The evaluation is done by an LLM so it may be wrong, if you think
that is the case please reply and explain.

