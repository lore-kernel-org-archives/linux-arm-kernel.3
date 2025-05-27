Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6A18C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 14:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=; b=KkasY9ODa8Wh8FsFdV6lMzK1eE
	WbGFqEERXXcg+Nb/cIkdDeddKEOGHg+olpvrcz9fB/W9qNSRvL+YBRG3CO2Z8q3XGUIuw+8IcyaFS
	eyTxgYkQb3WHD2kEPpW3GgfUNbPm9ZQUSLcbUgMjqlD8yfJu0sjcuFxTE8/0P6pPi04E9irv+9h2A
	Aj8e6fsbxxfvh1QTmuGbNcNEtnbqoKSbk0NYFfaV3+S4C3y8woUTlUUSaZu8U/+CR+5l3iv6BBHWh
	pXDmMvZBqLOmfkQ0xJbbHGrXdl3iOjADX7qOU/5ASriG+LTOd1EJU+y65XDa7XiMYJN5JSeu60kge
	TXeCy8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvJz-0000000AwHM-2rvl;
	Tue, 27 May 2025 14:30:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJvEX-0000000AvXl-2651
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 14:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748355888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=SAYnB4vLvclNcUmXOhgouOPBzGSzjYCSPrkmiCpPQy3iFmlsWdBbDsdWwD1z0Pnjavi69T
	FBFbdLqZYMwxCRacuRF0j4PF8cJmQsDFw1Fbe5IbHBKZoPSSRnIKdc5+4qtOiPZv8SngVp
	cYyYIPrSrVWj1ipx1lU59WSZPrufxjg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-nOctSyg5PNCnHJxiCLcc7A-1; Tue, 27 May 2025 10:24:47 -0400
X-MC-Unique: nOctSyg5PNCnHJxiCLcc7A-1
X-Mimecast-MFC-AGG-ID: nOctSyg5PNCnHJxiCLcc7A_1748355886
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-441c96c1977so20470755e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 07:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748355886; x=1748960686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=iscfuDuUziUXn3bGLGBI4h412Reol/L8M9j4xXx/wBGC82Vqc1fohQ/DLvI1Kxfbwg
         AgmOBZV+G3ozYMuyr5ZU7axB8H6/ENxQePZuFtg/xpDMH2QUzqgWGSjCtKz2QgSlesmN
         Pe+gPVEdRfp3vusotV9hcsAcdrwGv8p76dPvxYftc/c/mc6aNSYkJtGPpKkdAIg/V5tM
         1GULYOrTSBfAAgtW8qbDgsRRUQrn3nP7K5sRZJlnfUL87rA3pcS4kYPlED+KM/ZmP1V8
         xYxAb6JMBPVbLpPXGLiHGizLpPSspt3oY+FoK0PSYobUuG0zwBltLtAhJp8RhtpeiqLd
         EAHA==
X-Forwarded-Encrypted: i=1; AJvYcCXrSrOukYRUhVogAWXfa7bKHIL+Anu3gB9v/LSNYdvnfHRtT4DU4Y6+IgGpfoM2sPSPeidP+SGuBiff9VJkjHk9@lists.infradead.org
X-Gm-Message-State: AOJu0YwtL/kcTOqVxLz5hzMI5l3UGjMZY97g/pMmrsWR+9NvGdaLrgft
	0aO2pfb7HunByXnxoV6Ys0xFVQFTff/Ynjd7f7q0a1pFiDjmswTOJpmVy3QFMMoMCZMPY4pogUh
	ZRhTWFy/llzQqf4DqgdlGXgz8Y7W/WkfUlhkfCM+8ke0+JMGaJ0Iyo8EAa3iagIgIkzlOu8/7Qx
	kV
X-Gm-Gg: ASbGncvKIDxro3SWpVhXFktHzVUoZUbhDFKjIxcbY9TjMdPmXZRFigwzLSlFingUkMD
	95/7ePyhRkcpROaT88b/30GIhytaJMyveis6T46lRpJ/btjxwF4nLbwcQQdanQzU7W/c3zU+13i
	6V8wVxd20uxTQWAwfoStmYRdxnyKwzPbnIL1Yj8tw8s1XxKBUxGMfCz+RDYYdqnHaVIVAkWdVoF
	xSRbHks5s0lCVY+35BDhi1U260EpBsgq+821QDYyHTYouu0yXjGBawbPEI7TdMw/zuCARtHQLAt
	FwM9o15bfV6FfWWjuqwyOgSavro4gDKB9lMItEWIgv+RfXPD27i7Ytnt34WuQrklPieW4p4NVw=
	=
X-Received: by 2002:a05:600c:5120:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-44c94374ed0mr124869965e9.14.1748355886244;
        Tue, 27 May 2025 07:24:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELzaCUvaTNc9Adiu9Az9zHtuATeQC88HKSvkrZ4YDOc4EmiLqQ4b0pQxQ8ybi5Fu++RvO9Hg==
X-Received: by 2002:a05:600c:5120:b0:43d:683:8cb2 with SMTP id 5b1f17b1804b1-44c94374ed0mr124869595e9.14.1748355885791;
        Tue, 27 May 2025 07:24:45 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3edcsm278766415e9.20.2025.05.27.07.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 07:24:45 -0700 (PDT)
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
Subject: [PATCH v2 2/3] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Tue, 27 May 2025 16:24:33 +0200
Message-ID: <20250527142434.25209-3-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527142434.25209-1-sebott@redhat.com>
References: <20250527142434.25209-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vGak5ZUeCXQh1IvXh-2nIy93Ao1nuPCojMLi8ten61Q_1748355886
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_072449_608844_57C7C2DC 
X-CRM114-Status: GOOD (  14.43  )
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

arch_timer_edge_cases tries to migrate itself across host cpus. Before
the first test it migrates to cpu 0 by setting up an affinity mask with
only bit 0 set. After that it looks for the next possible cpu in the
current affinity mask which still has only bit 0 set. So there is no
migration at all.

Fix this by reading the default mask at start and use this to find
the next cpu in each iteration.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index c4716e0c1438..a813b4c6c817 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -849,17 +849,17 @@ static void guest_code(enum arch_timer timer)
 	GUEST_DONE();
 }
 
+static cpu_set_t default_cpuset;
+
 static uint32_t next_pcpu(void)
 {
 	uint32_t max = get_nprocs();
 	uint32_t cur = sched_getcpu();
 	uint32_t next = cur;
-	cpu_set_t cpuset;
+	cpu_set_t cpuset = default_cpuset;
 
 	TEST_ASSERT(max > 1, "Need at least two physical cpus");
 
-	sched_getaffinity(0, sizeof(cpuset), &cpuset);
-
 	do {
 		next = (next + 1) % CPU_SETSIZE;
 	} while (!CPU_ISSET(next, &cpuset));
@@ -1046,6 +1046,8 @@ int main(int argc, char *argv[])
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
+	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
 		test_run(vm, vcpu);
-- 
2.49.0


