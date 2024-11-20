Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BC6D44171
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mt8ZpPTCEjQLw1Lcr80wunS7fyZ1giSpVz5ttodzetE=; b=RZENl+BR8xLg72AU7Dvi7TWA+3
	E5z177RcGxmv9/dDZQiJSUJRGemafM8/7tkpHUge0DNEy+K1isFYDRkzaH53hr31w5NKewYTm7KgM
	aUWPTOE2kvm3SIwcTPdT/wwrMpba/tGa/z7e31ODzbiL+Fj68ExU1VgS0RuBjPZQOC53wxHq0j4cg
	aD0ufWjUA65Gr5k6DPNeg85CcbvqRoNI9C9g2wqqxU8GOJUSV1exNpTotnjlvYSQfe/oPVg15qaas
	jeZo+HbKPxZsxrAh+SA7hM1ZFRDtJcJ2q2SJKiAOW7ml74Njq4t1sKpT6R4UoBs6VOF7P5RJn27yB
	VjotEXQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhVY-0000000Ezay-0RNv;
	Wed, 20 Nov 2024 10:00:24 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhQL-0000000EyWc-37Ii
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:55:03 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by xavier.telenet-ops.be with cmsmtp
	id exuu2D00R3gUftr01xuurF; Wed, 20 Nov 2024 10:54:55 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhPr-007biR-9f;
	Wed, 20 Nov 2024 10:54:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhQE-003eLT-Ix;
	Wed, 20 Nov 2024 10:54:54 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Russell King <linux@armlinux.org.uk>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: smp: Fix IPI alignment in /proc/interrupts
Date: Wed, 20 Nov 2024 10:54:53 +0100
Message-Id: <96f61cafee969c59796ac06c1410195fa0f1ba0b.1732096154.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_015501_929234_100C8C49 
X-CRM114-Status: GOOD (  10.64  )
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

On a system with less than 1000 interrupts, prec = 3, causing a
misalignment for the IPI interrupts.  E.g. on Koelsch (R-Car M2-W):

    200:          0          0  gpio-rcar   6 Edge      SW36
    IPI0:          0          0  CPU wakeup interrupts
    IPI1:          0          0  Timer broadcast interrupts
    IPI2:       1701       2844  Rescheduling interrupts
    IPI3:      10338      21181  Function call interrupts
    IPI4:          0          0  CPU stop interrupts
    IPI5:        651        825  IRQ work interrupts
    IPI6:          0          0  completion interrupts
    Err:          0

Fix this by adopting the same solution as used on arm64.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/kernel/smp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index 3431c0553f45cdf5..50999886a8b5cbab 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -551,7 +551,8 @@ void show_ipi_list(struct seq_file *p, int prec)
 		if (!ipi_desc[i])
 			continue;
 
-		seq_printf(p, "%*s%u: ", prec - 1, "IPI", i);
+		seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
+			   prec >= 4 ? " " : "");
 
 		for_each_online_cpu(cpu)
 			seq_printf(p, "%10u ", irq_desc_kstat_cpu(ipi_desc[i], cpu));
-- 
2.34.1


