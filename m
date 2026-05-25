Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CD3CD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 02:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=; b=jazbX3cjFs8RE/LePzBePKVZ05
	QpIWfPRFSmJGXSOpLsqg5EQvR4Qa+nQyBY9kILfDifWDfcCUXLktNScNy6pfq04mQnCfIUKD2+LJl
	rDqjc2LarMMuIrWAQ9MVM+EdEGS5MhaQ4RDn0bbnFroF3ciXSxgelgSNz6s4xHD52YZYV0SILvG/E
	rBz1vsBDycdv3IrAsAkIlObz7YGaoJWZDJUkCxvndg29zqHQohzvmw49eZ+uJJkMcQnORUgkyIQIk
	+rCWLP3g4QVuI+szbW8KkGQ2aSAE0RL3gvwplHnykpVxQ7pWcpGRRxmru4DdZMlgsws7UczNIssQ1
	Wc5cz0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLLc-0000000G8gR-0CDp;
	Mon, 25 May 2026 02:47:20 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRLLY-0000000G8fp-0p9e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 02:47:17 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-8b3fe2f19a4so99672246d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 19:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779677235; x=1780282035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=;
        b=aW9rHzY3aiV8HVkj3DL0OuTUC0CpfiPkWi1r0xQoTP0bR2Ye/HhEJHwnpLBKLSRvTd
         dxd6iOFY/BWSjbCDTsbzUGL9TSnHQUS8OdW6mQAfP9VEgenAy/dytiHbFwI1OQegdyTG
         aYpx0Qiuu7GJcvnu7HoGh/ROlMS2h8Ca2+olBRI72JIzZVcOHKjoA4T+uaRsDHhSz13d
         fI0g9Piu/ssG790kyuwk3G2VdDs8xqVDstpCi2VjQ66nKezjt6ocHdyuGB5iESb0fwjg
         z7n6XftTn94CLedoCL0VXfT/4RzRyJJQ9bYHip0WP376t2E0E8utG1+MAVW6uexYjj3z
         8gEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779677235; x=1780282035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xaqNcv4CXQk4smv0jZmLI0c3iL1j6I7cH/uwpHLe1Gk=;
        b=DZyowpW6HRYGL8ivr8e3ABHxhN779BRlMJYqEBsSG0h/Eqwv+cbbkE97R/sMIvCaQo
         n8ov4zxDr21S7PAifyAE8LWA+i27Q17VJ3pZuc1u0jgTJ9vhGZsQxIVHdxcO4i5708PX
         t9PLpzzDM2TXS/jgtrWz6tuukpjV/AxSzaL5em+LbwJ9dXV9mFEftlC5+eKSoO1PNxGI
         AOX1wpbDHB8QrKyRoW/Fg5v6GvgvPF3QlA9aI3uDkIDpqX9feq0TtmWNN4xhWJcpytOI
         J74Y98+eST5Z6ZWBLBlMdOwK9b/VLmq+GEQLr+HEUak24vcRLiKTbBxOGToH3lCLSZvM
         nJnw==
X-Gm-Message-State: AOJu0YyUwY7Xv4ADxIkbUWA269o4Z/yi3zRjGx/KpuCQlW9m6ldiJLCf
	2wW5vfDQdSdF/pBs9ynoJkIL0ebS+Bc3Wc2XR/CHU65gZv4RsyOSZvMuKr5tTWWz4w8=
X-Gm-Gg: Acq92OGp+7mv8UV1GlB7EQEithcjR4Ho6+xsurzNEpK443B9T3eqk7HkP/fqJdKsVJz
	fG3L8IldSMG3kSOTIcvNXkutq49o2RWAmsYSE9fjKlRaKHRUthmQUX8MOYgUC+qV/QgcxayP4v2
	tbtWvZFgjv51DNowHSnjbhBQ6dtToO7rzdqetZFMyLgAxYhAsubbQLCplV0kgcFk5sm3VoMr+GR
	4WKYvL3D+yX9SCFUaVZ3UEb7Dj3f1loxz74BprF4xCgwSgM/pff8iWUxyTt0eOdF3Yp1s9+u2Gn
	7HX/NtF8wIptrcvawNKsDwFowS/9MtI2uq3iwEA0gm4jTeUP6I7Dr3O3HnJ02OOpoDdKllISscH
	cWLJgleh2Nk2hEvZNPNqjko668VP3BKN5EbUHPj+luTY+921mBM+afB3cQhTcafPm4r6b9CJw6o
	kylF97bbuA/T5e2j1/qCUQ+nRtc4OqVTzoCGue4WQD
X-Received: by 2002:a05:6214:540e:b0:8b1:f069:3fc9 with SMTP id 6a1803df08f44-8cc7b65a95bmr212981536d6.23.1779677234543;
        Sun, 24 May 2026 19:47:14 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80df081asm97760136d6.18.2026.05.24.19.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 19:47:14 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Dinh Nguyen <dinguyen@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: socfpga: Fix OF node refcount leak in SMP setup
Date: Sun, 24 May 2026 22:47:09 -0400
Message-ID: <20260525024709.1336252-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_194716_272328_2BD84DFA 
X-CRM114-Status: GOOD (  10.82  )
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

socfpga_smp_prepare_cpus() looks up the Cortex-A9 SCU node with
of_find_compatible_node(), which returns a node reference that must be
released with of_node_put().

The function maps the SCU registers and then returns without dropping
that reference, leaking the node on both the success path and the
of_iomap() failure path.

Drop the reference once the mapping attempt is complete. The returned
MMIO mapping does not depend on keeping the device node reference held.

Fixes: 122694a0c712 ("ARM: socfpga: use of_iomap to map the SCU")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-socfpga/platsmp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-socfpga/platsmp.c b/arch/arm/mach-socfpga/platsmp.c
index 201191cf68f3..349e6c54518e 100644
--- a/arch/arm/mach-socfpga/platsmp.c
+++ b/arch/arm/mach-socfpga/platsmp.c
@@ -78,6 +78,7 @@ static void __init socfpga_smp_prepare_cpus(unsigned int max_cpus)
 	}
 
 	socfpga_scu_base_addr = of_iomap(np, 0);
+	of_node_put(np);
 	if (!socfpga_scu_base_addr)
 		return;
 	scu_enable(socfpga_scu_base_addr);
-- 
2.43.0


