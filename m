Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF69AC54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=; b=fcaVGFZv8z7hUkCAcj5kLbryTv
	nJSjjxP/H57eTnsipJdYMFKk3KspMgM/m6hOW+4eIdjzonQp5iF5N0QxmXfeJv+HSn1eCDxYIN9qN
	PlzCXwlTgoABN2yVAUx4ROyBhQmuxrXnsGeHGOO1EiKrOlK0t5FBwk/BXEPtzcKeczNP6rZmi+OiX
	6hlqMB8GuhSZezuKbppdW35m8Z0ir3RMDAbqFPt4rzfJtYCQK8xeDjI/KSbpScmzGx8dZu6G7WEsP
	Jitw81g5KcziW71XXQ0aidv94UX+p+fyz+cX6D8y1n2ttKmoHTyTxGRb3bQgglLLwg5T4s0qgt/n6
	K1JQ6Uxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvM6-0000000AwWE-1fil;
	Tue, 27 May 2025 14:32:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvEY-0000000AvYB-3F77
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=R+zrNo1e1/qF13+FSxtCynBYuEJWoTYm+fDqs1bRmtV3f0upYCigUVHN30525MhCzYPr1O
	EMVNygG/Unn4QpweybeFRR+bleGCVrLdDy5c/atFx9QnsHl+Y7s5VLtm5Pz+XM9BJ+nUsT
	YpfLb47X58MdPRAlS/1FGY0Metm5lGU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-0dr0ifWSPjO1-WesaZyaPw-1; Tue, 27 May 2025 10:24:45 -0400
X-MC-Unique: 0dr0ifWSPjO1-WesaZyaPw-1
X-Mimecast-MFC-AGG-ID: 0dr0ifWSPjO1-WesaZyaPw_1748355885
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44b1f5b8e9dso13016385e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355884; x=1748960684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=R83CRKTmOyJUooQLUGcogDLHRg7YBTxXKopWXuRJRuMnXq6g8XBEfFO0PDiCZw5egw
         TyeYEw+lPQbXTX5xA0WC7Bh81MnGs9agK0gAXFtxqaVBGnHR02GJCTrExXcieocImrK+
         qxcqu3TWep+eZ3AsVW/g+bDg8/vMElvp848HwIiQlVibL02mwj7Qyvp0M/BIldRHoyxa
         Zcn0ocAMkLpmWTFaCWvE2xQr1nusN71rI6CchlenNLvKikMCN8eaL+5VoHmQAqXU/uBH
         csSuCpCF3NHV3M5cQQ34+N2FpIqEJykLIyfYvsLuZr4bRqBN59tlMkQ/RBwA3MXngTim
         Crjg==
X-Forwarded-Encrypted: i=1; AJvYcCXHG5VGAYtwPVp+K5Kphg49SOmy77wtH21awgb4weN/C8aB80d0Uq0uywBm5TY9lJryALMo9mfTdi5lAamIvCVK@lists.infradead.org
X-Gm-Message-State: AOJu0YwliB3xwl8EYSA96lSQcKmhjR79cVFS85aCuTSEPHaguG8rHda2
	1ZT0w8GhzzESki9ZKwFEjGOfvwwsZFCfu15hShxxqDovrd0viyzX84gD5dTOzpWZAA1h5NDsu89
	IAz0tmJrXjAAEDrniK6jRo8FogUWno6ig1kqDKVCekgjG0HSku87FnGwvWxjM0b81LC8wfu8Peh
	uE
X-Gm-Gg: ASbGncttyiqhdIdDSz+EW1eNM9IVRZx7Jk7ObE4eyuCPFqNBvoV6oWgG5D8rB7MAKSn
	2unQ1uV2/LokNBaGIQoTEsDFnojtCCsicYu5vkmk7ZGHOaFByV96gTF7HuLbjfDNjFuPX4iIoek
	2FmVVU+KxOlwL+joRBfVqUTvQqCvx2GXbs2xuhquFeseFUqJLEeFbIqkoppKg3oJeF5vy6z2XKz
	etnIpD/VB2oyii0GfxZ55QLiDgrJnLt77poN/LxQXJH7dNxR0ZVWGIOOJX0Ozb+EDY9aSWir9Of
	fCGyFQk7JTEb9zPH2Dl+jBPG4Gvf9X4czOMHtKT8ZXNV36KVDFGQeT2frm6koXB3Z4wOWnPXqQ=
	=
X-Received: by 2002:a05:600c:35d3:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-44c93016587mr106055805e9.7.1748355884570;
        Tue, 27 May 2025 07:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA8HR0A+QTW5CLIzzWpCQrdDEVxcSOCyoGFkafJofsp5nJGXbEA7AFPSlzJnet1RbsnO2sOA==
X-Received: by 2002:a05:600c:35d3:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-44c93016587mr106055565e9.7.1748355884133;
        Tue, 27 May 2025 07:24:44 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:43 -0700 (PDT)
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
Subject: [PATCH v2 1/3] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Tue, 27 May 2025 16:24:32 +0200
Message-ID: <20250527142434.25209-2-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527142434.25209-1-sebott@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: y4aaQfY3lDR7qgJtj-379sa0mwCcC4TZI7O44ivLlF8_1748355885
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_072450_883235_D8A63A2C 
X-CRM114-Status: GOOD (  11.92  )
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


