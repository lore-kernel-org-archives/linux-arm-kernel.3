Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312BBCA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVxTmi5k40WI0DcLtCyKWH3QCS5Hnr6jxxODyyl3ffA=; b=rYhoUqZ1Q3I+HBrWiJf8dxtbFD
	zdEFsDtKOYD2bgtfC4/a28N2Mq8vnaJXqcXSKfRfbJmdHial4iqDGTGOL8sGLR23VI5+o8749m+go
	1Oh/MJxPt7e3qMYC/4Xj2Is8kcc3Kx+ZNK8MX4bDBEJ9Yuk2/KRxU8n01TDFCb0gxn9hfBM6n0K7h
	VsZH1o94aHhRMo3UCj0UOReYRJDb0PrSQgFhYu+cnYRO2aHr57MiEJs9HY0773QeTpxi2WBxD5UoI
	NCSWTIWDKaLveIUUzlY1vSVVV8ZJq2cmCQTSIkQtMxBWjDUk8RXuNiK1ZOr6CL6h5r8/t/P972CDt
	rVit95Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJi-00000009JUc-2sVe;
	Thu, 01 Oct 2026 13:59:22 +0000
Received: from mail-qv2-x0d.google.com ([2607:f8b0:4864:33::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHJd-00000009JQC-1wu0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:59:18 +0000
Received: by mail-qv2-x0d.google.com with SMTP id 6a1803df08f44-917a345a6a5so12964316d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790863156; x=1791467956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVxTmi5k40WI0DcLtCyKWH3QCS5Hnr6jxxODyyl3ffA=;
        b=Bi9wdLesXJu/SpxAaAAJEPgAZYT+srKQUP/gYwAfrx8O/v0sXi8slcIyLXQMaotpHb
         Orlm3LUHG4QSzsKKpYMek9bjgyscgU2WTeY23cxjKWxWu1ypE8Ze4SIZjcXbwrxtevPH
         J7e2an095qQCBDZiEYuXQyRhBJ5XSls7kytIK2pIG9IOox8K4fuV3RThNSAT+hFFX3DS
         qnpkrcx5f4HP0Gw3vY6a2oy70WMVerb+dm/Wp5Bxriusa2AMjizuPVxDqH3EBfiYsmbg
         y6yiY4XI2REiBgmAnILGnN5OS5glRzoyxExIyFWRDOPnk5yHy1oPydaSVb9AOWUKRB9n
         OKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790863156; x=1791467956;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVxTmi5k40WI0DcLtCyKWH3QCS5Hnr6jxxODyyl3ffA=;
        b=Bsf2pOA2VUmFMJabiQdoE6Qk42GTCGNH6bJt+SLhShmw1Fl51VQkqktHL7/PASq3I3
         TYzX7UWWp0ZY+ApSRFnGQXH6moeDbjImoSIXTGb7Neamz4H3+AaLAofNN7VRxQp/9rv9
         02NHa0oUZ1j+u/DecUERZDVPYwuyzZlU01qLwqrrThha/+pR5gfkQuazzPQW1jGSz53t
         Km7DT/vPikaIRZl0Xp3uYrdQbLBKJOphohKEyeH8Z3ONMFAgvax/x9W9PEz7DqK0BRsL
         VLnJsWM+q1djb3zmFoSERjRKeusuXsuXlrfSbLGvs/2L299xV9KgaMnwwwCVLoVKaLu9
         8JzA==
X-Forwarded-Encrypted: i=1; AKwUvBzk9CPOk04zz7tpf1DpK9+p2xLuIbIoP6iD/CJ83CFr62NPJqepgn9F3MCMGYOt8RTw/W6vri7ct0tUGqQzektG@lists.infradead.org
X-Gm-Message-State: AFuF++lDHb9XV66ae8+HYMh3/5nuYoc8iEfLjABpOgnScIndJSGsOQAe
	I+8ednkAdPtXCQApsHoHwUeGbdO8LFfmp/o4g7G/MTwAEk4dLRJq4cGd
X-Gm-Gg: AYBFou0/Vy1btjWHwRF69iLeDD40ILf463jU/Kn+lmI+ncnHpt8GEjc4xhcCPFTN8MD
	wK3x0Ykcxg6OFzxpaCwM8/oXlGUVFV0tRTNR+iZpI5pOAlpvWxUXiczr1Z/RIgPgqveIssBGhHE
	2Y3yya/r7EFsCjkWuaTSG6fzO/CVCprz4p+ttxk9dL4ZrQnR02yZ9pDDEAcUD4QYbWM7ZHsf389
	xWyYQpZkdq/+PC7Z1rhGXg29oTFDNArmeXDjlyHvehj8al+H8k1MyD1Lo7zf8z3iAadjKDu4ngr
	S0z2HLr/WNkHcafOSOKvQkAumiYxfbVV9Alg0FIoJ33v4BMyX2NzhSLexPOvoxUDNvEicGCN8Gk
	iMLmZCcEJMkgbXpzUnSdiSv6N5wJR9wN371RLWMt9rDGaQPrbayHbO+BoQsrqQVJbVACydAIWt0
	vTTA1KiVqGwCfdsKBZ26/6W5DKELHHgTxassi/rTL9EEHMBrPanFoWEHVsWV6/Qw27qAjBP3Jxs
	WtVSZ1A2uOPZdnrH11LMppBy6VqfofIRxcKUAgwiXIJ
X-Received: by 2002:a05:620a:2626:b0:93c:c08f:ebb with SMTP id af79cd13be357-93cc08f5401mr227577885a.26.1790863155696;
        Thu, 01 Oct 2026 06:59:15 -0700 (PDT)
Received: from [192.168.11.3] (215.96.231.218.rev.ocx2915.net. [218.231.96.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cc7093756sm10772085a.38.2026.10.01.06.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:59:14 -0700 (PDT)
Message-ID: <ac3e3fce-b27a-4d17-9616-48a70ddaf28b@gmail.com>
Date: Thu, 1 Oct 2026 22:59:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linusw@kernel.org
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@armlinux.org.uk, oleg@redhat.com,
 paulmck@kernel.org, ruanjinjie@huawei.com, tglx@kernel.org,
 thehajime@gmail.com
References: <20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org>
Subject: Re: [PATCH v3] ARM: entry: Convert IRQ handling to generic IRQ entry
Content-Language: en-US
From: Yoshifumi SHU <envzhu@gmail.com>
In-Reply-To: <20260910-arm-generic-irq-entry-v7-1-v3-1-5fd90f6859e1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065917_514890_E0689216 
X-CRM114-Status: GOOD (  13.34  )
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

Hi Linus,

I took a look at the Cortex-M (V7M) part. 

Since V7M now selects GENERIC_IRQ_ENTRY as well, a call to
arm_rseq_user_enter() is required near the V7M interrupt entry path for
rseq to work correctly. It corresponds to the arm_rseq_user_exit() call
you added in entry-common.S:no_work_pending, which V7M reaches via
v7m_ret_to_user_from_irq.

A minimal fix would be:

diff --git a/arch/arm/kernel/entry-v7m.S b/arch/arm/kernel/entry-v7m.S
index 49a3a34e2913..e8102413461f 100644
--- a/arch/arm/kernel/entry-v7m.S
+++ b/arch/arm/kernel/entry-v7m.S
@@ -87,6 +87,10 @@ ENDPROC(__irq_entry)
 __pendsv_entry:
 	v7m_exception_entry
 
+#ifdef CONFIG_RSEQ
+	bl	arm_rseq_user_enter
+#endif
+
 	ldr	r1, =BASEADDR_V7M_SCB
 	mov	r0, #V7M_SCB_ICSR_PENDSVCLR
 	str	r0, [r1, V7M_SCB_ICSR]	@ clear PendSV


This actually calls arm_rseq_user_enter() in PendSV rather than in
__irq_entry. I think this is fine because the rseq.event.user_irq flag
set by this function is only checked on the return path to user space,
specifically, during rseq handling inside do_work_pending() on V7M.

However, applying this fix highlights the ongoing maintenance burden and
motivates converting the V7M IRQ entry to use the generic IRQ entry. I'd
like to take on this conversion work.

I already have a rough idea of how to implement it (it is somewhat
complicated). I hope to implement the prototype within a week or two. I
will send it out as a separate RFC on top of your patch series.

As a quick test for your patch series, I confirmed that Buildroot boots
successfully with and without the rseq change above on QEMU MPS3-AN547
(Cortex-M55 / Arm v8.1-M). I will run more comprehensive tests on real
hardware, like kselftests including rseq.
 
Best regards,
Yoshifumi

