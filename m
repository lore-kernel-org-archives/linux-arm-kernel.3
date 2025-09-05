Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2609CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 04:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CDKUZ+NfM3JX1RChza494Nr3RLvFGvqX6wYQsX8aNA=; b=jb+ILd+BADGqsDoLmob2nPoPvX
	g3819SLd5aURXhKXOds3t4Eh1uaifknh+sGft8TwkQvz5LCoQ80873kvWObpulhLOGe0akVw9sl4o
	2zPwSc8JiXoY4fV0tDc/+bJOV8ribi1qtx++LJgo6W8j9cyJ1TdARFsco1ZtbrsSsIaiBmw1NNwhc
	OljUxZUnPmdf4ByEdFq8F6dlSRddFsDHb1mli4dLXktFscM1vvP/ctMPfmyGUvcpT1RSVKRDW4Ykq
	RbGBquEW/o5dHs4NAg1DHdzSpkRHj11nMUiD4kN6rjYADXnXYif8sEqcUn0DnbkEuKKt0CJpfxqAh
	CFzMXgtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNmz-0000000GecU-0yMC;
	Fri, 05 Sep 2025 04:11:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMdd-0000000GIOg-1B8a;
	Fri, 05 Sep 2025 02:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6CDKUZ+NfM3JX1RChza494Nr3RLvFGvqX6wYQsX8aNA=; b=i6J5YwPZRciAF8rT4oJTr+Mta0
	V4kxmGdBDGu6Jpx+gNCYbMGXpuzO3+9ubpaKOluEiCSayqfhZc2zIwVxvJUlMJXHCYwRz5dibX1y0
	NRpL+qMTIiZvJfu5M6XYsHo7AvkI96+kJsYdzKzXMr1DQ6w54Srqn297gd0Mh3LaVGfVzXbzhHO1X
	QzxXh2II1bzfo1lj4AhZjxn2rIxmG4Yh+isblE3nlpUpAJpeS+AdMmyCXqwEmipSKnAHVyAn02UCe
	p5PQj0eLoIepqi0X1XWFB5tz3CG2isg4GriYoC3w17X90E41dOiHxOqWL+IBo+xA5gRHW9p10tMHB
	wCo4MF3w==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuMda-00000004SWr-1BPp;
	Fri, 05 Sep 2025 02:57:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32326e5f0bfso1430941a91.3;
        Thu, 04 Sep 2025 19:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757041035; x=1757645835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6CDKUZ+NfM3JX1RChza494Nr3RLvFGvqX6wYQsX8aNA=;
        b=PHLuUs0ISFhHAisHeWxtDQL8mCH4xZ7TwVsTHDBTMFBhWx87S0du6TbeyoGLgUgsWr
         PN26JeWoz3uGpMhBb3qKj5eyr3BCMKfktSNlJtizu2wtq/hfQWnzHKIpJblfAAoo0O4U
         aHl9BpKVcd0oqHKJ4hv2t/Po3/d9Q2Jw9pihIUix9k1XkMHVEZwW1SCZ+bcSrq3shW+E
         2oIIsgCfhvaEnTMoT5JZ7TulKtxIVEtPkaMMIEH8X5UDdEkeAMRvq1og89a3tz3Niw+n
         7MhX9BdHV8aqm485i9ddNNMFca3R4wqxqa+EQLvj+SLBVFe71sQOrTAA+QfiqP5RVvxF
         YRhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757041035; x=1757645835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6CDKUZ+NfM3JX1RChza494Nr3RLvFGvqX6wYQsX8aNA=;
        b=fk7/CJu2K/C4VOGVabGdScxhizXjXMhnhdH3kyNTl/Qr203jhFe1owiudMEVGbsTgZ
         l/L7ve0vb+e8KJatWfaLaKutPtT0VpPT+vVONkaJgIY87PvpVxro1fSFFOps1KUa2klu
         kfQu+9Ytm6cYENPHEXDBDBjGKPDoq222NNMTEL+HroLfxZezSqza+G5wsTTa6te06g1L
         uSbK6I5Jhd4sZSlTCO/ZKs7+W/t0GCcGrc5HLKMEw1OEy4b1f8S4tY15ioFRn/M8NN5P
         /cQHZUa6BWEs7elfYDeHO+evnNNWRCGDR3BJ+S3LkcxgsFcZzT1nrBEZ+y2nTa4r6qn4
         uYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVirKaUd3fRuSZu2mOeUzpz/40m9NcF3x6bCvoodXwv9OAimNtnnSyKBewn+ufi/m8x2AwxyqRGd9DxOanHAIQ5@lists.infradead.org, AJvYcCWHfAw3Pi+kM43DsYVGFeuhbzI2kKoGGetl2+MR0z0p3Vdpi0GWlvNHIrvA/nxBK7meVAa8YjmRtvu31x2P2kw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeRdeK/9ZHAv0o+6VoYDbzAwYOALIscXpzZ8kXUorQCi/dCER7
	ydXMa7lvYglTiOFmjdF3Zej2CrxniSRKhC87DvvlJRpleETgNgNZvSNQ
