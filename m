Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB3DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gtAIVrr8kKwpVUxcVvvrtpb7XAUtMtKSCzGNUheW2Ow=; b=JITqEJITNKF/zR
	CmSI4YqrqLhZEu6QNyreYcT1C6fAVMRSKsOyDTQLZFEwWpcRNC973/bOSRI2lj642AgfpUYJrT763
	9MKoRyVfQBoFYh5Z6LXFTFKKff0afTL1F3nuGUCmC84RvHV1DyCZ3ybakAeNV+LhjkWgiQQ22jUk/
	1fc4VBn8Su8X0L1ogl7MxcchZHSVOz1fWZkxMewmx0UG/Ukm+Ni5upW9bL4BiyoDTOnUj+zrARwfJ
	ssJPdbXCvZhIVDHQZD6np0qpeHTPhINDH0VF7+1WLzlpXG29BRYjzpP1N0gS8bxc6sBmnSNK6ZE9F
	t+Dqk9Vm1uuUsDgwJMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uorN1-0000000F6j6-1yMO;
	Wed, 20 Aug 2025 22:33:27 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uonH2-0000000EeJR-3o1m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 18:11:02 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4b10957f506so2592381cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 11:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755713459; x=1756318259; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gtAIVrr8kKwpVUxcVvvrtpb7XAUtMtKSCzGNUheW2Ow=;
        b=FBWcmrUXS1Ozb7ERcOIcybYwxkSjm+BOd7OsodNmmyJpnUb7MnD0JC9WaSpJqsaZme
         0NTuQUy0WBituh0K/qcMA1z9t6X0XiUMk+Fq7+Ioa6Npqw/ZpZbXefwIsUqjWvK0CQrI
         FnC0zgo5FXFJVXUFcROAc7vVvI2kaBOm9thGm5k1aNFWYWiabRXkejLJ0j4PzZsu6LtX
         L2GlyztpkvryO92Safca/YStt06DC5PULgf1V4TDS7PWtGkX29gbo9Cisg55lGr0O40R
         6L359M9p/ELFj9iISAqy5EzOaNqqt+rjqxLAKbP1AEe5FrgZHeo9HlZk4W0i29L6CVUo
         0rFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755713459; x=1756318259;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gtAIVrr8kKwpVUxcVvvrtpb7XAUtMtKSCzGNUheW2Ow=;
        b=Ygd4NJE4pE/xuHIQjEHsbf6PotDxsOp9VEqF1hh+njyqiHHJxVsfPir3J1oxQcZy1U
         hP7em5kqEsKdY46Pjzwk4Xk6EaE+gTQdG5B8p4kN0fMb6wfDRAwu/ef89JGqXlrRcQpv
         /Kr1JgGX2gALrDaEBJHbeKrFVUEfsv9qmRjPPTR8G7ggmfvaxUsPcxCXubzjHBIcd2jj
         2szSHUk2xisEGsk1ko0tI9xL+F+tE8w8CJKvk/StAbPd4CY7U2vDjGMNvrZLZDpLU8mT
         kooOs8mv0mIW+wr/SIlk4lyFW4L3hi+h8SNWFM4+jdt3S0rEX46x3yYpKhfOmC1/fM0y
         TSaA==
X-Forwarded-Encrypted: i=1; AJvYcCVbke32AvccbWAtDlyxpGAQqwjuvfeOwkavJrfSF1cCSiDPItVnxlrlQK2t9Tz0TJKO+j6P+OD5lKJnk4PlUkZp@lists.infradead.org
X-Gm-Message-State: AOJu0YxDk6eJBQBehtNmbYFYeipa65m0q/+3dzQVdvHW2jxgcbkiavwu
	CdiQyhfmISwBf0NpK/IU2p+AwLCmiZtKZmvnAs+hXNA2x9gP+h+FG+0Osb5CkVWBCw==
X-Gm-Gg: ASbGncutr0ivDrIE3GwJXwLG9gieiRQjjsmFRV1xo5FBgknDeIDjWcAM343M2Z/ZPHt
	0BZj9x5qpjiNDL/kffqufdt3FGMbG/LkF/ces3lX2DN0/vqK5jl8ZcmCao8lIGljVKvXUDMtGWL
	WIgP0Cza8E3n8WqFVkL4TgVWPYRvq8gVYqnlIQiqYZ6/5f4FArbEgm5DSPa6w+GvEmIzuC4Ivks
	MpUgr3uk/hFI1w/sTaURCOYOXno+yZ+suhoz94Fc7PFrbHAmdH9IbUCL9yyBj1Dz4Y2pUWglIRz
	fpxaOpSxhTLxGDdoLtxRE8sQ5QT9ADMu6K+HFX/k+NLqijp7zZvRlb7/lRt31VkpojF/T+SeAba
	NttVSNUtzVEKT/uBURLwfznmmmRVrEKLE8O5ilz9ltq7DJg+hvent13zB2Fo8u0QmBWdI7PxJB7
	/cry0gsqGP8Lp3SE32oxYuhgMqLe/odKZuKMcZEBXIdCQwRQ==
