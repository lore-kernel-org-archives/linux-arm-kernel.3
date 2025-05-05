Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F51C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 15:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TfSasfyNn2QOSv32qDVaYS8lEHvMrqjWB4CpFRqIp8o=; b=NEVsgnEu/MR8M19IV5vOHKnW13
	2sZHHNrskPEKf8D08eHbv/1BcySbK7dueaY68I6i7Zu92wrZHQEtkGJDm3iFgMI4J16sRQpbWRejQ
	kiSR4LszYAtM+Al6HAScCBt6a4wLqE5IuTShfGKXuu1aX89yE6nqCn8qhF3rUbdyktvIl/HkA9ywJ
	MSuznGOPNgEwtt91sk+0z8bgz0DIMg+C9yx8YH09FSHYXvE8Ovu+GxJJK2YxMeLFugu+V48Le+k45
	MfnmfXgFjLoKGVgdhS8YF2DNDWLXcyuceiF7bSipGqUUVnNo/yI7ynbj4xEPVGcf9l4H20PRSNG2q
	N2/X8f9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy6i-00000007svN-3fwn;
	Mon, 05 May 2025 15:51:52 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBy4k-00000007sSR-11go
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 15:49:51 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6062e41916dso2234156eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 08:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746460189; x=1747064989; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TfSasfyNn2QOSv32qDVaYS8lEHvMrqjWB4CpFRqIp8o=;
        b=ON89Z6s5T7kSODUwb4f3K0LTatjoRQJPwQ2mYAJCIY2FdzAwrXFJj8aDw9NZG45nCQ
         7Xn7lu/Q8hqsH6rDkdKtKECgth8P6La6QRIB5nNK1hUuGeoeojp3+43ABtZ9tnmKVn1f
         5g16AP3QIPG//sj5EHjbZ9djH3sEibfYDSW94cS6TAyMOQEPzwJIHRcYM/aUY1d3Tlzk
         3zMj4CGhAtHV7ksWUfgUX0SOtEcx8ip9DyTBnI2JvqecrcsJqeRugBPRbhfYWyz6lvkZ
         aOewtvEdoaOrRDRuWKd/5STjRFwy+tAccEdLQYbDm+knzZWuDAgrO2atJDVTTlkBjUCq
         H+dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746460189; x=1747064989;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfSasfyNn2QOSv32qDVaYS8lEHvMrqjWB4CpFRqIp8o=;
        b=uyCLPCDrH0a6xtkixzb8hM6x4pB9OnrGeuKuU4SQE3BdV6nqpDwtRvlBLMeg5LuP7s
         nouOCgMmnpAxwe4OAKSK051Tqm8sMHuccFEdxjzG2RbPd5po3nMiCTF728h1QeOgWZTw
         HOXFHXHtCrLTal8et8C2pU8nW5yqEmYbnf00mYRWs6aAMaH6QGF1v48eVd9Zldy0YvJe
         NQYP5N8J51gxW4h5UMBcbKnmu5ds0+QNmCtBQVqLbdd5vCweJhboKUcosbfsmydgDcxQ
         zKASsnikqagfgh7IfguQYmgjyvJ2+6AHti+lMsZgxIDNQBt5h64S/sF/j5viMHQ1A2LU
         76XQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5o9hb0fCUSBW1qiQ0ZyxhbMCYIwO4bMpiL88i6NXL6hEJflaoMJYpPgHM6RUDqJ3DeMHsEyMwI5rDtB4Al73r@lists.infradead.org
X-Gm-Message-State: AOJu0YzZQj4Pp5lUOEShKwr5EzVrgb7kljv4X3MCFnVdPgEhZu65lLdQ
	8TXHYdZ4lEXocgQ4gzTXtDjh5NmEp7YPoEfNMSf6mhWtYO3wQxoldnNy4jJ6fW8=
X-Gm-Gg: ASbGncsNLMwPVDE33Tk98SeS5G9Ue445UQmrVNBDfN4Dy96v0NyQ1PtCcp+0+LfjG9W
	7QwKImFVUB12eCws9S+3BBa65crplopFsl64sgb7xrXfwMwfSh1oeg4C78N0ikOoOaMzFGr7Uau
	IGqr8DXXzSInwv0LVwitYaUHv6xeAOs7ndAKfrWnuNgwyJNHGteG3tvaDhwhWX+44R/7uZxhdNr
	NapVOsOfb9h6txZmqDWR+w+t4P/Jsy08UWcvjlvhEMlmKwVuall42m7yL4VZqJtS1A1Fa1Ufzw5
	ku8NQOzeLC7cbvt51JFA3BB42QD/xeXd59E0GXxZkkC2Oa+xZ+Gak/J/PHq6G0q26qftqYl9iw=
	=
X-Google-Smtp-Source: AGHT+IFxZaRAPndA18lDE7ChWtiEoMGY9mLpWkb2iP4H0PkM0TVxr3eZLsRh+qcaLAy4IFe3PQLjgA==
X-Received: by 2002:a05:6820:c81:b0:606:8bce:32a0 with SMTP id 006d021491bc7-608002f986dmr5907169eaf.7.1746460188788;
        Mon, 05 May 2025 08:49:48 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-607e7fe84a8sm1606217eaf.36.2025.05.05.08.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 08:49:48 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@oss.nxp.com>,
	daniel.baluta@nxp.com,
	iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Mon,  5 May 2025 12:48:46 -0300
Message-Id: <20250505154849.64889-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_084950_284551_846D3CDE 
X-CRM114-Status: GOOD (  13.39  )
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

From: Hiago De Franco <hiago.franco@toradex.com>

For the i.MX8X and i.MX8 family SoCs, currently when the remotecore is
started by the bootloader and the M core and A core are in the same
partition, the driver is not capable to detect the remote core and
report the correct state of it.

This series of patches implement an API call to the SCU which will
return the power mode of a given resource (M core in this case) and if
it is already powered on, the driver will attach to it. This SCU API was
already being used inside pmdomain/imx/scu-pd.c driver, therefore it has
been moved to firmware/imx/misc.c so it can be accessed by imx_rproc
driver.

Finally, the imx_rproc_clk_enable() function was also changed to make it
return before dev_clk_get() is called, as it currently generates an SCU
fault reset if the remote core is already running and the kernel tries
to enable the clock again. These changes are a follow up from a v1 sent
to imx_rproc [1] and from a reported regression [2].

[1] https://lore.kernel.org/lkml/20250423155131.101473-1-hiagofranco@gmail.com/
[2] https://lore.kernel.org/lkml/20250404141713.ac2ntcsjsf7epdfa@hiago-nb/

Hiago De Franco (3):
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  firmware: imx: move get power mode function from scu-pd.c to misc.c
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 drivers/remoteproc/imx_rproc.c        | 27 +++++++++++++--
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 4 files changed, 87 insertions(+), 24 deletions(-)

-- 
2.39.5


