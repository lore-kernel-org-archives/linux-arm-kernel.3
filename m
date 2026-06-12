Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408F8CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=; b=AYez+8Ie1UAfhMDQfoKRVE/pzs
	abmaufZQiJxWkW/47ITH2V0E6gucDsuHZQIdBdoy7v8+YCnKaigI1sl61eJhs/rAucyMm/zOXRR4L
	oj/w0F7iI9wfkBTGFem8w7YLGZi6o9UFI3rQYV/+iH5HuPyXt82h1NzNfg+fTORG6Q26/uBdRFyyo
	sda/P7+wQdIUDRM+YSq1mmvDJhshzg8uAviAE7pK/MTYz+1ji4KxDFHaGbaG38rq+4ePuoMGSQtBv
	RCXoKwiBOkLGHJ6dKd12DfAoj8Q40sFW52D1t6kyXb1JpsFAFq8SOc2KbB6b89dNQtfuQkylrZsvZ
	XBGdIWhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Ge-0000000B7Ch-3lfJ;
	Fri, 12 Jun 2026 14:53:56 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3Gc-0000000B7By-09Jd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:53:55 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-59ecd51117dso849242e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781276032; cv=none;
        d=google.com; s=arc-20240605;
        b=R4ksEs1bo7WjgTnzpKob5+Qs113W+/iishpdkh6MaTfxVH3qEd7qPmxLEjGsgD6EFB
         l6Pyyc4fvV47LkFhqYDFb2VC+C+Ypbfd70pVTkVQ+RzYSsO285X5Bt6Z8aRVu6cigyJG
         Rcg3tK3VUcBUVT4jBSSyd7TiCHK2PIgYli3IHI4IScWadK3bG/+fxcS9lc1e61xFRwBM
         UQD8erc00Q1+UKVe4a7uxs0QKFrT1jrYz6GXA5roxmTP4tPub/r4eCe51BQAIg7a05Q1
         LcQHi3JuUX9jR8/exeP/fBcc8NDrib/tBBEmp23VGXfPAJx3zf01ifiePp33/Q83O/ib
         nv2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        fh=BphOTsYDR/S4xdvEfWjDAwfPHHyY52maNgzVfRFw+fY=;
        b=JNhYzlyBLam3ypq80bIGg5KdaYw/p4vFSd1ca/jDGB3M2GcdK3kChT57w39rBBo7FW
         MkVqlnXF20w3BdX5dTXy2VLnFduwxlGwyYMbEN/wt/tukU6pLjQvElOLYXIL6WFrE1IR
         CAZeY+zRhcaH1AMipGzo6xZm/QjLPEEvIcs+S0G06vWBTacfawoUlUUHzZNps+s//osA
         PBfaCn1NE1yAdWhflUtcXVR8xztKkJvwpIwrZfKwIne9IeGW6qUGsfzCMUK8G0XC6baM
         I+gb39NlBLq8CaLzyQ6UhHZxPi5JfPqviqs0FmZYhRCMdptl7JUDOoc8hf3gqBb3ifPi
         OEfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781276032; x=1781880832; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        b=TcYHAQhp6BRGMNcoOXv0aZ7k8+BCTnxpK0B7f0O1CU9HWXQ5Y9PePEoKIhgdh2uAtC
         bqenmNCqcX97MatVMhFqZ82dr5LJ3g9Sxu4txRmx9nAtD7pbRxWxESkUhrTCIJroE8TL
         RTMhr0GJl9by+F0xq/47PetZ6vIiNiOOl09ywSEiKe3tF0yuEbfavYgLsDtTPAbpZR8V
         hJq9WC0kHWjysmds0UdosH/dQ56YOG/AjpvHTly8qBbxPwp9t+9raQ2qSQ6kP0aTRijO
         qaHuTXCzpipA7A6eiT6wokaCV/PnHwYbVnPJhr+ime0ByYuyYZrLYtPY8GC/NhnSoNTO
         PPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781276032; x=1781880832;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg/jG1GQgNRKAE3i2ndG5Nw/kqSFIlVSs+wnbwQYTuk=;
        b=h4bBh1NFY7XSmKywwNs66lQrgEGliB/44eFlj9xiENEoGkqwTBlSs/rN48fp9hXeo3
         rrR4A2iB44hyeWt6PdlBHdnpK0T3fwtzVsbeeuSN43RTrk9dr/Yrk2djd53nstq/DwM/
         pyCZs9YAU9a2GDUkZSLYlLYuZCX2bMQ3v7Vzb30KOaj9GxQDQvWpidI3XdbSFFTIoSix
         LoliLF4Fg/6+dPeN4NPYMnw1vfzCR8MT59YHghZH20OqQnQwxkC0XyFGsReNgqOvcE42
         kfyYo7L2JT6of4PTNtgzXiqiX7QDl5OJsNiS/vW0ZSwUrVVfbY0f+Ik9NEkwS8+HE+2d
         mM4w==
