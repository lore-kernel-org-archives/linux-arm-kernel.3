Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD56AC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=; b=WgReKFwg7ISKFK0dxBFx+5VVHx
	A3RGIm68vrR2/g+AwK90uIOSgVmZKsWwD818AvSt28cX0OecaADgFyyLCRCyM8i8zZvmVlfFUmxFD
	XAuultgBdtoRayrDYYZxnQApMLJXqHt7m0tXYzI9T7ot7IQeKLBXBxuUUb+cRmcKaavtsiOhI/g5l
	Je39AYIvcZR5tlS0x4GbgsXPYOCsU1SuN0/hMC/XgJba6Q3DqoE2+3cayt6ysX0FalDlZvaznPxYY
	LEaJEQpmV0vcaItD05GQopzWlC0kPX2TmkuM3hDPJWnXntrdqMdtqm8DWDy7KMlprkny7v1mywRBp
	kd1W4ELw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRFY-00000004P6u-1Msg;
	Fri, 09 May 2025 17:11:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOn6-00000003xPF-2KSv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:33:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=Khacbic/wESm9hX5V7JtrNuQAJRKUCXAT455ONE8y2AJJ/zgkvhMJyipOhcQWs0jHNC+Og
	qCxRm2brWoQBYln/rnesmg/K9Q9tECjsJ7zcP4WpRgiJjFrtdUO6gg13u7Gp7iZDtBNVZX
	FcC55EWvlY62MOcapU9PFkfil5IujiE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-tGh28Eu8P3i0seQnVnNllw-1; Fri, 09 May 2025 10:33:29 -0400
X-MC-Unique: tGh28Eu8P3i0seQnVnNllw-1
X-Mimecast-MFC-AGG-ID: tGh28Eu8P3i0seQnVnNllw_1746801208
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43efa869b19so14577985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801208; x=1747406008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=IBQVvuwiLQxHn3IrhX1Lgemw3KHLUuaF19IZy0gk9gw5ydzq1ia9u56HJNRp6gkFpW
         LXrI6v3tfphAGyuN06Xki177qnr0WTHjP+oYDNRUj9iAPdKbDI/aDBgFR7aHYND/U7W0
         x5CQefezuBVVE+lKO21GaO89t3/OEHQCNzHCy+8/zSqDuA6QNrxYkEW7/vjH4w3w6592
         NedTAF+mSWARMnvUNbjv/qhuZJoOse2tBExqMWoskmTNfYTTr3Y4RVFwJNIAxYGO98cN
         a/zPC4eN0d+16kPXrOk9KXHVSGWzzZp5pGQPC/DkNJrZo4/9v7slgI/W5mAdkOLN6kE3
         NwGw==
X-Forwarded-Encrypted: i=1; AJvYcCUDN/bfD/SZTwJ4FVdbxm71kvkzAVlU13d4uj313kgZu9wJL4NeHYYcdjGLVaLz0OLFbQFVOJ8215rX4oeT3dxy@lists.infradead.org
X-Gm-Message-State: AOJu0YyDMg9B3gPWC8FJi6qJByXealBLRozxCx2h/uB+GrvPurLBD+8c
	jDOL9Tk2Ss2ae0yJIFz/JEf48+ire7GqYZqpXYOgXb7ZxIp7x3ldSNgqrd61/GF+VBANdbPT9c7
	c/+wDnifl3Sfiquxu2Al597y/Y0JYGsBod2t8YvJRuImhFLdCxc07lGy5rVwEDzQDnuz/dVwmgj
	yfdluJwA0=
X-Gm-Gg: ASbGncstWLYXUOQ3QMZdYhy9ud5s+7ZqMoU981Pjx10waYceXnCNhgNcx3qPorC6hrw
	ILdMI5vceXLqqNem5fVeLDrIY5UMddkC0WNO1Q7SzAibz9VZBLMNlpVupNoMKYnKn9yg1vHEo5L
	flcxkuJVutxg3zaDI86SPEEChTDzHzcOyRXFv7yylhV+CNC5BkBEuq3I1N4yXZkMiWUE0F64F+k
	v3upOfyzf2JmtEOICKDcY+kpEEytCN0wHML/j3egj6kzkY7NRLB7RbGkifdzv8FLhMVfZxyiAOc
	tSKswFYKZLDbJSmnQMvNyWMY6KCChWUwYFW73qpJuSjwciHZZOy5wZldEBOyXcZPrfdyJm8OLCo
	=
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442d6d18b68mr35853825e9.3.1746801207828;
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm9MkDy/quubUQsSnalTOipje79m4aFFrG3Bj/W0QEAlm0r1Z0dt5gqWlFblcQZwsloaT3Fw==
X-Received: by 2002:a05:600c:83ca:b0:43c:fb95:c752 with SMTP id 5b1f17b1804b1-442d6d18b68mr35853555e9.3.1746801207515;
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:27 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 1/3] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Fri,  9 May 2025 16:33:10 +0200
Message-ID: <20250509143312.34224-2-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509143312.34224-1-sebott@redhat.com>
References: <20250509143312.34224-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mSEmiMGpjzlkVpi1qAfTwC9QQBycrWj5mk6EwNV2zs8_1746801208
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_073332_675411_FA15BA8E 
X-CRM114-Status: GOOD (  11.83  )
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

Fix the help text for arch_timer_edge_cases to show the correct
option for setting the wait time.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a36a7e2db434..c4716e0c1438 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -986,7 +986,7 @@ static void test_print_help(char *name)
 	pr_info("\t-b: Test both physical and virtual timers (default: true)\n");
 	pr_info("\t-l: Delta (in ms) used for long wait time test (default: %u)\n",
 	     LONG_WAIT_TEST_MS);
-	pr_info("\t-l: Delta (in ms) used for wait times (default: %u)\n",
+	pr_info("\t-w: Delta (in ms) used for wait times (default: %u)\n",
 		WAIT_TEST_MS);
 	pr_info("\t-p: Test physical timer (default: true)\n");
 	pr_info("\t-v: Test virtual timer (default: true)\n");
-- 
2.49.0


