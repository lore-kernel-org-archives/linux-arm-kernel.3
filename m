Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3BC2C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=; b=fE5cBPTHjCwuMd
	j578Vjcbvkc3gJstT9ydYWN8xzPZKgje6CRx9UmpG92guefluCH+p9V2vJVcIO/Ss/pIEDLRev21Z
	wULi8RyjKuPGxX3CJMwMhzXAEberhS1BI9A/yZGjFS/8eNlyBBBI6nrKj6uqLadpwJIobdw9DnC28
	pOU9l25mnVdVrw2ajj7fXjq1a/Y1gHeqxhJc9eq7q4Z8Am7Hc6znGq7x6PyecTGphbH5gHhZVhX7e
	Lr2qXMacFve8vs6o8rUb+Isdqe87coyFjAMDQ4N1/ChHkB4ZG3ig8xWW6M+W2gGi0L8qEU/kAJXGr
	xuTFrPX2f3d6CADKTO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpGq-000000059kK-2ykz;
	Fri, 28 Aug 2026 05:36:56 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzpGo-000000059jf-1506
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:36:55 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-482db627cd8so360300f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787895412; x=1788500212; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=yVSfsUG05tfnz28H2h4qI7berGufBhrfH9sDH8P+u/eXQMAAdtAkHw3y3KG1xkuunk
         z0iXmKgVD8dgzKyo9ikxws7U1qRZne4lIMDcFY1Tfoyzv+BZVzDIu2uns2qLUaTf4ZVk
         jbfb4o9KuckwOfxEIKtT6ZU0qTksW6FMQTCxEe2LtcjfGXGoPdfakKDWu/a3WgiQD6sM
         BIUQ0lu1gsu9bM4OEJhomXAVfw2P40D/a7H5x8l4lgtd8oyfNTAsVd/6XTJw9ojCQhYF
         IwXbpP6SeyzZ85pl53hLDF94cXejhYSMoB63JCcgSfsOOR8B+hx8OD+SpsskyQ8jYTti
         GqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787895412; x=1788500212;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vXjynDGOZctwtTH5h5fAKF7NFOdGmTdhhXt2jWPkW3M=;
        b=q6Y2EkcoIbxwZw8pxZuhVcDOrA6lfGqUfm0w1IY0nDtMsyOQ3rx4z2TnsuePQfbN9N
         3rwVy0bkQkaamaQkCEoBvM+At7YXZhWAf0Seo/oyfpaHk62RaSGydjVLxBGhHm31Dc5R
         qGlkpHsAlS6tLNjeX5/2mzjjcgozBeXF1owDXCp7zxp+hKR3PzPMaY+yYkYxdDNcq5Vp
         l/dOlmg6fjJLDvxUY2290iQQisJ4YpfAr2P+fScJd9pyA0y/rYiWXOqPhhSTGTHqmtY6
         I4IJNv9F/46+wT+zSwfxglH4UB7y56L3XX4/Neuwkj4bfYdKGRiJ0ZD/fAj7V7aZOsjW
         ivpw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9NqjpT4ChzTihafsGjZH8e8d+Ike+AmfnarujEdHELSspfa4pi9VERwMzaAu4WhC+LHzHiojqJFdBQoKilUcy@lists.infradead.org
X-Gm-Message-State: AFuF++nfTEshP7IjVq1b07qiwLS2rprBjn55kUKJfEmHvcJzH134uwp6
	sq8FDNNl5xswIG1TGR85ixkcTqmfNTg2i1vtNvnqMbFmYHheloezkvajkj/SBjzFUaU=
