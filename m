Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73321CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 15:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FG8GJ1kN4E/0cy1xDer4O2ZZHhjOfvJCaudPcmzQdI=; b=qnzPze60Nx0sA0Vx4W7dwyqsUf
	2c3FMpM/7RJ8dwlct31NIM9RJM01uaOoesa8zZQjQah7qGpbg09bU7WYp2RpreiKq8JA8dMryT3Xv
	5PHpkS0om9uq/fKHmDUJV6fLd/VnfAx6iJ85x8obckQKEOrbbadXC0g3hdyzW/T2Qheu5rJNeyb3m
	2s2j1UIGzz1j+pC2RXjEl+6FnYPsq/5GDvV+3NSuRkR6spKNFHCJxstoW3J8ujP/eQXOgPybabRs2
	sPJRtFgqbsGV4CthgNsTfc9vM9ob1Q5KeNvs607Xp5O7f25UxXU5HgIJjVNSSj5iL8LfjKjnsETXx
	P8dXyYVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGt-0000000DG5g-2nrT;
	Tue, 13 Oct 2026 15:18:31 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGeGc-0000000DFuB-1b8U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 15:18:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-886e61fa30fso1068639b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 08:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791904693; x=1792509493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FG8GJ1kN4E/0cy1xDer4O2ZZHhjOfvJCaudPcmzQdI=;
        b=orM7oE0F8/yXRQ5PHfnjlI6ZOuGdLZT6/pcqIfIyDXAMSibikY9L5/44JcE9FmUEj3
         UXJGAsEbK8ZKBFCBnzzdhltwKNIiei9mKYH2zjrfMxMEO8E89wgZqMJwnY6BJnZlLB5w
         1YHS26ss0ZmX9y6opGskBlhJersiGSMmgSEYIAcLLZ+YEdpsIHc7NQoA+JkNYsHjSzr4
         Shmb3rkukFkMPAA3maizLvaX7D0CzGmg1mlHbRf2I63vgw+1d9xRi05/bo8EEk/dUlJd
         oJfxJgYd8y2zCO9HXqtLL2YpKYla2N+77s7tWy7Mlo2796pU4E+gXhx+fEuh9LBruLB+
         ymKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904693; x=1792509493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FG8GJ1kN4E/0cy1xDer4O2ZZHhjOfvJCaudPcmzQdI=;
        b=KtFeyl8WO7OD+92EuJ+dMT9bXpFPtbReVlgZKWhCjwPHe1qCsf5wFICsw3cpjaBldH
         qpRA+3VL/ntokDsEKnDwztCnLD3XwYTKGGEDA5wmydqkf8eIGHEZiYzcSJPevjpEh9Y0
         LWsYaGa9n8klzZC71Ot8dueWlVnur2ot+kiuO/KSXSKV1q5nQNt6S/2DoqignLDthttA
         Q/KyO5wBhDpl8Qr0Tew/XEnCyPcE1FEippDxjceLUXnOiL31J/sJ6nqpfW/GZKlDWX9B
         d1+n++JQQDfIGzpzp3tA3NHAcls4bTTNnfLOzlZHz8Qxp+nH8sR8WIX43mtTDEfvDFjC
         juqA==
X-Forwarded-Encrypted: i=1; AKwUvBwYliEeNiDBvPTiXtOPnEtAJe8bAPILc/UnYiFzhUuIdsod2x8PCQhH7VSnRTWTubesMpOfw5DxVzWkau+RGLdW@lists.infradead.org
X-Gm-Message-State: AFq9FYLzZS22oWJKRodNPCtRb88tsMCcyBc5uMCh7DxUCIE5m09aDE5A
	27ttjOBNCh38iwMQ7jDAwPF8fy7eLx8VdK/KzgSBkIAY3IKiuw1yEIpm
X-Gm-Gg: AYBFou2vWf84TVQn081D+PVjwt7KxFOtp5xFgtoHaTPXLNFcDGAOD8fkTQFTM7Axaqv
	9Dqik5FsVaxgEye228L01wGtJcTSzV20/wB7KzSSpramJVw35/fwqQo8sWVBz9X/XfMSkcb3EaD
	wYdWQNaM2yiT4mY8fLFjyypiKvMXCzkXgMctlmfFJ4vhMJlg8ExqIuojhkxAdzQtjkTQ18eSZbj
	BFOSjBIBEwLVzce8rFL/EFooMXP5bhhg6GKO01M6sitHyketBVm8SxYy/yqfMM7sA8YzIPfeTCT
	ui77RAu0V5hiplNBk7B3Oko3IF6fcfxUvvp6/KQTd7WCcm/EXe50cjfwcnQ3PPbgDHZRxKRU4rd
	7W/oMCgG9RiPKbkBl6c2ynkOWByX2pvfVmi65rEFV+4H6h94ea37sPqtcErCmNaPGql8RNHTekX
	8LeGXalDmy6WUtwPkf7/i/Jac78ZZzFxTfBxeWjDgGAiDYeJJfCPxdOE9uqrK4jV+RCkmDjC6Ul
	GClndfNSwEhKsIy5EHlZO5hi0lu
X-Received: by 2002:a05:6a21:3289:b0:3e1:c6b9:af11 with SMTP id adf61e73a8af0-3e1c6b9e13bmr1675977637.56.1791904693394;
        Tue, 13 Oct 2026 08:18:13 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm5759888a12.29.2026.10.13.08.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:18:13 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [PATCH v2 03/35] clk: mediatek: mt7622: Fix memory leak on module removal
Date: Wed, 14 Oct 2026 00:17:02 +0900
Message-ID: <20261013151734.3177690-4-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081817_141564_97513B81 
X-CRM114-Status: GOOD (  13.32  )
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

clk-mt7622-apmixedsys.c and clk-mt7622-infracfg.c do not call
platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL,
which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: c50e2ea6507b ("clk: mediatek: mt7622-apmixedsys: Add .remove() callback for module build")
Fixes: 838b86331c5e ("clk: mediatek: mt7622: Move infracfg to clk-mt7622-infracfg.c")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Reviewed-by: Brian Masney <bmasney@redhat.com>
---
Changes in v2:
- Capitalize the first letter of the commit message: "fix" -> "Fix"
---
 drivers/clk/mediatek/clk-mt7622-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt7622-infracfg.c   | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
index 8a29eaab0cfc..fae8abda14b3 100644
--- a/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt7622-apmixedsys.c
@@ -109,6 +109,8 @@ static int clk_mt7622_apmixed_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_gates;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_gates:
diff --git a/drivers/clk/mediatek/clk-mt7622-infracfg.c b/drivers/clk/mediatek/clk-mt7622-infracfg.c
index cfdf3b07c3e0..cec19447d637 100644
--- a/drivers/clk/mediatek/clk-mt7622-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7622-infracfg.c
@@ -90,6 +90,8 @@ static int clk_mt7622_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
-- 
2.56.0


