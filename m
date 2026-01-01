Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C67EEB57B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 03:43:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=anwAdBjb+lU0KYvGjD1Jd+3iHfgqJI/N605hNnmQkb0=; b=uu3bLHOKWMlJVOisIqiv7RnFZd
	zA01ub84l4BC+Uqg47k2HfbAm6uk+4+D0VIC+sqbUegGLPu0OBmn9S153WZD9fWcW0JbOgD+qJrQ8
	VkOdbNBDIPCLW1iUJBT4bNp+5h+nUC6A4OpBrcatzkPxvnrvldmgGafxgpSRKiiJF6QvpygdrurKP
	sWRUbQxXvfK7ith5xO633sBibE1IX/jlRW5cI63wuBRMzs1sWBL+t6cZGq3QTV4OsIgraH2BJ8ElA
	JrOXBAWm0q8xzldUjcex3kbTSk39sBjUppfrrKNAXI69NuGtw+3uD4jc8hT5HtF+odAk+XPWnoPdi
	7ieqgAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9b3-00000006YnT-05R0;
	Thu, 01 Jan 2026 03:43:33 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb9az-00000006Ymn-2fcS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 03:43:31 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29f2676bb21so153425455ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 19:43:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1767239008; x=1767843808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=anwAdBjb+lU0KYvGjD1Jd+3iHfgqJI/N605hNnmQkb0=;
        b=ikSn+SVimF3MzSNlzBfiJIULnRlmWzr7iRMwkedkjXg9aq4TFbBYUGwWohbCm/Hz4V
         glSvx3338lTFwOY/CQwEGy/sO34KF3DMpulJZVOsl+XIsgtVNC4UawPB7/jTowfN/kfV
         eBhb6IAHPmEURbv7hwDGaNlxitXvgMtdUCxH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767239008; x=1767843808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anwAdBjb+lU0KYvGjD1Jd+3iHfgqJI/N605hNnmQkb0=;
        b=jQ8lXxnaFo36DvUwSgwaR7iky8JqMwLGPS2AjDgKkOvF7mqWWhqUULF/JzawOfWT4U
         XON9Hflpkq5Dajq3Fm5mib7puPibwAQmgql1qIxgjYEb62kM8nIb07kiAQ9X6waAQxgm
         NZYLfYaAIXBUYbLvZ4IFlnclviv6HtA7SaJzKt4jYvhbdM1XPr7xjI0VdVxK9r1MENe5
         Xqhxq5TEev1sfYvkueCt9YcLCrWt7Z1dGvS9Mr/GXbdNV+ohUX9L2NoVXcx6wk0/an2m
         MZSOcB8A+wRaLmD0lCTqcMxioiBkuwG3JHkx03M7Ch67tD6yqR+xjNt1OcPHwREuXFZA
         MX+g==
X-Forwarded-Encrypted: i=1; AJvYcCWtpakfHxWIN3vDTX5s2JpE3AcKnhuh1KIbPpGvYdicL99Fo5x3Mg66/ZGu+lrma/elyYiOtc+EG98yq+m9S/av@lists.infradead.org
X-Gm-Message-State: AOJu0YwwWIJ5y5nf1I4axhZuAjEH0C1Gx0xAQPvXXk9Y3Etrpg1KGSrI
	5hNxqz+DN+4g0pTX3Mf6gJ1kf32GDwpKxRYzFswYxhPTIBYYg2hPBtAddgG+x51E7Wc=
X-Gm-Gg: AY/fxX47uzN5T3MVGD3xeDIXCFp6GMW9+azNIQt4CujYeBhEzmYY12Mz4vOvb1EUBw+
	Fz9MZiDnHeRRsfvZ8lj67+6ll2QQWHp7rADA/2YlMLSu2xshSZ6+p+g0aptUW5ftJqpPBfq8d/Y
	OjFFcfbExBMZYOQ6teZpVtaBSsLbdNCE7n39/qRNU8U5/fej59t/e2Nwy11QFnUxi2ZmSG6RtDZ
	SfV7d4r29iQF2G09m8+lS0ulvgPoZiPr5gBRCibxAJeFwcy8c14jR9AOUSvqWI9Fo9mWugHNfhU
	Np+w72bGxX/ztNlN73b/Qk9izKj2O2xAxDeHFG1MEbG7XigwntPXMgEaAGNv7VATn4enYnwzeRu
	f1cwZMetjmVO6TZypgix+42sr0BjymJb9C9GOVqxPzMj/6fbHBG3WQMijTmf5GNLYNzEp+vE0dm
	udEYNpE+MC+cg/25qQcZVECxtPYQyVMcsYiAACWy4DNiNfso4j3g447G6QKyGcoo4=
