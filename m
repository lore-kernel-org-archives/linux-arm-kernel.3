Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7FACA9EC7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=; b=OB438o75kk4PWsQNkTXUUbgBaO
	3/sYoPRJW9FOuKAVgaK/Wtix3UxdcyzMQuA9cm/yD42FFkdkImbXmX77T95zW8pMoThgeNucOzfaD
	GTIp+y/WLNNV1Cgm0dD9TbtBhtFxsjTTucmp3CTrfjd2tBsJndfQn134yj6T9SGU9nid/GGzYzfdz
	lHUP0d4Xjcd+IleoeI6z3RPjKVW93owIkrPL2hD6MdnLuxbpn2D/xZKyTFCnDRgSoEBaLHsXM8id2
	R7UAQJG+34MSy0iXzk+vmWB8YyKqH1yJAKVPTaQr34ePHGWTbsfKbRDysK5pZsUQnVYAY5S+W1cR+
	n8N8MRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWhe-0000000846l-2izY;
	Sat, 10 Oct 2026 13:01:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh4-000000083T2-1irh
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 10 Oct 2026 13:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=; b=bYLF4+fcyivg2p4tycD98xd4Oc
	NOuNiHlJBc74GmSgkFGjjbRvoOJ3GKYd4RaMtJU8jLalr0vai0egoMHxCS8dLMjpu2oxVgTu5F/ne
	dCKfPIRfpU1x3epkIBcCQxEgDMSynNVid3Iw1gXtCXpc+vOaQFZXiKTryTyfRq6hyLnpVlxzIdU1G
	f5dQssibkUvtXOhmkZHbd9DDx6mMuEyo2SZn+5roJhWN9ZVO0QwwmJ6O5miP0IkKVEkhmpbwE1c76
	XwAzVA2J8LGMrlvxyJwSFjZ7eAuXPlZ2E0nvBb4SRm++kb8o24QKONnyhDEe8R0KUMJ/44IjMms1W
	N8RahDKg==;
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFWh1-0000000C6qH-2V3O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5683315e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637250; x=1792242050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=qxb8cZjHskdD2jXp07dzG9PHtn2q+ZaN9aFVZBPs/isjxgxFskMaK1rd/optp6yE5J
         7+sbaZUFFDltDVJlO9lp8jIgB8FBVmAWa8WeCmaOJzVJs742QYqP2zBH7ddVe+punwSQ
         DopdBtpdePGFg7tB0iDN6XFXGKwi4BzPzD7dCXtMJWZGYdLzNHq4tzf9Zg35QvJWEVEg
         4txgKu3kEOxSvfzBDXyL5KtfzJS2AzYX5fa2KOiaNeSzjHdqs+bXTHfwJVmeG3sjWHhj
         r7ncuZTqJaYjFf090/5R6rgc8qVWcuneYnTFLcA/g7UmWB2Ui4zivZyinnvuAOG9vgd2
         e6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637250; x=1792242050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEq/NdhFPFpib54e6Uzdby7eDmnQQGSvz7A3iMFwtDU=;
        b=C5YPO7E1oWiAn9GPvPsWKf4ZWNAP5sWvHScUSeQ70InY+1H1fdqn6IUfiGgXRw8Cow
         h8U/JP0a7H8DPQUs7EF0hOGeiopXHraUHWnTWYLWLa6PTJqcZoovigjqjrspiUKyZue2
         V9krWq5FtLOS52ChJnunL5r8SdGD78WRYxA9JAxacmPxXi1S2MuiL3RrWhICXPww1Enp
         Xrd3ahWCsSmgf1V3laSp0HG4YcTTMusFAAokl8ZlDCNEe+6hhAIVJO+S+Nw4G6cli/34
         LqsnidkDMzUhlG456+/R24i3ud5uHzI2HW7h6PH/LiukBNx5cIHp4SaCeV5UVCWyHf2Y
         fkew==
X-Gm-Message-State: AFq9FYIYtsetbo07oMijzzIHgZigt3N+EmPILA+CU8JQ7OWntHC7WLXz
	CDVexwAG5NymZR/8BAoiahtU6ENtLzJs6y6sHzYQvEpSQLd5zDPINAYrL9E9EbLqo7606g==
