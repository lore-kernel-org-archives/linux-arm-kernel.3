Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCFBE88D63
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeRTLOcy5yBXD+HuJ39TxkiskXMTMotEnO2l9/4Dmvs=; b=3NmOBIqqOpaoT22WpRjKW7iFyL
	n1JMCdjyVvR9iTgvAxRDW4BGQwWZwnTuWxf/3/Y/SZldDbbnBR4h3kl7pv2q/wPvVYaIDe2FYLK+V
	ErYTqAw/v/Q8NfjSk43JqlkzTa3bwjKz1WkBRq4NTj2em8aKLzcYDY5DovEvV5BMMlKDumJVFJP/d
	8K8vu4SiT3wF1dbOrjNkalKlellWWvg85WgDYNW7/8gvql8ztglh/KUlbLopUW5SI8FOVnhyw3BdZ
	7YCGVaM3dDRuF+PL3wAyCKz4oAOy9LujXbFi4MGFi+MwkrMhtZqebd61RZzXAcMCGjX8G9dJTXF9q
	tA0HlNRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8m31-00000002c4A-33NH;
	Fri, 03 Apr 2026 21:27:23 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8m2y-00000002c1Z-2yNV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 21:27:22 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82cebbdbdccso1149154b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 14:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=orb-net.20251104.gappssmtp.com; s=20251104; t=1775251639; x=1775856439; darn=lists.infradead.org;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JeRTLOcy5yBXD+HuJ39TxkiskXMTMotEnO2l9/4Dmvs=;
        b=dq9wGcQC9HtEt/UtlPpc8FLTXt4eEq/bqEkHS5lIl4O4D5MM4Xwlon1jGjQ1Iww+HY
         k6t0qfs0L1sE7HRgLGfweaAU7tpgs7THRn4RfAwTeA7fa2cxp1a7abRP22PJMzqWgNmr
         Bs7L+eFqwK5SIcwByT9zj2zOYpM2rTbEEoeCJS3mVCj3F3/1qslPiKtWmdvrkAQ8secn
         4t8iEoU+d9D7AD0rySxAsmtnm1dGB002dr0YSVKXZsZdd46rXUtAEmqy2azmd0kXy/vQ
         LgriknBBlGmLfH4lr4rb1k9Tk5iN9PuMaEA6tZB5DwHRTWgEYoYMxKlsbnyaSsqXI5LI
         efSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775251639; x=1775856439;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JeRTLOcy5yBXD+HuJ39TxkiskXMTMotEnO2l9/4Dmvs=;
        b=a83VbdGIunF/lkGxGeLkvE1uvWvdUAN6xbEOHD7ZTkZpSgpQ7EVSHThUfNUx3EInap
         aJKHhhZUSa1hrM+Rhc61aCQ6hY0GLcnW7COxyqPuhYDfVLsO3CHdAE5t7PmK6S4JFLwW
         vOP0yCCVgO4cHNGsCysOkfFRcEv8kjxU/lATCyyKhoxk39F97+oBc6i7GOHWmnzCW/6d
         Y2JcWHfPPTXBvlWg6QVXreyJq66kRmU32t2M9OypyaInjUlt7fnJ27QDNgWlbjdL5iDK
         0Cccoy1sy6ab9pFVdaDXhv/LthxQp2xIZvpBeHJPxD4OVoHf/ybOqYZUYUHGMPt1tnV7
         CtZA==
X-Forwarded-Encrypted: i=1; AJvYcCWqvpEDazWpSJ0yQ/H9RGBwx/JU1Iaibo4/ovavVaaykyVL5tATPzVRvYzA4GW8p6pQeq0yGm6yfqGzO1eVx9yx@lists.infradead.org
X-Gm-Message-State: AOJu0YyNLPb2ngAi64UH+dBdHcWe3KdZS0Z9GtAJp8GofyEhWZVJtseX
	roX9TqpzOs6Eg0CPtyVZO3IpND5/jaCu8XdD8y6rdhx24kq0dSaRvcSkA4ZANhEDe3A=
