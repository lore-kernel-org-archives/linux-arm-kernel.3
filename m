Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E63F30275
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 01:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=; b=zX65TzwecyIpHRKaivYT05k9tD
	TDBPjSWCUeG0oXN4FPe70oMshjoEMeFsXaV8r/xYfNEYUsoB/y+GffIjQ93Vs6TfAgUbzvFLadh8a
	ZCkrFZ6A5c/ofmT4Eaqm+9+4iwy1lq6OTfH6ATIhLccrJ9qTTz+U53ZRyi4ihjyOtR4vtq3332Nw/
	elWcxOtGuSMDOJyaG79kexw/HOWBTbwNH+riUDM/q9g1tZPj5dtY8ScGXeihInmt/IF2BQs12OJ6n
	Vz5m99ov1Q9t+HAuH33HNL2pmuULtG42ZRjMNxRIBaO4aAgjCk5tGWnYZXvJl2znHmlSi1ODcm5ZC
	jwYhgdwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKj-000000033wi-1FCJ;
	Mon, 16 Mar 2026 01:01:25 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1wKX-000000033sd-0Z6P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 01:01:15 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8299c75f730so2243094b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Mar 2026 18:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773622872; x=1774227672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=PGhBCzfVeOqMeFg4ZHk4Z+1yQs4HSfEVhcyc1o3b14gIKxsTxdj9ozi5n4TbJZULl1
         FQBrjc+ZqbqOthnk+kaIMvIiFCkgGy1XgQ++q2lmerMZ2TtAs3KWVFmlaB93VP6k2BxT
         9fjDnclaw+fJSKKgPYyJbZG7zLGrhedIZ+YHWE2fG3O4ntJ1mXuH3+w2YH35SZZECZWu
         ceywI28XI/mmK0DrP4vNBUHEzyHw7QYvLBr365QxQON+RbZCzL3dA7v0m1yTiLrDtFUX
         1tdqc2i3vK4MarvhAOQIe9bxrwQDqDynzCMrrUCZvmYqkTfcddPcN39zM2O6gg8Stls1
         T+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773622872; x=1774227672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iB9g5jx+x167tNjxcGl7Z3iDMBhQp91ckzQQIEVj78E=;
        b=W0T4Oxt1VQAALWmTX6XE+Eqy+AK1B/5/zxsC3yugxFI2sZLOWU3HI+kFRKdl/zcYaQ
         Ylw7CF3GvSrH9o7o9q57t2SLq+3X/ZJ/hYO8VEUiqWIdwzCEEwKy9YfOIEt+Zq1NbCRU
         8qukEETktoOjjBsvhyk2Dc/HefBfb9uqNe3X30oj1NcLlVOWTBJfP7Ifhdy06ErGwbBu
         2//veAVEwE18i9QANCKzSnoBTsEpDR/y3ztDW0Y0MzZnjqb0puTpaChAioHbtGzypWB2
         E+HLDbtPGwB9vLXjgO/iQM6y54RZS/05O0UgN5TrNqnnV9sqitSMcTUe+ikqcl6EBvZs
         D+zw==
X-Forwarded-Encrypted: i=1; AJvYcCWlifpMCd/pmdYt1wVxACAZWbFe6DRWXSnSMhzYaW1jAWKIrdS8/j9fCosVQ7dp1taGPKTWsSahZRLgMCOO+O6I@lists.infradead.org
X-Gm-Message-State: AOJu0Yx78TrHHQ3aSC1YjvvIDqbAe8uWnkCJGPFj8EcfbnGRfNgQfap0
	A+XqTgMaSejAVYrp8RUoF+eXriY8C0TQCSPdzRitGJtGKCaY6G/R7Lox
X-Gm-Gg: ATEYQzwYSlvYZ367Tuj0l0OPglJLmop0QHl3VC3H4M57ZD7/S5D6JBLnMr04RFVakbE
	OagDPQPkn+6Gphag96fFAw79swcIfEMAUDtFamWxJWum9PjSk/ru+yYBIhufMyeNRwmBQpdaEfy
	st5M0UfWkeCphkv2/JCsz+iQDlp9upGeBvLZaFm4qBn6S7VWrQdcvhPXJjdh+96RiSkD5Myjj6t
	JcpKWKQRqJwxTrtJ8aW3gQsfYRVQTVFFyiZ3WROiEce1SLTBPhR8T0SaBkTVyJUGl77N+JzssJK
	RGWH107AyoGo2oeTZSuPxWBjM8pSE8KmbqYO5choGCFTSAaznzsBEBAFt8SAw1FhO73zyCMWhU/
	heNBo0OVh8dnSIIZabVID+udP5cmuct2dcq8gNRK5hNzOX/ywMgDq5raK7/N9zLJlVt38K5La3I
	Ffxh0Dzq40HnXlLX/OFd1jxN03ddUznwa7xg==
X-Received: by 2002:a05:6a00:929f:b0:81c:ce40:b29b with SMTP id d2e1a72fcca58-82a193e89a5mr9456189b3a.15.1773622872449;
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a072419efsm12308166b3a.11.2026.03.15.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:01:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Yao Zi <me@ziyao.cc>,
	Yanteng Si <siyanteng@cqsoftware.com.cn>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Shangjuan Wei <weishangjuan@eswincomputing.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Zhi Li <lizhi2@eswincomputing.com>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH net-next v10 4/4] MAINTAINERS: add entry for SpacemiT DWMAC glue layer
Date: Mon, 16 Mar 2026 09:00:40 +0800
Message-ID: <20260316010041.164360-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316010041.164360-1-inochiama@gmail.com>
References: <20260316010041.164360-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_180113_615359_0B29D2E9 
X-CRM114-Status: UNSURE (   9.86  )
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

Add a MAINTAINERS entry for the SpacemiT DWMAC glue layer driver and
its DT binding.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2265e2c9bfbe..dd72d26ac837 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24834,6 +24834,12 @@ W:	https://linuxtv.org
 Q:	http://patchwork.linuxtv.org/project/linux-media/list/
 F:	drivers/media/dvb-frontends/sp2*
 
+SPACEMIT DWMAC GLUE LAYER
+M:	Inochi Amaoto <inochiama@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/spacemit,k3-dwmac.yaml
+F:	drivers/net/ethernet/stmicro/stmmac/dwmac-spacemit.c
+
 SPACEMIT K1 I2C DRIVER
 M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
 S:	Maintained
-- 
2.53.0


