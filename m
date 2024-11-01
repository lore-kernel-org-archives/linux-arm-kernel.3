Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14E2E6F063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoXvpMPyv+sDPClN8pjmFGHQt3n9px2NbZdIhR284AQ=; b=o/TbXb6YsF0ddXuhv1vYSNprcb
	iSypnQR23YgIYZyEowpSHolS/ScY9gqueTO0XoploWBhMap3FkNV5euCZBeyLdcxuRglA2x1yy1Lj
	aQJL6hO23H4rcuvxtANtuCmAxEMYRtFscIErxH5NbjCizMGBGDit0kEonMsfbCFn+EkEHTPQ1SgDl
	u8U5qSmzORdFlHaYyPIFKJCSaPztFa7vwuWhS1xBvc6qyfjAr5naRfFSoioRO9rnJ0UmHsEhWuYUZ
	c9HC3QMREhVO6P1dEJYbJeky2gChWM/m78756nz61/WjHA/kqHW//IKRItatzUCO2oKDjc5IweaPM
	rL6X5vBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szL-00000007Oqp-08m5;
	Fri, 01 Nov 2024 14:50:59 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6skw-00000007MXq-1ajR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:36:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-71e49ad46b1so1704539b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730471765; x=1731076565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoXvpMPyv+sDPClN8pjmFGHQt3n9px2NbZdIhR284AQ=;
        b=UchXdgmREXAmYQYCHKmIlveLmdxSEuz+zxRKfiROAWMuzTmWB+VYONUTDKBE2MsuL9
         UpZhs9muuC0d9AD7TJCEVYPPsz1kUTMwqV0nfxk4kPes9jj84hi9q6OPlkMGRiJU51xO
         hZiVHl3mFgytEbcd6DEnQR0XBzCA/I6h0s0bJc+ghTj9qxBFY6ARMAr8KxIWAUSah546
         QVWFX0iwD7/OdHg5WeED8VKUQSOI2jn9s3++NUqKEM/qqb2LcHADerd3XwS7rDFvfv7Z
         cuh0r924V20Skdhb/wVqISn9lM7fxxWo+XSCykYRcmNay0aD85Gp8GekUBFZ1y8qT5Mt
         j28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471765; x=1731076565;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoXvpMPyv+sDPClN8pjmFGHQt3n9px2NbZdIhR284AQ=;
        b=KEvVAngBMXo4DZ5t+JiL7xfDbgnzvyM412DQcCDRjs203K/kKbuleMKLISrD+FZJjK
         VeV6ptUEOtmlCoFFySoNtfqPgZiLOEGJUBsEroij66uzyZ3HGBMbbfZW9CBlDK38B3IR
         0Vc9cTHwZfYipj0meNqnh/tAUmzXPB5XJABvrz0FqiP1eH4+ldWclgfZW7QdKPD9Ye25
         ZZgSONVeUG5can9Mw8wvkI50NXlkwrAHPp6sops4+YHdys+1MycMpRbN9nhuZM4fwhcQ
         b5iJYD3JFWrm1gYOVPcpArvN2LJwWoyg0REsh84vWOpCULvUY1D1eucyxwr6gmCu1xTl
         vbBg==
X-Forwarded-Encrypted: i=1; AJvYcCXLxamgnz754XcTn5NmnRfehD8f+4oJVpSsuhByjgJMwSZy/zhj0fbizP15gvg/HBtnz7lN80Uze0Vr1rZBdFsE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3ILZFcBaZkYrinBjp88dftnVL59IcMKYrbF6Ok3AfwiPTzmMy
	4HJih1xcl8WROs4xHfgSBc6qVGAdVetmA48eUjrMm+rvCASLnqYS/LQsBugOXCO9lKv0rGs/FaF
	E0B3nxQ==
X-Google-Smtp-Source: AGHT+IEu37t9gRqr4EwxWBSZEWMi5G/9ki4gSlSR74wBR5lgdbmk5vzV6I2p+0V8+JbgYip3LNNObA==
X-Received: by 2002:a05:6a20:db0d:b0:1d7:2249:689 with SMTP id adf61e73a8af0-1d9a851ed18mr30293341637.33.1730471764998;
        Fri, 01 Nov 2024 07:36:04 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93dac03a8sm3114555a91.30.2024.11.01.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:36:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 Colin Foster <colin.foster@in-advantage.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
Message-Id: <173047176427.2845265.16393132183520369094.b4-ty@baylibre.com>
Date: Fri, 01 Nov 2024 07:36:04 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-cb14d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_073606_459846_9540B5FD 
X-CRM114-Status: GOOD (  11.73  )
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


On Thu, 31 Oct 2024 10:29:51 +0100, Geert Uytterhoeven wrote:
> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
> reset deassert time") already increased the MDIO reset deassert delay
> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN8710/LAN8720 failed with error -5
> 
> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
> AND gate.  It is pulled high by a 10K resistor, and has a 4.7µF
> capacitor to ground, giving an RC time constant of 47ms.  As it takes
> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
> input (VDD/2), the delay should be at least 33ms.  Considering the
> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
> additional safety margin and settle for 50ms.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms
      commit: a74a1ada3651c0ff8a05d0ecb74d84de3930e63a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