X-Gm-Gg: AYBFou3E1CIEJZCZJA9nECZjqh+Gbb3OaFrhgSb8AFtehHGjxKRpF0ZoSPXpWHw4IdQ
	Xz4hh3qr1AdLPMRTMYSu9GgJjRV4+PSSBfLtLxSvw3XaZMVJkm9KZaqtiub2PnLcY1lwBPjvv4Y
	GG07h34dsRjF+7qGiVsDFja7SaFfUpo1Fn1tngKJSXUdYYfychfvcnI0AmeFUCRK+vRR2CDGVsb
	ebczvl3JjoiFprFIyKhk5KVXw5yFgkR7A+vCSMG+QH4BBHv09MA/XcXXcUVZhn3ItV+tsHqpaar
	gL8GSmIC1oF0v5Clx3Hnp66B5zmFgGSiJiJG4Y7nkr8XBI/88uqXZ1KhwwOJxAMzaNHn3Ty15aC
	Ml9ypKp5XX4356Bc6DHvU10WLa7IIbSELBlMya1tL9MeiWEYemmrdjSfafjqU0cj/EMRTHBj52k
	LcVgWxFHTEQALTo3SYHixbbizFoAz2DD7WTAdTY76GuHMFZxiPYISBk2Etnq+SG8bz1jitPp3nZ
	S3AwSkPZ/j9LOyU6vQqes3CYUTnCGsIuW8xHTSENn/iFuVMXjDwZBrfl4VCwoJV5h2UjPGE1s6i
	Xc9/rflMyOuxSriHXHPkmC9M5q/bGj1CeoHEmOOOa8J5Pq/UdS5ydSvHhUG0Fw==
X-Received: by 2002:a05:600c:4f46:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a18e4a5355mr108686395e9.10.1791637250411;
        Sat, 10 Oct 2026 06:00:50 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:49 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 22/24] usb: dwc3: generic-plat: Add ZTE ZX279128S
Date: Sat, 10 Oct 2026 14:00:00 +0100
Message-ID: <20261010130024.177503-23-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_140051_785902_31134CE6 
X-CRM114-Status: GOOD (  15.21  )
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

Use the generic DWC3 platform integration to enable clocks and release
resets.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 drivers/usb/dwc3/Kconfig             | 2 +-
 drivers/usb/dwc3/dwc3-generic-plat.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
index 18169727a4..dd0f6d25dd 100644
--- a/drivers/usb/dwc3/Kconfig
+++ b/drivers/usb/dwc3/Kconfig
@@ -207,7 +207,7 @@ config USB_DWC3_GENERIC_PLAT
 	default USB_DWC3
 	help
 	  Support USB3 functionality in simple SoC integrations.
-	  Currently supports SpacemiT DWC USB3. Platforms using
+	  Currently supports SpacemiT and ZTE zx279128s DWC USB3. Platforms using
 	  dwc3-of-simple can easily switch to dwc3-generic by flattening
 	  the dwc3 child node in the device tree.
 	  Say 'Y' or 'M' here if your platform integrates DWC3 in a similar way.
diff --git a/drivers/usb/dwc3/dwc3-generic-plat.c b/drivers/usb/dwc3/dwc3-generic-plat.c
index ca69ac0eb0..aa838cf067 100644
--- a/drivers/usb/dwc3/dwc3-generic-plat.c
+++ b/drivers/usb/dwc3/dwc3-generic-plat.c
@@ -237,6 +237,7 @@ static const struct of_device_id dwc3_generic_of_match[] = {
 	{ .compatible = "fsl,ls1028a-dwc3", &fsl_ls1028_dwc3},
 	{ .compatible = "eswin,eic7700-dwc3", &eic7700_dwc3},
 	{ .compatible = "starfive,jhb100-dwc3", },
+	{ .compatible = "zte,zx279128s-dwc3", },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dwc3_generic_of_match);
-- 
2.55.0


