Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27209EDEBF5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 23:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q9RQYrTQb+f06jEQuhN6NivAMFZ4+j3jHKwGNgTr4Fs=; b=NYLwg8wOmJBvRyn3wDIIoMt4Ym
	BaaYibJCmUvaEGWFDCZdNUvFzQK7BatR8cUwNPketxWE6fKIkQPEXS7P1bek6Q5F22ChzMDtUbIck
	DjNR2IQObror0NeOBjfqJCqajmo80DCfKPat46xi5MeiG9IXNAHfXn1s9W5h2h2/68l4hhQkI916a
	xg12QqqKru7Rs8t/cwkQsOkPx7TgQbvzPJMRSS9ZcqjlOhk7MF3eQiLhhXfkwgAIF0OJAFjZcEY4N
	GlqoKJuaYMS+4sRX9FaVB6YCt4II0n4ZrGIrWPdCz0XTI2eKiucmkzIynB9pUyzsa8bCYxyzliHc3
	nVC9s5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxYyH-0000000G4tF-2lw1;
	Tue, 03 Mar 2026 23:16:09 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxYyE-0000000G4sv-3CEg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 23:16:08 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-126ea4b77adso8110839c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 15:16:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772579765; cv=none;
        d=google.com; s=arc-20240605;
        b=PcEMTr5CxlNr74/QKKNaUd85nKhew3Mxc+tWuTGmb+aJxAZqZkfQuKUI3O13zaRtk1
         zBnhghZMmSLs4/JibbF8Un9U4xPaqkHgp9AC3f78T7tUnRdNJdOVSS9GqfY03a8lf97y
         t5BnkhXOehW2HJanIxfCA3veeBTUOAVl9fhO5DJ6DTQj88bt2XIAXCP1DJnCBUvw2WrW
         EhiNpO6qd4p7mI7vyEj/6BF3IRDzh7AmHMDZy7K0rs1HjNoCkCn8aWcTvHT4Swqt0ph4
         vX6GcDhqGZmTRFZCAzb7ArQw0QbF2bzbGIVTjX8zmpd8IRjC9nYIMdTu8se4mNRSuhdI
         zPWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Q9RQYrTQb+f06jEQuhN6NivAMFZ4+j3jHKwGNgTr4Fs=;
        fh=8vNO1dkkRYv2WCqrndXkrgBOYNK44ZQ6URpdFRIB6Ck=;
        b=YhRcMRahX/sQIr7BZMjJBpcvmnnYkiCDR3OxxCruIh4DXNlBnVzPjwQoK5G1gFHyOJ
         4mHQdhx/CO8evuHuNQWmKIpB7hg7Avft3Mk5JDz7pj4a/8ZMlcWE0CT6k2vxtCZaAZHM
         XqxqvALAoMGz5J6cqhqpTe8rai4RlHveAdTZn5xVBeuztSMtz2kq/SDlR5qcoHQmM643
         hf0bIulSM3SVQL5Is672loRYP910pz8NBQqWdLDtyjk88DbX4UDtZDjamhYWVU1jfzcm
         it0WSdbt1u2SWZcgVy6tW3Y8kqrWJ6Y+h/Qa36a4AVMCWbWrgG4UF2lfy5MrArkVC8CU
         gkMA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772579765; x=1773184565; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9RQYrTQb+f06jEQuhN6NivAMFZ4+j3jHKwGNgTr4Fs=;
        b=TRM6gxFVqVCde5jQEMRxaTXkCVI8GydGxi8An96GqLQmxWiPnQiv4nK0T+CMl5fA9t
         O4fVo4wzRfYRUQVQiB5IDX/ghl6pB89MOdY1M2WScrlf/xzwi6Mq03cS8N4/r7FymW0t
         ZA7M/A3bgAHukhFs301Ryi1cbUl0OJp20OZGJAbKs8rIWS4cR2I4pK8A7zO2ZUJhc8DA
         w4zCCFQKyJMXhxBL+KhLw8aO691pewJbbTUeEWigCudyeoRJ/bccKLJwRDYRevbfBfCj
         k+diC1aXuzad8KdFxq2/W/lTvTYto17C2ewGd38sBF23B471cJqh00gA4osprU54DuLZ
         INhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772579765; x=1773184565;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9RQYrTQb+f06jEQuhN6NivAMFZ4+j3jHKwGNgTr4Fs=;
        b=KwdsIZ/NuVjfMLJEHvW6Y8xWksFOESjR4+WU/yMeZuONhJQB8M8huDcaYrRdSu7m79
         zz78i+j2b3yQhL9cbZOfxvb6lCLMRtn4kIZHZ37ykDVmBwRVgfiOCu2cicMYVhCuk2nj
         +d2sqbnP2YMEWH7eM1BJ1njlhhnkZbK03o5dY0YiW2czCytdasDzW84UwRvYFMbL0sbX
         udOAQIv1l9ZNvqziT97sMwSBUXKQdgB7S66SnBms6GMs+irADbGim9qn3Rp5MfIheQkY
         kmRoxPgJ9qWP7E0obNsNhvQ+p/szOZwyutYWFPcxJuWExzvIzBwZIKbLCnQUcCQNDELU
         IqpA==
