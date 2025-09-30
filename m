Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F359CAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 08:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=; b=jVzXN5UATOT7ZUb7Yo1dVrdlAF
	M65mKVDDyZ+ovcvFrFGiDSiNBITcPzHVB7ZpbT/WCFTX+RQ0dF7vU7xZf0xVEHExsTzn/6fZrXzUi
	mvBvTXkoLnaJdxjdyvDft7tFIeea2vKmpzGAXuhYRboI/A182fYl+MPo4XGO1Rk0itrHYkSyx0fk1
	MImw86yvrjSMX/423wJp36bkoS3gtDzZea4MztDcmo6GQdQpLC0Tg/iZmC4GjjD1s5OwY1T+lFmcf
	9uOHStpQFyUyq4axMI9XUZq4tE4v3Ev+4UKe/LGF1qtlY+ULghzzjI8q9x8V+3svb+n7iuG72htcR
	13kadkkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0x-00000004gzx-16fc;
	Tue, 30 Sep 2025 08:47:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3W0k-00000004gq3-2srC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 08:47:04 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ee12a63af1so3687206f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 01:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759222021; x=1759826821; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=aTm4lZkRKDP4hQ4g80NNwktS5DHgEkh54YrAa7Pp/ObmyVrYKOHuNZIi4VM1MWvCjL
         R1k6XXxfoDgKbpaQG3GEVQM1Pzu+Vf+nKxHfTZQWg4OJv5DSEHHboNeKvJE+d0Hb4aub
         9EiMfCpKEBJmziT1AV5gn4NLK/1h0JuYB90VEBuwxbNB8ovYN+HSX7mZ16j0CDc40ZLh
         i599Amy4kA5Sak18c1NLMZSQXKoJx4yuv5s0zBuIZVxDUwpaMsV/eTqFmqdd3Dz+pVqj
         ObkmpTD3YABdtIKhkCraIXG9YBok6tkiAb1ZmrQvTR31rR6I6EHcWV3X8fKF9GIdZUws
         Jcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759222021; x=1759826821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQSp6khD66PWakk86QjUyhjTSipaHZaw5SNW0wYKmlw=;
        b=qU0eTNqOdjTlwuTbEEu4YvB2x367Ksw7sfBo8o2Z3rxq/SgYOB+6zMNhumKSWNZHzb
         JukDN3qyBntricRZ6YoNqZazsNyuUeIrrzI+r4gXYDqkSl5aZ/D3pAl2qXf/AdSOsm0F
         mcG6IWByGH80f4IU2InZz0YbmK93PcZA+qcG3MEr6NgEwJhZhhw1awywZE50hw8TtXln
         vRViWw5UWfFGQ0ZAi/2ARmMuHBUioQMEzlCt2m5dj0mruNG+mE4s3s/CoTV9Re6hl8ls
         /5EWDlK7XxaYPrmZsonYmwnIEqYoxf7J25wld+iWNqEx2RjipfoPWVh9Sakr96Q9fY4f
         9Wow==
X-Forwarded-Encrypted: i=1; AJvYcCV9JgcuQ9wDkR2BY1o6WPkl/T/pw4/46O2T+zEivph7A35OyG2xPtDdmlhigc5lWx4EcuJduZOM6/aMuo3GGP18@lists.infradead.org
X-Gm-Message-State: AOJu0YyEkB9Oxu3WZ9NbzccyWM8rqR/tg8WFFbu7Rbm+moBZfL91H00i
	XYwzfN78jCX2QaL9Y6+KRiNgd91grRRdHI46P2Cqrh2lI98sj5/FM/H7
X-Gm-Gg: ASbGncuL/vX0uY5Mi/YYiNRk1zJE/n5uPMnjCH8uosIOmFM8KPOmXv7tzxHJC8+44px
	653uZMcM+4TznwEioXBUthP8pnQjdil8Ccn4nkIYoummOQC9XX8NRg2h7JwLFvyATtA6A5bbVz2
	4f0QpCC++xxHrsPojykUzdhH1d0l90QqNmDLMrLrWH0CWAObJzHqO1eFWkNHDNGfmlRloc4dF57
	gVIKaTz6wP8uUUPikGyTy29dKcoASPqoLkiI1FxMWA2/vR4vCuhVQxO7IJPhE7w9we9iF8oEK7a
	5vGyw05ghPw5gKiTiDlBR8eEIrchtgmNtSUVBIxih+ZgM4pv3KrOryD0167cVeQKS62R5wsMqbs
	ZMHzyxBBzniyuOkvfbDsvWTiOgyCPb6QBVftryitSdIPMg1c+JLdpsUBQAauAp9XPzzWFHLHgUo
	+rxWZAQQcLv8aYSUCvNzeR46Q+hfnXge0vqdNUiWd5
X-Google-Smtp-Source: AGHT+IELjz8q9Wh4r7dTEajOLlhaehyVXuIINojrCEIqJ4/pZdMgPhXlF8x51ihCR4TA5ozMBPdmQw==
X-Received: by 2002:a5d:5f85:0:b0:3f9:1571:fdea with SMTP id ffacd0b85a97d-40e4cc630b2mr20809863f8f.44.1759222020801;
        Tue, 30 Sep 2025 01:47:00 -0700 (PDT)
Received: from localhost (2a02-8440-7149-a758-f461-9bc4-1c75-ebc1.rev.sfr.net. [2a02:8440:7149:a758:f461:9bc4:1c75:ebc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a996e2fsm282983795e9.2.2025.09.30.01.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 01:47:00 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>
Date: Tue, 30 Sep 2025 10:46:50 +0200
Subject: [PATCH v8 7/7] arm64: dts: st: add DDR channel to stm32mp257f-ev1
 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250930-b4-ddr-bindings-v8-7-fe4d8c015a50@gmail.com>
References: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
In-Reply-To: <20250930-b4-ddr-bindings-v8-0-fe4d8c015a50@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Julius Werner <jwerner@chromium.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-0dae4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_014702_788050_3144F356 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

From: Clément Le Goffic <clement.legoffic@foss.st.com>

Add 32bits DDR4 channel to the stm32mp257f-dk board.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
Signed-off-by: Clément Le Goffic <legoffic.clement@gmail.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 836b1958ce65..c4223f06396a 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -41,6 +41,13 @@ pad_clk: pad-clk {
 		};
 	};
 
+	ddr_channel: sdram-channel-0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "jedec,ddr4-channel";
+		io-width = <32>;
+	};
+
 	imx335_2v9: regulator-2v9 {
 		compatible = "regulator-fixed";
 		regulator-name = "imx335-avdd";

-- 
2.43.0


