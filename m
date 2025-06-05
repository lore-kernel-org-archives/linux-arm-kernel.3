Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F226EC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=; b=409OprG/f7nVUjp0AbuyRlvwer
	9Ze6S/5XZekpEkLokgjh8swvKNf0It4KN8swTmn6yAzcNKuMCczzGBuPXYS4ZEbw42Sc2bNF1jgsi
	DzrHjMtygw2pbR/NDWzTQd/sL22ag+1eH0mVYQyECB9GZ9CqYeXJV7jxx2KmuLc7xGD6qqKVqUnt+
	9X3CChYikViMfYB4PaZ7jiYOcVnSrbDwfBbI5uq3oVM1aD6XgtVD2WQYUWBuTVZ+kiBlyvd0oDdbB
	F5upX3iG1GDEHenzNB4T2idbjB4D+AULmQVLdg5MgtGTMSshlgF60PmVcu/r1eHC72OMuhIvAi/uz
	LkY70GqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN80F-0000000FGzS-3LNO;
	Thu, 05 Jun 2025 10:39:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7y2-0000000FGZw-3OSU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119822;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
	b=PzyDMqCK0IWnrDno8blcmKuy2vFgi30uqVkEp4fL1iJZ/ces1uaOQ/rGs/MOWlRfiMmG2G
	0uQR4t+nAfTaE0PrIhltlhnkR9dzs503YMr6GjllBhQm3UUSzszMHxfoSkE2p36kGjrGus
	tJqgajc9LfOroJy6Ki2HT737cHg68io=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-HrID8EevM6q56m4NrLSWXw-1; Thu, 05 Jun 2025 06:37:00 -0400
X-MC-Unique: HrID8EevM6q56m4NrLSWXw-1
X-Mimecast-MFC-AGG-ID: HrID8EevM6q56m4NrLSWXw_1749119819
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a5232c6ae8so357041f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119819; x=1749724619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdRsO2Uefrz8JMO751IFZEkS7KH/EcFqwNDUBdHYAOY=;
        b=M4X7O/YgiVj2lOC9WaNUS/eyKds6y9+BYKqtm7fyWl5lgfCLI/wA4A/BhM7jaGNl+t
         L7uoJp7UA4uwgUqGQJX9ZrUaT/bJUL9yQXya8HTOBZeyMUtvGzmGMTZn38JRabcCQv4Q
         7r5q2CHw+Ca7h+8s/gmkWUeJ0Nv9dAuSxIdd3p+ZUFMhS6FKeFZk7djwfO43RCflm8Uu
         u1ppdXocISZEt279Ft5Z5VlNv0vYA4oDeEkFsk3sBFBHNN3yTQzz/MFq9wTE8shoP2pt
         kdGc65YfcohH7G/0K+e3T7/MQUeIETQMfdJ2pMOCNu8tWQfd1tqpXPvejDYBsTeCuT4s
         8PTA==
X-Forwarded-Encrypted: i=1; AJvYcCUvwWWFrc6qelNwGuoScTyPGiYndvi/IKnOUJqSjPjNp9c2WFF08bdZvFOqCuI0FFHMVQ4p/kbjhGRcdr83OTuk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3mYSMgcq17vH+KDVawHAXidZlDdW0iVhfL44a0k6yoQ83A+51
	urFmhoT+blBoZPOuLC2EfIzfCZqr/glk2hb+rpwUpk5taMOp7EOqlDa0fx2c0RQxogeAiHrOHpK
	5wyCnNZFqTdABsEnqKXXSPvKcJbMRa5kTWJiG6iHDDMTIqjUdu6egsSh1hY0J+WlV0v3K7oedRg
	Es
X-Gm-Gg: ASbGncuWowr5rGQyqRYS2+/aFySHc8EuSctl0qsxGpywtXU0NombXpgDTi6dUWGTYti
	Hb/jGTcLzdzZyHhEpgUPwcTrjWemquKhnNUoh6I8A+5S+NE8GGwzXAFsmk0o/cjM6iGttL+d4V9
	E0nsJ816CSmVWbGXyUfrXNPpqlUXNLrDZ1t42Z0Gu2zxLfYzw5HwkL+lvGxBRKtzrG+6GcFf/t6
	L64bzuQev8md//cef0kufuN4nhVElmWJdCJCFvpW+bz8/jxic3eB8ok+BsYZMM1ueoldOXwAXCi
	qmJF/VmpnZ1PLD4Q7JXngjnCVQji3KHv8iuqq1WjCGDHx3LtRMPdtq6+d7R3P4F/OSR0JYMRhw=
	=
X-Received: by 2002:a05:6000:144e:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a51d8f6a68mr5594159f8f.7.1749119819360;
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRjZpPO2+0jMcuZP9CR9nsUnOUJ7V0YuUBqF23a88OV3aPhw4HnJ7EZRrzi+l8ZxUNJutO1Q==
X-Received: by 2002:a05:6000:144e:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a51d8f6a68mr5594137f8f.7.1749119819002;
        Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:58 -0700 (PDT)
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
Subject: [PATCH v3 1/4] KVM: arm64: selftests: fix help text for arch_timer_edge_cases
Date: Thu,  5 Jun 2025 12:36:10 +0200
Message-ID: <20250605103613.14544-2-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605103613.14544-1-sebott@redhat.com>
References: <20250605103613.14544-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: In5Ml0cLUwTGbiXKHH2t4lzNc1tQSiVtop19-1GwQ_0_1749119819
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033702_914551_BC63CD93 
X-CRM114-Status: GOOD (  11.63  )
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


