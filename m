Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B816EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 15:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rl7MPjMQQR9YynEjNt+gG293fesASKmyZt5GnlBVdKk=; b=ITN+73AxC77jpPnJp8RlKoyihw
	b/1aIsDnPReXm0i2NGELG1oXxoy845I9Ov11rjaa3C8ixRyqTMClZJl/HJA5A2x8+pagbTa1+o86+
	uJ9v6oeCOFDztz2XgsrlvW1sP4Spr6IcN/B6pNto9+6LwOkJHEhDeyt3HFqKzc4lTgiQtJUBQYjdT
	RqD33R9kZ7+o/pHrd5+YJuJOf9WYTevfUZh+XKtFNbDTaf1nRpx9txKWe31gyq7UPtjDElF8W+X9A
	iRUSoy5ox0+Bktd2ZtiqyPJQ0zxOlIcqNz0HNDX77/qHHW5rwToVpy60cPnP+zINRB3Y4ip3UjRxT
	2dZzWgHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uexrP-00000007r73-2Bjn;
	Thu, 24 Jul 2025 15:27:55 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewQz-00000007enL-1eda
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 13:56:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-455b00283a5so6422115e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 06:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753365392; x=1753970192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rl7MPjMQQR9YynEjNt+gG293fesASKmyZt5GnlBVdKk=;
        b=nmvdll9weXncXjUrOHFlmpTQ0pv2qjj8iSxwbAypCUjnkbZ1za++w+2LSFgOdoMsTv
         SnRxdNz5yPLrNytQd0x1gIDUCQz33s7PPvKETZ4x+2kocZP9UfOEQAZgamOrCzTykpXQ
         xk8SANsJgp3heuoJ20nmUqNS7xpbu/KYi7WPNCD46ZGJ/kwIjhadMOG7B8tZ3KQiwKEG
         gHn/uHmQlyRZvHB8bwPOpDShSCQKzQEzUpHZTfSo476j7I05eozHf1p/yfq7BpvWxMlp
         vaXTPhInfIuzQXc7EWOB/Xi6WUPsfDqkyXJ7Z45XRKGZgdSgAp3G2gDpcd7qyRalor0i
         zZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753365392; x=1753970192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rl7MPjMQQR9YynEjNt+gG293fesASKmyZt5GnlBVdKk=;
        b=pf6whAQLmU0+ilcJY4ooU6UJ1fDNGVI2z+vjN6Vm1ZbpuScFYr0gJnm9JkdzYsTyD/
         bkA0pMkMpLSKJHb7vkNCP5GRgYo0XmhcyagfGOiiKKr1zehWgAOcl1qinZudj/q9FImL
         8MZTDtwX61LOeErGFOGo908Qodq3sWTOHkiLlaUIp0I0sqRtaikOVkdI6BxGWhslFkY9
         VqDQbj7lluZUuogl5nlH4nfBayKZygQaxRuFKWAi3LJYX4FO4huw6Ks2Hv9OH8p/k5Bk
         7UMk/A1/bSNanZIKlXnVDiWM2Na0FcFudR3Z13okhO2pNW5Ai0jX0F76b1MU5DOE0uKw
         6wAQ==
X-Gm-Message-State: AOJu0Yw2SQvy7b7W2NLydf4WQnLtc/ZUEUfg9pbor0R1t9w8rChZx1/Q
	m+S7/iCkbRbRFfYdz/mK8xE99DpXZsyXQP2kqNjeeoH+L4Xir8ufvrOqw753s1oRkyM=
X-Gm-Gg: ASbGncuFWcDL/77s1MVrG2aIm7c4tX9MW+YV7l9Wiok609GRIWoO23GFIhWKW1SQpuR
	Msz0K3X99PERSDukC2xwXRdyeY7J7rinhtuF03SA301YfpuSnHjrpv7rFkkp9ytabuUuIYUTaOT
	LiNW/wDDP3DDRA1VezI3N63JsdePAYdRgrTGoxoBVjhvOumAqFMBpIbdPrvF/epHgBXMlXsXI6M
	5KjIC6T5zRwhHUHCWrgA6F/3AhbUgdxk07ko4FTep96ZUPUlDJIMrAlm0rF6t0AquWrwL96Zrnc
	BP766lj1/STORgMrB2ubJZMP1LoGAB2y+iEZdbW7C3Wzia9aEYASmwrqVfAq0C53+WR2XE2Hw0j
	65HVJUtN/vxCHrm1nbr31WTqUfQhrXnGsbpR0XPZVT/jcY2N6cT8y5kf3g3z4Vy5GjcE5oKbuPy
	orzzWvxIYMilBt
X-Google-Smtp-Source: AGHT+IHonQ82jnLO0p5HYq/pDMzB+6N1t6DWFVzcA1CVX2U3nXqH6sJ8SaBoH0rb44h0xr8LW+w4sw==
X-Received: by 2002:a05:600c:6992:b0:43d:46de:b0eb with SMTP id 5b1f17b1804b1-45868c99c85mr63756925e9.12.1753365392038;
        Thu, 24 Jul 2025 06:56:32 -0700 (PDT)
Received: from eugen-station.. (cpc148880-bexl9-2-0-cust354.2-3.cable.virginm.net. [82.11.253.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587054e37dsm20889375e9.14.2025.07.24.06.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 06:56:31 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	eugen.hristev@linaro.org,
	corbet@lwn.net,
	mojha@qti.qualcomm.com,
	rostedt@goodmis.org,
	jonechou@google.com,
	tudor.ambarus@linaro.org
Subject: [RFC][PATCH v2 11/29] sched/core: Annotate static information into Kmemdump
Date: Thu, 24 Jul 2025 16:54:54 +0300
Message-ID: <20250724135512.518487-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250724135512.518487-1-eugen.hristev@linaro.org>
References: <20250724135512.518487-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_065633_430973_7DAE0D16 
X-CRM114-Status: UNSURE (   8.82  )
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

Annotate vital static information into kmemdump:
 - runqueues

Information on these variables is stored into dedicated kmemdump section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/sched/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2343f5691c54..18ba6c1e174f 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -67,6 +67,7 @@
 #include <linux/wait_api.h>
 #include <linux/workqueue_api.h>
 #include <linux/livepatch_sched.h>
+#include <linux/kmemdump.h>
 
 #ifdef CONFIG_PREEMPT_DYNAMIC
 # ifdef CONFIG_GENERIC_IRQ_ENTRY
@@ -119,6 +120,7 @@ EXPORT_TRACEPOINT_SYMBOL_GPL(sched_update_nr_running_tp);
 EXPORT_TRACEPOINT_SYMBOL_GPL(sched_compute_energy_tp);
 
 DEFINE_PER_CPU_SHARED_ALIGNED(struct rq, runqueues);
+KMEMDUMP_VAR_CORE(runqueues, sizeof(runqueues));
 
 #ifdef CONFIG_SCHED_PROXY_EXEC
 DEFINE_STATIC_KEY_TRUE(__sched_proxy_exec);
-- 
2.43.0


