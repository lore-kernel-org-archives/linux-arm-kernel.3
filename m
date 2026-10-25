Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04C6606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 13:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4iAdMbUA;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Gkcc0+0j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UBJSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=; b=4iAdMbUAOrv93XrLrkCopRwAGj
	K8K+QgwXtjhSUrqqnOQuLwV2zvpvMtNDaHd78j4XHED7iqan+hCj2VR0PtW67p/C+3tMjkGXtMdrb
	bHMP3ktckRwyhYa/sdmFUp5wfrG4lFVSwwfwik8cItg2qmMDrxh2NiaS1IK5moFBrJ1bPnzSZ6TqG
	m4Ha79fgOtVAHTQg7FjVejTbYLDcAq6T/TWSyg+JRJG2P9wBuKophF4qqkn4YXnZW3OfOA9orRwX7
	UgQq5lPm+/M1XEiQvke744nCh6bGNADYX86SUxMV5SdqYaqa4VE+4Rw5hOGbTE5U34E0EISmRe5aO
	2zZS8DPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKy2d-000000014fi-2iKq;
	Sun, 25 Oct 2026 13:13:39 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKy2a-000000014fH-48BZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 13:13:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=UB
	JSZai6LZJEAj8Sv5FqK9/FGZO5CCFa8xGQXFFlEMo=; b=Gkcc0+0jNn1bOGfEvl
	MKguBtSwqxL+Wgj+JhX6Ak+OGI0JD3/D5J3xDCmT1b/UzxUxFtbP9oyanFmrE5XY
	cwJjY39NZvIJJKkj3udSj7NtIz1xPHU73gQcONOYjCwupADsaL4tA4NG2u1XM+2P
	qoBk0qM5yOuJjdYqa62QQ6Tjg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD339ZmAN5qYEOtCQ--.15842S2;
	Sun, 25 Oct 2026 21:13:12 +0800 (CST)
From: Chao Xu <xuchao066@163.com>
To: suzuki.poulose@arm.com,
	mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	alexander.shishkin@linux.intel.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chao Xu <xuchao066@163.com>
Subject: [PATCH] [v1] coresight: funnel: inport schedule by priority can not take work
Date: Sun, 25 Oct 2026 21:13:07 +0800
Message-ID: <20261025131308.7158-1-xuchao066@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD339ZmAN5qYEOtCQ--.15842S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw4xJw13Zr1fJr47uF1UAwb_yoWkXwb_ur
	1vgFyfZ34kWa17K3WDGw1rGFyDt39I9Fs8ZayvgrWFkrnrAw43Grs5J3yDAan3urW8XFyk
	GF9rXFsYvr10yjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRM89NUUUUUU==
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC5whssmreAGj-MQAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_061337_512749_287EB0BF 
X-CRM114-Status: GOOD (  10.22  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Before enable funnel, priority must be set. Changing the port
priorities in real time is not supported. If the priority control
register is written when one or more of ports are enable, then
the write is silently rejected.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index af40814ce560..17f985798d7f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -66,8 +66,8 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 	functl &= ~FUNNEL_HOLDTIME_MASK;
 	functl |= FUNNEL_HOLDTIME;
 	functl |= (1 << port);
-	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
 	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
+	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
 done:
 	CS_LOCK(drvdata->base);
 	return rc;
-- 
2.43.0


