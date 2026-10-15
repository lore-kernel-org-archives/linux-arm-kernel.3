Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB71C2D0A6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LoTwk1VsHW2EJttQL+1VY9z4iXn0HsS9wZms9typK54=; b=GDyAIPHXm78tMm0GJeciFaSDc3
	zf/45vyP4QxksR6Ue6McopPYYaGVRFLyGQMS/0cxWtetMt2sW/VPZYIbX/OBbwO8988bLSa4oY//3
	2rAFLxB1mm4cfh3BeQtonAhCG6fFkRwCe0kMPn969e3E3nerV7Z8M7Zh+42XmhtiK+kXD78jiM+Hp
	RGqgSgoKcB1yaIM6WRu8m2Ms+whOpwFsjSu0zLioBsaNAM7oAeanu0hoBsN+guGq0HPI8FBOalliL
	jRymvQr22DG+Qy19hBX4++3AtZMxrk3rlDLqh3NzYgDhVmiVuEe6ZWz2eWlbkJCbNdBl3SrnXicXy
	kPQNOaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPvz-000000016Zb-2nfZ;
	Thu, 15 Oct 2026 18:12:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPvt-000000016ZF-1fh5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:12:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE7BB14BF;
	Thu, 15 Oct 2026 11:11:56 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B5C613F871;
	Thu, 15 Oct 2026 11:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087920; bh=lb4Rl1o5/3HkWX592DeNjfwpCj6DGSbq0M9PUyV8CwU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tRAQC+9JYeNu1Lo5qLLgcEKcdHvjm4GTZ5y2DaAWJGu/woDL7kSTd6k9SNg2aYzn6
	 CfnYTCtnmvj3aZU49EJJvQzYIUU/eArK3Qoi6EJvSt88b6lSbFLg+RYVzzN3g815fX
	 GOp8Q3Zle06+ptc+0P2G1j1C69YoXxCoNA6Tx8ZM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Bill Roberts <bill.roberts@foss.arm.com>
Subject: Re: [PATCH 0/2] arm64: gcs: Return -EPERM when changes are prevented by locking
Date: Thu, 15 Oct 2026 19:10:36 +0100
Message-ID: <179208783673.159915.17856867908691720090.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
References: <20260910-arm64-gcs-lock-eperm-v1-0-d88e51855c9f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111202_154437_BDBCFAED 
X-CRM114-Status: UNSURE (   9.49  )
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

On Thu, 10 Sep 2026 20:00:39 +0100, Mark Brown wrote:
> When we refuse to change the GCS configuraiton due to locking we
> currently return -EBUSY which is an odd choice.  The only userspace I
> found that relies on this value at present is the kselftest and other
> architectures are using the more obvious -EPERM here let's switch.

Applied to arm64 (for-next/gcs), thanks!

While a minor ABI change, it's pretty harmless. The benfit is eventual
(hopefully) common handling with x86 and risc-v. I did wonder whether to
cc stable but we can always send it separately.

[1/2] arm64: gcs: Return -EPERM not -EBUSY for prctl() locking failures
      https://git.kernel.org/arm64/c/988be99717ae
[2/2] kselftest/arm64: Check for -EPERM not -EBUSY in the locking test
      https://git.kernel.org/arm64/c/8c831e5cd3ad