X-Gm-Gg: ASbGncugKdugDcDqN9HONZS9s9mtRRRNhfCF0lolQgJxq/X1b5QMhqRDtIjMHFL/975
	LNerIlpY3L91VpUXbv3gLqYeLBuNWthb3wlm/BZvjkhIGlMG4K/j/LSQpokNDEtlnxEpBRydzTm
	pmqeVjEcPMghzTqBifetK/Ch6Ui3F7i0qO01uJ4NyGznxRbwgYXxQ0bHhAmW5/Pywvm35icecBl
	nqDab75ewYsfOH/kNe3ooCTDAl+Owy0mj5BRTLyHagAM//lS/+d26aC8VTGHASqyutcfLX6BaFz
	eSGo1z0rWnQW54v0gyYQuV0lpRp3mNyg0rj3i5Y6clDm5oFWzpGpqjGGkr0KY4JbIbEtBmY5ImF
	5TTFDLn0Hmj4=
X-Google-Smtp-Source: AGHT+IGJPBg0Z3/hlijieYcTeCP5A88enc8PD4RQPi19VQkilqYW0HhiucmQtmvJoPxoGBg88j1vrA==
X-Received: by 2002:a17:90b:3d87:b0:32b:65e6:ec39 with SMTP id 98e67ed59e1d1-32b65e6f260mr8994261a91.21.1757041035560;
        Thu, 04 Sep 2025 19:57:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:ce20:10::d4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-329e1c8e07bsm9428588a91.4.2025.09.04.19.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 19:57:15 -0700 (PDT)
From: WeiHao Li <cn.liweihao@gmail.com>
To: heiko@sntech.de,
	robh@kernel.org
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WeiHao Li <cn.liweihao@gmail.com>
Subject: [PATCH v2 4/8] clk: rockchip: use clock ids for SCLK_MIPIDSI_24M on rk3368
Date: Fri,  5 Sep 2025 10:56:28 +0800
Message-Id: <20250905025632.222422-5-cn.liweihao@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250905025632.222422-1-cn.liweihao@gmail.com>
References: <20250905025632.222422-1-cn.liweihao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_035718_499340_89F2B786 
X-CRM114-Status: GOOD (  12.26  )
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

Export the clocks via the newly added clock-ids.

Signed-off-by: WeiHao Li <cn.liweihao@gmail.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 04391e4e2..95e6996ad 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -526,7 +526,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	GATE(ACLK_PERI, "aclk_peri", "aclk_peri_src", CLK_IGNORE_UNUSED,
 			RK3368_CLKGATE_CON(3), 1, GFLAGS),
 
-	GATE(0, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
+	GATE(SCLK_MIPIDSI_24M, "sclk_mipidsi_24m", "xin24m", 0, RK3368_CLKGATE_CON(4), 14, GFLAGS),
 
 	/*
 	 * Clock-Architecture Diagram 4
-- 
2.39.5


