Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC481C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LtswBt7fJGC2FH5TZPj10ctxD5pusGyaaIL4I2LRB/E=; b=w+Z5jLTR+L/4XSc5m7/HOtTYWA
	P6XvU5T0yKCCeWbZ0giZ84S3E48L3DDKfk9tycSan5gnn/KZYYw8kZUw6aublMxJLYpZ8QEvONOb5
	S0vDjG7h2fbc6bFjXpSnkH8JE2t4XqP6VbIkS4dCyUiNkn+fdbsNk/gd01AbItFO2xXu5C2U7lNZh
	QMIhPDDU6WTsDxslDHa4uAU5Tyzs71ZRyCEVBdvtcKXzcb3H8+ScrJSj4+0Ft/P6rbYNuRNIiVRfl
	VY0k/lhRyAJwqfrpPzaUsuaJXsLBzNfcqIkNexg54N8r/FLSTly0k50mpT9426PUbGhtNsUgf+onX
	kdPXzosQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSYd-00000009d8a-0EMO;
	Sun, 05 Jul 2026 19:31:15 +0000
Received: from confino.investici.org ([93.190.126.19])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSYa-00000009d7Z-3zDJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grrlz.net;
	s=stigmate; t=1783279417;
	bh=LtswBt7fJGC2FH5TZPj10ctxD5pusGyaaIL4I2LRB/E=;
	h=From:To:Cc:Subject:Date:From;
	b=ZYR4s1VgG1pUmvU7WuDOYpNNxOuPBHlnlLlVC7ItyPso51nVigd1h/e68gM1lQNKe
	 8l3kl7E8OeKhR9C/Xd7mzJiwi+PIz5dLnrxxEOj2aDXHR7i4NK4ys6qgGckolokw2B
	 CGpqFdrWaD7h0AtNdXfmur5+tt0Wf57T7gvsRwE8=
Received: from mx1.investici.org (unknown [127.0.0.1])
	by confino.investici.org (Postfix) with ESMTP id 4gtcpx42RVz10wr;
	Sun, 05 Jul 2026 19:23:37 +0000 (UTC)
Received: by mx1.investici.org (Postfix) id 4gtcpw5p3wz10wg;
	Sun, 05 Jul 2026 19:23:36 +0000 (UTC)
From: Bradley Morgan <include@grrlz.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bradley Morgan <include@grrlz.net>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] arm64: sleep: two small compute_mpidr_hash cleanups
Date: Sun,  5 Jul 2026 19:23:29 +0000
Message-ID: <20260705192331.23150-1-include@grrlz.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_123113_142792_61A2DC37 
X-CRM114-Status: UNSURE (   7.17  )
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

compute_mpidr_hash silently produces a wrong hash if its register
arguments overlap. Patch 1 turns that documented constraint into a
build time error. Patch 2 factors the MPIDR hash slot lookup, open
coded twice in the suspend and resume paths, into a shared macro so
both callers stay in sync. No functional change intended.

Bradley Morgan (2):
  arm64: sleep: assert compute_mpidr_hash registers are distinct
  arm64: sleep: dedup the sleep_save_stash slot lookup

 arch/arm64/kernel/sleep.S | 69 +++++++++++++++++++++++++--------------
 1 file changed, 44 insertions(+), 25 deletions(-)

-- 
2.53.0