X-Gm-Gg: AeBDieuRAx/Z1Vh6pRodW5zYVKUjHt3ameGvKZHg06XnQKBoruqO3KykWQOEwYvMgOq
	z5cDeX0Mjmh5Vpug9I8iRl1VW1LBbVay2JgGtvLflM0dPSc+1k9gnDbWTigeDdGsGVhpXEBz3lJ
	oxaTQ3395IyYVNllFMrRnPjgciTFqQKwqN2yIL4xQySk8ivFB2b0emfGfLpwL+OOJF3EG+w5Gix
	/I0Wk8VFBPMagQ/wLlbWbKhCNhMUtwFfl1jKRwenppaz6lMFSj4eDY2hNnIbedm1vuNrOSNpD5m
	H9qIcl3YUa9/ijhiH+UIrvYdNbgCe+kh8a8l+oOfMQJr63gUhXRQuae+ZoANqVh3RAagos1l4cI
	YhkwCav34ItikKCC0wWHdERY9yhmGRA+GOuSCdl7FF+mZQNVqlKkJ1wwWI59APb2/RurTCef9Kl
	Mi0GYzWZyMm348xRpt7+Egz+6d0NMRYmkxA0WXc9gUC17+sTT1zNRVGN0+CkuzHJvzIT4A7Mkd
X-Received: by 2002:a05:6a00:a257:b0:823:1444:7873 with SMTP id d2e1a72fcca58-82d003b2753mr7863216b3a.32.1775251638984;
        Fri, 03 Apr 2026 14:27:18 -0700 (PDT)
Received: from claude-dev ([50.125.94.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3dcb3sm6643153b3a.16.2026.04.03.14.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:27:18 -0700 (PDT)
Date: Fri, 3 Apr 2026 21:27:18 +0000
From: Daniel Bozeman <daniel@orb.net>
To: shawn.lin@rock-chips.com, finley.xiao@rock-chips.com,
	ulf.hansson@linaro.org, heiko@sntech.de, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pmdomain/rockchip: skip QoS operations for idle-only
 domains
Message-ID: <adAwtiaU-32qjRRE@claude-dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
References: <20260331180223.1682283-1-daniel@orb.net>
 <5c8732a3-6cc9-5d02-f56b-fc7ba29c7ce0@rock-chips.com>
 <fbf16b5a-1565-39c9-0d92-33a7a577212f@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_142721_000972_76AD8147 
X-CRM114-Status: UNSURE (   6.95  )
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

I ran both tests you requested:

Test 1: Added pr_err to rockchip_pd_power_on/off to identify
the crashing domain. With patch 2 only (skip EPROBE_DEFER),
the crash occurs on PD_VO:

  rockchip_pd_power_off: vo pwr_mask=0x0
  Internal error: synchronous external abort: 0000000096000010
  Workqueue: pm genpd_power_off_work_fn
  Call trace:
   regmap_mmio_read32le+0x8/0x20
   _regmap_bus_reg_read+0x6c/0xac
   _regmap_read+0x60/0xd8
   regmap_read+0x4c/0x7c
   rockchip_pmu_set_idle_request.isra.0+0x98/0x16c
   rockchip_pd_power+0x130/0x48c
   rockchip_pd_power_off+0x38/0x48
   genpd_power_off.isra.0+0x1f0/0x2f0
   genpd_power_off_work_fn+0x34/0x54

Test 2: Same debug build, booted with clk_ignore_unused
added to kernel cmdline via U-Boot. Same crash, same domain:

  rockchip_pd_power_off: vo pwr_mask=0x0
  Internal error: synchronous external abort: 0000000096000010
  (identical call trace)

The crash occurs even with clk_ignore_unused. The QoS
registers for PD_VO are inaccessible when genpd attempts
to power off this idle-only domain.

