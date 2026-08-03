Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF951C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=; b=j7DQe1HRKYr2oRRw7IC4UofMEA
	tS/qdOMDE1k7ZkBazh8sc8tKHPTnS8Gs6W5V6Zo5tP77hV1CamF9l3rV1EFBYhPESrF7NiFnviRqa
	mv8wa/6ln2NeMFrqWYhgpUBPqR0EckyI5V0Ub4ThUCltnjScUWX3hZ3jKXkvAOfpFixPVukeREfdi
	dMlCPAgVilVObyH8gv8fL+MbS5jn35d3WbjPsWq0mgOBJb+jW2Q1Xz9Nv0I2cMuYsZ73+SDlSnAjZ
	vVedpOcPwDqSBqFhmikEDqZ8YOp+wpt3KJhBs1NKAu6xlir2Pku+b3sJNXN4nmGN8kWsETjL2PiJa
	EcDAoGIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUM-0000000HK4L-1dGu;
	Mon, 03 Aug 2026 14:17:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtUI-0000000HK0A-2Q9s
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:17:56 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38e58034d05so3406722a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785766674; x=1786371474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=VanrsIfAuD1Cscnn+u13JpZvhanzosSN2CjcmQmhLj3yuKHIKG6+ryOk0KQxlNQ3ni
         jGnFmzlFwUvrx48zkPZNp+hUrufQplABqrrJIfTxZKVBBQWTXWqtnrh3WVSyPkFReZ+P
         4Qc/3KXtQ3f+cuQNpbaogcfbxRVkwBRIZWLhD2dAVMW5K/cL9DePg/VzGT2RdWywoByN
         Lnqrp6NGHEQVZoZqKZtSXR7DQjYHBIW0Ljr41X61E3q5AEu9k6x67GEbfDSUAERlp/DV
         w+tMJH84elMAdn+O5X9e4/FkkwLxoa4IuPy9fqpocvvvjSG8hEOoG0Mu8zCo8lVB7U7s
         mAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766674; x=1786371474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1YUTKcwC82n8dRAk6Rq6PaXfV44JobcORSU/s+vRUxE=;
        b=dIegubGmgh2hhuaO/8j5R6Dz7TWPeb9xTw3Uloe9Fwmx1ai7VhK9rO5vFmU5ll6/pr
         wWICJEKSjPQYL6LBPJ71j+4tH3MUDugdwREc0nitLzqE++cXGjySHDLrCQCdVVmwezQT
         k1aKh0gAg8uhcVDLdKxQ9ltn9opbwobSyaFCcakLQwi89E0d54rhLw+fsvFR8yFcZW1j
         JTZbg6jWC6pYNprG4O5GpWbeSR3PgSYN4waE+JXOz9nKOPHRv5WPLp5BKOiRqq5aYz18
         TaODXc1Jwcq7oU1MObg7yMIg0gjQC/9l1oTOirljV3pZQhBkHaX/Md3MrSJ/vtPrBrEA
         7Guw==
X-Forwarded-Encrypted: i=1; AHgh+Rrypc3bHNQOSyuJbKTPVO27AAy36AvPDOio0jBvQ2gnUFYbuX6SD1Zfo5d28Ph30WfWpxhHu1aNJIGWXKBB5k4V@lists.infradead.org
X-Gm-Message-State: AOJu0YzlA/ZQkcjSCYuDYna/zoqt9uSdBmO/Vgs0AY2jI+QZrfSapQ5W
	EkqYySNk/TkdSUfL6PtFa+BKv1sbYXOfNqmhhTcRXInYwMpXQxnLgirN
X-Gm-Gg: AR+sD13dWp+5is+AYIfMkPO1kgFNmRBhsWj9OV5mWLLS6tLByGxOQxlB3rpzNOGxqJI
	o5iQu6Czr45dtO3vBxAqXO9V0uZ/BNnJMWeLa45y1VzmbhaMumgetMqicTttiXj95s/FR3grvZn
	tUA5VG2k/O15xw3K5WNAYu1UNFCygjqdKPubZa5evPRcAPOJmbyXRHi9tQr8RX0481Rqr9qjH9L
	ul9UfU81Sko5a1C/OYeRsSV3/SQQDkOufeBEJWKwnOv2xvz/lPLfopgJLhj8S9jO6r1fttEv0X6
	uIYAwngplUArYtr6t+zgW41e5n1tGY77U4jvAcAYWuvqYbrkUk4M+HA0B+GurltZUgp0ehOuDIu
	yUSQobNTPT0aBNtdVwkYITZ6TF+1wmPfCGnDZMS1T6b7WJX7VwgH8SnutPWbOnNIycJWxcWNR3S
	AwESSvbz/uuQSviQveuLAQ/V3ZyrGSZ3ANZ7Pt5OOsSxIMSwpIy2IrwZ1S0wNNpDo0CsaRe8StW
	2nUe2Jq8/S+z778ghLplU10NiyUNME=
X-Received: by 2002:a17:90b:4acb:b0:38f:aab1:5148 with SMTP id 98e67ed59e1d1-38fbc4313c2mr9516829a91.13.1785766673989;
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb30dff2esm4078462a91.13.2026.08.03.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:17:53 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Cc: Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_)),
	stable@vger.kernel.org
Subject: [PATCH 06/32] clk: mediatek: mt8192: fix memory leak on module removal
Date: Mon,  3 Aug 2026 23:16:33 +0900
Message-ID: <20260803141659.559129-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803141659.559129-1-akkun11.open@gmail.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_071754_624015_B9827E02 
X-CRM114-Status: GOOD (  12.13  )
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
Reviewed-by: Brian Masney <bmasney@redhat.com>
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
2.55.0


