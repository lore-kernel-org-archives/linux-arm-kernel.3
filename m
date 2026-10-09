Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14795CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 19:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n5sVI1GUHdT0XZZxczYNHjQkkrtpSuPJARpcgHnshWU=; b=2YCkmqz5B5EJeU
	IhI93IZeUQgbdwg+IhWgI3b489m3g21w/n8kKmJuaqOxjByGn+xKJxmz7gQ4yEKgGyewN2WSSLEcm
	ZZtadn2weaLe1QEumJmFji6dFXxaCFnaJmtq5MCvJt1fKA41WXhOZ6ZKmNnRhvYLcPgOmUGE6C8zu
	a4L6pggjKYZhJkK2NiuFuaKgjKZmihB2wv7pbu8wHGSBQg1Z9vuFcYgN5FBUF2qmGXq5vt/d3mdnC
	DmxTBjSPG1CbC9HMtlAMZPy01IW9fKioNsT4Uiek5km8iJdD3LBXRkH1+BUW9mFmC5Xr5ga/qUts4
	cxQbX64e/5bF/EY87eNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWR-000000077mD-2CO2;
	Fri, 09 Oct 2026 19:44:51 +0000
Received: from mail-qk2-x08.google.com ([2607:f8b0:4864:34::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFGWO-000000077kN-2MiA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 19:44:50 +0000
Received: by mail-qk2-x08.google.com with SMTP id af79cd13be357-9367f27ddcbso3871685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 12:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791575087; x=1792179887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n5sVI1GUHdT0XZZxczYNHjQkkrtpSuPJARpcgHnshWU=;
        b=sdAzi7CN8gAe2AoKz6F6I6JTAdXgDpBiVVUrYgRz+uY3qcthrXmjR7b2VP6lhJZV/B
         8NSZ/TMj4MPvg8f95pn/kAtYLY8fNTDpgwaYGZja/Yk1JURLi//v73XF71iQwP6hVhF5
         vOQIQ7skf/xAYHo4nsj/YGOZy+Vfo1Qb3ySS0KIBxroarLdnGCwdZBnmX5SiNHMmAJmO
         ivwSzO5b7QwyfbgRxYjojWl3kyEQ8EWxR1HbVK8fq4JqH+Iqroe1TN3BLZ8p+5nVthww
         JwccloEYMqeZxxH3o/arS8BdMXSBM8bt4v4UYGqYxPqBNIJ88drExp/X+bI2i0bCHNft
         d5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791575087; x=1792179887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n5sVI1GUHdT0XZZxczYNHjQkkrtpSuPJARpcgHnshWU=;
        b=11PeMzUODsIw/PCjXaR539DwQlvkJhivgoln9rff72kfdrD2z4zPMUMF82IIor9fOR
         Rck8vrh77nadkNNTAenl/61FSOa8GhB5/pVG5GBge7YQOq5wtgtGj+bGVNNbJO87LS5b
         B+XDdfchvz01FACkcYsjlM9aA5Pqv2kvevimkyrPx1Wh4zB11uuYU+q5R61VUXhXur8D
         vqmmx9ZvzckSRqp/IOETEmgffKV36o33qSuXdzcjP0+1hQ26rTuQtd4c7f7QHNppt5QJ
         j2Cv0Sd/N+x++5Hn3qbv1T6x37tZoeDuIU4JQnitw4N7OBy32Tu3nai2OVxeIDIxSbhm
         uGLA==
X-Forwarded-Encrypted: i=1; AKwUvBxTEojRUgtz/DWj6j8bd8+Mz7BO9PwkzAvg/FwgyefQB5q42pF9ZCKqiMhPnZl6KyyqOM+k700FbQtoICkByhEI@lists.infradead.org
X-Gm-Message-State: AFuF++lel/4vy4mgs3/K2T+mTxK69loZ0pVJbpduJ9sxJGOwN/6WBn/1
	c9KbIbwHz5CCG4WwqnFsC81D1oPG0Rm6F9ou5pc/pbxuWfQANo0aapaj
X-Gm-Gg: AYBFou3aD3aeRNnCTnmaA71688Uwt21z8mN5TkoWVlHEqqV7f0Ws1PSl77Tb9CeeTOF
	8txV6Dv1KHorkVMUoRnP5bu+LFzqnbskyChVWL8oxs+vNVJsfp3y3l3u9XnZIFKZWi1hdMk3TDj
	OV/9F2AyDcUpNa0M+b8kHFYQzz9s/TokOM67kzf2WkQo7NpW6WTUDDlmfkL78EDMghxstOdfH0k
	2S04lWiyyT1oBI21bKlO+ft4uypVLowQTFYTgsewkO1oe6Zvp+UXQfiNEeTc15U/e1U6S2/L04J
	I22rYi2vNOTU7+3aMUsjyWUuXaMCB7+L/KoXtxVV3jJYQhmitWEIncQbNOsCuz+lRAB9rdzkpT+
	W/butJAHgTvrPinUYr/MHX4+KtF6f/6ZF0qFm3GliSIZLYMaSMPPfr+ASRS3CHGHDABIncoIcsR
	xZQn4d5wR7tT0YH8PD9xpOIM0rGtLWVapc7aY0ktqlu5vl3YZWB8Jg1DN9jZ9WNOkhTpoyV0Vk7
	KGcXDZ09MxXKVE6UCisUYMkM5HNnrJblM/EK+M55XAuskDuLoUxO2x3tPrZZaJEkA==
X-Received: by 2002:a05:620a:3186:b0:939:b057:daf2 with SMTP id af79cd13be357-93ebd26c06amr503914585a.45.1791575087187;
        Fri, 09 Oct 2026 12:44:47 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb98c5633sm259293485a.35.2026.10.09.12.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:44:46 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH v2 0/2] cpufreq: mediatek: Suspend at the opp-suspend OPP,
 and mark one on MT8173
Date: Fri, 09 Oct 2026 14:44:42 -0500
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v2-0-ba13f826eae1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WNQQ6CMBBFr2K6dsy0MUBdeQ/DAugAE22pLSUq4
 e5WbuDy/Z//3yoiBaYoLodVBFo48uQyqONBdGPjBgI2mYVCVaBWGkIbEkFM9IHk4xyosewGsPM
 dOp/6QM9cRk/OwOQ9VNJIZQosStmKfOoD9fzahbc688hxnsJ79y/yl+4qifi3apGAoPOyL3V7x
 gqvg234ceomK+pt275iZ9WU7AAAAA==
X-Change-ID: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791575085; l=2772;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=L3vc6anihw9NuQdcLcZ4gFYI/0/LOL9Q755uzReuYQk=;
 b=hRi+Wn9i8/fos9oTP6rkL2wurMq9Zk3718GB4hzvsxAUVc5U5D9CmncK/Q5GUIoL8THYrgpiG
 pGp5tGoInymCtt/2+7TOUdLSu6ggVJojj74K4eEy/FIuaTSyF+cQksX
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_124448_630642_4589902C 
X-CRM114-Status: GOOD (  12.80  )
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

mediatek-cpufreq has no .suspend callback, so each cluster enters system
sleep at whatever OPP the governor last chose. On the Amazon Fire HD 10
(2017), an MT8173 tablet that is not upstream yet, entering
suspend-to-RAM with both clusters at their highest OPP (2106 and
1703 MHz) measured 63.5 and 63.6 mA, against 52.0 and 52.0 mA with this
series. Those are 15-minute windows of the PMIC's coulomb counter,
alternating with and without the change; one count is about 2.9 mA.
Earlier, on the board's previous firmware path, s2idle drew 210-232 mA
against 158 mA.

Patch 1 takes the suspend frequency from the OPP table's opp-suspend
entry, as cpufreq-dt does, rather than always using the lowest OPP. That
keeps it opt-in per SoC: this driver also runs mt2701, mt7622, mt8183,
mt8186 and others I cannot test, and no MediaTek table has opp-suspend
today, so they are unchanged. Patch 2 marks the lowest OPP of both MT8173
clusters.

Patch 2 also reaches elm, hana and the EVB, which I cannot test either.
What they get is a switch to 507 MHz in cpufreq_suspend(), which runs
before any device is suspended, so the regulators it needs should still
be up. cpufreq_suspend() also runs from device_shutdown(), so reboot and
power-off switch first as well; on the tablet, reboot -f still resets in
1.4 s.

Patch 2 does nothing without patch 1 and is harmless on its own, so the
two can go through the cpufreq and MediaTek trees independently.

To: Rafael J. Wysocki <rafael@kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Changes in v2:
- Add the Signed-off-by missing from v1. No other change.
- Link to v1: https://patch.msgid.link/20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com

---
Ryan Brue (2):
      cpufreq: mediatek: Enter system sleep at the suspend OPP
      arm64: dts: mediatek: mt8173: Mark the lowest CPU OPPs for suspend

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 drivers/cpufreq/mediatek-cpufreq.c       | 2 ++
 2 files changed, 4 insertions(+)
---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


