Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E273DE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zEVZrcp6sH8kKT4/yJXuIbm9BkC4O+Tbaah14OHvXYw=; b=krpVcTbJ1aTd9P
	xetss2Blq1Veik6/qbZXi+0hUKkzpMeOyTTxkaOiRYJmbQ408RI/M4G67IQsZeJ6jaWFi0ewpnab9
	UEgDYp3Gm/OXzcntNoMngCrWtUpFHiS/7sfjjYc2NvkCktDSqpV0czZVHNoBRx2N7gJUofA+jV+d4
	T5Pcfjt569Lor9HGhPZcfiYmUE9ZWxVEiIASDWHxTCFzPJ8F5w5M48JZvFvVl+zxwX7RMQLPGV04y
	IJgE3xLofsOkPTYHWySp2iUtrGZCq1iE/iFMMv3h1n+xvGGqwsjx5NDl/0v+x9TkJS4xJmeW+RkyU
	6TjMkWl9cJpznCD8K6lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5y5-000000048ab-3sXA;
	Tue, 07 Jan 2025 09:33:45 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV5w8-0000000489s-20CD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 09:31:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aae81f4fdc4so2598971466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 01:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736242302; x=1736847102; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zEVZrcp6sH8kKT4/yJXuIbm9BkC4O+Tbaah14OHvXYw=;
        b=dir61FBx5RGXAAnisqpsF6MUm+yoApC+rWP4bTqeNibXZpbCwVHPfl6fIfHx7HAfWL
         9g0bimRihvDqTkd3/Ov/gNtujmVr9Gp/EOnIieBks/V1Q3uvTF9Id+lKET2fnWVFQ2RF
         cxkr4+UjXYcQTKhWj0SFVo/LfUaAvpCer4FQWhcRqRNrBhPjX4sgym4UnGGszO2b29jX
         BMKPIWoJJxmx9776ocGbaoUiOdf4IPFABvlPu/ulhxkPgcUzur+wHtrLDtxVIsRwDD9e
         +KOfxHi5xRFPytyiILpedevNGn7b2Xc0BLLfnd/QP5dsfWRzh4i87p0meNxZ8yD7ddkT
         2QOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736242302; x=1736847102;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEVZrcp6sH8kKT4/yJXuIbm9BkC4O+Tbaah14OHvXYw=;
        b=E4dnUfrT+pOHbXkKmfJQWz3NMzyvpKJF+ailhO1q5gSwlwgyIDgHr2o7OPrkZfFFZz
         0XlxQAMDBbIJmnVFuKCA3C+hFdgivJdm+5KYiqLZyl+EXzSDdusLTQfIrnwcUhZK88CQ
         EuIuigu8qynmtuOXLh//4joIrl3Uy3A1BTDLfito7rPkPUUedSoOQYO/wBM0+h3SRctE
         CMAdA3uzfgHuz+U+NGcUO+saenPutWOtUufeDDkZUhBvow3cOzWxk7Hi78RBitkR+i9h
         yFLIXqQMj8ymmEA3LJMAGiSY+1kan5+UrLieDaQmTCK/KSgzDcOQ/9ZCn+NcsFzqL9qi
         XLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/ezIc3I/EhSfEH0fnQ4+h8ZcnP9nF9nUu1sJdoVVjSSOl/g5CGVAe3bn1BxQBoipFMuyJzg1UfgT4NB841eVS@lists.infradead.org
X-Gm-Message-State: AOJu0YwVN/EhUm/j+Kn1SbwvTuo45CG8gzjKlDESdwxV9GNehr52y5Jc
	sKTViSFZK0AuP6hA9O28SdTHx3oIMIIKUCLqXnoTs/v1Dp6R9RRbbPvOzw==
X-Gm-Gg: ASbGnctoZ0QBkOPTe+ydC/tJd9jjzv6svpQI1kNp3xAGGhrYivtB+bKcELnvNFbJIsj
	eDl1iVrJY3uLOoTH8EeBqdAE8RTj8tBjfjX/va+qJ2ijTKZ8kdrzfYVQx6n9Xb0AtwqpFyJYg+8
	pi2P+xdbiU18+aIEKeLS62UJr/TMA4ts4cDDMsMs8lYPqeWe/haUjmCeLI+Ma/odbvKDApGDOzF
	h9FWiGcjC0ZAMpyGF5cttjKnUtSQT/yopijA9VCdFtfu2IYh/YP41UzhxymAyBnlUykeqjE/5A5
	sj9SoU0R20GXMEjn1f45sZdc+Q==
X-Google-Smtp-Source: AGHT+IEVG3G336WmBhvtPtrjSoYbrfPG9f0yBDcuNNv8Va58Y4lKbJL/RINEhKFkS8DMU1all+HtKA==
X-Received: by 2002:a17:907:7f0b:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-aac2b0a56b6mr5288197066b.17.1736242301740;
        Tue, 07 Jan 2025 01:31:41 -0800 (PST)