X-Google-Smtp-Source: AGHT+IEBmx+ZQ/eW4AZPhKidcqGxynp7l2P+gbNiDxUTbC7O06/aJ5TszwOGLh7AoxEwnSSyhb9L0w==
X-Received: by 2002:a17:902:fc48:b0:295:2276:6704 with SMTP id d9443c01a7336-2a2f2a4f6acmr310394615ad.51.1767239007827;
        Wed, 31 Dec 2025 19:43:27 -0800 (PST)
Received: from shiro (p1536247-ipxg00c01sizuokaden.shizuoka.ocn.ne.jp. [122.26.212.247])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a2f3c8286esm340437965ad.33.2025.12.31.19.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 19:43:27 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
To: krzk+dt@kernel.org,
	romain.perier@gmail.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 0/8] Sigmastar DT warnings fixing
Date: Thu,  1 Jan 2026 12:42:58 +0900
Message-ID: <20260101034306.1233091-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_194329_924860_E09EBEA0 
X-CRM114-Status: GOOD (  18.53  )
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

v2 heads up: I didn't ignore Krzysztof's request to squash some commits,
I wasn't sure what to squash and I thought since I've fixed everything now
it was better to send a v2 sooner than later.

I've now fixed all of the warnings except one remaining one that seems to
need a change in dt-schema itself to cleanup:

serial@221000 (ns16550a): reg-shift: 3 is not one of [0, 1, 2]
        from schema $id: http://devicetree.org/schemas/reg.yaml

The way registers are connected in these chips is weird. I think
they took their peripheral block from an 8051 microcontroller
and jammed it onto 32bit CPUs so all of the registers have
weird spacing and it really does need reg-shift == 3.

v1 blurb:
    
I saw a slide at LPC that had sigmastar in the "hall of shame"
for DT warnings. I finally got some time to look at this so
I have fixed the ones that are obvious and quick to fix.

I'll fix the rest but they might take a bit longer i.e. one
of them is about the register shift for the UART registers,
that'll need the binding to be updated I think?

FWIW this platform isn't dead and I have been rebasing all
of the out of tree stuff that make it useful (Audio support,
display, hardware video decoding etc) but its basically stuck
on rewriting the clock driver so that it is mainline-able.

Some other people have taken the limited support in mainline
and my out of tree stuff and made it run on old MStar MIPS
machines too..

change log:

v2:
 - Fix the regulator names as suggested by Krzysztof
 - Adjust the opp table name                
 - Add a commit to fix the cpupll binding and clean up the         
   warnings for that
 - Add a commit to fix the memory node in the infinity2m 
   dtsi to fix up the warnings about that.
 - Add a commit to switch the default led trigger on breadbee
   from the undocumented activity to cpu to fix up the
   warnings for the that.

Daniel Palmer (8):
  dt-bindings: clk: mstar msc313 cpupll: Correct clock-cells value
  arm: dts: mstar: breadbee: Correct regulator names
  arm: dts: mstar: breadbee: Correct LED names
  arm: dts: mstar: breadbee: Switch from "activity" led trigger to "cpu"
  arm: dts: mstar: infinity: Correct opp table name
  arm: dts: mstar: infinity2m: ssd202d: Correct memory node name
  arm: dts: mstar: v7: Move the reboot node
  arm: dts: mstar: v7: Add sizes and ranges to sram

 .../bindings/clock/mstar,msc313-cpupll.yaml     |  5 ++---
 .../mstar-infinity-breadbee-common.dtsi         | 12 ++++++------
 arch/arm/boot/dts/sigmastar/mstar-infinity.dtsi |  2 +-
 .../dts/sigmastar/mstar-infinity2m-ssd202d.dtsi |  2 +-
 arch/arm/boot/dts/sigmastar/mstar-v7.dtsi       | 17 ++++++++++-------
 5 files changed, 20 insertions(+), 18 deletions(-)

-- 
2.51.0


