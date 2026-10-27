Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FE1606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q1Y3Pm7H;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=k8J0oqQF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j3uekEY2Aa558ZNY0plFmomMgJqeUtgIz6Y+icq0YUA=; b=q1Y3Pm7HMkuAwaws1UP+C2mpTc
	20enkvlC5E+tmMDvmTbD2mMnSJuBkYzPCgc4Y0eakEGXx222ObZKZCLDbWdgZGmdQv6braJO2K9gL
	pN36EMnEi9YGtc2nDhuZDBPvXWEnUqADmYXKHPJ0dV+twwr+0cVrlEgcP+JGUaxvB9ZXGy2xw2efC
	ut+DFSBamjiwiFLXy2G4GoTIZ+zonA8dWme7k0P0Y6zv5QQha2ZD4jq2xdUlG9EuryixRMp8/VDbP
	q45ejJZeiJRNwXINBS12ocvtes1SBzkoQPm2VrOn0hPBuuQXwiU2WhaUu9v9CRpV4wlhI6XCEfwba
	tmBJtuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLite-000000058eV-01iX;
	Tue, 27 Oct 2026 15:15:30 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLitb-000000058do-01lX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 15:15:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j3
	uekEY2Aa558ZNY0plFmomMgJqeUtgIz6Y+icq0YUA=; b=k8J0oqQFfqW2DVsOX3
	0ZCIieVu4V+H0U5CkqrnwSt4Tk2Y+MZeFhFtUCRFPAk+OwXilBw+HhW/KoAxF9nR
	3ySy11Xv3ezhyPwdQdJ+JuqPGCQscHpfOvjLlcPI22CeawxfBscZM+vvmPpuLg5C
	PQriJHexo0ZrZ4qa4LCFUqEdg=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD3v9P0v+Bq5nDACw--.64470S2;
	Tue, 27 Oct 2026 23:15:02 +0800 (CST)
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
Subject: [PATCH] [v2] coresight: funnel: inport schedule by priority can not take work
Date: Tue, 27 Oct 2026 23:14:56 +0800
Message-ID: <20261027151457.5713-1-xuchao066@163.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3v9P0v+Bq5nDACw--.64470S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF13Gw18XFy3uF4DtF1DJrb_yoW8Gr1rpF
	WDK3y5uFyFgrW8Aw47JF4kuF1UJa9avayIqFyrKw48WF1jvF95uF48Kr1ktFnagFW8Gr1f
	Krs3AryIgFyUWaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pimsU_UUUUU=
X-CM-SenderInfo: x0xfxtbrqwlqqrwthudrp/xtbC6BYARmrgv-YLygAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_081527_554604_E1298B96 
X-CRM114-Status: GOOD (  10.72  )
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

The CoreSight SoC-600 TRM, section 10.11.2, PRIORITYCONTROL, a funnel
rejects priority register writes whenever any port is enabled. The
current sequence therefore prevent the configured priorities from
taking effect. Write the priority register before enabling the
first port.

Signed-off-by: Chao Xu <xuchao066@163.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..500ff72a83c8 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -62,13 +62,15 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 		rc = coresight_claim_device_unlocked(csdev);
 		if (rc)
 			goto done;
+
+		/* Update priorities while all ports are disabled */
+		writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
 	}
 
 	functl &= ~FUNNEL_HOLDTIME_MASK;
 	functl |= FUNNEL_HOLDTIME;
 	functl |= (1 << port);
 	writel_relaxed(functl, drvdata->base + FUNNEL_FUNCTL);
-	writel_relaxed(drvdata->priority, drvdata->base + FUNNEL_PRICTL);
 done:
 	CS_LOCK(drvdata->base);
 	return rc;
-- 
2.43.0


