Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71A1CC5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uvtiN0tbM+3eN1Cvhj0/6WPfMd2Td6+2qHM2Vin6Wcg=; b=UsAdEJ5hdhSj9RXI3IF4BBvaVA
	8/4dFt+iSi37bFK00NtMcPRi6/j9qu3K1/ZjdWVAP8zsf5gxSipesXo78d3GNPegreo5fgrrB6cEo
	ZL5fb4WbYqStpHp82KmfpUAgsnv8dyZwBERmy+IXZ6YdVUUIMiu1oUUkFQghjWqJYJWuwDbFhz8uC
	R11ZNX9TmS33ouzr3cxZPBuNlRR8xALAumwjwqfd+bG88N57Twwu+Cqdgp+WqGhyAXLK9WHx0+/L6
	kHH2d4JWqbYzG7FvWf3zIFy4h67axjBU8iLaVTWmZdsnf5ky+jiqyPgwB6S+dBIQjxn1cnRsMS+ln
	v0nZRNug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPYS-0000000AlMN-0TcZ;
	Tue, 03 Jun 2025 11:11:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMPVq-0000000AkhH-2dgn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 11:09:00 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4316294a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 04:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748948937; x=1749553737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvtiN0tbM+3eN1Cvhj0/6WPfMd2Td6+2qHM2Vin6Wcg=;
        b=apgOG9CwR9pQ8iAto6RxF6SSkD9K7W/C9cy2ADSHjEDHtOnzKS3uEmxMWHCHTHydX/
         /paDC9Hpzz9LSqksZ3vigtdYiLqW7y3T5Lxcwopbtfs/FNwgFZvA2TjqkfaeQ+3JJfOQ
         WSY+r1AgmClppWrnWklPqwGF5QNo50D0dQ1JksAkmWJ73ZkzdGta6u3meQc/Sh/l7gW9
         tYzi2FDZfl8E5sIY2SVVDZiKDg+5W/rFqis5Os33vpI89gxmK4NJCwKaEKI+gz1BuYNc
         aaCbcEvB4kgiKNO7aKtFLmAVNuG7K6QKaK87LSUv9Xa03uwAHQ46IDrx9siI25X8febw
         FIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748948937; x=1749553737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uvtiN0tbM+3eN1Cvhj0/6WPfMd2Td6+2qHM2Vin6Wcg=;
        b=WbWQAtF9OrV7bbgGIPCVnZByp8d09YmunahxQJlunyujJrTIddXkmOUtMXVPnAh/YY
         xlCV1Wiv59rNLuJgiQ9R1WxgVCJhOXSu0BwMW+W9zUoFoGt+viVDZl3S5IqTNOVdaoVQ
         zzz5J/qu4/O0a6zJ4kvlTvI64qHq6L2wqcrUw1D7oqHOrzKVuEYnpGUl/jNddJihZaxZ
         5RKTuHIhiwgfFK7jndRqQg0nTK6xG06McU3mxFATFx3A8Es7nuua0W1jso8mPCLXaICP
         RkhE6t+Ieyf0bv55vWdG2pPVHtk+b00h1DW+kF4WVoI6AhHuzndlw0Ckexa95nTSWZB9
         TR5A==
X-Forwarded-Encrypted: i=1; AJvYcCVkcB5jtYZuEYaQn7UOXSYK/WC6YE6or04sB9FxanpkneqhreOd7enFsdPYRjIZUwaF7IY0wL7f5G/l7lEQTGyw@lists.infradead.org
X-Gm-Message-State: AOJu0YzVn1g3S4Og8f4dBpQ1o7JEcHgm0Un/w9XO20sOa2hK76RW10PU
	OCCohUTLQMEQALGK3YpEz8lkH5ZA/3GqKuAMH6tek51rnZId8Q0sgVDC8lAvELLqzyE=
X-Gm-Gg: ASbGnctcOPzOAPLns5QxSlTWd8icPbHjvbi3bwKpMthHpUfygxMh2jpAmu/zavOcKKO
	U9H/Sj3+oB6atUbpj99y7Y234qzOi7hh47cBmtwwWfwyijQoUw9HACcfXrqrVverFhYgm+rtwNP
	XVfwHSMr8ljJ807EK5QMKshHCyBHvJTsH5vCoO1cGRxPGd9YTGA6NFmBztRS9XpiD7kkylNTbk/
	KFDAJ6Up7w/0720tDbI0XpsRRD5JbOxsl7UL6v2cj/jFaOUme+ewF9+RBCs9FNMI7q1uyutr75a
	Cls+67bkNQmP7xuUUlMKimCN+PRrKvITXHYzNcZN6wAtOA2Y3PGmaMeJ8otc9Gw=
X-Google-Smtp-Source: AGHT+IFblOX1jAMQR0CWt2YCrbWuUgRl61/iZF6tPw+JGmxffib5cDiamCUUtgpC/NfKV7uyyiuQPQ==
X-Received: by 2002:a17:90b:1343:b0:30e:8f60:b4c with SMTP id 98e67ed59e1d1-31241735a7dmr28100719a91.16.1748948937304;
        Tue, 03 Jun 2025 04:08:57 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f865sm7003173a91.7.2025.06.03.04.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 04:08:56 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Date: Tue,  3 Jun 2025 16:38:53 +0530
Message-Id: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_040858_671294_F2AC2993 
X-CRM114-Status: UNSURE (   9.90  )
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

As per the spec, one 32 bit reserved entry is missing here, add it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 include/linux/arm_ffa.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/arm_ffa.h b/include/linux/arm_ffa.h
index 5bded24dc24f..e1634897e159 100644
--- a/include/linux/arm_ffa.h
+++ b/include/linux/arm_ffa.h
@@ -283,6 +283,7 @@ struct ffa_indirect_msg_hdr {
 	u32 offset;
 	u32 send_recv_id;
 	u32 size;
+	u32 res1;
 	uuid_t uuid;
 };
 
-- 
2.31.1.272.g89b43f80a514


