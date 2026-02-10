Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB21DEA3F08
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 05:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=; b=uOlyRGJl6kpMaYWPu4LwQmvIzD
	8lDcg0Af0E2e+HINPQ65WN1265CIdR2a8LLRXWmRrjwca/D7IIJjMiUT4vnW0+vAgrtcRO5qAFCfa
	o8gVtuvrMAZqpqVH9xKJIVqwGJQ3q7FYEXpoMGuNntDHn2/+XqAWLpPEpegbdxRFATfkXI67VtA8p
	5j5xtYFU61xBEfMczYuDLyFdUg+VnCTOCepFF/9pvvJ+KWjvrJq9E6pFhPhl1A7iHKbITozH35ehB
	NS6LqmY7B+592gpRzuX6Co2iGUcXN4OJ63Htkk3GBS2YF6J+mFFmI1dzJgnQiy8nNLXgNYzOpeAiz
	9I0jturQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUq-0000000GUCD-0Cu0;
	Tue, 10 Feb 2026 05:41:12 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpgUg-0000000GU3O-1NvQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 05:41:04 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-8c5386f1c9fso524104985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Feb 2026 21:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770702061; x=1771306861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=Ui1xAAZjxQkD+dzr15Qz6s85gIQdJaJ+hbKPJsMd8C0U6vA/0Sfd56A6tqiQG9e9Dq
         oVwFtxK0TApNFu+hXbddrgrEqkaYY1CDeEpLhXnjVjHP7o0rZk0LWfNdhB7H89Ud7m5m
         g0G7LqW6YhhfbNYQn8dUCdF5PoVX797ZAiLzscpzipmbrDSoOW0AyHIXuH+cX0cTMjKg
         IgwTmrbhArc4j6nMJSjlnEAfUedSVx+ngZ3wTl3G/Zy8LuuRLqHvKY2W+nSrjHABOHkf
         GSGYJFMVK6NoMlxsYTVa7/lDN6WZqRchr0PFTX6mmU+G2Fuyf9/hX1nOvGurGXUlRpMR
         Clng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770702061; x=1771306861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5UsweLwyiRceTIoKAfsXCtIwJ4N/M6cF1VZ5rClDl5c=;
        b=teXykx0B5ED5NVBIz2biet6SbxiFm1kavn0AJPKAZaUglfyfcDtOmRIWp15exmRMfG
         OsWBeZiTMp1XEq+HdBYIBegP7VDk4Akacu92VUL9L2a1wMKyZJl/8azJFFczeAyXhXnf
         9H68/E/rtB+4F0/SSAaCwl10+hbMB938hOpsAfQb0fgpN4Jlo9YgUWoZN76Wyos36gV+
         U08eJFA9leZe5Ph6ZpChXK/FMPhinrptcga8KgBfjIYTaqO4IHrvNEy9bdIMn0EimW4I
         RbhscAw5FG+HPF8icC8p9QEG7nu1NkO7b1G0ZI9tMLv3u4eNGdPjnJHNKFwibnKh4ige
         mLdg==
X-Forwarded-Encrypted: i=1; AJvYcCX7C8vjT/g3EPXXQmg5se/CgcSfrZAKm7JXXkHzDbuwipklWdHq7fbYD4PVr8YyE8+t/618YZ+/DypKzqV3Bvae@lists.infradead.org
X-Gm-Message-State: AOJu0YzQSeZ0tHShTfJ56ugQi53Sem+GCOrM84DgDPmng3b+eQeLrPCS
	rhejRcqn5UYWZgobgn6P3DourZqCNtGdxAja0SQAbwBaF1omVdKDfkjf
X-Gm-Gg: AZuq6aJWgosIszdXJZT99EXXXIN+N91Pxx/6gL9dTXnxLT2DJWgqM1JgdnMxppr97CU
	7m/iHSqx6z+S37btzkCA0KFaX85tQ700R2HlNLmc+3/OF2b1VKRZZgNS/hbvhC40OoDKOXKfXJf
	N583GV4ZNtDhgnkyDrA6opg9dbcETQYy2lku8rS65yCv+p7y3zpZflrmt+cRZ844rromNKVqQmv
	OggJsHdMOsJ4dSYBnxCHo1R8ho/Op4VqEOFHjNfBqqhrNmhe4V4feLr1BXw9r7mNcmSC4INxX9V
	K0sYb7TIYcKtJvrShKyLVTzSO4Vwd8oFg0jagP6vgEHCYW+NWXeeEJndZYw7KN6l8vEYoumkPB/
	zpSiwKV3jLPJ22MM/Mvj6+bjekwlAciVxzAYBEj343PeuXR28oSKczx0ykc3u4F6uaym6XlFssG
	fnMeTFozDIw9MIBFkvg0rZyFf3jg8pbEt6RgXocFb7oFY+AlLZt7SBbXo0m5RjaYLdFOL8owrBy
	JghYy33oZV6
X-Received: by 2002:a05:620a:4708:b0:8c7:1952:789f with SMTP id af79cd13be357-8caf16e9e9emr1736522885a.71.1770702060868;
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
Received: from aford-System-Version.lan (c-68-46-10-116.hsd1.mn.comcast.net. [68.46.10.116])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee9fbasm978632285a.39.2026.02.09.21.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:41:00 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: angelogioacchino.delregno@collabora.com,
	Adam Ford <aford173@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 5/5] drivers: clk: mediatek: Fix error finding regmap
Date: Mon,  9 Feb 2026 23:37:05 -0600
Message-ID: <20260210053708.17239-5-aford173@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260210053708.17239-1-aford173@gmail.com>
References: <20260210053708.17239-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_214102_522894_667A4DF4 
X-CRM114-Status: GOOD (  15.30  )
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

The clock driver for clk-mt8196-vdisp-ao doesn't use the same common clk
functions that other clocks use.  As such, this clock returns an error:

  Cannot find regmap for /soc: -ENOMEM
  clk-mt8196-vdisp-ao 3e800000.syscon: probe with driver clk-mt8196-vdisp-ao failed with error -12

Fix this by using the common clock calls.  With this patch, the following
new clocks properly enumerate:

  mm_v_disp_vdisp_ao_config
  mm_v_disp_dpc
  mm_v_smi_sub_somm0

Fixes: d4fb7e15a520 ("clk: mediatek: Add MT8196 disp-ao clock support")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 drivers/clk/mediatek/clk-mt8196-vdisp_ao.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
index fddb69d1c3eb..070c60f40b64 100644
--- a/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
+++ b/drivers/clk/mediatek/clk-mt8196-vdisp_ao.c
@@ -67,8 +67,8 @@ static const struct of_device_id of_match_clk_mt8196_vdisp_ao[] = {
 MODULE_DEVICE_TABLE(of, of_match_clk_mt8196_vdisp_ao);
 
 static struct platform_driver clk_mt8196_vdisp_ao_drv = {
-	.probe = mtk_clk_pdev_probe,
-	.remove = mtk_clk_pdev_remove,
+	.probe = mtk_clk_simple_probe,
+	.remove = mtk_clk_simple_remove,
 	.driver = {
 		.name = "clk-mt8196-vdisp-ao",
 		.of_match_table = of_match_clk_mt8196_vdisp_ao,
-- 
2.51.0


