Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C366F9D0F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 19:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=; b=Bxc+O2je31ZI2X
	iWDeZ7/cs0p6Zh3WowuYe+y/FnMKCtqU7PZLnZomZTfT2jy9gFujKJjpn1Rk+4IA2hSXkT4asfCiL
	j7EfpML6gZx65wqRQl5P8JNXF6o/HVC4hCGLKfa/3j4P36N5ViHqK01JArq7JP19ZiDcx3jnDcdky
	oMpPFEfwZOvp5zOmBkKb2bS8X3kHUor/SSuFwNaP+1Jm23cX5OxFAhWcj3l/UteEPjz5y4z4DBLIJ
	h19Prk4yJLw4zIC2BhFhIv2QR2ZWSe6sxui9fZkz0kG83ekXEWh3J3r5jtn0Yt4zjT252BcX3rKmw
	6QPnXu7kIAVIkJGWuhng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpw-00000000A9o-416R;
	Tue, 14 Apr 2026 19:54:16 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCjpt-00000000A8i-2ZLv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 19:54:15 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-43d572f7437so3793185f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776196451; x=1776801251; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=fiiJcCLat1UfVSCmUTnLVYz6vwLiWD2RvnfNN7XzldgNZV8vd7LlATFgHtCgIBgXyf
         zQ2A2df93A5aYDIz/if993cZHUJQIOsAGQeGvLaMHTPwhfuZ3WzxTizohuSO+7S9gWrk
         MtrLxJivIRwVuP21iCxDWcNOmACgPs5XHCU5tv8iKOAnP+VRuKalCsCJn/szxAQ8AZgC
         +85ogrtzf3zjSpGxCxXGoyNPekkhYu1Eao701VxcYYHVIC45K7Q96ovR//22e5VcavRB
         VAeMJovT5H5jIphhtJ1PsFEpqM6TduWBicnCB9mw10FcTkrENhk/v+rDwtnpgond5Mhm
         4+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776196451; x=1776801251;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVJW3ICHXX4TVqiCnHxTqaSjyOw0BNMp+syjTFufF9E=;
        b=e4aMi3ZAYtg10/qFiOk9fo/dGXsMCXJAyTlVDM4kpH0yB5oHLj8hMD25NQZwxPKbgY
         FJtrYI0eCgNjm2HGJKUW/9sWLuLaFvGo6TqMn+G4V6uFk9h6W+2/DYGHcR34yzAP+7z9
         S1YEQoyNQ4hgYGvmVEJhpjt1N9i5hKjcnK54gs0m5bsEQDznI1cbJi5tef9d5N7MK6An
         4MRLUImxCGNtNM2GZ7pQFTIdqbJUJolPzq8UjNiqIAgdeC4cEH0rwsW1+PZAI6l7AAfV
         PeRiLCnM76Cd/BhQH2xfnf0JJ4yBrUy+ddhMtbCIURc3oTZNxyKwypBEvzaTr3FK/sxE
         jtwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9wxx6MBmabmck8fU9lEp41IzVKUzF7+6f943AEspLL9TACzz0NVmhHlS+18nH7YQJiV0lSXIKWWRw9DHcewC78@lists.infradead.org
X-Gm-Message-State: AOJu0YyEjYjp7ffZPWGua6+FJisAEwav+kt6qcfxeg7mCcUQLtEZs+C7
	r1CypI7fUw7UotdXbSAeWkf4oo7LaqHRwCoYOIZVPSLxHiCzYNxIKc3I
