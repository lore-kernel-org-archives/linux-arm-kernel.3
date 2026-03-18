Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14ABF103E170
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2XHpYNQ3KDR2HDAUWZ7ar2fFYtc/VU+5Al63pdYj+mU=; b=N7rDQtg1Q2Q75/3X5HoJJxo83X
	5TBXR2ZSN6g1j7MUbNgSgktZZkHxXg9zhzMq/iB7mscupEMnidnO1m0VzHGogSV/sSL3St6LCG0y6
	TF6CrhYe4s+2gt1chuayN5wh2DWDox5Z7eZRrxxYxefVgDrdqZgQ/gAjNtV2G4In739jurN19y6It
	d+zAYb6AvpUibAhhOvtwLFc9U2ZjHoW+gsXNQCeaGM3QZkH0x+4O1InUS0LHxM6pslESGVcDcgMm2
	Jy/GL+aGZJzHBdGyhNH9UmumSN24fsqaG8Q1PMaZ7vS7bNWRnh1F2tvrrbdQAMo6CQk77E8c0zOpl
	IR22xxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q7p-00000008OSc-47Rm;
	Wed, 18 Mar 2026 12:35:50 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2q7n-00000008OSH-2e1g
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 12:35:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-82995242934so461483b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 05:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773837345; x=1774442145; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XHpYNQ3KDR2HDAUWZ7ar2fFYtc/VU+5Al63pdYj+mU=;
        b=fF+j27KqXcGFI0DPR5x71z3GbrDPux/XDSgoVHujUhEzH5c0rtst6gtm8+uY6XVGPR
         rdRLOQu2tE4I2BsBgKfvpEkr2dvhvZEMexfORueyzJtjeikizGtQcauQdmczDWhCcegO
         JMQCRd1QacmXeVE1OUBG8WNc1Y5e2ArDPGRIpL9ZIoh0VtY0eRHaxnLmtmznQwSvaRZE
         JbgkxxWhRoYMLzMru9KAU8mJ3GB41M1IptsDpzBkNRdr7wnLeUFc3Xe+TXxpBl8dWLA3
         G2fwthL1CQbpUMjHJuEs4aULpCty5TFWJyRAL0aU6nAhX3/nDMjdL2hYcLDdSNElqc9v
         H2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773837345; x=1774442145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2XHpYNQ3KDR2HDAUWZ7ar2fFYtc/VU+5Al63pdYj+mU=;
        b=c4eepPFvR69voC0dCXlew5ajTqL1EzV4xSrwA7I66uFWcBISXoQAxRlHxkO+6mTt1p
         Orbr9q9F6o2lwL1Jn84sluZwcgks6VY6AiDc9rflSTHqoAa0poOXG0ePlc56rfVxKTcw
         Y7PdVvZvamJbdqdA+gX0R3zkxTQJd0ARYHJjN9EOhTdST8h9u1TotqM9F7aBHrUdcmx8
         LFaCJ6LklIQ4hp2R33DBiBUKS1PoRIExYPDQbvHd4nPlXP1XHEPZGa8E+n6CMQ6Tp22v
         sLetEXvLpelYcRdwBNtR86cx6idk9s60Rs8JgsDJHdv1y8z5yBeVGbHs/LvsyZUNXqzX
         ERwA==
X-Forwarded-Encrypted: i=1; AJvYcCXp7qaNQNTYfygAqY/4xwVbKmi7iqRR9xDubtdEzrEsl28EBmV/a0bdZooeV5ap1xBkgl8tzCdi7KcaohDWFriz@lists.infradead.org
X-Gm-Message-State: AOJu0YxwYDEe5lBRbSIlXCV1kdaH02eaVFl6hXiOmdLNBPJ4y8/v03Gk
	emj9h8ak3Oymk/u/c5+Sh65B6D2nwLBt/+rCQzMWlfBeOuoZGCAu8IPS
X-Gm-Gg: ATEYQzySs6o9Lmpef6+5DRnVs6KYuK6RDlAMXeSFI1/C2fqfG+Ku2ikLgvM/n3k9lWQ
	UA1+hxrmRI8vTer/pUYQWeH4sse8KLJUFMmQOsKoqXIHYbPVnHG02Jn3SjvJ++/B9HQ4v+TqpbC
	FHZEF+bN8e0h5FbPO6hSTxgEnrzLzRo/SDhbVGqBnNnVDAxJSWUoL4Zv7C+Y/nX5V4CwdO9magm
	pL1KOG6teF6H5ix4K9BbFEe9hpOdhcBImM1NkM6E0CjmUXISuqYIsOBihwnJ0Gh4Y/j82sZpavA
	ThPhlcxuMFJxETH2Ixoyrp6b06e2W+EbPoYYxogO63qkfrD3MxncN0+YCQm91W1F+s0xxNqwzTo
	2qwTndQlzEftauRexR5gGOj5KtR8cL0mSe3R5/5s47z7kUxLTUH3X2oQbey3IziuqfrECSVkRxS
	pyyQNmVkddj9iBbEOKpt884mQ=
X-Received: by 2002:a05:6a00:4006:b0:81c:717b:9d31 with SMTP id d2e1a72fcca58-82a6a02b014mr3004715b3a.2.1773837345543;
        Wed, 18 Mar 2026 05:35:45 -0700 (PDT)
Received: from bsp.. ([2409:40c2:100e:3b8e:f351:1dc8:4b9e:9794])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6b541cafsm2756120b3a.12.2026.03.18.05.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:35:44 -0700 (PDT)
From: Rahul Navale <rahulnavale04@gmail.com>
To: Folker Schwesinger <dev@folker-schwesinger.de>
Cc: Rahul Navale <rahul.navale@ifm.com>,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	michal.simek@amd.com,
	suraj.gupta2@amd.com,
	thomas.gessler@brueckmann-gmbh.de,
	radhey.shyam.pandey@amd.com,
	tomi.valkeinen@ideasonboard.com,
	rahulnavale04@gmail.com,
	marex@nabladev.com,
	marex@denx.de
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction reporting via device_caps
Date: Wed, 18 Mar 2026 18:05:21 +0530
Message-ID: <20260318123524.4959-1-rahulnavale04@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_053547_680952_AFD02A8C 
X-CRM114-Status: UNSURE (   6.39  )
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

From: Rahul Navale <rahul.navale@ifm.com>

Hi Marek,

>If yes,make sure you only test these three 
I have confirmed no other pathes applied on xilinx dma driver.
I have applied only three patches provided by you.
and tested audio but facing same issue. 

