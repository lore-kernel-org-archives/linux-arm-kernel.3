Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC624C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6L+bu3C5bNo3IB9ZkU52/sTrMkPyP3mUjU6YriIz+Oo=; b=2aLOchbZEkdj9JWvEgAHmOnhKQ
	zZdmJJaXqYNSMQFYHl9VYPcvVjhmXhOeAZtod7pajYE28v9FOS4EHOazJWNeyWPCITnd0JNdpAGmc
	J7rvAYqWlwFhQGod7QehTancRl1w3AewdemnI9fWWqLvGnJBS0ep4Ta9BYNccECouU9qqF8SP68YR
	AEXABU3VUPY/NIqCcKJ94F2eRGtqg9MwdLwgU7Vmw4JbHhveJHPrnZoLY7FXIgrIXsNfEtQd3zB/A
	kSfPUS5poCQC8t1dI6NZS3S1g19D2OXj/Vbuvx0Rfsj+fvJk7niYzoz7Y0Nz/LB+Ui/G862oMGoXx
	JfwGwnzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRJQ-00000004Pcn-2l0e;
	Fri, 09 May 2025 17:15:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOn7-00000003xQI-3J8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6L+bu3C5bNo3IB9ZkU52/sTrMkPyP3mUjU6YriIz+Oo=;
	b=YwGKxxjGzhPXxXISMeFk5hcoXRij3f4tAbGAM3oAJhOYLy2moynGfCKcRonRTzQd7FWXSK
	IwR8UZoH7XFDUzFzIerhd7bCckTssqYRlD7PiYj8tiLqzet9dJw90aJhJmca4PlLcG7Z+j
	yU0jBLz/bAB4NnMuzqS2wML5+pu0HLY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-ShTrfig-PwuT_cfz9hD5hg-1; Fri, 09 May 2025 10:33:31 -0400
X-MC-Unique: ShTrfig-PwuT_cfz9hD5hg-1
X-Mimecast-MFC-AGG-ID: ShTrfig-PwuT_cfz9hD5hg_1746801211
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso10036555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801210; x=1747406010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6L+bu3C5bNo3IB9ZkU52/sTrMkPyP3mUjU6YriIz+Oo=;
        b=dlv0ZkmjE6V+mJR1maGFkurXILnf6pIQAlz1Y1XyL+Ln7ZM9GrA8hilhagLqH8FDPH
         tGnJNJosI5pogzHLQhPOqiQIT3m/+XYidfV3UP3a6IMBMS5W/5t/XripT0xW1zv+KKAN
         btGHs1CAcKdrbGVM34Z8lLny8jrkw4TSaVCwyDHhd7Q+vkI1bFYHpeVimSt/TFYOu35j
         D75LjyaU/bUU3lDwYmHDdAb0LE1SOixAp57FdMx2XfgIuB85OKN2u9uoWukb0M1agQRM
         1eDDFGWgnh9vjxeLpzXYEhaQp0xHOkRiqx0EFiI2g0aaI2I6DXGN0YjeO58WmzF9SRos
         weZA==
X-Forwarded-Encrypted: i=1; AJvYcCUMst5YHh+GrQuMbEtcE3dCuNFUZNcvIo+0hjfNN+bMrzDPUyRAjvzr4yvXWxennk0E74FE5Kr/jKq9UfNutg8T@lists.infradead.org
X-Gm-Message-State: AOJu0YwA9HkAlsvuBeGPYPUnZbuVn6qPqtgNO8gWHVVOVPr+lDH4ZaA0
	dkbHHJWP3WtqBKj6qlWZn+lZmfS45GwH4n3xeqqRYJrdai54PD282TcwMypLfWvnd7mWH/xAK/W
	mBJhwbGnrtuyum8T+TYGyHSqCB5zjt2+vzzODQnJFu3ZMcHuHbhQdZ/q1rx1RtbRIfKzloVSW
X-Gm-Gg: ASbGncuzpFVLzhSwgz+T2gTq/T65NqeIuoa2f5f1tsykTaTucIqf7WQ6UlFcKGxOZIR
	EjPEi3E2XapHF4+6nYqXdPmlKnbR7wxc126Ad3BX/78MzuzvJZwpzME7R6XHMlsY/oQbugUDJ7Q
	3plLcS4SbKH9T7t1Jg+yow8J8Z2BjJFl+/aMaTDY4ey1R1DpXgb5UQjTlh2/GSaI1ehS/EIB0p0
	8lP+2fstf4fX71mwXlgf2+SUO3BpYGjj7ZBYHEStMPqbSY8OMepmnij0v03Fvh2xi449R5AAimW
	IQdIJgii2d2IcYxo8RXhQDw1P4y/8JeY2adEMzjQoHEeSgx0zvJCpLzLHp46L7cKDNnoe4bm/i8
	=
X-Received: by 2002:a05:600c:a42:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-442d6ddcff4mr23932725e9.28.1746801210573;
        Fri, 09 May 2025 07:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFkHBgasEQcr/4ZVQSpWJmPLcvd6o7zSPvgSmEK9zaLE7PuQpFCA6hRhF0NO2Opfzb52f6PlA==
X-Received: by 2002:a05:600c:a42:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-442d6ddcff4mr23932325e9.28.1746801210127;
        Fri, 09 May 2025 07:33:30 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:29 -0700 (PDT)
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
Subject: [PATCH 3/3] KVM: arm64: selftests: arch_timer_edge_cases - workaround for AC03_CPU_14
Date: Fri,  9 May 2025 16:33:12 +0200
Message-ID: <20250509143312.34224-4-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509143312.34224-1-sebott@redhat.com>
References: <20250509143312.34224-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 49zj3h5VoYy5-8NB3MbOA5CVdpx-1Fah2eszfAWuXdA_1746801211
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_073333_894625_F91271B6 
X-CRM114-Status: GOOD (  14.35  )
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

arch_timer_edge_cases currently fails on ampere-one machines with
the following assertion failure:

==== Test Assertion Failure ====
  arm64/arch_timer_edge_cases.c:169: timer_condition == istatus
  pid=11236 tid=11236 errno=4 - Interrupted system call
     1  0x0000000000404ce7: test_run at arch_timer_edge_cases.c:938
     2  0x0000000000401ebb: main at arch_timer_edge_cases.c:1053
     3  0x0000ffff9fa8625b: ?? ??:0
     4  0x0000ffff9fa8633b: ?? ??:0
     5  0x0000000000401fef: _start at ??:?
  0x1 != 0x0 (timer_condition != istatus)

Meaning that the timer condition was met and an interrupt
was presented but the timer status bit in the control register
was not set.

This happens due to AC03_CPU_14 "Timer CVAL programming of a delta
greater than 2^63 will result in incorrect behavior."

Work around this issue by reducing the value that is used to reset
the counter and thus reduce the delta.

Link: https://lore.kernel.org/kvmarm/ac1de1d2-ef2b-d439-dc48-8615e121b07b@redhat.com
Link: https://amperecomputing.com/assets/AmpereOne_Developer_ER_v0_80_20240823_28945022f4.pdf
Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index a813b4c6c817..2f0397df0aa6 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -31,7 +31,7 @@ static const int32_t TVAL_MIN = INT32_MIN;
 static const uint32_t TIMEOUT_NO_IRQ_US = 50000;
 
 /* A nice counter value to use as the starting one for most tests. */
-static const uint64_t DEF_CNT = (CVAL_MAX / 2);
+static const uint64_t DEF_CNT = (CVAL_MAX / 4);
 
 /* Number of runs. */
 static const uint32_t NR_TEST_ITERS_DEF = 5;
-- 
2.49.0


