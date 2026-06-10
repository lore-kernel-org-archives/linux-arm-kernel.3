Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F81CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yd4Yh6gPqcszugNB0j0p0NKiIAZkVcFSPhTsWHoF1XI=; b=S672JEKhGVv01gm1YvnL9QmC7q
	/dEM7oDJO7D/atC26ZDPe7Can8C4CYMXmyvNbZapD888OWeIbp8Ayet7KLiB1Wseo2UGLlX0TDGoo
	SvappZ+H4e+4l1fWNic6G0AQbHW82ILCJ894FxOIKG7eFxseBzhKfHUT+Dv6sDKUhvuV2XjBgFCik
	vvuX4YzyUQO6e13pvU/yDWL5q/rlxjMbYAZtZYZOJKHeiEFMqrNvJlWueZFzunubLBcGcZxUHBj0a
	KxQ0A7aAWv3VBIpzDlTWCGLNbc4VarC5QouzlySw5jG53bJzIHf2LeaCgW91+4VXtZRbEw2ee2tyq
	oCyR1ipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGfB-00000007TyR-2cfo;
	Wed, 10 Jun 2026 11:00:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGf8-00000007Twu-2tXy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:00:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 78AB62574;
	Wed, 10 Jun 2026 03:59:50 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BA243FDE2;
	Wed, 10 Jun 2026 03:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781089195; bh=kZgLQyruQ3yGhLzzzMYqMjMSV9w1jivZrkGcTRnQufw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cnJS4avNlwhIggsT3fY5wm0SxpnLPJ0UhI0mwQpkmQKvkiO1mDyhRW6RmxiBp6ueS
	 naXFibO7BqMYazZc9LmVGoHmCZHogckMKEQgKETayen+AAg+PB/rEcS7SitXkNJLx+
	 Be36IdGbVOoCPfPOZNmzRw8DNeiLJBzpPH4HLwiU=
Date: Wed, 10 Jun 2026 11:59:51 +0100
From: Leo Yan <leo.yan@arm.com>
To: "john.song" <john.song@ucloud.cn>
Cc: linux-perf-users <linux-perf-users@vger.kernel.org>,
	acme <acme@kernel.org>, peterz <peterz@infradead.org>,
	namhyung <namhyung@kernel.org>,
	"john.g.garry" <john.g.garry@oracle.com>, will <will@kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] perf: arm64: Replace symlink with actual file for
 syscall_64.tbl
Message-ID: <20260610105951.GU101133@e132581.arm.com>
References: <AHMAuwBaMCb7DmUcFDGOhqrg.1.1781071552750.Hmail.john.song@ucloud.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AHMAuwBaMCb7DmUcFDGOhqrg.1.1781071552750.Hmail.john.song@ucloud.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_035958_766475_3E9B852C 
X-CRM114-Status: UNSURE (   9.66  )
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

On Wed, Jun 10, 2026 at 02:05:52PM +0800, john.song wrote:

[...]

> The file tools/perf/arch/arm64/entry/syscalls/syscall_64.tbl is a
> symbolic link pointing to ../../../../../scripts/syscall.tbl.
> 
> This causes build failures in environments where the source tree is
> copied to a different location, such as RPM buildroots, where relative
> symlinks may become invalid.

What command did you use to copy it to a different location?

Could you confirm whether you can reproduce the issue using
"make perf-tarxz-src-pkg"?

Thanks,
Leo

