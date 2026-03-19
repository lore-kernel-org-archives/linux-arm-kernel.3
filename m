Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0231088E70
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Il56uwMYRNYHM4/txQtsEb+JihX4ClDkizD3sAPU90s=; b=ePzaIo/6ARIT0EudJ10WjGNYcu
	sjbZxecBS7a7wzdJcZ5tBugeQXgebuT/8Q2Db7uXHxb+igeH/GzO1MwGYYsVG2c48oraqjrcMuzho
	dLEecORAKwT3BkkDjMG04mAZ5R6OQHA/9IUZnW0mYOg1ByxkMsci7LQv2JHeV7oA5TqVLIA2XYjz9
	7x+3dZRDjHRV3/HQDxJ9zGVBFpfqHFZzBBp2kaZgf0WgerHOFOeMEUenErFkS7N2eEy46QYkuI1g3
	7GH6sZd2z94xl/GZgJNjWEgcS8xg3izTWL2fvBHx6Zj160EzPqw/Z17KGzPkRKoAcWwjnqMGGZKd/
	DPFB78YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SM-00000009rLK-0Orx;
	Thu, 19 Mar 2026 03:53:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34SE-00000009rIA-04YK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 03:53:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35b98def50bso216338a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 20:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773892429; x=1774497229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Il56uwMYRNYHM4/txQtsEb+JihX4ClDkizD3sAPU90s=;
        b=guFxgnjReoCGtLnunNPlydehUh9OgoQMP5oKxJ5AOE6x3/T05OKrfafE9guaJfPQsl
         6d77j7/PVxjasWjxFPjpRhQ/TrtKLRbEJin8hu++nrTmrNDLsT8PLkVvy6HvVtjNIXLq
         iP7pY4F4jyki0HC3enpICX5mtR4fjOyv500r854/4EEnklU6Vc7Mxp/P1F1QeBf5PVbX
         2yKS/T9Ql8HJUTZadlFNOh6hUKGxeclr77m+OqzaY25WPc6OhA7ybySqVjVD+C3cxquI
         PvYARdsMTN1mCrYq4fj/Y1gKfx4beO/sZvJp3PnQq+fkegJ/voajwldZUcPrpXGKrK2t
         5iBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773892429; x=1774497229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Il56uwMYRNYHM4/txQtsEb+JihX4ClDkizD3sAPU90s=;
        b=SysWw6iUvvzLssTjpgh3K9jaYEOAqwnd1KgJk2n50SNU4lhJ1zS83SWTEbMqO3ywFC
         8Y00SAC6UdI1C8xFRdWimabUsBqCL1H5XwoqKMxwyZheLy4ZQfNu8kDO6f/gntbDAVUM
         n53do/CFkMcnR70P2Dn+pcd2ELvSnyGBa1CnZEsHnWyXvb7AubVrlPzhwXZKr5OiuVCr
         SB9+xjopgqSZH0acb/OxtvgnhRamrlyAN3NsRr43xIGjE8oA8HkP1IPoYf8qLn7QTvEg
         gqRpkdtdNmZPVRhZqc5O6mGomhyJD6xHFV/hj8yWwCsCd4D9U2YekkOwNg8+gEZ5lcyy
         i4PA==
X-Forwarded-Encrypted: i=1; AJvYcCWuLUEIkMJxpCLfahFpnl5wWkIdvcheCnzFEMYMzlY5hE+lDGA/gMKjxWb0rnfA8tXOuzAV4blsp5hiVxV6dV/E@lists.infradead.org
X-Gm-Message-State: AOJu0YweW6Hf/sb0/ISj6Y/gi0+I4f4GLH/MyLLJHoITkYflm4LPonQZ
	KPxCF1wGnwPQp4afj7EJxLrM67PYEotTwH1wZxaXg8B2cxzmSyVjLOtS
X-Gm-Gg: ATEYQzxBdI0QRdCXMerS4uib4zR4CrN9bRW5GwTapkItt4NTb4/Ny+gtozKv8zyI8nP
	WlCW13WAO6wOmyxTkJdzx7148f0lmU+CF+tV2LWJllkHkqWtypXbcAw3SQYzXE4U4MtoCUOqkBI
	VeAQ7G8gLkopf2O7RUcr91ejlGRW828Na1WtFwoPQE4igYA/Ncnxt1TgNtNykd4IKlvReffPC3O
	r8hlUIu4jtyANCsq3Bphq9QyIho0Sfv5kk4yV1XCO7AEMlAbrmKK7LQ8ts2/iM260mca3L/tEXN
	uptVCh3J5asyygYWjuGUwjn2P+BMsysQLtQ9CqyO7mzrRmrCslj054Ho393hAS8KOB/iILUVopP
	U0w5OHHZgn+FRZ4rudYQkjgh3Rsu9CBTJXq33Hhv0cHMgyUAWpL6wCPT6RgxhG1WIDyxCViAmDC
	+ESMLvgJgEzTNW1E9AYzj41yQmYIsNVaOpv3oDgRJJGz4o0W2n8m6b/bs=
X-Received: by 2002:a17:90b:5291:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35bb9f0e236mr5075077a91.17.1773892429081;
        Wed, 18 Mar 2026 20:53:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:56f5::8bd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc60ecb30sm1159145a91.12.2026.03.18.20.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 20:53:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/6] ARM: dts: BCM5301X: EA9200: specify partitions
Date: Wed, 18 Mar 2026 20:53:23 -0700
Message-ID: <20260319035324.269905-6-rosenp@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260319035324.269905-1-rosenp@gmail.com>
References: <20260319035324.269905-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_205350_080244_31E40001 
X-CRM114-Status: UNSURE (   9.85  )
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

Some are needed to be specified so that linksys,ns-firmware works
properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../dts/broadcom/bcm4709-linksys-ea9200.dts   | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
index 7b1363aa1144..d8aab570dbe8 100644
--- a/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
+++ b/arch/arm/boot/dts/broadcom/bcm4709-linksys-ea9200.dts
@@ -195,3 +195,43 @@ port@8 {
 		};
 	};
 };
+
+&nandcs {
+	partitions {
+		compatible = "linksys,ns-partitions";
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "boot";
+			reg = <0x0000000 0x0080000>;
+			read-only;
+		};
+
+		partition@80000 {
+			label = "nvram";
+			reg = <0x080000 0x0100000>;
+		};
+
+		partition@180000 {
+			label = "devinfo";
+			reg = <0x0180000 0x080000>;
+			read-only;
+		};
+
+		partition@200000 {
+			reg = <0x0200000 0x02800000>;
+			compatible = "linksys,ns-firmware", "brcm,trx";
+		};
+
+		partition@2a00000 {
+			reg = <0x02a00000 0x02800000>;
+			compatible = "linksys,ns-firmware", "brcm,trx";
+		};
+
+		partition@5200000 {
+			label = "system";
+			reg = <0x05200000 0x02e00000>;
+		};
+	};
+};
-- 
2.53.0


