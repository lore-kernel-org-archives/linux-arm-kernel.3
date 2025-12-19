Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286A6D74960
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4jXO80hFld87+XUBJlo44gpcJSe53DOPS7WnRWkfxns=; b=Fd/GaYVBwdyi3/
	zKlQ81OB7h2kMnidlvL24Bxuh6z85oz4m5t+QDOTjqfyfIHJQjIhdaHtQ4FfK35N8LSfpZADdQLI0
	lDSxv1UYDDjqkQc6PHjV7J1D44OGY/+G9M4d3TkO9O/REfg5Xa0gH0pYUc+GA5z0vPtAXq/Eg4vMU
	309K6Dzn18+dSLzNkZn6RWHXMNkIFP+tk1EDSww3P644eX3XvzGPCkX9W1ubiQJRa0D7aD6XahyL7
	I5sfzU245SeysJhb87zVnQ9KoRC5ob1tfjYIlrEjv6BIPyEg6Dp2p5m2/2cmqEeoLw1Eu4xlA/PVF
	73hLSpGkyb9pcuu10alA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYp-00000009o5F-1Bzv;
	Fri, 19 Dec 2025 08:10:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWVYm-00000009o4g-3pzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 08:10:02 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so1546023b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 00:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766131800; x=1766736600; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4jXO80hFld87+XUBJlo44gpcJSe53DOPS7WnRWkfxns=;
        b=R5ocpxxOtTuLdU9C4q8jfVCr5fKSFku/XUPihZRucRNrgPTanqM/dbALtFQe+wdFpt
         AV4mvmACNPscdn+oVS16FkQsU/cBwhiwmmGnHyJb5gKcFSDG8WnIQBOx7mFzkr5EOlBK
         vXRF2ScnL+/AzwPtTPLeZmBuaeahXeHDRquBBIAwG97n7iTGXRFyUdI5wKr58a/Vw+cn
         JjbsAmhzfIYru3Wiv6i1r2ow+NBQCHZUQWYY9prfk3Qn4496pRNh+YvfeU47iyCa8VkA
         VtJjqp/hBvCoLRI3J8+I5ApoBEjoQLWZiDNez3JGazGZranGFJomUktIBe7duVkkI7uf
         IIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766131800; x=1766736600;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jXO80hFld87+XUBJlo44gpcJSe53DOPS7WnRWkfxns=;
        b=pDvB5qPIuZcM1W0eoPkwrlftus/iiSVjHYNQ5To0Wj933VEA41AeilGKURt8JAgkcK
         r2Qva0GfLvpUMR0XTuDPS8M3KpuhNgU9iun87lXdls4zoF0ZG5qE/AsPhzhwnmfZrcDo
         6jOIh945DF46/gEZlpdo5w0fhhs0zxjRSiEqqfwmCJ4ZpjTNFAeU+fwnV1+vXmUkv4os
         bZ2pEkiqqdw74FQqOQp3ezlD4hVGSWjd/kWS51sETTRc3/wOi+3FmmnjfYyBKT7WXgjg
         9S1Zh9MrfABgCoN12ZNzox0QDdXdJls7BheWn6oHT4pQoTevhxc+Q7iCAvgzTzN9HXXp
         +Mbw==
X-Forwarded-Encrypted: i=1; AJvYcCW1CSPHS7dHMPwVujxMgPOKwHhO/XlZ6CoklGIUWClD+9LRqTSK8NHQs1KuRNmsbJTrY8txkDYT204DSsfsbKG7@lists.infradead.org
X-Gm-Message-State: AOJu0YyuznQ72sou5XMe6TyjrloEtV1XZHPtmteswOoRjrsq0GU8msk6
	O+C65BA0nV8T7LjsIEmgzyU5/yElo5N8gqWspLu7A5OPNDAmsdN+4sV6
