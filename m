Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DCCCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 04:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=; b=nui19nCCCYuXamCS/RHv04dVdQ
	ng1L/hmTyNo3SKlVC1KD3/jBP2awFdbaj/P0vl6w3ZKkU67vi5tLwBGS0iY3N67R2ugEFAEbAYPmE
	U/pvECvKyeTZ7+7hzymd9q4V6mHJmU9UacLSf44boUpYuSmB/AGfM6W04C9IsEKCNaXzWRJFktffv
	rUkViQsrQoRmX6g9h7E5q1yuD0xlLUMo1SW+N7Hb0t3X8Unfo/ACZR2SecpdlB26Q43mkTnSJgzUr
	dbwjQmNyWdvN/UsAp709dLW80vTegngfiZuF6hCz3yae2bZcNTXW8ttRhF55S+tdPmDDFnBBPGZR/
	aSpluzlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCoU-00000005Wp7-1lsh;
	Fri, 08 May 2026 04:27:46 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLCoR-00000005Wo1-1R1o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 04:27:44 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2ba21d32776so11311435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 21:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778214462; x=1778819262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=sigFbTqKEJObqhN9H7qqX61G3yxm46lnh+1rUXDFzCcyHP2C1bVOhKG1AMO+aVc4h2
         At2CY7caiBnxRFKOFmPNMQOqv1PIk9qQq/saxWE33t4qVslgtCWeKSyxfICHNzQ9XEQp
         3ZkCyawurALU/w8h+vlKJPrr1rM/B0WKDVj4gAQmx7hWJQ/AUKdsnRXrSyrCr7bLqU/I
         TefkxLZAKHhtDXPVcztAC2ul0O/gwNtIoMKdpTdfdcrL5uZ2Mo2JDYF+yK49uWFmYtgn
         r0Lk4cX36QVp7c7p/8vNmeVLPWrVxGNCVAR8kMuH1RIr1LrLKpYZaeoXpsdHqJNM0nRp
         +eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778214462; x=1778819262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G8dG7m6dGz7quI2IVG777qTbZeQGQjj17FebKN4BjmE=;
        b=BC4c9DOcKz+9mkANVAah27isBMqKfnoNr1eZT19cX/djvo9g9ya/79qq5Yi+zyzlib
         6dvELByNla5D4VyXykZG8o/2h9CEDgMrCgnC/Jkf+2gjUaM6eT04ylFWoGPQsUWbmG8E
         gt8/spXQKBqwY86CPAbyBeTQ/2XqdMOiMC+uoOh9Qj0UCRRGdazF36oheUV1wzE8q+Z8
         a3/PeSz5amCcOLuWKytMlpvMtRkvwSf8weS7Af8Rch6CQYRihyQEGO8XiIKXECuCEMMO
         V+GuHeNG6pOz3vosUMVeDshUX5DPhwXEmgY1kJxFzAVQXsI1VXcZBBU8DYJpY/ZYfyIy
         uLGw==
X-Forwarded-Encrypted: i=1; AFNElJ/3EOb2m4/FatL2vxjlPIQQ41h/2AE175JkghNx7oX3zUYJK6TKkLa4jlVXa9lkzvsRHV6j7XPpKF5+llvXFXGT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZZjNCaTxDBeK2G37gcRE5V009LdT0DtLq6MeXVI5K/rPN7ito
	2B2a92picgyHbceTD4viN2JO2TGnSNuri2PhuVW+WB2jPYmn2rwGnAp/
X-Gm-Gg: Acq92OFpA0ShuDqZ/V+ELfj5pIoyBs18SZo4MhVA+kGQ0JchlIiJ9Ua8NdUN3jF5q3g
	bwWc9uo4Lzf8XGc4oB6Szr0ONH4EMSfxC/9I3xYYOHXagk0myQLL4FhbfylDbpyfzWLFZtjtwia
	EThC+CdpADyzB++snryQ1d18v8dWdiB0PRm7hyNpG5K7uu+MelqLmryY8mPUqJmp+0cVwqv8V/r
	Xpa8UupO52A4VwkGHeAIbVckyrYzquL34GRhyF1uQSZaoPKWbJ/jwEgzO2+xkYL4a7fFllbEqJH
	Y8bze1pRxjnBB1OAAepCGJGH8MZYCHLetCZAYKDTWwlEIL6ASrkDXCS1lrULOPPR/lXT86XrHA+
	7fyF+EEYDM6sdqRRtT/DzckzD31uib5La2hybiq15DJB2OoUPSMkbw1dpOlgOJv4AGfN4NKkmy7
	I4CV1jPaYUsQdby6mkARs7AZFjplzqxzdJozqJ28abyIj4hPUv1S9uYF9bAqi5841SRrtOevzRC
	1MuRNlUo8q2VgOkjWHo3rdL9PY8qSvSL2/wVenn0ZBhLQ==
X-Received: by 2002:a17:902:e54e:b0:2ba:4eee:6c1e with SMTP id d9443c01a7336-2ba78e40c8fmr113612765ad.15.1778214461560;
        Thu, 07 May 2026 21:27:41 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eac3afsm5346695ad.71.2026.05.07.21.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 21:27:40 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mips@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chuanhong Guo <gch981213@gmail.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] mips: ralink: mt7621: add missing __iomem
Date: Thu,  7 May 2026 21:27:24 -0700
Message-ID: <20260508042724.1719688-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_212743_383401_C4FCCD88 
X-CRM114-Status: GOOD (  11.16  )
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

raw_readl and writel calls expect pointers annotated with __iomem.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild/202211060456.cnV6IK6G-lkp@intel.com/
Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/mips/ralink/mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
index a4bdda8541c0..ae7b8cfedd5f 100644
--- a/arch/mips/ralink/mt7621.c
+++ b/arch/mips/ralink/mt7621.c
@@ -63,7 +63,7 @@ phys_addr_t mips_cpc_default_phys_base(void)
 
 static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
 {
-	void *dm = (void *)KSEG1ADDR(&detect_magic);
+	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
 
 	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
 		return true;
-- 
2.54.0


