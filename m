Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C43ECD5BB4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 02:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rH1cdqbeUyBX+hi3A/hkyAkrMLwhGxYZ5fPk7KzkHV4=; b=SpRK/IVSnyJg4b
	im47xZmyChkZSEdh0+vP5X/IP5lsAU7bkAeMgFnLSWLt/fIBRmEZOJfuRUcXzxhFfZJjcRueHdDrw
	MUPIsLl/r38tNexoj2qb4on6rNuug2HMhOgFohu891ZfUop/t25yOck/5Wxrk2vDD+w74lM55BAH/
	b3uosrIJMuvJZ/AA9k861ujeVRFxDUulHfFy75MI813kdPMlTQ6gomfLfQlwKbO/1Gkk3KfunOSim
	LygznwyJyzCuJOrNeBbaN/n9UcnJW40RYM3Z1N8NzUa5sQ61gmFZIIeRujgj82LSTrmaEqeJkkBbl
	b/SXIOnB1l0flF2k7KDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8R-0000000CXBK-2sSI;
	Sat, 23 May 2026 02:30:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQc8O-0000000CXAk-27dS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 02:30:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36a15ed5119so4166706a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 19:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779503439; x=1780108239; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rH1cdqbeUyBX+hi3A/hkyAkrMLwhGxYZ5fPk7KzkHV4=;
        b=P6d7C+JTyxs5k5ocNoSPbPc6G5Cgx+Uu0LMdT/Bc2q4tRJpjV9F9ePR1/AJ0V1Iadr
         XydFSZbQ3YpER7FmL81WbZ3N0VlsndYk3zCBh8vy2/PxmeCeg7OPOwsuAUnX9qhYG0OX
         wgtq6uWMbijg/UzQmgyvnrJOOo+4KCBpaDjVIiXU/cQQoB/U85JRFvCcwQzk6WIdvSZe
         3kkBxwTm504sAn6hx7CwdgvGfkK7ubWPUGKU37HXiTmX2VwyMWF91eEpisy7r8Kx6YCB
         1cjbOva7qQFgsOKp/aEf+Fhx37XafyrUS2IHQQArE/khIDRDFl76E1RfmxztA+ZscDTE
         SX6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779503439; x=1780108239;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rH1cdqbeUyBX+hi3A/hkyAkrMLwhGxYZ5fPk7KzkHV4=;
        b=EJoM9FARTh4sMUifRKIlCsz/D/2qF0jNQ/qqlF87igX9hcyS5uGJCccatwEutY/Z+1
         6WHc6Rrp4i7fuX55uSeVkXgOdc/zNKZgMaO45l766pYpNWeF6ZP9TA4hVyVLhbeb5n98
         PRQMWQ0WzDP6G8Bp1Sn7zvBRQ8P7SUAGGxRG9+DpJE6MaQ1DBqAJhUQSuP0rt538kWge
         UJM5HxZ3e6GMztxCh/JdBzd1FjsuL5TE9G5lsXJxFmRgaR98Mfo5xdgaDB+2BaZqw5lU
         f8uEoD3GrhhelpKNBd5FhKpwf1nBZAj6omFRSgPB8dqO7IrZvqCBiwcKq611zT23Supb
         cHgg==
X-Forwarded-Encrypted: i=1; AFNElJ8dUjiiR5NVruJ+PXRSdB5PPd4w6I2S+bB0r2Togh1d931XIqGaE9DNgIFJM9p2graariCGXJ8OYgZTvUkqqerm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr6LUDcfSt+YoXTqe0iNW4Byn6Lkbrc4ysM1yc0qe1+689BACM
	Oi9yCvYOJi0kHs1kT3i/cl9p6juJehsN5cpmkhJGmZnPvyk+KrglsVVm
X-Gm-Gg: Acq92OHRTyzBpfHA1Q3j8vbWHtGf8zyUZFknvtsb2M8mV2cpq+yqlgelIdHgjSTw5ie
	8Txx+QZxUYmnURy3OeydpsuRDfhVdWfCmj/NXtJ4llkQkVbbXJqQolZGsR88K9Gd+Q3N6q24VEH
	FQCyXo448QlAMtulBY953Pe/uqj99lAYLcaV8YfGuc7ks/dIojwcptGKAia4tQuvqDcI2RsFKEE
	0/V0rRKktJAradm9eNHFupoLXha96EUE8xyaBVHNXFpyBjkBuJ0zgzBGTGTyENIOOlhIixzgfUh
	MPOiX+PRlu+8jx36ycpL7vNhd08FZuE7HUusj8bZF+L5IOLAM71XpAroX2BVA8mYcl3PEAXQup5
	hdaPKePKwpNWzgmzhpP+WUNKWyFxLcK68z+ZRPCTKIDr0HUhXm5Qhx8kY38/6Ntw964mvR82d94
	mKmiT3JNq8NKBg76/DrsNpBPkChJcJGGTAk29tkDeL2kwX+tFx6q8BQuCbturywmoZ4w==
X-Received: by 2002:a17:90b:3c0d:b0:36a:95c:7603 with SMTP id 98e67ed59e1d1-36a674517bfmr6928855a91.10.1779503439092;
        Fri, 22 May 2026 19:30:39 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a71d944c4sm3010287a91.1.2026.05.22.19.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 19:30:38 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
X-Google-Original-From: Potin Lai <potin.lai@quantatw.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: sanmiguel: Update DTS file
Date: Sat, 23 May 2026 10:28:06 +0800
Message-Id: <20260523-potin-update-sanmiguel-dts-20260522-v1-0-169f5fceb5f9@quantatw.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYQEWoC/z2NQQqDMBAAvyJ7diGu1IpfEQ+pWe1CjSGbSEH8u
 6GHHgeGmROUo7DCUJ0Q+RCV3Rdo6grmt/Uro7jCQIY68yDCsCfxmIOziVGt32TN/EGXFP/O89U
 66g137dJDKYXIi3x/l3G6rhtsXjgddQAAAA==
X-Change-ID: 20260522-potin-update-sanmiguel-dts-20260522-7b3d280e63f8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>, Potin Lai <potin.lai@quantatw.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779503436; l=646;
 i=potin.lai@quantatw.com; s=20260522; h=from:subject:message-id;
 bh=DXGVy7z68ffl9XuZXM958QsYAFSYqNBt3EmenGJ/gA0=;
 b=R+4jpOTTnCHIjRDFt3jsWNz4H5AaeSg3D5NxXi1qN65cyRkf2x83zzgNwaOrj9YaIr+0DG4bb
 77hLMe0bxoeAXbacXRdXx9Um7a7ZwiTemNSr3NR7zLVBPjuPalLHF7v
X-Developer-Key: i=potin.lai@quantatw.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_193040_581839_574B228A 
X-CRM114-Status: UNSURE (   7.51  )
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

Update the SanMiguel DTS configuration to fix incorrect GPIO
linenames and resolve the IOEXP interrupt handling issue.

Signed-off-by: Potin Lai <potin.lai@quantatw.com>
---
Potin Lai (2):
      ARM: dts: aspeed: sanmiguel: Add IOEXP interrupt pin settings
      ARM: dts: aspeed: sanmiguel: Fix the CPU_CHIPTHROT linename

 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
---
base-commit: 6e22b9e818d68d7b8ce6680aede0c80a9355929a
change-id: 20260522-potin-update-sanmiguel-dts-20260522-7b3d280e63f8

Best regards,
--  
Potin Lai <potin.lai@quantatw.com>


