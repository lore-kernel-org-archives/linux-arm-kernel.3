Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA32C624D6
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=; b=vavdSSFBIx2waUQ6/eNyXIVNVq
	LIWK0kfPLImnei7kn/nw8Jia8/1nubzqWA7jd0CNsLocBAypj/9u/VNA/0Rh9Dgy0caMKhGlY1jNH
	FbtUKMOcCPDcjqfUbhXYuu7SQPttYOIUI+e+sAKVKgIqgkny5lydNDpFf7bEAXWbFIvpMCi/P7jNU
	W2DUK0nAJVsnpRsMw3fRge4ShVwBHmHv6FlJfeYqhGszG2G7aXCCdq1OctUmRUdbkC6m3BGUtOCLC
	lqOQzT4d29WsAWrtR7torLfz4gZKXDjmqk/uvGwj0+qLvcN/L57phnV+R9tyMTf8PyngMuQ5UQK/O
	oweT430g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRb-00000003lEC-4BCJ;
	Sat, 05 Sep 2026 07:04:07 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRY-00000003lBm-31fd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:05 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c259e5c22ffso286657866b.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591843; x=1789196643; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=qZjQJmGr9DHK0rKxoGz5TQrGB3fm22uENd+M0rBKyfXaix8qYn8sYjS1gWDtxkfOoQ
         qTIdEWVkPFle1RLhnoUE0HNQtUO899KojPa1+zLhx+xOJ60v+LpqU1tL93A5++0n5tqQ
         RxfI3E4lzveqL265+cTsd8qMtEClZBZlcni+ChDfzypBfNuoBUVPRc18mH3rx/yfvawh
         FG44UFttYbkSBfouyFIS8T7WJhlN1cASS16sHk9uFrC/gHrzQBoDgFhA5qo4waIfUups
         3JAJCDULszwasOoUYxPE4rjMfwLTGksczQFMvvuBgjsbrXydu1YjT64dmYtydfpzHZbB
         1Qsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591843; x=1789196643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h3cyhQ1bY0apuRrAImVycgRtlSF3vYdx1yKBS/SgnI=;
        b=ofmn96DpA0gJq/a8c1hC2yKtC203AAVwNWhu+SnbhSA/cJMpouCbJrGzfXAZAUXrp6
         8EFvG3ysioBJag2Z5F4Erz3nq9fVCV9COHmr/HDdJ6gbCmBLbcxRMwHDVOToY/cGzMBC
         sd39JYl+GkSK60uYZSPKIFvYFJzo3xUW2F2kxTviOgKdvXTVV71K4bAoeMBivEhtgtXi
         /Xz9iaL8dQxEUVdIFSuS1I+BQQVJ+UDYe9xXhj7kV6sCN0X1Csn3o7WeP7gV74AeN+Y3
         lzCHW9TTkO4xa3P1+EatU5DhCHXbtD9BkRPh9mKA/Pm//SkUm7L5TyvsY1iXFclOaNhT
         0v9Q==
X-Forwarded-Encrypted: i=1; AKwUvBx5ny1BkBF4AIZdD94YznNt3ivWIoe/HT95FHTqOHFVEQs/STGQ08pG4r+/5L2AZqdyOde/MqMRNY4/0R+Kv2dA@lists.infradead.org
X-Gm-Message-State: AFuF++lShYHkL2/ZMqe+vmXPC+CmXNozOdBa9JljKr4ZbiDLi6Dq1Dt0
	AX/iJ2RAp7sVs3k9yidgDQIKj81MkkUQRvGClIipfPZ2sA40JVy8dcgW
X-Gm-Gg: AYBFou1HOJEXX/IJv/Prd3j+Oyo74DPP+3WaV0ZXg3t9RIk58f+CNS5Yf0o1/PEpTx8
	zG0oZFMvBFUHyl4t0uF48XEhVtUlsqPGKdS1Oypda8pbdK8Zb+unlbnhCm/NDWvdnTkNWqUXdWP
	oe0xbRwLY9XaFe2fO7uv2+bliiqbP8fE7Qt+xWyYQXyFyL2oWcAS5XYPDK5uo/mR0wdSSTp6yAh
	+JlV3l8OCc1/Or52KDsyZ5uYdpmX1PjwsT/sUs62IIf36URDek4chWzrTrXhjcAbbqLAqvC0pkP
	dlqFuLSwC123OCtqz0osqsyz3L44QCbbxQ7PNxB9A3vxdCk69lqnpi4PHP4Hto0c4OMo4+3ahO1
	QG88pKU/S6RUd3lFF8/bykogsLQFBt3we8fHCboeno/wUwQwsDDTbS6PVdEHCwXoOENI8wwu4u+
	16rq7fXbzb/3E9YW3qUwLGOndrORV1AiqjB4Bv97Tc1JpvTRZsV7B0lPZhEivKWI9ZtJau8LVD4
	Jt3atE7GedtG4DhBtSV+4dFp+6IqTGrzAxfj+GCI8F/uVZoEuhQYm64fyvFNQwtALwT/C1VZU+9
	bJjnxnBhG7l440kprJcbevQL9MwghNh1bLmy2pw4rhttpaWcRHGstbkq9HZVuweryhsvoinFQQ=
	=
X-Received: by 2002:a17:907:d94:b0:c16:4df6:176b with SMTP id a640c23a62f3a-c260ca47420mr442803966b.20.1788591842595;
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Tony Luck <tony.luck@intel.com>,
	linux-edac@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Tony Lindgren <tony@atomide.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-omap@vger.kernel.org,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	linux-ide@vger.kernel.org
Subject: [PATCH 4/9] docs: kernel-parameters: Drop the enable_timer_pin_1 entry
Date: Sat,  5 Sep 2026 09:03:42 +0200
Message-Id: <20260905070347.25902-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000404_780228_B64918F8 
X-CRM114-Status: GOOD (  11.67  )
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

enable_timer_pin_1 lost its early_param() in commit efa2559f6516 ("x86:
order variables in io_apic_xx.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: efa2559f6516 ("x86: order variables in io_apic_xx.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2a8d862ef30f..f4314492953d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1647,12 +1647,6 @@ Kernel parameters
 			to discrete, to make X server driver able to add WB
 			entry later. This parameter enables that.
 
-	enable_timer_pin_1 [X86]
-			Enable PIN 1 of APIC timer
-			Can be useful to work around chipset bugs
-			(in particular on some ATI chipsets).
-			The kernel tries to set a reasonable default.
-
 	enforcing=	[SELINUX] Set initial enforcing status.
 			Format: {"0" | "1"}
 			See security/selinux/Kconfig help text.
-- 
2.53.0


