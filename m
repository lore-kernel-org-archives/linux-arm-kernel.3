Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF702C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 22:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=; b=e/cLoO+zk789DELyiP0bA+eYur
	QwoJSUgaEs4SJzr+n3AUbVUyD8MbELZETAMADYjD5S3xIh8unqRGZRYiRDqyIs2SuRo6NJT2uh7dM
	PkqLBSUHV7c4GskWB+lWSU1gBlQS8tgrebZ6QKBRgp7OcUxE3Sf9FOU2nYKlHFYFVT5sk8g8UWRmd
	wkdbEfjLKLEjNT+virxuUVTTI3nUXxCYPglYJoNWUQjh89spWEYZputGMwHJTCXhMSE3+q+Ocimnh
	kO3rZHxkdaSh5HVdhAmC6XiziqLEZclXiCoWyz8qO8f+4KkB9XlTu2hobaLBs6o2nP0GzXKruLib9
	VEZ3VUnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4R7P-0000000D2rN-1TIQ;
	Wed, 09 Sep 2026 22:50:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4R7N-0000000D2qj-1uYi
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 22:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=; b=GH2YK1FRoizVotClPD4+zam/ZE
	sM2/id9dIXCCe+fH6YBIli3f/YQfqwUv4bpoYbr8BDnjA/PyFFcuct6ZthCFzXC828OS9Ef7fySWO
	6XoniuRNlrEIizxEoBJidHbQUfv9KWAo2UuVz9WYxbprcYllF/Nab0jDFGI6i2JyugrilnVEDNhuj
	QwmnxIsqq3halL04uglRJw9WGA+lS4JGzzSaWad6ZDDaS09GaYwpT0RNSGcq9OFrtLId9U348rVIz
	BKa38hy25dy6Q8Ec5V4d4f4JpNBpREao+JXWuzmzBUj9SeUStrb6Y7b8NQCPHkMvpaBLIKz/jjmkG
	Mj9Ksapg==;
