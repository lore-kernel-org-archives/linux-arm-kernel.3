Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9868CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 02:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JylEP8+5/nafZ/O4Ia/zkDhOnXLTDG3hqc2U8jhuHBA=; b=mkEyE22/2BKhn0wwRj8IE4SwpE
	DPkBK4tRuHh+lPrN6N88YgMqAI2bPWEo33TLUrh530JdItXcyFj7KkUfaiEMiI9gTp8zqqw7+ocKI
	aIzt3tQ2TcyHvd7Pr2qY4zCEmVX6LZ2MG8HvT7CBpmASg1kpN5DuAXBpq88Nu3VKTbC3+pmJ2hzLK
	eptzz4VC37W2+e9bwJ/0fT2y3C99yo/WVdRK6ZlZ8tGDj64Sytcmmv24fODaTv/zSzg1YThTqrAg5
	WttI+bAd4UXP6GRRjLJ+yAvVl5YjXVcHu5PRzKxo9pBfDZLbY5W9t9U9x9jRBmi+Ec57p1IL7SUVU
	yXl9P2EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWhV-00000003JQo-02IC;
	Wed, 20 May 2026 02:30:25 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPWhR-00000003JPu-21l7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 02:30:23 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-303f2fb7225so2504746eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 19:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1779244220; x=1779849020; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JylEP8+5/nafZ/O4Ia/zkDhOnXLTDG3hqc2U8jhuHBA=;
        b=ZjZz2jj2SnHF0Yw9OeNgrtBgx1fUb/j6jOoknR6uR7N9qFMnjYQ8el5n8FM27EXkyU
         cXPHVehPcxsgS8lvrgQnXRJ/aFaKG4KatJv+naeG6VHR3LI+04+6Zw4vB7SzEYieoQbu
         7R8mz8W7uxn58iZomb542FDA0kLO+dPJrRB0s+AzLHz7SegGGnzWRYXAxwdeMS5lnwaP
         jj/LzVkD3TSGTELndyIA7fd/pdcZQSfovDlkXgqDM7CznuqQ1kZ8um6OVjuqO7aGe450
         tydtbkvBjPwPAANKs5C1mjxY+6WRj3ybBS/VoryBWh0yNwvlQj91gnbyHBs7W91MUyMQ
         Eruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779244220; x=1779849020;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JylEP8+5/nafZ/O4Ia/zkDhOnXLTDG3hqc2U8jhuHBA=;
        b=RpL6P11gLQFXLOJVX07q32sjfjfmR90QTkO41C27WkZ0nkv2JJgu0e05ZZKscQUZTN
         xGynHuheElvEEvhXE40AHsesZ5sDGyfuRj6yhJ5vxJPadde292BGaFUk2a6qjuEgTqDe
         n1LVov7Py9AoKA/PSW1Y13gREAaB+c2bWvVQSL5zo1urcR0KMoEcuHsbmSyGdM9n101a
         TVlcaykksdA7OrcNnJeYLgLbXuHymQnHx4cOh8/m6JhBHRGEMKUvBDtZsD4xwRIzb8rh
         9UzwbtWI/m+FaRSEh7U/f7oY8/a8xPvl/QFq44F/aCySaoUrWqmSMCkSt0Eah8E2pHGq
         V30w==
X-Forwarded-Encrypted: i=1; AFNElJ+17rxpKUVwD961wl3LqZEBSxB/ISGAPrCci453mzXpPMc1rwYQkjNnEsyHEZfl1dZMqBCViY6hgsgSDzk7m2fF@lists.infradead.org
X-Gm-Message-State: AOJu0YwHJWYA76xfVnC83fxdUC3Nt1qa4hKReheCoOv+nwZSQnqfGKvF
	EnU3wYvcYl78CaQKccscrowwt9CMM4mT83zPSPbIwjdUsRvFzxvB0yO43hqgAaoCNZw/rQzA2/H
	BbKDb
X-Gm-Gg: Acq92OGKLjna5lHm/TcP6CwvSQ+qQErsGU0g874DKkNiJSv7Tj19AUSWahNTruEk88l
	Gt8TozIWcRaIktmYDKzejIGiFniD+fJ3e0lo+59+ut6YKv4lZ1oEEThms/RmRgayyp5pPJ46xS3
	rBVoCHI+GcYMzvPXAl0Y4mnrzQiqqIJ9KqTCOC/F5NALdzGCkdqMA/7EFqpjvJ9e7M1DceDyaII
	M/L7Iv4CsOoJ4nz13BT4pLYv3LUkWxOemXMuJdoz+fLlkLIe5rE4fT0+x4Sfs2aAApdkpJ5hpCh
	dzGG6iSgFy7zxvWCrSpTs2jCD4jTl26tyt7aXH/TB7GcAyLLFGZ1GVdo4YU4vUamvLOWkNtqLdc
	blTHQQW6qoGg2F+fsjMR1g3sJCZaC864dONMMhqAKenvSRKHYPPMKWWeYq1QwHVO1X2PPkbcZi8
	/5XDw+U4P9/WcSgC1tJ2aTOXZn6W0=
X-Received: by 2002:a05:7300:e125:b0:2d4:94cc:eebb with SMTP id 5a478bee46e88-303982bbbb2mr9598011eec.13.1779244220004;
        Tue, 19 May 2026 19:30:20 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30293e2ea6dsm18019017eec.4.2026.05.19.19.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:30:19 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 4b4362973b6ffc2c351f1c7b8999da36597a5752
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 20 May 2026 02:30:18 -0000
Message-ID: <177924421862.3070.1129044702163064782@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_193021_854954_C0EB7F20 
X-CRM114-Status: UNSURE (   6.67  )
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
Reply-To: kernelci@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org





Hello,

Status summary for arm64/for-kernelci

Dashboard:
https://d.kernelci.org/c/arm64/for-kernelci/4b4362973b6ffc2c351f1c7b8999da36597a5752/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: 4b4362973b6ffc2c351f1c7b8999da36597a5752
origin: maestro
test start time: 2026-05-19 15:36:18.173000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   35 ✅    0 ❌    1 ⚠️
Tests: 	 9863 ✅    0 ❌   93 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a0c90e5744d1c1da0226bfe
      history:  > ⚠️  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

