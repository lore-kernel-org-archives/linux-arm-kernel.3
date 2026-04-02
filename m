Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F2FD39422
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUmp+7rr321o1eCPObWzw0ClTZ1L4kHb/nxIij0My8Y=; b=Mc50Ljqke/PIFBaJfVgAFt6yv9
	ISLQniXgBPpvIK87/ldPGZ9szNm06OoJs4reLryco50EfyWH7iScTF5dR7eVFyj+Iop6ak5p9vUCI
	eHCM8xFZoBUdyeDWokrpNvlNjA9b5/wSEXtYPALmlezBm94/AHDxwnjI+K2DQmgiB0DrQJYOfJ0I0
	K6K5Ip6iwx/735+75JIlWRx+XzF5K1WVNB/TlWa9ES/mFDuLnro/2q7DGYHstd3uPOudtdWBuqmTd
	umvVUpbN7gu5apvO91TcGrB4aaFanHr/iPtzRCBlrpYwGPEgc42eMSIGnzLTnsEn24kbIp7XqjYY0
	SGd/ajug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEX-00000000C4b-2kaX;
	Thu, 02 Apr 2026 13:37:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8IEW-00000000C4D-4BBQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 13:37:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FB3360008;
	Thu,  2 Apr 2026 13:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D92ABC19423;
	Thu,  2 Apr 2026 13:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775137035;
	bh=MyNeVdgyiXEJqvB3NK6VP2qV2/pOvYxFXY/49r6TRK0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qqzyr6BTIGFvgYtHP5DyD71QAxT5GHKtDXUOjPbWn04lCkHcwHP49YvA/6wxfCaPU
	 AqFaoQqH/B8kckrM4sED5ueV8HHjZJpe2oR2YRfYrPwMqT91sGUX47vVFysoViKDaq
	 0YsBkEsi5+HiW31kUMVTm5G9PHUwlFPErmcT4Gi03Vwu+9B4ViSW2rIJ3U1U8XJwYM
	 0bNTAQ1gI3vE0mb0sPi8d5V9oHVL8IfHtgtuuf6LiAfOMz+WEF57Cs1oHK1e3dZZav
	 fqD9WCyo3UAS5z+HxKJeKRKsNB7uIPJmjGZfSlPTrFfXB3sERrgEZI7WwLZSnHjkgb
	 BID7wNb23uvGg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w8IET-00000008H1L-32Ho;
	Thu, 02 Apr 2026 13:37:13 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Zenghui Yu <zenghui.yu@linux.dev>
Cc: oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] KVM: arm64: selftests: Avoid testing the IMPDEF behavior
Date: Thu,  2 Apr 2026 14:37:10 +0100
Message-ID: <177513702840.453314.18229449819566784185.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260317131558.52751-1-zenghui.yu@linux.dev>
References: <20260317131558.52751-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, zenghui.yu@linux.dev, oupton@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 17 Mar 2026 21:15:58 +0800, Zenghui Yu wrote:
> It turned out that we can't really force KVM to use the "slow" path when
> emulating AT instructions [1]. We should therefore avoid testing the IMPDEF
> behavior (i.e., TEST_ACCESS_FLAG - address translation instructions are
> permitted to update AF but not required).
> 
> Remove it and improve the comment a bit.
> 
> [...]

Applied to next, thanks!

[1/1] KVM: arm64: selftests: Avoid testing the IMPDEF behavior
      commit: 03db5f05d4c76d76b32a9d26001e2ec6252f74f8

Cheers,

	M.
-- 
Without deviation from the norm, progress is not possible.



