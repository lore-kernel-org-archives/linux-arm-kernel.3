Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B51CDE00D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DPjgwRy+onJPS+IqkIcaIi3lzoC2BxsDCzhVvVFR+2A=; b=E8QkfopIuhEtru
	q4cLNUFCbdoQwrEDqpdt7IIGogau8ujeSiBotv039TgFjOYEbqpUoGmO5AEmIwYH/WKn6HDaCuKVX
	K/L+N60Kc2BbpQhTegZK1A75a4lEwvh4A2EUX5Pgn4y8oL4RvyqE6DMcg34b8tsToLozmONx/DawD
	zVsrunAXoGvl0J10UntcOHtn3z8+iglc/1eQKN2mcTC7dmg5dLsWOnQUYJPKIbXIvkuliAprnm3u2
	Z9hDcAoad1Y+pEhg4DFHKSiNl6eKedSGgrBKu+gxYLuRULsKJ7TlVBS9OuxhQt+oM/VS+BddUNxkK
	m47uCW7wUfLC7/KAy+PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTu-0000000C9yG-00H7;
	Fri, 14 Nov 2025 12:00:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJsTn-0000000C9wZ-1xzs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 12:00:40 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-42b3b0d76fcso1283217f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 04:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763121636; x=1763726436; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DPjgwRy+onJPS+IqkIcaIi3lzoC2BxsDCzhVvVFR+2A=;
        b=iV6edgj8PpHVKWwdbamQs2VlJjdIjX8nnRS8PebHsQS5C+2TiFaSaq+qhIT6LR3EMx
         2I8U2NghP28zy/8RQfjqRilHuRN/q27bij7u/Cytj2ct5UYiiWuyeTED38RjyMun7DPT
         whQz949FH70PKD0pKNhJWDypxWm6xKeF15vIF4NeJr5NRabl0aCfp618X/KYAvs1tOnK
         KQtEodgMputgg//XNgVlF5J5yZS2tHl8ROkV5W/xSHtzVDxtpx8oWToHRMPPg1CXmt5r
         2wFqBLmirjFigYjlGwwcpOpUvQgBJ1K22dc2LDqJu6+WxD/z6YS3KdYFjaTb9n1QRqDC
         tMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121636; x=1763726436;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPjgwRy+onJPS+IqkIcaIi3lzoC2BxsDCzhVvVFR+2A=;
        b=JZLuKsmEFEvSA6CBg5Kraw3EJm3Z06W9Yd/hlQJh36klds//R4ilYSc7tLoF/EMBbm
         Iu74os07VOySXkB5o/sJGvuKNENqlkYzNDs2IOAJr2gy3UV92icmCN3TXPWz/kGN5fjf
         DOOovTY4ZXr/5MfboML1j3Up0epnlP1HaoL2FEP1W+2bd0vSbJ+CIvADor+sOwuRxwRP
         HZut7V1+y68+6k/+N0gECeHpUIljMOg/Z/+dt7op5HNqr/hGu1WLhMSh3/vYjyD2DMuF
         jIH3imIfunqz61HuRzRVn3a4QQwRAXMpJkqsZ0+I4rygZS+8Sc5iN0oEU3ew5MtAxnOU
         DUDQ==
X-Gm-Message-State: AOJu0YwgIGiQySHD9nqTBzVU/CqAQbtAzkqmGAvxJ0IYiIB3HZVU4PWn
	J8pVGRy4H6ehjaECMsEiMEIZ0iB0xFMsv8tBo8K0u9YHQdt5NlBkggUqCPS2xVpmLOA=
X-Gm-Gg: ASbGnctyXp8jZPaqxBw0hz9E3Me4CVsK8N2oczxoOQmMDYxWiRCa5H3IxeeJrqURvgS
	ApdOoiUV3/3V2c3GpZZ1H5PcRnUkTF3d/8xsbo3rN2HOFgUE3Cz+i6z2RNNQIWOC1QlXxwIhhqK
	/KPMHbb4Gtt9G2/a4bqpO3GzK8QWFmheoRWppAOC8ItRaCbu8IhKkfW62kxopwxaV9ETrku+2Qr
	XbQ3fLrRFyqQTNwEMxzs0Ao7aYeBt4PGPPduPn2syfRXxe+15c5+NBcaHYbf/ClebAFGR7D5OVr
	RePBl0DSD/axWrpOud3V/MCos76yBAfia+aVOzFYB13Ekglrltr/iT92JfMfUH5m0115xBAqUUU
	tKXQ8GSxAnZbKJOSUBAYxDriXywrNzCf0EzHB3frdXJ05+vvD7n3t/+K9na/DrXqbYpOkq74RAf
	OdT9v9DIQz1LjVRcy8QD66LTUJlB1NcA==
