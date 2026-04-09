Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E54EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 11:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zh5N/EtZAnkI3b3uPP4/1FdnrHwMSkE/EVd51eSrmB0=; b=4Mzeg/MZ47+1BI
	9neTUtQ7uonNjBzM2YF1W4eeHofxmW0sQcR7/qPBxxuKwAZJxmiOK6JTrt4WdZNoQtXMgm/Nk7VG8
	91knilomil8XuQejtdYK2AwA5NZ8q1n4chFsWJvPjdyjZ2u+4RWBXGesTCO046b9vxyePbTAUjlHB
	qn2iPBOmL0ZHqRrVn6VRUUWy9hFj5VGSWQY+4mfslcTJI0INlQYMikHUIKos1XoUm21j5fX4xAGjS
	2Cl6sdg2jb1u46kI0r5YEbVMK+eKnMiHjsCAVc5KxlG+mwWZ7PFsRZ76OxFbVVNVC2i6RyxWp15nm
	qIWZ38O0ahcLWfDbgq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkV-0000000AITL-0Etb;
	Thu, 09 Apr 2026 11:40:39 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAnkS-0000000AISm-3gdz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 11:40:38 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c76864f4e58so291390a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 04:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775734835; x=1776339635; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zh5N/EtZAnkI3b3uPP4/1FdnrHwMSkE/EVd51eSrmB0=;
        b=iNQ/w5SBUcDjEoxhW2pPBk59SVJKH/m7sWXJ2FhYSfVIWbc1fQowKoen9kWHAY1gIp
         naqxXYSruxIheJqOJ41Xs+FKG/adQfECYyw2wEizWH2T+X4XNRYoVb97P66t2LSrc3O8
         8Ea73v4xWBizc4HKUB/gfI40FmUZKeTHxc+YZsmtrDPa0I4tLk3SBZ8DYDA5bZUFauY8
         q8E8++kmUyzc1vGDlSvz7ijEbcQT3eINkRXymgpjZQwuTHVteMRxrzUBXeFuzk3M1BM9
         oA+ejiJDUxEWsPTEIamv09sNZadqCWEIEJ9r5dGnHoLc17LppYOkB53nmvkYbqSJS/k6
         iX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775734835; x=1776339635;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh5N/EtZAnkI3b3uPP4/1FdnrHwMSkE/EVd51eSrmB0=;
        b=EjI9B5VRIR6VHoH2GwhHz5LvE97YLh+ITsR/vOdYSmi60QmAi51bc+bEUQRlcTl29T
         DmPQRyT0ydCq+6BZ/dU0Zs3Pv4r2Npl1B7zwj7u5yLnQ64ajmSybgA3u01ry3oyUz1o8
         vH3L09dF+kUYjnbcC76/vgKOZnWODdN1guD2pITzteatZUaQFchI966lZNXNBIn6ERcz
         DBLcIukb28RixFE2i+pOisoV80Fi/4xJ1kCy6xExmUra312pXRptML5PRKzDmvwc/SU5
         rcmTWXie69YOtrjcQSQETw8Pv2cfMaDRVwmKYiTZmZxjdLZPmzi2/rHxhojdc+zp3Dmp
         7p3w==
X-Forwarded-Encrypted: i=1; AJvYcCVGfbhlyXSNmtT4vMpNd+3fgiXeXf+9eO0YdASVNJnpYRYq6y1uO1kcBXrLiV06v1jjJ2tJO4RDK5YUG9voSvie@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8r4aN0PY0hYUJoNZews9vvG3nWvOdkuqc4dNXzQj26DVBWiDb
	jMSKHZoWcI8NG4ngpGu3ir2wigsoy5e4SNWJWRTBPhuxaQdk6IX2gl9I
X-Gm-Gg: AeBDieu0onB85ZoOGPXxlt5HM4SD/jicUlvQhFJOaWBAGbAZ52XjhSeJ3bgljqQ/bFy
	lGg05Wjn3NrAKgfhigLCWLx+oTxHvEI8qEi/Ds/OQR5u42AbEJuz67ruxIbiAQo3UEXBAqcK1QU
	Vi4lmit0cvOmHoINNDjrFUwNKane//86B7narOlCWE7AwAY8QTrOALhGnenkKJrcREI2k627SO0
	06D3Myy+blIOO7Y40NI1fiVjIr1W+71JT5CI2zHqvT7/6m29X4iDzZHc0prajuaU75xx6vu3oYS
	jHIsZ8IfGGzGh4hjGfEYQrcS6jc5TOzfTuOPhXZNkd+EElFdZySWECU6THgvZPCj8PkFbY+Xyn3
	uNTkduXrGBLsQ2i7UXF53UccsdfzwmAJPQZjpHjWscyqFQ5Sv7k2Hi2S0EJJjBBgdBTjfWKVMHR
	ZANzahWyJzxFsvN5Thr89T8Wu0o9AaGA==
