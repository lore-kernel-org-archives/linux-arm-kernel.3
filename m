Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD92C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9WC43RiWACipaJVVputek92HstgNSaNHPvk7+Q6kjg=; b=RKUVVFjkb22qIeFfs+7w3c3fiH
	W3kY0gmC4kl6YFxEwDrWgaz6LyE7WaABrhFmkIOxEfAl0XPyQ6qjZeqlT9NVvdQruXNO+cP1j7vCe
	vC9NOqYufIjbVqQDYMXcVeTJCvAgH3Rea0IbMsYOBvucpGklB0E5Ii2aTNNkvfWHKv0JIxSonkMEC
	8Glv/GwAy3pIBd7Isuc5MT+l/Kq+BpPspUy5nOLRIXR8XPPCzSZiMBATVAttczGJsaUnhHfr7bhkS
	0LmecCJrNVvO6VGHk5TXRMS6f4Rg05pR+l3IyzssEvtUJVaTGEu+zR9vbFMIUdqnvjSRnzChFyNmp
	g3Ef3XvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YD-0000000GmHv-1otw;
	Fri, 11 Sep 2026 13:44:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YB-0000000GmHY-3xM8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 518D340626;
	Fri, 11 Sep 2026 13:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0BF1F000FF;
	Fri, 11 Sep 2026 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134259;
	bh=n9WC43RiWACipaJVVputek92HstgNSaNHPvk7+Q6kjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gbNj34mIcxztxPJbOWUNJYdSbplYgK4TOEeBGAQ2dTOfuNB3piJzRpzmmEnRU/2iI
	 aNqN6KCz11dEoEnchenQ02aCVf3pzWEndcS97bWSWagU4w67pdN5ow6rkEVa6LTVvO
	 edYbUUbdJ5xfkOwADk2xEuabG6T3PKxVrXF3mQKX3qC8pEv4P/xhMPqkqiOhbGOHnm
	 tVHpWzsCYAZrzP6k8AJpsWes/CuQtgiVp41bEKA3XSwPXAMZndEe223cL/NcZeMKSk
	 Q7U/G4X7NKf9yRl/s+7ct7RBoB2qZNoUuxbui5To+DreHPC8w8hdeXXKZfFNe07gBg
	 ftGOiGLJqN38A==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Shouping Wang <allen.wang@hj-micro.com>
Cc: catalin.marinas@arm.com,
	mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	peter.du@hj-micro.com,
	andy.xu@hj-micro.com
Subject: Re: [PATCH v2] perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
Date: Fri, 11 Sep 2026 14:44:07 +0100
Message-ID: <178912838524.2439009.7355093627260324589.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910114601.165237-1-allen.wang@hj-micro.com>
References: <2fb3bda7-cd64-4dc0-99f8-c0fda8d42cf9@arm.com> <20260910114601.165237-1-allen.wang@hj-micro.com>
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

On Thu, 10 Sep 2026 19:46:01 +0800, Shouping Wang wrote:
> When MXP_MULTIPLE_DTM_EN is TRUE, each DTM will monitor at most
> two device ports. In this case, {wp_dev_sel2, wp_dev_sel} will
> only use values 2'b00 and 2'b01 per DTM.
> 
> Previously the setting allowed values beyond the supported range
> per DTM, which could cause each DTM to select invalid ports when
> MXP_MULTIPLE_DTM_EN is TRUE.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] perf/arm-cmn: Fix wp_dev_sel2 setting for multi-DTM configurations
      https://git.kernel.org/arm64/c/49daa3d668b6

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

