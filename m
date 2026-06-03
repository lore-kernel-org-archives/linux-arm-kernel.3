Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5E7CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 22:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=; b=QxTlA00IJpAPjteOUXb1Axe+n+
	JdbSG54LXlDe/WxEaqEfVZaAVoS1YIHzzvy1vHDqEncC7j+hSmPKTnW+Y/sB8D9hAefeWkiNFospx
	7CzG+gHeWL8h/+uh4qvBsfdj0NJUCI2qvU+KcA1VKu+FSXPdVZtpmgEFzO981sXc9djdXEWsGo+an
	+9I2SDBP7kP9Dya8J5wscTfVgZT85iACP02bYdDcmuPm+TzDcHS6LmKYSoVW/SFbGwRLlCZF+jbNq
	JSd1Zar8fxk8WLsi91ZGnntAvynRnDss6fpd0s5Y3Cday5Y/wFj0lxhSx3NMBtun5qkb0xY+/5zL4
	AszHyaXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTX-0000000FuGz-0I5S;
	Wed, 03 Jun 2026 22:54:15 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUuTT-0000000FuG1-3LBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 22:54:13 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-490b64c8311so912865e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 15:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780527250; x=1781132050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=mpTYNf7yuOKVzs8L3lij3q9P0sCu/Eu1CaT2zOnf0Ol8+ycZrk6c9pQ1d56QPCyxuL
         QD7xUAypBKrHrQibBqg6+WU+7WEuWUiy/QjExcZ0ExQHcLl7hEb92htBwGbCVzrTVTcE
         cCDk32nK6dc4oXS/groyz9cVUhHSrL+/9KG6udhhCUJyryZvX2BTMz+n5hjBRrQS7btd
         vZGCShOAfjds3A0Xgb9iDMot7F+y9EAz/6YaFENvA9N2aiHVgyJZybLLBst88PMPL41n
         pWqyazztWwHufn/eJHZOgjS1c2OPyTyHELj7tfMkGfZbIG0sBpwNGcbQ4hKnl+l2vhZQ
         Xdjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780527250; x=1781132050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nskxwi9aLc3FrMLPAE8Sw6UzEPAoYUPBwlueZfRNNKM=;
        b=SjJfz7VtTbSAISq4HqNhziNsvdUztiyr2G0YPnDmwf5FL2AfY3wabhJCCxRv/wnwNU
         PMxke3l7XqUGkswyr/hoTVgm4N3v+kNERvLAK9AXjK5snjP696g/2Bl0lNOloEZe7tGg
         G3dbyWmP38GUBb4n9/1e/NUOxQcGQ72FyXD9WskidsrzPFOrZDsuiOShmkABY5HWXQsJ
         i2J4fPnXF5ZS/SkWPBxtEB3tLfEx9dA6BNU22ePpSrFY0ugf2OpDJdt43FsR8RnZrEwv
         558jlqb240m/x+2yBho0jlWzLb8yqFDR6mka+cHq04B6mTHV3oT+zFpBP9Cx3CTvffns
         Q0HA==
X-Forwarded-Encrypted: i=1; AFNElJ9kn0nj70ass7BNuMYX1k72+7HCpKNRbgPeH31fwZkIe3nuetnPglJAZ18toIYsGzP+sXlmwuC0MMYRmulTmC5t@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4E2z+Y57KM99RvquJnmhtjFZVv6Y89O6fUYODBpxeeH9staZG
	UOG6n+07ZXE+KRqA/RrxpWya1bmVXi0/5GLZvOOUZ3mfu8o7CIRN6SCk
X-Gm-Gg: Acq92OGq+MJQAMoAnqjIEZMQFT0C9ms03bfxTC0lHaYa6FAABGSY2G0c/+z+PSHuUyN
	/RZ3nXW2FA6MGwxgQLaeNKJixcUoP/kuKvAv25XbhBup0rd8lUFTJ49ecmZ6Q6dDLBFfwKYqV2B
	JiCFdkdUx7RreC6YHTMLgNsPLhd1jPlFxgwfN6UCMLIjwafjEFO498aFP34S+bmVWuzyJSRV3HT
	5uZWeOVaNEzkntf+B07rqUrfORbgelS7EdoHRinPOqCxY4e8KUtKi7HR046S56NcDrVbuLLbOpM
	2TwEL1m4g6Ld2LDxCGyCzeoNW5YA+02+fmjfepY8uoYDBQ3ttvsuIvrLAytiwPRu/O/rS1B1JoF
	7k/8B3wk0/Wd7D2heXIoQDSotk52Nf+QEaPsRVftXenGsOajtBbkNQpqExeDnNBKLnqirH8Uu57
	pjxgl/MeV34AFfsUPin5uvS/Jxj0DNOkpijIyW9ayhf4rW3SvWfdpZHGHAoDHNLVRuPnt3LpGPF
	zPub8bzV1gz6R7KSP4Yn+6aKrA9nzlqSBxwJlGBQr0teQ8=
X-Received: by 2002:a05:600c:c490:b0:490:b0df:9eac with SMTP id 5b1f17b1804b1-490b5e94d73mr88883525e9.3.1780527249399;
        Wed, 03 Jun 2026 15:54:09 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.dsl.teletu.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm26366385e9.6.2026.06.03.15.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 15:54:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: imx8mm-var-som-symphony: minor board updates
Date: Thu,  4 Jun 2026 00:53:58 +0200
Message-ID: <cover.1780527068.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_155411_866177_0AC631C9 
X-CRM114-Status: UNSURE (   8.08  )
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

This series contains minor updates for the Variscite Symphony carrier
board based on the current hardware configuration.

It updates the RGB_SEL handling and marks the relevant input devices as
wakeup sources.

Stefano Radaelli (2):
  arm64: dts: imx8mm-var-som-symphony: add wakeup sources
  arm64: dts: imx8mm-var-som-symphony: keep RGB_SEL low

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts   | 12 ++++++++++++
 1 file changed, 12 insertions(+)


base-commit: be580423d3f84b84a2f549df91e66bc4f54eda02
-- 
2.47.3


