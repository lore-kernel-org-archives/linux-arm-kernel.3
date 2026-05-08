Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61B07CD3447
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 12:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zspu33ABPqLoZeWdeeV9gEAyKbL26M627IVpZcNoBBI=; b=g/f+C9ZBAyIAtNsDo8oQj7tPHa
	XVM8G+njiiqg/8nduQDmisyVDEp96K7BABcOI1qrUaiYHIjkDsY61V7I9blP+ezXX/ww7aNNBunOL
	jPu2kjgBzKhts51GrZTzJtphdotMaNhVMaLtLHeVrA9/PTYDBfBg5bJ6Sv+g1eLvfZE7swGda6IAy
	jyFY4FtDwSxusKK/S5q848eP8z0DLC6tB7/4MDtQKYrTzTjxe+4V8esUnOsFHFs0nGkJ4kZgbkezo
	lpUC4LeB1xi0i0f2y9hyMDaHB4jMa1hu93C2hN/FFSQOtGiV0i5i6sp3ERP66ZhLW3qmhwFQ8xj0h
	g19T5b7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUV-00000006TDv-2BcK;
	Fri, 08 May 2026 12:39:39 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLKUM-00000006T2d-2sax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 12:39:31 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-392445f11c5so19721841fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243969; x=1778848769; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zspu33ABPqLoZeWdeeV9gEAyKbL26M627IVpZcNoBBI=;
        b=dftNLKiqxSVRiZPagTb2GhBXZdKdCdBINR2aLyLyTzW3GBf5yY78cti0GINhexDmGv
         ewk6R93bqTGvjDux2Xek5IKPpbMPO2TEkgs4BmmUFhyCCGt9c/ovMTNhIXFNMy8irjWc
         NO0nYHTO+XYHvqOT62WOC5j5HTi99xZbtst8erVRuJEX+OskvqqKJJnUXjnBgaP0YQyR
         jK+GQp4DPQ6if4fExtUpkA4fUONFzVTais2SZkWPEzSP3S616FwTy4N9RQW6tYisrxmG
         wLlBCucfmtfy2tisCcdhPObHf7Vl19CDUzYoqIA4SxU5Z7hdaU4DuMLSZRGueUzBQTQ+
         4ZZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243969; x=1778848769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zspu33ABPqLoZeWdeeV9gEAyKbL26M627IVpZcNoBBI=;
        b=PwZq2f2+xsCfxeqgpmff6h1VcZLhK1vQf+Yb7f5KpEY7DLmxydxhuZtELygpdh+PDt
         cvfOmPrteHuYwlSYGUEAOO8JWn0TpPJr1Tejf+UXrIlbDFdenL8UzFsUu2Iam8yl3baX
         kk4AVrtjAID6QMSXG4dkr4PcTb9K9oRiPtH/RQIxJMZukqvmS9lFK3zDsGpvaKlP9hxg
         DUlA/U6qux58rcsgd8yZ+qfG5xtVH5D1ql3mEr4v7UhLHOmQCCb5TUbsv82QLdDi7Ttf
         Ecuq91r90vMgFZsw8Ej0Rnld2Wgl5fLonZ6FeoWSpD6Vqyo5lz7oib4uduvcbVMZieF1
         1IoA==
X-Forwarded-Encrypted: i=1; AFNElJ93Ptux2vJLbyMMrxC37ulkH2OY7gjveeA82Vsx97Akz2+bGIfW5AKv3i9sKiLQIPRlIDON3xnrzmjXJ2jduq3+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz98hvSEWqFCpJur5Qy1iCiAzspMDxfHEPVLWRkKd3BC71HGNpC
	TWtxSYWwLYNUb4yCTX5qZyACQEakQGR/Jfnds4/Ye5CSvN60NBt86HeNctxNrGdQhrA=
X-Gm-Gg: Acq92OED8ZckCGgq3NcTRn42mqewCydQqGsn49QWPHMwi2OtXfFckiW/jRqWw8bX8/P
	W7b4vDp6vTrbO88exPt+SOvtCUpYdRtoDDKTqAXIL0wfuQehf8ja4nldPvBZT93oDKrv8Pj400b
	4qwX8Lp1wPuOJo5SenB4H/4Q+RiXOPsoF+TIFQqsUSfe+/XIgAT0XjLKNsSaGUAMFu7cyU99399
	o6eJqwxp8HjAW8mfEVbG3MoR/zfbJzTZN5h8298P5hqlj03seqi2/vfwsHb2sgywwrN1kSlCgsZ
	hfhSP/zOjbPTQZZXNKVBrVRaihwlrxUrIFp5priVrn6glofubCCRrlXk3mwGjOna9gaheaoUuq6
	w06ZMmEg0yEpIKvCwswyiBCZlhWEgPXKmSx/jfjW7+/tW7jivCvR/Ebbi/f/cOxImWlkMsehr7G
	W3o11S75hGgHhuYdlp+FhRKMXFBK4f2Pg5t/cnoexn5WjePiFZyPb8OUlbj+N6QgFBj1AqneVl
X-Received: by 2002:a2e:a804:0:b0:393:b138:34ac with SMTP id 38308e7fff4ca-393db0526d6mr20975861fa.10.1778243968630;
        Fri, 08 May 2026 05:39:28 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:28 -0700 (PDT)
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
Subject: [PATCH v3 09/13] pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:38:58 +0200
Message-ID: <20260508123910.114273-10-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_053930_739125_EF814605 
X-CRM114-Status: GOOD (  11.30  )
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

Due to the new fine grained sync_state support for onecell genpd provider
drivers, we should no longer need use the legacy behaviour. Therefore,
let's drop GENPD_FLAG_NO_STAY_ON.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 0c6c639a91d0..81b154da725f 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -251,7 +251,6 @@ static int __init rcar_gen4_sysc_pd_setup(struct rcar_gen4_sysc_pd *pd)
 		genpd->detach_dev = cpg_mssr_detach_dev;
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_gen4_sysc_pd_power_off;
 	genpd->power_on = rcar_gen4_sysc_pd_power_on;
 
-- 
2.43.0


