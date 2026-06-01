Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17836CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 14:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MrfSnj/PLsXTbxRf/etluSw853v8MTiPenNyLUiYWok=; b=SPBVWEa+GbE0HqxQhxKxWvz4UR
	VmdbBTRRWUL37hqeXnaV0j/5CywWKrNG16Xi4oCc7o8BlDrA8o+MvUhWgg/a9Y+t/SVorXwq6QjV8
	VBjuo6108v/qfoTudT8vWNxAXTY3X0CqvWxSebaX9bCzau9jH7+/L+YSX8ilIbAOplm0DtG1c3lbg
	DDuHZQ/qTLntSV8M7yYTNE0O3SnDz1YtApSUQcwWSSFED6SWyYfIhPBCZnNL757H/66Lvk8JuH7PS
	bo9THLMUiw4152u10cQOIdgoUrACa/Sk+ALHfdOHALuMo//YKSSOovf0+F2K3poSeEDfF5f3S9iHS
	MI6Ck/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU41H-0000000BJlM-0Nni;
	Mon, 01 Jun 2026 14:53:35 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU41E-0000000BJkJ-432C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 14:53:34 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8422a92b6d6so893576b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780325612; x=1780930412; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MrfSnj/PLsXTbxRf/etluSw853v8MTiPenNyLUiYWok=;
        b=bCI6vjY3eJf/4GXn2xX2rLmLZ0PmIvHtjI7GGohIdtZUIBctP8MYXVmTHHtcsQLrwo
         SMUa1vlG8tkl/ROayQEBxKAlkHy+IfDIT9EheDe9ChnGgGzJqP6HM5c9h/M7Q069NEh0
         zA/Q1R5pvtf24qpBt8ZC93HBh0hjNmFQGm8et+1Q7rciFAOKYiFa1S703rktTmhFspLW
         mhKtZN3tPbkTm04NjhJbK29XZkmNOysd5dVAFO0tqDSVm4MUrMEq51exCRpI/e3Nj1Y0
         vhFN3RXE6LeDljBR7UmH08c7CG17weJF56bE1rrnctq1CvplIGH/jpgThXUYo3d8KmYP
         955A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780325612; x=1780930412;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrfSnj/PLsXTbxRf/etluSw853v8MTiPenNyLUiYWok=;
        b=HiTJohBL/8OULfn25vt3rADcWD8F/wQNgS6vpHLs7jr0ui909puTdv5YBvUUbovfDA
         DfCwMZdFERXL+6sNRkdoJgJy1JAOSamZxtY/FQjd7S4EF4bni3JnHX9t1mPUmhuPamyX
         isZS5SrZTGVn5PuKTgM1aetZtTaOus7S9NljHp5zwzb4AMjA2Wa+nODHjpE5KKpzwxA6
         pYiZNFA0l3NKErOEZOiP9TiRbEpdM78AFkcprD892vbOmWoEXpMYoZWdo+wFLUztK9EK
         Gn7aU09PQA+tdhMxYo1EoE98nX7ZjPq/Zx5GVtvfSY675H1PpvO0xARFpeUkBI1OfXw8
         yQDQ==
X-Gm-Message-State: AOJu0YwHWUbTCncfLoK+0OFD+2YcvKHFgWMe2bo36OGHoxnRt7HnDRdy
	SgvPzGvUh192fH/80QEcXG+PMWwajTB3aFibdqIiEvCsj15QDpvHsd2a
X-Gm-Gg: Acq92OEA3ktp4xT47/qxdLsAkJfbulBqgA/JKVUohUW68p8cT0bykpc2mXUaJdlveXe
	dakaCmaOOW1q8/5BVJrmFKaY1FbSIvv+2xiRq1bhSfxlGAjx7lmef54lnbWaPIpLpR1x718u3j9
	z9mMNTHv5quLYOhu6NIq52PaNRQ2rFbW9TcMF1U9U5HiBVhLsSqotwzIp3Lop5ZfQU85a3ML1JY
	t6Ehv9yXEZPZ3KyjspoQCJuQrZuVR8U5ZOVMhUlEc3q/SRih6+8hJcRQnW3tDTGpL6aMKn9WCEn
	iKGDjpTDbpJbLRFvEYnDWsd72813QxYJNCkktlGYL7OIo3AVBG6aT4y90+bA0EYniGQ6BZ911T4
	fomeJnOBxqPkhtznxQP5Kx7Ti5EXfTIa11PPi2nMPCZp/aVaZrTyUnAwWWeokFYKKiN1xMdSq8v
	7nu40VaLYtzW28uB2qR477M9xPlaedM4FO6Pzu9nvGpS/KyvmT0NnIKg==
X-Received: by 2002:a05:6a00:1310:b0:82f:51e8:b38e with SMTP id d2e1a72fcca58-84210c54cccmr11705575b3a.24.1780325611586;
        Mon, 01 Jun 2026 07:53:31 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8422e712309sm7686388b3a.59.2026.06.01.07.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 07:53:30 -0700 (PDT)
Date: Mon, 1 Jun 2026 23:53:26 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH] KVM: arm64: vgic-its: Drop the translation cache reference
 only for the erased entry
Message-ID: <ah2c5lu4JbUg7dj-@v4bel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_075333_005513_2209E67F 
X-CRM114-Status: GOOD (  17.01  )
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

vgic_its_invalidate_cache() walks the per-ITS translation cache with
xa_for_each() and drops the cache's reference on each entry with
vgic_put_irq(). It puts the iterated pointer, though, rather than the
value returned by xa_erase().

The function is called from contexts that do not exclude one another: the
ITS command handlers hold its_lock, the GITS_CTLR write path holds
cmd_lock, and the path that clears EnableLPIs in a redistributor's
GICR_CTLR holds neither. Two or more of them can drain the same cache
concurrently, and if each one observes the same entry, erases it and then
puts it, the single reference the cache holds on that entry is dropped
more than once. The entry can then be freed while an ITE still maps it.

xa_erase() is atomic and returns the previous entry, so put only the entry
that this context actually removed. The cache reference is then dropped
exactly once per entry even when the invalidations run concurrently, and
the behavior is unchanged when only one context runs.

Fixes: 8201d1028caa ("KVM: arm64: vgic-its: Maintain a translation cache per ITS")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/vgic/vgic-its.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-its.c b/arch/arm64/kvm/vgic/vgic-its.c
index 1d7e5d560af4..1e3706ac3b8e 100644
--- a/arch/arm64/kvm/vgic/vgic-its.c
+++ b/arch/arm64/kvm/vgic/vgic-its.c
@@ -597,8 +597,10 @@ static void vgic_its_invalidate_cache(struct vgic_its *its)
 	unsigned long idx;
 
 	xa_for_each(&its->translation_cache, idx, irq) {
-		xa_erase(&its->translation_cache, idx);
-		vgic_put_irq(kvm, irq);
+		/* Only the context that erases the entry drops its cache ref. */
+		irq = xa_erase(&its->translation_cache, idx);
+		if (irq)
+			vgic_put_irq(kvm, irq);
 	}
 }
 
-- 
2.43.0


