Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AEC1FEE4E9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 12:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VoBymXtxzsCJRhmTZpF+AYoA/M6Z9FBRH4+VegI3yn4=; b=FH5kZa5nU50Wj71Siu+q01PSs4
	vbXgcHAE66az1AyvzvXwsrY5d9FCvXxserYIb5qxvKp9yaRdV7b13GpyKzeEkO/fO4LlwwfNzvI4R
	rbBQMS/8vCIz3OiLkYtlGcrVCgYSzcfblf5+T7tGOZQ2FOGvrWPZdObdDLKMt7ddMARNttEZ+jHZJ
	mf6Cg8Wx1Catv3VGXQZrgNRbspwaX/ji6A9BhgjWCzp5kAFU6EFgthLACTBSRAFKmi1Fvq7ndS4Je
	A4lr0+eT8cbwp2zSFG37GHSqcMPJw2DmCrVbltBuqX4XoRu/dCLnLVig3KWOmxulPKguERW2+OIn6
	sIIxLmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJCH-00000009oiy-43XK;
	Sat, 28 Feb 2026 12:13:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJCD-00000009oid-4Auj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 12:13:24 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8274936d2c0so2584779b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 04:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772280801; x=1772885601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VoBymXtxzsCJRhmTZpF+AYoA/M6Z9FBRH4+VegI3yn4=;
        b=VvaSkyAD9YUP4gwvayJAPrMuorursUQKlzvGbo51KgLulQwxqmp0O8tHwLVfWpm+sU
         C1Nz7hz3L/LfOZFjUdJpZWydadflwB6NBcys7/eXNF+zK0QET7Y0n1m5L6M6bq+CR8jh
         tI7MLreAQe6E9piQxfU4vAcAFs+qNW7QohGgbTPx/77UmPNXfgZE4knIf4O20vULM8CY
         p1wIFyxInmqpd7P7ZNQo2eD+5IfxneACWPWUDmBKOHYnbc8J7+QJ6Ps6WUhJmxSewnl+
         mjAi+Ca9lhbngMpYZ4EOM3JUQuXD+/wmRVyoI+hyPHvh+w/btywLpwvMMA6gGOBtpUoc
         Tv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772280801; x=1772885601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoBymXtxzsCJRhmTZpF+AYoA/M6Z9FBRH4+VegI3yn4=;
        b=HR5imEZV4/513a5yZQnPWfb0dKrSE3f7/bFDB0cATEHPRYg4jTzou+z08DcBuAW3+3
         LApweyREq3gO8lnLTyBkTzE1S3VdGTUc44GXBpLaEYSC+PPn1fjmH957ZYC/XSiT954t
         BbvLCdbdfGa3Do17a/F2MkzFcB3sizDtP0JW3DvxkjQvSavwTOdHmLoAKr9i831wMdm9
         eh+6OoGNJt79OYPOdBdOGpZbdVf0XOi2rcjoI9lFsrOK1oE4kWtTjRLBgfH7W3N6XsHV
         p/04a6V+EMQxWkSOfqjPG8vcnluzRKBXMi9N3a4IaiAowjJpeJqQepmnCPE+XNi5p1qt
         Jjxw==
X-Forwarded-Encrypted: i=1; AJvYcCWN0iczyQYC62W8Soi7d2bJeVO+L0NJViEwklRlwjbihfWxlaKW0I/brSc3eYSJ5X/xS+HOPb/XmTM88elXXS7u@lists.infradead.org
X-Gm-Message-State: AOJu0YxY0BwKbC29COZgDZVpan1mR01Hbvm6YaYGrFzTW3/aNk+P6XOA
	peBZpvGd47IxbsLDYjYe8xvYnySQa9f8b9Ugz85WNm93pJ8ylrCyvBkV
X-Gm-Gg: ATEYQzz1gtM1NadVBixoTjBPoe6ba2ZrwW9nRj3tWsXilQWSqd1qcvUOaJWCeeKaghl
	aTG1PQ5D6sSvYxAkbc2+ifLtfTTKX5/VbkJXiWef9TO90ypSMMWxnJ64STNfqwGhVUv5X0iHNhZ
	dYKZcEalMxbYgknvGUp53DvYNwTQr/4SvCpzF4vdUCqQ8ZY8vB+zf6ByTplKd+tjutj2wEv6j8W
	3F6Imm4xfsXNdk1lAMZhJf+/7r7BVfXHmBRQsM+6RVPGLHeHudD3grrdG856GKjpqVILCoc9Po1
	MBcf/nfFccpJYSTrRXzB3URLDr9oOmezMznnRHfxv4DAH2P7dlH1fS5+2mK/YRrc9ufnoWWC2w+
	Gl6C1mgGbhGVVXKrgVncDpW4f8n4zCCrq5gLZ5ewEmMqlltTZln4mRtuhjUUMZK9+YFJFxhkMZ8
	+ytsW6A+Uf+biE93ckfqzVyV6wwMqbKrN8bRb02uYScYNsNrXplhwmzG5bl7S7rGEew52fpF6k5
	3k+CWw8TbK8lJyKBiRwOA==
X-Received: by 2002:a05:6a00:94c1:b0:824:93df:6d86 with SMTP id d2e1a72fcca58-8274d9f5b74mr4799650b3a.50.1772280800633;
        Sat, 28 Feb 2026 04:13:20 -0800 (PST)
Received: from nickhuang.. (2001-b400-e28a-3ac8-97bc-6284-f824-fe38.emome-ip6.hinet.net. [2001:b400:e28a:3ac8:97bc:6284:f824:fe38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a081a14sm7194179b3a.64.2026.02.28.04.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 04:13:19 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: macro@orcam.me.uk
Cc: linux@armlinux.org.uk,
	davidgow@google.com,
	dongsheng.yang@linux.dev,
	dory85109@gmail.com,
	ebiggers@kernel.org,
	idryomov@gmail.com,
	jlayton@kernel.org,
	john.g.garry@oracle.com,
	namhyung@kernel.org,
	robh@kernel.org,
	sef1548@gmail.com,
	kusogame68@gmail.com,
	wdhh6@aliyun.com,
	wqu@suse.com,
	yot4106@gmail.com,
	likerockman102@hotmail.com,
	squid@squidspirit.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
Date: Sat, 28 Feb 2026 12:13:11 +0000
Message-ID: <20260228121311.3804-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_041322_997849_A7CAF3F3 
X-CRM114-Status: GOOD (  12.84  )
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

While the transition from __ASSEMBLY__ to __ASSEMBLER__ is not a regression,
the use of the modern __ASSEMBLER__ macro requires a sufficiently recent
compiler (GCC 3.0+).

In some environments, userland might still be using ancient tools like
GCC 2.95.x, which does not natively define __ASSEMBLER__. To provide a
complete fix and prevent silent build issues or header ambiguity, add
an #error guard to catch unsupported toolchains.

Changes in v2:
- Added explicit #error check for GCC versions earlier than 3.0.
- Updated commit message to clarify the rationale for legacy toolchain support.
- Link to v1: https://lore.kernel.org/all/20260218133952.5356-1-sef1548@gmail.com/

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 arch/arm/include/uapi/asm/ptrace.h | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23cc..51cfefeae 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -119,7 +119,12 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#if defined(__GNUC__) && (__GNUC__ <  3)
+# error "GCC 3.0+ is required for proper __ASSEMBLER__ support. \
+Your compiler is too old to safely handle modern kernel assembly headers."
+#endif
+
+#ifndef __ASSEMBLER__ 
 
 /*
  * This struct defines the way the registers are stored on the
@@ -158,6 +163,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__  */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.43.0


