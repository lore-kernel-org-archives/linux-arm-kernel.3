Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C230AC53200
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 03:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OK/g5zQQ4J4Um7CRkdUJveOvFv8pGEN//adTAyGsWTI=; b=F27aI6HFdVBxZzrTYdzajIYVQE
	9obq2uOsKvl8t4sNz3+Pwv6gTMajjI62wZG6iefi6x/9tfSiCXWvuo0veFdhhBPSWFb7ghGLdfD9B
	yVy+qHaJjfvJLGwH7tKF8HsHR6i9UZ7e7NPLLoVVDCjteIbmb62q1209sWpohnV0/W/j49kmJC+FK
	G2NjZN9C/hLDTEWplS3kCfL+03D72clhTmAkzWO+/AaTE6h6RuYZf+nJiGpGxfGarNTcs8agX9dC+
	0gAYOd4K9MSgNZ9HDPvWMfybKgGuI955hbs0VGsRRSIFedAfTOkxZjEGd7nxOkN9Zwm2vTBmmtqM/
	S7FF2V3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBgu-00000001r4R-1UOb;
	Mon, 27 Jul 2026 03:07:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBgr-00000001r43-3nzN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 03:07:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso1084880f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 20:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785121660; x=1785726460; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OK/g5zQQ4J4Um7CRkdUJveOvFv8pGEN//adTAyGsWTI=;
        b=gSsH2rp/nK9nAXgRsC9L94s8XdQ342jJJTW/JZkFVIUEDQleTPKmkv10Tsrp6oHinS
         WybmGjv0md0W4vYIv8bBCvQzj7ZAdHbB4L5K1omDHZO8HaCiVrephJ1RiMR/OUkJm8z6
         s/+7Elzf7YDfPnKEMzkjgWBvD5y6TjANAb21gl79QOslxz/BUIDucQItAjosQIPtrh5U
         e/+By8PD4VH1gVaptxi09Ijvoakg51f96h9f0cyg2uyfU1Jvk1rXw7MzkyBMbLQKGxfw
         INBGQf8XKSjeWBzJqmlRFXVLiPy3/JZcz0/ouS4jtfuXf+8ZOliEzSnWZ3MQ72ZvhyCp
         gFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785121660; x=1785726460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OK/g5zQQ4J4Um7CRkdUJveOvFv8pGEN//adTAyGsWTI=;
        b=pQUPE1aO772333WEUZW7qMtkKYVQ3OQDh46llt5OtOwQV+NWd1QxMB8zSPqwIrbxsv
         lpr6WzcH8lcKvWDlyF+jFm5BSy/7q3RYzCsq9ODN6l2vJ6fC9IFA82X3NNpVs8VCZCJQ
         pDlt2rMWrdY5lqTh8CUsQ8lZBmmQ4D3cVOezbGYsILV42ZdkBilamAx0noqoAK7mZ0y7
         vGY2k2WRU58NO+mfpzd9KbeBNNARxr5Ash/zjNzb2CAA6SGuj19g/PyewsWwtDGQS0Oc
         8gBP709fAAAlyQQq7kpEG0uzDfxa4vcuzFQqeRBNAv3SZxeX2CeyF8vepxBXn0oSESj0
         PvAA==
X-Forwarded-Encrypted: i=1; AHgh+RrErhgs8e6bRfeq6a/m7j50HAbV1Q+VnHU1JdOmT7+SFnTKBz0vi60v/5I3v7w5uM2FPFk7UuV+/Ew7iU+SwdkB@lists.infradead.org
X-Gm-Message-State: AOJu0YwMuskX4IjpTwlFmdi/z00HB/sZ2yz2P48AHBaNKLWnE8vYmpPt
	1NstsKPk5sx1CBBh3P5OEgr87kp8IokU4EQuvpgwDHIEdhHTjx1vatBie0V3sbSB
