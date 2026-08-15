Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919C9C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 22:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IVlwDg86TsAdjwUtIMmjPl9UXf3/uKtMhMO29Xp8TOw=; b=a4xtWJdmkJqPB3
	k6pXWDqMPJwlh/cW57MbDPRjhSrOtPQiNcDMJYBdZYYs5We24iUNeSf+Tf3Rpjk/STgG8mlqrqPjK
	PG5fIz8v4hH0coT92QCflIskCXf8coKZFyxDlF814YQLmQUTBBiHU0Clz1+5SuuiLnJNk1YBQbxnh
	U4pABkbcyH7D947dIiH5g7b7iJ1BPZlBtZCEfMepDwsI4q9mgqqVdZkDTlRAJ6aAECgpV5toXPLYg
	6tatVHsP/AJS/GIw+6TOPFOpV26BJRZBhSIuR5EoHQfDGaAw8wmsu0wTNDYdjayOKFXJ5jdmsoqv3
	eUiiHZ0jua1iVQvAkpqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMms-00000004F2K-2jzH;
	Sat, 15 Aug 2026 22:23:35 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMmp-00000004F1h-36HL
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 22:23:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-385b78b4f9bso204477a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 15:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786832611; x=1787437411; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IVlwDg86TsAdjwUtIMmjPl9UXf3/uKtMhMO29Xp8TOw=;
        b=g4KJCondnk5dFV6zdsNyCZLJq2EGS8GNfPYv9wMhhWbHNLvDTQuLZBEMcXYbspMXMM
         92olnKJ1/VQDFxxticxIdz/PX+7sxPGYzIGUkWVD/69lyBng+xonjM1/cr7yc+q7qMfq
         wl74XLrNCAVFaizRivNTUDEzjFwDRZU4lDjRhV9ukGRE11oGdtgvONVS6Z+zAHchp+gb
         NUkEC7qr05LND7UiK9tXO6TfyYikn6hmuG1o6j2/v8YaZ7zmwhQ17UeLE/Z0ANnoWW8E
         uCo0IDPu4/zpwx9bKgaIe054pHq9YR//lwJtdkYxcBwKZ7awDc8GEFmaQisZEpHyKYHi
         EQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786832611; x=1787437411;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IVlwDg86TsAdjwUtIMmjPl9UXf3/uKtMhMO29Xp8TOw=;
        b=d0/lHytQ9OK7HVtXNgl0WKRdxGRAqVV8b+lEnQivSxUvcn+uQDnhwFak/lmTXaEOig
         ipt1qGsLTI6FMzPjD345I37GjdeLdaFY1mWTE3CFX4DD/VctLQiMVn+Kr8oIAZuNsia6
         jdb/EBUWzx6vpg63OviDEt90io90l0ywVd62P7MwPB5zAv2jGf3+VzREIFZWTfFMAEDM
         bl9atUsu3ksrKi38f6LH0nSqdAvcYFRlfIreJOFCk03XhTtFLD0V/aH+oWrlmgTIXYaw
         Nw/ye+zA66FKWbZ3RKPf3E0DeV3jye33SjOdiOf1a04TDR/jaiIHIEFZkdSvlNI5Yolg
         vXnw==
X-Forwarded-Encrypted: i=1; AHgh+Rru7ouk5ZJuVLscGPbZXm8Bs2LFu8N2dnEPqykXgGbxHXgbuFUEPH91XbcKTdgs5kbSanUe9hK7uTrX0R/gusY1@lists.infradead.org
X-Gm-Message-State: AOJu0YzWTIWN9Fd6HYgOawDhfcGJmpek4NnwmaxB10UCSPKvyh+5AI/7
	X3WWOPOI15h/iFKg5N/O50Dz6m9PzG6sxOIElHOyFO3rTJ2G0A0OZcFFo1n/yA==
