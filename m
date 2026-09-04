Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C2EC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNKLhiDSEenfEZG4Q+Fp3PWK8iwiBUun7ZbWDLDiUpc=; b=SXrhXFgjfRE6TuoUjX5DQT3Z1X
	xm1vIVIGJdIXi/fEQixktkTrVCIuifdNEqGojpKxwwNt2mAGI82zHHJMOFVRVg80kd05EcS7MiXnQ
	y3miT/5re2vLuIcTHPNFeKdkhqKXWICgvrT0VYzHqG5mhYyzKhLQHwDnFd7P/OMwUiKceD79bIlHh
	e7sdutc+e3F3Y2CxVcTbkSwOTH2eHo0hUrne3vdXgTSNS4v0B3XjfgQNSqhBhAzTzY5PMUUxIRNhS
	bAT4idUIXYliCdudu9x8sX4RoGw+7zSF4zPt+wvQRWOtrFdpe2WfA6zFlipOToa18kI5CUFg0rbFv
	B7Uqka4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tsz-000000029Sy-17Sg;
	Fri, 04 Sep 2026 13:23:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Tsx-000000029SR-37EJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 13:23:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D3B6600C8;
	Fri,  4 Sep 2026 13:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D2D1F00A3D;
	Fri,  4 Sep 2026 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528194;
	bh=tNKLhiDSEenfEZG4Q+Fp3PWK8iwiBUun7ZbWDLDiUpc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=H7bEi0svPt6U3TOa6ed5LLiNfwVWrqGPVjn/mKgnPoy1E5lnjQ7xLK948Ne2KwfF9
	 6yLewIjVBWdgbUUtGpS81iZY/etBAjDRnd4jwEC7AKdTmYaw0XbwN/JRyMSakxBezY
	 i75aWHVy8IAfWvcXFzUU3pzqDOcCJ+HrzQloeMi5aoqxJ/7JPvzxFqUsUnYG4RO7de
	 Eo6zuGGLBBnbDverOUw54ER+rz3V820rruVSVQOmdf70/6qOwfVp6xfPumFwejNsZW
	 +CtKhx7aH8xpCG4QMVFof1TeJbT6qoKi5ZHwEEI3cFp90xa9kgpQdOvm7HMqNiPgZ/
	 pI4T7nynQNiiA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: Nat Gurumoorthy <natg@google.com>,
	Carol L Soto <csoto@nvidia.com>,
	Maxi Saparov <masaparov@coreweave.com>
Subject: Re: [PATCH] firmware: arm_ffa: Tear down driver during shutdown
Date: Fri,  4 Sep 2026 14:23:10 +0100
Message-ID: <178852815766.332553.14929341497188018251.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901131112.3437516-1-sudeep.holla@kernel.org>
References: <20260901131112.3437516-1-sudeep.holla@kernel.org>
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

On Tue, 01 Sep 2026 14:11:12 +0100, Sudeep Holla wrote:
> The platform core invokes a driver's shutdown callback, rather than its
> remove callback, while preparing devices for a normal kexec. Without a
> shutdown callback, the FF-A driver leaves notifications, partition devices,
> and the RX/TX mapping active before the replacement kernel is booted.
> 
> Use ffa_remove() for shutdown so the existing cleanup runs before a normal
> kexec and other orderly system shutdowns.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Tear down driver during shutdown
      https://git.kernel.org/sudeep.holla/c/3bb3e80faf21
-- 
Regards,
Sudeep