X-Gm-Gg: AeBDiesp4IfDZys5NM0n5YI908NC2gKMAyZkDkL41GTnmpYdgL+l1wtP6tuCaFSBfFq
	McTpxA1MTL6xJX/juvLfo1XZov+7dkJforZrSDR1ED4Cmg/aDXK6Ywfnb2IcAv9F3edyuKjChGl
	orgc4loCTvuVYVIyL0oCETL7elrzkFSObObkvET20Z+Lq9tSCD5LSaQR8GQost4wZ7EMHnm7ElX
	dUBnmJyUKQO1MM/GOUjJVpxSo8cHLxH8kVrac9xCG2e/jWX8bP2vBz3cvYAfuBLtM45iberb818
	FG7C+KMrWDMoTz4iRjnW3knSk9VP2EbGbE/cEjUFZq7mGVIQllOT8+MiweLXuXjhj75GjsSc0DL
	wEpDe3Sk4os/waQoGz3OBegcn/1s2Tbpq76AvBqwKuKTrq/MuMuzboBhXPjE6SX9JdNdjf31twn
	9gMZ7TSzZXj8uZvrVOBgz5RI9Qw2rJyzSzMwyCAwi0zA7z4YsZ4tQL0kJAng1EldYJiSRQDNBnX
	qbTjMBWiw02HSEGGANd5H0=
X-Received: by 2002:a05:6000:2013:b0:43d:6fb7:fee2 with SMTP id ffacd0b85a97d-43d6fb80156mr17543282f8f.45.1776196451390;
        Tue, 14 Apr 2026 12:54:11 -0700 (PDT)
Received: from [127.0.1.1] (93-143-58-160.adsl.net.t-com.hr. [93.143.58.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm25595266f8f.25.2026.04.14.12.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 12:54:10 -0700 (PDT)
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <dujemihanovic32@gmail.com>
Subject: [PATCH 0/4] PXA1908 clock controller resets
Date: Tue, 14 Apr 2026 21:51:49 +0200
Message-Id: <20260414-pxa1908-clk-reset-v1-0-94bae5f3a8cf@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5DQBCA4VeROZtkZ20oryI9sEZN2yA7KhLx7
 pYev8P/76AchBWqZIfAq6hMYwSlCfihGV+M0kWDNTY3jhzOW0OleaD/fjCw8oJUlD7rqcstOYj
 dHLiX7X7Wz7/1177ZL9cIjuMEIf1BIXUAAAA=
X-Change-ID: 20260414-pxa1908-clk-reset-179c3f1d6214
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Karel Balej <balejk@matfyz.cz>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=923; i=duje@dujemihanovic.xyz;
 s=20260328; h=from:subject:message-id;
 bh=IgAUVLkWwqGO2mMDNWtelHzJGhNm0ve9N5v+4BIqgVs=;
 b=owGbwMvMwCW2z0j3+uHIyKOMp9WSGDLvzU6UyrT506i1zu0tp6LJzs5Vp3U3qK48HCC4UO3JW
 fmXrmFbOkpZGMS4GGTFFFmYl8pd4ksNn+hQZJsEM4eVCWQIAxenAExkximG/+6O+04/zXz0402V
 Cn9GtUzGi22LHW9fjRNQlphn4PY24SQjw4qWc1VWy2auDbbLdX7Kqs3Dwmr5e73C9QPfdmRmfLk
 rxgMA
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=9BD463017690089DAA8DC266275F544B3B1B4792
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_125413_676944_247ACAD1 
X-CRM114-Status: UNSURE (   6.63  )
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

Hello,

This series adds the resets found on Marvell PXA1908's APBC and APBCP
clock controllers.

Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
Duje Mihanović (4):
      dt-bindings: clock: marvell,pxa1908: Add #reset-cells
      clk: mmp: pxa1908-apbc: Add reset cells
      clk: mmp: pxa1908-apbcp: Add reset cells
      arm64: dts: marvell: mmp: pxa1908: Add reset cells

 .../devicetree/bindings/clock/marvell,pxa1908.yaml | 34 +++++++++----
 arch/arm64/boot/dts/marvell/mmp/pxa1908.dtsi       | 14 ++++++
 drivers/clk/mmp/clk-pxa1908-apbc.c                 | 58 ++++++++++++++++------
 drivers/clk/mmp/clk-pxa1908-apbcp.c                | 31 ++++++++++--
 4 files changed, 110 insertions(+), 27 deletions(-)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260414-pxa1908-clk-reset-179c3f1d6214

Best regards,
--  
Duje Mihanović <duje@dujemihanovic.xyz>