Received: from mail-lr2-x10.google.com ([2a00:1450:4864:38::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4R7K-00000001lu5-24mG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 22:50:12 +0000
Received: by mail-lr2-x10.google.com with SMTP id 38308e7fff4ca-3a30521edd8so9854671fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788994207; x=1789599007; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=SfdPeNil7X4rthjywbdPIybxKSDJi+1ybKQ5R5yJoABszvFkAq3nfLV3tD90dP1sj4
         KmsnOxE9c0t5L099WxXDfpXGq2TFwiH+c76WKgBPKF10Ug+L8C146ZQ148z3SHvYyIaY
         or6IRY7ZshZyE2VZ7tO3+T/Mk4rD0MdgNzkEMvYZWQin4fFmGrZhxslSREV2WIP7/iHG
         uGlqJXcRLuJWKh15YYZQQVC++MtOj/o2GBw+2jl+YSLFzPL7QOMgGwvKvtRxrq0jG65S
         dW8bPhvP6oBYY6PZ42opPQ+1/71Z2y2LWS2rNKqWNZuNGGfdbOV4EbrFFP/g1tZpRKDs
         9ZzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994207; x=1789599007;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mohJO1C3Ec3h1EifombDVZn/MyOz6OHkpyWV2XyP7xs=;
        b=Rzo0zTUwCU/pZDH4HCfJXjMcnBIvmNIR5L7xReGkai93tHfmSynRa7kfDrSc/3dMbk
         yTAWE1UBNs+lZWtzEuaTM/YCETRRbtsbheLcxoJcg2I6dH/piaqlpUmlkBsBefgCsg6y
         D1dmO7LNwexLhgjIN/9JuX3k8alQ3+nCJQMxo9K7B2uATY+pVsD0zunqPVe5t131v7GY
         EpUP/H8L/y0cJGYReDIfVRfEScHC2fRVljm1MrMZtUzVR2NiGpsS3LXn8qX+L4BpCo+T
         IegEtXvYXCHa0fuXEb/xflV6B01ee2pxPIde6ArZT3EXAx20IsZupMnzGzraKgb36FoG
         t7Dg==
X-Forwarded-Encrypted: i=1; AKwUvByD//pSmL+tejIpcelCbkCs339BTulsOankUjEkn5Cia8WalPsNPWnhvovsxeFV7Br1KmudBBMeovUvdag5UA8n@lists.infradead.org
X-Gm-Message-State: AFuF++nw1t/r6Tepmr3P0f1SmhZSJcPovraNPuYa5xrDBHSr2qcclGEx
	VXikj7Wd5+wz/LgxiK2rbUhknA3CP1tDLjLym8Ul+nANm2gfNILXm2FK
X-Gm-Gg: AYBFou0SZjhhB0AkKFi/kWgs5eDTHiNHmYbGkCq7iWwLCYTTZlrdReYcmUhXQ2/eVOY
	0SriEBByCArHXGNOvN4bRbjqtBfsYy4OWgjIg0QLnz9A+LiWyg2ykOOvX0nHOeZZwe6gpUSd7Sh
	q7IrRDMbJbLabXuQGEebiLCj/tZnpJahoj3obdTWoWc8p6e918sC3IFdDOKI1QsPSWUOnRhMbqO
	IwkQ1HBqLQt52Vv3GCgxhTeOeG203Q8eBe5svTNbQkMvX/Vb6hVtieqCxTfHd1pUzTTUwe7BD51
	kOdplVXW74hYcBhAkOoQqU+HdQinpSTySPdy73MGMoOj+/NHHxKOlivjGX+8xMUNAXb/4vMG77k
	LbV5yBJellFhtD3argyTNvcc/GvN2UCf8qzfYJ8FS2InNdMBNacrTtPVUu5sGusd/0VgRcM9Z+D
	/WJHTxcIDJW/UZwY8n0WDvrBJcMiuANeQWmQC/mtNqqtZSlC5xLU1QvXU/oLXTeKw04FTvu7Xwh
	gW0D6NGtoezVQ==
X-Received: by 2002:a05:6512:6183:b0:5aa:62df:cd0f with SMTP id 2adb3069b0e04-5b89a2eb2a1mr255403e87.2.1788994207240;
        Wed, 09 Sep 2026 15:50:07 -0700 (PDT)
Received: from KAS (94-29-32-34.dynamic.spd-mgts.ru. [94.29.32.34])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b74c409155sm3717504e87.73.2026.09.09.15.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 15:50:05 -0700 (PDT)
From: Andrey Korshunov <razor1702@gmail.com>
To: devnull+hystericaldragons.proton.me@kernel.org
Cc: HystericalDragons@proton.me,
	amadeus@jmu.edu.cn,
	jensenhuang@friendlyarm.com,
	diederik@cknow-tech.com,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] arm64: dts: rockchip: Reset the NanoPi Zero2 PHY from the MDIO bus
Date: Thu, 10 Sep 2026 01:50:02 +0300
Message-ID: <20260909225002.976-1-razor1702@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
In-Reply-To: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
References: <20260909-r28s-upstream-v3-1-ee3e1a34a353@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_235010_724044_1B6D6F6E 
X-CRM114-Status: GOOD (  16.21  )
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

On Wed Sep 9, 2026 at 10:33 PM CST, 安容 via B4 Relay wrote:
> Describe the reset on the MDIO bus instead. __mdiobus_register() asserts
> and releases the bus level reset-gpios before any device on the bus is
> registered, so the PHY responds whatever state the bootloader left it
> in.

Confirmed. And thanks for catching the deprecated properties I had
suggested - I had not read snps,dwmac.yaml, and dt-validate does not warn
on deprecated ones, so none of the checks I ran would have told me either.

I ran it both ways on a NanoPi R28S - same pin, same RTL8211F on mdio1 -
with two images that differ only in those nine lines of device tree. Both
are 6.18.44 with mainline U-Boot 2026.07 (generic-rk3528).

Reset in the PHY node, the way mainline describes it today:

  [    0.217516] mdio_bus stmmac-0: MDIO device at address 1 is missing.
  [   24.566496] rk_gmac-dwmac ffbe0000.ethernet eth0: cannot attach PHY

and the port stays down. Reset on the MDIO bus, as this patch does it:

  [   14.608938] rk_gmac-dwmac ffbe0000.ethernet eth0: PHY [stmmac-0:01] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
  [   17.770103] rk_gmac-dwmac ffbe0000.ethernet eth0: Link is Up - 1Gbps/Full - flow control rx/tx

So U-Boot 2026.07 does leave the pin asserted, the same as the 2025.10 I
first saw this on - the commit message holds for the current release too,
not just the one I happened to report it from.

The one thing I cannot confirm is the board in the subject: this is an
R28S, not a Zero2, which I do not have.

Tested-by: Andrey Korshunov <razor1702@gmail.com>

Andrey

