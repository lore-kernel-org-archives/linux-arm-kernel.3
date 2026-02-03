Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49817E8B361
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 20:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28HkfFdBhS4RBFZaF+UcsFpc3qv9VcHDTcVjsVWov7M=; b=ahSFUqYIcaHYKAr6kHyppGtoLz
	PTyLmZZTYTVmKjj4m9tNDvhRpzeHfDBGgkT6NkwbWlmOin6qsqzvQbMmAjHKFsVzYpSkqZKGhnMqZ
	QjVhMccDs6Nv2AxknCfeuhJyng1n7xjzrqDkMhyYsb1d4cmWzLZda/luAcPfdQeBuJr6jSIhqo2Kr
	K5/E8zU7MJWE2s7AfbYSMyKqZbQpOJaHsPle5uZaGvAl/bN4otJrA3LDg/V13OQHdRqYx5Ce4AHXa
	z63AGEVbiDU4fevdq43jekQ49RNzEl+Fcmik/BXv+0YY6UG/GieNyT4R4Smnv5gwxGJ7w08duCBQc
	U/TU6Zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1U-00000007KBK-1R0V;
	Tue, 03 Feb 2026 20:29:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnN1R-00000007KAO-1c5j
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 20:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3ED33443CB;
	Tue,  3 Feb 2026 20:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFA6C2BC86;
	Tue,  3 Feb 2026 20:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770150556;
	bh=U+/K7urIBk2+sycXClAu7AwekncaEdBfJhVejPJca4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cD4MhcRoaKZ2GZcRSCzIJlet4Wz6amOIez4XNa1i6FNJAJw3AUQbXfejoddG5oLg2
	 qPYAeAKsoudhNO2/z4P/ZUJSAsdlaBKRxiSCqGCzo4MhATScMIRSz1BU6H/QVsxiAx
	 BD20pm2K9Pn0AZ5tcxj9NcwGCsYAAv5VF5sVAnJfeLcjAQvwcLK7MdZxaeTsSj4wf1
	 3Arm00zVnIzIJ2+PbSpZ7kf+K5iVKaEeXKXYM2QmaKgp2esHDjcVehQO9Qx9JNEsX5
	 sCEvgqNjOSZ2lT5ilQ/fKfzqEjpvsBH3jOFYvIRZk41QeJVoG+cTEuZpqVL7gzSljk
	 V8o8VTaSfxYGg==
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	ilkka@os.amperecomputing.com,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] perf/arm-cmn: Reject unsupported hardware configurations
Date: Tue,  3 Feb 2026 20:29:03 +0000
Message-ID: <177014783384.2669363.15366054878498759959.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <fb6a80013d47936ced4d6398388ed71594d02ee8.1770127120.git.robin.murphy@arm.com>
References: <fb6a80013d47936ced4d6398388ed71594d02ee8.1770127120.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_122917_473191_3DFE00C8 
X-CRM114-Status: GOOD (  11.57  )
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

On Tue, 03 Feb 2026 14:07:29 +0000, Robin Murphy wrote:
> So far we've been fairly lax about accepting both unknown CMN models
> (at least with a warning), and unknown revisions of those which we
> do know, as although things do frequently change between releases,
> typically enough remains the same to be somewhat useful for at least
> some basic bringup checks. However, we also make assumptions of the
> maximum supported sizes and numbers of things in various places, and
> there's no guarantee that something new might not be bigger and lead
> to nasty array overflows. Make sure we only try to run on things that
> actually match our assumptions and so will not risk memory corruption.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] perf/arm-cmn: Reject unsupported hardware configurations
      https://git.kernel.org/arm64/c/36c0de02575c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

