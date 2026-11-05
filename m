Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0890F606A336
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZ85xMI4;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=J6FeY78Q
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IE2EXi4hrSJEGdlIas7SFiNTlxXFjX2s+WzRPhDdqpU=; b=NZ85xMI4KqaJs5
	HoUNNoBr+djJhY8qyde/7v3KL4qNhQLy4vvTQIvGc8NsYH8Y6u2v4SOk8OWU03q3UZ0Rq9ALj3qTW
	QCytR0KiGRib0V6h9QvkqdV00tVHDegm6DseJnVlsB9W0/JKsO+bkwYsOmT/Ki/CJFaTNfxywSkBi
	8PR0oI1keU7Cd3PLLpFhp1ys4SXbrVHu0KNQWeTaWsxSXIqXTTSRfzVtvVtw48LaYbnMauweIriir
	Df5+PQ/9kagax9m6KgzRdCaMCMBC85pLTQezWMazm3hhLbUbbd2psS9PS7sJ4uFmG2SvwqmpthjhG
	/Z2myYsf2BAu95DtJB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHg-00000008qZD-2rp6;
	Thu, 05 Nov 2026 12:09:36 +0000
Received: from mail.thorsis.com ([2003:a:e28:26e4::10])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwHW-00000008qSA-3mK5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:09:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3502C14966AF;
	Thu, 05 Nov 2026 13:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1793880600; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=IE2EXi4hrSJEGdlIas7SFiNTlxXFjX2s+WzRPhDdqpU=;
	b=J6FeY78Q2ba31pSIw6qKhpyrjCakNjNJzkJfrYFrhUxJqjPSv8B1VDnUJv9KC54lLQvbla
	K9FwHqSUC8tlFsJRVUQOM5xp9QFDiJi/NCiewYku358Az/ISg/qFN5nylbheEoxnb/r722
	HY+6/M60GT8th85mMR6zMO5d8GV1whVWi0iBYezTE+TXWzOvUTTPOyFQsylDCThgtBJFyn
	yccaEFII3MkGoT+FYpnkjbElGYaRaMcBPllZ2NNVn4FeefmOC0X+tB50l1YyC8mlTDgUFC
	PQl/fFJj2leHMwTV0WEhVybilgOgXdLAnnEIezT/rsfNXEUjZFBdqUvOQ73csA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 09/16] nvmem: microchip-otpc: Fix swapped 'sleep' and 'timeout' parameters
Date: Thu,  5 Nov 2026 12:06:45 +0100
Message-ID: <20261105110715.2486432-10-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105110715.2486432-1-ada@thorsis.com>
References: <20261105110715.2486432-1-ada@thorsis.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_040927_771002_65A90945 
X-CRM114-Status: GOOD (  12.53  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Makes no sense to have a timeout shorter than the sleep time, it would
run into timeout right after the first sleep already.
While at it, use a more specific macro instead of the generic one, which
does exactly the same, but needs less parameters.

Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
Cc: stable@vger.kernel.org
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v4:
    - Add Reviewed-by tag (thanks Claudiu)
    
    v3:
    - Reorder tags
    - Add stable tag
    
    v2:
    - Add Fixes tag

 drivers/nvmem/microchip-otpc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index e2851c63cc0b4..bf7e5167152cb 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -85,8 +85,8 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
-	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-				 10000, 2000, false, otpc->base + MCHP_OTPC_SR);
+	return readl_relaxed_poll_timeout(otpc->base + MCHP_OTPC_SR, tmp,
+					  !(tmp & MCHP_OTPC_SR_READ), 2000, 10000);
 }
 
 /*
-- 
2.47.3


