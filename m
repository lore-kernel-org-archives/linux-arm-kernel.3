Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20701C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 13:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i9ajgtVhRkRu/fetH+ZVxgjeh5ygn/8IE6ERsxCS2jY=; b=s4ujbeVo2n+ACNEivFRzKGBEaU
	frQSpmdSEm+WjMGHdh45RU3Ic+pzlMfA1RinKD9xEDN/VW8Wz04zhE+VrolIcXMLUBg0gFf2sW2y5
	QrUK83CSXVl/7Me0C9ENwjd5FHIEsQWxc6qiJLVHVzSwYPWMo4uRZe35YvtjkiD5eQ0uDMTrh6ajM
	0mkbu0zJtn4WtYPHckTCv/nUKCv3VkORwwQNmbiw5XMZeLbiPTZq2nUN57r9IoJvJovim24FO5/Wh
	krNOq3pW058+3U/uAZ/5wMJUTN1bVwAYTjtSR/+4rU8fx+b2GaFwq0VkWrGEJsueZWGz4B6vv2f4X
	qSj6CUPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmMI-0000000E5Kz-0Xgl;
	Tue, 11 Aug 2026 13:17:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtmMG-0000000E5KP-07HH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 13:17:33 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2cc61541f8cso12458545ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 06:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786454248; x=1787059048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i9ajgtVhRkRu/fetH+ZVxgjeh5ygn/8IE6ERsxCS2jY=;
        b=N3Sy77+6AINoLe2iGf1DWXZYS0obO9HnuR0DcYuG0vQSKvh4Q0B+3xSlftuQLmpqCh
         AUN5T9Dv9uxI5kCPIUnzTbDjwkxcnQpnQ1bNzi+5lSvfr/5fEB9vjcE7wNt4DQ5o65jC
         h34M/FPKH+P0EOgwlFoH42frN+tacSzLWDRsl/h8wCGoxiQVPTaPAE9a7P/Hqf396AZX
         JTrgJF87u6Z/EovrckQM/GCdKnh1JHz3O9G/jawBwBTKqs+Foc8c8/08BMPeJ7/LUgo1
         namIp+19Ic4hLZjitpsj614HVAth0GxfLjyrkQT4H6GT6IWntok1bYh1Xx3TNEarwnSW
         6MRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786454248; x=1787059048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i9ajgtVhRkRu/fetH+ZVxgjeh5ygn/8IE6ERsxCS2jY=;
        b=L88+yhml0eAdsYxzqVQQ7ZYSm+ntYoNqi2Q66H03EOCQnBGehxYrD3ZXF8IzLukYAB
         v+OI88A+cIbExcvrIGnEFdIZXtqoCn7TQmX75OO+yY0BDc6X9INDAc//+G7HdN2d0SZA
         pwq7QxrXDkc7hHNxKzYk6Qa22QOsNgty5BL56mHYG8uRWFcUv29TmLtxngmlt9vZKd7e
         FFHuq6/RD5AMKhTY01CD+KRqLFaGXZVMvdH3KBbQ8Ew8p2I7QHG8CPqOEQ14IIqOcKAg
         pAT4OVTGsvh18wNyi1sjJ+zmt61ozS4othcko/SzX2qxpAR7ma2tdv3XnLKd+8zYHTLQ
         9hfQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB5c8Rwncn09KU1MdSjx/jFay0P+5XlCnKOo6KdFqZJC49oyNO+oXOs6MOO3V0eW1yHC7bqOBQPAi+zzLJ+Rua@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2V8o5lzx+t02T1h1TXMIS0eqdGoBG/9mVYrtG6BWe3CinpTb2
	j3rlqqIlfIcAPkJvW1kcOB7xTj8r4BYTfRhFK4iiZZ6WuJBjNfwrwpDPCO2rCKwgtpw=
X-Gm-Gg: AR+sD121zY7F6r04BGey0VH9VTmtZSqLe08vgmDWypBj+q411I1+4ddW7Xljf6YPT1t
	OtBVwQFMtiDSgx29yiWF+TQNsiw/+hBmAzRXhxumBfiU3pOrMGUSC6PaqbhZxmN44LPodsh0mxV
	i18sQ50fIZ90uEKTDKDOgkbt/OMVbFOdxPOTYAtJDLCzuZgX06CZRuqtt8a8P8fysX2d8LTBjMz
	aRLS8V6KD8a9pz6Si5GaZr0kQO6qiwZV6eq93CETJBqeFWaH7yb8UwYwF/3fyolwr7QW/yAmIbL
	QijLN+/mR+JnuMQndyM7XBJ0aUNRW811w5YsRp6Ta9hzSGKfemuaJgZcjABHhI7CLWmUEwcjRh8
	zlo6spmSI2Zn9mxOhjzDRDYhmCY+QSuEHst8bIn+f/Cu7BgcJ2ugOyjHLqv2ZtFBXiXY/LcjjZq
	6bu3KZ0C0j55rJb4YW4hXhUGtSgDMU4aYWRWNizXED788nd5qBQy4NYWdKVwbxtYdMU6uPjqJqD
	88pciAySq18kKmMUZ7BePCXh88zb0i+gcNfqQ==
X-Received: by 2002:a17:903:1b50:b0:2ca:53f7:3c69 with SMTP id d9443c01a7336-2d32da4e721mr506085ad.9.1786454248223;
        Tue, 11 Aug 2026 06:17:28 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([178.93.176.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31c64237e9csm5020593eec.18.2026.08.11.06.17.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 11 Aug 2026 06:17:27 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v2 0/2] perf/dwc_pcie: Fix lockdep warnings in device and event setup
Date: Tue, 11 Aug 2026 21:17:12 +0800
Message-ID: <20260811131714.12779-1-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_061732_095471_2B660BD7 
X-CRM114-Status: UNSURE (   9.60  )
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

The DWC PCIe PMU driver creates a synthetic platform device for each Root
Port from its PCI bus notifier. If a PCI host bridge is registered during
late init, platform device registration enters the platform bus notifier
chain while the PCI bus notifier lock remains held, and lockdep reports
possible recursive locking. Patch 1 moves platform device reconciliation
out of the notifier callback.

The event initialization path has a separate locking issue. It walks a new
group leader's sibling list even though perf does not hold the event context
lock required by for_each_sibling_event(). Patch 2 skips those walks for
group leaders while preserving validation for group members.

The series was tested on a RISC-V system with CONFIG_KASAN,
CONFIG_PROVE_LOCKING, CONFIG_DEBUG_LOCK_ALLOC and CONFIG_LOCKDEP enabled.
Late PCI discovery and a system-wide DWC PCIe PMU perf stat complete without
lockdep reports, and the kernel remains untainted.

Zhanpeng Zhang (2):
  perf/dwc_pcie: Avoid nested bus notifier locking
  perf/dwc_pcie: Skip sibling walks for new group leaders

 drivers/perf/dwc_pcie_pmu.c | 161 +++++++++++++++++++++++++++---------
 1 file changed, 122 insertions(+), 39 deletions(-)

-- 
2.50.1 (Apple Git-155)

