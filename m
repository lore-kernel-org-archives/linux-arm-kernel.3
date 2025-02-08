Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B05C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Feb 2025 10:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KovnzCgz7AwVJ6lEFg7h+ozZOwfcsBPGYDizlK0um/Y=; b=SuF6phVSMpX6O+KWHFdhkgCn0y
	1agpjaSTpgGgF7d27rWrJTSf6I/CJmjjhv9KkzD2o5uPwlrGVw79C/wompdqud6cTjW7rfq5lGIN7
	Kf2ohyIbTNRxiaptwNfRIQN3Fnt1k2G/FS5uT9WnPAPvZJWQ80UpRF5ydCoR4Kqk9Vw3l/vZdToOU
	yZ3k1Mk7YjUKTAQG34Mc8hQcnpyFEnHod9HQB3Dd7JkZ1+vfzGAZUjMT1LLuq27zYbajyrtwQn2DD
	XibBa97iOJMZ0FIY8m4BdYx0Wi9b3SUrVOgIViiXKv6r6z238GOfG9lV6RbhvryaHs0IXOQdLRBS5
	pYGKg/Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiHL-0000000Clt3-3oBI;
	Sat, 08 Feb 2025 10:41:39 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgiFw-0000000ClfO-08Zk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Feb 2025 10:40:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21f2cfd821eso52512295ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Feb 2025 02:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1739011210; x=1739616010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KovnzCgz7AwVJ6lEFg7h+ozZOwfcsBPGYDizlK0um/Y=;
        b=ie9FWWhrNU0Tqj+TGcyRqFwdk1Q/kLeZ3vw34VG4E7L/Qk5uiDmxFJ8ZilI9fj0Q3F
         hLjYJXkZG8DEqpyDLVUhEbq1AoD8Nn6FO/Bhe2Xu96q3UXQdjIF5uFf5cjX/y6J9xyw4
         iT2gViWKuHExM2Fv7NWB+bcUk4DZHbzutXubR5GL7Ux3RuXLFOvSBIx71EBtJTWjxvpz
         X9z13EYu+c9s5JzaRMJdtdZPe+KzBnQPZsJvgGqqB30AufbttTqixzyj4Tb+ayGKem0e
         2Bhc8e8JakpleOqzL9PYNQ35p74H3pmOu5wZFGO0ryXsFjRT1psTEakEAVjra73i7Qb0
         XdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739011210; x=1739616010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KovnzCgz7AwVJ6lEFg7h+ozZOwfcsBPGYDizlK0um/Y=;
        b=VdVu5fFhixL8l3SM8n6ny9WHPzKOGCJyBp0D7Qe2qITjHUZL4sgHrWNkl4kY4Ifuak
         ue9OH//P2b3wuG2HfGL6yNURJWlk7TBiUlkw2U2kVXjYYbXTHDlqTc6UOukE/r2SMb9h
         gQJDYth8TI8quDKD6d4cRfk2YBdd1bryKP0bk9NOFkDo/u09zPtPb+J6cS8uwfqbIj4z
         fIQDmqJOjkC5swTi2zkbeYibspHGWywHotbn4RgCFseeIy3mMbu/Ce01J5H5NRJGUov+
         aT+yXaN49x8uxbpBLjR0vdQWJxCE1m5A6HCXk0IIuC+Imo2jG/tRBHAw5jC6Tbib0+EW
         EtLg==
X-Forwarded-Encrypted: i=1; AJvYcCV9m2QmJtsmbtkeJ+fz2CAWdkywyXGpcI89mtvxgdod44T1cyre7c9QIdBfHSrD8UZPVWpa0Of0jhDspwGKCVRH@lists.infradead.org
X-Gm-Message-State: AOJu0YxWQYb/n71g0Jz2rpDLHL2fHy7gpYEc/sd7MKrnLWDdws3wY7tE
	TFI/eTAIBWRp5oMNPcqIQrFcTFlxX3J3s63Zg3M0a6c/J6IIzk+gb/T1tFRhd7k=
X-Gm-Gg: ASbGncuxif3EshZ/juuAXn1UiwjR1jBE2cG9YgSb2ef5lTnJUt837A/myAi8L4QdDcJ
	gD8AyfY9zUKhO/ljAKtrxi/esEjR1OLQyqwpx02jCHhjcwphehwFwLwEFAEJDRUd6DFA1sHSzIv
	7aFJhgCd7eJEa888fANZfI8/T6GXRC5JkOi3k6EGBusBBfwlQ+sRVNwYNFkK6NLWnylI04YaRd1
	lFrggs9QmdoKjdOi7nIAytRf9AEFgnFWTL23kzf70Haw0wHXdqV6slwsMAlbFtLjc/tpui9yInN
	dgKCZXARB1c6zf0DsAfPbmxY9OPZiWgzkrwH1pLjInWF5etwxQ==
X-Google-Smtp-Source: AGHT+IGSPFgo5QCYcimkb+XiEeh3bQEyqeTJJssvf5CdfYBuqY0b4jRyXxCKJwCm5DVcccofry+Jsw==
X-Received: by 2002:a05:6a20:d704:b0:1db:f68a:d943 with SMTP id adf61e73a8af0-1ee03a41bd3mr10089837637.17.1739011210415;
        Sat, 08 Feb 2025 02:40:10 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad5460b8d4bsm216325a12.11.2025.02.08.02.40.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 08 Feb 2025 02:40:10 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: xueshuai@linux.alibaba.com,
	renyu.zj@linux.alibaba.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Yunhui Cui <cuiyunhui@bytedance.com>
Subject: [PATCH v3 0/2] Fix dwc_pcie pmu driver issues
Date: Sat,  8 Feb 2025 18:40:00 +0800
Message-Id: <20250208104002.60332-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250208_024012_339959_AAC372F3 
X-CRM114-Status: UNSURE (   7.77  )
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

v1:
Only sent the patch titled "fix duplicate pci_dev devices".

v2:
1. New patch: "fix the incorrect reference count".
2. The "fix duplicate pci_dev devices" change is made in two places:
One is to remove the modification of the PMU name. The other is to change
"for_each_pci_dev" to "pci_get_domain_bus_and_slot".

v3:
patch[1]: Remove the logic of "fixing the reference count".
patch[2]: When pr_err, also output the sddf.

Yunhui Cui (2):
  perf/dwc_pcie: fix some unreleased resources
  perf/dwc_pcie: fix duplicate pci_dev devices

 drivers/perf/dwc_pcie_pmu.c | 53 ++++++++++++++++++++++++-------------
 1 file changed, 35 insertions(+), 18 deletions(-)

-- 
2.39.2


