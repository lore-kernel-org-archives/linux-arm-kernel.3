Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2045F41807
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 15:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U0e7ZBxH0n6WseIMVe/V23eOrkRrhfvDMB468TVycw0=; b=RNuwcS/IGbPFtgHEnDUPYvrIfl
	u+62JotOrKEhThxrkB+Iam931/vvtfk5qsCbjsB+1bKzM9OzGFPybwNtsRR6Z8e88IiG6JTdnKbPO
	rTTKf0ihdxp7I6dCfsDHuL929nrirlfb4CDk8M8oPyFbArQQgrFF9pvv28sGsDsAQny99Xq2kZVJZ
	y7UP8hkdU8AOJ20W24i4zyJEVjwUIqzOADoTeTp5g1/LtcEHnj1LPxJ8+Qk1sol3zxEqAXy1jzTqU
	k87X81EG55Vl5XhEjTXbyHFB5PqixXJ+niUL4NwRcY5kuQ2Gc9hTwT+qZ2WuljOOW9CHT5b9T4f7x
	/RyRzDuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcU4-00000007b0s-3U8U;
	Mon, 09 Mar 2026 15:25:28 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzcU3-00000007b0P-06fc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 15:25:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35990245493so5264440a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773069925; x=1773674725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0e7ZBxH0n6WseIMVe/V23eOrkRrhfvDMB468TVycw0=;
        b=drEILRQbd/+8Bv7hv/wrCXHK10I5MtB6kiwhGE6bDKU0WdSTCPzfgzL07A2DqtyUp7
         /kQupQD9YLAq4alvv4Kv7CKKeK1ryIni1YRhuiRIiFkgYNMJpxGDt25LtOIcG6tCELQe
         NeCeEqQpol2uAkFUEwnHJhdYUmT6lm+JL5neE50n0xggrMwnqgMk6xaIeumkp0z0H5Dw
         Gfmu4+riFdeTVC4gxO4wxwhBZlJdwgLoO9PR0Jxuxt16BJ8ANEFr+MozSCZ5le2ZzGQX
         ouZ5+ZFiZUhPIm+JsTfDyI5cV0uRtFL6oPae5cSizBOCLNkt5aSjycuaYpVuwrNu87p5
         NQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069925; x=1773674725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0e7ZBxH0n6WseIMVe/V23eOrkRrhfvDMB468TVycw0=;
        b=cvto2jb0nsqACQbRoXzo5OJjqQHfFeOzt5gwQ2DZuFY9Ev7yykDwQv0g+MmgN5N27G
         7tA4N1vHCjCXKVIU7L2WjftaulW1zj1CBarNI1gexeXhjGWT0rJA8gtFVLt3kGgR4iuE
         g2EJq9Q1uusBgwZUKWyHYjZ0sEufER4XkrObSK5D1rjr7kpxXXiiNAmo0ONPjpbCXYuW
         SYUDYdZJ9iDIgW8AvfvzSKTjleASDDWf2gSDRXYmnP5+NAceJsTsuxVxQtM2J47TAZcY
         MJdcqgMJHBjv1bnt5YN7yYCj3+1B47Ybe5I32C0kWaJt32I+x5snOl/MhjCMXhbZ/wg/
         regQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNgtYSRw5gJLGGuL5SMNQmLXoAMrE4VR9m07SLsI8VzJytEjmde7TMT+oDrEMHpMl/UV7E7b9VW6iNjqG40fey@lists.infradead.org
X-Gm-Message-State: AOJu0YwsuMvxHNHHSM1+D7fR3sOPU7nLpLt+I5d+dQZLLC0bagYjiMC7
	wtWe0bE670qCZ3LGXJQNF5geJkHwpYlQLYr0oUHx7939Dh3VDQAiGL5K
X-Gm-Gg: ATEYQzyTFohbFEJyW3efThwGmdg3Yei+05ML3HXF+tt2uVWCpOLF9bUSnNGrTI+gfje
	b4HpsH2d2BcrihgUWTbcbc+IdnAwCbAfO8gcaS2RmU+wvSoAZfTrwQcLwwLnAXLrye0436aA/FB
	52nJNb4vzGUlcPvAH8uYyqztYVBMfwKvLPk093IxVZOj0ReCY3X3HBrVJXkBX7/0r4cPRimb8hw
	IMgX8bEYEyL6iewFmnjKeL5FeR9DVS34s/OM4ptaHk7E9gikQdbpJAJ9/lEF5G5bZZ4FvTWMgRP
	sd3XMYwHi+399GmanC3xMKw00H0wM/hEhLLQslJF0bz5b7pYDW3vAt6/eW/n43WVlzR0O8GEdzj
	20S3ZOmdZqCSEnilNHrPX3F4yBpffmr8GKMEkqcxzxMdYuz5tq87wjwDZo2jusycXv2UAWbTEOC
	ibB6QtoxXX+oNfwjubEPShXWC1RDqOo2xIHP5+nWA65vYO06Z+8eG31roHQcoh9+0KJVCGoz6QK
	VOdZRUFW5Jlrroihnl1iA==
X-Received: by 2002:a17:90b:3f83:b0:354:a608:30a2 with SMTP id 98e67ed59e1d1-359be374609mr10108216a91.35.1773069925388;
        Mon, 09 Mar 2026 08:25:25 -0700 (PDT)
Received: from nickhuang.. (2001-b400-e259-af20-21bd-50bb-eafd-d6d1.emome-ip6.hinet.net. [2001:b400:e259:af20:21bd:50bb:eafd:d6d1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359bcb2abbcsm4285036a91.7.2026.03.09.08.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:25:24 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: macro@orcam.me.uk
Cc: davidgow@google.com,
	dongsheng.yang@linux.dev,
	dory85109@gmail.com,
	ebiggers@kernel.org,
	idryomov@gmail.com,
	jlayton@kernel.org,
	john.g.garry@oracle.com,
	kusogame68@gmail.com,
	likerockman102@hotmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk,
	linux@weissschuh.net,
	namhyung@kernel.org,
	robh@kernel.org,
	sef1548@gmail.com,
	squid@squidspirit.com,
	wdhh6@aliyun.com,
	wqu@suse.com,
	yot4106@gmail.com
Subject: Re: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi
Date: Mon,  9 Mar 2026 15:24:23 +0000
Message-ID: <20260309152423.2582-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2603011816460.44093@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_082527_064017_E4AEB954 
X-CRM114-Status: GOOD (  10.52  )
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

Add a compatibility shim for __ASSEMBLER__ to support older GCC versions.
This bridge ensures that toolchains defining only __ASSEMBLY__ can correctly identify assembly stages.
This block can be removed once consensus is reached to drop support for these legacy compilers. If this version is acceptable, I will send it out in the v3 patch.

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23cc..427eb70bd 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -119,7 +119,11 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#if !defined(__ASSEMBLER__) && defined(__ASSEMBLY__)
+#define __ASSEMBLER__ __ASSEMBLY__
+#endif
+
+#ifndef __ASSEMBLER__ 
 
 /*
  * This struct defines the way the registers are stored on the
@@ -158,6 +162,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__  */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.43.0


