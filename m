Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3437CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EXjzFWweCUpLGhqs+Qc2v5kfooS7EDEgFn61h3Rxlrg=; b=Li6fO0/oBrYe1MpbfM2RiOwB3Q
	Bt5NU2fOUNHknowwUOu/vWxvPa4oC5cIrYa30JAomppMXMseXKsbo8yFHA6GExflFaPZ8SudA4OCo
	7prqneXMT84rKebJ84JKu5YI1eq2tf1IT54PsHw9rzJX4hWtdF77oTIPWECy0Ed9E6bKeHkijINHr
	BWb5VH4V4cEZteP+eISTsmYNRpBP/PQAlXGapjQ16cbPw4/kWVDrCZFr8rbu3wm3vHJ1Fqx7HEHBq
	hGiCpz6NroHMeCtNcT6ZEXEz+Ysr3y8fieaKrLxEEAWV6l3bsfVaAmLVv48GSgHELJEgQmUdRuV0G
	HRim9Hkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwjI-0000000Cg4c-2y9h;
	Tue, 26 Aug 2025 16:41:04 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqwgH-0000000CfYO-27dd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 16:37:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-45a1abf5466so590645e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756226276; x=1756831076; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EXjzFWweCUpLGhqs+Qc2v5kfooS7EDEgFn61h3Rxlrg=;
        b=gAPmfhLHz60Kn6U5MX+q1CQqPvmSPx5pJbzpc1CWqBNfhRi2SS+AAbKipNYGGHQelV
         zTdiUXexeZ5VFQ4PH4I6NKDk1X0HtVjTUvYabKrSuBNtINXcvUDcfsqOvXRZGynh2szO
         WD8r1PwAmZSQKTBntklF0GnbP6Y5uIbP8bJeusjVZM40pHu/lAv96czE4Oc+Tr7nDgW/
         JgZNUvwjwckpcl59TB6GZO8tnjcD/JrxMfLv4Tf8VngDRtwD/YsRO9WYDygV1FQXqsHH
         /4JRL+zNfmL5uChPkBVnA/F/9kCLY3PgOO4Iv9W5jBPFP5+Y429k1fBa25LVVcRuEm7Y
         hhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756226276; x=1756831076;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EXjzFWweCUpLGhqs+Qc2v5kfooS7EDEgFn61h3Rxlrg=;
        b=TGjf/sJnTaKPI2WByO4C2CNiwCCyyuA6eWJSzELSSaeIEVkpreofpjVyqUuI7GDJaM
         GMgJZtDkTV29d6DT9Ek3Ksl0Y5PDtxl/ukKSTHY3+OY93HLSyp5La1vgDqvLDA+ls5Ft
         USq+JJpobZFrAYUg3CCNmGpyKjT5E6GmKX8a9s8+X6a8O+Mct6zHSE+ujJ1dlzU8aiZl
         Quh5Y+9DMQ3STF2v7Ttp6xadO5EmiWXtDzBiRqPWmKSpQXrD0UwGuNRpy2Ma1pD8gLiM
         Xce7xxpfGL03yzpE8pqIcDuKwGhgy8E2A/F3+SK+P3/pgaTkyLvGap3lmKSDY4fjDMQO
         TYiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvpJmbdrgpF+PZMuok/maZg9imkcZxAZBIrsN4RxgxNE+2zPIzgmRDseu9qwLMzWx7vxea2bE0OT424PsVMIcz@lists.infradead.org
X-Gm-Message-State: AOJu0YzL9uUtq88hfkGQHDNS3eQKJhOPkR1SbdCiDafCubq5MjLQbsOd
	OZPua/uUgGjzrHMGoRG+vxAA3oLkCK4xiW7DUlXDtUbaCwf5E5WBRNVbSj9P3rcknGM=
X-Gm-Gg: ASbGnctV0fLxhId0psW7DXPTrXpQWsyKZGWYx0vq+sg913ysttbd542MnXIT1Lzn8xc
	/xt+JdonD4PRRiJIaospDs7LpnwfLESU7lK5Vo02schWYzHAvsmHp3nfELVDLG8+KQ91SWgorLj
	0ZwtZiNZEJ4I0Xum8HwrsvfIapbw2quK6NT+ZZASsMsObTaPiJpTEA9Uq+KSDau4ZnaQIyQaCA0
	+zwA1uJC7M75Ugn7+tTTLqNfXzAUcsjNYW+2i0Z5cJvmDAkBCaMJ1F9NIWx2voRAWB52Z1bsIPI
	Ss/5/AaYkEB7r663hHfQ1Ak8dDaWrRc5OANTxzIy3m7y/KWtzX8vtZG36m78IIy1u4DzDnzzgrq
	j9+TrYBjl/TxDd3UoHIrWltIRbIQ=
X-Google-Smtp-Source: AGHT+IFteKF0n9oClwejHyr5agehXDb0k7S2tqnIcjSRDmL+smq006tk4p7iGhuoEHb8FtlFd6aJOA==
X-Received: by 2002:a05:600c:19ca:b0:45b:47e1:ef7b with SMTP id 5b1f17b1804b1-45b6870e3dfmr26425085e9.17.1756226275893;
        Tue, 26 Aug 2025 09:37:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c7113fdacfsm16879530f8f.35.2025.08.26.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 09:37:55 -0700 (PDT)
Date: Tue, 26 Aug 2025 19:37:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Ciprian Costea <ciprianmarian.costea@nxp.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Matthias Brugger <mbrugger@suse.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, linaro-s32@linaro.org
Subject: [PATCH v2 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1756219848.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_093757_557524_17A9CCB3 
X-CRM114-Status: GOOD (  16.66  )
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

This driver provides a way to access the On Chip One-Time Programmable
Controller (OCOTP) on the s32g chipset.  There are three versions of this
chip but they're compatible.

v2:
I have fixed everything that people pointed out about version 1.

Sorry, Rob and Krzysztof, for the problems with the device tree YAML
file.  I had an issue with my dtschema installation and it's fixed now.

I also screwed up the From headers in v1.  I called git format-patch
without passing the --from argument.  I've fixed my scripts so that
won't happen again.  I also messed up the Signed-off by lines in patch
1 and 2.  Sorry!

My other mistakes were from not being a familiar enough with the
subsystem and those are addressed as well.  Especially re-writing the
driver using keepouts cut down a lot of lines of code.  I've tested it
and the results are the same before and after.

Ciprian Costea (2):
  dt-bindings: nvmem: Add the nxp,s32g-ocotp yaml file
  nvmem: s32g-ocotp: Add driver for S32G OCOTP

Dan Carpenter (1):
  arm64: dts: s32g: Add device tree information for the OCOTP driver

 .../bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml  |  45 ++++++++
 arch/arm64/boot/dts/freescale/s32g2.dtsi      |   7 ++
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |   7 ++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/s32g-ocotp-nvmem.c              | 101 ++++++++++++++++++
 6 files changed, 172 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2


