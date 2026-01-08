Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509DED1D494
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 21:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=; b=fdeZXwGeYYLGKrVqlID9ubtjEZ
	q9yTMXs/DgFo+j7uyr7mRvtWPx8X89uEAGcwMlBpo0snFUDA0LjvEWKBkz9CsGQ6C3YYB4oTzAEDf
	Wr8LtI+ndj2CvlmS+x7oHSAoz6emch2+0eFUOng6ygPfUa5uxdy+1C1N7m9h+XdvktLJVFzz0sVNK
	dvm9cji1LFE7VL/jZw1a8X/GfUUFfivyRbC9EUVEwnx5OBHUhPRm0SAcCnFkK08G03t+2rUTBZ6vl
	Cnr6AflWccKn2O4u584/c5fXxMhZ9qFy4j5TCv0gSdU4iF9p0bBh2okDPrAJAFM04xnyH7XDzTZsT
	TpMclnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOV-00000000sp5-2rNc;
	Thu, 08 Jan 2026 21:18:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdxOS-00000000smR-15xe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 21:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767907087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=;
	b=VX+qFbRigj1qL7X79aao1Xh4aasWF3f5rdK9+73vChpc4Fm6eepLYppCiwG39EiO2v1WSK
	RKu/9Ws9ixwjxZMSaCfSaXwmmrTK4VUXgHoDgH7bUhGYlSP00/fRZenOn9KgJccqZQV75G
	0rfj/RkJQUAwyRLTEyethOlB0ImbLDM=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-484-NYluBNoUO-ik8KTSWcGdEQ-1; Thu, 08 Jan 2026 16:18:04 -0500
X-MC-Unique: NYluBNoUO-ik8KTSWcGdEQ-1
X-Mimecast-MFC-AGG-ID: NYluBNoUO-ik8KTSWcGdEQ_1767907084
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9413e5ee4b9so9742315241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Jan 2026 13:18:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767907084; x=1768511884;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dkyJM/6LevJUQ1i5Iqw9MT8CT6XbKwep0aKDZWoCl08=;
        b=kAs6g1tG4a4Z36rVJdud5pDr4orQxdm8wES5Xb+GEkCl65uogzAkMKH2YTQSIfnKGS
         Zntbog+im2uQBzXk5Wlz3218MW1Z3tVAwEq89hr9slfVBk1fcIuUJGOMZBou1uH4EZrF
         rG25wCI4B+L57rTFjiwG/5Vgl1m51ydD2N3jTwmhu2UtrHf8/aYK+Yy+D+4HUm/rXjOh
         eiWWz8DahGCJIo5hyJTnffvqiQkREf3Jgw8/9IKXRCxmRH5Z9rQtSG6GTfdVCN0GG/dO
         hiXMGVngTQsyFfmjWRGtmdxbU79iZ74RP9l7NxRWNnHr1D06TgdOv0zdEyTpwhya7bQz
         XkKw==
X-Forwarded-Encrypted: i=1; AJvYcCUOwGKBoN/3RsbZXVPlIVrtcFYRwSEEl1SwPvggZZ7a/1OJqeNaKW5tylgT1PqeFdn1SQHYO0gKO2M0LX6uXPFw@lists.infradead.org
X-Gm-Message-State: AOJu0YxcnGOMY75s3ZUe9VDq2YpL/YGuzHlpTtRInPUKckl7XFefXOFE
	aQo/7Y/4N7/K+ZDg6qDRITtHgPyLxTTG0av9K3S8/6DQLWdiqxV/GvOXzYBsnaoYJUKrVVLuT0i
	kZP4EWw5IJwljzZrKrGPCrFx//SYQTu8ljSqqzOE+9hB50pNU6ZtvFg0snoGGvMrQxPuZRtyfh9
	qE