Received: from [127.0.1.1] (nat6-minsk-pool-46-53-210-232.telecom.by. [46.53.210.232])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d806feddfasm24976300a12.58.2025.01.07.01.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 01:31:40 -0800 (PST)
From: Dzmitry Sankouski <dsankouski@gmail.com>
Subject: [PATCH v6 0/2] power: supply: max17042: cleanup and more features
Date: Tue, 07 Jan 2025 12:31:29 +0300
Message-Id: <20250107-b4-max17042-v6-0-3d0104ad5bc7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHH0fGcC/33OTWrDMBAF4KsErasijf6srnqPksVIGiWCOg52E
 QnBd68cKLVd6PINfO/Ng000FprY2+HBRqplKsOlBftyYPGMlxPxklpmIEBLKToeNO/xJp3QwL0
 SNkdnMCOxJq4j5XJ7tn0cWz6X6WsY78/yKpfrT4/f9FTJBfcEQTgympx9P/VYPl/j0LOlp8Lab
 n+o0GwWpssOpQ0Y9latrNxZteyGiJRQA4o/u/qfXd1s56JN3geVVNpb82sB1NaaZkmTFt6BCpH
 Wdp7nb8tDV4yWAQAA
To: Hans de Goede <hdegoede@redhat.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, 
 Purism Kernel Team <kernel@puri.sm>, Sebastian Reichel <sre@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, Dzmitry Sankouski <dsankouski@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736242298; l=2494;
 i=dsankouski@gmail.com; s=20240619; h=from:subject:message-id;
 bh=wNxScV3swdqLS2kSQnTrWGwVBmGv+k7mN3nS5bD4pig=;
 b=1JtrugEyOnG9rTV9ipPmn7Dqi8oclWFU4f35ch2Nd9PNVtszt3ORa39p1Fv75jGVZL6bvFqTI
 CLw2ZitS2mYCt3iVQgrh6G9xfg2If1x/LAD7//OYAlHcpoBi2E9VM/P
X-Developer-Key: i=dsankouski@gmail.com; a=ed25519;
 pk=YJcXFcN1EWrzBYuiE2yi5Mn6WLn6L1H71J+f7X8fMag=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_013144_521338_B61D3190 
X-CRM114-Status: GOOD (  11.17  )
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

Fuelgauge blocks often are incorporated in bigger chip,
which may use only 1 line for interrupts. Shared-irq
handles that case by requesting irq as shared.

Maxim PMICs may include fuel gauge with additional features, which is
out of single Linux power supply driver scope.

For example, in max77705 PMIC fuelgauge has additional registers,
like IIN_REG, VSYS_REG, ISYS_REG. Those needed to measure PMIC input
current, system voltage and current respectively. Those measurements
cannot be bound to any of fuelgauge properties.

The solution here add and option to use max17042 driver as a MFD
sub device, thus allowing any additional functionality be implemented as
another sub device. This will help to reduce code duplication in MFD
fuel gauge drivers.

Make max17042 interrupt shared, and add platform driver
version.

Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
---
Changes in v6:
- reformat commit messages
- add trailers
- Link to v5: https://lore.kernel.org/r/20241223-b4-max17042-v5-0-e4e409723bce@gmail.com

Changes in v5:
- platform version: use parent device of_node as current device.
  This is because mfd driver matches fuel gauge node, and max17042
  platform variant is intended to match a mfd subdevice.
- fix platform version issues.
- Link to v4: https://lore.kernel.org/r/20241108-b4-max17042-v4-0-87c6d99b3d3d@gmail.com

Changes in v4:
- review fixes.
- Link to v3: https://lore.kernel.org/r/20241118-b4-max17042-v3-0-9bcaeda42a06@gmail.com

Changes in v3:
- pass dev pointer to probe
- Link to v2: https://lore.kernel.org/r/20241108-b4-max17042-v2-0-f058f7a16bab@gmail.com

Changes in v2:
- drop NACKed commits
- make shared interrupts unconditionally
- rework descriptions
- add platform driver version
- Link to v1: https://lore.kernel.org/r/20241109-b4-max17042-v1-0-9e2b07e54e76@gmail.com

---
Dzmitry Sankouski (2):
      power: supply: max17042: make interrupt shared
      power: supply: max17042: add platform driver variant

 drivers/power/supply/max17042_battery.c | 200 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------
 1 file changed, 142 insertions(+), 58 deletions(-)
---
base-commit: 7b4b9bf203da94fbeac75ed3116c84aa03e74578
change-id: 20241108-b4-max17042-9306fc75afae

Best regards,
-- 
Dzmitry Sankouski <dsankouski@gmail.com>


