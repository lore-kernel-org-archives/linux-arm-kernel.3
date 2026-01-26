Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227C9C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 03:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7CWfXsj803L/F0YgUgGR75n6iaf/Odl6c64TnbCJgP0=; b=EWqrvMLQsgFp35uEIzkBF/nG4Y
	j4CurGCzw19LvHggBCBWFblu201PvpNF8GSoNsBBMVAhVghV7xjkB/e7UFFQH4qiWNzWERfjkYiez
	vxjL7xNL2WJXS/sQF5P122kowjr3kjpDKmxnMOLH53c8Uly+TvG6hZj7Twu25xWMhMUTW4Z0QvFjZ
	fmUm65jCEOVnVjCcutwcNdyNBmJ/RrvINMJT0dStLsvcmW0PItGD3r1FysbmX2KM4zrsxJFc9sHBq
	KGJh3qcwyV3T/Y4pSrl7JDTlX4fNaU1F4WEGJBFlcYhMPLGocWKGhiFNsH2SPFZNCJnqCbSbaWoZJ
	R/Tnfmhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDKV-0000000BqKm-1Mw2;
	Mon, 26 Jan 2026 03:31:55 +0000
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkDKM-0000000BqJ7-1T4m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 03:31:49 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
	by SHSQR01.spreadtrum.com with ESMTP id 60Q3UVTc017067;
	Mon, 26 Jan 2026 11:30:31 +0800 (+08)
	(envelope-from baisheng.gao@unisoc.com)
Received: from SHDLP.spreadtrum.com (zeshmbx08.spreadtrum.com [10.29.3.106])
	by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dzv6H1Xqbz2P3QY0;
	Mon, 26 Jan 2026 11:24:39 +0800 (CST)
Received: from BJ15137PCW.spreadtrum.com (10.0.73.52) by
 zeshmbx08.spreadtrum.com (10.29.3.106) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Mon, 26 Jan 2026 11:30:29 +0800
From: Baisheng Gao <baisheng.gao@unisoc.com>
To: Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
        Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <cixi.geng@linux.dev>, <hao_hao.wang@unisoc.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: [PATCH 0/2] Support clock domains without a PMU instance
Date: Mon, 26 Jan 2026 11:30:27 +0800
Message-ID: <20260126033029.7923-1-baisheng.gao@unisoc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.73.52]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 zeshmbx08.spreadtrum.com (10.29.3.106)
X-MAIL: SHSQR01.spreadtrum.com 60Q3UVTc017067
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
	s=default; t=1769398244;
	bh=7CWfXsj803L/F0YgUgGR75n6iaf/Odl6c64TnbCJgP0=;
	h=From:To:CC:Subject:Date;
	b=t1/7o/GdKxDOZ3rDh0XOmevEt7lSKOW/EgXYxk+aZBK3+l+uDG6FUjywPpLQIvaGN
	 kOfDjz8AUWbAAZM4bX0bgoUSIjGzTWinE1u9gXtjIUh4b7pxlMvsv3HDG7C+4yds0m
	 R+QVXfrqT6AtYBYsoVYwaJuI3YXZebkDEz2EiSWtxU+c/EI8FmBNK73wZxa8UTQdpM
	 ttpGohXo77QMKKtHNr2DJuelRQbO6rzXzhhpEFdypDgAn7t4MRhFk5OWaxxx3oJGKc
	 y1OwnpqS6Gm6H6aTC0PG1Q7Vmaaq/lMfVWjrZihFyr0q+gvJ2PGNyZxs9gzEoFjym2
	 VMp6xcXCZMmGw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_193148_118970_835EB217 
X-CRM114-Status: UNSURE (   7.82  )
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

In a system, it is possible that there isn't a PMU instance in some
clock domains. The original driver will crash because of the pmusela
pointer being NULL in this condition. This series fix it.

Baisheng Gao (2):
  perf/arm-ni: Don't crash in probing clock domains without a PMU
    instance
  dt-bindings/perf: Drop irqs for clock domains without a PMU instance

 Documentation/devicetree/bindings/perf/arm,ni.yaml | 3 ++-
 drivers/perf/arm-ni.c                              | 8 +++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

Signed-off-by: Baisheng Gao <baisheng.gao@unisoc.com>
-- 
2.34.1


