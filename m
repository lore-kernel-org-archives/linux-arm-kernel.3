Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDED1CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 12:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wuxR7/cwC5PXnlH9Ywf/Xu94uq2eGxYSfkkCZirEJFQ=; b=y7xuDiQ8Ae24Ny
	U6niKMewiubnvpX57AKxhgY1TFK2eFQcDz5DNYIiNRLMc6U45zGAMMFUAOjU09Po1GQ7onKU44mKP
	3Pw45IzdXNPzpGfigJwxucI2Ms35v/e1LPAJ5ezaHgDDecNFISs8I3Ytkq13rsVsMM5+CR0xMdA0l
	NrytECr9+3fzx+VvZMEu2OmnMY0tvwHF7m3jIiQc2Du+H9ODhApIfr/jQ8hz22NMLCQRNAIfiJJjj
	TH2VYczC3rSp3O0I4vTO4XPOQpH5JwUme6gpjS7NX2tbOWIhdmf+h25NfEyv7SBGq5+AEk7owF3/F
	h/0WcTFWBeHNBbYGgfwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0a8-00000006HgC-195E;
	Tue, 23 Jun 2026 12:50:24 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0a5-00000006HfY-3SkK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 12:50:22 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6870ad8072eso1133006a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Jun 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782219020; x=1782823820; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wuxR7/cwC5PXnlH9Ywf/Xu94uq2eGxYSfkkCZirEJFQ=;
        b=AlQttLm6d+xo0z+RsKikbI7Ds4wu5N80a3JiS0OKH0Y2ccucTFa/rESasIjQhY1W4W
         yhUOE8kOJddrjpR9VioJq7N1Pd3q0xINn0D0DJtkzjF3nf9lY6sJfOS9vP4XSUJQKAwN
         dI1FayI4WfAeSlyvhmT8QI8kMTge9r8kd89NqujFNMORqmC6q1RzxcBvGsg13xScNaSJ
         /L8QpVF254TwWCeSBTtPY3K0OvQq6r6X/kQVVwwT8e+M7SBwStDVifQvNN6CeMd0/pDc
         j5iMjHouMprjnRQB888HCGOlV1lN+JD61U0ZYw61FrFowP1CLaImolO83JEt0dgqRe+2
         vhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782219020; x=1782823820;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuxR7/cwC5PXnlH9Ywf/Xu94uq2eGxYSfkkCZirEJFQ=;
        b=NEiwYk5c/MhA9lpeEQyfQAE+U59/DHz0W21MOs036ZFX3vgBitbwuQSHr5VtQ0p6gi
         AOvBf+q3sr7E+IMfeyX7Cso5kNFZc5SDNvTRoqZB1pSJXTPYlMPUM3lnPvnJm8WPxK4A
         DwNYr/WS2QXZGO384uvbdb8aA/LEJRGR3lXWqbQd0pCRyYu/E9D4FUj1IjTCOD7eE6Jd
         iEzv820nYLgEO6BwSMHWU555DwaD8k7B3SLnRYj/s9/8sKuQXIifdOK59pmgSqw9Ekqb
         l/mAzeblDHQS3UrSo8d91LQGJWRV8OgdhNS5Y1srUMlh3m0g/FTMtgTp3wuIDsKrQ9qE
         N4eA==
X-Forwarded-Encrypted: i=1; AFNElJ9U5Qk9mvuA3zDD7VQnc9aH1qrYu+Tv5hXBg0pDpEY5Fca2Jqsxuqewph9Lq3SxX1MILyTFIlZ2ra711nB+Q3fn@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr0Eq28D8w/9zgIJWevVJAVtKtOQxLwe2dKO8AFl6hoirPj44A
	m8DmNuFwIMK0NwAMANGQJsOQItRlXi8vvmWjkH8wW9cL4ZzggXFAGrDU
X-Gm-Gg: AfdE7ckCCI91IavIO6s9JC534gb4wE7/POZlF6+oQkyyRmGewW5aqj3QRcT/kLiSyoN
	AFel0rAa0/7uaCzaFi4rRWrmocCSAfw/AjfJu5CT9pxqOcd1QG+y4hP5y977wIEvz5pegST+8G0
	tutoQ6Pvu2kqmpcOQNuOFyw0xI5lqUl1Mi82xw4tyHhomkuFEtZ2eTI4Taq5BhxMqszc+GcISzK
	hgSrg+ILUtBbfbAPkt6Aq8L0uFUIEPODAVkFNDsBf1foM464AVKUNSGBTFOTY0Hw9z3VPxNyL9m
	0GK9BpN+mYvXjrb58qBIRk5hkQnm2TSL+BrbKXGbNXG8AiGFCHivWr1Fkwt3Q8Xf11QTgkjsgbp
	rdQPkbzZrJN8U7uZQVw7mLo8J+yrx0mc5fWl94AZ22lBvYdvrJZ/uH7gzDuQiW/ba3I1RqfPjPO
	4ySuqrDZWB2ZccuJovO8Cb
X-Received: by 2002:a05:6402:52d4:b0:695:defe:bad with SMTP id 4fb4d7f45d1cf-697d4315842mr2072027a12.9.1782219019350;
        Tue, 23 Jun 2026 05:50:19 -0700 (PDT)
Received: from [127.0.0.2] ([194.35.121.133])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977b82fd6fsm5153967a12.2.2026.06.23.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:50:18 -0700 (PDT)
From: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH 0/2] drm/exynos: DRM encoder improvements for Exynos
 devices
Date: Tue, 23 Jun 2026 14:49:42 +0200
Message-Id: <20260623-exynos-drm-simple-v1-0-bb52f098b1ee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOaAOmoC/x3MTQ5AMBBA4avIrE1SRf1cRSzQwSSUdBIhjbtrL
 L/FewGEPJNAmwTwdLHw4SKyNIFpHdxCyDYatNJGGZ0j3Y87BK3fUXg/N8JxLPPaWFOUTQWxOz3
 NfP/Prn/fD3HAptRjAAAA
X-Change-ID: 20260623-exynos-drm-simple-bb5386d64597
To: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Diogo Silva <diogompaissilva@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_055021_872548_6D196B4A 
X-CRM114-Status: UNSURE (   7.75  )
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

This series does two things:
	- Open-code drm_simple_encoder_init() since it is deprecated
	- Handle the error code from drm_encoder_init (previously
	  drm_simple_encoder_init) to prevent silent failures and
	  cleanup of uninitialized encoders

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
Diogo Silva (2):
      drm/exynos: Remove dependency on DRM simple helpers
      drm/exynos: Add error handling to drm_encoder_init()

 drivers/gpu/drm/exynos/exynos_dp.c       | 13 +++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c  | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_drm_dsi.c  | 11 +++++++++--
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 14 ++++++++++++--
 drivers/gpu/drm/exynos/exynos_hdmi.c     | 15 +++++++++++++--
 5 files changed, 57 insertions(+), 10 deletions(-)
---
base-commit: 60326b17f877e12846167bf8ef83680b9875218a
change-id: 20260623-exynos-drm-simple-bb5386d64597

Best regards,
-- 
Diogo Silva <diogompaissilva@gmail.com>


