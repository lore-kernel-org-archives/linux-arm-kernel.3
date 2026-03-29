Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6291BF3D5ED
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 06:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=; b=S4stKC+dlPx2Bwamibni/YvrxY
	CExS0dVDUNXGm1890Bisj0CQgbm85sioPOY+SdfHlAQtcDOR5jzMMktOnfcYUY/8sQ48pEolUxeOu
	8jg8WJMUE13PK+xmzUDJmfPtPgRi8RQw1bYeBeXcRnbL6AQpPEEfc8Q8CbKpKKv4Q+AlmYusUrhqD
	WF+Ps9j2NqjQ1gqONe9SfMZlRb1H/tiVb4oD30LK840uuUzmDtw61RHdFWB7bK9YnDmnkvZuCKrys
	eIRkBLP+rs6YqIGikHr3p0YY8AXqmrPEj77303bhcoEFDCua3zH9992VNqkCwEHiLis2R5IYtPoiE
	6KY82Pyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jQz-00000009cOL-3uU6;
	Sun, 29 Mar 2026 06:15:41 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6jQw-00000009cNY-3S8P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 06:15:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-82a73593410so1338052b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Mar 2026 23:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774764937; x=1775369737; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=IVoYmU9yhcpw/l8zXen/AuXrDUZOOzXDiMWsTrcSL1lzKvOP6eTlXYKS0nrj8P7wUd
         /eQPAH4LUB/noJ3TWyT5cLQoNH5P3xYakB5ZxXaticeiftS2MQ8zt7prY0Sbwnecex+T
         LyQ6n2rvJ1a7hFgfgorKX88XGgmjKou0dBFK2vCnGagfNFn89Mwd41VEDbkwHj6addVx
         eg08b0FQ1GBzSL0MYbK1aFj+isJpU/jNwlw237J8GtfFEWviHra56cs9H7UsV2GClSIO
         ZP9ZCBNpljUVWfBKQAi9Xjs5x0Qq4n0vn43N9RUoaSdNy8tcyPkwAFYJL2y/u2zXu2se
         598w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774764937; x=1775369737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpxvjrCfKfWKOT/ha83hU/ESLCv8PWJ47jL6ccG2o9A=;
        b=BskjLmeftiCgEoC939+ctq0gtg67y2as3pN+12BH63bctUBisnXTzWtmxY4pCK+P5z
         vrfQ+Ntwkhj3Nnyu9YQXL6n7y1yARxTdESK82z3kvP9l1iqtb78VaTjGpOpd2B9QJ+fS
         yb+M9TeUnVUw0F2SipKct58nH65fTo61McCDfzocVXuxuhMrdQlXrhdfnKniernMvcqF
         L5FdsVVpc/ZZqbLqjGe6qjr/ngcjU7myQbIgJd9mliuLORWc0EDnx3GytSNCiLUER7FI
         GwMSUtBX5lXK5/nrGN/KYzth+cq7NWmR+R1FH82XtvLYlLpUXy0RY0o2amWv1eBrRxmg
         Rpzg==
X-Forwarded-Encrypted: i=1; AJvYcCUG/orRxxUINN+7zkZ/zCfDznTcH/MOrH+SIEXKndWFrezwa7xBYyj0yflTytGWSCBgr4/NFGghsqZdKb6Ge4O8@lists.infradead.org
X-Gm-Message-State: AOJu0YwWNlBUTYmiodJTgWXtl4q94WUoUfHbazAitbYCFeFGFtWtPHPs
	pLRrE34acybZUCo/oi6rsQ4H8usTdTNGlGeixVQeWlv6mKJoTbG49eRg
X-Gm-Gg: ATEYQzzJFuj4bjPkd0iF47SCCSbSXRLCTa69CkRsvS6ZITI4375aoQ6U25yezhhQXBx
	74a9E3ycuwvAaNoGSvOnjuj3exf7zsbWMVHJiJyUBEpjvhWsQcf6HvHXJVKy4hhsoebgECRBxIQ
	UzXU6yMeiz0gA56K98i43gZ3PcD9kN9zaMwgLbihiAq8Nv+10DkPSrsIARSdEb027d+HXidiwzM
	37s5dp/5za9iS3w2foUdYooJgVeQlOWTdjSgJJuCeyafc/eLgmoPN06hqUEYgqiBTujyAJhJrPa
	cOz/FgFQKPw6pLGzMYmw1jVi/T3R1fvcBda8p+DZZUe6kblbeAk0G2Nu072D/7fYzGu6taMj5xs
	jQ1fqedt9zKK8aq5hl7M32OBCB35UMR0+3kFfLiGKRBxDgHLSMqbHM1KD2gwfxvbIlXDuI+yaGJ
	igRmIEI9JW9d0odM1ObnJD8z5KXpxYeRa2FtJk57cqNFObVi6sqjCIHFSDamQ4FedKLuNXQ1HEw
	o1IbzLegu629w==
X-Received: by 2002:a05:6a00:3e16:b0:823:b1f:892e with SMTP id d2e1a72fcca58-82c9607f5b1mr7817427b3a.43.1774764937194;
        Sat, 28 Mar 2026 23:15:37 -0700 (PDT)
Received: from toolbx.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca8436f19sm3709731b3a.9.2026.03.28.23.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:15:36 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	vireshk@kernel.org,
	conor+dt@kernel.org
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 0/2] dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
Date: Sun, 29 Mar 2026 11:45:18 +0530
Message-ID: <20260329061523.98346-1-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_231538_864975_8B07C50A 
X-CRM114-Status: GOOD (  10.43  )
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

This patch series converts SPEAr Thermal Sensor bindings to DT schema
and corrects the thermal_flags property in spear13xx.dtsi to
st,thermal-flags.

Changes since v1:
- Changed unevaluatedProperties to additionalProperties in the binding
- Reword the commit message and subject in the second patch

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


Gopi Krishna Menon (2):
  dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
  ARM: dts: st: spear: rename thermal_flags to st,thermal-flags

 .../bindings/thermal/spear-thermal.txt        | 14 --------
 .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
 arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
 3 files changed, 37 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
 create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

-- 
2.52.0


