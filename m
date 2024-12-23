Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E782DE7718D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/yYlTY1h60+eDbacZ/IFWvjlIcZ8e1yvoXwzqIk899E=; b=NJNt+7ceeNynfbyo3oZ7wc5daW
	hqdJAOOtZKHOhbp8TCPfpwdZ8L2tANzj7mXBlJE6ZKOPKO4GAvfRhaDN0q4UwX36ZOsyqsg0hAWAW
	32DS7sWS2BGYakac26lxoMdTGBXG0LH9JNFcf9XCZNnfo2vs4FkXGyYmNWBGxcMMq3zYQvDEAX8Ru
	H3i0PKlrHtYrcv5t4tdE/XrAT2eiQ758Wz8VSeN21pOa5vkm+Xo1RNav28C4ZlQX046lFxD58XGXl
	B9SC7q1RzBquXKe3MwWN6R7nrOc/TC3pQs398KpUeirgoMzkVEed781e86HhPz5CA33nf6j3kkfWg
	4MyiK+DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPiwp-0000000A6F7-2Y9H;
	Mon, 23 Dec 2024 13:58:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPivf-0000000A65u-17Wo
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Dec 2024 13:57:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=/yYlTY1h60+eDbacZ/IFWvjlIcZ8e1yvoXwzqIk899E=; b=qF3Ga6+fXhVWtFG/UYY5YsOYnA
	XFCooFIeqxSabQAtSfZyru9dTBdFF1mObY14IQhkTM2CsEz5pANTeZ4N2FtVYleK3g8SJuu9iiVOi
	6Bd+R/1mfF/j1bzE5GxWiV90qSAe03qq8ROFQHff65OKyM3Ssa90Y/GCEgv7KY9pLogWO8XZ+dCxw
	zK0RQZTqsdQI0sU1ueKt3Sd3rAyIOl6R7oRh1vKFeF43KbAC0cnL6G7eOMDzapL4U+cuEkpOQlzpQ
	yMQxf0sJNPlzSpvdVZ0cLLWtuSxuJMoAc2VRzfTJCl9UMN8WVyHpW7d7LkbRUOI4h7t6Jex6J+4l5
	5FwIWTeQ==;
Received: from server.wki.vra.mybluehostin.me ([162.240.238.73])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPivb-00000006My3-3OPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 13:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject
	:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/yYlTY1h60+eDbacZ/IFWvjlIcZ8e1yvoXwzqIk899E=; b=BaLZzQh72FPt7mg533SAM/u2xT
	LXXoMoFltbjpSZEJ9WqlkLCvRap5dyG5BadvXhfS15zNmHrDUTuuGeY/LunKiJ6PqmrKbfsqK2QbT
	d9ElENfXlCzBgPhK9RmKjyy9mCjj614T13XfEyIctVBEZ0f4vSAebqPKDuLFWHoghyAZA8JYzhZ7F
	DcjKSXVGFO306G1/7rd1s2kcb0kS2q8QKKXObT0bKzGmw9JO+hESfpdKF6ZcH3MVPmWZEjuHoqWRo
	ZeZtdo3pxIXFLzPfDfJoZ/6b4wY0qF7GAbBoQ0cg60aq82Tcbl2i1rhzP3rLtlesjswSPYPUCUF0a
	WZYAsvog==;
Received: from [122.175.9.182] (port=33050 helo=cypher.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpa (Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tPiup-00047K-24;
	Mon, 23 Dec 2024 19:26:12 +0530
From: Basharath Hussain Khaja <basharath@couthit.com>
To: nm@ti.com,
	ssantosh@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	prajith@ti.com,
	vigneshr@ti.com,
	danishanwar@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	afd@ti.com,
	krishna@couthit.com,
	pmohan@couthit.com,
	mohan@couthit.com,
	parvathi@couthit.com,
	Basharath Hussain Khaja <basharath@couthit.com>
Subject: [PATCH 0/1] Add AM57xx Support to PRUSS driver
Date: Mon, 23 Dec 2024 19:25:49 +0530
Message-Id: <20241223135550.6898-1-basharath@couthit.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: basharath@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: basharath@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_135700_444486_6F3A3C46 
X-CRM114-Status: UNSURE (   4.85  )
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

Hi,

This patch adds support for AM57xx SOC compatibility in the PRUSS driver
which is a prerequisite for ICSSM Ethernet driver.

I will submit the patch series of ICSSM Ethernet driver for AM57xx
subsequently in a separate thread after the merge of this patch.

Thanks & Best Regards,
Basharath

Roger Quadros (1):
  soc: ti: PRUSS OCP configuration

 drivers/soc/ti/pruss.c       | 77 +++++++++++++++++++++++++++++++++++-
 include/linux/pruss_driver.h |  6 +++
 2 files changed, 82 insertions(+), 1 deletion(-)

-- 
2.34.1