X-Gm-Gg: AR+sD10nvQRsW2J56Gy7VhmY2xtdfHu14F0QpgCK9HqKVyzqovi+hYiCEtgWrItX9BV
	2uQ1ux2WBQuMMayUymkBEHsFw0MgJ+BFcZ7YEFNagbFAmxxcty9MLgXWlaFa48urSlSShSfY5yA
	XraTuNDhr/DosvIEnKrsyQox6ZubXnSwbXKSD0xaLbAd9wzyEp0PKGjOgiV+8WZGW0RhNtFcQ0O
	0IY/wYbuF5zs9bI0d0rc8miIygWFOzAim3DxJG1URdn5FvgYOJdnGpDejYNxu+e/fcE1a9wEh/Q
	iEBoX5IhiOToMs+N2YEBYBhU36dUef0dOWoCLYCDH7T9NFfhxwX6bHDeZxQi7K77rFOqP38efhb
	8PHcmNnf539I4TtuxeL5Z/Imn2yli1utExU+b4ID5v5G1pSqnBZxxvUJGfUQ1gGKIu3pbs9qcyG
	uOXCAiViggvs6O4HEeEPORC42yZSzqJWUFx2u1PpyDLuLPVI6XaGnG11xGs+pt2GpC3KyQqvU0k
	TuA8UdDpHFVA1TwlKrNhC0qop1bCu7snsEPrhfP+vaFF+6lD/o6f5HzoB6jPpM=
X-Received: by 2002:a05:6000:41d0:b0:482:f344:5325 with SMTP id ffacd0b85a97d-482f79cc0c0mr6024207f8f.3.1787895411715;
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac4d0asm1410402f8f.10.2026.08.27.22.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:36:51 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 0/2] Exynos PMU fixes for cpu hotplug and cpuidle
 routines
Date: Fri, 28 Aug 2026 06:36:45 +0100
Message-Id: <20260828-exynos-pmu-cpuhp-idle-fixes-v2-0-06bce6107bd6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG0ekWoC/42NQQqDMBBFryKz7pSYEqtd9R7FhSSjDtgkJDUok
 rs39QRdvv/g/QMiBaYIj+qAQIkjO1tAXirQ82AnQjaFQQrZiEYopG23LqJ/r6j9OvviF8KRN4p
 4k6Mic9dd041QCj7QKUrg1ReeOX5c2M+zVP/W/7qpRoFCG6F0Ww+tNM+F7RDc1YUJ+pzzF+gkC
 5nHAAAA
X-Change-ID: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_223654_354759_388EC27D 
X-CRM114-Status: GOOD (  10.75  )
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

This was reported by Sashiko here:
https://sashiko.dev/#/patchset/20260513-exynos850-cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3
and was mainly introduced by enabling cpu hotplug
support and cpuidle for gs101-based SoCs.

In this second version one patch was dropped to keep things consistent with
downstream implementation and due to lack of information. Other patches
deal with a few missing error paths issues here and there in
setup_cpuhp_and_cpuidle() and around. They were updated per discussions.

Tested on exynos850 e850-96 board with sequential series that implements
hotplug. I don't see any regressions but testing from others will be
appreciated.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
Changes in v2:
- destroy_cpuhp_and_cpuidle() is called only if
  (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) == true
  (as suggested by Peter) (second patch in this series);
- in clean_cpuhp_states error path the cpuhp states variables are now
  reset to CPUHP_INVALID;
- re-implemented "soc: samsung: exynos-pmu: fix use-after-free of interrupt
  generator node" -- used __free(device_node) at declaration;
  (as suggested by Peter);
- drop "[PATCH 1/3] soc: samsung: exynos-pmu: use target cpu ID in hotplug
  callbacks". If we get some information about CPUx_INFORM registers usage
  then we may fix it later, but for now it was decided to keep it
  consistent with downstream implementation;
- Link to v1: https://lore.kernel.org/r/20260605-exynos-pmu-cpuhp-idle-fixes-v1-0-0cd05c81a82d@linaro.org

---
Alexey Klimov (2):
      soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
      soc: samsung: exynos-pmu: fix error paths in cpuhotplug/idle states setup

 drivers/soc/samsung/exynos-pmu.c | 70 ++++++++++++++++++++++++++++++++--------
 1 file changed, 57 insertions(+), 13 deletions(-)
---
base-commit: 3d83758432b5e6ed9507500a57efb0f3af41ee7d
change-id: 20260605-exynos-pmu-cpuhp-idle-fixes-32f5ed7c969f

Best regards,
-- 
Alexey Klimov <alexey.klimov@linaro.org>


