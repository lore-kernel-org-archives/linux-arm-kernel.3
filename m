Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3C9E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fXkOgCi8HIHQGsuWXYvnWFeub+37cwugFPfSGaOkH4k=; b=XpUpVliVDd65HVTBsCi9ime6+P
	hdtfCzQFcFxLP94th362j9j8o24qIseh2jchWcwul6SmCw+wqo2Le97zxTxUgNIuzzv8KUHah5JxX
	7JsVqR02TqwTSJd9DFlzvojcTqpjJZlWZhlKR0O/boJ4npUolrWYXVrzXBYCBvs4hP3h1AoThxCuA
	GqnWEw3fRfW8CEkKf1540zXuQ5xiOJQwpgE14KQdoSI4wwXazfVpO8NM8JKaVav+5VN/k7McvIsqi
	9Trks+qcB/QcUn/tQWtmP+0PpMG0xWIU+ap0gDttEkHLv1X7vGZVc+DGU31Wlq28zd4QUK84hhxDy
	oPiAkoag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGCw-0000000H3MV-1JVE;
	Thu, 05 Dec 2024 18:04:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGAw-0000000H2yL-2IR3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:02:07 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-385df53e559so975539f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 10:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733421724; x=1734026524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXkOgCi8HIHQGsuWXYvnWFeub+37cwugFPfSGaOkH4k=;
        b=ZwrUnxvGfxyaw4lO8+vwcO3TRFcQGcXYvCK0tLP6JXgssc3iZhQsGsAreLaclu/pH7
         5zGgMjLuUCpKtkKeg1MdhRt3Kgyst1HTsDyPdUfhWlsBE57+qz6ebe//RIRzP/PbN8gi
         sYfO/Tb5r5JT5YiJA4945WcU8xBlAZBBk6FMUCpswLQSdXeAye0AvFZJ2XuitByI4mEv
         XQoyOQPMyygadYWvHoYlU4MbPpf550y5tq2oJT81XLHKjL7fLEDQpI3N+/QzHAWtIK5Q
         5FLeEQDRo2NUpdJ5Le5F3EVAd+vezM0aZrrtWfH4cetzvpTzVV1pjrbWaPDNLZdi5abe
         ksVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733421724; x=1734026524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXkOgCi8HIHQGsuWXYvnWFeub+37cwugFPfSGaOkH4k=;
        b=kmoXXvwO3yehHVONHUzXfbsSfu3Jsk+0Aj2v5Tvem9P1u2nAkGFLSb8VdcL5dFZuk4
         Gvgrpn7dQa7I0Xj+56VZ0+JZ6Vqe8su/p6yb8DAAeoK1BY0fGgFj0ecrbX8eu1MvyP1g
         eSvhviTCE4FUU/5NqURarAU4Jiqh3M1hNYppDE0NYFVObzdlzxiI0vJyIfurWrJGodH2
         Pd/4UIoUYuDqylBz0YYTvXA7c5goGVkIoZAU37AM2FguhuFavFhdgagWTOUJi7UACC6O
         j/Gd+JPWepb4HTTsM5d7kHbx21VP01SIYNLwhTiMvuMJdJJetTHpwMVXHxqbG93IE7ep
         bFFw==
X-Forwarded-Encrypted: i=1; AJvYcCV2eJFEKGaRg7YqUs7oVJ9lAoq6srKRZhF2lmc3jGGXZaJIK6GgHM7OwkOWQvlMuSioJOoqhSZbw2CqsH5IMlxF@lists.infradead.org
X-Gm-Message-State: AOJu0YxZTI7A8p1lGqin888y9sOm7ahNHABaOzT0x6fDbGW/k6GW/NXH
	yw2D72QkAuQLunIOxsGn+2BZ95vPRDSYf6Yuuo518s7GNuXM8WJwCbFrgynzjHY=
X-Gm-Gg: ASbGncuh7+fr8rB8eEjUb4wggAfHtkFM4/Xqq+oBwbIiBcBBHl1yLl5Buaw8/fsdFfD
	rLzV5MNuSpuewEW7ZF/2RNGP59Umf3W5wej+Fqoo1ciVe44DCsauyMHiqEjhbTAJT7pENk94L/s
	Wt7q6KabRS9MPBjxQJnYVnZVCIVya5WjpIy3qu2McxMH8b9FCN1hZgmnseR2mBi13QD/E3F4f/r
	prYFpfnaxBd9jg/r7wnZu5C5bqVamzxyvk477YFAShVphsour2jPXbo0ZNZ0IBo15XYBZPHQbjp
	x7Db5jv3KSQmTpjY3z5TVHNKo4o19WSz
X-Google-Smtp-Source: AGHT+IEPtZMmft62bUPhgYrLR+oDZpiHUMZkgxHhYwyxhO4GONqKTULpT/JUlhKvm0dRtGKR4n2z+A==
X-Received: by 2002:a5d:59a6:0:b0:385:eeb9:a5bb with SMTP id ffacd0b85a97d-3862b34e5f0mr30744f8f.17.1733421724237;
        Thu, 05 Dec 2024 10:02:04 -0800 (PST)
Received: from ta2.c.googlers.com.com (32.134.38.34.bc.googleusercontent.com. [34.38.134.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386219098d3sm2618228f8f.70.2024.12.05.10.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 10:02:03 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	peter.griffin@linaro.org,
	javierm@redhat.com,
	tzimmermann@suse.de,
	daniel.lezcano@linaro.org,
	vincent.guittot@linaro.org,
	ulf.hansson@linaro.org,
	arnd@arndb.de,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 1/4] arm64: dts: exynos: gs101: add SRAM node
Date: Thu,  5 Dec 2024 18:01:57 +0000
Message-ID: <20241205180200.203146-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241205180200.203146-1-tudor.ambarus@linaro.org>
References: <20241205180200.203146-1-tudor.ambarus@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100206_583890_38CD0073 
X-CRM114-Status: UNSURE (   9.64  )
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

SRAM is used by the ACPM protocol to retrieve the ACPM channels
information, which includes the TX/RX rings among other channel
configuration data. Add the SRAM node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 302c5beb224a..1441e9a252c2 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -269,6 +269,14 @@ bldr_log_hist_reserved: bldr-log-hist-reserved@fd900000 {
 		};
 	};
 
+	apm_sram: sram@2039000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0x2039000 0x40000>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x2039000 0x40000>;
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.47.0.338.g60cca15819-goog


