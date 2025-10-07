Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD41CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Oct 2025 14:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G+9d1ZWb5LY8JAy2gqqVDPFgFUs9C7bdvcAG7+1eQP4=; b=2WQX8PrydoSJb+AEx1w+CQe6Ur
	8P1a60e0utA7SsGuxhUD6CcFy2T/NyDEQIDwVhHZFcQYi0tk4u3Rv7MMmHi3H7vU9mZ9o0uX6flvG
	VmWmHgUuA4jGS+hXZLKZWShA4utW8c7mbVnoGOb+Pkj6j6kR0knMAIPZkxCd16bW1i8wcnm0Bzkcy
	pdylBjulVXkDkFWEEowxk8lgHBD4GCqMLrfpPMLt3w01D8Q2RO4lN4lfEg+ybmCJR2nS2FhzcGVLQ
	+96eIQZ0YNWZpeZF5N1J25UxlE6bkmWtZmJmplzXTWw4hvnK96/UUmuQDLb1U+KvHfLlxxJWU3f6R
	bTvwymow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68KL-000000028bC-2ToD;
	Tue, 07 Oct 2025 14:06:05 +0000
Received: from mail-io1-xd62.google.com ([2607:f8b0:4864:20::d62])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v68KI-000000028ZD-22xp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Oct 2025 14:06:03 +0000
Received: by mail-io1-xd62.google.com with SMTP id ca18e2360f4ac-90926724bceso532412739f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845961; x=1760450761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+9d1ZWb5LY8JAy2gqqVDPFgFUs9C7bdvcAG7+1eQP4=;
        b=hbBzdFuiASBHt5ub1QgQ/3whrZsOGwAQOe219d4DEXfJKvB5GVNKNdCdxdhej991hx
         fe47RKz9f51MPcc0Lm15hWgm92xuqVEl0sfslK8wJp5R9upDFO1u4h7Z0bqZzxF7nsl+
         fFPEVLOeTHTddz+e6pGraoJfTthvfKEJqvYREVaCqEcgvKXY5uDNhRW0Fs8/QKvL4PuZ
         nwq7ojFDa/uFVdNltooLaKENY5IJlMmGGzTclapUm2NKpr7lw6FS/NAX4XzH/d4Bcjfx
         lRAyZFBKuOkBIlRTyWHTWQCizeF/bIHfeU229GDPFUpc6Gt0WP/PEQgnSsUnS3EZNVIP
         jFJw==
X-Forwarded-Encrypted: i=1; AJvYcCVdU4AxwyiVi2/G0YRUGr8S/U8ISXG0sYAtt7zggwC1W3dkskgkuUbaC/NPqAPNjl7+mDQk1EtDtK1m5DgUGnWD@lists.infradead.org
X-Gm-Message-State: AOJu0YwtT0qaRd2iYsJjuwQ5d4eSJi9K/V7gKOCr0+3/v0OTgRNpRDZY
	Z0DA3II7M59J1KsUuSwQWXKKvhGB74L9WS+PNEicUkhEEOEykTANgVlrBHbXUEA4pNyoZM5h3iS
	LHOWcrMwNBr0uRLh3mYqn2NXkST+51k/j8EZEslD9D1YaN8ov8boiRyK1Ia7Fqdcruf/dqKHlOn
	ph87yEfy3SMefhlnevmkC8eAfnpYDdtMWZtNzSMnHYVphOSHMF8Aq1eGsj46pIai9LmV4gx7GEp
	4Fna3LgAxgkUAwl3uPP+f/KQTk=
X-Gm-Gg: ASbGncst+DzXG57EccYBuGq1BeecilsyLY5X57GTn1IwRbhYyln/VAbf8aFruk3dp4/
	vxhYAJKkmrCTsnq8LYgs9STCybKLSPOabY4KfcxOxVcOgkWRqi8lKtkNJjamUFT0py5q7510G0h
	4hXFCcAYjbQRM2gG4iKR/MSao9en8KWVfpvalA67XTVL+RIRNLiYoDh9b8E7O0GC924xTLxeKyo
	F0DgQXaLUoHzcHUpu8X6yTZ1rfAIypBIdsxg4hnoFtyzEHlhQYvEVldGNGV6Avqke1lsye1Ime6
	WkItRZqq7PlVxpscr1p2NwI0lR4FVo7Pv8v1o/K7MsxUU2AU0jhf5b4BnBr9o+ZtQF0fQzGaaHu
	KWqud6d19NrW5CYdJr6KRufGXHlMwaIiI6mUdsAQSDW/RibOPZ1st2QAEv01xgHYrmiqacq/eJ1
	YzTbnA
