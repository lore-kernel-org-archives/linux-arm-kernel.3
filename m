Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4A2D49C71
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hnUz4THRm4aVeJWQLZHQhQHquSXvl8jN1UCodfFTOc4=; b=zFm6ajJJIhBKAZ
	eOPug739Kew+16P923G5zYUeAEyz44L7u6/CZVrpmwfXV06KcljCzI+1UO7dS65gaANf8Mex4iSIc
	jdYflR7bKCIm93+gb/vZxp+c6hJqEz0tUhN4Qp2RwijQAezVtyVm2v+IG7lPTsJGG5S+u0u3aapu8
	7em07TzkzlomOa4m52HLVB5ZvGeqyfjGf4Sg/m/g4ZquSPJesDXItSalUfca58jExXkLU1l1cwZdL
	sEiAQsedld/U7GBAnrAfX8BB1n/PNaLuo30Zh3VAu+oc4vu+ZCgBhpjAC31qOFwAJAMH+zTs9eHaK
	m9BF5d6U1LUJQue8jksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjm-00000001CMl-39ej;
	Fri, 30 Jan 2026 08:20:18 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljjk-00000001CMF-0WmH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:20:17 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-81dbc0a99d2so940754b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769761215; x=1770366015; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hnUz4THRm4aVeJWQLZHQhQHquSXvl8jN1UCodfFTOc4=;
        b=j0VIi4BmwQFARcpQznDkvGEO2ZmazX17s/fu+Js/HLTXCH+RwwGk5FgI9uBd3F997U
         cFn1o5Hq/39P+hcg80pVOtgAEl7YBSPpZST5AEZwxKuKS9G//fwI+lJ1iOuXAu1bowmr
         BI9UxLjoRxXCHinWEO1LLDXFul6hGRlsPaOkuH/HoT0XrLBFJKRayF3Z8cxG8/bTnSEQ
         c0g3irKKd8YPHnNbuPhYrqTfzE5OKXqaG5m8gtFw62NgU84ItSQOV+ZhttPy21wE5uKs
         P5tu6+IAr56eEI+nKTRl8ow4BtN2ApfKWkqA5hzss5WSKj7dISCp0yG3n7QtnBSSY+Kj
         qUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769761215; x=1770366015;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hnUz4THRm4aVeJWQLZHQhQHquSXvl8jN1UCodfFTOc4=;
        b=PHNQ1c18P+M+S/LnPEeVBkmZKJVX4GxIKtjdGM4Eq4uY8HoZvhMwqcAzu1+9n4UnX/
         OqUHlWe621TYqamyhDd8zjE+l0YQv2TRMh71AF2t/9LC2hsM7zRBpSri/m0u9WhnqspL
         TlgtLvR7yYa0Drm+w1MWi7jZZgJQKhz2RthRRSiHo7Y76uqUI3T2/vZP+9CvxWfET/EB
         glxmH1TgeHFYlnmAYwZ9Tt+li1j4soahxMqIm7bEbt88+DSAcYmokYee4jTo+EtpEE2O
         cQXkObAA/3fuAZkbDq9UQXXVUEX3QWPO+pA+MB+F3wItUyB/o/x5WxwnQNQbvz/iM5HN
         VZBA==
X-Forwarded-Encrypted: i=1; AJvYcCX4Mq4dUh47WSd8JYKhDr8Y7112Inlsx3z5ibA4k/fbDohUsuM+c0QK3+Ao8HzBLaOHQjKinEWyJFl+Ahxb8FtM@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+vkLfUpnlxrHUeMCFKR/Km4g95dEckb+2AWWihm3mjifN2FlC
	Ijb7pcTwOR6vTkvGN/SO8qOHBySpSVMsKF9eY1Be7cYT8gigo9NsyoQC4Qdtlg8s
X-Gm-Gg: AZuq6aKYCqNqz5Btqr37AF8uQNrPrdde2PBFpRO4q0NxqYUGs0grrukHvwhHyRpBXWY
	KV5BWgKB+iMoRbz0/4ey4KyPwGYzjvzQCuxYQNR1iav2Ep8xi3Mq46MS9wydsRsd4Xptn06IeII
	sKAs0cwGMbKZ+Y+VwjqXRbPZ2uPslDWxWUVpuMEmJZZtSL1/t/sumCtHwfsa3O/4CiTV+EPxCF8
	fYIY8S5b/cZzL5Yi9N0GN3t04IqOxqXg3WRufKn714f3vedBL/DdyP4UtLfOoC6G+0SsJ+XeWQP
	WGXXJwU8xVMhLOdFgHOvYj2hRIwk5ctdhvR3+ZFYnr5MtZHV/FGW5Zh2MSoWSDL7uPUbt7dKrIf
	D8lxjzbpxBpA7iPqGqELNXCFeQA78j1chI5apj/olvLBfj2JsBHMHb9/FpcHOr94ffHSIVsL3Cf
	lukZYsgjFb58ufRzVtQWHQevOUm6d1eKTY9JKAZbpQmHaQA/2DiprE0qAf3WliIgxKrTF4iXarR
	lgUcU4G+OxcFtgjaDBJfHuaxYoNsqWzO/wwnyBP3ywNBlUQ9ds6Llu/V1vwbCgZjrHLdJwn0SCH
	FMMUUhb0Y3LQ
