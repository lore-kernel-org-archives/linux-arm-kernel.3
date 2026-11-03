Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E263606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 00:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R9r/1DUS;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=Uzfh8B9E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=tn2zR8vINusI2egn9LwHOlQ92sKaYJj4tVl36aYhKxo=; b=R9r/1DUSZJS/9TF66ps2KL6V0L
	E7rN9egkYvCyzJoLKKO9doYvPumEQf/864kAW3hRz58XX/blAx78vBx6g7QUQ15yqo72DxIsXo6s/
	aJcTuSvH3CuQUyl/4UvACld2F3/pM90a6jax/S1XxPifbZ6md+59Vhfq8LvpLVRG+7nkOKpjeARXf
	+nPEEe+iAzcnJj1vwTR3FEa+LbiCnwa/Vlkk8j7xqLPDCcEPmGONEajwvqdwSEqnxzkvH4gc0FRsM
	s1zWxGCjSzWPGUqL3tah86I5GLUZpAPByGdQMh2wU9mySdrJnJBAM2WC2GLmo9cGnEFgrnU7Z90iC
	7wn97P9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2f6-00000000ksp-1ZzY;
	Tue, 03 Nov 2026 00:46:04 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO2f3-00000000kqY-2RKK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 00:46:03 +0000
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 533e14b0e;
	Tue, 3 Nov 2026 08:45:48 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tushar Behera <tushar.behera@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/2] tty: serial: Keep UART driver state until ports are removed
Date: Tue,  3 Nov 2026 08:45:45 +0800
Message-ID: <20261103-cmc-tty-0-f5f5ec0841@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa19ede90a303a1kunm33c27c8011821e
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaT0hNVktNTUxKTU5DTR1OSVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWUtVS1VLVUtZBg
	++
DKIM-Signature: a=rsa-sha256;
	b=Uzfh8B9EEJUGA7VG7PUsaEpxpJqTJmtXkckz0Zl5imQ1aUj6bTHgWvjv4wz/b+u8bt553UXwVIhAKWyzQotBkJ66bl3yo5PtYgSnCbERvRPG8tRq9rjYyECPslHg3yiiIwAkHIp0uII52saa0jqY13VDnvox1ftgzqVf8vTts/Q=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=tn2zR8vINusI2egn9LwHOlQ92sKaYJj4tVl36aYhKxo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_164601_825937_DBD6C8AE 
X-CRM114-Status: UNSURE (   5.96  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Keep shared UART state available until all ports have been removed.
The two independent fixes cover ip22zilog module exit and Samsung
per-port removal.

Prepared with AI assistance and reviewed by the submitter. The affected
objects were build-tested with W=1; configuration details are included
with each patch. No hardware or fault-injection tests were performed.

Guangshuo Li (2):
  tty: serial: ip22zilog: Fix potential NULL dereference on exit
  tty: serial: samsung: Fix potential NULL dereference on removal

 drivers/tty/serial/ip22zilog.c   | 2 +-
 drivers/tty/serial/samsung_tty.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0


