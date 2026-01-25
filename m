Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36D0E63CAD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Jan 2026 16:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4QXeB6zwbx4LtfMB4zrORe7xk1TX2l1PUwpUMiw49k=; b=bgpg2sHw6bzQoepi35SJ8xtYsS
	sWwmHU3tLjR5aL3ECCrkFiMLu9lU/5YcJW6ogP0Oe92S84B6DgvTB9XbcqmPdNvIeAJBw4LbChQpq
	jlU9r9Q05Ryl+eIc0Ci6C7VNs4fv6Z7qqI1gtaN37t0JCdlHRyiYCVHCSnYx3c6JAO9NAggO1wxKe
	EF/JiFTp5VI+H406+9imNN4N/UKnPaPF/F+Ocr9JGQ9ZoTVYdhcbUAh4iMcUNudVICgFHYFO5Pxws
	hsA03hrDt4kkmAzxOGkg9p5Lkz8K8U7ud4rtTtpxWNmD7pMzZFAwEtQmARCVDfsaxh7ltwG5rU4Pq
	iv8DVjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BO-0000000BKMN-0Uv0;
	Sun, 25 Jan 2026 16:41:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk3BL-0000000BKKI-2Gkr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Jan 2026 16:41:48 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a7bced39cfso42743315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 08:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769359307; x=1769964107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4QXeB6zwbx4LtfMB4zrORe7xk1TX2l1PUwpUMiw49k=;
        b=ZMxrG1CXgIjqzJNmWwYrvZQmcGt4TVuVY/zT5U0jllK1SwVDxr8PvzAKQ23BR4TrI2
         5fuXZzYVIbWP85gcjgs+v5K8aRx58LnBIRxjbjSqYayLkDVEweFMDqdHCbGstm5vJgt7
         PlqSoYGNqwimI4hEUnGDfKEYnUq8Ovwolrd8aZtfKH2J7u1HeL55E1JexRQE76ti2HTx
         91zTQgesKjgV0zR0ie9+XMD0q1+bS2zPl4Hg6Ik1U4+H/5JfVQCVAF9ktVJBkdirAJyr
         WpiC+QSbv7VTV6VdegQJibTQf8xvRThVJm9Ygp6RhtPupAZRqZ4AbAyIxtma8ZF0vNQo
         HN6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769359307; x=1769964107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M4QXeB6zwbx4LtfMB4zrORe7xk1TX2l1PUwpUMiw49k=;
        b=EvMO9D3QwcfHWM7JGS4v32TJNucKVpkzgOP9uemNdwq4w2yzz4T7u+L9h0xhyRUKee
         Jqg94ytbBKfzp7Ui5ZrBPUoh60mnDVj8bMsUDgMR+AlFzZsnyYZ4kfWLYSQRVRC03291
         eNPMgHiwKAxcXxmT2ENmWuSmy4//PhyuMUWcZur/eWQDTJS0ibOf/0ptE2VtMaD1Dapm
         vHcqUUMKdyOwLelpFHPAwwrLWnyaGKe76wka4AncEmL44OyRtjJT/hUZkR809wk+dAJ9
         4Gxk5Gx7n5FEgXUsUbZhFZL/apajoFS14GZfF8XxLFJ4ipqLxLpM+Dh+JY3/o2t89I7f
         999w==
X-Gm-Message-State: AOJu0YwDMvpHNjPY9+3BAY2eUWMqZo2IZSNSYsoDtvYwRKyrkxemNgpe
	tCFIwZGBV6AGXwNu10FsbAYu3x3D6bvpMTFSGRgq+26ctOisj3cU81gv
X-Gm-Gg: AZuq6aIbdqIXP/KN6k6fWCl8XkKJjd+nHX7tVjtcpPni+CmUbtf8kHhpVj7dXWS4WJ5
	/FolMwJTkpedW+79RGyQ2rE4W7yC4RLxfA+ec25KjhFDXBf+9DX2ZtSE88fzAwP2FLQpjuu66Wx
	+grN2ceAHQdY4WNyagDfHjcQghl+fvUFfv5DXM2KnO4BD6j6TK8kHDCSSrzjWimDnD+ZhVmvf4/
	NoV6Mp0o9k6kDElhcknnyIFm2TLHZD6BpGUvWXWuoZl8RU/bCQTSPqMHuTeV1FjSWFilWpR/sv+
	prVs+KfKeK740osxiZJCta6krlgRUOy0fmAMJqZmYLBOm51j+T+ZfqsfVCqqVK3ePElHErXZrFk
	l1dJs2fxXRjtHz9so6/dAKo2Yaek1CJlyNNSiaOHdMjhoceCucAGMmiVZI+0r1FmP0VGajhMRT8
	95tXO3BeaRrdR3ruzqUecauaY/ZCxwQ0g=
X-Received: by 2002:a17:902:ef0a:b0:2a7:3db0:6e1d with SMTP id d9443c01a7336-2a8451f930emr17136905ad.9.1769359306643;
        Sun, 25 Jan 2026 08:41:46 -0800 (PST)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f97667sm70633225ad.56.2026.01.25.08.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 08:41:46 -0800 (PST)
From: Xie Yuanbin <qq570070308@gmail.com>
To: linux@armlinux.org.uk,
	johannes@sipsolutions.net,
	masahiroy@kernel.org,
	jgross@suse.com,
	nsc@kernel.org,
	kees@kernel.org,
	tglx@kernel.org,
	mingo@kernel.org,
	frederic@kernel.org,
	paulmck@kernel.org,
	peterz@infradead.org,
	mathieu.desnoyers@efficios.com,
	luto@kernel.org,
	edumazet@google.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xie Yuanbin <qq570070308@gmail.com>
Subject: [PATCH 7/9] ARM: entry: call __exit_to_user_mode_validate() when returning to user
Date: Mon, 26 Jan 2026 00:40:14 +0800
Message-ID: <20260125164016.331257-8-qq570070308@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125164016.331257-1-qq570070308@gmail.com>
References: <20260125164016.331257-1-qq570070308@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_084147_577436_A4910DE9 
X-CRM114-Status: UNSURE (   8.86  )
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

Call __exit_to_user_mode_validate() when returning to user, just like
what other architectures do.

Signed-off-by: Xie Yuanbin <qq570070308@gmail.com>
---
 arch/arm/kernel/entry.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/entry.c b/arch/arm/kernel/entry.c
index 5de345e9146f..85df47b5c359 100644
--- a/arch/arm/kernel/entry.c
+++ b/arch/arm/kernel/entry.c
@@ -18,6 +18,7 @@ void arm_exit_to_user_mode_no_work_pending(void)
 	if (IS_ENABLED(CONFIG_GENERIC_ENTRY))
 		tick_nohz_user_enter_prepare();
 	rseq_irqentry_exit_to_user_mode();
+	__exit_to_user_mode_validate();
 	exit_to_user_mode();
 #ifdef CONFIG_KSTACK_ERASE
 	stackleak_erase_on_task_stack();
-- 
2.51.0


