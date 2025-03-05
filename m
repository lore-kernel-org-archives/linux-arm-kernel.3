Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB7E2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nxrQLrve5ZYCaqi57EKV0xP1vwlYg25qE1yTCds7PDM=; b=2x98WE11vf16JQiAJdphkoZMjJ
	XCwTV37mzHLolAdRpmg99gTh5+Q2vjB/FJ1Fh+nZXoJGeYa1WXYM9WyorOtldBPaTpOS59myBRV0f
	ZGe0SC34g05Hc6GvXikVVDT1+VepxrUlu+cSQFm/AZ6m3hFKcTCeGDPXpyo2hdjUILS9yWjMm7MAe
	H/TXaXV+Pv/LC2kcyTN27L9xJ5XXjoEZI5QZ6PwRyAnYdB08f45mPhVCFT2o1uMVfVafCrQ0FJFAl
	XQQXz3XbdN+0iCU9rAnzI8MGrB645gweZOi5GAVQ/BfHqyQUck2Yc75dmKgLuTLQDzTkbq3G/3Y2a
	EddXFeYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpntB-000000081VL-2BVo;
	Wed, 05 Mar 2025 12:30:17 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnPv-00000007w2O-1yG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:00:04 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43943bd1409so48855475e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 04:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741176000; x=1741780800; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nxrQLrve5ZYCaqi57EKV0xP1vwlYg25qE1yTCds7PDM=;
        b=CzTqJikwuO9wgYLZyIudijfzM1TWbLD14VHKp6mQgPhJLnK1STUOs/b4wS16/z3Sj5
         3h+AXnhKc9EU8BoG86pGAUbFR03YXRXhhTsjD9SGPyjy5Bt1aPSjAPMJmv1+xDBH+9Zp
         8v33tWvQggiDgaynoPCMO/Q60WfFBOL0FJiAA/5Uk+ziJXxq07KeTUiFV9JAa+n5Zt8n
         Lrs0/L5j03JA/Uqywze7n8HHof38EBw9jQKFRuz/nvOKg2mAz9P/l9Q61FFU+wiaZsh9
         YZc05U4m9GEs1xT7foU1r9gN+bHUBFcCpmamqcTzeYRHf8ODpPjEV0v5t12ltNKkb9/l
         GBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741176000; x=1741780800;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nxrQLrve5ZYCaqi57EKV0xP1vwlYg25qE1yTCds7PDM=;
        b=c53AouaJRQh+AUhmELEj0Dp70bVlyLT8yGk2k1EbBUuQ3w1jSOTpNAaORf75nG13rd
         F0UAyV/0ugaLwoXfG1G5okOZsTTOJVgaLT7lDyKLOYmyumYhlR+D5l+XZMAEXPfzkZGE
         mHazg9L+n5GnXswdG9GXyy6T++sW6osUILNMXIYZx/AorP7/pF3drEHpgGXN6kdPAtnx
         /NdAlsu9PGbxOz4f+p0QyNaXSWvCjR9tf8WrPRlsmwYZuD1cKaCqKwJ7KfRsMvTO2oM2
         d9D6CIaceo663H7KuVEdhl+X/j+LytkRJyDcIXOFcRzKRhfc8lWIhiKPvsqmubTaiH9B
         sN8A==
X-Gm-Message-State: AOJu0YwaAnWohxXDq2k6GMisc67GObjuEkpxbhz9qIOx2a0/P9cdbhi7
	Rro2KacHCKcC0XRzil0lrZ9T5kfAKENAX58/DyQzsZgd577QPfQMA+lARhb2if4WrFsg1EnS5O5
	zIThgdBHRb2CRMA==
X-Google-Smtp-Source: AGHT+IEp4F4FRlg80to2EP2sY+4qO0ru8U+D3wg9quZRpyNms8E1gnkZpcYcpd3+IIhL0cRuubq1VuG2e9urz9g=
X-Received: from wmqa15.prod.google.com ([2002:a05:600c:348f:b0:43b:bfff:e091])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fd2:b0:43b:d025:76a6 with SMTP id 5b1f17b1804b1-43bd298fcfdmr22365455e9.15.1741176000162;
 Wed, 05 Mar 2025 04:00:00 -0800 (PST)
Date: Wed, 5 Mar 2025 11:59:58 +0000
Mime-Version: 1.0
Message-ID: <Z8g8vhS9rqQ_ez48@google.com>
Subject: [Bug report] Memory leak in scmi_device_create
From: Alice Ryhl <aliceryhl@google.com>
To: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_040003_513792_B1964B2B 
X-CRM114-Status: UNSURE (   8.38  )
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

Dear SYSTEM CONTROL & POWER/MANAGEMENT INTERFACE (SCPI/SCMI) Message
Protocol drivers maintainers,

I flashed a v6.13-rc3 kernel onto a Rock5B board and noticed the
following output in my terminal:

[  687.694465] kmemleak: 4 new suspected memory leaks (see /sys/kernel/debug/kmemleak)

It seems that there is a memory leak for devices created with
scmi_device_create.

