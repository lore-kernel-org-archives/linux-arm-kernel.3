Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD58CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 17:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=; b=a6Gy4n5EUJroSb5QomfxMSrDkp
	5G5tgWWjfGh4z5kU73Pyrt55m9MXTZpx30q7Q0VgyjRv2TTCDz2PrUg3vqm7YVsfqiOT1zhzdjR4j
	h3BN57f8Jb4CSi9xqcf7p+l17aVV8DGj5WdL/QWGN1VCV2ihiSIWY8V3UJmIbMmkDhKSu/emadSPh
	mISBbrIgW/e/2dL6gQSG0Z7evratQZOanHOMjUaQlF3jWt+v2MMZfxDZ/pT5fn8EU3b3ICCtAGW0S
	sVxHCy+PTowHDhp21I4rmesofx/xwTI0YhjXr+dvhhiCQkH3bRvKVm9SQvH8RTv4o3poEN4O/Mmu7
	MDRqegOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPO0x-00000002Lgq-43iQ;
	Tue, 19 May 2026 17:13:55 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPO0v-00000002Lfa-15C6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 17:13:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso33233935e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779210831; x=1779815631; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=KTOzOZT/Py09XpgQNLGE3q4XgwkAg1pP/Qk0Y19yqw0A3ptw4qBcpiW5WgHPsDV1V+
         B6KMO/oLOmQxIDvWmPo5IWjOUoyljP8WYQlm30sA0PLVSH498iG8Gp6WhSq1gGzFU7NU
         59M7E6KN9aHv2XgVfzaSElPV05337nMSTqxsBtmUO9r00uvrA/nscgFq3MEN4ku/CYX3
         GAGroiuuSuvP1ssUZgYf1iuhoy/M0U8Kkl3WsgPgZ2sjPPALJqord18Q3Dsfl1nK8Mze
         Do74M1C7xYap+oAiypTTb0nVMOMNYWfI8Oo8pl8J3qseO4GGYAdZuT3qjAZ0ol0TrQ/+
         7+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210831; x=1779815631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YF0Gc/aWd6ni0YZ6OLz7XyAixJB1h3NVnu0bnzDB350=;
        b=fUG/MuULVmBugasMQJ8XyPIZHlWJIoqzhdpI9b4G9dU2sFAedkseDgXC3DDRyCTND1
         p/Fgo43ZMU4ESUUrESfXnTwpSd6DPI+Ohk0w8vtHMi+LJTpjDtvgllWMgFMJf4NiOYCb
         uW8vNObXm6MqCG4jMdC1Aq5tcQXh9pduih/DL3uIUVNxV7AEQ7Q32dGGNoEflzXpknLa
         hw3aeJlEM3CHPePcu6WC86/A5FEiQcPQhrHibjDh0qXWcyMfFqkd49uKvet+fV0kZ5zJ
         c0LhafTB7ilI3B5SxP/WCQWTjszYfaq6w5fh5FoeefWz9TQA1ga5H/qRnGwqdIaA13Mh
         J4dw==
X-Forwarded-Encrypted: i=1; AFNElJ8GwT8gvxYpTYfBgHL/AKnBobsCgtuPzdELAGEGkWW2KsQWbxKpH6mFuo89+w9J+OBR5+4PDEDLHNuQYWT35diG@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfc4LD66Ac/WMXdZwwAIVytdaMal1o8I7i5jDTDdMKjKvd7FnZ
	UMQjG/n+Mrj28ORvQb+lKQy11hefe6I7pd+MPcC+VRHqFT/lgwG66E2m
X-Gm-Gg: Acq92OHPRzdMT2Bvvubzx5Sws5n3eG2nCgBKAi/kdjL+avbEPfLttf+10w30ozaZwhC
	ruG+9X8mA57MVB6FVMlpJqsoWrKIg+Bz3NY4C9xR2RVJoqq0uvmri/d0i1xGKpucmP5FQGsQXnn
	EFf4rxbKkfXW9W7VOtRBAVpzaPaqksaKr5hQhm80UQcJMFIRgM251r+y+xvAaNSGpO/37HGeys2
	oPwyu7dlVNsaiWYHVIv5hoJk24a1WVkfehmvBpBJaeWWAziaFpjnnuu/coIhyqIaTradre8LRen
	/VYgyCu4+oTzbRNvFbaEvcdvegQl6efMuELE1RURQYL03WnoH4l7CqVLeGwAYLoZcvmBb/F6qoR
	fs9qrBcLRI95bg4NLL+yUN6apkhjeeKAy0JNmXorLrXkhH56YJUHMLFkbB4TIj1C/xavuxbUQ7W
	/Ycw1FGF3xAysAlU8S7914k3fZVK+kr0kvduzglJrjsx1TJ61bLlHjLZlqr5EwrQX4
X-Received: by 2002:a05:600c:4fd4:b0:48a:581c:ead with SMTP id 5b1f17b1804b1-48fe60ed7b7mr287651375e9.10.1779210830786;
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45e7c22d8b7sm17989013f8f.6.2026.05.19.10.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:13:50 -0700 (PDT)
Date: Tue, 19 May 2026 18:13:48 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] spi: aspeed: Replace VLA parameter with flat pointer in
 calibration helper
Message-ID: <20260519181348.777f7dc5@pumpkin>
In-Reply-To: <659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
	<20260518095708.2502537-3-chin-ting_kuo@aspeedtech.com>
	<659a6593-0223-4a26-830b-1390326b84e5@sirena.org.uk>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_101353_305147_1C29C92D 
X-CRM114-Status: GOOD (  12.17  )
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

On Tue, 19 May 2026 12:03:51 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, May 18, 2026 at 05:57:08PM +0800, Chin-Ting Kuo wrote:
> 
> > -			while (k < cols && buf[i][k])
> > +			while (k < cols && buf[i * cols + k])  
> 
> This really needs () to make it clear what's going on; the precedence is
> well defined but not everyone is going to know that off the top of their
> head.

Come on, it's multiply and add - everyone is going to get that right.

-- David

