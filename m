Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F47CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=; b=TkymknJAST2DQKUrUXS2oXQ8mh
	4xYQVNA6381jP36xx7Z9G5GEs7djMs2U65zpnWbJ1Qv82YnIsWHZ9tHO8WFyc6A64JXYeE3+lnGRA
	EcMzbFfIkeRAwkh2gEwzciq3QwQIguO00UTa4FSAb6qg5KDW3IQ1Ms/fsyppI1b+RsQRv26PG/qQ6
	BlfV2Zsq24POowxItruyWScxWQGz1489Aqwzj74PW1Z1w+2AstGAzQYg+AXmnvy6Gy9FruXA/IP7C
	zMl/dTjeXeAcGaH+UIBUiioZWHZYcXM/bPc2aLYAqgBvIJCoNc+M1X+9xrEp1gzB2k6CCuE0h0pU5
	O/tsnZtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uromY-000000046tu-35N9;
	Fri, 29 Aug 2025 02:24:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8i-00000003tbF-2Gdz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
	b=MeGgwKpQP21PZsdWaN6D4jpcm6dfE5nqwlb54zjGvXv4A9udiMP8hgnZVjYdy/fyHV9ScV
	ixetOv8JQ5HC7jVyFen9wO2Zrwq22Hb49sGRm/MT+uFc8MtehsmMKCkRk0pd7Ld58AnHrM
	fquESkcqppgE1kmjvZqxrbZ06SmG3mY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-SoR7UYzjM82e3kZu0qBpxg-1; Thu, 28 Aug 2025 20:38:45 -0400
X-MC-Unique: SoR7UYzjM82e3kZu0qBpxg-1
X-Mimecast-MFC-AGG-ID: SoR7UYzjM82e3kZu0qBpxg_1756427925
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70dd6d255c4so44327566d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427925; x=1757032725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQVjNKRtGeYd79k9EsHTPhO8iq2mtofexnH8gr3Lua8=;
        b=W/KqUi2yovh2z9QXRZeLXeQYq3Tcemt8av8SrKRLqC/nNW/tU4I5CrMfS0vgEFyT8Z
         Z0zRAX7rfKhienX8Lruxu2m+zxPH/aE0P6bea3a1p1VYv8M2xVGhDBfQS5YInZL3Axe+
         nRFnQWH3zh7nwYYCYWHM46VGMwe7BXrkZiWDUE8GhCEm7Je2vtsg9/C6jE5o5MY8iA/d
         70sPbcUHFEXrJ0bD32b/0V7Rxp663kMMKbG9asPZSwmGo+2eo9svNLq13nisHFHx9ZKs
         6+WZ3rN8FDjwhYSZzVTmPkhPyx26fkHhD8JbpJgAKpf75morY6Kq+WE281OXplQdgO9W
         eLKw==
X-Forwarded-Encrypted: i=1; AJvYcCXCHbb9tSusoz2NQRpJXWb5Uw9AIrg1ZdYDRHE4dZEsTiLc23sHObIaCgbKJzOzzvT5enkB2E3S0CK4idNGOAZ9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2f9fJ2nlwv43xdJarcDL8wccY1FLysjGtcwjJto3sq4LXVyxI
	83EEUE9la7nYJN9//ak+/ny0HqCHdNxX+7dHmwJNyNy3qVOez4S9ksHsL9+GzJ+RRCRQHBaBOQo
	rKd9BPaoKbkimB1LrZwSmKHpAjCnBNU2FlSmk3Raka/kgbM0Jjewv0GVafxqZNnLDMdxbilQylC
	/5
X-Gm-Gg: ASbGncupqHETUjzyiWRfARhwFLX2h5tl7+WsYoMv60LRzrqGcjwZkqbuztePfBGpoyn
	N9jB9nU7tfRGSLqzsHJ7R10o/D0qxS/iGVV4lnE4S1g8GNhObwonRHRBFQBOLG5nCHVDpzU8276
	Bc3Z4mgCPR40+2fGGAAUJqy90+plepDIsUf0QEZjUbLK0sPAgtQmEsTIz2VUID8qQ1b3Ewx2BS6
	cB8fKhu+p3I+zWHNkgSHIIHSsUeK1UvEaAxQVWmqAOJY/qEEIrvBPVpBZwHCSDonIZDHtf9kT5N
	DCtfKYyOmDAkB919wrAehBfTeHkjynElNo/cLktIPIWFl9fOhyOdcBoj5IRepvXItrh0bZ1GqYA
	ynOuTC/kzae8cl8aJevjPAzR83MlpWAyWWQ==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926576d6.3.1756427924880;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFR8adeLmPp6i8NPj//2LYlvbZ2JGvJAUD70v2I2NLKTSUE6nmwskQ+vGH0x5SgjqCGSE+qBQ==
X-Received: by 2002:a05:6214:cae:b0:70e:782e:b23b with SMTP id 6a1803df08f44-70e782f22bamr10926366d6.3.1756427924487;
        Thu, 28 Aug 2025 17:38:44 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:43 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:22 -0400
Subject: [PATCH 3/8] clk: rockchip: half-divider: convert from round_rate()
 to determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-3-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=1835;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=lRErUXfhlVyOjMePggfg3EacyZAvSvm+w3vZGvHjG+s=;
 b=77L/EGAGdRYd5Zfk7wMZPiUoUyEJ+wFGI5TKO4e9gl+bXy3dLwkQMeaRO1HRElJrc9TAOKFe/
 f1vZeXk72u/BkLnWKmAly+0tQG9J1VwJ/BPTEXNwrw7PqrQdgLjH3+M
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OmKY-S-Jd7Mfn6gy7IwinF2bM8W-MiQoiFIsCKtVIDo_1756427925
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_173848_663473_4E04470D 
X-CRM114-Status: GOOD (  13.61  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/rockchip/clk-half-divider.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index 64f7faad2148f27099d1ace36da45207e2315a1c..fbc018e8afa44c87a5a7b53475fc98b318ce1ec8 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -92,17 +92,19 @@ static int clk_half_divider_bestdiv(struct clk_hw *hw, unsigned long rate,
 	return bestdiv;
 }
 
-static long clk_half_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *prate)
+static int clk_half_divider_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct clk_divider *divider = to_clk_divider(hw);
 	int div;
 
-	div = clk_half_divider_bestdiv(hw, rate, prate,
+	div = clk_half_divider_bestdiv(hw, req->rate, &req->best_parent_rate,
 				       divider->width,
 				       divider->flags);
 
-	return DIV_ROUND_UP_ULL(((u64)*prate * 2), div * 2 + 3);
+	req->rate = DIV_ROUND_UP_ULL(((u64)req->best_parent_rate * 2), div * 2 + 3);
+
+	return 0;
 }
 
 static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -141,7 +143,7 @@ static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops clk_half_divider_ops = {
 	.recalc_rate = clk_half_divider_recalc_rate,
-	.round_rate = clk_half_divider_round_rate,
+	.determine_rate = clk_half_divider_determine_rate,
 	.set_rate = clk_half_divider_set_rate,
 };
 

-- 
2.50.1


