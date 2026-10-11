Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CACCA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 12:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=; b=wEg8aT6/RqD9ELelksGcXAzWur
	nFoHSNbqG5mW3sx50AUcGMw38eaQdWX6KZYbGW7Lc1meu0ByQcrNtcfRczvNbrvoSVLYFqNPmJ0Gg
	HWAgNWwW/9Q3OgasESDJQVY5sVvRGDsHoibzAcQaqTKZkRDb/S7rJMjo6qTH6lCxrIvRKVDOPVb1i
	S/BY+AKhmONyLvPLEN1XRo8Yr1WEvulS7yauoDa9ggpTGurmXfyfym+JkFqCJ92lOeDxCmp1haXPD
	pPxQFY6zxkBkZGQEPr3OrF8QHZltE/JCZngPncDQC5bzj8iOmX5D9+9LrWWIZ1P8FL0qwP2tw5PTZ
	cvb3WB2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsyB-0000000917p-0Hqn;
	Sun, 11 Oct 2026 12:48:03 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFsy6-0000000915L-3w9H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 12:48:00 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3ab066bef7dso450847a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 05:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791722878; x=1792327678; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=qLyZSNL2gN8xbMQHwQkmauStnh8g8WvbmWiNsZCnlFRpbcRCJBtsobjxJxMjh3AGJC
         sJRBy5Xm6Sp0YYzARQ9rZcEMLzeNi2c7i8Mk/F6Md4B1nfgNoUwVX7rJ2RtlvFRN5tC3
         Ete1+brSlEqjORcxcc8ZvZKelyz8yO62A2coNhJl3KP4yd+2x4Jorzv+nhEtNBECgmMX
         N3bhr+RNxd0qasc7KVSx/m3ofi+7g3o8TeVby5hNkk11JFLWNcKhUBzGXem81IvtFt/o
         3myKztGkpwFC8GN0neozMa2EpPabqKq65rAMOC/tT/MYRm0GI3rEKWiMWF0G3XU9xO9S
         pkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791722878; x=1792327678;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cI52cNV0SAj9KYZseqFKYYVaewclBL5lcykfpxtwH0s=;
        b=h0XSPN3+Msb5oCEkgXQRpjKp691gZWkcLiUZom/j3kHAQqkSSmxW6JyHfUx97BVx7E
         vhipJJ6FD5XIXc8wwJ9wQoxYTRJ+d/2DvzMNTp91JNCfNCFBWsMw+f/0BZwG3XAwtrQe
         Y36tH0zvi3AP/3BG/iPcp4OwxLWrTpYzuDmxVCUXxCNHHCv7HLSVErIIbZvbJoXcr+3x
         g4jNlBy4HTA/EZxKaCh/YC+23OhI8HnuKJyLT9anfjY1LxUK3f0v0/F7DFsD69iK6MPg
         xWGtNWRX0GYVnU6PamvKXJ+luzYcywdgOKZCY0mGqr2y2aQi2MRbnI8Z2nz9yxQZ8pUa
         kmnQ==
X-Forwarded-Encrypted: i=1; AKwUvByYnHqd0+lbuYrHt5vlG55o3X8YSvpxBiKXFvyfEXSEmxX8OTowSdqNhkATpQ7paSYGif8TRibt7rObO8ZHTT9q@lists.infradead.org
X-Gm-Message-State: AFq9FYLaFMh4MKydtV42P54r4SJD6Sh7yLv7XBBidIwkEJdnWSSBQRuq
	DOEv6+sADacSX27Fx7RwmX0uS7ATEjMMZrRjSDpQOZy3sHO+xshy9aAA
X-Gm-Gg: AYBFou2vhqtub2reJjJ4VQhGjAXy092KCv5QpQDV/vGpuhOSjGqZ6wLd01XjDnY0S1R
	RV8xiIL+egTxdelsyH9YEeDZnhVprjcftBgwSkKToCU0hUD5yZ8kwLaYjDraXuvSpLHqlqrKbEw
	H20LjgVQGacGEzvJEPX2lQ3zpjczx9nBdWxPFOTtSUEJ00zpTVokQHUocLbfb3CVBUJZVWYfUGd
	wlgvMqCoPv0dTvVTa4i8khvDFJNVBGElxZb+9Cfp5sY+ch6/LMFsydxhE5H4qXUD5pKyXGojxuM
	bQ+GCEtQ3q4SIygH8gmQP47kbd0mnzzz2SS+ubJE0cTEodi6IdpFmQcq07R6lD9w/knUs7W2GzN
	kBvrY9key8imBpyipq1VCYtjquMq1iwH+dLL8rOh/Jh/cGwwJvZAk9cQ+Q7oHasxbg1DCeIlSvs
	K/eVCT/yd53tLSMQSi/GBAKKpmJYVqattlcFowFcQgTpSM5/YfBHY5PUGmo3eOUqSfEI8QytpSS
	wCV+VrOw9c3wPd5oPq4vwZg4CWkn4YHa1lxQb/k0ZtyaCa7qQMJflbw4EJx2saCIIBCSVrNgQ==
X-Received: by 2002:a17:90a:51a7:b0:3ab:4262:1a3a with SMTP id 98e67ed59e1d1-3ab42621c33mr3830705a91.61.1791722877717;
        Sun, 11 Oct 2026 05:47:57 -0700 (PDT)
Received: from [127.0.1.1] ([121.165.170.166])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9639bsm11623603a91.4.2026.10.11.05.47.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 05:47:56 -0700 (PDT)
From: khaliforce <kforce@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: dts: allwinner: Keep MQ Pro Wi-Fi powered during suspend
Date: Sun, 11 Oct 2026 21:47:02 +0900
Message-ID: <179172282222.4040500.483739720170904755.mq-pro-sdio-suspend@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_054758_989763_D2FF3AA9 
X-CRM114-Status: UNSURE (   8.31  )
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

The RTL8723DS driver requests MMC_PM_KEEP_POWER during suspend.
The MQ Pro SDIO host lacks this capability.
The request returns -EINVAL and aborts suspend.

Add keep-power-in-suspend to the board's SDIO controller.

Tested on MangoPi MQ Pro.
RTC-triggered s2idle wake and Wi-Fi reconnection pass.

Signed-off-by: khaliforce <kforce@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
index e2bb6bc16c13..b2c65560d6a8 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dts
@@ -87,6 +87,7 @@ &mmc0 {
 
 &mmc1 {
 	bus-width = <4>;
+	keep-power-in-suspend;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	non-removable;
 	vmmc-supply = <&reg_vcc_3v3>;
-- 
2.53.0