X-Google-Smtp-Source: AGHT+IHX2390ivkvLs2uDJJ/4xAE1crzQXympMenKA3YTmHg28FuFzWNtXvAz1hi1yPzry+bv5rDqw==
X-Received: by 2002:a05:6000:1ace:b0:3ff:17ac:a34b with SMTP id ffacd0b85a97d-42b59383b2dmr2998163f8f.42.1763121635434;
        Fri, 14 Nov 2025 04:00:35 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae5bsm9487578f8f.8.2025.11.14.04.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 04:00:34 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 0/2] Remove syscon compatible from google,gs101-pmu node
Date: Fri, 14 Nov 2025 12:00:15 +0000
Message-Id: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM8ZF2kC/3WNQQ6CMBBFr0K6dgytqMGV9zAsSpnCJNIhU2wkh
 LtbSVy6fC/5768qohBGdStWJZgoEocM5lAoN9jQI1CXWZnSnLUuDQiOnBCm8QVxiY4DOB4nO0P
 Xtq6qja0QrcrzSdDTe08/mswDxZll2Z+S/tpf9PQ/mjSU4I1rr762HV78/UnBCh9ZetVs2/YBQ
 1IRWsEAAAA=
X-Change-ID: 20251102-remove-pmu-syscon-compat-dbbc492a4eea
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ZaIyBTnwagX+mg5Fm8v7qCDLfAe76rRU3qsBSCjnAxg=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpFxndB6OL9nN24aNIm+o9cKItyW9b1+ko0K+Iq
 yFeHy0GxaOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRcZ3QAKCRDO6LjWAjRy
 uhmSD/wPTru0lXRPUMWeofXVH/cZCkVFn8jaWh/YseuFJHZwg1JWLdjRynJqe+K3kJIBZ27WWcW
 TcW86aJ0UT1oNYmV9Wd9czCKPp8Lnon0hVOTXVgnUU7/cmg+pq9vLu2uAJvUb45sd60K/WffmGl
 DnNeWABUDi21VZLU8hXysxShZh6SIZ5E7euBcq/Xktl1ffo8vcjsFuyFCPvazTlDdiSrkf+HtZh
 cwDZLR5loTi5ATtShLh0YEPZHkFn4KIlMZQTA+Ts2zdjEiNZ7VogsSV/ns0ECAi19sHE8dz5s8t
 H+UgJAQcNCoCrl4x4ti9hfTsFWZu5c3gZ3cORU3orEdb0Qo+J8kDfPopMwsZbTzoSoZNoTqF86W
 kEqnSqFQgFn4j0rkgYKyR48D82z5T+8DClouk2bHmFJqyWcAh2e5AvG85z+FxoZLcfRJOR2OBY3
 9Xvl1elZZJcmuNSj48UnXO+tPtVwWKii/KaNNtY05tfiaQD/qyDmSF4N++1Tz0bYZzX5LcBwvaT
 u2NOYKdARwJ77m9Ag2pQhOq+jKr8iapK0PlZFwyqPRj0ZGccZT2dneqccGmyyXaGhGFqDfL78yJ
 n/SCRenDrP6MXRUK6LVM3yMDbw5OSb5WDFkEdw7uablX/nVwpRTB5vynh7Kv5HUyRMeZ6FwnyIG
 Ckhc5SWTFM3b1gw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_040039_576977_9781DAEA 
X-CRM114-Status: GOOD (  15.66  )
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

Hi folks,

This series removes the syscon compatible from the pmu_system_controller
node, by updating both yaml bindings and device tree.

Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
"syscon" compatible") it is possible to register a regmap without the
syscon compatible in the node.

As noted in that commit, it isn't really correct to claim we are compatible
with syscon, as a MMIO regmap created by syscon driver won't work on gs101.
Removing the syscon compatible means the syscon driver won't ever attempt
to create a mmio regmap.

Currently we rely on exynos-pmu running and registering its regmap at a
very early initcall level, so no mmio created regmap is returned. For
pinctrl driver that runs at the same initcall level as exynos-pmu today we
have a custom exynos_get_pmu_regmap_by_phandle() API that supports
-EPROBE_DEFER.

However with the changes proposed in [1] -EPROBE_DEFER will become
supported in the syscon driver directly making this whole approach more
robust especially in a highly modularized system with other drivers at the
same initcall level. We should also be able to remove the custom API
referenced above.

Technically this is a ABI break but no other platforms are affected. With
an old DT we will have the behaviour of today (rely on early initcall
levels). But once [1] is merged, with a new DT we will benefit from
-EPROBE_DEFER. Additionally PMU write register access was never working
with a mmio syscon so the ABI break is justified.

regards,

Peter

Link: https://lore.kernel.org/lkml/aQdHmrchkmOr34r3@stanley.mountain/ [1]

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v2:
- Update commit description (Krzysztof)
- Change Items to enum, remove const (Krzysztof)
- Checkpatch warning commit msg length (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20251103-remove-pmu-syscon-compat-v1-0-f2cb7f9ade6f@linaro.org

---
Peter Griffin (2):
      dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      arm64: dts: exynos: gs101: remove syscon compatible from pmu node

 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 ++-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                  | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251102-remove-pmu-syscon-compat-dbbc492a4eea

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


