Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E447CD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Cc:
	To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/bfbgCejKHLZCh+eaqnRoOjHcREU4MUZhKS4jRoTJg=; b=A+w2StamsbLQB6aR1Pn8DD7Vsr
	n2z7ddFpQiHsRY0xCvv5D82l5J1rjLh4HyEbcbrmPJDR0XIpXZg9xQz8x/KcB0qREM5fbuKITIKIx
	F3YNH2GGTPmYWKiaRwkmNjcZD+/3j1h58gn0tvllztTcAUKCYNVT4ALsjSGVTla5pOiSq23El2jj/
	zUpzFYua9k1OqdLSFJBrfnp7RKmcDjtQU4UltUnhGKzU4QF/KNFwKbT6gTmXLFBphiYFAFvpshnLn
	EchWBpTyveQ+tKjyBGQXA9Mo1KoqOYDRE10vZEmxceOFWZZJcU9su1E7CM3v7DjeWrxOccEkZ0fuX
	tGnQIYCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxql-0000000G2eJ-1zhY;
	Thu, 04 Jun 2026 02:30:27 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUxqg-0000000G2ay-3VGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 02:30:24 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-304f0039c02so296034eec.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 19:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1780540221; x=1781145021; darn=lists.infradead.org;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/bfbgCejKHLZCh+eaqnRoOjHcREU4MUZhKS4jRoTJg=;
        b=MseOoMUYSbevIyFBHkmOX6adVtbe/ioXYZxUyH7RZMaEOpibo3azrnMMF/qR3AoOoF
         K+Oy2QppG8z0v5rbG8OzW6SanjPK1f5J7fqOinGPqaAeWbrVSdjlkKm3d2BGHnKbMsZX
         l5r8g/F0iT+8ELmshjPEGmSD4tPLPO+uo9Etv2vKkq9/KgwJr8tWjvLLLnDRl7ms1Nw0
         6Id/mMrzkZVBF1E32SG614GbfketKbJu8RV7tZoJQtXxTA3gh4SGhPXFAkBzk7tLbkGP
         EC5by1ECnMnP3u/Vaa676HdvtOFa/DOpG/xPReXeMCkZw5t02e7IIZ4Aak27mL7WOSxD
         6WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780540221; x=1781145021;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m/bfbgCejKHLZCh+eaqnRoOjHcREU4MUZhKS4jRoTJg=;
        b=h51CajfohRTLwgQAw36QVIzF447HlDDsBYBpnaH7wzt9RIak5MieSUxJmeUNRojWSJ
         aee8PHowTr47PiNc9w4bF79ctp4oaSbjLddHlbGZLXx296gzU+xi/BkyYvSAUYImu2Wh
         rB55bmTHKYsIWBHrLutfQu2lUnqmKkNQzJhNwvRnh+9No+tl7XDhn44aCY5NPOFXpFTR
         8WDqnia6HqemJ62nJ5BbtExZUdh7r9JNYJDT96MkBk7GxsjizG4VhgMYIo3ZMIhURdsb
         1ScMCm5M2edo6WsKv9I1tjVKh3nOGmfY4nEu/HwKexQAPOpzQaeVKCmp7I4fLn5TY7pb
         z6qw==
X-Forwarded-Encrypted: i=1; AFNElJ8gKCwwE6FL0R7YzOrTmmE8/NfRtioEsYePfB4DE9s0flA8wxvLdY/YYUgj0KLALAg2Di/wOneNySMOZdwxw/pf@lists.infradead.org
X-Gm-Message-State: AOJu0YzRyfUThGKMBV2/1El+9yeffR87ikHspwMFH8xLw1GLiyFpo8UK
	kTaFSupmEolSeTf3BYBJK/rTv5EGbPYrqa2831J7Knlkf30/F4Ah9zlH3IvlvE1y6nA=
X-Gm-Gg: Acq92OEKlCW1AwYF0BnyqeRkw52TsIw2se17MS4tWdcOOXK4QQWRhzrLZqWETudzcq7
	Gs+DbweYheUEAhzI84BEP5hEaEGJcN2XqWv+hXboK3kYw3LuyDziZZ20Gab3cATSUg3UjtNfA8h
	VbcDGp+7Sz6WZgo1nPHvZKf6FDU9PO2uFQQP/rWy0o4eUQGqsE/tEP72hAiAsAVEoMMLu8rWsYh
	OmMRmOnnWogBrKrb4EPazjsUZBPCSnyabIo6fCBT+CfUwBm83Uf6wKwTiLh34H0j1Z6SwcpOuu3
	RRzjIIGoj44Ec5AJN8Ns9GRM+1Qdp0GxJrhg/djN1gJdBXKkSbTFDnEeqHsR5hiH/DiB3T2t3XD
	KqiJsJaVx8jOD6vjzt0lepnciO3p2qcAGLxfe9AWoQtASKA4Sct+64/XuM8dj8DIbS6u/ykYuXQ
	8tWN7ovLSBmbteIVZsmf2zjDWcY4k=
X-Received: by 2002:a05:7301:1f0d:b0:304:cd60:b6a6 with SMTP id 5a478bee46e88-3074fc143e3mr2916716eec.30.1780540221365;
        Wed, 03 Jun 2026 19:30:21 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df3b234sm5269507eec.23.2026.06.03.19.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 19:30:20 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [STATUS] arm64/for-kernelci -
 ec7ef10b77a69d482f7c78c8236389e64a08eb98
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: will@kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 04 Jun 2026 02:30:20 -0000
Message-ID: <178054022029.9965.979749130448889759@330cfa3079ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_193023_180977_7CAA5D9F 
X-CRM114-Status: UNSURE (   6.17  )
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
https://d.kernelci.org/c/arm64/for-kernelci/ec7ef10b77a69d482f7c78c8236389e64a08eb98/

giturl: https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
branch: for-kernelci
commit hash: ec7ef10b77a69d482f7c78c8236389e64a08eb98
origin: maestro
test start time: 2026-06-03 21:07:25.834000+00:00

Builds:	    8 ✅    0 ❌    0 ⚠️
Boots: 	   35 ✅    0 ❌    1 ⚠️
Tests: 	 9865 ✅    0 ❌   93 ⚠️

### POSSIBLE REGRESSIONS

  No possible regressions observed.


### FIXED REGRESSIONS

  No fixed regressions observed.


### UNSTABLE TESTS
    
Hardware: bcm2711-rpi-4-b
  > Config: defconfig+lab-setup+kselftest
    - Architecture/compiler: arm64/gcc-14
      - boot
      last run: https://d.kernelci.org/test/maestro:6a20a0dc2cc72b6e94bc36ea
      history:  > ⚠️  > ⚠️  > ✅  > ✅  > ✅  
            


Sent every day if there were changes in the past 24 hours.
Legend: ✅ PASS   ❌ FAIL  ⚠️ INCONCLUSIVE

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

