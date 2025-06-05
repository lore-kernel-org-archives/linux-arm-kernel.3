Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CD9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HfZ+Rq3UxyS14Y2YLAxAGNmm5WZCXoHrHzmHr+0WtKs=; b=xbe0G8VraVVDowVppsGnhvi9Rp
	ZmQES2Hd8nmFK0YhmT136OdsoPWWbKQuE8JZA1fPPozqQE0aDpofbQIWtjkA/by9QSGmpy6AyVcvI
	DBil+P6HUX38onZMEG4gyUR+9pWrOOPGu8svii+Lvfu6fmJft//If6K5rkGhO59AAOBOVZuQPav7z
	ZO1BZXud6eRmnkZvkRYcsuXQMxr+8vY2blD8amhNvloHVIPs2sUgWz6wXwj2AmY+81M6C09eH8yhC
	BpZ6JXp72FK1LHclHwDjTX/nGP4XIMpwOp/R5IIGa7LQb4x//YGU9xTjr6g6LZnDLkak3/ZVnj9Z1
	aX0MX6Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN82Q-0000000FHIw-2d0Q;
	Thu, 05 Jun 2025 10:41:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7y2-0000000FGZl-0LNt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749119820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HfZ+Rq3UxyS14Y2YLAxAGNmm5WZCXoHrHzmHr+0WtKs=;
	b=WG1bS25mtp8Lx11MI0+ZhoXggOMZbnVR8eDGhPDSglXPdlanClf14ZNAx2p7jELzEFVZuU
	VClF9uz9H8ipsc3FOdYFgbazgymmgs+Zkw8XXhjRqGph+QG1i3UV8kqhhwVZBWkwOjc12S
	2qx4gzZLCNYF8OS9FHLk2VHzagNx7EQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-0a6cddC8PmmYymnJnJ3fmg-1; Thu, 05 Jun 2025 06:36:59 -0400
X-MC-Unique: 0a6cddC8PmmYymnJnJ3fmg-1
X-Mimecast-MFC-AGG-ID: 0a6cddC8PmmYymnJnJ3fmg_1749119818
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d50eacafso4502855e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119818; x=1749724618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfZ+Rq3UxyS14Y2YLAxAGNmm5WZCXoHrHzmHr+0WtKs=;
        b=CwZl3XXslBA3tuoQGoG2X6xQq7JoDcIs7em1vx8iKcxacL3YZW/kT846BVH+FzuTq/
         OnDIRH20/87Df74Qa7ysoLeDe8vtr6egXgMo0/Muqp2HOBk5eWB6OtNiX0ZTuejhKIyB
         IWJlWAdYOLGLIMGCOaHtvm6uadrY5dNf8lwgiJQpgGcub343ooJoEHZTIWpjfAuBYgcV
         3GHlI8FXK8HX2WB2s2IJr4ZJARi4z83RRunVUe0dzHlwNaBePeQWAOrC8n9wR5/9CdUD
         5tmMD3/s0BI0dxUMVKuC5pu5OkzWB2JMsJNb/BxEfI4euBBhr+FECCAx4+JYfCHQTMuT
         Z3KQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOcBelggWhdpMnI/FkYwxt5WEfs7O3InhtUaJts63sW6lLHSm3sh4IADj+viwCDorOT5LXYiGeGJyVacbuEwbq@lists.infradead.org
X-Gm-Message-State: AOJu0YxMUtvWIcDFt3HxwIzhvTiXbBJlZ1zhREdnCPP/deFR9RTdCG8c
	u/xEzta8Qmsa1OTJFqi+iboxOY0x3E0i4WfZ6CFzFF+D0QLxVetP49UwBQU5S/Ok33z47NAgrvI
	Kv/RKx3NC9P/65YKQYim5W8YxfeE841IIfW/vFwpO+WziPTL4der6qrUo3DU4taZCBQoAJWm9TH
	SA
X-Gm-Gg: ASbGnctRvnEmgXpzHXDlZYCgYCkeuIcb5toAfLyB+nB/3bazJ5Ha4l+wCq2iLj1GiR7
	WJnIfvBpm4/Dz7MaWUv9oHToP3BDf9QzXm8CGeXRAuuGetlEv2F2tjuF3n6GOUI49n7E30LPdOU
	I+krzZGSYtOsDH5WyiQj3s1+jjz7nptavzz8qnsGu+wKc5SlCx9f8VqyuuEOmams0B/8S8fMWd0
	rE8AFPIxyunOWIlNW2VijbbQFafMb7Y7tQZPASn5ynvkNAq6Cd+8gJJrfiMEuFeMLratn4VN3wF
	LDL4DlsN/Mjipn++qkgqRy5BMeBoggTPpHtOKPEieE0GfYBRVpxUEs4Q/VXrcq8q3hDgLhFLdA=
	=
X-Received: by 2002:a05:600c:64c3:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-451f0b42832mr62125315e9.30.1749119818015;
        Thu, 05 Jun 2025 03:36:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1bx8suhPbgO55wHNgDBL3CiHw3bkoX/59SOoKYKbZiUG9FMRz0rmV3itW+HwRwGTHenI8UQ==
X-Received: by 2002:a05:600c:64c3:b0:451:df07:f437 with SMTP id 5b1f17b1804b1-451f0b42832mr62125005e9.30.1749119817668;
        Thu, 05 Jun 2025 03:36:57 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f8311ae6sm14105175e9.2.2025.06.05.03.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:36:57 -0700 (PDT)
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
Subject: [PATCH v3 0/4] KVM: arm64: selftests: arch_timer_edge_cases fixes
Date: Thu,  5 Jun 2025 12:36:09 +0200
Message-ID: <20250605103613.14544-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XHTZF0OJwP9nI-nQSxfBtI33syQ5AyuNzLamSCP9sLM_1749119818
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_033702_189177_65F0827A 
X-CRM114-Status: UNSURE (   7.39  )
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

Some small fixes for arch_timer_edge_cases that I stumbled upon
while debugging failures for this selftest on ampere-one.

Changes since v1:
 * determine effective counter width based on suggestions from Marc
Changes since v2:
 * new patch to fix xval initialization

I've done tests with this on various machines - no issues during
several hundreds of test runs.

v1: https://lore.kernel.org/kvmarm/20250509143312.34224-1-sebott@redhat.com/
v2: https://lore.kernel.org/kvmarm/20250527142434.25209-1-sebott@redhat.com/

Sebastian Ott (4):
  KVM: arm64: selftests: fix help text for arch_timer_edge_cases
  KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
  KVM: arm64: selftests: arch_timer_edge_cases - fix xval init
  KVM: arm64: selftests: arch_timer_edge_cases - determine effective counter width

 .../kvm/arm64/arch_timer_edge_cases.c         | 39 ++++++++++++-------
 1 file changed, 25 insertions(+), 14 deletions(-)


base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
-- 
2.49.0


