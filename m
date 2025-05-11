Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D1EC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 16:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=; b=yKZjlH180Tt40nuRlbYAfs+TqX
	wEfIxPT26UMd6bNy6g1BXE15ZVyl9eiwHXIlRY+AOpS1l4oYUZemHpq0Mjowxh6/WzU7SM5ygsgWY
	5IdrgV+lUV+nzL9cWI34P+hevPNFSrJu7LTxIhVYXweaKtGl75EK9xUztdoNnmC8R86+dpD9PSn0P
	H0rpfh6m9H9WX9t51Z2zNDo8emj+IBFlp6MesDIhAy3TkfmkO3uT3E9ZZdMlNl0qGWC2hmh9Ttv5b
	b81WyiTJFqDvwuxjBMCxKGmS3roXDTHChD55EkSBIKRipapUdsb912aDjx7oCMsKuIECBCPAC0S7P
	9rZw1tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9vW-00000007YeD-2kBK;
	Sun, 11 May 2025 16:53:22 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE9hE-00000007WkL-1EyJ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 16:38:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7403f3ece96so5043229b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 May 2025 09:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981515; x=1747586315; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=SlnkP9it1jDq9giTnTPTRouY5Ezwui5JNYhorwuewOtlzsqqMdgPJQuknngLUgV5yB
         nfdC0CoheNd+QVmiCvcutxhApUvV/RgWuvLijwzPN/d/Qwh7wqNPcA6Zk+I31dzBtErU
         xZ0I8sWiqmD0W5T/ormRq+dSYY87PjYSqocB4Eabpn34/pJKeQkHxcGpRm7d+6ax/luY
         nQjF+lQOqJA/UMYqbV+84Qqtqp59kUzf6rCLt+IVzHVYAwTnyqXvqUhTw2L44y0w8hUJ
         Nyxzzi5tmYw1feOnza7dh1Yk4iadoEFZvw2wPE5a6AfAFWd2piqiNhUznydDTHgCiP4b
         xtGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981515; x=1747586315;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48hZo8VzWZdHTpogELRWbdlbj5PPFuDYOO57nCwCu9Q=;
        b=EQ6tCyNG4rPcXdeBWtgAPgzloBmY1e2fy2Z33us+92FZ9QQciFxhZpaoZiHvyhGYpT
         sFLRV2yzVW0hNswUEHVMCsZQ9m7Q256k9u6hy1vq9eT9bMXCSF8JQ7+39TUKAgxS82UD
         8fF1dRO5yxyc2qFk3PQxmZ8M16ym228AmXXNF/7coCo/yWmiXrtGLSAD7E/M0K+9Ab3h
         dMklYUkQBvSl/bAEpPvbozcpFJGMOZMwiXWoHbohEFTNDneSh9rSTKuL0TzLcWsTL3SY
         SOk8V/7HwIK2+bIDnzVlJScc4d++vv2Anqa14FPciAXlLs5BR3H/pdR3SFxIH2gkEcWh
         Qn/A==
X-Forwarded-Encrypted: i=1; AJvYcCXtqUDZIWnnrZngFAryZosEzU0JfXQcOykkXvlF57jvF0I+/V5K4NAEjnt/wKSoXIVJd8JMxXl11MYbFgv+Yu6T@lists.infradead.org
X-Gm-Message-State: AOJu0Yzso5BeL3X+9GuNmT+vf4ihI8LVCKLzvnhaxPH2Kt1zR3bv0Swf
	1aUsL0Kpp4RuOkLoAw+p/IXEOLJvFSdJWzhbMS8FoxESaKW7vY4mPt3f0kBQfv3KgiWDdxVsymI
	mJmK8EBFH
X-Gm-Gg: ASbGncu4gFqiNTG+DMcMcn33Kq63E5GwDj9tvbM8pxwg9hVN1CwfEVeg5IvmeEPwEUY
	27IDWRolxm/n5rSkInyTMhnZkmytJypV+Ufa+eXG0NKDDdGT7cW36i9nWRwnuSn5X9gPE7Bkf65
	zfmgn9mSyGbGm7iyCN81+TX8Wd3jBwzhk5EtCstjguNOgkUI7RWmSXNIPijUTUtAyMlYOdWezMW
	46/9QIIqhBi6BqglvcijIa3g5KZzfCPR+rSIvGSaPXxxbB1m29kuap0qQ/0fzVQWXpnDRs7kq4G
	220xcBasogdR9jNDr+0lphxOH0MoB6A3Dg/6FGvgV0LIPGRWGw==
X-Google-Smtp-Source: AGHT+IENxnkeTCU2mQLGBVkl8Moj68KA+2IRRcGPD6paLo/iLVGUVJ6hgM0VpDWjUGKVZhQfNHz1FA==
X-Received: by 2002:a05:6a00:2789:b0:736:48d1:57f7 with SMTP id d2e1a72fcca58-7423bc0d8dcmr14402736b3a.7.1746981515436;
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237736d51sm4776797b3a.65.2025.05.11.09.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:38:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] OMAP SoC updates for v6.16
Date: Sun, 11 May 2025 09:38:34 -0700
Message-ID: <7ha57jrtkl.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_093836_331663_2B5D4339 
X-CRM114-Status: UNSURE (   7.02  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/soc-signed

for you to fetch changes up to 47fe74098f3dadba2f9cc1e507d813a4aa93f5f3:

  ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY (2025-05-08 06:15:09 -0700)

----------------------------------------------------------------
OMAP SoC updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: omap2plus_defconfig: enable I2C devices of GTA04
      ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4

Parvathi Pudi (1):
      bus: ti-sysc: PRUSS OCP configuration

Sukrut Bellary (1):
      ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY

 arch/arm/configs/omap2plus_defconfig        |  8 ++++++++
 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 arch/arm/mach-omap2/pmic-cpcap.c            |  6 +++++-
 drivers/bus/ti-sysc.c                       | 19 ++++++++++++++++++-
 6 files changed, 46 insertions(+), 4 deletions(-)

