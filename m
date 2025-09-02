Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDAECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 08:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlVepfV1a+DpSRQ4He+huYbA4zsiZ1BkZY1wCGkzX/s=; b=Dz80a2IudqgMEqth0UdtTZwKXj
	rdqhWFNYl+Lwe06BTbmB5JVWRNyY+F03YuSRnodN1zdjqiT8S62FIKNMO/dUdzehbzPgDwoImuEvS
	JQICGiKnZKqaJ6Ce1coUcvc2QCe+n+PTZiQX9TJDcAt/tN+CxRucVYUM8DyRcLUqUptdA6rGAqb2S
	KkKVo/vT/ZPn7twKYW3zRDk+3O74ysRjd4Uzg4bRqHAhX4ePqnB7w1uLMmsjj6dkZP04AlIrF/2KP
	e8vd9hDN8Qu8lHxnOuJ9mGEqNlWXHAczspdGj6kj2TdNVCQ9XuZXA2DvamprAQpEbg5RS/lJWyaPv
	zC9Rn+Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utMGW-0000000G1BF-2JWS;
	Tue, 02 Sep 2025 08:21:20 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utLvm-0000000Fsm6-1NT8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 07:59:55 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77238a3101fso1896914b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 00:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756799993; x=1757404793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlVepfV1a+DpSRQ4He+huYbA4zsiZ1BkZY1wCGkzX/s=;
        b=kJB1QPXogw+HqNfgQHajDhr1E4KqvQJedorVQkIYo1ai229mVdKuJPY/VXR9h3u7Kw
         ccSGQKqTecmxoysNNxEqzpjIA4mWZMIJQCzOvryVhWtKPSNB+SGB0AKgyPAKVbhgd/u2
         nIAi481X0fA9KFGLyNZbR7SPupoePMDQVpsS8iemwYxisgUWAL4sBa8nbs5TmAgki3fy
         CKErXVZvceQebgFAKZagsdhiUATbJ4g5xv15/EfyI7fIBzJJXi94eBRr1hvdoBRKPEbG
         RkeewVGYsWwfWoKI1WxuhXnbDpRETEm6O+cDLuFfI+j8ScWCSMtLzyUD+VZXvdBiFbMw
         m/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756799993; x=1757404793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlVepfV1a+DpSRQ4He+huYbA4zsiZ1BkZY1wCGkzX/s=;
        b=Mf7TjmdBf0GQTmNLa+qzQDTQ6sXYmDga5VofDD1074x4kPLD9B4eP9s4naplcoBVxm
         1kWbjzyvCXu2Kw2Vbhgc6opdSa2AoX14w7dHYfgrGD5cKDe+zIiV+HcUdY8ugd0kDXAL
         dmx6hj+dAqmbWCJBXjYDuEs2CNSBBMH2+aJC304U8SKWco8lUWEg/fP9rshRnJG7unSo
         HX0Z22ZKxZecvE1u0SVrTA/8H0+vZd8p1brDtQapsrk0QrUJuZZ7ej20u8DPrXsVjgLK
         dgr4rtpxQ7QYfd8aVWW1QwYqr/XnbY2ajNuIHllQwVGeDf2CsPtF15/YAk6AbF0HWvwn
         BjTw==
X-Forwarded-Encrypted: i=1; AJvYcCVDNToeTDvyUkuh9RDli3YQk+H+0kRRR4pejxO30UzkLMBanTsFquNmXrMnHUXWBdcI+MjI62WwjniBe4DTBE1z@lists.infradead.org
X-Gm-Message-State: AOJu0YxRroAIZWff+d9ZzZc/gLxzYlBP4nFV/jbvhOq6Fnkedyr93O2N
	NFuvJVHYzAOmbBhRT60mCCzFqpPxsVLHMM0YRQhMEw9V+pDBsZEZUZtn
X-Gm-Gg: ASbGncssh0OXHZpDlilYRBcyvoKlZlpvRmlaKz22Gca+avH/JadGFankZKs9+gERW5y
	oUtF5ytKE8JG8jEXQdr/98UNUS+LRebifHXIRfoRcjQrYx8qI0TJZjpGV6TuacIC2uOTkiCGNJV
	SdKwq7rEGkGfZ3ZXeUaICZ+jvH48Ssusm9nr2TMKv62lOFdRdJ8edNoTY58bZC1Bj1PNZVZi/PK
	EvxeBx1ysQu8zAANnR5yM0pBG1NxXiP80R4EID8W0HXvMv4ZiwUj0YIX1MPMiz2+bFckY6FC51C
	b5i7ydolgdf6UJv9SxG0g3TlU2tewJ8SeZRUhQNyWa+m14QLFAJmDZDLHXytrjkxosRc9Wx17ys
	YXT/rUq76yb+8upGe3tFVuYxxybL19Xu0fWsFESxEtO+gg2GMJEimjnbec3rvfFBwpLFBgCve6b
	zX6WkW/CgCfGR48YtSzbyTdHrM3Hfuw/ITWlZ4l+LdIYJAqg==
X-Google-Smtp-Source: AGHT+IEm+nVTTWs1aKBQDOB7XkIOAjtqqHuK2OSMs8jJ86T3iVRPvjpflAUWrk7SxzYK6gPkJ08Jhw==
X-Received: by 2002:a05:6a00:114b:b0:76b:dd2e:5b89 with SMTP id d2e1a72fcca58-7723e21a61fmr13477807b3a.6.1756799993188;
        Tue, 02 Sep 2025 00:59:53 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.36])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-772590e05adsm5314995b3a.86.2025.09.02.00.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 00:59:52 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Kevin Hilman <khilman@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Dave Gerlach <d-gerlach@ti.com>,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init
Date: Tue,  2 Sep 2025 15:59:43 +0800
Message-Id: <20250902075943.2408832-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_005954_367905_3547DD82 
X-CRM114-Status: GOOD (  13.31  )
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

Add missing of_node_put() calls to release
device node references obtained via of_parse_phandle().

Fixes: 06ee7a950b6a ("ARM: OMAP2+: pm33xx-core: Add cpuidle_ops for am335x/am437x")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 arch/arm/mach-omap2/pm33xx-core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/pm33xx-core.c b/arch/arm/mach-omap2/pm33xx-core.c
index c907478be196..4abb86dc98fd 100644
--- a/arch/arm/mach-omap2/pm33xx-core.c
+++ b/arch/arm/mach-omap2/pm33xx-core.c
@@ -388,12 +388,15 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 		if (!state_node)
 			break;
 
-		if (!of_device_is_available(state_node))
+		if (!of_device_is_available(state_node)) {
+			of_node_put(state_node);
 			continue;
+		}
 
 		if (i == CPUIDLE_STATE_MAX) {
 			pr_warn("%s: cpuidle states reached max possible\n",
 				__func__);
+			of_node_put(state_node);
 			break;
 		}
 
@@ -403,6 +406,7 @@ static int __init amx3_idle_init(struct device_node *cpu_node, int cpu)
 			states[state_count].wfi_flags |= WFI_FLAG_WAKE_M3 |
 							 WFI_FLAG_FLUSH_CACHE;
 
+		of_node_put(state_node);
 		state_count++;
 	}
 
-- 
2.35.1


