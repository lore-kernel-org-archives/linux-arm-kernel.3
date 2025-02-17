Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AA6C0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dLhLqEj5CnQGR3HAISzr8o6znCJqNhfLLG9jh4rRpzQ=; b=zSpcVXzlFK6InhUMhHWiLZ5ymX
	omyFqGDhMrCv9o/CVSDO1tQCsUO9sIbCSkKXO3bs4+z7ugmELsGfRSfmjBfLsRm/BOoW1UcjHR/HZ
	7Cz9HhaSphmQkZp4cGnjYb/TWh7VLgTuDTo/xq6laHkk3MilXZqezdqYkvfxkliIg/tVPIB7ZEQWT
	tJYtDGXL6UNzRoBiURN4N32WHaIiiG4Za06o/biWiOVYzVQsZL1XhqkDsR69NqkXE1ztkE5w1SaKZ
	j/8LL8iOc/6irLDPZD51LwTinf/juuR8pVjEbHpWMr8WD1zoZlBIi9Tnwiwz3WPZLc+aW9QK6ejcO
	A3GMSikw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjykm-00000004Ay0-275m;
	Mon, 17 Feb 2025 10:53:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCB-000000045I6-2jo4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:17:48 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de38c3d2acso6554524a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787465; x=1740392265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dLhLqEj5CnQGR3HAISzr8o6znCJqNhfLLG9jh4rRpzQ=;
        b=KWgFH3PPhG+HeiaPP/gRRqjq8EdRFOpVpbLmwP664z1P5P1mt5G2VQCt6SEi9e0O30
         IafwLxjLMwWxPEr3JVlxdVSgex8eHsPU5c+VrZFQnfwf98lPANdX4BbQgMIeMYxpKUu1
         jISkGXMYojLjSA2vEXlsUGl6LbDwaQ6R/Gf/F+xMUzRYblg5CykZ9C+nPM901ZTwZf80
         HaY+8e4NvlnP2fqqyWfYl1E4DKre0KA5wU4KWrTtB16MaS6Irqw40UZCX7LeJ/GPZBG0
         z5PDE9icdRZedUcd1sdfmpbw7Bf790pVUrpABe2FZ8E+q7AqrZ4S6ou6JGHzw00QfSuG
         czRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787465; x=1740392265;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dLhLqEj5CnQGR3HAISzr8o6znCJqNhfLLG9jh4rRpzQ=;
        b=Wl7vK737hZHvzQ9mleyLICpZXDl4tqZwjbD29XnCVoPkvhAhU0K11X26I45a4EfJ1z
         ug34exi8alvx9Odcd9lbOIJxzVmWiUqfEkXemf2665nItclB3vc9IFT2vL1CjP5gxN9Q
         5hfNfgOt81C301KBGAqsN/NMvgI95zhZWA+UwI9dOI1A6QBZGWRam7ynZEXRbX8RokA4
         O2VsxFyymAfXUhE5SeQsWcOIF420co63F30TDgayJzApXEVwV8QNacFHtZ1cJfVijgiv
         sXzyHUlfmPfGizTwYNPI0Dkox+0+mKABkRSB8bOrEHWAYQDxXbPba9Z31wmyBkQ71ohh
         V5lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOL4FGM7VAw3A0T3WPZnxaAdw54XEphztX0QmNwISpFfpknXzOPdjtWjg1BsFORnOR8oPgDdP2988E+xFI8uLV@lists.infradead.org
X-Gm-Message-State: AOJu0YzEpDIcenYzxCN+rTO3XgGH6VrpWFemM8O4bPCu5p4v1RFO3KHX
	Z0G7FmQ7B/EWnCmMZ774pMuT6KQU6dW4bRyWPQhUY0N/oz0b0Un1kqf9yziAMCQ=
X-Gm-Gg: ASbGncvAGRGTpKdYu4s8NLe5Zd9i5qJ95gbJ7EYVbdwtONCikiUUL6HxI5WM/1dvwA6
	K4xOyb8/XsFdA+5/PBBRLCw9DC4tbvZ75tEsUFfHbxPaHJLLHMnAFkPxVwkfBeSBrhSJkb7esJQ
	TbltxKRFFh6SXbz376QS3Y4+WS0x78vIeVreJYCWilaCwQHNTSRV4olmg+AH9HFbdotGKDzkIen
	c6mahx/9hLyjNHANkutCQHA6CFoLShxVhtpH8V+fnoKlpp+V8Uzs0iXjCL91rrBytOUhYCAjNmI
	QW/E/VWPy+8xZYaFop3+a2b4
X-Google-Smtp-Source: AGHT+IGhAefa1tvvBaYve+g3pCx7CrvFHmDaSY+YPBz5y8cOdMoT47LHpy0cyxq3ytVFBIUJ3pcdAg==
X-Received: by 2002:a17:907:2da0:b0:ab7:83c2:bdbf with SMTP id a640c23a62f3a-abb710dc6cbmr892362566b.41.1739787465317;
        Mon, 17 Feb 2025 02:17:45 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:44 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 00/10] pstore: directly mapped regions
Date: Mon, 17 Feb 2025 12:16:56 +0200
Message-ID: <20250217101706.2104498-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021747_699966_1FEF943D 
X-CRM114-Status: GOOD (  29.03  )
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

Hello,

