Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8084E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=; b=RdVwRKglBfuiLM8iu2t6lZwyDz
	4eRk9U6NXNFhFHHoFzvvw2sEAY2yF5AZyqiZSHdGts1k4fJO6bFwpFJXUGdH7yZ1uYZqzfk40jWSz
	YNWYVJOubn4Urh09OUkqlEWykRG2SuBXM4rz3xH1c16yOOVlLAkYzeqrwn0ybOgxN9TjTO0SGiaFA
	5VRQRrIjzSAd6Q4qN0U9y5BNXje36h2T0ft0zQiyB5Ty8WkfBxpm05z/9Flz0ItC6rDuKc7ds4xw4
	GWF07fUOXh2kFUFejR44hr8rWXWzQiTgZotckqVYl+2mNp7NQyjy3cp2nG4OWmMPkrnE3HaZ09n9N
	pRTw2Jzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfMI-00000009lIY-2JhQ;
	Mon, 23 Dec 2024 10:08:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPfKv-00000009lAN-2dSt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 10:06:54 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-725dbdf380aso3151732b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Dec 2024 02:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734948412; x=1735553212; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=;
        b=QpvBwFJYSyyVQvuPxkXYPgq8kGxGk63L6CObSiJ7SsBHOY42kv19XStaPXYmmREon7
         MZdV7ZYRVxGRlXf09J9Z/3GEnrdgh0jG1nwnBlJqqYKIqwgSERhbxb+dp3k/eK/rRC55
         gDjNtOn89081W8Uv1g+1ChPLpM/BSdgKAXe+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734948412; x=1735553212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rKJMfhcCNoXTKKqxRI259jRf70U4iL4YiCuA5Aw9wgs=;
        b=PgQvzFJvl4KOAsDg4+f4Dy9FOljzHfVoHlsvpakEz8bZ/S/wnQCIG5wO2lWa6jlnmI
         VL/oLJLtKEzKSsdnhHl61BkNcNoWktPfMdtecfJ7pxYOFpj0iL2ERWflgJ4qa2Vcih3p
         fMPU3mvkUTXmziChk/e8NdokIEQMSSE1ALcVdNA2n/wNTzY5dU0LFtlQ4rr5wqmmKeH3
         g1Clg2ZOKGtuxHRR6cc5IMyhK2RuuJ1XvUT0b6eB5G9ENDHcUAmyyLMLB67WZYU9i4H5
         peN0csee+WtbXRjMJPhJgHi+3PCYqriUmPWYtzTiZ5tksoJVPTtCCsVHkp2Y8H4vEvu1
         wPQA==
X-Forwarded-Encrypted: i=1; AJvYcCWHfXqmHvcAmqmUNXfqMgstloYOe+zNh9EB4Ca3b+3NP5ijzzOzmMh6T7Ochg2AKQ1e8HGDau0cC25hsjuQWihh@lists.infradead.org
X-Gm-Message-State: AOJu0YystVjmkE8dJK2KAWFW5MR1govPA3FVmEbBFZusgo5G2KGP5Pyi
	xuGcsz0raaCx/Hb/TkUAx7t2OxYkK6esCzYmzP4wXy8dZ9toEooK+85JC506Zg==
X-Gm-Gg: ASbGncuK7cIGDolPQhizMEwouHppImPoKcutzSUDUdH+PNrGZh7X6+lke/657RV84SX
	lnjjPbIAC6AHyExvoP5Dmn/syDawHS4sQ5MUZ/FlkghE+TWHBpRlSJoT8wKnV1OhTsj39uAJDPR
	L9BJlHb00Sf35foSoy85dUUoNoo2l7y46qn9qwdjvF1Wf8q7axHGmhqkKtb8wI40qrEAficVl+c
	II/P2sC142Qy4r0ld3EeLRMxfzFnzhyYDK8EOgYNXj7K/SMDXjJU2InzyaD7whJHQQey8FWwP4=
X-Google-Smtp-Source: AGHT+IEC6g3dUwbOwegr0/4cBA+q8wZywCWC8uKKvs5wuQPerkiACHzmCx3kFeGTvXXS9OP5fvFOwQ==
X-Received: by 2002:a05:6a20:e68e:b0:1e1:becc:1c81 with SMTP id adf61e73a8af0-1e5e0801191mr22582243637.32.1734948412492;
        Mon, 23 Dec 2024 02:06:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4fc4:9ee5:ceb8:cb2e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72e61sm6939475a12.3.2024.12.23.02.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:06:52 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] nvmem: mtk-efuse: Enable GPU speed bin post-processing for MT8188
Date: Mon, 23 Dec 2024 18:06:47 +0800
Message-ID: <20241223100648.2166754-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_020653_700941_525C23D8 
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

Like the MT8186, the MT8188 stores GPU speed binning data in its efuse.
The data needs post-processing into a format that the OPP framework can
use.

Add a compatible match for MT8188 efuse with post-processing enabled.

Cc: <stable@vger.kernel.org>
Fixes: ff1df1886f43 ("dt-bindings: nvmem: mediatek: efuse: Add support for MT8188")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

I'm not exactly sure about pointing to the dt bindings commit for the
fixes tag.
---
 drivers/nvmem/mtk-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
index af953e1d9230..e8409e1e7fac 100644
--- a/drivers/nvmem/mtk-efuse.c
+++ b/drivers/nvmem/mtk-efuse.c
@@ -112,6 +112,7 @@ static const struct mtk_efuse_pdata mtk_efuse_pdata = {
 static const struct of_device_id mtk_efuse_of_match[] = {
 	{ .compatible = "mediatek,mt8173-efuse", .data = &mtk_efuse_pdata },
 	{ .compatible = "mediatek,mt8186-efuse", .data = &mtk_mt8186_efuse_pdata },
+	{ .compatible = "mediatek,mt8188-efuse", .data = &mtk_mt8186_efuse_pdata },
 	{ .compatible = "mediatek,efuse", .data = &mtk_efuse_pdata },
 	{/* sentinel */},
 };
-- 
2.47.1.613.gc27f4b7a9f-goog


