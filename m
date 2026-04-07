Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438AAFF5106
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 15:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hhHpl2USU48nDQvs3bNsViDYJiHXsoUvDixmgaddMg=; b=4SQA1enrvqYk+W7mDOQ6f8QXeO
	9/QL3S1MXGpnUMCzmq8mlFieY4DNyYdYD0rY4sQ5z/pE04Xv6L9bVSJo3f5baFU+tnKQUEpCJqlvH
	zYm+qIjSDtby44Eg1JBogjZP5+T/PNbublQvSqe3j1QebVoTfpwQPJTlTh2IqvbdN4ZC46GZpKiHQ
	rrToFQiHAAW+b/LjEitosu495PaDVx3NokyuVGqiP1LhEpKZrGk6h02JaDgMW74F/0pfgYrI3hq4t
	P26m/+G9rbjxWTKVBSejyMcceLCowQDVvMyOiHwoQocAeig0vseas9YLk7IO6Wz+tPEt31fQF1SZ5
	o6qmwenw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8db-00000006juy-39Ql;
	Tue, 07 Apr 2026 15:46:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8dZ-00000006juS-1Zsd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 15:46:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 742A114BF;
	Tue,  7 Apr 2026 08:46:37 -0700 (PDT)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4A843F7D8;
	Tue,  7 Apr 2026 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775576803; bh=kzrFuta6aAlyM9AC+a86T1/0BzbNjSd+fqW9MS1+b50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DdcSG/CBIn49CNcvnjc3toPLVVbSOVDt954Skq6f0hDXxt8CMSOrIi/28v4Tpu0dz
	 4MbRvrVRRTL0NtjkO98OQiQ3jiagpz/gV4ZVHcQuTI/UrmzqWysILy5fqYFR8RQDkr
	 rpqMu6Pc4J6vJ4oq5QJf869wWmUHayJYYJstIKhM=
Date: Tue, 7 Apr 2026 16:46:40 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>,
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Al Grant <al.grant@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] perf arm_spe: Print remaining IMPDEF event numbers
Message-ID: <20260407154640.GQ356832@e132581.arm.com>
References: <20260407-james-spe-impdef-decode-v2-0-55d3ef997c48@linaro.org>
 <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407-james-spe-impdef-decode-v2-6-55d3ef997c48@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_084645_462732_3BE42FDC 
X-CRM114-Status: UNSURE (   9.97  )
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

On Tue, Apr 07, 2026 at 03:05:20PM +0100, James Clark wrote:
> Any IMPDEF events not printed out from a known core's IMPDEF list or for
> a completely unknown core will still not be shown to the user. Fix this
> by printing the remaining bits as comma separated raw numbers, e.g.
> "IMPDEF:1,2,3,4".
> 
> Suggested-by: Al Grant <al.grant@arm.com>
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>

