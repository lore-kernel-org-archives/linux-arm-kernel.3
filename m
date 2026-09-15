Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D71DC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 17:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DY+0xgImxoBM8p82Er4Yx6/Hyx1wI9449SZ2ErT8t0U=; b=EMeQdpLaLBNOMFuN+ZuHG2MBiP
	yEvjHLwo1Ga2XyCpPY+0A7BVqGQd/6YLSyULZfXfWh1ZDfsoKBnhfMGSA1HhIfFTVBCYI8m1ZM7Sw
	v7Hd0P2EC4Od3HUCXLX7Z8JTL2DFVsfLdwFsMsfoEK0pVpPJg94cnCHEcgrbBnnnNYS/AvjqTdaTE
	G+d/8kzh8EvpUjOmRL4pC+qTUBuerG28rZQwJM+CiN6yze0A6OJf/hZruOduseQEI+cG3ZCX8RHE1
	Cw67BTjz4+6IKEIAh9P+Iz0tsbfx7AKmlJC/mYdEgHsN+T6mMf+o1SNhLnC1RYa6LGtn8s/sFQkDF
	/KqeZAqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WtM-00000007Zxj-1dGe;
	Tue, 15 Sep 2026 17:24:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WtK-00000007ZxN-2kb2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 17:24:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DB78600CB;
	Tue, 15 Sep 2026 17:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACC361F000FF;
	Tue, 15 Sep 2026 17:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493061;
	bh=DY+0xgImxoBM8p82Er4Yx6/Hyx1wI9449SZ2ErT8t0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V3P22c+ID8sVAMDYNLQZJD1aeOEcJ6JM5EE7a7bhVmk61qAA7SDs0qDGW3AfxfHrW
	 eI5IsTro9Fy+K6/KIVp1n0rwcTd/4r/tHcNHFQv5v3F6Mtmwye+pM7WLe75MgqSgW2
	 hNh6zMQaz6ExQZLrpHD9b8/rjfTR9BgyfBsuguBUVaOBQ1G9whUrpoXXu6ViOVGTQ0
	 ElN2sX6s4HDRjwxYYCHSLWfUyIoyJH/STNk9pHWK8mbs00PawOz1YTX2S2o5dDjGBr
	 DC9Vwo9vhlNQSQQbMA3TkbmjAvk0QV/Bcxb7QDFL2rIgugarV1ZX3ftFfnhWRDO4ld
	 nzxSpntNHddhg==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Roland Dreier <rolanddreier@rivian.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Couple of SCMI race fixes
Date: Tue, 15 Sep 2026 18:24:17 +0100
Message-ID: <178949301698.3922074.1009067435042757840.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
References: <20260909-scmi-async-done-race-v2-0-cc5dec25c6be@rivian.com>
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

On Wed, 09 Sep 2026 04:32:26 +0000, Roland Dreier wrote:
> Noticed a couple of races in SCMI code around delayed responses that
> time out. These are probably nearly impossible to hit in practice but
> the fixes are pretty straightforward and it seems worth having the
> code be sound.
> 
> The v1 fixes were correct as posted, despite Sashiko warning that the
> new "delayed_response_dropped" debug counter might never increment.
> However, that review made me think that a new debug counter for a
> one-in-a-gazillion race condition is probably less useful than a
> kernel error message. So the change in v2 is having the first patch
> log an error for a delayed response that arrives in the race window it
> closes (matching the existing "Delayed Response not expected" error in
> scmi_msg_response_validate()). The new error is expected to be
> extremely rare but it makes sure there is no path where a delayed
> response gets matched and then discarded without any logging.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/2] firmware: arm_scmi: Protect xfer->async_done with xfer->lock
      https://git.kernel.org/sudeep.holla/c/49fc5bc04eec
[2/2] firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
      https://git.kernel.org/sudeep.holla/c/0543fc1443de
-- 
Regards,
Sudeep