X-Gm-Gg: AR+sD10YYgijnCh2D/0Y9BiQevZUToTsTuxu3NM9eX2zpFnNlRqWGPzwCSLW3PKcFsD
	JD0kD4gowv979Srs4H77lOw6QSSbjnNUyLQknzG67q1c4xVwqgtQ6N5o83w3iWJXCqweeW7uiNm
	yQm8t5sEkdWHqYGRjzhiNZRZO+aw+5ifGbHyCulKm4TQcrdh50cp6ZeloA3UBl00Kk+1y1uf8E8
	hsjRwpOM4wPzpE6PSQ8ZHC4EImGZD6BnBhS1HGCr4C6rMD1Fht4qyzikM9BtaGE+nx4+f+hVKbH
	8IZoOSZLuSdnobVHn/Valf/gXnNZ14m0nNtECzzNtPm8Cu+cDpk8fSfYuI39U3e3waNP8CqVolD
	RIZEiKg6u/+4FGBmG04+CbU/T4OU7HK8RUJv/WrcAzPyawLHGAYpSNZ1PFSqqezFd4xKLElww90
	yHm/xzrw0CK+wzJbE6qqujdClIgJ4uwEEiyq+1NCtKHx2hoJ+XcHLo7nsqQFwv1I/LLUB+oXZJ2
	EgZdSo93n4=
X-Received: by 2002:a17:90b:3b42:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-3933baae9c6mr11425880a91.3.1786832610843;
        Sat, 15 Aug 2026 15:23:30 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm23418743c88.11.2026.08.15.15.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 15:23:30 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v2 0/2] spi: davinci: Convert bindings to DT schema and
 clean up DTS
Date: Sun, 16 Aug 2026 03:53:05 +0530
Message-Id: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMQQqDMBBFryKz7pQYapSueo/iIiYTHaiJJBJaJ
 Hdv6r781fvw3gGJIlOCe3NApMyJg68gLw2YRfuZkG1lkEIqMbQKd0arM3vDmDZGUjeqGyY1Kaj
 SFsnx+ww+x8oLpz3Ez9nP7e/9m8otCtS963rrbCeVfMyr5tfVhBXGUsoXnNKCB6wAAAA=
X-Change-ID: 20260816-ti-davinci-spi-e64e4e48b6b6
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786832597; l=1463;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=4ckBX63+NOyZ/eJp7AxHa2Rxky0Dx8vI80R9iWBVhrk=;
 b=0jZetumw/hBAWJ6bsumj+VSpoyX2QRHHJeO/LyfQh6xvLb0gD5cucwCjfa7mVF0ydPqlGAEzf
 dhZJ/HbLKWnA+YS2AqOiscOOVJ0ZBVr3jvm0tod+sEJfBiyUiIdN4Eo
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_152332_108853_662D9BDA 
X-CRM114-Status: GOOD (  12.21  )
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

This series converts the TI DaVinci/Keystone SPI controller device tree
bindings from the legacy text format to DT schema. 

- Patch 1 renames property ti,davinci-spi-num-cs from keystone-k2l.dtsi,
  as the driver uses the standard num-cs property.
- Patch 2 Converts ti,davinci-spi from text to DT schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v2:

- patch 1: Instead of deleting ti,davinci-spi-num-cs, renamed it to
  num-cs to properly preserve the hardware's intended chip select
  limits 
- patch 2: Removed  maximum: 6 constraint from num-cs.
- patch 2: Add standalone support for ti,dm6441-spi in compatibles.
- Link to v1: https://lore.kernel.org/r/20260816-ti-davinci-spi-v1-0-a7f57dfd5262@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone-k2l: Rename ti,davinci-spi-num-cs to num-cs
      dt-bindings: spi: ti,davinci-spi: convert to DT schema

 .../devicetree/bindings/spi/spi-davinci.txt        | 100 -----------------
 .../bindings/spi/spi-peripheral-props.yaml         |   1 +
 .../spi/ti,davinci-spi-peripheral-props.yaml       |  25 +++++
 .../devicetree/bindings/spi/ti,davinci-spi.yaml    | 118 +++++++++++++++++++++
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |   6 +-
 5 files changed, 147 insertions(+), 103 deletions(-)
---
base-commit: 3eb40771c00a8488fa6ed2cc1fe203477908bf38
change-id: 20260816-ti-davinci-spi-e64e4e48b6b6

Best regards,
-- 
Bhargav


