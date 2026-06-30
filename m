Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31796C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HQeN+PJMJE2st1gahZhSLfLrLJphN3V9P8L8KD2KeU4=; b=nV+OhafXazLftogiFF/oZPJYOu
	80HrHAt5I3yVG6Kz9/ZQ6dmVjVK+e2ReEQ1SZINqB1dIOt0BHHgKbXWSw9bgyOlDF16jhTobRv3SZ
	K1FyO8gpiCanraL6yyLw6JVrHdSaoObfKLkY3MoxUCuSGwywSCOOlSNevvn2WA+kKebtTOdT66cRV
	7bT34nwFgg5wXgo/EKeQBli/GtBbn6rIS1w5Mipj4WChtymIq8HM0AKp+07ByeLb4g06Nf3mXIhKh
	s3QGCTU4sfhfwXIY5fqMW9PMkn+4UfL75lyFxyf7qS3Tlv4EjCI/zpFUg8TblB7W1YIGl7GBCuxMy
	82zyzmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFG-0000000HM2T-2A7X;
	Tue, 30 Jun 2026 15:19:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weaFE-0000000HM1l-2nro
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 15:19:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 30AAD2F27;
	Tue, 30 Jun 2026 08:19:23 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A9483F66F;
	Tue, 30 Jun 2026 08:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782832767; bh=K41LEd5qH/cATpPD8eHKSd94+tZhXjpUOWaoghGYl7o=;
	h=From:To:Cc:Subject:Date:From;
	b=S4FtgDc6QOE1fCJmvgeSY5h1LWdCE99eO2nMaf5bs2zdhHP+jJ98euTEenvy4/K0b
	 jzti2LnyTWFa/2TZWNoem5w2QA59WfUWR8jN7UNDFp/QlUtr/tvJp5DVYfz6EJa94M
	 fuEkI/EbIj9VsoOocPRu7iM2Xj4RhFC4zsdj8i5o=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	ilkka@os.amperecomputing.com
Subject: [PATCH 0/5] perf/arm-cmn: Support CMN S3 r2
Date: Tue, 30 Jun 2026 16:19:15 +0100
Message-ID: <cover.1782830759.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_081928_742315_F10E556C 
X-CRM114-Status: UNSURE (   6.15  )
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

Another year, another CMN - although arguably this was last year's
CMN, and is still the same in name as the year before that, but in
implementation the newer releases have significantly updated the HN-S
PMU features, pushing the previous filtering abstraction beyond its
breaking point. As before I've tried to break the refactoring and
functional changes up into reasonably logical chunks so there's some
vague hope of anyone being able to review it...

Cheers,
Robin.


Robin Murphy (5):
  perf/arm-cmn: Rename filter variables for clarity
  perf/arm-cmn: Refactor event filter programming
  perf/arm-cmn: Refactor event filter data
  perf/arm-cmn: Add new filters
  perf/arm-cmn: Support CMN S3 r2

 drivers/perf/arm-cmn.c | 490 +++++++++++++++++++++++++++++------------
 1 file changed, 347 insertions(+), 143 deletions(-)

-- 
2.54.0.dirty


