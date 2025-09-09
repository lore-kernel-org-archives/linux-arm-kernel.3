Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89205CAC58C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3pEpSIVpCMDDxDEaXx+VtwPotB+bnapsn796RrVe/EA=; b=TAB3phmqt3O/aT4LgCJlPjIAZC
	jU1SkCpSIFWsjirY6ejso68/Lnc0nDCpi6abAwulY6JIGFisxv62NvAuHh17sEJkmbnL30Y/m3no4
	2Ujh+RfNJhxmAs67itEROhe0voMSZ1UXi9XBkGxsQFU+Ji4InfmHPm2SBDndIafJYSdUo4sg+uMnt
	x39KODbVCpq+GnDWqfnPzlZQX8zxucp35RILkQmiQYsPnvE2ebcQYKeyh6WsGnRFC/LxGiqa707XP
	78AAtvCBy2yreohFCYbDhUtO+ahhUr7TN37YRm1/XRrAOKI8Ta1UlV6GrDL2QoHxyJz8ZvYLeKLPD
	qlfocCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1vx-00000008nqC-1DA3;
	Tue, 09 Sep 2025 17:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwGB-00000006d75-3six
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Sep 2025 11:11:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=3pEpSIVpCMDDxDEaXx+VtwPotB+bnapsn796RrVe/EA=; b=S3i4yTTWoD7/kN1CZk1fLtcY3C
	KfrJy28bKWwxZezpKCu8N36Cs3e7lJKdZRygHUMfR8D074zd7iX2ooMph7jRfLIjUIW/1OOR9Zd/7
	FLB2E0yS8nfviRCHV3ZBsRTfEQeLDisN2dj7TsVTWozhCQ307Gi1JuP5Ze8jHe14iy2aWU/lldd8r
	fFTkC/LyQaP5ZqW8tMHKSUlcJVTicvnooc7ELzxZfgLq8KzNlc6x4HwElnibbmV3+caH0d7ubGN4w
	l9x5LcDTFwGpDDYqFb9sJaIPHd3jy0bQlitjKzI6Wgs75iaoq765OdM4UgIl5gsjgzs2msXpaTVgx
	ZpuAAOCw==;
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvwG8-00000005ITy-3MRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 11:11:38 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-55f6f7edf45so5204326e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757416294; x=1758021094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3pEpSIVpCMDDxDEaXx+VtwPotB+bnapsn796RrVe/EA=;
        b=kww412OTwp7T9t/91ABj/Gan1r3XEva2CY/xj7e56+aIRwa7fabpLriPOpKow/SGAC
         hIuZQMM/YJ91J+UMD9hdXva97gwN4Mby6J4UjcjVHgAVg/8paUtMrCfS9cSgQqmOVa4E
         dvx0tuiBmOO9wQygnsGi8s1jwxpkc6GQv73mOsw77yBTLmht2kE9qBZp4+MuB9gW1hMq
         GUlyEyD5yJtmxrW0wwvNyoSzZB1+BE/LuqvzSDTRJep9/OH3lKRhIxieqyIoKMBsBHdF
         HzMYyBlu/cbXrEBQaRQbsNVaIPSMMeiP0JSodZDZ2i2zq4ht633QZGNSNhaOwuEIQqfs
         UVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757416294; x=1758021094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3pEpSIVpCMDDxDEaXx+VtwPotB+bnapsn796RrVe/EA=;
        b=HnqztIPbNn0yMs9fJwEAw3X0G83+bsPi2hkPlcR+0WX24npJ3ROQbWvrWpqKHqlMP7
         AaiVyBIq06cqJEL50IExjSIbbz+Tml8WAJD6M65zOzDoIq2XT7ly0gKhsiISh++J45DI
         1kpgtZohh/txD2tIHDaZhmaah07PbmMUTUuU45YG8jY81tbSiVESY06nnR1281pUcGfk
         UMDO6ldvqKHxe2kf+hO97ZtGf8mlQK4OveoE7xlvUc6H12przl/BW9p2dTkfFMKTlird
         keDha7nYP1HKRdUm+3spsNeto6VjzoKYZE7QmKQhU3gJ1IROhbUk7XkcnIcBVzSyE+1g
         UMPg==
