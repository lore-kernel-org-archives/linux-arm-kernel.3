Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7ACF483E7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WarRcioHs25DGPZf7FPz++9Cb0BrMHjT45zAE3ZKzws=; b=SRRLN/cj+dBWNlMs5ZxMFDe9zz
	HMLJN3qEXVrNR6YtXak0GqSSzIaXG6j2fRAeAu8+hpJMORo41fi7TsqhSfFGwdKKcEOWvzvRUcgxi
	pFJysVNkaPvyt+zKMiEg0kk7sYcCVTfYKkfmDBm5HNg5iwPukh8zSyzZDHT1ATOKGYjj0Uk72vYFY
	zPr+6TG0hXtDs2bWHv50C/KcPuHeu8BERw5j6QHieI0+d9UDeFIQiISec0PrhZphIMl6YPa4PiJUo
	VRaYeIzQlYJtAENBPqtwvORggtSmMwBlGhl2ERmJwyr8JQXbgIaWEUtAgT1QiA8qYPEYTvtnA48ln
	boXjOH0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCQ-0000000HUTi-0V6Q;
	Mon, 23 Mar 2026 19:44:30 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4lCO-0000000HUSs-0Cj8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 19:44:29 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c741db5d610so1308315a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 12:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295067; x=1774899867; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WarRcioHs25DGPZf7FPz++9Cb0BrMHjT45zAE3ZKzws=;
        b=Xg33Xx50CKPueZafJp1wwwcPqQ0fsnWBUu40ExIjrntL9ZU7t0/IbGCMTfjC2V7/FK
         3wIlUMQDb17dhvI3OfxxjemoOtn1HBepklxVQZ35SVN5DSUbJQ7gllALwZdrWojMkdrt
         Bv+EZm31f1nDNBmS7gm8mTxuOxwL6bqt/pRJl7G7M3l3sNUdNfCNGNHDS2byolV6/9Uk
         S9uEiFjaIAISB8hemhY1aN5b6mRfJy/wwIg+mlcTYvlHAEyS63vDBf2sJasSbrXAvAsm
         DzPPZdUVCz6/mmgzahG6f65qqEJhjvV0seDG6JN4q9EgGRBVb/a7iSJsLN04ulns6BTC
         0g2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295067; x=1774899867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WarRcioHs25DGPZf7FPz++9Cb0BrMHjT45zAE3ZKzws=;
        b=pC4e1xty2a7mWxfbJiOlY49yYvIRQd4rZcHYpH6k78z2HOvXTzIcv8lYbVVLe4CCG9
         Nqp6Z47PCyz6kM0AyNvnll1BgUbRRw6/cKPGORpNXKyV3ESIou5c4Jcs7j8qt2oQaTIx
         84u6JAhpFpXAq5LaD8rR3XZT53i/oFvVVCbN+cred/xXBo5KvwpNScr0WVXvE07SSKGn
         94NAneoXX6gOd5VET3qWldv+SF60bJ/FTFxHgGH+eg2kYyKN96yqh5E0F1KqgDy89K+O
         cnaJqXJu9JyiuyM5siGynKYZfyfBomwgWAqJrYRXr3VeB8+Cxd4M8nAI5RZ5lwyAfSsI
         AeRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZpqOhb9OW5qoSyal4NZ8cU9lVXAl3pxAjcdLhb3TS9kI9wOctvluX5XM5YoqrzfDYa3f2FF7FaeW73gWDeb8d@lists.infradead.org
X-Gm-Message-State: AOJu0Yywghw5ylWtqA7+EB+r1B2uAguPZ8H4Bazq1aSJMcW06kPzN1fU
	/DJXpDOPmxiqGC+QpK+AClj3E6I2Apxz1OWcz0B7wlxVA6rRT8dHmAeb
X-Gm-Gg: ATEYQzwQFdFMTlbbDcJvZwiNpiF+IhDUGGvX7JOvkzZf/n1IHVTLToX1ByDjZd/VVre
	VoRf71YbieZH9KtWzuZjkEV3+u//+Iy+0pRa/WTOduRLErPG/IzhKcv6W0xzTsqiBZtiWXGfp23
	Dz8kCRvVUi+XtImdBzGYWmketDBGFW4wfprBA1qu/RiYMP9WxTK1wCcutaUKtNDGa+Mr0Spqbs1
	TVS0fZOQfsbQwmwBi15jY1QqfUGyW1ulvc2wTcB6XKiPhoswuJrj5/d+2oPhjUj/tjuAuICQAX7
	xLq/xoP+33Ru9rZ7NLYUlczok/7F1urXw6SjUTysiK1CVL2I3P7YReK5mXhyhbiEdAMqZjYSuqU
	6StV4+XoZKGIQsj4Vj11Bl+vgURBLsah4eB8OOYMjxZT8/6DXr9DhSimu+nLlWAKWyPbA0Okb1J
	Q9owm3XMNVZrfb+UGsNEydSDQ=
X-Received: by 2002:a17:903:191:b0:2b0:5520:f497 with SMTP id d9443c01a7336-2b0826ffc53mr120406955ad.9.1774295066862;
        Mon, 23 Mar 2026 12:44:26 -0700 (PDT)
Received: from arch ([2409:40c2:5005:bea7:1ec:aaa7:ee5b:2371])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm152080805ad.60.2026.03.23.12.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:44:26 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com
Subject: [PATCH 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
Date: Tue, 24 Mar 2026 01:13:58 +0530
Message-ID: <20260323194400.22886-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_124428_086711_4765B723 
X-CRM114-Status: GOOD (  11.45  )
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

This series converts the Hisilicon dw-mshc text bindings to DT schema
format and cleans up legacy node names in Hisilicon board files.

While testing the new YAML schema, dtbs_check flagged the hi3660, 
hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node 
name prefix. resulting in warnings.

Patch 1 Convert to DT schema
Patch 2 updates the Hisilicon dtsi files to use standard 'mmc' 
node name.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
Note: this patch is part of the process for applying to GSoC device
tree bindings conversion project #
https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

- The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
- It is used in following
    /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
    /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts

Bhargav Joshi (2):
  dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
  arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 111 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 ------------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
 5 files changed, 118 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

-- 
2.53.0


