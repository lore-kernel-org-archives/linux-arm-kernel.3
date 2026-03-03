Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2651EC143E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7NdMfo9Xg2r6aJvOcLQwOOsrACKCVOknll0GbpvMaoA=; b=nX8vq8yRPZlGr/qRKiN0mPrPZ+
	GY1LL8nDzsCNIPhq053CY6D0s+EVUsfKJnpmS2pfkO91G0ipuuYSuDs4vVRd+eoT1tk4xrzwACGdl
	IcjwBqrHMq+iRntmr0f33npCxEwZKQ7YIH2L8awzjeAwTjOmqhCna1QUiREs6D3SK6nLXY51roStT
	5aqvIW+xR5KYAU4cLWysXvYYFr5wK/Fhemc8YL8zzYVaxlNgW++hNZLXpJMi9XJIlMLCKBzT/h1gG
	IL2Mwe01UANk2VFL7NUReJ5/LbELv9zIXlchxb+MMc2iH2zuJm4Lj1hOsh+18enIhnbSiwEj6SpL2
	hp49+nVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPip-0000000FDDO-2koi;
	Tue, 03 Mar 2026 13:23:35 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxPim-0000000FD9o-44hp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:23:34 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-389f933034cso76418631fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 05:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772544211; x=1773149011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NdMfo9Xg2r6aJvOcLQwOOsrACKCVOknll0GbpvMaoA=;
        b=jvDVLjYNPz3+yikHH3FvjzC9s41aY1bol4rqWKxi4rVGoqP7tglSK+SpgRhjJ7ShbK
         X3NYG+SkyKnxTqFNmVS613DRikmCwbhrTJsr8xpExEZctEg3dEtO99rfqeKPHUHNYMPa
         q8sMCXdXYZW8RBXhGLM5IZsfYoutsEM7h9bnp71NKyfG/W3vwDVueGu/3Hy6RXzfzLLu
         NGpO95L+ZCUmd7k4vKwZnEOEnbjbk8fLXzvhtd0dLs5xNrPD7RxrcGAqC3ek45zE9VX1
         wOuofaFO04Rqbkl2PTfM+3aXca+PwoaqF6Ye1ZgD0Mbl/QS8hpTtAJBzOxlivgBFK2Ia
         tOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544211; x=1773149011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7NdMfo9Xg2r6aJvOcLQwOOsrACKCVOknll0GbpvMaoA=;
        b=kGUhl3l7wM2+FR0oqUv6OajQ7wNAGUDaECeQYinPvrXx8hwBIe0zyK56zl+y/UaLVa
         B1KBASGGJiMT3bADDZhVQlINDyWJA9vkzrWI+vbomja6eKBi8Vhbr1mwZhZcqvAcpTJi
         AOoWMCAym47eGEZ1AG7IJEwpaPFZWlqRlN6fDzAjCcBurtMYQKVmlTk7y8S13izWSDzA
         hW5SEWcEnyEGl6zFAR7YZ3NNLaypkzofLQnIuG1zXtvVbmBAgfURV7QcPdKNyUCOSkHD
         CBQFc5fKbTyKETg+TQBgDu3J1SAGHA/bZI2/JyMF5lqv6BVcC4CENbi7ICQhbNf0AWgd
         oWPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmUOIMuyn4atyNx81D1uBQhloV/48bx0e1Fv5lbp2MbZXbd0oBODSAz06d7WmJ3Gm1tIn4+wDFVKjXBOYWLqTc@lists.infradead.org
X-Gm-Message-State: AOJu0YzJdyY0D9Pf2zftSDpRBT+qu6frkrF/ApKMbycYGPFNfjWqep+E
	/JDkIdVvEMgXkR1QVRCnC10/TcK5BK2xd9lc4zrmXj2XttOUhbwhvkAm8WAj59IPr30=
X-Gm-Gg: ATEYQzwxLToq1Yh+E2hOjH8KblHfD8rM94+9b2lpckK9CB1EW1xTIG/13n93shULgp6
	GrBle4cEyoC0q4I3dQb3krD1ochQvUvXIyegN8+DwUZW8rJvskshouluLq6G8y1Gw+aAi9h6VC3
	K48SgGWkWy+D225PwL3aiZqb0Va5R9ErtFOS+DZpzATO3JJTz70v5EsagLO/YU70f8Een1kbKHI
	CSJmd8HRpx9nUIU0w14/H/rgkeU/m38NZapFlzKo/7xiWKMEi3XAnAIw5OfkCsgMxx4QTck2dnr
	wB36ywdBYidcHcjtfGRMbmQlAoYMTIJQ3ZZxUl25YNXDUG7704brxke2+DmCNTpI3BFx88jJ+3w
	qKEk4tWk6ZJKFWCWLakM3zfrQg8qZyyIGwaUNfcq5OhkF91KRfvLEagHNq/YmRLeTkTi+A3IrSg
	zRi8BbYyaviR/3vQ1x0loAEJx0tOf+B9JKINhfP3RMvneH0ozdAEaRk9nivG93BRm7gvz0AazS2
	yq3F+LCOnE=
X-Received: by 2002:a05:651c:552:b0:37c:c84a:99b9 with SMTP id 38308e7fff4ca-389ff34ecc7mr108930621fa.24.1772544210984;
        Tue, 03 Mar 2026 05:23:30 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a1235811e3sm587866e87.29.2026.03.03.05.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 05:23:30 -0800 (PST)
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
Subject: [PATCH 5/9] pmdomain: core: Extend fine grained sync_state to more onecell providers
Date: Tue,  3 Mar 2026 14:22:51 +0100
Message-ID: <20260303132305.438657-6-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260303132305.438657-1-ulf.hansson@linaro.org>
References: <20260303132305.438657-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_052333_042066_CB66C233 
X-CRM114-Status: GOOD (  12.31  )
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

A onecell power domain provider driver that we can assign a common
->sync_state() callback for, should be able to benefit from the improved
fine grained sync_state support in genpd. Therefore, let's also assign the
->queue_sync_state() callback for these types of provider drivers.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 53401db2a386..e0b9dd15a949 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2921,10 +2921,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 	fwnode = of_fwnode_handle(np);
 	dev = get_dev_from_fwnode(fwnode);
-	if (!dev)
+	if (!dev) {
 		sync_state = true;
-	else
+	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+	}
 
 	put_device(dev);
 
-- 
2.43.0


