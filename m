Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF9DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Lcz+l8Co0SDC/cHtMO2vcFW8EyYc7hvrzUdAF6/dLuY=; b=mXs6JNP4lZ8XByXp7Houc248A0
	vTyt4HWCUxqeenLdlN9dn9QcROTZHhRyztMQSSvGSi4F9NtGF6pZ7mEb33pY7/A4XSyHkz6gYMmMR
	ycQwa3TDZ3s4sK6+YtMMNzn3cMFFGWGpiJ9SaMkJUH4ocjOgvZWz/nVH+txMNdurIHz5aG0bYE7W3
	ucDNL+kfXw6r7iXvZzds8xMwq9i/iL99InwOr9EtENpFObD+1LBo0fVOJp9/qvI0+e4nHwjUIHd9B
	WIPsLGqLCMdHJnosWt0FzmC+Xjns90pDJmFu2U+QqQxDoNmCkJ1vUzE51qnU+o81sbTDeXSf2XZDY
	zKkFFR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCiWt-0000000GIRs-1YVu;
	Wed, 07 May 2025 17:25:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uChDR-0000000G4tp-2wY4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 16:01:51 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so100909a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 May 2025 09:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633709; x=1747238509; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lcz+l8Co0SDC/cHtMO2vcFW8EyYc7hvrzUdAF6/dLuY=;
        b=h3qyBQK3GR7nJKpZOd7e7Ef/TgyNirjCwdUgszD1Frm4uJ/4EZ2MJPEWbhWNR9OlM+
         aieYgRfMMNv1LmTJZp8TLGKr6xvEMgHSGyeokftBEzBTdbtLFoXXVj9NmSDoRkwX9JTZ
         D4QVkfLiQZELqJxmsTq40OnJKPZcwxxcFbDUCVOBXr8bvfEnPMnyvjo4guc/S+JjSwQM
         o54rthXgW/B3bQUOjcqPu37822QPNzAWaysU7sZ/gbH3DfjAx9jPQEQZsbQAkQ9fCYpj
         6e5Y6i+GveiXJ3bS1gM6hHPb/WQgso+DbB3yvmOWniV+xu9bemKEb4Nhj4WGhuS6VpCY
         gLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633709; x=1747238509;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lcz+l8Co0SDC/cHtMO2vcFW8EyYc7hvrzUdAF6/dLuY=;
        b=Z2R/jmUX6Jvz5Gy026F7yHeuJKWJnbiCESzm5x6EgUqkx+hnBTTGG/mwNyn+2FH6P4
         7TQ/FkSV9ROLuGX8jSl02EpTB/u6WHy6xu4GNSkf5UpwEMMBS6a4bVZRgmbJI/5lhvcG
         7bjo66YR3xqhu6feCLH55AOweW9odnZeK8Pfx4o6GMJ/GUXOQg7TN3blDwEdZme7myxf
         ddFnyye0BCkP+TomBNS+2hPi9L4TXD8JubEq4Zp6h1Ok5uebwgNxycGx3GSkcUDRc1yv
         tPpWAGKD3RyFHSHSXzZKCPAwVR9GEfZsAaJRKUExjTLmW4rACVTpyjITJkHTdjZC+5KC
         sFqA==
X-Forwarded-Encrypted: i=1; AJvYcCUuet72l/D7Mlvov2NnSVmoNKn3hfzUShc1BJWLIjSX+aO0fAUnADKSLKpPPrqiKxoOKx0fp1Sa+AaUbGHkvqX0@lists.infradead.org
X-Gm-Message-State: AOJu0YzI5h7j3MQ+PuzliC+vgjOfv55OXO8cEHSgjchyoCM1MDuq/i0P
	2y6k/7NbsqwFFYBQceoX1hDDoQJ4pfJ3kVCmMOgaJWfPsoo/nGRr
X-Gm-Gg: ASbGncuT9tktApJ0CaQwaQvqVPCO+kXD20b1Ryp3S5JtWRzbT7KJGr1tNVZwlZ6zDKZ
	QX3vTsNWrnWBqorCDZ/6GtZo6L4sjRI65ojHbZrlBsfIxosLW0/m5NHoL4RwV6bpRX6Ch390AgY
	Ps1DDQ3y6kJQwpsLEFkj8JgMt6ZytXgGFHhVD7lV6crzNvvxRQuaFHt/iaXWsBJrWuiJZjtE/Dn
	pY4TnwUDTZn3jpzh80GSTRvUZDBpOT8Qb7baOZll1lkVOuV4z8hngijxytHPT1hJSMOj0D9YSxm
	MqU5E3DBUqtlWxZE+NioN6bMhBcZ0PPK6ecRLksae2yntY/F/tiz/Z0vOG+W9X4=
X-Google-Smtp-Source: AGHT+IHtf5ETBNi0g7KPKcGrpppl4GxmbE0GaRV9AigEcRMrHyTDtjao1tx6BacGw5smVf9EeZkAGg==
X-Received: by 2002:a17:90b:278e:b0:309:fd87:820e with SMTP id 98e67ed59e1d1-30aac1f04edmr5636711a91.26.1746633708633;
        Wed, 07 May 2025 09:01:48 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4f82b86sm327242a91.44.2025.05.07.09.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 09:01:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] remoteproc: imx_rproc: allow attaching to running core kicked by the bootloader
Date: Wed,  7 May 2025 13:00:53 -0300
Message-Id: <20250507160056.11876-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_090149_742484_65C98D93 
X-CRM114-Status: GOOD (  14.57  )
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

v2:
- Order of commits changed, now "firmware: imx: move get power mode
  function from scu-pd.c to misc.c" comes at first.
- Updated commit description of "remoteproc: imx_rproc: skip clock
  enable when M-core is managed by the SCU" as suggested by Peng.
- Removed "imx_rproc_is_on" function and dropped unnecessary include as
  suggested by Peng.
- Email corrected: peng.fan@oss.nxp.com -> peng.fan@nxp.com

v1:
- https://lore.kernel.org/lkml/20250505154849.64889-1-hiagofranco@gmail.com/

Hiago De Franco (3):
  firmware: imx: move get power mode function from scu-pd.c to misc.c
  remoteproc: imx_rproc: skip clock enable when M-core is managed by the
    SCU
  remoteproc: imx_rproc: add power mode check for remote core attachment

 drivers/firmware/imx/misc.c           | 47 +++++++++++++++++++++++++++
 drivers/pmdomain/imx/scu-pd.c         | 29 ++++-------------
 drivers/remoteproc/imx_rproc.c        | 17 ++++++++--
 include/linux/firmware/imx/svc/misc.h |  8 +++++
 4 files changed, 77 insertions(+), 24 deletions(-)

-- 
2.39.5


