Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D23CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 01:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cptSsXqI/UivlQpF9joiYDD0ojEAli2L+9Rj+BglolE=; b=de7PnX5T+A/C/Yde2hMM0SJQOe
	oLuxDTDPbriWxyTecZCvpzyO+Wnjkvpsqwg2lsK1S4FXI/MY97/RQdrWSjo9/JjfA4FRn4drWzyOK
	CG3s7Q0RgOhQCSE+qwrcs/IpevlyxaWIMWbgOwnHkER4iLegTt1dF0uWL9cYoVClxI7tFO8wgVM/b
	kld5UTZxNAH5I+byu0pqFv5DB6wxr7bUbXsquC7uiQmgVzgQ2oVTCPuoGYGvLLsDXYPnhE2HKf7/S
	5JPGWP8ye4f/ic0mDc/Z120KDFHg+lbc+RfoeDnwqpVk8LrTDAZGnFi7JEA1WlfDye1sSkwZ31n4s
	Zm1Jx2uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmpb-0000000Dq1x-2UrZ;
	Mon, 18 May 2026 01:31:43 +0000
Received: from mail-dl1-x1241.google.com ([2607:f8b0:4864:20::1241])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOmpZ-0000000Dq1R-0NL8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 01:31:42 +0000
Received: by mail-dl1-x1241.google.com with SMTP id a92af1059eb24-133466cf955so7579075c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 18:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779067900; x=1779672700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cptSsXqI/UivlQpF9joiYDD0ojEAli2L+9Rj+BglolE=;
        b=AXqPMdfNQ4di/91E/zTuz0RqCnogfYiTis10t5ofSNE69ouVmHVVMDwNPT5EBMK0pf
         0FnhjrY0ETHpsu8DznYFZjCLlGYNDicvyTuMKOjvf9wF02360f9OAdYepmIjA8Isa870
         ftT1188uV4IsbhiFIGRBzDdI7bvcGVyI8BmBKHTvaa5LstJVVM/i39RvdPmZme8N3exk
         78YKHR1TSSu7PFoM2hQka9DerSBFLiM71U9eJqECvn8Lhea/6li5oEq/IR6k19edpdtB
         MLcLRRkDhB0nnIlAtQacvWHw6MqqgAVGDsMCHzsKr7up++YUbn9xZjxgBRWrvuP4aiq3
         d4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779067900; x=1779672700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cptSsXqI/UivlQpF9joiYDD0ojEAli2L+9Rj+BglolE=;
        b=Pc78jo8cy/im3ejQsdhcdyeYH69Pe9pdmGO69TY4yxthtCo/QD5BGSe/n0x6Yb4+Df
         KKryWlH5eHe8EItOS0JdnYDQsndf+lCGNqE6nV618PykxPxwj8L4oM9gXVPmvfpB6oYq
         i+sW2+qAUJLifsB3ZJ9N3f4X5iUIxbEgu7tzkq/JLqSZh7+Uy7G2HKqASwJiYbCVOVOU
         dRb9azID14OPZjpO0aq5sKiZZ8V6UPfVZmF2QD5NNFlwCRJ9Yw25qQLJnSJ7qQVhyw2g
         ++KDMk7UXTRP+COwg72sAbzA+PWibisdxLOWSTAmAJfjxF3lDjmm8K83DayjHF4IcmvY
         qznw==
X-Gm-Message-State: AOJu0YwuTbik/X8kj8GXDynbmo85T1COszfsvk+uZTzC5ru2/yg7x2KL
	1xUOQx1Rz/PRXhRW9+KOByuBH6WCp+sRxunh1meRd4Z3mKxeHQBddjAYYfbG1WZGlpU=
X-Gm-Gg: Acq92OGo60NLZpsHn8pv4hBvZjljt9e4SH1zcCrmAr95BDG7FSVsh4R5EoxPQ3uGAiz
	FRcy0othBJrq8D0z23e6CD8TMvjwGaX0CFdWYkwLqDJsEL5VnBvFiXKV/HMb0NXQBKIe9EyBLbb
	fbrOa3pGQyIOn+LSDWy7JZX6SJw1myQ8dRbb9l63RC188DDQbiO3pMrVMbQsMr06wcIXdza/uBi
	WONhg/M2IO9LrOhFFYV10lQDylTQSM6FO2zRaaCg7QO/KsoS6U47ZLLJFW+K9WMxnORgNm8ArAy
	Qm9ehJ2K1dstXwIizzngpVm6LfSB53nfRjpSihJqWju8Z05XMiAQzbQtoy/De8rUFRLGS/Cn7Ll
	gBITi2YO+cIqc4OAs4j7yuWYQphlCLnTJ/GJdCxQ9XFfQAEbk4fPz2svCCxFErgIl9uAhwMFsCi
	11ws17K2b480OZUip7mdfZClrm9xc18sShXek0WXP3kSHGSdt69T3iJFzweTUKexZcZgejW4K8C
	ryg/b+EsnGSZW3MAszjxu/YC2gve+6ntMmp9mqeAvJ710Y10mQj0gZF//3iZpLcXWdRYojMQjgA
	xIDb1H9s67LDblC7TA==
X-Received: by 2002:a05:7022:60b:b0:127:33e0:ea44 with SMTP id a92af1059eb24-135049480a6mr5347850c88.29.1779067900077;
        Sun, 17 May 2026 18:31:40 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm15780437c88.15.2026.05.17.18.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 18:31:39 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Kees Cook <kees@kernel.org>
Subject: [PATCH] ARM: kprobes: add missing MODULE_DESCRIPTION() to test module
Date: Sun, 17 May 2026 18:31:29 -0700
Message-ID: <20260518013132.130914-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_183141_134354_BE693727 
X-CRM114-Status: GOOD (  10.51  )
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

The test-kprobes module does not have a description, which causes the
following warning:

WARNING: modpost: missing MODULE_DESCRIPTION() in
arch/arm/probes/kprobes/test-kprobes.o

Resolve this issue by adding the missing description.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 arch/arm/probes/kprobes/test-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/probes/kprobes/test-core.c b/arch/arm/probes/kprobes/test-core.c
index 7a2baa135f0f..8da2be47b13b 100644
--- a/arch/arm/probes/kprobes/test-core.c
+++ b/arch/arm/probes/kprobes/test-core.c
@@ -1663,6 +1663,7 @@ static void __exit kprobe_test_exit(void)
 
 module_init(run_all_tests)
 module_exit(kprobe_test_exit)
+MODULE_DESCRIPTION("Tests for the kprobes API and instruction set simulation");
 MODULE_LICENSE("GPL");
 
 #else /* !MODULE */
-- 
2.43.0