X-Gm-Gg: AY/fxX5Kt0IPt23109ykvwC4WqAlABLWDojXu02r0TWe20ZBHVenMA3XuqDKOyo3YGU
	6GSsD9gjbNxq3vyuv+gxGj+b6bduvZ//MG2tsp8T4wcvYeQTCtx+q7x7ckrCj/ve4+Jf8R2Quej
	q/3tU6LO+62A71GKUBKEG33E2SnBBboPGmceBGyk5NnfonGW+h+krNOV84Oki5QY3ixJJ/sWcE1
	vLYYYcqqCbQHlC9hY0+fMBSXiyR7tkKA+IH4quqG6t565YihIPgSZDcJRHF+C8SkziabvyHAp44
	EkP7rAUtCneU7F/UM2RlLm2HQDcg/fHCUaOsjMVBFTWX/v1USrxAZE3KiSaWK9tiDMwd6mKhEWs
	uWY8o0p8wYPObrgU=
X-Received: by 2002:a05:6102:3e11:b0:5ed:b56:67b9 with SMTP id ada2fe7eead31-5ed0b566b64mr2961648137.8.1767907083657;
        Thu, 08 Jan 2026 13:18:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTv5o/bKs6U/aYrJPkks/nMjbsF6EcT0xne2zBDiFaW0gV4z/6X5DCa53LH7to2F0UqpecWw==
X-Received: by 2002:a05:6102:3e11:b0:5ed:b56:67b9 with SMTP id ada2fe7eead31-5ed0b566b64mr2961637137.8.1767907083283;
        Thu, 08 Jan 2026 13:18:03 -0800 (PST)
Received: from [10.30.226.224] ([2600:382:811f:d757:daa5:b867:12a3:9d12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ec77064e86sm7623329137.7.2026.01.08.13.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 13:18:02 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 08 Jan 2026 16:16:29 -0500
Subject: [PATCH 11/27] clk: milbeaut: convert from divider_round_rate() to
 divider_determine_rate()
MIME-Version: 1.0
Message-Id: <20260108-clk-divider-round-rate-v1-11-535a3ed73bf3@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1470; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=pxUCYfGPS2BABWCqUrnX6hbF+k2ODFPNH4frKluoHeQ=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDIT5La/f7qD8a7AgxkHd7gskGtfzVX2SSDR/Z/Wd9Em5
 2t7LnqzdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARfzFGhqUaF22Xrtn94lDT
 51UL2Fr6Ze//YNqZo+18xLV3rlmwTRgjw5L+pzPiOCQ2rTeq3vU0bcGrtuv6na9mTXWacuf0JJM
 fcdwA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 76qZwvqlFzvIzgyVQhwnECoLum3FNhx7rR5aUhAeyS8_1767907084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_131808_911443_11060B1E 
X-CRM114-Status: GOOD (  12.88  )
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

The divider_round_rate() function is now deprecated, so let's migrate
to divider_determine_rate() instead so that this deprecated API can be
removed.

Note that when the main function itself was migrated to use
determine_rate, this was mistakenly converted to:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value.

Fixes: 7b45988fcf78 ("clk: milbeaut: convert from round_rate() to determine_rate()")
Signed-off-by: Brian Masney <bmasney@redhat.com>

---
To: Taichi Sugaya <sugaya.taichi@socionext.com>
To: Takao Orito <orito.takao@socionext.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-milbeaut.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/clk-milbeaut.c b/drivers/clk/clk-milbeaut.c
index 4e3790b7fc9064484c20a068d0315b8fc8241290..45389db652e04e3c30c2a64da63b047b7922b8de 100644
--- a/drivers/clk/clk-milbeaut.c
+++ b/drivers/clk/clk-milbeaut.c
@@ -403,10 +403,7 @@ static int m10v_clk_divider_determine_rate(struct clk_hw *hw,
 						 val);
 	}
 
-	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
-				       divider->table, divider->width, divider->flags);
-
-	return 0;
+	return divider_determine_rate(hw, req, divider->table, divider->width, divider->flags);
 }
 
 static int m10v_clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,

-- 
2.52.0


