Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B7CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C15nnHq5jGNekOrg1oEoMYGXiDnEqflax+NNj/Q5DWg=; b=WnOINMfZdnBd1Q0qVfOP7m/0IP
	kOCEcTOxsHpqEynb4Mxby56iHvlcVKjUbINHBR0WEm22owzL0nVLZHMSut3A5pMp8qOcmeN1rxiqL
	h54yux2s1F+MO5f3FRDMEDAM0vPZKO9vmrvQYd8tgsAMQBKUiUUSRUKClWOeyqVGNUQVRkkfVh1Pc
	Nf0LxTvfzhQs5Ia682Ea/DilhjaB59oLpsSgQxbzbeITwe8bQpkC+Db342JaDZ6I5MOzhmAXSgqNQ
	JdDFnWNazPCwrcgDHJ6RR3lfe2hPbH/32bfjvhAbLpiS+QycmE9a/Up/ct+OPP85hmdUnZABn/3zK
	Au6GXJoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQ9V-0000000HHbL-0Ffo;
	Tue, 02 Sep 2025 12:30:22 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utNcA-0000000GTCE-00v0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 09:47:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3d17f24d42fso2152195f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 02:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756806464; x=1757411264; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C15nnHq5jGNekOrg1oEoMYGXiDnEqflax+NNj/Q5DWg=;
        b=ciszw9dBMHPpTahekAxAiWePTWCW73hU+se7fgMoTco2huG4XJkQRbcS8pX0wIPlCS
         CV+Ia8uEnTvNgt+s24/5FGH8RPaFPVns/5wOl2NJicGC9KCHdj31F8WDL8Vu2wS4cJvS
         cB70m+9CwRQoHiX9/4bE/Kseio7emEL19tbMJrkrLVIP3TGPlg+R6F/ryWjg83g1slB8
         987au2YQSz4hPB7zOq06SIgL29IVEIcvmgpYLyiUmO/iOGDygjCkyWTW4Xg4rYTQcwDV
         RaaE7CuAdEk1spVgwufF/VkfRB0i8o8V21r/OE+vgosTSsyQzaVF0mUFRrRU6cJDdJ9n
         HU2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756806464; x=1757411264;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C15nnHq5jGNekOrg1oEoMYGXiDnEqflax+NNj/Q5DWg=;
        b=rovm2IIfwkYwDTM1UB99AhLUJllyZhOAsWrYMwHY6Pba07YRbWkiu1parYrKnnYvjW
         get9g6KIEfT5wMdbsURCBmrqYRAd1/mC4+ELXy3VOSuw1l9eoLTvJgn91zzTuyDahe72
         tQjHH5lEKP72Dn4S0AnQC4UHkgLfgbYr1gU6Fi0WPe8P67nLvyYoi64hQxOzv4mqZ67n
         uv4zda2yb+EvrhLKEGKZagbcGCRiiTmN+VALj8MMz/YXOK2PzAwFhL3d5xkfQAs6sXwJ
         ottWLdd3L6w5r4F/e9U7/5zCXn+mTLyTXRwfWapeqonZsgnoF9P6GYe7jJmBsZjM4tbq
         nfow==
X-Forwarded-Encrypted: i=1; AJvYcCWLOe0Pw3JjVysRkrkoCIj4FG1jp+mbMq3cI7q28oGsZNzZD10Q3zEl3JJqJZIxY40UaYA0Bg78aN/608EqBt6/@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkp157aGwnvstJMqjh7KM7/CVhrPaqB8xCqWm6ttY6G6lvtPSD
	iBJOSK00efUBriWyXw8pHA9kGeOogYtJRj6C/Vwmu7Cwp1fpR+ujskdRsJkCF8NPjQs=
X-Gm-Gg: ASbGncuWzhJ88ZmqCYjCyC4ewoSyOZwNck+3lC9RKMKPWFsT2PfChvhG+aJJWemgExO
	1cjMYOwW+Di3GQH4EEKSKQ5fD9ywgZlqOB5VFwesE+hLwDKsgAoZ+SKEvtQsGUnjuqLHZBM8fCX
	DU73Nm0O9/VzWNa1GY8jDE5zUUCXYzZtVOUW9B9uYx7cMH7/va00CFI6DvIVllkzUP9UroTXNU2
	CAEvjJSOS/ed838wreP23lWllRfQVn68o8O4RoX75y9bfEcZzBKAuT5pT43+JqgBlYRGqWwqzVp
	nAZeVyRlJnvaey4uOmTugy/1LQLWnbLfyZ22cS8vaVAIgDoOx6wSxbHS8GcrhQ2X1nZv3cY/dh7
	jAar/UroQPGuI4GMO1Z68pu60mkpjplyR/x2rJQ==
X-Google-Smtp-Source: AGHT+IF3trB+IqLVZP1NbcKHzI17jtlNkvyPbQokeVhgB/0JExvYEQ3RkklZMsS1InChMNxxtoDrQA==
X-Received: by 2002:a05:6000:4023:b0:3d9:b028:e278 with SMTP id ffacd0b85a97d-3d9b028e5c9mr1425217f8f.51.1756806464235;
        Tue, 02 Sep 2025 02:47:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d0a7691340sm18023223f8f.39.2025.09.02.02.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 02:47:43 -0700 (PDT)
Date: Tue, 2 Sep 2025 12:47:40 +0300
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
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v3 0/3] nvmem: s32g-ocotp: Add driver for S32G OCOTP
Message-ID: <cover.1756800543.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_024746_063227_7F50E7F8 
X-CRM114-Status: GOOD (  12.43  )
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

v3: Mostly small cleanups.  Re-order device tree entries.  Remove unused
    label.  Use dev_err_probe().

v2: Major cleanups to device tree.  Fix sign-offs.  Re-write driver using
    keepouts.

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
 drivers/nvmem/s32g-ocotp-nvmem.c              | 100 ++++++++++++++++++
 6 files changed, 171 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/nxp,s32g-ocotp-nvmem.yaml
 create mode 100644 drivers/nvmem/s32g-ocotp-nvmem.c

-- 
2.47.2