X-Forwarded-Encrypted: i=1; AFNElJ+NknTmtXMupoWxxpi03aplYn410vewXztTkCN9NetcONe/xO5rx6PALZ3tMzvqkesCk4JlRsmM+Hb+61F9AFAr@lists.infradead.org
X-Gm-Message-State: AOJu0YyrNCIxjS3fC6d0yR1xkW+fmfreC/0M5HDvHMxNKztL152OBF1s
	WoYed5u0Kj/SROjYw2calwa/78kxY9ltdAsZzRAze00087BCfSjdwVTrzHEjp2kQ8t20UPK4cfD
	lgYEM4H2KbiYtYxbchfuaj1ACWLpIWnU=
X-Gm-Gg: Acq92OFGjkoXsB0YBZhQRFs1gZM5Xp1V+FAGnDv4+NmJkeH0EzfQbvRO3JgYk5FWl+D
	5MSoR2Ngt90f5akzB1BGAmo3ulcDWUc0qYANhqoyKzV/kDVP5mFTcUsc5IhNoha5yKU7+R+/o3t
	tuvVp5B0tgt8ZZhpGRDrig7K8t7sQ8UdtOQt/d9coepzFJdtCJuFJw70tI+wSO7At4jfjY1k199
	plWUp7TGgZt8+YP68pkUlGtccJMSS/4SwcLpGeWetVwve/IBknSyrdq/77pZ69sfOHb6PKD9bHC
	h7gPU30Jqw8Yn3NqI+tLPAIZBTEmWnKH2npv6adKlwe/hu2+IA==
X-Received: by 2002:a05:6122:6503:b0:59b:f9b4:8748 with SMTP id
 71dfb90a1353d-5bb69fa3ff1mr1022262e0c.4.1781276032418; Fri, 12 Jun 2026
 07:53:52 -0700 (PDT)
MIME-Version: 1.0
References: <0f97352506d8d813f70f441de4d63fcd5b7d1c3e.1779123847.git.shuvampandey1@gmail.com>
 <20260611221000.GA524832@bhelgaas>
In-Reply-To: <20260611221000.GA524832@bhelgaas>
From: Shuvam Pandey <shuvampandey1@gmail.com>
Date: Fri, 12 Jun 2026 20:38:41 +0545
X-Gm-Features: AVVi8CeSnuFKBXw07pnZfggT3zcPEONqkcJp-rRWL-FHYqitFjSsHZlw-QFmmE4
Message-ID: <CANAAWHKBFmgQfqUNaiUrPxBk4bPoBpRbhJs9YqszKvBUbUrMXg@mail.gmail.com>
Subject: Re: [PATCH 1/2] PCI: dwc: Guard RAS DES debugfs deinit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yue Wang <yue.wang@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Fan Ni <fan.ni@samsung.com>, 
	Shradha Todi <shradha.t@samsung.com>, Hanjie Lin <hanjie.lin@amlogic.com>, 
	linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_075354_103217_4FF5FC6B 
X-CRM114-Status: UNSURE (   8.67  )
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

Hi Bjorn,

> I guess this prevents a NULL pointer dereference, right?

Yes. This is in the CONFIG_PCIE_DW_DEBUGFS teardown path when the
controller does not advertise the RAS DES capability.

In that case dwc_pcie_rasdes_debugfs_init() returns 0 before allocating
pci->debugfs->rasdes_info or initializing reg_event_lock. Later,
dwc_pcie_debugfs_deinit() still calls dwc_pcie_rasdes_debugfs_deinit()
unconditionally.

With CONFIG_DEBUG_MUTEXES, mutex_destroy() dereferences the mutex, so
calling it via &rinfo->reg_event_lock when rinfo is NULL would
dereference NULL. Without CONFIG_DEBUG_MUTEXES, mutex_destroy() is a
no-op, but there is still no RAS DES state to tear down.

So the patch makes the deinit path match the init path: if no
rasdes_info was allocated, skip the RAS DES mutex teardown.

Thanks,
Shuvam

