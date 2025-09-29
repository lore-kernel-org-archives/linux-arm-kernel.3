Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6AE0CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=; b=cGan8fqf4lc64CHSJ6idMbH1D5
	nywA8QA7Db5TGEE0CedwSA//wTYghf++ixarF/VKNve/etShhFxqGvcR2n6h8dwyGLbespYJNTval
	zG5y58KAnA2jdXoYmT+FRMtZoT8TX50/6DNaohsoc9AGaIuh5Sa+wgQb5f0P2FtCzcBCrAvip9BvK
	y26985POrsuRpwKvD7EOPPF38+PLcO6QlEkIelXwN+fBW2/2e3VAVL7vzHXHp0P/GsQJCFxWLTKkV
	deXbyjbdsZEb+8qugutLlGvV3sgLPLmImkSdyYbRFT2q8moB8XuIfA1F/BZ1cuUoEBMcOF0nzCJ2w
	BybbIk+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9W-00000003Q2n-1dg7;
	Mon, 29 Sep 2025 20:07:18 +0000
Received: from mail-il1-x161.google.com ([2607:f8b0:4864:20::161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3K9T-00000003Q0G-1BnP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 20:07:16 +0000
Received: by mail-il1-x161.google.com with SMTP id e9e14a558f8ab-4242bb22132so49991765ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759176434; x=1759781234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=xD8Thu3SszKnoUj0lKvMit/5snM+/SuJ/Sllqzu/ThLAuEXLYhYwJEgFLVV6uuW8Gw
         rKCrRx/kZTacHid0l3XNvh7cM7ZqtgH9CGEWtmcEmkXDhCJB1PE8h6JCk8IuwAtVz/0i
         AGhs0iLGf4BGcP5ecwjXgm5EEZHZO5fF+US46qysq2+YYtevae1fKpZghOgIgJLqFnUF
         hN4Sv/urIxWBbJJMPej1VAFwPkLwfyYelMeSR+m6WDQjlu6k4ZHzeKSkz9pXFBhlOROp
         BswDv9MIPd7svlj314cityLT7kvWufCmggjSHffAlZ4kLp4DdhtPhakKCsEicAkAspIu
         jdpg==
X-Forwarded-Encrypted: i=1; AJvYcCVgpfQZypjcPH2ZxK3ajrbMFHBtRZ2CUtCOSVPFpJKlhkSTAHtfFI3xoFoqERzVmXAJ4QUc+SEcALnNm5BnkGYT@lists.infradead.org
X-Gm-Message-State: AOJu0YzNJtEHBe3eH1ZUVDR45iA9H3/0bBStIlxIJT0lzboIWWF4/AWl
	3rGAqzmL+gZVYLdWk3BZH2GCx5h0icA4w+frJbVC8ffAxZb3NhYR1i3Y+v2xIYxUkKvidEibrDN
	tIiTEOkaJ2d8J7OD+kdK/jWcxcRgUUHoAUccH1BTYEByQoEElUtuDnwdS0FKnUsKoTcKf43x6Ko
	Ah+xbtw839MtCL/S65P6Mc++m91Amw49VxSgBgKRlwtgwZM7UqRfB17XSEfOTyTFjehAo/d5nJb
	r7h5pUvy/RiVKwPeYXAbrDB73M=
X-Gm-Gg: ASbGncvbjgw+JEqtzSpk6dhE900+YfFGtrCJcHOqwD2Jyj/+4AglREFHm8HF4DSKqfe
	mgXnboR3eg+1kzlBKTrlwGuMtNlkakXdR20IBgyKJ0icOdOY7Wvf762+SoVLqggqakuqEvU8wBq
	GySlecfVTrOZ0fZ95je6jbPrZFMHuzaLnKUqriCxxbNZs0ebTtvymVLWVsdi2K3ZyMG6TkgYDuH
	GSmKZWvXaOysPClzsuWiAf4dlPlsINICzcG8qPDugBWyxFmzjQtuY/jf26KLDiK50fvmaIVxFMh
	4Y9MRVRiaK/bhx7e0ZiafUtpRZZ5epdeQKBMJzo+AIsii9/YsPYUdcypeCH+ndI57MJ1+mgSbBE
	bZnbPkNSqTWmGmBKCA47C+oSUxF0f6usjaAvx2NhPQcG6ckN6Ozi5CFHW3xKwZqUSIISYDVoa8P
	I=
X-Google-Smtp-Source: AGHT+IFm6FuJXj53sRdOq4usQbWzFqy79UaFSKeVWgZZ/iAlb9b/PzxyAMj5Z2+GcJuvwwMyvOIGnZwrmqPK
X-Received: by 2002:a05:6e02:481b:b0:423:fcd6:5488 with SMTP id e9e14a558f8ab-425955cba09mr64426205ab.12.1759176434299;
        Mon, 29 Sep 2025 13:07:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-425c02654efsm8907495ab.39.2025.09.29.13.07.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Sep 2025 13:07:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33428befbbaso6097566a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759176433; x=1759781233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKcTz2+WfcXi6NCeJhs4Aeeo3+yILKRVizIKcyvohdY=;
        b=Au6YIY0mLsw+iIxQIrZb5n4tc7WInFxs1BzNuFvB+mgM3+wRFdfhcqEsm9TxPvPPEw
         mXPcNU/6I2Ktg4pQyFMWFvZ64udISo1DW54raJYmAKtd0hPda3SUQrMlXZ8Df8HI0Ybd
         ALWTiYFXyRcNSxYCKbfrr77MM3ubyzhx9ccsE=
X-Forwarded-Encrypted: i=1; AJvYcCV5s4ePQ8i4GGJaQuaqkKcQGvV2los5O1RKnMbm+Z3kI/bPzBRvS/otdKMZDxLVlbnDK6/q3jCL3R28N0PdVQW4@lists.infradead.org
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-3342a2c9fdemr19234045a91.24.1759176432845;
        Mon, 29 Sep 2025 13:07:12 -0700 (PDT)
X-Received: by 2002:a17:90b:4b84:b0:32e:528c:60ee with SMTP id 98e67ed59e1d1-3342a2c9fdemr19234028a91.24.1759176432436;
        Mon, 29 Sep 2025 13:07:12 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33838735194sm2121479a91.22.2025.09.29.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 13:07:11 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	andersson@kernel.org,
	baolin.wang@linux.alibaba.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH 3/3] MAINTAINERS: adding entry for BRCMSTB HWSPINLOCK driver
Date: Mon, 29 Sep 2025 16:06:27 -0400
Message-Id: <20250929200628.3699525-5-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
References: <20250929200628.3699525-1-kamal.dasu@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_130715_323275_6A35F380 
X-CRM114-Status: GOOD (  10.63  )
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

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 97d958c945e4..21b78f468169 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4972,6 +4972,14 @@ S:	Supported
 F:	Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml
 F:	drivers/gpio/gpio-brcmstb.c
 
+BROADCOM BRCMSTB HWSPINLOCK DRIVER
+M:	Kamal Dasu <kamal.dasu@broadcom.com>
+R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/hwlock/brcm,brcmstb-hwspinlock.yaml
+F:	drivers/hwspinlock/brcmstb_hwspinlock.c
+
 BROADCOM BRCMSTB I2C DRIVER
 M:	Kamal Dasu <kamal.dasu@broadcom.com>
 R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
-- 
2.34.1


