Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D3BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=; b=tjlqHTf4WkRRnNdKdsh8YtfmsB
	Y18Xt/3xvbPzXlh5JtOjQZFjRbTGRgkPG07VU40EByxrQgB2Qa1RZ01IimS8QuQ6NDbyTptk/nZNI
	954Jenhgzo44mvLSqCp9KcTSRRx6f7oxzVQeuL3HOnHCpOR7Bmoffr8MdByL3XY/o/jEDybQQFVaD
	z0AMLD7QlAne9JJEg7u4b7acWz2uVezQsvltlZUDaFWxNKS3vNnHtTED0czYwKhjSMn38vEcWkGF7
	aKpIL9mNGw9Qo6owmlxZ1D+acvsEHh7ntTQaeTJgjqJkTgasfYHDsdP/AHXhSHriJBmnC0Tvlkewj
	QS0vicAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yo-0000000EMbK-179V;
	Tue, 07 Jul 2026 07:49:42 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0Yh-0000000EMU7-2STZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:39 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso3149006a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410575; x=1784015375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=HjJzWSsj01hpmmSy80N348KbxjOXZ0z9E+Pb2ZLGuR5u+uwhiJEfznKQLDXA+S9oll
         b0daoNplnXdqMX3LLNWgx4abXmiNrnBFhtxua0mbpW5ZBE0Y+f/cKkcJJKTti/QopcaW
         qfp3FJ6bujckpvKTgq8ShKbt8kAOPNsoljsPdkA6EaIyz+BcMli3KX2XojUp6pWRsWuc
         u3ZAmkZ9z1D8OUZgJwEmDPkO4azXJP39IUJX8DFZbmMFNBRe5yL1r92LgKwemdWchqyD
         EdDVOIyhzfJ2SoKSIEtX6ChA2PLM/wgTehCbRh+YGA9CROS8Iujb3Z9LMtKa6cuz+9V+
         JcKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410575; x=1784015375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TKaH37G0Ewqa53zWdK8uHBZRlRPd7/8BawFkzA4KWg4=;
        b=YkUk2rNykQX83nYtQq8EWABJgyl6rtKzsQcgFHxE19O2pE/QoX4bImJwzFtMUorgUt
         j8RGsjo731wpeGni4NgdqNK1Td2WJ7JawmntZ+lg62qufvMM3x5LodNKugIsNEB+qOKU
         WO+l2gOgCJXCMXRb3By4giBquiXBf/uGG6BaljW0wWYgWu6+5xXp18u1A8Ju6q1qemEW
         5vKgTelqv7i5bkU2kaqPHnLBLBKN7yfn6tdjsEUrCqM903/qDZ8lGxzIjp/couvPuYxd
         PcLdeJFHmBcFu8gJ9oQG2IKwrleoTZJsNQsrW7NqshazbP8piG0RsRVClLiM1Q6MoV6w
         ukOw==
X-Forwarded-Encrypted: i=1; AHgh+RrVUzbLgknq1tQjTEVHOHyiXnxUqtQtdMsUQQf9YocciyT44dGU+zsHNS4lL+M10P+Yimyj/m8xNQ3j9aibHlD5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/Ix5x3FGed0aJyt/0M/5E7htQNi7MDFBugBolyiWkN/K5UHkE
	QjbkjZTwHBOo+AbbQ1x6rC15RMD3UlwdymhaISwHJcoBKj2FHqu/cHCX
X-Gm-Gg: AfdE7cl+/uhIY/qxtTUIB67yBhmPUDTG2zfhgcWUeQ68KsiGlP3DX3jgKVtdOBE/cr8
	XbXqhGWyT2tEF4I+vRe0mtmv71i0gfeSTaXYfHfXPDalHlByD69ulPkVoIB5yWiXyn6EAvefJuv
	JSFUMVrmyomxAgUACib4ssPmYdLJKfTCs0SVxze3kxD8MdroHIOKdcPtila+yes/pygQs2G3Mka
	GoYdBXNKXjw+Wgayi0l/6Lh0MY21FAK0RJKTF5jtmLzvdLKeu9JpE+yderlr61t3eAKHOvUMbkz
	j34uoPkcy97hrajzdoz9DeA09pIVT/a0NIpScoN4TZAn9/yX7ChfwvGE5q/B5GzC1u2ayCr3h49
	j4QLDwtP9rBm7nnIpUYI2ntoQ+/pxGpzst5ipdV3TipWEHbl0TsYQOhwclt5dFLBtV6pbzaEvv3
	7YXGUqbuPgSV/VFO8zxDzA3hsB4u/DbshbR4pVM200E1uF
X-Received: by 2002:a17:90b:2752:b0:36a:fcf5:64bd with SMTP id 98e67ed59e1d1-3875650bb6cmr3966713a91.2.1783410575001;
        Tue, 07 Jul 2026 00:49:35 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:34 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 6/6] clk: mediatek: mt8192: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:35 +0900
Message-ID: <20260707074839.240676-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004937_763111_CE51419D 
X-CRM114-Status: GOOD (  12.69  )
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

clk_mt8192_apmixed_probe() in clk-mt8192-apmixedsys.c does not call
platform_set_drvdata(), but clk_mt8192_apmixed_remove() callback calls
platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 124294ff468f ("clk: mediatek: mt8192: Move apmixedsys clock driver to its own file")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt8192-apmixedsys.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
index b0563a285bd6..e6ac40e2f12d 100644
--- a/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt8192-apmixedsys.c
@@ -176,6 +176,8 @@ static int clk_mt8192_apmixed_probe(struct platform_device *pdev)
 	if (r)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return r;
 
 unregister_gates:
-- 
2.54.0


