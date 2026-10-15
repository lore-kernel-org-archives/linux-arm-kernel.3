Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9FCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9kla1pysOnHHp0Joak2oKEmTcOipg9czcDlUIJWqkRs=; b=2L2G2voMB6YtHfPKOZkRphPHaH
	0fai+pBNc9LVJ+/UBjKtDsWklhzs3hyTXaP8LUbYpYiV/wVOug7DQJzR7Oz7cttvOGWlbmUJHoYDZ
	lbzWfDJcFy3wtABB3ImceXdJYipbPmYPEJwHl2oIqgOp6/UU+b8V+CJXjCcnLEInWdhKMZ3eNCsHU
	5YiBXjIXXP+0ad70JI5T7RkXQLPqvU8Jx8tDp7cY0K1HeQ69r1QZXgcP0Cv7q+kA7jt4OndfoxUl2
	ocLhdl6Yegrm1KrHHxSqOekKvEpIDsqVDWM0K6JFeD2xtlQHcXyfdl9gDwVsw8b3FMQorNK+Mrka9
	enZGC0tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwO-000000016g0-3jon;
	Thu, 15 Oct 2026 18:12:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwO-000000016fZ-2QsM
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 18:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9kla1pysOnHHp0Joak2oKEmTcOipg9czcDlUIJWqkRs=; b=VcdgGoJIGaqz4XpBsG2r1QIjJ+
	zXnT/nymrFHFRtM8Txu4MN0RETSy3Hy5J5PnEljp6wNbtjHMXgm2i0Hj4iUA+MgQQmn/AT/UceBsr
	LWrspbt+sE1faoDX4oSSA3ElTAE7t6Tp9K+UssqLFOEr2yBG9IfhtAeoM9x4i1BF8Q5vewHWjuZ1U
	mNO5lq0S8djWqJlPhqFrXcMClZ02335EAAqbxOR71fQJBcY3jB+IXvS2mmt2CNEUa6AQVhhDmlDrs
	s3+8Wt+jyiaKBxU4DgQF0Dm1mgbtDJViIR6rcol9rgCa1lzE4dR0EKzYWrkE1WjlXWTttEtDXKk9k
	84qjLvEQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHPwL-00000000iJw-13Vs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5D31514BF;
	Thu, 15 Oct 2026 11:12:22 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D0973F871;
	Thu, 15 Oct 2026 11:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087945; bh=TuDjtD0PmhYRSYPpHswK9nEHHtJ+9frKL8XdDNDW9+o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kp4CWCgwYpgSYpNNP7gw7FF8X/Luo+AV8S9uDZOUdan9SDaYBCEq4vGvGJrB+Xqal
	 R9WSo/JDputCcF4YihHizuOjQpdnFAc1lzlfUsX688otBi32k3ZVgab54zjOXYZgok
	 gDwePzmm1fGGlk267Nk6FV9emQrOmCXePvKxz0Xc=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] arm64/debug: mask debug exceptions when called from common code
Date: Thu, 15 Oct 2026 19:12:13 +0100
Message-ID: <179208793357.161729.11659524862200109774.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907163101.131569-1-ada.coupriediaz@arm.com>
References: <20260907163101.131569-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_191229_582531_1BB33EDF 
X-CRM114-Status: UNSURE (   8.54  )
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

On Mon, 07 Sep 2026 17:31:01 +0100, Ada Couprie Diaz wrote:
> We can currently take debug exceptions while manipulating the hardware
> breakpoint registers and perf slots when called from generic kernel code.
> This can lead to errors and unsound behaviours in some pathological
> (and self-inflicted) edge cases[0].
> 
> Save and restore the interrupt mask around those manipulations.
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/debug: mask debug exceptions when called from common code
      https://git.kernel.org/arm64/c/c889894af777

