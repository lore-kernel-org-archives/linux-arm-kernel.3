Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACC2FA1FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 18:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Uyz6tSF+oy1MloiWLm1wGiTPmiCDVtWICeLWrJM81rU=; b=1RRajQ46Kc7SdsbKcNwK47ALYi
	73hNN1OoPRf+r9meEIUOeea7EdCMT5lksilKtFnkLOiCIqKJYCqIJpinFQjfYjdse0danaBTNZzwZ
	VWtpL/lkLhPpvXazWvbyROimG0zc/LTCqxTz7cBcBtYyXErPXBxJzRnO/FNyIPDsV8ojpU8yZlV99
	+aCjO49VyLm8iK/SEN+jNE+O3f4EqX9OhV3/F3uUMj4D2aDVTpTrxlitPGDqWo2oUlM6V0hDPRswK
	OmjGA9/uPW4lIV+kBiOtJaP1FDdsE3LLLleaURvwMnZnE87tGMj+fu5Jm6L7A24xprNyF2aSfud5K
	5KwEMDAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc53-0000000AcEP-1eNU;
	Wed, 22 Apr 2026 18:13:45 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc4w-0000000AcCs-2R0u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 18:13:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so71845565e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 11:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881617; x=1777486417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uyz6tSF+oy1MloiWLm1wGiTPmiCDVtWICeLWrJM81rU=;
        b=oIVAvtippLY7KyGEiN87Vl50ERUYUHxtJLRhgKjm250A9Mf+9r4e+6W4zlSOUwbPRH
         tcu22XU1rj9UM2UIZGeIBbzERv1+HyVynaIiM/TJUfW8eUw+5hfTg0opL7EGlpqxT6OI
         Lv9ox54J61b+HYC9ejZgyNBbt/IvSYqmpWI+O0hTmqchiO2S4zF3FGpGx+JyP1SHYvwf
         LCohib31VxZrkmoZpDhKbTDACKhUpNzAXiAKXUegIm/ggWhzAbSeMaMBUaXAg04sJZav
         3I8jhtvJesJg4WVruuDPB21nXPX9DeAViqnPB0R1I6cMinJb2XG1VMZGmjbhusIZDaAV
         1ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881617; x=1777486417;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uyz6tSF+oy1MloiWLm1wGiTPmiCDVtWICeLWrJM81rU=;
        b=qQsVeav4DKdlR+Uts4KnZMsPihmeF+6FwRMnSx07x8WdDYDwyvpocAUEFo88f6A95F
         XhEw53JTFqFlexx9I7s5U3ti9/lVFEeILxDh5coej3yAgFMLrmM8AVdLAhsmsScI9mVQ
         UtTcIi+d4t/pOUVyjCMXTrbkPnWmGJFiz0FS9VJHLAtPUWgaY+uCHYE20RcjBWx6O5tM
         JGPMn6UYRVD9iuXe/5KfrbSLLEaMytIqlHdqeOrkzDhqPcSxWgjHYEVJhszlClRINCSC
         0Pd5R6qytyNyY4fHNfxDhy3pVJYkOmr2N7iyWnvPk7HcI64chdNQr9A63WL2OPRiDDkh
         iuzg==
X-Forwarded-Encrypted: i=1; AFNElJ8P/W31ry/8K9tDDwP4Xj161+p5Rxh2CG7TdSWI/B2LJhWMyCYUubt8TfnqRH6+u76flq/Vvnfkw6bccsIGaQ9P@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj/xuECggpw7QTPPNYZKW3+vweZPEpYzan+dFa7QP1UNRc4N9X
	4F+GBfQk4Yq72+kCy7qa/Q/ok72DK77UvJeNxr1fth6ynJq8iJR+Xxw1fxk2Av6NfyW+GQ==
X-Gm-Gg: AeBDieuI1grsAbss2FGYfCh+nJRnJ8elyxZlDbeD0hqzvAIG5h7H+1I8Fkfbgk6IVnY
	0eLLzfxOutHm+Oz0xOeBMBB0PLKnCse44bfyvcwE1Bw0EPuoYOvJE38TpTpkWS+ttsWHGLBRj0b
	f/vHkJdKzXqj+GAxAscgBCoJlCqaJXatZwqcNPJMHm+i+JETfHdANcbzuSuZovAybui+hjMqFcq
	jJ/Wtdgm+qKqDhu9o1lya2DB4FTmJP+MJ82w5gdZ7+ZKbJu3Mj6vtgYSNC2Nf4iEK2UehBNJhVb
	WOAjv4oG/ATjdD3Lof2tJ9eDVMzS1Al9cb+eQzVG7z+EBFjmdOIez0UEHaTbfJkkelHldEt1XCl
	80t9zYelNWQIJbVXqx9YA98WEnBdgy18ZG61wg3gxMcopKrocWIfe3ee+0fYgvuI9rovjrnUksW
	z+eprFWyrq52p75VUleIoM350kIWzHezIfwCNN
X-Received: by 2002:a05:600c:8115:b0:488:8577:d9cc with SMTP id 5b1f17b1804b1-488fb77faacmr295680905e9.20.1776881616583;
        Wed, 22 Apr 2026 11:13:36 -0700 (PDT)
Received: from ehlo.thunderbird.net ([86.1.69.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb72d365sm232234915e9.1.2026.04.22.11.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:13:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:13:36 +0100
From: Josh Law <joshlaw48@gmail.com>
To: ardb+git@google.com
CC: ardb@kernel.org, arnd@arndb.de, ebiggers@kernel.org, hch@lst.de,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-raid@vger.kernel.org, linux@armlinux.org.uk
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_4/8=5D_lib/crc=3A_Turn_NEON_intrin?=
 =?US-ASCII?Q?sics_crc64_implementation_into_common_code?=
In-Reply-To: <20260422171655.3437334-14-ardb+git@google.com>
Message-ID: <E9489A63-1EFA-4AA0-BD66-6E4066F01C6B@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_111340_521955_41784607 
X-CRM114-Status: UNSURE (   7.81  )
X-CRM114-Notice: Please train this message.
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

Hi ard.


diff --git a/lib/crc/arm64/crc64-neon.h b/lib/crc/arm64/crc64-neon.h
new file mode 100644
index 000000000000..fcd5b1e6f812
--- /dev/null
+++ b/lib/crc/arm64/crc64-neon.h
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+static inline uint64x2_t pmull64(uint64x2_t a, uint64x2_t b)
+{
return vreinterpretq_u64_p128(vmull_p64(vgetq_lane_u64(a, 0),
vgetq_lane_u64(b, 0)));
+}
+static inline uint64x2_t pmull64_high(uint64x2_t a, uint64x2_t b)
+{
poly64x2_t l = vreinterpretq_p64_u64(a);
poly64x2_t m = vreinterpretq_p64_u64(b);
return vreinterpretq_u64_p128(vmull_high_p64(l, m));
+}

Makes sense.

Moving these polynomial multiplication wrappers into their own header is
good. 

Reviewed-by: Josh Law <joshlaw48@gmail.com>


Thanks!