This series comes as an RFC proposed solution to enhance pstore and
devcoredump with the following functionality:
It is interesting to mark specific memory regions in the kernel
as core areas, such that in the even of a cataclysmic event like
panic, deadlock, hardware fault, those areas can be retrieved by
an external agent, that can be JTAG, firmware, additional debug
processor, etc.
Even though pstore panic handlers attempt to copy data into the
persistent storage, this is not always working, because the kernel
could be in a deadlock, have irqs disabled, panic handler could
crash itself, or even some memory areas could be corrupted badly
enough that the recovery mechanism doesn't work.
This patch series attempts to solve this by reusing existing
infrastructure in pstore and devcoredump, and provide a copy-free
possibility to have core kernel data exposed for creating debug
information like a coredump or list of binary elements with data.

How this works:
Drivers and key kernel infrastructure, like for example the dmesg
buffer (ftrace buffer is still work in progress and not in the series),
would register themselves into pstore, with a simple function
call taking a name, a pointer to the area and size.
That would be all, and the patch labeled "EXAMPLE" shows a driver
doing exactly that, registering it's own dev struct with string markers
that can help identifying the data later once it's being retrieved.
Further, pstore and pstore/zone would keep track of all registered
areas inside the intermediary back-end. There would not be any copy of
the data.
Pstore would require a new type of back-end, named directly mapped
(because there is no copy, and each zone directly maps the incoming
buffer). If this back-end is available, then pstore further calls
the back-end to register the area.
The back-end itself is then free to do whatever it wishes with the
received area. It can (possibly) do a copy to store data, it can
have a timer to check the area every x time periods, or store the
pointers inside a table of contents (which is what the qcom smem is
doing).
The qcom smem driver registers itself into pstore as a new type of
back-end called shared memory. It's very similar with the pstore/blk
but much simplified, to cope with just a shared memory storage.
The areas metadata are stored in a shared memory that is being managed
by the qcom_smem driver. It's called shared memory because it's being
shared between the main processor running the kernel and additional
secondary remote processors running firmware.
In this qcom smem backend case, the firmware runs when there is a
panic event, of watchdog timeout, and uses the table of contents to
retrieve useful kernel debug data.

The advantages of this proposed idea are: no kernel panic handler
intervention. Everything is being marked and prepared ahead of time,
before there is an actual crash. There is no overhead associated,
simply the areas are being marked and metadata created, no buffers
associated, no memory areas reserved for it. Memory areas being marked,
there is no possibility of getting older useless data, that was copied
before the actual events leading to a crash would occur, so the data
would be the real actual data the kernel was working on.
Of course, this would not work if there is no external agent to parse
the areas and get the useful data. However as the hardware becomes
more and more advanced, in the cases where this is available, kernel
debugging had no way of using this advantage. As the hardware evolves,
so is the kernel.

There is another aspect to underline: the directly mapped zones
change the semantics of pstore using them. Pstore relies on user being
able to read the data from a previous kernel run once the system
has rebooted. This is not valid with the directly mapped zones unless
the JTAG/firmware would copy this data into a persistent area and make
it available upon reboot (which is not impossible).

I would like to thank everyone reviewing and chiping in on the series.

The back-end implementation for qcom_smem is based on the minidump
patch series and driver written by Mukesh Ojha, thanks:
https://lore.kernel.org/lkml/20240131110837.14218-1-quic_mojha@quicinc.com/

Eugen

Eugen Hristev (10):
  pstore/zone: move pstore_device_info into zone header
  pstore/smem: add new pstore/smem type of pstore
  pstore/zone: introduce directly mapped zones
  qcom: smem: add pstore smem backend
  pstore: implement core area registration
  qcom: smem: enable smem pstore backend
  printk: export symbols for buffer address and length functions
  pstore: register kmsg into directly mapped zones if available
  devcoredump: add devcd_{un}register_core_area API
  rng: qcom_rng: EXAMPLE: registering dev structure

 drivers/base/devcoredump.c     |  13 ++
 drivers/crypto/qcom-rng.c      |  11 ++
 drivers/soc/qcom/Kconfig       |   9 +
 drivers/soc/qcom/Makefile      |   6 +-
 drivers/soc/qcom/smem.c        |  10 ++
 drivers/soc/qcom/smem_md.c     | 306 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/smem_pstore.c | 112 ++++++++++++
 fs/pstore/Kconfig              |  13 ++
 fs/pstore/Makefile             |   3 +
 fs/pstore/platform.c           |  84 +++++++++
 fs/pstore/smem.c               | 115 +++++++++++++
 fs/pstore/zone.c               | 122 +++++++++++--
 include/linux/devcoredump.h    |   3 +
 include/linux/pstore.h         |  20 +++
 include/linux/pstore_blk.h     |  14 --
 include/linux/pstore_smem.h    |   9 +
 include/linux/pstore_zone.h    |  17 ++
 include/linux/soc/qcom/smem.h  |  43 +++++
 kernel/printk/printk.c         |   2 +
 19 files changed, 885 insertions(+), 27 deletions(-)
 create mode 100644 drivers/soc/qcom/smem_md.c
 create mode 100644 drivers/soc/qcom/smem_pstore.c
 create mode 100644 fs/pstore/smem.c
 create mode 100644 include/linux/pstore_smem.h

-- 
2.43.0


