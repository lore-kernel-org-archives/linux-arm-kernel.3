Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E875CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 11:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=; b=lYeAiegJ1AiY/ZAitIku8a72M/
	yt1cAbjEbUrM0ANfGC20zsOVUN+6cYc5QZkBMlupjr5IcRZqOiRyoWil69+cJykakN7MBhnwtGkMU
	v+z3UWn36abJEkqkkXA2QQ4auwInOcYlhtzuSOQ1JmYWoyThDF9vqaQD5iDWY5lMFMcvzQFyRwtyJ
	0VwzhxMiDyZCy/IkqoH3Ab7I8X8nxPDHi2b/JL1Cp2zO+6/9/66VuTIm1keBxcBoYq5Mn2itBM85j
	WYedxk5R1VnUaBUXxCBBmZVaPjZ9wZ2awvVxNM5zuolzfkAT8XtoTVsaZXDO5JqHfT7Z4wvt129z5
	jlI4p4yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAX0-000000018gZ-0Zof;
	Thu, 18 Jun 2026 11:03:34 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAWx-000000018fe-1iMM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 11:03:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf1f074a12so8110635ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 04:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781780610; x=1782385410; darn=lists.infradead.org;
        h=references:in-reply-to:mime-version:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=;
        b=I8uDJ7BQwFbvM/UQx2IoOdeUlmdXG2XKKuMW4VUsCoLeyHOzjOzzwmGPdv48q2KtGW
         7T1aO9VPduQv1bp3VDiQDmAdt4FVvFZG+YDJgnYBrWDgA0hEWzdpDGFcMPEoTCmXyZKI
         XJ3A7GSepuLxtfFlrB8y+zhPl7NFn2iRYVv+vOlr69a1SKwyAgBWASeKrM4ZjuO3qiZl
         0APj1UnDwZQol3/pDFcki2n4YchNArDMPkdbNAljv+y+ffIMEjt0QMZkejoZBf5brJDp
         6kAv9/7kCRB+srBvS/Mdds1hU88r4Kwpo2o8UeGIHUX0TM5CADKgvXdbAsuVYJGDmTmC
         HpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781780610; x=1782385410;
        h=references:in-reply-to:mime-version:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ih1hA9pkwP8L/MCNP4uRdj5lWZxa52mA9WZkZEjpN1I=;
        b=qEH/k2rEUaWdiBqc/KFkfqHgdIS7vpa1JouoG7R5+ytEJyTaZW+ZCGWXoUq4eRen3W
         dMwMtlP5WsSWZgO7S8zDgne37u0n35hHKjJCgV2zevY4JriA+OiMK7ap5UqZHGzE4Z64
         hXaFHa66loTbhVyNPseHryi8WYjL1WHTduHt1TnwS+A8A19GV/eP/7NIJzkAi7e0BJ88
         M1TWyRJ+FA0B7GNWDvOiigqxevjNWHYQA51B2amWxj9+gI9BiRsHjTamyOUd5vKIk2BG
         kpUBXO8zPsBJF5XfP9ETtueHgL6tWUbJqdMFC81e8RBB0DxLsgrC+V9QYF3joU8HRcPa
         0NdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8HuWCizRCfC762zzqKi6LfDBxVKj7cfTU221NZroBOzKlskYoavaLvdLaqDhYaxr5GLt2F5OFlxuZhH/nF/LQW@lists.infradead.org
X-Gm-Message-State: AOJu0YzOKoPI+xJRnv/OT8SYLTNyqZtZRFPzLRZXmVLAtIY46jCbOj5Q
	++gPGK3cwtedoApzo2XGmJ1NZGJHskkeXPG5D1plZXrcB0Ka+iik6s6J
X-Gm-Gg: AfdE7cl0xAnSOYP9tTANFT6gf3VmzwVvPyTBAAwxtAsftaNakRtur0XUX6OeSIx24u8
	oj7I8qXCbjLg6Jkv3xS8Jgmu865fTUvp2GrqLbHPv7TawPw1g5X5Z8s60WcGEpmBzUjpzyjUph2
	nwKCz5EnHVKQGLAKFic8TnxaMAxCOBM4S/fG5dyPTipp22UWV5dyGrstnKChwNRQRvhz2ECyDMO
	y/3wkQcHnqfC2aY3XoPvhHrsDjsHAJVAhVohzKjqOdIlnTkaa7k1HwP6BsuuCo9/spsZM/OCyPu
	2tpOrt7c9fL48gKUEz8+rfLSHP1wfEUIoKi5eYZRExSC3ZTQL2A7R5E+aYFcxvBXDMh9BxB8nVq
	j+ZqwzP6GEq0GInFqt927rFeNIpLkDBFvGa0mUSp341XH4hAuu3EI+KE3ueY0fyxgRj1HZq/xQ4
	JYoQYgzA==
X-Received: by 2002:a17:903:2a8b:b0:2c0:c940:dc32 with SMTP id d9443c01a7336-2c6bc0cc732mr87305065ad.16.1781780610103;
        Thu, 18 Jun 2026 04:03:30 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8c1f9sm199005805ad.59.2026.06.18.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 04:03:29 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org, horms@kernel.org, pabeni@redhat.com, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v3] net: airoha: Fix skb->priority underflow in airoha_dev_select_queue()
Date: Thu, 18 Jun 2026 22:10:00 +0800
Message-ID: <178178060540.2320032.8413754929321784354@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
In-Reply-To: <20260617161951.52abe413@kernel.org>
References: <178161373805.2167512.2544164327472822616@gmail.com> <20260617161951.52abe413@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_040331_865796_9B998316 
X-CRM114-Status: GOOD (  10.73  )
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

On Wed, Jun 18, 2026 at 08:19:51AM +0200, Jakub Kicinski wrote:
> Hi Lorenzo, is there a reason we're subtracting 1 here in the first
> place? Could be just me, but may be worth adding a comment here.
>
> Please respin with some sort of an explanation..

Hi Jakub,

The (priority - 1) mapping predates my involvement — I only addressed
the underflow bug when skb->priority is 0, where the unsigned
subtraction wraps and routes best-effort packets to the highest-priority
queue.

Lorenzo, could you clarify the intended priority-to-queue mapping so
I can add a proper comment in the respin?

Regards,
Wayen