X-Forwarded-Encrypted: i=1; AJvYcCWr9dBPvOvJxCsuc8DgcL0gz3v/D859ZIMOD2YN/HMxcfXiHn/NRAy4CArHTe+7Ycys9QSIihLh9YJsA2eZ1I/U@lists.infradead.org
X-Gm-Message-State: AOJu0Yzle+2Cxea7vl9K+WLxTYN8idmrkTEoH2vzEb5JkPNKtl8759tM
	kcqgXNkAlMkDZXycHHfscchegUFu2Luv59u3TleDwSElnj+JxEa1pFL+iDPMUMDBNWw=
X-Gm-Gg: ASbGnctpLMKNzXD7G9AfF3rUnexTByvvZXaGsK7Fe42868UNmH+F74QsY+sqfF/mG/6
	t62tjB6B2YafgzhYhkde+BeTJqKVPMFqWqkT0D6YznkngBlUGwnSyAmjuIaeTptLjsXRzGazw+R
	SSmxz4kFBV28rlO710TIEuw5yWA5Q+u4Eh5479mZQMk06JwKOeeRcLjkFzS68pLgiKpYLU81KZM
	4J8OHNFMiLYegOrQxxrtMJ/KqYLEyh8kcvP4FrjmOESxS9xjq87npMgZd+17JPQ49OMhrPoKtfG
	XvKnqZczNGwOyYguQH/Z7HsWk06vvtgCUZZgUsf5fh6Fz5uyHIOZnFNBJ0Dzma6kVAulSlUMCkt
	lbuHDUBA3kO157iwIu3DLRh7QYlWrQ7bs+57//YSM1ED+ddJnPu+LKwcKt27mL28Rv4hVsLlFsO
	9lp+BBGvfs/j5yQTslIg==
X-Google-Smtp-Source: AGHT+IF6KQ4FmESzpiiWrP7Wky+yhjadfUfHZDM0+zInTn3WZZmjB/qogaMmNeaRru1voHTpZXRtng==
X-Received: by 2002:a05:6512:140c:b0:569:766:9451 with SMTP id 2adb3069b0e04-5690766978amr603941e87.17.1757416293652;
        Tue, 09 Sep 2025 04:11:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-568190f8040sm445440e87.148.2025.09.09.04.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 04:11:33 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Saravana Kannan <saravanak@google.com>,
	linux-pm@vger.kernel.org
Cc: Stephen Boyd <sboyd@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Diederik de Haas <didi.debian@cknow.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] pmdomain: Restore behaviour for disabling unused PM domains
Date: Tue,  9 Sep 2025 13:11:19 +0200
Message-ID: <20250909111130.132976-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_121136_971039_78DB52CE 
X-CRM114-Status: GOOD (  10.90  )
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

Recent changes to genpd prevents those PM domains being powered-on during
initialization from being powered-off during the boot sequence. Based upon
whether CONFIG_PM_CONFIG_PM_GENERIC_DOMAINS_OF is set of not, genpd relies
on the sync_state mechanism or the genpd_power_off_unused() (which is a
late_initcall_sync), to understand when it's okay to allow these PM domains
to be powered-off.

This new behaviour in genpd has lead to problems on different platforms [1].

In this series, I am therefore suggesting to restore the behavior of
genpd_power_off_unused() along with introducing a new genpd config flag,
GENPD_FLAG_NO_STAY_ON, to allow genpd OF providers to opt-out from the new
behaviour.

Kind regards
Ulf Hansson

[1]
https://lore.kernel.org/all/20250701114733.636510-1-ulf.hansson@linaro.org/
https://lore.kernel.org/all/20250902-rk3576-lockup-regression-v1-1-c4a0c9daeb00@collabora.com/

Ulf Hansson (5):
  pmdomain: core: Restore behaviour for disabling unused PM domains
  pmdomain: rockchip: Fix regulator dependency with
    GENPD_FLAG_NO_STAY_ON
  pmdomain: renesas: rcar-sysc: Don't keep unused PM domains powered-on
  pmdomain: renesas: rcar-gen4-sysc: Don't keep unused PM domains
    powered-on
  pmdomain: renesas: rmobile-sysc: Don't keep unused PM domains
    powered-on

 drivers/pmdomain/core.c                   | 20 ++++++++++++++------
 drivers/pmdomain/renesas/rcar-gen4-sysc.c |  1 +
 drivers/pmdomain/renesas/rcar-sysc.c      |  1 +
 drivers/pmdomain/renesas/rmobile-sysc.c   |  3 ++-
 drivers/pmdomain/rockchip/pm-domains.c    |  2 +-
 include/linux/pm_domain.h                 |  7 +++++++
 6 files changed, 26 insertions(+), 8 deletions(-)

-- 
2.43.0