X-Received: by 2002:a05:6a00:b47:b0:81c:446d:6bd0 with SMTP id d2e1a72fcca58-823ab670e70mr2254931b3a.23.1769761214995;
        Fri, 30 Jan 2026 00:20:14 -0800 (PST)
Received: from 2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net (2001-b400-e3e0-2a58-5bcf-a65d-c80e-2087.emome-ip6.hinet.net. [2001:b400:e3e0:2a58:5bcf:a65d:c80e:2087])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379bfc712sm7866018b3a.40.2026.01.30.00.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 00:20:14 -0800 (PST)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Subject: [PATCH v4 0/7] Revise Meta Yosemite5 devicetree
Date: Fri, 30 Jan 2026 16:20:08 +0800
Message-Id: <20260130-yv5_revise_dts-v4-0-4d924455f3a7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALhpfGkC/3XMTQqDMBCG4auUrJuSicafrnqPUkQzowaqlkRCR
 bx7o5tKpZDNF+Z5Z+bIGnLsepqZJW+cGfow4vOJ6bbsG+IGw2ZSSAUAGZ+8KrZDKnB0HCSBIMR
 cYcICelmqzXsL3h9ht8aNg522vof192/KAxe81phUcRxent6arjTPix46tqa83HEpDlwGHmOKl
 ArQqqJfHn25hPzAo8B1CajKKJMCoj1fluUDzf+/xyoBAAA=
X-Change-ID: 20251118-yv5_revise_dts-12e10edd95d6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Amithash Prasasd <amithash@meta.com>, Kevin Tung <Kevin.Tung@quantatw.com>, 
 Ken Chen <Ken.Chen@quantatw.com>, Leo Yang <Leo-Yang@quantatw.com>, 
 Jackson Liu <Jackson.Liu@quantatw.com>, 
 Kevin Tung <kevin.tung.openbmc@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769761212; l=1817;
 i=kevin.tung.openbmc@gmail.com; s=20250924; h=from:subject:message-id;
 bh=Fx+n2x+YlJ0swzNoY2QW+06k5Hll0jZhxlDQqLG+dq0=;
 b=uxTiiyp4e2eQ7rsolNoZYbQNw2OiRXFETD7vDC5ETDemNPxpMWpOJDB8iJNzvmClBi16wpYGL
 YcWVsK9mXiuDA5KFD/opjZtGMxMJlzNiDgqYjO8+xmxxTS7fjaZ0LE4
X-Developer-Key: i=kevin.tung.openbmc@gmail.com; a=ed25519;
 pk=PjAss0agA0hiuLfIBlA9j/qBmJaPCDP+jmQIUB6SE7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_002016_174744_957996A3 
X-CRM114-Status: UNSURE (   8.37  )
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

Changes in v4:
- Add PDB IO expander device node
- Add GPIO to bypass OCP debug card commands
- Expand commit message explaining the shunt resistor correction
- Link to v3: https://lore.kernel.org/r/20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com

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
Kevin Tung (7):
      ARM: dts: aspeed: yosemite5: Increase i2c4/i2c12 bus speed to 400 kHz
      ARM: dts: aspeed: yosemite5: Remove ambiguous power monitor DTS nodes
      ARM: dts: aspeed: yosemite5: Add new SGPIO line names and rename signal
      ARM: dts: aspeed: yosemite5: Add ipmb node for OCP debug card
      ARM: dts: aspeed: yosemite5: Correct power monitor shunt resistor
      ARM: dts: aspeed: yosemite5: Add PDB IO expander
      ARM: dts: aspeed: yosemite5: Add debug card bypass GPIO

 .../dts/aspeed/aspeed-bmc-facebook-yosemite5.dts   | 92 +++++++++++++++-------
 1 file changed, 64 insertions(+), 28 deletions(-)
---
base-commit: 2a6ff9a25bf681302d29ec93c6b90dbe4b3ad591
change-id: 20251118-yv5_revise_dts-12e10edd95d6

Best regards,
-- 
Kevin Tung <kevin.tung.openbmc@gmail.com>


