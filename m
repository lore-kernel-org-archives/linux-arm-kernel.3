Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774EFCD37AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD2aCPCHqZRuH2DBiEm63Gtf8tVlRjph1PzHrc+ZXrk=; b=eGd9yUuJJNC3iSV3WNQ8g8oNwp
	iBzBT0n88PaDEMyLAvy4ee44boDb1sFadmWL1Yw4HD9n2INQmlRKA+XLhCCHAcViKCa+HPgXnyRwD
	GcqdSVg+prt8knIklzXtcsByRDA1dtYHdwQNpwChsyOQjou5svY2gKpFMEjo6gTjHsrCoAuh0Ju+w
	+3wRQh2UpxKrp751+EzTpwnwxUpMlDBVsj3oStdjUFAhY09qfznXFxE6G8Ugjb2mkztwwk7NhIo/c
	AvF8FfX1/M3ZO6JALbN5uYxYGo36FjrPG1QnjchiErcEB/8RTXEp0r5F6n1HZBuCGLpy18Vq10IYQ
	/db7v1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUW-00000006TF3-0uio;
	Fri, 08 May 2026 12:39:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUP-00000006T7I-3NHJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:34 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38ea6a5a0b3so15351671fa.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243972; x=1778848772; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD2aCPCHqZRuH2DBiEm63Gtf8tVlRjph1PzHrc+ZXrk=;
        b=ET+euwVZ2j9I2UNqH6b/SHe+QTKZIhJIxZwkstrLulP0LmF6i8DwowYt+CxjVf7kZA
         DZgviTgcRaHsWBXeaJMJVEqUqWDFcegLmUedE0ccXCfAJWBfhoiPlhM4i52OxQVCwg2B
         N+EfOfMWPyPpAommLMWZML+xM4t2ASkEkMD/Cg8MTuL5jmAuDGXjprwvEkLGre6kX1Ci
         /9HKGOw2B0YCJvifxd2T8lJX7lyjLJl1vyCPlRBRghlh6lWNmceUOCEiHUBSTC5SnuWy
         A+RKXCBozzf2hBigzBL4uomUkr56amRhSBmE/7n9L5k2miGT7NTJLBtMa/XwzCrDAhG4
         jamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243972; x=1778848772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rD2aCPCHqZRuH2DBiEm63Gtf8tVlRjph1PzHrc+ZXrk=;
        b=L78JORZZqGhQIi857UFk80x7fauMWpbmK39UsYodxHJDAZePSAWUd5vnjiQIkLeicY
         MY004eQvLkqeI8MIiisKgG3eUDhyRIx+7R61mYiD4E+2iraVbl3ydzylz965vF+uFMHm
         1hN4gTlUwkk1+VoPi4RC1uF5sDW0gHRj8XotiGFdOpybUv/cNHOSERJkHVtaFw713bQC
         wSs2HHsshv9AqH+m5ji4Jg89EB5KfQqVltJKHskM7aufvq+dCpnDKF6oCUx4fUMj05Mf
         2D2XOA9IWnz5WdfVSTBzVwM748St0qP/9/NW+EKMZSkdk/RxVTh82FaXeiHz3/7CAJ0Y
         nVaw==
X-Forwarded-Encrypted: i=1; AFNElJ/eaqtX59JgedPjc0hq0rUY/B77rl2lDshCQu3Ku/t48ERZAgyCmzTYXr2DJrWI15Zmed/pV4xFSlmNSa9lOAeq@lists.infradead.org
X-Gm-Message-State: AOJu0YznUNMWKilcrL+zOCILk4n7u3gDefSDPXneg7qyUF7EZVw6vgAM
	owPoM46JDnvjCJmfPyp3j7cYTzwpQ/tcvsGoNc/tLNAFfHf8dW/2yK1kfkMhumRWFDs=
X-Gm-Gg: Acq92OHWb0RjNYQ2SKiluiWcf9YBnlY1+LpCAi+yoDaPdxYf9mAGxZYqBQDQcpYAwMl
	aI73+0nTuMmChhYR1a667c5g3Sqmf5MxBrrVwPUqemJiFc+ua5Fxv7JQaPuGG1JaS8CMVc5jr+H
	OVcgpzNPS+kYVy2mSjGOMPunB/0+LO2g47hjR1I7R+wBJS01ez/qqm6StwaGQV+oD6W0t7fUFah
	uyAc86SW3JdWEWlKpGoBdWJocklnouqPuNzrh0mmpjfkUDQByhjEcJ7en0kGIJz1v8DXP7RD2kq
	K9hLtQCZhdYtsDd/W0Soawk7mk/WQ+UnxSGrERpp3lWruaSKhCp3ryySYyccDIsGEKXfvqo8L+B
	ETyjA3rvy9WHOeqxBn9eO+R1dZsnad2l55KQUpaJbMaNVjowuAgfe6k83bRi0Gmts0TSjmVr76m
	2qB12lOwmCigwCDbkZbRPeCpN+uKheXHp0FvoeFagIHHqIXqZ/07zILumO5WlXmW9MNQV7WWpc
X-Received: by 2002:a2e:9783:0:b0:393:903c:225b with SMTP id 38308e7fff4ca-393c4338719mr34887901fa.31.1778243971807;
        Fri, 08 May 2026 05:39:31 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:31 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 11/13] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:39:00 +0200
Message-ID: <20260508123910.114273-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053933_859294_55528A7C 
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

Rmobile-sysc is not a onecell provider and didn't really needed
the GENPD_FLAG_NO_STAY_ON flag in the first place. Let's drop it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 93103ff33d6e..e36f5d763c91 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -100,8 +100,7 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct generic_pm_domain *genpd = &rmobile_pd->genpd;
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
-	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
-		GENPD_FLAG_NO_STAY_ON;
+	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mstp_attach_dev;
 	genpd->detach_dev = cpg_mstp_detach_dev;
 
-- 
2.43.0


