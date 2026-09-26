Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A20C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 02:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=; b=kzDnFcDyW9ZdxlYK4Ge1DqYHP2
	dWPk7SFenMEWesspzDr6xaHCPPGref03acxRie1mQo0rcMMgactvidyqmNjbPTBcG9uYDRooB54i+
	Gmg4BjSmDZci/tiS00Jmt9lUAWaCE0rDha0njqnFtoZeqCiDdnDqdH3d7MeGxh/zV3NVX2aRWY5Ih
	EIudjGol5rsd/7/qG+HFSAPsF2chF0hL3eAtdQz1xUIo52apriu85NOKnaeJa9k8PTA176m0DONxV
	BLwZC1iu9bnkiffCkP3e4zd95Tv4zymZZ7QBBkR2a03DWmWVox57piJFJwCwo9D9y5O7dlxo+hNzE
	xikMvz3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHl3-0000000EqDb-0Fw8;
	Sat, 26 Sep 2026 02:03:21 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAHl0-0000000EqDE-47GW
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 02:03:20 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7f4df360cc9so1550918a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 19:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790388197; x=1790992997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=COo7niDD9Mc/7Zyqq7OyZYu3DyWyzyifIK/tPB0cj/f6TsRVFvKBcVpMsMMwAesAoi
         gZ8Qx4s59Nqc5SkBmWQIWxbykiRLzeeaOll0z96Jwgo6cRMRsXxJDiGhKCNXOuoVGbXQ
         VF5sejTlt18hWithBztXymtLNqgEBbrC1201Rl8bw2nxXzFGueibHv7/H0v6KWeEs/8W
         +kzLYkgxi0Ja5OrFHO2XzBGWIwtZ3oBnvIW1L1JAR3CvP6KRmh2UX9YUrPhi4tthr31p
         S9lDqJVWFkgYGX8Ansonnm6UNhzCPxBR18jQB05HyRxAqDyPsm4ZKmWC2yTNBo1Y2rhe
         NM4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790388197; x=1790992997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lAXbW0zIqThSvZBW3q+aJhA/JQ2MT3RMwWvhV448ODw=;
        b=KZnJRaPg0gCxhElmUq3pA7Qf+gR8HMMc4RolvoTINzuLsSPF0N1iT9SLnzvXW14kXc
         AHALIjPUMq54kGR8yFTmkS34oaMCQplAHCzjNbG9yEGkpAQa9EEWvD2EwcyAS6T3J7un
         Ss5KZA9SR3QO3nPV/jPb5k//J9S2i7kYTG5nzaqePNhqU3q5oWfyK9Shc+YVpS7USE3A
         oCjDnEcX6Las2Eqyk4j0RN7HCJLMfPutWum3XB6FsmH+AMIayprXO8VzHdHehxsSqjIu
         TAyv+PKpQ04cbETKpigvgqeXIYh7XYGrSIhfoOm5HqIZj2qiUxYyOpyKyIty6p/aVHa6
         QmFg==
X-Forwarded-Encrypted: i=1; AKwUvBxUnAKOx4cGbVhWa0TVLDfyYsC1ix09sjyvYhdX2qDYPPthQpJffI7BagBBC7jFcexzHaRXckGRsz0eTmrOyCBO@lists.infradead.org
X-Gm-Message-State: AFuF++kXDLuvHj17kXtqbt76YGjiEMX14/tMzmKEmIki8ni77f69pfxW
	cLdGtoKA3GlLH0rdojh5riGpdsCJCbdSP6lnRH2P5JQ7Y8M3/tyqQdb1
X-Gm-Gg: AYBFou3q3OYeIODvlB5V4epJjjfYpt6vEW4loqHCgudbV0gSpw59jxkhbrCoT15uc/L
	HJjcNscYPrBzEXJ+Q1XmT2WP6j6ciaXeUvFnj9He7EfM/XpAwH8yllxZLIgawm5HlV0GGOuZboh
	ghNZWABvxydXtXavaH80p2EC/GFUYoQplZV5YD2xxz3IAq+Vp6PSQBg+KbLO0FrAaR1Rj9doOiA
	wYWqfJ3618viY1eY2oIRaeV7GfB/YhTqvDFyMoUO2Yq6RQ+dqKj00h1OAR22RMFTBmdQ5IkKp8X
	AVVNzXbHnezdXiOfoizFauFziA82Mki7R6t5/Nm90/+AE8SSju7tLJcoQqUAJD2bNGwKjrrA0Q7
	NkU2MiGnSfl4/zxofm3E//A8jyshK/xcJ+M8HbaXIElag6F/7PXIxcXP0DtB2bSEjpRz+ZcnsH7
	Pzh8kGNxPTczt0d1+RTcOGQjhDuCHXC87lsXq7rzJPtwvewH9gcaCqyXPKWkEjPodwXO7QQsRg4
	uCgAbSR6pPhPBixK55jEY6BHydBmUZ3dAKVBGNC2bBOeuxrbw==
X-Received: by 2002:a05:6830:a18a:20b0:816:f1c2:d6b8 with SMTP id 46e09a7af769-81780a93afbmr4940499a34.9.1790388197052;
        Fri, 25 Sep 2026 19:03:17 -0700 (PDT)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81903f5f25csm3719365a34.18.2026.09.25.19.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 19:03:15 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Fri, 25 Sep 2026 22:03:13 -0400
Message-ID: <20260926020313.911537-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech>  <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>  <20260921200512.3179109-1-enzo.adriano.code@gmail.com> <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_190319_029778_2DEAD82B 
X-CRM114-Status: UNSURE (   9.73  )
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

Hi Junhui,

Thanks for reproducing the ahb-cpus issue. Adding clk_ignore_unused lets
the Cubie A7S reach an interactive initramfs shell.

I reused the September 21 uninstrumented comparator: v7.3-rc1 plus the
four single-divider patches, CCU v4, the seven pinctrl patches, and the
minimal test DT, with only ahb_cpus_clk marked CLK_IS_CRITICAL. The Image,
DTB and initramfs were byte-identical to that earlier comparator; the
only boot-argument change was adding clk_ignore_unused.

Without the flag, that comparator stopped producing serial output at
"clk: Disabling unused clocks". With it, the confirmation run recorded:

  [    1.263452] clk: Not disabling unused clocks
  [    1.292364] Run /bin/sh as init process
  [    1.526500] mmc0: new high speed SDXC card at address 544c

Commands issued after the shell prompt returned the expected readiness
and completion markers. No panic, oops or SError appeared in the capture.
The RAM-only run was followed by a guarded 120-second power-off recovery,
which restored the vendor kernel and eMMC root.

This narrows the second failure to the path bypassed by clk_ignore_unused,
but does not identify an individual clock: the flag also bypasses the
runtime-PM acquisition and traversal before the per-clock disable calls.
I therefore still cannot add a Tested-by for v4 as posted.

Assisted-by: Codex:gpt-6

Regards,
Enzo