X-Gm-Message-State: AOJu0YxN9RfZ91WQqoA+SfV45lSk9vHVBqgmjCinuDaZLJ4vZxq+NTHc
	ZPh8J3vjfXMRBqKKr47qs/1tOxOQs6Oubgb1cCX3yUHbfx7EgWp3BTUG2lCxv0GgoniKphmHeki
	HQtAVZr2rva7bnDK9/cAtQkCpzSKotQzjWvUb2wU=
X-Gm-Gg: ATEYQzzxFq0b5q/Udw1XERxhA5PdHhE+yEqfDUy3Kno7NN4q2tTqMVnqwYyxJxdXVs5
	cbpXP4vMBUzRnCCk1SXmgYgkAf9uSMA/ThZUssoYSnLLUU53VuaPbnnslUOg5g33DMqTHQCGkCu
	j/6dONckbVmmsiaY0BvLInyAOz74WIC3Ov+SWZsMpBLQm3nNJ2Fl8G8bKQCnweqJMSv+Js+JYq+
	Z4mqMDekDLk7yTrGyPHUgbxD0xL8sOFswh+g+R0oQswwD7WrIC7DwtzpKKXWWpRw6sXQ7jM2RgB
	jFVLWckH
X-Received: by 2002:a05:7022:660e:b0:123:330b:3b5 with SMTP id
 a92af1059eb24-1278fc3dd8emr5371555c88.30.1772579765257; Tue, 03 Mar 2026
 15:16:05 -0800 (PST)
MIME-Version: 1.0
From: Chaitanya Malhotra <chetanvmalhotra@gmail.com>
Date: Wed, 4 Mar 2026 04:45:53 +0530
X-Gm-Features: AaiRm50syajkbyTCf7SM-bq0nn2CVqun4R5wEAbvHSuaHjgOHPRms4Q4E_4FzM4
Message-ID: <CAB6OxFyfbyqBaGP3vuqNTfF+ExVLWutVxT-Jj-FY9Q69sksFNg@mail.gmail.com>
Subject: [RFC] VPU Suspend-to-RAM for BCM2710A1 (Raspberry Pi Zero 2W)
To: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_151606_825766_C297ECF9 
X-CRM114-Status: UNSURE (   5.33  )
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

Background
  ----------
  The BCM283x/BCM2710 family has never supported true suspend-to-RAM.
  The VPU (VideoCore IV) is the system supervisor, and the stock firmware
  has no code to preserve SDRAM through self-refresh or restore state on wake.

  As discussed in the canonical issue [1], RPi engineers estimated this would
  require "a couple of man years of engineering work" in GPU firmware.

  Implementation
  --------------
  I've implemented VPU-level suspend-to-RAM as a custom bootcode.bin based
  on the open-source rpi-open-firmware [2]:

    - SDRAM self-refresh entry/exit with DDR PLL relock (3-retry)
    - PHY DLL reset with OMAP3-style kick (3-retry)
    - VPU scalar register save/restore in VC4 assembly
    - GPIO3 wake via VPU IC0 interrupt routing (hw intno 49)
    - ARM power-gate/ungate (full PM_PROC sequence)
    - JEDEC ZQ calibration + PVT compensation after self-refresh exit

  All register addresses verified against Broadcom's auto-generated headers
  in common/broadcom/bcm2708_chip/. 22 address/bit position bugs found
  and fixed from initial guesses.

  Code: https://github.com/bhoot1234567890/vc4-suspend

  Status: Code complete, compiles clean (-Wall -Werror).
  Awaiting first hardware boot on Pi Zero 2W.

  Questions
  ---------
  1. Is there interest in kernel-side integration (mailbox to VPU)?
  2. Any known silicon differences between BCM2710A1 and BCM2837
     that affect suspend behavior?
  3. Has anyone attempted VPU-level suspend before?

  References
  ----------
  [1] https://github.com/raspberrypi/linux/issues/1281
  [2] https://github.com/librerpi/rpi-open-firmware
  [3] Broadcom Patent US8452997B2 (suspend-to-SDRAM method)