X-Google-Smtp-Source: AGHT+IHfwF0SHLGbBh6c7/vZywX7H0BigZ2QG6D5oe4Z2s4ohRyshmxOsFLeEGyGni+YNfdJqd8KSw==
X-Received: by 2002:a05:622a:18a6:b0:4b2:9a53:7c15 with SMTP id d75a77b69052e-4b29d6cb53dmr5722711cf.25.1755713459313;
        Wed, 20 Aug 2025 11:10:59 -0700 (PDT)
Received: from jcormier-MS-7A93.syr.criticallink.com (static-72-90-70-109.syrcny.fios.verizon.net. [72.90.70.109])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e076811sm977497485a.36.2025.08.20.11.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 11:10:58 -0700 (PDT)
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH 0/2] PATCH: firmware: ti_sci: Add trace events to TI SCI
Date: Wed, 20 Aug 2025 14:10:43 -0400
Message-Id: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKQPpmgC/x3MQQqDMBBA0avIrBuIgVTsVUoJQzKpA5qWmSiCe
 HeDy7f4/wAlYVJ4dQcIbaz8Kw39o4M4YfmS4dQMzjpvBzuamcu6hwW1koTKQSOHKhjJjH1ODvP
 Tp4jQ+r9Q5v1+vz/neQEOqIxMawAAAA==
X-Change-ID: 20250709-linux_master_ti_sci_trace-91fd2af65dca
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-trace-kernel@vger.kernel.org, 
 Jonathan Cormier <jcormier@criticallink.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=30hBneVdyS9iZwz/B5yGbZLg6bVYoB+QLeHzqt8+awU=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBopg+xuRBsVzXaYKYyTI5vBfVW51jOnFCmZ1pIw
 ALJl+D7eYSJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCaKYPsQAKCRDc1/0uCzbr
 qnE5EACMWtJmoFWZA+MCgRUIDFZR3DCrO0PRy+5QYmFUEZxTCaxsULzwf3WoegqeAkhtD8wPqQH
 0swjGhM4l5p84Y/LbNS1US6BfVATP2zHMwp3qOwX9XOYhIieOxNqjT1Beawu218666Zn8YkE0on
 Wx3/64Hf2mv/SMPV9RUv6DEZivri6H7RKv+l0/UrnNWE5U17CAPOBCRBY4mLPEdw0it/37FbdE2
 eG7sry5a4qI6SrT6uPND93dFai2vqkcagDBE48BsZOpwfNcCP3UAuhoXupUttyTpYel1sPRKAen
 kckLOT7o627QYo5ASWVAhgl1x5gJmIZzF/gTBBV1C+Zr/9/baAUSsDGdtGJf7VgyuxXBdQX4hO/
 CZ9neF0EI/8wTXntdLvAnIrLi17PVFmdzUVjG3i5/r7bJH65eY1migrCCQI6FfJFv5zhxAHiFTZ
 LvgRJjMXKTFHJjUIaEx63lVmPsfNACiT13FzzTBEFiFLLFpCXQj+ntVeInRhFpGi1pVvLgzEvjT
 cTCSaDC54RhK0upW+mCaHZVvjSlq4svDQ/8Y+e5vzhHX60aEYafZlXpJQtn7VJMcruc5uPIhkmC
 0okS49r2Q3B3nRJbCS0hXYHEEo323eSc/P1aA0QfpmwKB78FoQpyOFoXwVW3lMv2VpVKV8rN6L+
 aF+I49vn205iukQ==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_111101_036650_FDA8CC35 
X-CRM114-Status: GOOD (  10.00  )
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

Add trace events to help debug and measure the speed of the
communication channel.

Add parsing of the messages types but I am not sure how to parse the
flags, since the REQ and RESP flags conflict. Left as seperate commit to
make it easier to drop or make changes depending on comments.  The two
commits should squash easily.

Nishanth Menon and Vignesh Raghavendra requested I send this patch
upstream.

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
Jonathan Cormier (2):
      firmware: ti_sci: Add trace events
      firmware: ti_sci: trace: Decode message types

 MAINTAINERS                     |   1 +
 drivers/firmware/Makefile       |   3 +
 drivers/firmware/ti_sci.c       |  11 +++
 drivers/firmware/ti_sci_trace.h | 146 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 161 insertions(+)
---
base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
change-id: 20250709-linux_master_ti_sci_trace-91fd2af65dca

Best regards,
-- 
Jonathan Cormier <jcormier@criticallink.com>