X-Gm-Gg: AR+sD10Uni1MX1lVQdYTzwm+f7+wtdGyZ76HdsJU08puL8sCFOIL3IoaNHrqhc4k/7x
	COtbIav28QgtiGU0h39SJee4FtSiQwRivzXfFfAgBH5u3/34TKlq5wW3D9jKsAdCJlunbRtzPMI
	4vYMbxrYgijo1wbqZCiPUysHFImlULF3qpbAv0ntKlYZcZ59Ww+Cc/48XGMBr6p1blyTKPl6DfF
	1oTo9zAs8limMDmgUiHh4MF/qCpOViGMLsbMFakIb/ychOngIgeZGBmAVADlZehN9yPszvT1brd
	6i8fF3diQWOdbx3bsGV3L3coY+8vBViiwjWjszKqYnmZ4uNv8sb2rXU/zrz3+jcE/9r+C9fl+rh
	i5+Xiq8m5QFF5IXWjHKP9ovd/uBl8Z2n6JIp0mdDbsiGPns0Ii55xxYeDeCN+zoJ7c9shwNONCl
	vSVeJvx4ZYx7nVpl2pddOcWRXDddsPm64xOVVhjh9CwUBljAscryeThl0dZomv+Qq2qqh7FEsem
	KZz9ZKEeckaJedhM9/guERcQGTsUP+/bLhImB2b7exWEbzwFyAA5Pj0
X-Received: by 2002:a05:6000:25c4:b0:47d:fc23:abe8 with SMTP id ffacd0b85a97d-47f9fe971b6mr7701545f8f.28.1785121659618;
        Sun, 26 Jul 2026 20:07:39 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-116-215.95.114.pool.telefonica.de. [95.114.116.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm48770274f8f.1.2026.07.26.20.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 26 Jul 2026 20:07:39 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: alignment: fix LSR #32 and ASR #32 offset decoding
Date: Mon, 27 Jul 2026 05:06:12 +0200
Message-Id: <20260727030612.63740-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_200742_139241_1FB5C1CF 
X-CRM114-Status: GOOD (  14.26  )
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

The register-offset form of LDR/STR may apply a shift to Rm.  Per
DecodeImmShift() (ARM ARM DDI0406C section A8.4.3, "Pseudocode details
of instruction-specified shifts and rotates"), an imm5 of 0 encodes a
shift of 32 for LSR and ASR; only LSL treats 0 as "no shift", and ROR
with 0 encodes RRX.

do_alignment() special-cases RRX but not LSR or ASR, and IS_SHIFT() does
not filter these encodings out, so the block is entered with
shiftval == 0 and the offset becomes Rm instead of 0 (LSR #32) or the
replicated sign of Rm (ASR #32).

do_alignment_finish_ldst() applies the offset to the base-register
writeback of the post-indexed form, so the emulated access itself uses
the correct faulting address but Rn is left holding the wrong value.

Reproduced on ARM926EJ-S (versatile_defconfig, CONFIG_ALIGNMENT_TRAP=y,
gcc 13.3.0) with a misaligned base and Rm = 0x1000:

  ldr r0, [r1], r2, lsr #32   Rn advanced by 0x1000, must be unchanged
  ldr r0, [r1], r2, asr #32   Rn advanced by 0x1000, must be unchanged
  ldr r0, [r1], r2, asr #32   with Rm negative, Rn must decrease by 1

All three are correct with the patch applied, while a lsr #1 control
case is emulated correctly both before and after.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: Claude:claude-fable-5
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mm/alignment.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mm/alignment.c b/arch/arm/mm/alignment.c
index 812380f30ae3..49045e09ae18 100644
--- a/arch/arm/mm/alignment.c
+++ b/arch/arm/mm/alignment.c
@@ -892,11 +892,17 @@ do_alignment(unsigned long addr, unsigned int fsr, struct pt_regs *regs)
 				break;
 
 			case SHIFT_LSR:
-				offset.un >>= shiftval;
+				if (shiftval == 0)
+					offset.un = 0;
+				else
+					offset.un >>= shiftval;
 				break;
 
 			case SHIFT_ASR:
-				offset.sn >>= shiftval;
+				if (shiftval == 0)
+					offset.sn >>= 31;
+				else
+					offset.sn >>= shiftval;
 				break;
 
 			case SHIFT_RORRRX:
-- 
2.39.5 (Apple Git-154)


