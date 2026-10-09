Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4943CCA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aaMaFxdym4cWsHL9+RBt8IvSWstCqEIA0PpJYwb/eW4=; b=Z6jc0Yc7o2BvWu
	Eq3XAP9lkzv4PXHpv2O+YU2OyLwTaP2TsyNDWCAbv6X2BQaeTZViyvG1U5X6DGV5R9mT/FIa3qB/o
	jRwWH4zhhCjJ2GL6cnkVIITtcMSPVtrDy81c8xMQrL5v7fQ5rIQ/HqBSx4F+CUUZyI6Nf+pwguWJN
	V4zff+FN5NeS5eEv68avFiCKcCuGL0mnZ3f+UiRyMXTQk9G2S9XV2FrKeLMGnmSmHd5mKMJgsSrwe
	57uuL83XPgJcE3s67RpTTgEYiEVjbHLJAPn8xmjTl5kz1fELp+AIO2fgzTt2nH9+rT5gH3CWIuJSl
	L0rMUCt656PUmQT/dXqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNs-00000006z6a-0UhJ;
	Fri, 09 Oct 2026 18:31:56 +0000
Received: from mail-qk2-x04.google.com ([2607:f8b0:4864:34::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNq-00000006z5Q-0wgq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 18:31:55 +0000
Received: by mail-qk2-x04.google.com with SMTP id af79cd13be357-93cc7e652d7so483422085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 11:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570712; x=1792175512; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aaMaFxdym4cWsHL9+RBt8IvSWstCqEIA0PpJYwb/eW4=;
        b=S7wTHAn9W3iKpqxpes9Bq7OG+ehuKe9yiQD7VHHqm4vsDwYNDNL2FaBxiFf41VApLd
         Wzg2pGoXy2vzZUOmZ4V/3IR89xl5PquKAS1cH8At0m/NiKkqqobeJ5w577e666tLwI2U
         xs4jy7UYbvOhHJ7wvYkrH4QozJBLc0rgEedZudFDcChVijxOWC77Jl/aa2FibGEWA5jI
         dMQQGGag/fuWaVlirSjMMQlI5jvHqEsXWSwb8IDP1RffrCWvgCyNx7NWFrfApmKwDREA
         66YppyhsDgr2RTMtvh8zHp9RasfbDxOdpLf0gKtLd8e+Aiu2GZ3j2vnu41YGBgc6F9J/
         O7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570712; x=1792175512;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aaMaFxdym4cWsHL9+RBt8IvSWstCqEIA0PpJYwb/eW4=;
        b=JZ+OQr3u3/b8hU6MrqWnOpii7AptkBjxJdW8Zq+qyZSTgLKH2oKZnlpssRkBdtC0S5
         GV0VUKFE3Sow4ta9gblmRnXpW90JRB5rRExsaQIfJ+lHAO+Ifiy5eFf5fiXUWjlG9kbc
         bSb2yeVevYLLXdW7UC9OQ2sC+4+y33bhXqB1/mREzkOXkYvBNc3UsrzAP9jHHyeNWld7
         daoRRJ88PQtaUZpcIey3XyJG8R5f50fx4k8L0hocgCModkAAedtM2FJy4Ly6Tqaf8/zA
         4yTlrKl1LdXjZpUji4IglQX6mjApR5eJs6Ve2Wd6gYq5oFNAQUbAzTf50fbT3/RRxDXE
         3MZg==
X-Forwarded-Encrypted: i=1; AKwUvByY66vGSc6eHGOVGd2f8hVuOnOCn4gSU+xC21YTPrNACF1no29W0wVIWVFZmyvKNU4pBjrAlApXb1HY37ZKlMNU@lists.infradead.org
X-Gm-Message-State: AFuF++mhStSTP39opvuF2brOVqaIKrvlpmhBZtW757/gP7+wTfIWduEE
	6rc4scBcmkYrx/KDASXNH9n+jMQQfjNGHuRoGA9KhIpJ0AseIGbbKQtb
X-Gm-Gg: AYBFou0GAfRRpmdXxdLpLCNVfEv/mGY6WG2f3+aFx2HWDfJF93Ol0wdIJJrZSDAIvIg
	UxiZD2iWQnh3ScFSvJrl/487wcEcF2lkvbBUh4MaFr/5yeDZCJEWSG0p4LCxfQ15DyER/58EGQA
	J7prtnd0w9XTeShwf0JrLxK9e8M6vm3b1Mm4ECSplx13ZLmqwJvYPbSSLsNKMqzn+QdtM5tKCIv
	k6JYglTjOd14fvD6MH/3ZxcRwfqJeX3YIIV9grdgabvF32cCIKesH8p/VuEC2X3u7Am4M94+irs
	xz0paoyV6Mtoa0a0eoQwGz1Np8TQwDBxV0nJQkrHjQ33XMWpfyMm7gMk4885HNRwvDQNtVSaq/z
	FxzO+SXifAOSc7z9h13DYNDAn3MelHQMwyDgeW6YjnGr3+Nl1nei8QcgsfO7mARrORdLp1yUL5L
	teTSDGKXCBJ0R1BgQvyLXd52GjPK372WoUKv7WjxNhKv1jK4L4g3RAvV4E335UpoKg/373kSn7T
	2kYW8De/vT9WEcTx/oYdjZIyKiLbPZ6BTXEpSBLhokd0V82PaDRyXJSa9s5yTsB
X-Received: by 2002:a05:620a:c53:b0:93c:779f:3e02 with SMTP id af79cd13be357-93ebd0c0021mr428898785a.11.1791570712447;
        Fri, 09 Oct 2026 11:31:52 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:51 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] cpufreq: mediatek: Suspend at the opp-suspend OPP, and
 mark one on MT8173
Date: Fri, 09 Oct 2026 13:31:45 -0500
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2NQQqDMBAAvyJ77kKSQ6z9SulBzWqXYtzumlIq/
 r3B4zAws4ORMhncmh2UPmy85gr+0sD47PNMyKkyBBei60KHOmghtEI/LGKbUr9wnnHZXjhKmZT
 eVZpQTriK4NUnH1J0sfUD1KgoTfw9h/fHcfwBNjPGEIAAAAA=
X-Change-ID: 20260929-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-81d12d60671b
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1963;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=U4dHBbZoLn3vaeQbmgOV5MgVtEDo4RA4KvvRpivcR9s=;
 b=sG8+NEHSW7BcEfXRhD7UEaX0Q4sFLMKTDlhA+uK12NJiwNn5hVhLgUdAt/DYzkxlyTEend9Sq
 BnZpSmH3IaoDHNBa2QeeCXCgHYHgznhWr24NPefLgNz5Dd1iPxON7b4
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_113154_268347_930F8A9F 
X-CRM114-Status: GOOD (  10.53  )
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


