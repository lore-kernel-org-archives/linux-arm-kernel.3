Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D5DC79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 07:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=; b=trmJC+4DzI3d4Ytz0Ncsarn6Xw
	Qm5+kuTOxyFJ15yepIHbJ3uQONGumEU37KyT0QS7hQCIRrVXXh/BOli/sY7OH3oRZ2+VERVzNKo7z
	oVa6a95LepwhSyA6mcFzyhnDd21wtjz+dP4L6IJERCDy5a4ZMu54GgtEgAsTlwtlOkDh0d6Stkyjr
	dSdrRDH3DgSk/dZmPJ9b1jA7ff7+E8AieFluB2qlpHgl7MPwY+IIjEzvFyQAiIkELnAfnZUhrUOjE
	YOYZXY3FgcnwOd8a3r1rg39JkpT9k7umRdTuvnouETALHmNwMZmHYV2+yzUPHfzGuQGswc6q+eIkD
	MtMk4kBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRb-00000003lDu-3lrp;
	Sat, 05 Sep 2026 07:04:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2kRX-00000003lBT-2KUI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 07:04:04 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso2672350a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 00:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788591841; x=1789196641; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=h790a6lCbbWVAQantolBTYF0DXAM5WBzxp5BuN4Z06yWJl5aYd9mHsl1G7uXtlDvMG
         HZlOyfVdXsrwDgtOzLCzSCNBi1xaHWRMBl43F5Xt2vJpIGKTuyZ8+rCRt9G2kyhLPAho
         X0u94C/AoJQASCXFzMV3gs8JisRkHxwLVnfouW/aqGXDCqkODFDQj2uQDdJ4aOkCe0hW
         OuSaFl2ClbWEbkwtcoEUGfDzgYPMERnsgSMkTLCmGTlmS2A3Ct/30F24I95qK2jX5BTI
         JRm4J7BCTPB4F/s4iA5uPwKw2RTUWEwo5H7iIwbuKp+Q46U6uO7KovH4uqkPG6BsHFaJ
         jk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788591841; x=1789196641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNFfTw1WuaSNgs5HCMSq2uznGZvnZVsIDtneqTMILXg=;
        b=UxrC5VNPqtYS9Tf5+MDGsTij6BVSN9Jst95bcddsGMZdOlz/W0McackOO0HdXMM4tc
         6epiPICyvGijf8aQGkGxPCEmJzC1rhztKxWdq+eURI80PFrdF/y0C69qRlhi8eIXfE7Y
         8igMFjDuoYxmB77W6zzuvvMlWDOGeIexFREDF5vpmyS4f9lTOhM8D0xuzRJpwV7RGNb/
         2IYAK8i0IYJTBE4KdYQfNtSFXRB/GcibFzP1zIs7qbbaV2mCu3W3HCknEg9athoNWa2i
         59ycuHZBqM9rRe82mX2PB4SC4L5ZKdPBjCGX9YR0wrUvstx521oiQGeGgXUX5F0CSQsM
         XjnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhiRLMc2WvwuoBw7UuqMIw222bIkDC2ss1Qnl3KKBef71P8p8FVJ/gGu6ss2I6UDydRdqPiIpNwXct+kuqpH/w@lists.infradead.org
X-Gm-Message-State: AFuF++kHal+cU2046w0FsZ97zPirgJV8Y4lOKJ2RMwZbb6jnOFtAaOiO
	pf642EAh7C4Hzu+hejkguQQzp97LMhZUlpP7VMZz2sO3nYrBc+EBwFHu
X-Gm-Gg: AYBFou3XOU/v4Vg08HwjgNdNChkr5CGMAtpSWyCe6vcbJz+wrvZUnPARSqmZO5jOtY3
	D8sygfTc6GrMRYghsJ+YLIUdRmato+Ei71oTrohu+j+d6aSIEbDhRdWwOm2tFrZFB0rKV8Ry86p
	Q79YpX3mY0m9+ZuLTm0SNZAPkCnMDPhJ/SXrWWuxSQkTGiI5L3xjq+LJQ5cgCah4EruGAiD+qX2
	gCw1Wh4t2ss30EGYFCAVAe3lTUKgFp+bbN0xNnsBl5GkNfh1VZyrNsDhQikXAf472w48fzQ1nRH
	RTBioqa+ZC/1JG4a7rVFcGIcZrOVR9WiA8tse9/kBO7bQc4gTRWTWRBzgPXtCUM/5U1iXg33+AZ
	zWgT/dHb3mMzkkCJEpvL2FbDhSjLhO6EHfvKgWgSESClgRHfoXaAajzknM7WM4wK915Gp3l/uXt
	lAfw0eC1ndFi0NUb+G2wn1SLdKRtfJTPnRaS6DajkQko5ArvdsFKG7tNBp1HxI6haxeOQrDptH+
	33zkYEiCyHjG5DuGjAbgmHxuKIIeUtBgNiwyFmPyQrMi8bMi1JXm9DNhryX8CVgJR/lixqTT292
	107iiZWYbjgzOjUAT4N1jxxjvwSxl/wlfbGQGLkz119aIAAiEbriYNlZ7DwL/zxtLKI39WLO
X-Received: by 2002:a17:907:1c9f:b0:c26:1691:b374 with SMTP id a640c23a62f3a-c261691ba04mr359894966b.45.1788591840842;
        Sat, 05 Sep 2026 00:04:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfdf6sm12011719f8f.34.2026.09.05.00.03.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 00:03:59 -0700 (PDT)
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
Subject: [PATCH 3/9] docs: kernel-parameters: Drop the edac_report= entry
Date: Sat,  5 Sep 2026 09:03:41 +0200
Message-Id: <20260905070347.25902-4-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260905070347.25902-1-kmehltretter@gmail.com>
References: <20260905070347.25902-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_000403_616561_76322EDA 
X-CRM114-Status: GOOD (  10.40  )
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


