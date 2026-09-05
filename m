Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFF1C79F8B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 09:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=; b=W/LcM5qHWjzJd4Si8rIKC2OltF
	aIpg51Rp78Wqxju2nwhPrvHwS2Kl5eC0etnrKIDIEqjdOHKqBa9rGxRnfuYr0SIYmxqtQ5G/nSEy3
	8eXRZ/zuZTF0hDAiOfL7uP23tXqfHFt3hLUErz36aVhIvPmx1u+pjSHII7mURz1kRbQ4SggkJPSYe
	ssv3ACnF2hHVeuqKeOtx7QYlj7GXn5jBw0AXkolzBAStI/ieQMIY1IBBbVL6NL7ZvAx58qmOkoIAT
	X6Tv6czi6x6ZJFOlty7dmo1GSjQoJ1uFn0EPzzLDd0EWkrgL1gfQsMklZEWIU86naGXTfX3VsqKTU
	G2OY09eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzP-00000003wEp-1JM7;
	Sat, 05 Sep 2026 09:47:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2mzL-00000003wB4-2bHb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 09:47:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4858595f997so1139133f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 02:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788601626; x=1789206426; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=gMvFPN0Md3Ja68BlesI8Tbtropy6Uvnn7424r2wXLhA6zTm4jR21CqvHvgVe3HrlbO
         7H7MV9ytrzkkVvtzjRYz0vJCMGOpxxgJT9GonY0dxCp3J8YTyF4JM77IxNx7qp2Urwoi
         fgGii3tWwXdhbBeQcmZ0ocQFCDXwaynN7esZ41CO2LrwhvSrmk5YztFdXGstFqb4aWIX
         Y1xHpU5c3XPSOFBdwxH1dNQtxTKZK6rae7uXXGuDhnuY0VMmjt3sEloURuuibqf/Y5LB
         532xPoNr+Q1eBWe2jqetRgBqn/A0/Pyij1fF1ECyywMsRY/NmT8TDsGkd5K5em3pY1wq
         wTqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788601626; x=1789206426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=cdw+nDQs/9mEgews2uyiasdaqELZN+5MRfqW6M+Kkvue0B6hBl1kOD5bwkeyxNoB9O
         6ZkTLkrSkj/cAnHFHiXL2+8imnwQDIAtlyurh3qQv3pcwcqM4U/RmD6FR9f/wI/TSLPo
         pk0NrBTPNQ0Fxfa1DyGul2za940ZFx0yFDgMZM3owKHQ0+lAWqfMAzISGGr+j/7518cs
         Ntk6KWzN8XnTbx1U0O+1yajzdFCRrHV+3HcejZJWG8KviRGKyKOb34MuyZtF0NLiP5q2
         j81IybukXW0QC1xDYqjTSFJPZk+TOv+stgJ+4Kl9lcItGTCnKBUAsPO3pCpCrC6zuGDp
         tKKg==
X-Forwarded-Encrypted: i=1; AKwUvBxFXUxCOAzunJe0uuxHCDQ3DYiPAt7r8JYpyyb9wYqQMI1j6F30vFWw7WitT3kYfftG7mo19RLWf7XL9cSj30rK@lists.infradead.org
X-Gm-Message-State: AFuF++nkgIJ+jaedjwNuVSS79FjHM33AlfpTB7XO+D8OxyombxOvRgBz
	e6c43+D0iHsyjxXemuxr2xXpDYm54YUW4+kHGaM9DV41FgoHelK+I5d9
X-Gm-Gg: AYBFou3SJPjAeqqID900OOUJoQwaVGCPghXfYiJwycXK1stWVZNw817WwkTo54T9oTk
	v2KoguqdICCr6QjdDVQY200/cz/NPpfWOpNoERFoYrRsHROUpJlVnZN16diEtI5VZPxq3jeJnSw
	Ki4ejiVLcEiH4acefsDPm+TFx66Tnken3wxkIZEYzg5yTggXfYD+KNep4rj4BysCHzwlBk8qLHE
	nmcKwl8j3g0UGTakskm8zN4TG3EGUj6Hceig/geNnLOK4EOf+lXMrGfcU6UV0r9WtQGV+CqCTG6
	Cf5TNwHIUbKZYxCjf2u8fHcJifZRbs9Khd0itnTq6XhMKClllN4W7qU1lvlVyHwQ7rBNbl9iu2m
	wQxu7mKSdN6BvaY648GsUKCWWfK9aPSbofZpRYuy2KF8iKMmleUY9rlGwSlaozvuHsfpkbALon3
	XqjByyRC0sMz6iIVGLRePwmRe/RPcChe1B0i8OvDdGsR7pyi8fi0WsG3aQBN7e8bDJMqCQuTCi8
	caYFGO4RiMNrNqtZ+ifUWz1awf5gclo22yD5q5yN8NMjdMDza4jeBxPW2fpuAhOGLzxUnS5jHpA
	+/I+t2dk3TkhEobHGFiklm+Jc2pfKHknMvXSfcPDNgVW0bxDpWZsJkkjQFaDxmSZw4M=
X-Received: by 2002:a05:6000:178e:b0:484:3200:b7a1 with SMTP id ffacd0b85a97d-4858708c88amr21220202f8f.13.1788601625675;
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm14232013f8f.25.2026.09.05.02.47.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:47:05 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	Steve Wahl <steve.wahl@hpe.com>,
	Dimitri Sivanich <dimitri.sivanich@hpe.com>,
	Mike Travis <mike.travis@hpe.com>,
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
	linux-ide@vger.kernel.org,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Michael Schmitz <schmitzmic@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 11:46:43 +0200
Message-Id: <20260905094649.41996-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905094649.41996-1-kmehltretter@gmail.com>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_024707_677022_B1C0A6F3 
X-CRM114-Status: GOOD (  10.72  )
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

edac_report= went away with commit fee27d7d9788 ("EDAC: Delete
edac_stub.c"); nothing parses it any more.

Drop the entry.

Found by cross-checking every documented name against the __setup(),
early_param() and core_param() registrations in the tree.

Fixes: fee27d7d9788 ("EDAC: Delete edac_stub.c")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 99d5bb68968a..2a8d862ef30f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1578,14 +1578,6 @@ Kernel parameters
 			PCI device even when its classcode is not of the
 			UART class.
 
-	edac_report=	[HW,EDAC] Control how to report EDAC event
-			Format: {"on" | "off" | "force"}
-			on: enable EDAC to report H/W event. May be overridden
-			by other higher priority error reporting module.
-			off: disable H/W event reporting through EDAC.
-			force: enforce the use of EDAC to report H/W event.
-			default: on.
-
 	edd=		[EDD]
 			Format: {"off" | "on" | "skip[mbr]"}
 
-- 
2.53.0