X-Received: by 2002:a05:6a20:5493:b0:398:7b1d:87ce with SMTP id adf61e73a8af0-39f2eff45fbmr25361404637.20.1775734835570;
        Thu, 09 Apr 2026 04:40:35 -0700 (PDT)
Received: from [127.0.1.1] ([218.32.81.133])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76c659a218sm22438545a12.29.2026.04.09.04.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:40:35 -0700 (PDT)
From: Colin Huang <u8813345@gmail.com>
Subject: [PATCH v2 0/3] ARM: dts: aspeed: anacapa: restructure devicetree
 for development-phase
Date: Thu, 09 Apr 2026 19:40:25 +0800
Message-Id: <20260409-anacapa-devlop-phase-devicetree-v2-0-68f328671653@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACmQ12kC/43NTQqDMBCG4atI1k3Jjyh21XsUF9PJqANqQiKhR
 bx7oyfo8vkW37uLRJEpiUe1i0iZE/u1wNwqgROsI0l2xcIo06hatRJWQAggHeXZBxkmSHSCkbZ
 IJGuttLOD1QaVKC8h0sCfq/DqiydOm4/fK5j1uf7/nbVUsmvfXWObFgHtc1yA5zv6RfTHcfwAy
 0ahMM4AAAA=
X-Change-ID: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 colin.huang2@amd.com, Colin Huang <u8813345@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775734833; l=1564;
 i=u8813345@gmail.com; s=20260202; h=from:subject:message-id;
 bh=Pg8rh/1N06LCkEAo+E/4op/VQofrZ3aTQo3V3dPJNZc=;
 b=IhfZ12vZLAF4bC9lCx0x1Ypn7QQfx+MuRC+ef3Vi5brqRtnqHUJXPpV1nC9g/X36yTWADDrqd
 DP1N+M7USURC/AICWLXes8L8FVHTvX4yVtfqSgm9OjpLf8eYCe5aE/L
X-Developer-Key: i=u8813345@gmail.com; a=ed25519;
 pk=Zlg0WqpCw4qbswOqamTBTXIchwR/3SnYZpy7rjaGMdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_044036_972596_BEEAE517 
X-CRM114-Status: UNSURE (   8.25  )
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

This series refactors the Anacapa BMC devicetree layout to better support
development-phase hardware revisions (EVT1/EVT2) while keeping a platform
entrypoint.

Signed-off-by: Colin Huang <u8813345@gmail.com>
---
Changes in v2:
- Fix dtbs_check fail.
  Validated by following command:
    make dt_binding_check DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt1.dtb
    make CHECK_DTBS=y DT_SCHEMA_FILES=arm/aspeed/aspeed.yaml aspeed/aspeed-bmc-facebook-anacapa-evt2.dtb
- Link to v1: https://lore.kernel.org/r/20260407-anacapa-devlop-phase-devicetree-v1-0-97b96367cac3@gmail.com

---
Colin Huang (3):
      dt-bindings: arm: aspeed: add Anacapa EVT1 EVT2 board
      ARM: dts: aspeed: anacapa: add EVT1 devicetree and point wrapper to it
      ARM: dts: aspeed: anacapa: add EVT2 devicetree and update wrapper

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     |    2 +
 .../aspeed/aspeed-bmc-facebook-anacapa-evt1.dts    | 1067 +++++++++++++++++++
 .../aspeed/aspeed-bmc-facebook-anacapa-evt2.dts    | 1123 ++++++++++++++++++++
 .../dts/aspeed/aspeed-bmc-facebook-anacapa.dts     | 1064 +------------------
 4 files changed, 2193 insertions(+), 1063 deletions(-)
---
base-commit: cd44dc5ead3042f2873244b0598e39a16dc7b940
change-id: 20260407-anacapa-devlop-phase-devicetree-4101d3f312c0

Best regards,
-- 
Colin Huang <u8813345@gmail.com>