X-Google-Smtp-Source: AGHT+IFfQRGrJ9YhbfsE9Ucy55cd7EagZkOb/NESc2cvR0RRRlpwHbyQT9jxZUOezZYrIO3GQ3EqntF/4UPK
X-Received: by 2002:a05:6e02:3c82:b0:42d:8132:c739 with SMTP id e9e14a558f8ab-42e7ad05a71mr212828285ab.2.1759845885057;
        Tue, 07 Oct 2025 07:04:45 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-126.dlp.protect.broadcom.com. [144.49.247.126])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-42d8b279832sm11559905ab.21.2025.10.07.07.04.44
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 Oct 2025 07:04:45 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-43fbf814e38so4247369b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Oct 2025 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1759845884; x=1760450684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G+9d1ZWb5LY8JAy2gqqVDPFgFUs9C7bdvcAG7+1eQP4=;
        b=A2QhGCrlQ57qBgx0CVzQJWUvSgVoJFmrFki5GH1kJeaLNLETkTSSR57ek3MkKXA9UL
         CW/JaBP0f/DwLd+xlb/VxKYtdgo7VOHSzdR/h1+RVdt396hPbvgFLFAvBNK5SyehgWFY
         IzdHRIxMWWi/HkN0+DpwihccGxQeQvkeNIGuI=
X-Forwarded-Encrypted: i=1; AJvYcCVZjYL4mlgS13DaD2cixskjEx/C3Aj1PdC0JVzIbyCdPrD99UA2oSJIR6F7uEgGZktKIs50irmne5zxrFJZQtDJ@lists.infradead.org
X-Received: by 2002:a05:6808:150f:b0:43d:365f:be86 with SMTP id 5614622812f47-43fc1848847mr8223456b6e.33.1759845883193;
        Tue, 07 Oct 2025 07:04:43 -0700 (PDT)
X-Received: by 2002:a05:6808:150f:b0:43d:365f:be86 with SMTP id 5614622812f47-43fc1848847mr8223351b6e.33.1759845882241;
        Tue, 07 Oct 2025 07:04:42 -0700 (PDT)
Received: from mail.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bae60b67sm142718956d6.9.2025.10.07.07.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 07:04:41 -0700 (PDT)
From: Kamal Dasu <kamal.dasu@broadcom.com>
To: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	florian.fainelli@broadcom.com,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Kamal Dasu <kamal.dasu@broadcom.com>
Subject: [PATCH v2 0/5] sdhci-brcmstb SD host controller SoC specific enhancements 
Date: Tue,  7 Oct 2025 10:04:28 -0400
Message-Id: <20251007140434.606051-1-kamal.dasu@broadcom.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_070602_524736_B61E8D17 
X-CRM114-Status: UNSURE (   9.14  )
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

sdhci-brcmstb HS200 configuration for BCM72116 and PM register save restore
changes applicable to various SoCs. 

v2 changes:
 - Separate commit for SDIO_CFG register defines that moved
 - Implemented cosmetic changes proposed for initial change for :
     "mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200"
 - Moved BCM74371 support in a separate commit    
 - Implemented review comments and reorganized code for :
     "mmc: sdhci-brcmstb: save and restore registers during PM"
 - Added Reviewed-by and Acked-by tags wherever applicable 

Kamal Dasu (5):
  dt-bindings: mmc: Add support for BCM72116 and BCM74371 SD host
    controller
  mmc: sdhci-brcmstb: move SDIO_CFG_CQ_CAPABILITY define
  mmc: sdhci-brcmstb: clear CFG_OP_DLY when using HS200
  mmc: sdhci-brcmstb: Add BCM74371 support
  mmc: sdhci-brcmstb: save and restore registers during PM

 .../bindings/mmc/brcm,sdhci-brcmstb.yaml      |   2 +
 drivers/mmc/host/sdhci-brcmstb.c              | 154 +++++++++++++++++-
 2 files changed, 147 insertions(+), 9 deletions(-)

-- 
2.34.1


