Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE4FEC1443
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjWtw97EefBuIXKvc4rM905LfmUWExWCySCPbaqXUa0=; b=TfHuEWaPNiVRP7fkOrVRt0tK82
	L2cDTJ4U6iA8MjyAtkIyzMruRTgad6vNzf1AVfXzXbz+u0N/1L/fOpkrVizitK9mDrz+dO3TM3wmw
	pav1YtLoJSAI4dRPqoQT6CcZHdBHAp+jFiYrh9M/t2UimS/Ts/uNsj66MKycglu/CVyGwkgt1RES1
	nGZ3YsgFn9Zd+czwYKUQEGM+mZcJezQ1O0oVXKc6TFHQWLjXga1etdiUtygPj/7xu1533kiWwu2Y5
	tbTtlkZu1MlUNBho1OwFEH3Z8cjvYwZWtwrgNXq+uqUSK/9O3bEFdtix04M0As4mQxizyQ7l+F9Tc
	lid0P3BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPiu-0000000FDHZ-0YW3;
	Tue, 03 Mar 2026 13:23:40 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPiq-0000000FDDJ-2qDm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:37 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3870902760cso93884201fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544215; x=1773149015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MjWtw97EefBuIXKvc4rM905LfmUWExWCySCPbaqXUa0=;
        b=vtwBqVmxFg1Sb8pRNWgiXUS+5CbVYco+d0tGynU5UEzfEkDc+I8Em3rwisPDaRx4m1
         E1HMa9CU7naCoN7U0o2MVYqZj8iFULIKtjhC7//Iqzy4pzDiL3bN78Hzic1IP0n5Ny3P
         2dm7rwGn9E7/FeFaE66qmsM6yKaq4WR45VjgI1rTi2PqoXNxVqYWoq1H/IIcT0E/Y1Q5
         R0gu49XoOksAuBLhH1LsxRbBjdgVbnOop/EEPCDKnXW33X3ycu/2QRs/ws5gcNHCWjvS
         oGdda3GkKZ7LhzyNOpdz/LCJPkOLMrs5MKZfs1xPut4qWattcUkoRndG1AVRe+Ns/Rt/
         jgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544215; x=1773149015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MjWtw97EefBuIXKvc4rM905LfmUWExWCySCPbaqXUa0=;
        b=Qs02A7hYm7bwqboiJj0yy5XGYgDjtnzFtQXZQLFazDxUHfdnR0QrNzgdnENiKrcWSk
         7tH99gYl+mnjFqcjLsvYdu1eudeXhWfQAgZaATFWxQ3dWEvo6LH+Uhgmp2ggrRpfk7Cy
         kebeTgpdNdjyUSep7QrKRwB6pXyNSbnQUZGnTix7SbHXCjscBtrM3nCaitqG/iUgOQ/b
         2N7ihBYXKuUffxhwd8VQW6Mzi5zQGTrXTubzEBWgPMeBS/VZhGiqFmcJRR9AB0bCQ8u8
         04eBsO/guSRLumh+6azvqt3L/a7k41WeNtZIb2N0wq4sxsXJLS+Ic36KvO8KkZxjNk2G
         Qhhw==
X-Forwarded-Encrypted: i=1; AJvYcCXjKGfrox6Nx6ErHyd9RI8Lb9oAC5o1k48U3V+vlDmEGYuYZTmlo6zxIRZfd0g7SJijQCQ1EZniBFr+t47wR82x@lists.infradead.org
X-Gm-Message-State: AOJu0YzVtfd2yKeTqnrSbeDoJSl4yvg6X3vwFRyB9Xw5VxxWqO5QAXH3
	4AofE4jqJuDHs856Z4sSdBAG/hJOb0GvwZkXfLut21IHj2XWrHUqGPXDcnczr9RZ8qo=
X-Gm-Gg: ATEYQzwQbVvZy0SG45M48oidjxubk39eAWaGgv5KQB3g21Hhkh761SNwdFiVXsePDXj
	L/fpm6Ad9kb1zkjZadmd+KhKpccA1kmqgnA1D+TMcIBOV+5ypGjG/MChpmrioQB2c8GAGOVyY/+
	FBgkTVyfyxTdfPq+51PvwIcu0N0FcONI/zlyC6Y9uRHf6c3Sxlty9EE7GJtd9XL55LTjYznr4re
	cJsbpJATl/ws2++UR6hFPtZIGgTldBCmPoJ73FiCnT1v384EVb/nw8Sv5G7OA4VKMJsCf6FAeTg
	RdVEZuZ7oX1xn9bihqqS27CRC/F8PGJwmTPcb339+XwB8vhhxWBx8AEaluVySXLpiJPYsb4hI8N
	WIdcY20Z235Nq1Ro0kLqtJHc3aLyG1t3wl2rsiKg+PAvcQbH4IbawyotJioKllfu8ASuxidvLbX
	6v1xw+8V7XRP3zQa704+sAcglWtNWtQoqRahY17WvHM5U7fAzFVYIxSw8EzTCwwuggu/veCG9A
X-Received: by 2002:a05:651c:1507:b0:38a:203:be8d with SMTP id 38308e7fff4ca-38a0203c336mr90018001fa.31.1772544214722;
        Tue, 03 Mar 2026 05:23:34 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:34 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@baylibre.com>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Tue,  3 Mar 2026 14:22:54 +0100
Message-ID: <20260303132305.438657-9-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052336_733504_0AE9985D 
X-CRM114-Status: GOOD (  10.87  )
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

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/renesas/rcar-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index bd7bb9cbd9da..e4608c657629 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -241,7 +241,6 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 		}
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_sysc_pd_power_off;
 	genpd->power_on = rcar_sysc_pd_power_on;
 
-- 
2.43.0


