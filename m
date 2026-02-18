Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68465E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zr3fOi7lEVk6Vqg6uuSF6YELTSeYVYBtsX5xTlIObWo=; b=B/ykR9EGG3p6b46uS74zjX5fQD
	ApVZmGiSFwvs+nLM2FylMZ9B7GJn157k/lvg80oOQkdbV5mTdGkFAqnUrCL4cgxKfiVuQHyXcbRw8
	k2u6HcTLAiAZ/k9+znyWjMQLKu/XZQt/Rwsx4ipo+UC+ZFv5jy5DWY8IP41szz04Y0sslbIM0rcAG
	NQfyz/0JQ+W6lCNjCkPsug58msk9wRMTvcYS1ytRhc8Ue5oPqWIxlnhICibYtboq7KhefKAlJnOlU
	kb3bQwLDcYgHP4NITUL9XuwLNgkQo0bgzW4J9WkPCUce3tXdFLHYJw81mpJakyNQiewZtSURi7GAt
	Xv2dAfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshmc-00000009tYF-42d7;
	Wed, 18 Feb 2026 13:40:02 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vshma-00000009tXZ-3X2V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 13:40:01 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-2ad21f437eeso6934845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 05:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771421999; x=1772026799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zr3fOi7lEVk6Vqg6uuSF6YELTSeYVYBtsX5xTlIObWo=;
        b=TG5IBJ9U8QHeJJfSFz8OYxeir6udN8248h8CbK4tvGUd7bEjtQmfI9FBJugl9/xHXm
         2R6YRLFS9BbGrdM4t7NGvmULSXM3PA4VTdxwFrXIsAEkI8HTd4yqIWghInmHI4JspBjA
         Z3zuj3bRPBRPBwM5GSPV79nSih7hvQooQ7Q3gUOvr5mOF+BPTUbAApgxh+J6iHvjzGZN
         TXv5pfjZbkgUdZ5f7SxExEJvL/0JONAioeicmb6b9KEHkynJjHP1SjjZrOEUFH79xzTB
         HF9U634v9CLqOmrVbRaI0hnNqtymtp/1/lOchh6RdE3bdA4bcfwUlmaPPujdg/vZYbF0
         1Mgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771421999; x=1772026799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zr3fOi7lEVk6Vqg6uuSF6YELTSeYVYBtsX5xTlIObWo=;
        b=MRM3S1VUsQ0U7dQmWz2Wplj7HviZ5ddG4tpFQQI4PwTswzucn74Pu8CI3H2IcbAMJU
         ylfLkpniwF7bnzne0RMFQoYbZbFQz7rTpD+4qU7Vx68DfmyJdn9yS+7br1+koroKpZ4S
         GV/cOygOnfvGubOf6LtsVWIkObDR16jYyXoMIoWWGwP3TTOkUGm1fm7uA8zjr95NGpOw
         Y/8X980iiZdDivzgOJ+pPcNyBZLcyCywzgp2C6n/pPyIbv0UIdOlGnkHcFcGM3eLkGhg
         /QvHk5xCtTxFy7IoDnCxhkqho3CsPzBXdkTv3E/XEAGkuCu1guFTv/MbylcDAHm1hHXs
         RbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVbgJcyHBuhh7oYVO6CvrsTCV5OtgJv1IhwUBzRkNyYzrU1VNXWw5B1fmxrC7PK2QsRXnTZmqRw1mTosPmltLYu@lists.infradead.org
X-Gm-Message-State: AOJu0YwhZtp2miQU0YE77BePcLZQLczVp0ReVBMZ0K/3YLF7mPseJm3s
	RGxgCfD6VGP7qT0gU+qLH9LtE5dvY9ukSj0VbOPdBgzheu6x6ukke0sE
X-Gm-Gg: AZuq6aJbu0sPAlaCxu1wsc/GMEdJTI778xbaRG9+u/Lxatg7gkZ+DNNaFS1FM9RNUpm
	z35wX49UsbAsQzqqDDUz7vpW6xLjVCg0YC0DQX/aeCGwvOttGeRbRHZodeLAqbNTVXy8u37JkNO
	dvyJCCJzO8MA7tCKyMxdwUwIt3Wsw8rx3ov6eY2NjA3qhzQzeKfGfgZkI0O8sJhPjtqDhjMVrMc
	5yanirfm5u0z2BexT+VLtYIFjyEavvJZkOgBpmx2jdz3GMShPtWJCOk4QeZieblwNlxllAIUheP
	Dz/JU4QboN7FXq7XSyw+JDLKy3X/DdKfsmQJF5vo7nbtLNXrh8eWxF8mJCRQZJxe9pe/L3iRAsS
	D8iXwCyOjBpI+1X3gXJFhZVL2G1Xg8F9bixn2jTS9xrVMD6yD8ON1ZO5RfA4Co3xSMNDOpKdnaE
	yUdz7tIBgeA8PyxAcAdaRQtdo6TksNC65SZ7I0CGXlFpGMQrco8TDi1gmFZA==
X-Received: by 2002:a17:903:2283:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2ad50ba9cdcmr20176865ad.10.1771421999251;
        Wed, 18 Feb 2026 05:39:59 -0800 (PST)
Received: from nickhuang.. (36-238-161-176.dynamic-ip.hinet.net. [36.238.161.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5c20sm142171455ad.46.2026.02.18.05.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 05:39:58 -0800 (PST)
From: Nick Huang <sef1548@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: yot4106@gmail.com,
	dory85109@gmail.com,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dongsheng Yang <dongsheng.yang@linux.dev>,
	John Garry <john.g.garry@oracle.com>,
	Jeff Layton <jlayton@kernel.org>,
	Chaohai Chen <wdhh6@aliyun.com>,
	Nick Huang <sef1548@gmail.com>,
	David Gow <davidgow@google.com>,
	Qu Wenruo <wqu@suse.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm: Replace ASSEMBLY with ASSEMBLER in uapi headers
Date: Wed, 18 Feb 2026 13:39:52 +0000
Message-ID: <20260218133952.5356-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_054000_883959_73F6E48F 
X-CRM114-Status: GOOD (  12.81  )
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

  ASSEMBLY is defined only by the kernel Makefile and thus not suitable for uapi headers
  unless userspace Makefiles also define it. Switch to ASSEMBLER, which the compiler sets
  automatically when compiling assembly. Reference: commit
  639f08fc20c92c2cc373b2b4d065185daa9633e3

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 arch/arm/include/uapi/asm/ptrace.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/uapi/asm/ptrace.h b/arch/arm/include/uapi/asm/ptrace.h
index 8896c23cc..f28cbd318 100644
--- a/arch/arm/include/uapi/asm/ptrace.h
+++ b/arch/arm/include/uapi/asm/ptrace.h
@@ -119,7 +119,7 @@
 #define PT_DATA_ADDR		0x10004
 #define PT_TEXT_END_ADDR	0x10008
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__ 
 
 /*
  * This struct defines the way the registers are stored on the
@@ -158,6 +158,6 @@ struct pt_regs {
 #define ARM_VFPREGS_SIZE ( 32 * 8 /*fpregs*/ + 4 /*fpscr*/ )
 
 
-#endif /* __ASSEMBLY__ */
+#endif /* __ASSEMBLER__  */
 
 #endif /* _UAPI__ASM_ARM_PTRACE_H */
-- 
2.43.0


