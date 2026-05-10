Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61AD6CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 03:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qc5NT5IXkhJsjQA1erva8aqQdunoZ6negO8wYIJysls=; b=090UdMpWMTITm9eUYmIjP99Jby
	8HoswWctoyj7eNNnoSy7TRijgIAl1Q6cowRvdD9ukFpP/0UvO+yx/rpM72FdPj/miAGauldqhh/Hi
	QGtah0irhw/36OTrbUEzWe8o5iQdIsY4vt+5wMZq6pVUwQiIGUR1wVlM17FiUinOoiTMc8xaLJu7o
	KjoFpQ3sX1RnMPgXuEI8VeL/5sDgSFmMtmcXTbvuqaqZgZ8DYQ84A0CwKzQzgv+EgsDnN5nN5abPW
	YJIJEgq0LWFb+SMNKzsEU0rHQHoSrbTfFx6/VAbpaoAY4Fryd2oD56jmCVkB3FhDxtDLIpfaxriwL
	wol1GbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLulq-0000000A4eT-3Ibi;
	Sun, 10 May 2026 03:23:58 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLulo-0000000A4dq-37l6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 03:23:57 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-2f0d3e07e30so8320339eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 20:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778383436; x=1778988236; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qc5NT5IXkhJsjQA1erva8aqQdunoZ6negO8wYIJysls=;
        b=MG9sljwqzhjAbFre2OhXHOl4NXO9939f+C0DP4d6WmIJtZ+bwh/R3FMycHZSgeHkZt
         g9eYWQkBPjYqAeZ0AfNnWfSlnsw7fknsM+tI8c137QnNdt5cgQ0WbM1FkuDpHeopmYye
         c2Wf7mVAKJ+ezV05dkA98uGcQKS+kGjXhfc5jxv9MInmx9+oz5Bqnr5YTaKoQwU7ot4c
         CHJJN3RGI6eEly8SWKuMQYC/VPAZ/hlZc9TPwSgUx3OJp3qrCT/JIpgS9yHCCM/vhprT
         2w9pIrWsuzExbm6PHKiRsyjfpJ6DO9cZdxuN8ZrruIy+38/PqFFZj8ZAO6lfnSSDv62r
         wAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778383436; x=1778988236;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc5NT5IXkhJsjQA1erva8aqQdunoZ6negO8wYIJysls=;
        b=Dltl7SrCA9SU3CWsd92r5cAJozDqxd2ohmmAVPV2oqaYICTMEAzd4EL6Ym3i1ZQ7S6
         Qe0FDpYWpLqu1+iM9tvx5UUK0ZsiENYYpWO+Tp21QvnyJhoExPy+q7JoMVcJYttwDezI
         YgurTXngnBq7Zo9schzfP7dMvw08yWQYjYNjWjrkjo66mwMRwvLsMq3BFg3tMcho75VQ
         wjJRmKOl42+ho760Vq9+ShaKI9GdfxIyA9lOC87zrKYQKnrWiZCTGI58hLIp6lJIBqYY
         w4rX+5dGZty8x0lANYfjSbedPCuKwWrU/FwLjdIt7M97IYM3XnYfUC362AxC80Q0k3Yu
         nfoA==
X-Gm-Message-State: AOJu0YyHANLOx/nfmeHEPj4+clo0DzqtumRgbUzm7aeun7+5vzjG0PPl
	AjG3xVkPJH/PGPIgNlfHAWl91NXK8iyGrrPi1Jj6CW7N4fPwxdLnR18feXNqV+DWXvs=
X-Gm-Gg: Acq92OEVwiuEg8tLO6iMjnjboBQMOdWIDYKHVnqawVxVSx8qggtq97ioX6l07jIT6C/
	0lnpcxLzp74p6bX9AdTwcL+hdSg39+OdruzEhtuxIBzuRLhXh9PdpzwidQCZyWhhsELqfYDuU0M
	iTX4VXXR52qt6hQ5Db2fGSUFSyHH+TgFXUOjyUNu5fthV0ZVZTOvXYOqbYhmEYrFOzMys2Rm8Yo
	bJo8wE6PeT/rJ5/dhwyg8xYV+lSbqCAFSAJLFcgRzt36B8JFXL2qbc1cpYQ17eyzaY0ggOawyLJ
	SXgCi8V0AWDy3G1Usl3QgBQYQ/vqcRD9IweRuZfr5joccIyv0YSLWg/BNpCZ7yY6TTXC4b8sOU/
	og/vJ0RfRdM8F51tRwUzNmpDGl5UVjz3BBrpGacCgys/M2GoUSxeOX7WxOGjuCkv+5HWMwGRazd
	WHyPFBwLtE6jYWLUCOWkKNGfWLP0nW69XwNUrQYJbA77Vc3hY3wlQ62Vq1Z+F91KxQ26vu982Ld
	xCMPkwix7Gxw0vfcSIaEAwsQVXpALE3gokNcj0J5oSBBN3Zns3u5aRchAbJqmVFrp4Zl0506GFa
	rrqwdYTdSHNNX+MtPA==
X-Received: by 2002:a05:7301:6790:b0:2da:44ac:6d0d with SMTP id 5a478bee46e88-2f54ac74af7mr9679514eec.20.1778383435804;
        Sat, 09 May 2026 20:23:55 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8893441absm11135034eec.31.2026.05.09.20.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 20:23:55 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Ian Molton <spyro@f2s.com>
Subject: [PATCH] ARM: <asm/floppy.h>: fix build with sparse IRQs
Date: Sat,  9 May 2026 20:23:51 -0700
Message-ID: <20260510032352.269127-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_202356_787316_D289551B 
X-CRM114-Status: GOOD (  11.82  )
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

If sparse IRQs are enabled, <mach/irqs.h> is no longer implicitly
included when building the floppy driver. This causes the build to fail
because IRQ_FLOPPYDISK, which is used by <asm/floppy.h>, is no longer
defined. Fix this issue by including <mach/irqs.h> from <asm/floppy.h>.
The only machines that select ARCH_MAY_HAVE_PC_FDC (and thus use
<asm/floppy.h>) are footbridge and rpc, both of which have
<mach/irqs.h>.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/include/asm/floppy.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/include/asm/floppy.h b/arch/arm/include/asm/floppy.h
index e579f77162e9..4fdc3f633b1e 100644
--- a/arch/arm/include/asm/floppy.h
+++ b/arch/arm/include/asm/floppy.h
@@ -6,6 +6,9 @@
  *
  *  Note that we don't touch FLOPPY_DMA nor FLOPPY_IRQ here
  */
+
+#include <mach/irqs.h> /* for IRQ_FLOPPYDISK */
+
 #ifndef __ASM_ARM_FLOPPY_H
 #define __ASM_ARM_FLOPPY_H
 
-- 
2.43.0