This was with a kernel running v6.13-rc3, but as far as I can tell, no
relevant changes have landed since v6.13-rc3. My tree *does* include
commit 295416091e44 ("firmware: arm_scmi: Fix slab-use-after-free in
scmi_bus_notifier()"). I've only seen this kmemleak report once, so it's
not happening consistently.

See below for the full kmemleak report.

Alice

$ sudo cat /sys/kernel/debug/kmemleak
unreferenced object 0xffffff8106c86000 (size 2048):
  comm "swapper/0", pid 1, jiffies 4294893094
  hex dump (first 32 bytes):
    02 00 00 00 10 00 00 00 c0 01 bc 03 81 ff ff ff  ................
    60 67 ba 03 81 ff ff ff 18 60 c8 06 81 ff ff ff  `g.......`......
  backtrace (crc feae9680):
    [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
    [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
    [<00000000a8b3dfe1>] __scmi_device_create+0xb4/0x2b4
    [<000000008714917b>] scmi_device_create+0x40/0x194
    [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
    [<00000000970bad38>] scmi_probe+0x584/0xa78
    [<000000002600d2fd>] platform_probe+0xbc/0xf0
    [<00000000f6f556b4>] really_probe+0x1b8/0x520
    [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
    [<00000000d613b754>] driver_probe_device+0x6c/0x208
    [<00000000187a9170>] __driver_attach+0x168/0x328
    [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
    [<00000000984a3176>] driver_attach+0x34/0x44
    [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
    [<00000000747fce19>] driver_register+0xc0/0x1a0
    [<0000000081cb8754>] __platform_driver_register+0x40/0x50
unreferenced object 0xffffff8103bc01c0 (size 32):
  comm "swapper/0", pid 1, jiffies 4294893094
  hex dump (first 32 bytes):
    5f 5f 73 63 6d 69 5f 74 72 61 6e 73 70 6f 72 74  __scmi_transport
    5f 64 65 76 69 63 65 5f 72 78 5f 31 30 00 ff ff  _device_rx_10...
  backtrace (crc 8dab7ca7):
    [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
    [<00000000500dbc08>] __kmalloc_node_track_caller_noprof+0x234/0x528
    [<000000004990eea4>] kstrdup+0x48/0x80
    [<00000000ad4d2923>] kstrdup_const+0x30/0x3c
    [<00000000e9d3bdc3>] __scmi_device_create+0xd4/0x2b4
    [<000000008714917b>] scmi_device_create+0x40/0x194
    [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
    [<00000000970bad38>] scmi_probe+0x584/0xa78
    [<000000002600d2fd>] platform_probe+0xbc/0xf0
    [<00000000f6f556b4>] really_probe+0x1b8/0x520
    [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
    [<00000000d613b754>] driver_probe_device+0x6c/0x208
    [<00000000187a9170>] __driver_attach+0x168/0x328
    [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
    [<00000000984a3176>] driver_attach+0x34/0x44
    [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358
unreferenced object 0xffffff8103ba6760 (size 16):
  comm "swapper/0", pid 1, jiffies 4294893094
  hex dump (first 16 bytes):
    73 63 6d 69 5f 64 65 76 2e 32 00 03 81 ff ff ff  scmi_dev.2......
  backtrace (crc ccc21b9a):
    [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
    [<00000000500dbc08>] __kmalloc_node_track_caller_noprof+0x234/0x528
    [<00000000cdc440a0>] kvasprintf+0x90/0x11c
    [<00000000500fc732>] kvasprintf_const+0x98/0x138
    [<0000000030e28143>] kobject_set_name_vargs+0x68/0x104
    [<00000000f15f6ece>] dev_set_name+0x6c/0x98
    [<00000000c1f76eb4>] __scmi_device_create+0x17c/0x2b4
    [<000000008714917b>] scmi_device_create+0x40/0x194
    [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
    [<00000000970bad38>] scmi_probe+0x584/0xa78
    [<000000002600d2fd>] platform_probe+0xbc/0xf0
    [<00000000f6f556b4>] really_probe+0x1b8/0x520
    [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
    [<00000000d613b754>] driver_probe_device+0x6c/0x208
    [<00000000187a9170>] __driver_attach+0x168/0x328
    [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
unreferenced object 0xffffff810637c800 (size 512):
  comm "swapper/0", pid 1, jiffies 4294893094
  hex dump (first 32 bytes):
    00 00 00 00 ad 4e ad de ff ff ff ff 00 00 00 00  .....N..........
    ff ff ff ff ff ff ff ff 00 1e ee 83 c0 ff ff ff  ................
  backtrace (crc 732b3ae6):
    [<00000000197aa008>] kmemleak_alloc+0x34/0xa0
    [<0000000056fe02c9>] __kmalloc_cache_noprof+0x1e0/0x450
    [<0000000026a3cb30>] device_add+0x54/0x570
    [<00000000e515c343>] device_register+0x20/0x30
    [<0000000042008204>] __scmi_device_create+0x184/0x2b4
    [<000000008714917b>] scmi_device_create+0x40/0x194
    [<000000001818f3cf>] scmi_chan_setup+0x144/0x3b8
    [<00000000970bad38>] scmi_probe+0x584/0xa78
    [<000000002600d2fd>] platform_probe+0xbc/0xf0
    [<00000000f6f556b4>] really_probe+0x1b8/0x520
    [<00000000eed93d59>] __driver_probe_device+0xe0/0x1d8
    [<00000000d613b754>] driver_probe_device+0x6c/0x208
    [<00000000187a9170>] __driver_attach+0x168/0x328
    [<00000000e3ff1834>] bus_for_each_dev+0x14c/0x178
    [<00000000984a3176>] driver_attach+0x34/0x44
    [<00000000fc35bf2a>] bus_add_driver+0x1bc/0x358

