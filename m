Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15662C3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 07:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=; b=GlIyCZpszkrdhnAGt7d0XNNGzS
	ZhHgHlOINIfzHWAmnuB3osSAVIyhOrrZmrcbbXyHjjNANd+8F0o/7mf5TA7buTObdeUpLUIQxSF2/
	HS0GuENBMECoBhZywrTUwuFEjlZZfPAOFlkRMg9K4x2U20JF6IQmvtqv3LlTZMtgeevEBMsBNZ3xU
	+qg1LbSj3nvf2JUYTqmHwLX5RscBPWmSsPCpI51Lu7fKhVCRBHVMKuaNkBS7RZAfOXWTkrF131+IR
	7F6bTvx7KBK2KwaMWyzHskvGjo7KqnqQYONvxmoPRuoXNWINA0w2XwriZHZhHFpwhHHcsnRPWIgeb
	SWyfgeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6RZ-0000000EI7F-085u;
	Wed, 14 May 2025 07:22:21 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF6Bb-0000000EFR6-3tkl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 07:05:53 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so37050475e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 00:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747206350; x=1747811150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=IWAPnlfwTkKlxKBWdS5QF+rOsrthDZuOPsEgJ6RC+d+FMWVfaMBsxiBDBH+Ka2z8W5
         sbJ38LZ8mpy3wkbQSbILE+zfQeypObnj+NVH1kiPCYPJuHdblPcTqXpKlOfMW1l0A1oR
         RT9eb6loEfTMtSNhsASM60DNmeOFteq6wlNT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747206350; x=1747811150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xsjFEA09j+sM7FAAoS3tj2IZ7u/MK8eK35o8RJtHzgM=;
        b=nVf3NvR0XuZR9aWv++sIFPQmi/GxErv+WeDO/j3CFiVYtXSTUTRkZAJb6nxosO+W2F
         Om9BD4cROwvCUkkFdbzZK96n3FVijv/6Pc23IHng6e/YoEr2HU+GiLyRZjprIQCz/5dL
         ISYBKIlGkETwxMJ7e19VdY+gTnlowRSjCeOpnhcJ0j7dZ1lFqxNixteoSRc05iyPwx36
         hWXLNCjgQOxN0zCll1vRnVVYtmWUKA9JAWU1rtiiBSA+3+ZlN/DO6dXhXNg/u6axqjsl
         yM5cJZSX/Jl4yyIoUxwEq4r5UxrcMMVR5sDCAkLqseMiE5Ypy9cqu9FY3hVLxkL26OgZ
         Jgbw==
X-Forwarded-Encrypted: i=1; AJvYcCWbicvhOw2pQJnT2GL5ESuvAihFeLeDCafoTrjftl5oECL71iSo9ePJwvIB1UNgxtxnDWbimdBk1qgCUaTNWxkv@lists.infradead.org
X-Gm-Message-State: AOJu0YyO8MDOkckCQmBzc0PE933yqmhlBZB5A7iuMl3SyaxIs8dVNGe8
	BpS4yFolIyXLve/FUd5uEq6RC1i3DQlgJvuzndy8aqHWU5Z7v4WBcynNLrYRwWw=
X-Gm-Gg: ASbGncsOqsNDESgOxiIbAsz2loc7OspvK6UR+mkEftkYk8wfhktlUjY4pXolIrlltbG
	ScmUZlsBkCvVPzOHk19hrce37Zuj89sPdnSbO71eqRfBz1dHM43Kyrz4bpTaERRQ9yQ2EuHe42v
	n2jtuP9K5gYc0GKclNzS9OpfuAu3IiPFx6H1eOUn/ILcpJ33EN6oqGSHJzcYCvvWjmQfk6ZCAl0
	OJ+YdPgpdcGzqS8ac6v33oN5NhD5ryffnmMlCVn8xVps4Zbq/6hNewtKgGL010gRUqrru1NY/5B
	dM7J5GNOKiXHxiYvSkVEi3HsDx8yS/K+5sQiNHX9y6BhrDsZfS3TdL0s7WqdlehiEiiI0VXxeuI
	BhwKBzJsTuwppho2yiWkPNvtBEmJzWdmt1KtAt5L/ZtU=
X-Google-Smtp-Source: AGHT+IFP3OZAR0dGoXkyYTq8TW0unWpQGNJt+dN4divr0wjJZfTsT15iqaNFB4zXPgGA9rG4SvnMNg==
X-Received: by 2002:a05:600c:3c8c:b0:442:ccf9:e6f2 with SMTP id 5b1f17b1804b1-442f210f732mr20320025e9.16.1747206349632;
        Wed, 14 May 2025 00:05:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f396c052sm16688175e9.29.2025.05.14.00.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 00:05:48 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Leonhard Hesse <leonhard.hesse@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] ARM: dts: imx6ulz-bsh-smm-m2: Enable hardware rng
Date: Wed, 14 May 2025 09:05:33 +0200
Message-ID: <20250514070545.1868850-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_000551_990139_45DA3170 
X-CRM114-Status: GOOD (  10.36  )
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

From: Leonhard Hesse <leonhard.hesse@bshg.com>

Hardware random number generator is now used for cryptography.

Signed-off-by: Leonhard Hesse <leonhard.hesse@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
index 6159ed70d966..5c32d1e3675c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
@@ -29,6 +29,10 @@ &gpmi {
 	status = "okay";
 };
 
+&rngb {
+	status = "okay";
+};
+
 &snvs_poweroff {
 	status = "okay";
 };
-- 
2.43.0

base-commit: e9565e23cd89d4d5cd4388f8742130be1d6f182d
branch: bsh-202505-imx6ulz_smm_m2

