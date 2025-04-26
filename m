Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1763FC369D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 06:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tIyeZ4J0ITuIfGNBEjwEzxbhDS+oF6WcKAJBTAprjgI=; b=YnBUtXBaOZHAuwLif9WYkBwjFV
	jAB65TZv+HweFTYh+Qk0G2CYNSt/X1Oll/0SJ09uQxWtQm4Bn+mOmkVBUIgOic5vp40LfCuB58lFI
	kwACcSlj/uZ7cny3DKxoXJz0gSFKJxYhw+KkDn2pTeSpn4zEk/A2J/EtxWCH4qqQby1QNNPc4WUU6
	1tT92anCm73JPeRKkWKnN1TW9OB+n1OSZUXOxlnXMIEx1i60JGHhZHsCkD8Eb+vdd5ezL1lYprp8v
	aKjE8ucLwOhDfHW/SI5f8eIR2aXEyKLYEaTE2Epdvg18BfOrWG8HGaH7NCRtPy6gUfShzRjr9u8/d
	NW27LFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8ZKa-00000001aNq-3Kcf;
	Sat, 26 Apr 2025 06:48:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Yu6-00000001XlW-0jUR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 06:20:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B5D4A3F4;
	Sat, 26 Apr 2025 06:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553F2C4CEE2;
	Sat, 26 Apr 2025 06:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745648445;
	bh=EuZdc4J+N9m/JbbBsyBVqTEk6tsczDB+aFkCtyPfgrg=;
	h=From:To:Cc:Subject:Date:From;
	b=J0CKb8GhCyu89m8WLk6wgl8fGUla0vi9Pe2HOsorNfOjSAM5L4kLv1Q3YXYknTFbp
	 FuoUq+2gNoShdMjnPjkLgKTaxMp6wmoyzM0xUwQGeJ+UrGR9v57r4pO19kQwyI0vMB
	 n9rGm/xINtg9G32RPmFNsKpzB2Ad8QESzzIbxiOA47OwNf11o6lN5P83wQIbrPcTeg
	 o+Sv2Jyy6APE/QqvueAqvkzynle5Y/nmSskgrWgJDGq8edIj1TJLSXG4KJh0iffQ+l
	 UDgsrDgM/Dotxtt3dHg0kSfd6+P0mDtmAhqTk3itKXQIxSZovAbj3Q6Bz80PL8wPih
	 m3xUeCtmY0aWA==
From: Kees Cook <kees@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kees Cook <kees@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Camelia Groza <camelia.groza@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] soc: fsl: qbman: Remove const from portal->cgrs allocation type
Date: Fri, 25 Apr 2025 23:20:41 -0700
Message-Id: <20250426062040.work.047-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=kees@kernel.org; h=from:subject:message-id; bh=EuZdc4J+N9m/JbbBsyBVqTEk6tsczDB+aFkCtyPfgrg=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk81ZZf9c6mN37K3TlZ8NlKx19Hu/4zST1oeHL4eaOol 9vC7k79jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIkcD2RkeHJ+ypGWe59nP5wo FDX9f2tg8tH/+yL5I6/UOM/7PS33dSnDP0XbhDsLHsx+rCsgm1F1sj7zepPEE/sTk7rtb7hJvly 7gR8A
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_232046_228960_43DE8D51 
X-CRM114-Status: GOOD (  12.30  )
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

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct qman_cgrs *", but the returned type,
while technically matching, is const qualified. As there is no general
way to remove const qualifiers, adjust the allocation type to match
the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sean Anderson <sean.anderson@linux.dev>
Cc: Camelia Groza <camelia.groza@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 drivers/soc/fsl/qbman/qman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 4dc8aba33d9b..9be240999f87 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1270,7 +1270,7 @@ static int qman_create_portal(struct qman_portal *portal,
 	qm_dqrr_set_ithresh(p, QMAN_PIRQ_DQRR_ITHRESH);
 	qm_mr_set_ithresh(p, QMAN_PIRQ_MR_ITHRESH);
 	qm_out(p, QM_REG_ITPR, QMAN_PIRQ_IPERIOD);
-	portal->cgrs = kmalloc_array(2, sizeof(*cgrs), GFP_KERNEL);
+	portal->cgrs = kmalloc_array(2, sizeof(*portal->cgrs), GFP_KERNEL);
 	if (!portal->cgrs)
 		goto fail_cgrs;
 	/* initial snapshot is no-depletion */
-- 
2.34.1


