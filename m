Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6798CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 18:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b0dUGEDicRVlZe7evAJgy8+O+PhCuLfeiGmumWsTY3Y=; b=XQd2ynjfaQ/3SH
	6OOZc+7Ew9IDnEtq0VNNe4H7ib0aifFhuWL6YQwHaBKwncIYjW2mymySSFlmyVvE0BG5IJytRn9oi
	Xj8QXMZvvojQmEyCEa2z7CfOIRkXySeQjpm4u+hsPblgLeOGQC0g8yjoDz8IGKD58FjVhhFEYa/Ya
	HjTXgYIyQXMGo2sH314H9IBqiUl17zYMzbH/FSeQrL4GjJIWYhIyI4XbM1Ad62vGDxaw8Nr6UeivY
	coef7c+BsiABevhDFrCJbq5gQUzL0R8+7t3OvfaZO6OqpCVH3L9h7f+0uzliQhc5a7rtaCSvuEIHR
	2H5MacHphpwb+s/fhM/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxR-0000000AADb-0q3a;
	Mon, 13 Jul 2026 18:00:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjKxO-0000000AACn-1mRc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 18:00:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4468E1570;
	Mon, 13 Jul 2026 11:00:34 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 524443F7D8;
	Mon, 13 Jul 2026 11:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783965638; bh=eVPlSXGFM3IbaP998uV7x/zfr/eEupXGcPHd5tsKxYs=;
	h=From:Subject:Date:To:Cc:From;
	b=QtyVbW5CwNxCOYUr1FJ6dQ/5CkxBxaEyBA7ZxNOJ+QZKJNMzu/rZDq22CLGYEzk3h
	 jzoEUOoemx2k+1pKEewVztlOTDU3yNnXeHQMz6cQ2v7259YbfldJGJ+Iocwktj4pWD
	 uvc5Z2puaENW+Gq98V1iK1mwklwVIoRKoPrhXLEI=
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] perf cs-etm: Fix bogus branch samples
Date: Mon, 13 Jul 2026 19:00:26 +0100
Message-Id: <20260713-perf_cs_etm_fix_non_taken-v1-0-4561607fc69f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALonVWoC/x2MXQqDMBAGryL73ECiaQNeRcriz5d2KV0lERHEu
 xt8HJiZgzKSIFNbHZSwSZZZC7hHReO31w+MTIWptvXLBteYBSnymBnrn6PsrLPy2v+g5jn4KcT
 QRO9ApV8SinC/u/d5XijQTrxrAAAA
X-Change-ID: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783965636; l=912;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=eVPlSXGFM3IbaP998uV7x/zfr/eEupXGcPHd5tsKxYs=;
 b=QP36DFn6MqmhK04qZo+pyM3SNBnFpub3G1FhEkek2YDWFP66faq1XNyEa281MyM07NZq82V3n
 lQnBRuBaGN6Bd2fGDBC03n4xHizuCvV3k2u8H074aF+r1KvxrgVtt+B
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_110042_614424_BFAD1AA4 
X-CRM114-Status: UNSURE (   7.70  )
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

This series fixes the bogus branch samples in the CoreSight ETM trace.

When an interrupt occurs immediately after an untaken branch, the
decoder incorrectly synthesizes a branch sample for that branch.
The first patch fixes this issue.

The second patch consolidate the branch check so make sure the flush
flow to apply the same check to avoid generate bogus samples.

The series has been verified on Orion6 board.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (2):
      perf cs-etm: Avoid bogus branch samples before async exceptions
      perf cs-etm: Centralize branch sample checks

 tools/perf/util/cs-etm.c | 44 ++++++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 24 deletions(-)
---
base-commit: ef3af1df4f3372bd8ad47619452a283048b3bc8d
change-id: 20260713-perf_cs_etm_fix_non_taken-5b4d7f73f41e

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


