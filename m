Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38248C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 18:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u1mefYIOiMLZeO91w9ATRUkuvXI2RGubrhxyQj9n/Fk=; b=wH7OcqxDHRL1dSXyxHniAcCU9R
	+fOeXh5n60OUOvG4yMhdfIuevB0nRbonQYHHkajacuqHstjmiyIJY1JXA8TeXqeoayD9HmnO/7K9V
	35v6XLNSxViubKyG04UQH+MMPSD27MzFEgYnd758hXY6L/WbblC8YCii5MjehsRUW91nh5DQ6S5Cr
	uvtYuiGAeOfIlW8Si8xmh2c3Wp2Jtz3R4ZddxJCW7f83Jcm1LwcPY4WO1AyPX2JWcxf+Q0mUT/YE5
	+2OkSD8YuACsjz6UMZN5QthmfwU/o128Xv+2OD23jOXqA5r6ilCmN3mb+tT/cEIrbuDpJJAvFJ8OA
	okeFtZYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuE2f-0000000Gpe9-0RpF;
	Wed, 12 Aug 2026 18:51:09 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuE2c-0000000Gpdf-19lj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 18:51:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-480033bdcf4so760384f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 11:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786560664; x=1787165464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u1mefYIOiMLZeO91w9ATRUkuvXI2RGubrhxyQj9n/Fk=;
        b=UcfuOaYM4QuzSSF9/jUhmN7bPpv0WblhAYP1dy2OhhUj3KCpD1Jx7CZJ5ooOhZWt3g
         K7VEhSFRq3xIVHhlMMk1/B4ciKyjzX4G7yDvDtktMXhdFYV9QKz2K90lEB+LNsLmITWY
         Jlz7TyamenOGrDjw/k/B5QGQqAyAEO780No91V4cjfekKN9M0bMju8VMuHWXQ7u0cRjT
         ve3BSEw7fFPpiguTIXQfaVNs+YQ6p7vd4eJjf5DXhRbcP/4AisbIalBZRfz5d4WbeVJM
         NlYbDdn87kYBMgriSC/ruX7HP3lIhLn1sL7gZ87lkkYkiZyam+7tsxtVfBCu++F0GU6W
         BUOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786560664; x=1787165464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1mefYIOiMLZeO91w9ATRUkuvXI2RGubrhxyQj9n/Fk=;
        b=bx3ZqDug5ce0p+evmdv83sJvjmiougOKK7y+6auXJnh5iW1do0ZkReBe83X8MJ+xYQ
         sqs1V1aGNshDmRsn28jqqJqrpoY6KWgn1XDszvjbyZ2holKANB/ENIwm4rTLOw0YoysN
         5gW2voLWIYBXPGcgMXcf8UF7UympaSErRBtnpMV/wEpyVZYFLgpbkQmmAUl6CrMpydJR
         sZcTwxJKYmnfWMyta816ozP1PH5FmeH2GYNcfuYuq3cT8F9K+lQCb8B4DxgExQh9Rg5u
         XyGOmRJMGkivB5xKzcjw5+3HFpNFdM1Yd4gHsw9qeSFcBMbUneuEEpmxYZA7Tp3JI0Bc
         RVuw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6ihBa9tgXIJdPXtsCGdojMEJGMjVs2BgSlQaYwQjbJMfQnJ6fyOI+y78Xf7eqtqO/4FZDsqbIRgmmUk/2FOCB@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbubpe9rB3oIFjKYQP5wu35QgmYqyf29g7vUXEwqvSfn6MBsOv
	rQZ8G0CadwK2oCyOhqpWN0PTuT6U/3hdz5JNQw8E1mnjkAgIHop2WsvK
X-Gm-Gg: AR+sD11VT0bxr9CI/yHiIQuE397yQTzHnSMNkt97+I3u9ki/vq3iJoMKCn4OXBI9NwY
	nrddf49sPnlR4oDgW3IAn+3ivCJHlEwddjha4Rn1beagp1EKYWmSnsKQg/SxSHAp9rNTko1uYgc
	OixKKVWWWW8Zepz0RViwoijt4GatkzIEtmnQpARmjJCJ1gubXSK2LtH7IBtc8b18FZm+9bElNez
	rQFZ2l6HS2liDYRG1CLCRllQgRGNAzfNwrOnw2HaYDj0PV1/eMN+1DI7+eiIuY2cJVsisSmYwep
	ZzEy/XA20nrRXPUPmypRw32PoMxrfuDYOzAfU7oVf0nO8Lz8iMzTYEn4xwTx0aGHGRtlVDNzMn5
	mu/7OFakMGdjDLIXg6dfpNUvaMABodN+uOPo+28p4D7DLVPLSKRVBa7oFmaSHzBqLOao28KJInh
	CUOaY8fS2dva1aWIpspookheqmwwl723YnaijJB2FYvG6W3Yw6sz8Xd62UI8CcLBFv1J/gEX1h8
	E9HGdera/9AWp4ljlSHVxNDG7uTlcuEs/xuoVrIKiX2HLhO783ZoQRbVA8M4M257pCds65e9zEr
	OEVviJJu8La9COEGslrWuqIbjDIZ7hZmLu4SQA7Wqznl21mH5BLZjFUhqAin7AfHJuvo
X-Received: by 2002:a05:6000:41d8:b0:47f:91e3:3cbf with SMTP id ffacd0b85a97d-4815a01c520mr318407f8f.19.1786560663566;
        Wed, 12 Aug 2026 11:51:03 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a869-c801-382b-4199-5518-da16.310.pool.telefonica.de. [2a02:3100:a869:c801:382b:4199:5518:da16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150c088c9sm9658029f8f.13.2026.08.12.11.51.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 11:51:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] ARM: alignment: fix LSR #32 and ASR #32 offset decoding
Date: Wed, 12 Aug 2026 20:50:57 +0200
Message-Id: <20260812185057.1573-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_115106_329154_AB8148D6 
X-CRM114-Status: GOOD (  14.50  )
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
Resending after two weeks without feedback; add ARM alignment reviewers
to Cc.

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