X-Gm-Gg: AY/fxX7aqEvr1tLCUpAQmeGhVQK10Aq+3oYGs1QKJLKdoSu+gkk5L+vY03hpIDHUMGw
	ek1t4SWBslL8I+QrX33dfq2VSWPRwmHcWtmx+tkSzi5+jQXWxVRVE/hM+PJ10s5SUaDSrAY8haf
	UJ1BhmxCQp1xxbBf1xIcAuTD6LyY4WIA6mpcVWG3/i4ZM/dJUywN5HI9Sm6s6L+U0oHVad0Ayyp
	SfRePdIns1NtU6gK+FGhoq9rjxe25waqQbSQGE1E9Gf24ua5yAA+zJypU4iMWQxn/pD0KqKjFk0
	iHqoniVcaXEsk+IvyZyMsflu6aiMcRWKpMLOc9l8xllQhbeRGwqQruqcN11A4R0UqqU2NpkVE2/
	AauVvgjlxszvot7MUaXnGBxirvUNBmxrW4NmMM8oIaPizTVt92IVIZdRoGcEBGx6WVMWTTP5bRK
	LdTij75gLo9JR1lAiI2qKFjizcuL9Rd9Z7S/D8tKKxWpkLcoI3JNHMrtDBrltH2i79xzf2F3FRd
	G4jvt29DToIEe8f9mr1aeApMq2oqM2XRhoNbd5PhFI1TVJZ9FOW1p076QEMEFxuBcCnIbbFgd5c
	QpBMWp2SiL8=
X-Google-Smtp-Source: AGHT+IHKFrT2NF1JDxgj+UalkYJY1R30QBAlfTHJOdEXGM/XHA2EahCclVKDTC5GGRc12Vi7ENo8Ww==
X-Received: by 2002:a05:6a00:9089:b0:781:be:277e with SMTP id d2e1a72fcca58-7ff64401115mr2017997b3a.4.1766131799768;
        Fri, 19 Dec 2025 00:09:59 -0800 (PST)
Received: from 2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net (2001-b400-e3ff-afb4-41b8-b31c-89b3-0a14.emome-ip6.hinet.net. [2001:b400:e3ff:afb4:41b8:b31c:89b3:a14])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423d86sm1597274b3a.26.2025.12.19.00.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 00:09:59 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v3 0/5] Revise Meta Yosemite5 devicetree
Date: Fri, 19 Dec 2025 16:09:53 +0800
Message-Id: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFEIRWkC/3WMQQqDMBBFryJZNyWTGq1d9R6liGZGHahaEgkV8
 e6NroRSmM0b/nuL8OSYvLgli3AU2PM4RLicEmG7amhJMkYWWmkDAFc5B1PuQypx8hI0gSLEwmA
 movR21PBnDz6ekTv20+jmvR9g+/5NBZBKNhazOk3jFfm97St+ne3Yiy0V9EHX6kfXUU8xR8oVW
 FPTUV/X9QsxOmB66wAAAA==
X-Change-ID: 20251118-yv5_revise_dts-12e10edd95d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766131796; l=1440;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=YinN3jx5KiGJyRVBis4l4aUW2nlKscAe0FQJeSOKB1c=;
 b=bAtRpZ2ntnmQuZ1a18aigOgyrt/3KLbe32DMiIMFO5CpRAPPBNclbxWrygkj/utJgrSoP9HNx
 NbknPcA8s32DJtdTqKH8OsoPbLmDdR3MNZ67ClWphDFGQU2C+tF8YgH
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_001000_965189_B07F913E 
X-CRM114-Status: UNSURE (   8.27  )
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

Summary:
Revise linux device tree entry related to Meta (Facebook) Yosemite5.

Changes in v3:
- Correct power monitor shunt resistor
- Revert the previous SGPIO P0_I3C_APML_ALERT_L renaming change
- Add new SGPIO line names and rename signal
- Retitle Update sensor configuration for more clarity
- Link to v2: https://lore.kernel.org/r/20251120-yv5_revise_dts-v2-0-4d7de701c5be@gmail.com

Changes in v2:
- Add ipmb node for OCP debug card
- Link to v1: https://lore.kernel.org/r/20251118-yv5_revise_dts-v1-0-fcd6b44b4497@gmail.com

Changes in v1:
- Increase i2c4/i2c12 bus speed to 400 kHz
- Update sensor configuration
- Rename sgpio P0_I3C_APML_ALERT_L

Signed-off-by: Kevin Tung <kevin.tung.openbmc@gmail.com>
---
Kevin Tung (5):
      ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus speed to 400 kHz
      ARM: dts: aspeed: yosemite5: Remove ambiguous power monitor DTS nodes
      ARM: dts: aspeed: yosemite5: Add new SGPIO line names and rename signal
      ARM: dts: aspeed: yosemite5: Add ipmb node for OCP debug card
      ARM: dts: aspeed: yosemite5: Correct power monitor shunt resistor

 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 68 +++++++++++++---------
 1 file changed, 42 insertions(+), 26 deletions(-)
---
base-commit: 111e542d267576de402d0836603e1def2b60316b
change-id: 20251118-yv5_revise_dts-12e10edd95d6

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


