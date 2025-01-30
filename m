Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6F8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 11:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CuBCputXLU2pypUU/cEHWnT9TxtQ+bGj8yBwSpNY/DY=; b=IML0CM1spKveYuImzLnQ1RcpI9
	tSNz+7rESTlyLgfLpumg9YKrL+k0rdz6FGeDz2QWC0GyWIcDcwG508gHY4hJr9f2apQzGPPa0YnlL
	zZja6I6PSsvi563D8zQULZCXkY1AIcyZlZ8I+NW8EDQpg5txhjiyQX3AvoejI85gBgDCV1NJztIsG
	6hhYMHjLUMcdxWvSsBb8QJo4CbCu0E0Anw2amA1ubq8ZVSlW9fNk+2tcKVdTc5c9fZu/DsyCkotua
	ZuIMaUmLB+wfQGGQYNAp36Q6mBrcY1YjMj/jVS3ovMsk1mLKwhOrIM14GVjpJ2tpG6rkAqO7gvzJy
	+u1K7hWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdT8K-00000008jej-3bRP;
	Thu, 30 Jan 2025 11:54:56 +0000
Received: from mail-wr1-x463.google.com ([2a00:1450:4864:20::463])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdT70-00000008jZc-3Icn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 11:53:36 +0000
Received: by mail-wr1-x463.google.com with SMTP id ffacd0b85a97d-385deda28b3so401013f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 03:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=patrick-wildt-de.20230601.gappssmtp.com; s=20230601; t=1738238012; x=1738842812; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CuBCputXLU2pypUU/cEHWnT9TxtQ+bGj8yBwSpNY/DY=;
        b=qaBsprQB7Tq4w0dSQEU+DLrQfmYT5iUpkXRWm6qmDCB//cANf0svUwJxUPDQGE+ixn
         cOHO7FSKhgIl2fz0SJNw9HdIR6eoCKGUKdxnC/dPLamQjVBsafP0JC+RLaF9/+A+O28Y
         Qy1tMNPYVSzMww+88smZc6bJRGI0QZPA0on1SfebhE+2Po+XXKsyI8URqk8VnLxw0Tyv
         ihIKcdiRui68id5xl+dgZ0lSo0MC06K6e/vcX1tEbo/VypRrrlPTrXJbxCn7wDPWJ75G
         4cy/1ZCiGZ/6LeTUmJhqNv6HMYV8KNw7WvmIIOAllCMNO3zEfiFaHSH68nVZjhSjILJq
         /hFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738238012; x=1738842812;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CuBCputXLU2pypUU/cEHWnT9TxtQ+bGj8yBwSpNY/DY=;
        b=SjRJDVN2tMnNqToehWRxOry8UE+k6OxvA0K55Vb0nNciD0fklaNwiY/UnMrWoUDloY
         ORxoigf6N3NSLhLUi9JQRFQR9eslkKwLeX8/0QKgn8rqm6GJTwF5YI0uQzOK4x94ttdl
         Mg8dgpofpZaszP7w50uQYg0FfwRP8zh96UyLshwCTktXmzUUS1xwBSpwQTfIy86N1lyT
         151NjqJlKzcrmcVwVcVazg4YVDvxr3v8PveRrg4xwbNcvjEYCi83Ywo6ugLZ6VGq5uh8
         KK2LECTekP/AXlbfUHMsrApgnLFRP5irnp6m80GtRl0DkVbChPSSe9JVwQkBc3KA0GOa
         wB4w==
X-Gm-Message-State: AOJu0Yxo7d3IzmwWUJs/RwsWNF7fKxjMwJvghgPEtOFL5oG+o2xltBt6
	Nc3IWXv65WlhFVaBDxjJwGD/1fIoiGzFp6eL2DJageaZtaCX4FzG0qctVUXI8EzKjVzMjA8QS8r
	Nt1Pys9r2Ralolf/3oMUqE/qviXCISVyF
X-Gm-Gg: ASbGnct7ORLDw13CAfQXokROXHK9XohhTIwQ2aWeg6p8nvyr/9RVe1vDTjOYy40ai1p
	8eNxr91RYbq45k60Ne4z8+6W685rvk5r65pdHEVSw4h0EvDZvqkllJkNwYsASgVsGAONoPo4zCK
	ALoDR92f3UEd2ZQdspd5XkJGytkH/AlAsxTlNCR8yv0koMb4zST5n3RmPuJC/EdtzPpapd8wwAp
	BhIZkQ7llG1oL37fhfYduHhTlollUpCTN+8VvbQnoyjmau5Ex4KQmahjNpfzoi7hqjkX3Rd+Yb/
	uhzb8k0LqW+1VMU2fxXwcvTgXMLuFFLq
X-Google-Smtp-Source: AGHT+IH9MZSA5hC3H8pO6YOmlz/fBwHCszfrX4ssHJaZQj2Tf715OBtQ0JS+NzH/6ILqJwBnKjfqVvKQfLQT
X-Received: by 2002:a05:6000:2c8:b0:38a:88f8:aac8 with SMTP id ffacd0b85a97d-38c52096289mr5391502f8f.54.1738238012345;
        Thu, 30 Jan 2025 03:53:32 -0800 (PST)
Received: from windev.fritz.box (pc19f8e2d.dip0.t-ipconnect.de. [193.159.142.45])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-438dcc12df0sm3750845e9.11.2025.01.30.03.53.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 30 Jan 2025 03:53:32 -0800 (PST)
X-Relaying-Domain: blueri.se
Date: Thu, 30 Jan 2025 12:53:29 +0100
From: Patrick Wildt <patrick@blueri.se>
To: linux-rockchip@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/2] dt-bindings: arm: rockchip: Add MNT Reform 2 (RCORE)
Message-ID: <Z5toOecuMiBXM6aF@windev.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_035335_093646_10737543 
X-CRM114-Status: UNSURE (   8.71  )
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

Document board compatible bindings.

Signed-off-by: Patrick Wildt <patrick@blueri.se>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 522a6f0450ea..bc995db8cbfe 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -710,6 +710,11 @@ properties:
           - const: mqmaker,miqi
           - const: rockchip,rk3288
 
+      - description: MNT Reform2 (RCORE)
+        items:
+          - const: mntre,reform2-rcore
+          - const: rockchip,rk3588
+
       - description: Neardi LBA3368
         items:
           - const: neardi,lba3368
-- 
2.48.1


