Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC95C43327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJfRevYKZnjiM4LAB7ObCEKs2ZtlRLB5XTD1EwM8hAE=; b=oSwxTvFPvcbxbWknpKe2uz06H3
	Nl5GbdZrvoLsJ9I8u6KyzNhMtcBzYNghLL9lLtv9mVX94GD1/cXOto87SbI8Rzf1Q3uQrTHm3xFwL
	AHNC1CiIgE8g4r6PczwNh6dvkti03Uy9v1a/tAkiNComNHVW9IXxctzsew+xaqwCG9zFW++XOKr9C
	MIpy3S2mzCXbRT0TZSm6/nVYAeLpu8rHDhvHUcdrkjQWx1ivGgMbvhKlSQQ62apzLZDvLQoCNPAq7
	mop+bh/j2lR2/lxZBvqGfb8Rs7CfjUzLSW8vuJHYfA0Ajj+kgfm60y00PdpKp5PNoLnagKt346+iT
	OadYk1fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUhr-0000000GONG-0IRY;
	Tue, 30 Jun 2026 09:24:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUhl-0000000GOLG-1JQM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:24:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5AEF43B2C;
	Tue, 30 Jun 2026 09:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFDB1F000E9;
	Tue, 30 Jun 2026 09:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782811472;
	bh=AJfRevYKZnjiM4LAB7ObCEKs2ZtlRLB5XTD1EwM8hAE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=oZ5PMa66e+ZvDTy05XMNUAAvUvpVldjbgKnGuFlao3vcMXOZzh9MGKcOLcBkUSHup
	 A31/w1fgxlIS1YPM2wpNFs+0iLQowtXy0O3CdWyvqG+OvmWc9P1KH88mR2tdWgbYYV
	 yGtpLy4IOBSoN12dC4WWQmG1pn4h7lpHKetjl5CfzTbvXou5eFZ09sCzxpnWhJzjri
	 +AIUPrbAZHwNlaQZVT5RlGgF6RFJH4SkLII0aeaNY3Ls0nHABtoQ4B2eTUHFqi1/xg
	 3fpbPfksla1PaHfCMNXd0QiPyBTlKKOd/Uo8XDp+vXLcUxJpS3kfSBSrP9uOkBwIye
	 TpwLdVy9oPIaA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Sebastian Ene <sebastianene@google.com>,
	Seth Forshee <sforshee@nvidia.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: arm_ffa: Handle maximum RX/TX buffer size
Date: Tue, 30 Jun 2026 10:24:27 +0100
Message-ID: <178281142760.1092207.13206102397024673554.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260602-b4-ffa-rxtx-map-fixes-v2-1-7cb06508da84@nvidia.com>
References: <20260602-b4-ffa-rxtx-map-fixes-v2-1-7cb06508da84@nvidia.com>
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

On Tue, 02 Jun 2026 21:54:06 +0000, Seth Forshee wrote:
> A partition manager may reject unsupported RX/TX buffer sizes by
> returning INVALID_PARAMETERS. Commit 83210251fd70 ("firmware: arm_ffa:
> Use the correct buffer size during RXTX_MAP") has the effect of rounding
> up the buffer size from FFA_FEATURES to be PAGE_SIZE-aligned, which may
> be larger than what the partition manager supports. This caused RXTX_MAP
> to fail for some FF-A implementations on kernels with PAGE_SIZE > 4K.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Handle maximum RX/TX buffer size
      https://git.kernel.org/sudeep.holla/c/53716a4d745f
--
Regards,
Sudeep

