Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9E3E7DEEE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 15:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TN24W9Be/pGggjAF58I51ue9vTrGNZtAUpOZWnn4qXs=; b=19CJ9DQTGpEUZT+B0ZFCAeugV9
	95F394MrBdHrC2DzW+UdwY1lq1shTpFUl9W8BFZQe2h3sKsvTAIk5MgWYK/n1RM1i9rk87lZMKRs4
	J5CJ5zjZDCrEZ0BfHzja9gt37WArtoD6dp5tLQWyOXXrTtr9in3z7Djx3JOoXQtCRN68NPKaCjnSl
	ZQJAZC3H1jROusK8N5MSaC+so9LSB2567CEU/fj+cauLELWADYxa2BOORHbZJC9cGUBYTxI5SlTJp
	zoAcAHC0NGNoUGJRQ+ugQ36e1rhxtPphzeIHWDvyeMWT/rV40LLiknDnZIrOouKGVoQSk9rY6z5Ut
	ARGJ8wpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvTs-000000059YD-42tZ;
	Mon, 02 Feb 2026 15:04:49 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmvTq-000000059XG-3e6p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 15:04:48 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-81f5381d168so4572800b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770044686; x=1770649486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN24W9Be/pGggjAF58I51ue9vTrGNZtAUpOZWnn4qXs=;
        b=R2Ha8V+UElrUW5xa41xOceYl2W2l1gA7ccM+sqPApx33j/wpivrXRkj4pWXbTzFUMm
         55kDlyG2LkgJXXx0iV4ZmxNlSv1GgmwJ3i+pUgdNgbRVhstf3PG1NmOCAu4QkmaMeAw2
         /It6LG02cwdySTQzT++o4sdPUkiJx1xS6egjIejbfcV0zV65h6wKd0aidwCe21YV7Djv
         Sdm1QdSTUdmUOedvGMeboZ30kVJKmGEXUn8Jk1yWQ8HaenJ5JoqaZuZpNZJ44Th2VK6J
         nnICpRpNwpeQQf+Lz/yK4qpfDSMQliRIDdjdVLaI4ElvBg6d5as5SExebtzcZ2rwillJ
         eT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770044686; x=1770649486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN24W9Be/pGggjAF58I51ue9vTrGNZtAUpOZWnn4qXs=;
        b=PTjwcdDQEK10Fv2QZcXnMdDPeVfr+5mH/muCGB7T7ged4xQfM/PYEQ41vuZlLZ56OU
         Ii0ahxul0BgZ5eqlEwuAdQei3QYZTemzjXoFYYQaVhFjbR/jwrJhgfCA9lq0q9xnlG/8
         5guekcPrSLEJHklYTaBx2A53PPLIaQfmXO0wJp+8v12jOVvB3PyEZnZ01QyS48nmkhjd
         jxZ7njRqrWeTr2USDr3ClrupGLT67aXx6NL+CnNg6ITrJ1tgzpUCQXeUc4Vup6xrdz2A
         OQ7ceCxce65QZsp8vpvVjVybGmuP5cX7fDBWaeS7TrCm4g+kEIZtAVYPtZK8vuM2R+v+
         hOJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXu0N5lrl4MrYoD16w/U4liwkaUtw6K1O4ofWVH7NNCL8R0e/fU+Ws394MGc+yq2lYF9j0i317PkQdjdy/60aC@lists.infradead.org
X-Gm-Message-State: AOJu0YxsBgFSn5wGt3jKea42xW+b8VZ3SHysI+Pjyof0t5iO9FIgrbj7
	4HF/nodkO99ey5JD0Wpl5z/dTAV8Jho7kZEnMMUXldiuQJzMnBR9f9Li
X-Gm-Gg: AZuq6aLgs+djL2gH/B4FnX8A+5ZxMiRey41wv1coKbk39H3AxBEBlKoyipESX5LmmDj
	P4fvyVfOptP7ViLW8M7oGHlg70echMSW7f+cHKeBb/lhPJ27DMbAZPLvlMatNzIPtTJMVzQ6dRG
	WasaUM10Uv2B19hF05RKuzW+GPO7Jjxu0NYgB3Tp8Tc9JlxI5IEiMGeodVC78Im77geMnJc3o7I
	Qvs3i0U95+dRDtXO5oYXAnyKQoj8qx7xr1AfuLomUy8BSwmNe+XlZEn0lJzGQ2ELNLdZ8uudT7Y
	dk+qoC5QcWZVAhmBQWpxRwPrw+vkLP+Jh/NJwIqlLdceoigb2YQPxMYUmElotDyZk5fdl7cP7Wt
	pTVIU5yxm9AbJ5IXvup1WfLNlcq1w4GL47XIbl8vdj5BQ1/2SQhyumx5K7+F5IOkB/YYwzh5vmD
	uikK2/gYlP
X-Received: by 2002:a05:6a20:3d0a:b0:38e:95fb:3cc with SMTP id adf61e73a8af0-392e014e095mr10527227637.56.1770044685577;
        Mon, 02 Feb 2026 07:04:45 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c21112sm15948480b3a.54.2026.02.02.07.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 07:04:45 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	dsimic@manjaro.org,
	andyshrk@163.com,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH v3 0/3] board: rockchip: add OneThing Edge Cube series
Date: Mon,  2 Feb 2026 23:04:00 +0800
Message-ID: <20260202150437.270567-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_070446_910271_06CBA94C 
X-CRM114-Status: GOOD (  14.39  )
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

This series adds support for the OneThing Edge Cube series, Rockchip 
RK3566-based PCDN (P2P Content Delivery Network) devices originally 
marketed by OneThing Tech.

The V3 patch merges the separate dts files for OEC and OEC-turbo,
following Dragan Simic's suggestion.

The V2 patch adds a new device, the OneThing OEC. Together with the 
V1 patch OneThing OEC-turbo, these two devices share identical hardware 
specifications except for the RAM capacity, enabling convenient support
implementation.

The V1 patch was submitted quite some time ago and is now in an archived
state[1]. it has not been processed due to scheduling conflicts –
apologies for this.

Changes in v3:
- Use a single device tree for both OEC and OEC-turbo.
- Align the compatible strings in dt-bindings and device tree.
- Link to v2: https://lore.kernel.org/all/20260131153106.31723-1-jerrysteve1101@gmail.com/

Changes in v2:
- Fix typo in vendor-prefixes.
- Simplify company and device names.
- Add the new device OEC as part of the OneThing Edge Cube series for support.
- Set display-subsystem node to "disabled" instead of using "delete-node".
- Using generic node names for leds.
- Follow DTS codeing style in vcc5v0_usb_host_en pinctrl node.
- Modify the phy_mode of GMAC from rgmii to rgmii-id.
- Adjust device tree node ordering to follow code style.
- Link to v1: https://lore.kernel.org/all/20250713163255.163669-1-jerrysteve1101@gmail.com/

[1] https://patchwork.kernel.org/project/linux-rockchip/cover/20250713163255.163669-1-jerrysteve1101@gmail.com/

Jun Yan (3):
  dt-bindings: vendor-prefixes: Add Shenzhen OneThing Technologies Co.,
    Ltd.
  dt-bindings: arm: rockchip: Add OneThing Edge Cube series
  arm64: dts: rockchip: Add OneThing Edge Cube series

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3566-onething-oec-series.dts   | 312 ++++++++++++++++++
 4 files changed, 321 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-series.dts

-- 
2.52.0


