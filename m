Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30193C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 07:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpYNm3qlAya2ACRDiV2R40K+VHw6jIU1PcEeONO07Hc=; b=4sFgJTlAJ/csGabVTIFLW2HVqU
	nTIxyq+mNoVGg8fVVgjXi4t+mXSS2QpMSBlDAkXtWi2avINNWjkoGcLDj0q5rcjlJb0O+NqzLHrcW
	a7fcUsKtRNTnYS5lBRPT1uCcji3mFaTs006g3wnbqRW+wDsEcXH/ahJnD7T9ZmXuHv1T0PVvNEhRR
	UqSVdfk/0T85NJvejPTpP8+dHxE8aJaU0f2+v4850yEVrFecYqnjFoOg+Kl+EHdm/Utr4oXcry8gx
	JgHizEiMsOYhaJPwgTo+oR9kw7Wq3nkFfdLI+iapWy86LvL/hhbwTWFRRITKVMn0iN+p0qt6Elik5
	02Dkdo0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8hw-000000078nC-3X1i;
	Tue, 21 Jan 2025 07:29:56 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta8DG-0000000733Z-3DOY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:58:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2162c0f6a39so116136425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 22:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737442694; x=1738047494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpYNm3qlAya2ACRDiV2R40K+VHw6jIU1PcEeONO07Hc=;
        b=ROXzW4+856t5z2SR/6S01jFG6vPPkl/QUrZP5jhwatlgD6yJ+VWsksOVXStMfvaOyf
         hnrf/DC2wgraEBmLC232SSg6krK3qy6+eb/QO+aphKgUaNzbpq2863LgfEQXuoCCv5L8
         B28RhIEn/LYenafEQ5683Vx2aTpSCGBWD8HfihW+PE7tRe2jwPxyv6+R9YkesgV9+JKf
         MJpgWzCVwZYQB/wR6zUWLG0dke1EDLmuxt0IXEFSGAV7QELpno7prd7g0fCIVj0jkGn7
         DEWtd72VMUpAeBA7fZYOyaarC5trJiSxHrf1WMazzlJ380gNhwRfpgkyZhVj6eQDB2QN
         Zzgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737442694; x=1738047494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gpYNm3qlAya2ACRDiV2R40K+VHw6jIU1PcEeONO07Hc=;
        b=OYq0X6IERTAklkycl6mxeoyOUVSiNQYsfnIXnxwFlIJ2ssb8EhlhBvc1tAMam8l7c1
         tqUR/fJkjAUlB1q/MxzK17PuaYxMy0lPGBH9tozSrGWWNngQfc1Dt9lKS137K4a5JiaW
         X0q0RXkM0zQBEJaFvqLc5S5otukiV8ygUPKbmzemLvxAk355UgoruQCj3Qhs2k6LIHzj
         5HZgnxvTYNcXO8Gma2KBaKFDjsirqg5M5OoKnZ/Sb36WFKnSVW8tokcrjcsrrOFksWPD
         +sTAQKu+rVTGcVMVsWglD+2jA5k4G6ciWnfdU3zWBpdlueXmjRDhw+7JTzLnpXccXzL6
         Nvvg==
X-Forwarded-Encrypted: i=1; AJvYcCU84iX5KWK406NRTKzvRX+b97xBhR5KvhV5rO59UaxrGSnDRudgXsM8qt/eL9NAGluz4d+NMLcQ0iu4Tv9NNdba@lists.infradead.org
X-Gm-Message-State: AOJu0YyGitUrLljByv1zhF1CRX7bi2WPNzZbNriO0Z5bSlXSIh98vPEX
	LX/2RcuTihtTMoT71sum7qwJFjWEeaWt5t5ClIQc5qxppRbgfeEV3oztmRTQTkE=
X-Gm-Gg: ASbGncv5lF4jQAvFHuU2y33ESAESiBIfcUpwmRYTaQNnF5e37UNHCHPifuMe7EnaNol
	ukL3NcsYcb3dXz3cIV3iNMQdmgfuA6+jjIbHYqC0Z3jhXGUdmfF/LmxsItihze1lDhYiDVNP0Qw
	4XyT1Oe3w3YGAKRaSrlVmPKernTw95PCo/bFafoHAf82hrSzvN4AC/132Go8EL7Syq8U1Ky3ljj
	0YyOlFuI4OVpYrzCtgm8jhGHrmIgz/Q9bwAxGgciPy9KzJakyFoDZqgn+3omAVK37SGTBbW
X-Google-Smtp-Source: AGHT+IHYl8ITOnKHBR9wtZWdnRc2vDPL7PmQsCpT1dlueNYfJot6EA1SnMHcxy4v1Dsvc7fZY1N5kw==
X-Received: by 2002:a05:6a20:c707:b0:1d8:c74d:1ca0 with SMTP id adf61e73a8af0-1eb02521584mr31018777637.11.1737442694157;
        Mon, 20 Jan 2025 22:58:14 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bdf0b50c6sm6841360a12.68.2025.01.20.22.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 22:58:13 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] firmware: arm_ffa: Provide .dma_configure()
Date: Tue, 21 Jan 2025 12:26:40 +0530
Message-Id: <766e29dbb32987f714158eef827e706fd1157500.1737441631.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1737441631.git.viresh.kumar@linaro.org>
References: <cover.1737441631.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_225814_801701_7C97857C 
X-CRM114-Status: GOOD (  11.60  )
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

Provide .dma_configure() callback to make reserved-memory work for FFA
devices.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/firmware/arm_ffa/bus.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index ca526e438e71..e7fd25ba71a4 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -110,12 +110,21 @@ static struct attribute *ffa_device_attributes_attrs[] = {
 };
 ATTRIBUTE_GROUPS(ffa_device_attributes);
 
+static int ffa_Device_dma_configure(struct device *dev)
+{
+	if (dev->of_node)
+		return of_dma_configure(dev, dev->of_node, true);
+
+	return 0;
+}
+
 const struct bus_type ffa_bus_type = {
 	.name		= "arm_ffa",
 	.match		= ffa_device_match,
 	.probe		= ffa_device_probe,
 	.remove		= ffa_device_remove,
 	.uevent		= ffa_device_uevent,
+	.dma_configure	= ffa_Device_dma_configure,
 	.dev_groups	= ffa_device_attributes_groups,
 };
 EXPORT_SYMBOL_GPL(ffa_bus_type);
-- 
2.31.1.272.g89b43f80a514


