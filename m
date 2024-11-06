Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE9D36129
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 02:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yprsd14/UhfMe85vqYoBkjNPR9l/bSjJtwuT1KvvKb4=; b=P/3mzt6fOT8DMiiwn6SuupfrjG
	QaCT/la1tUqqX4g4YKBsMmorO6mIIgiDCKVKId1EgQayp4+aspkxUiNpWjeMojLL8GhAFRY7KFrI2
	PkRwTz1Cci93V2L2EA5ocVINSpXqcu7CMZUMakr8kXgnlEAtPYLCcbTd2JP3y8mBqafQa80tHB/Xf
	EPoGnfuUF2fbcnuH7gONoCB4TbB/XUWAXXX3S7fBIFN9al2PMPbRL0HmAJP5lsHVTPkDnkM+feFZA
	kr7/a7IeJcTPc7NZX8/cq/yIsNinN8JOJMbQ+8+cPjdz2QB3naQbM5lwqhCcE0+g5uwvFrBrYKq+p
	ngE4ab8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VcE-00000001RH3-1np9;
	Wed, 06 Nov 2024 02:17:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VYz-00000001QPv-39iZ;
	Wed, 06 Nov 2024 02:14:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=yprsd14/UhfMe85vqYoBkjNPR9l/bSjJtwuT1KvvKb4=; b=DCiOEKpi9jyV1Z4gg+TM77cHHZ
	s4zidTwv55uqYfSjh1a49aOmQA6li0ZuNBl09eGkEy2uG6IaZliT4WcSsOlYEZ/OPcAQD+u47CtAr
	8EPwsbOVYa8RlRvmGbq1gdYXxUfCdEylkng0ziP0DutWIv+AdvWzP6iy1Ko59y4JrcYjB78+Ggg2Z
	2PsPHdVChHmLrbLTeZGR7y3ZwXQ9/j+ag5YvrotiubY273DThlX2pzL/FGkVYQcRawzmClvHtSVj4
	F44J7xeLG+Au28w8HQZI59XZvV82t0IPNyBrcTGqyFzeu3u1xYqBptePAW8PpxA0zTxyaq2eJwQnB
	PO7AbmGQ==;
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VYk-0000000BrPM-2sJk;
	Wed, 06 Nov 2024 02:14:22 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-7eb068dbf51so849701a12.0;
        Tue, 05 Nov 2024 18:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730859246; x=1731464046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yprsd14/UhfMe85vqYoBkjNPR9l/bSjJtwuT1KvvKb4=;
        b=myyVS65V3ftxB7QJj+fMnbqQrvQo0d1EQHQiDHpAkS5F2di0/HlX/fkq2wnthz49Q8
         7QoNQR/s7Ujoufg4Z+8wxOY9hv0pd+1bguHcHiIMlArxNbPArnpqfkih9xwkWRI/Q7H2
         20vw/uQ8QdlE+2RVILqha2skTQeJyJ4NWNMk3iOtzIgEh9SKQXQk9pCSQV3DbpRRKzMK
         fuPkyITk4FJUaGgHMDXo31owqQEK4L9rYpg+IYZCvqJtsWLQamYhg5B++IPEe8Gh265T
         RJqSB+AN9DxyFgaV9CSnsZU5FuyOns/z9N5UCr+oVYReiuEpOwGA7X3M3/VszJ1PDBPt
         OlIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730859246; x=1731464046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yprsd14/UhfMe85vqYoBkjNPR9l/bSjJtwuT1KvvKb4=;
        b=a+Jy66RghzG2ITbWEvHS+GAGt9J7r32reJLHiJAR2fAAIzx4YdDnkZlMRMXu9qOQU/
         eLTMEdH0rgCENDqGfAPaNy/ZhhCeLNo8xbK27/4W7qzN5Zw/wjbzlu62C+f1pLcmpQiK
         1BZrsNagvglgMjh2/jdmFk0DrkLFeURn4E6Vdhz6Iofc2+DtDxwNHMCq9hJa1nFNoLoz
         kSK5QRY0bYqkLD067EPaB6f/BrLriEC3IttgdgSNldQH4NlgAE7/42jR1YMIafR8eTk8
         kXpksNmgKU/UUOHNMBCrGoN3a7zRjMYqx+acRAikN3sylvI69SI+8HE5tCvVmBuiuij4
         BAkA==
X-Forwarded-Encrypted: i=1; AJvYcCUgWX2XBFWfWO8YCriDehLedKi3qCuPZg205wf082ix+gf5LnrRDWGTni4FI6oD5/+BPfD0fRObKCza2Na/CqE+@lists.infradead.org, AJvYcCWqxjNE4bJMot4Y4oRMSe106fVaUOnl/lNqP21Qbvww6ToM/hWalcMLPNOKtY2AQWY3ckvVBftQB58wROJqVBQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeUenC1mWFLhKtJGwQyTe4bXIENOOhAA06ex5XKRjLuPw7Ui9F
	AbbqSytT0oQuXGC1JVlBAU9WrEHMci2q4aN83hwiubEpDNLd7NS+P0KWiw==
X-Google-Smtp-Source: AGHT+IHoaG7ZRFOmR44C1y2gQzLow7Iwn0nvTGv7MxEG4/TXzxonUkdNRkqGUmhu6MFQ24xwtpa/NQ==
X-Received: by 2002:a17:902:d50c:b0:20c:5da8:47b8 with SMTP id d9443c01a7336-210c689759amr232758795ad.5.1730859245632;
        Tue, 05 Nov 2024 18:14:05 -0800 (PST)
Received: from localhost.localdomain ([103.29.142.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee452a8b3fsm10021131a12.28.2024.11.05.18.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 18:14:05 -0800 (PST)
From: Frank Wang <frawang.cn@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	william.wu@rock-chips.com,
	tim.chen@rock-chips.com,
	Frank Wang <frank.wang@rock-chips.com>
Subject: [RESEND PATCH v3 1/2] dt-bindings: phy: rockchip: add rk3576 compatible
Date: Wed,  6 Nov 2024 10:13:56 +0800
Message-Id: <20241106021357.19782-1-frawang.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_021417_972990_00A8D114 
X-CRM114-Status: UNSURE (   8.60  )
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

From: Frank Wang <frank.wang@rock-chips.com>

Adds the compatible line to support RK3576 SoC.

Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Changelog:
v3:
 - no changes.

v2:
 - add Reviewed and Acked tag.

v1:
 - https://patchwork.kernel.org/project/linux-phy/patch/20241015013351.4884-1-frawang.cn@gmail.com/

 .../devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
index d3cd7997879f7..1b3de6678c087 100644
--- a/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
+++ b/Documentation/devicetree/bindings/phy/phy-rockchip-naneng-combphy.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     enum:
       - rockchip,rk3568-naneng-combphy
+      - rockchip,rk3576-naneng-combphy
       - rockchip,rk3588-naneng-combphy
 
   reg:
-- 
2.25.1


