Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5104CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=; b=V+NNoYdWW5CAwIna7kQ194e04m
	Q8+o8jhWK6ksBFXZ+y5kI9Q+pflRGrYDmDXk1rYYr+pWgxgVEVYrip37XMzCOrgL+NXYNEYPrhzzG
	gynX5c5SqwJETDa0zg8MviI33Lkwh2waE5nDYjfuAJiXfqYttu7AJOMQzj2AM/cJtXruClscjJt5o
	l2N6Da44N3F5eyIAJ9/CXT5BgqVtbUvEi4VGuuJ0/fzdMD3Q6wx9wQ5Yg42uuPxeDbuNTvge8HeTs
	5+rIDK1QrFaDMDqZhHV05LDKvRmfrlQKm3WHULV78chUv6gr5cGYexS7RB0st2xoMjHwxkz1bc1Hp
	9IavSsQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGwC-00000000Vii-1p2a;
	Thu, 18 Sep 2025 15:52:48 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGw9-00000000VhA-2CDb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:52:46 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-62faeed4371so944770a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 08:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758210763; x=1758815563; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=dNgLNWPDZ5WEr57y78sVZOinF7UblFtNFAL4w/YVAIZWwPzMzYNdYvSzgE9QzEVCT2
         ejoLsTmYM8nmvf5jDTECEdII3BAmOsl1pSLJajXLhaE9t8xTrAQiqXlBaTpAKylgD32u
         3iBSod4UT0qRRqVy0VhQ0eDscKuHH2eRgLGvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758210763; x=1758815563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAYxgB8lIv1DHNu4xD8U3kG1jVIbjN/0r1y6HPZ0wc4=;
        b=qO2kLkRw0n99vWn0kOEXE0B+NZD+I8cKhVSmlpc9YyQDa31NH4bcBiwn24NIk5+bIK
         oOocpUCaTX4b956mgVU4jFsdPjn7D1IpMpGpCsRlYjcgpdqZA5vxk81+C6RV2ynZRw95
         c9AXbe9ACwvmIRf+u0itkECyG2/2dWof3iFUzcGjHjOCYG0ihQNJa2M+hBvj2/pBV9rx
         DLyj86sGRCJTLoxskvs9OVrzVWm14DQg+WuvaLz+9rljvHiaGdCzy1Cdl7fDT53I3x29
         g62jvOE8f/gTA5It0NiNYo29QudJcv88j0jaEabrY52y4IcIwYRJ8sof+u58IspST9sj
         4XPw==
X-Forwarded-Encrypted: i=1; AJvYcCUvyUYHXChYp1fuwZsWSPMu2s09nZhhTKLArMBKVBD+0XcfvJ3vnNg4KiIQaIN8mpi4s6qmw1+APqlVhnWeT3Dt@lists.infradead.org
X-Gm-Message-State: AOJu0YyyL5wijBMTgFWs/c6tE3OtxAwy9N5fKbLH/ifze4vTEOZeF3Hi
	tmXsJiYuDAiPUemdYtSG+3yOg2YZtnl3vK6tAhlRSwQJcjxzqHpKWs42OlXfZW73BHQ=
X-Gm-Gg: ASbGnctaQ+ts5yL3XhEwohBKLlzqbUtBpQ5zCxBqFWJM/OYQNOcCFbSqxp56oGz9b6f
	uEGZamrMzfNcUD9q1W+AnlOSFppUlsx+BSrolCLVrJ8BRDm/fkjgFgA179Ck6r4ouvBNiSL72Qo
	T2uXd3LTzFlOERrB9PIUvZ9wvNYAtdvKllv49Ny7sBR7UXcamd3udGt6znz2k1GuhoPSTRKuV2g
	5R9jhcW4VSXGxQ8EvPaOyTDciWKemL3t2AgZG79ynTBgbha8vIxT4WS+OsBZF94zS0A38kwFgVi
	l2TWOjGwrvzYCiWWH2CowXQHm7QxWuM45auOOr1pTlIQ7KttP+ioHYAPItk2/eaUx+ocCsXJqwV
	p3cSCGIw0iP3E73k2gmk3h4lujfnS/ykmG31nZOO8CitIXyw/+WqiaOXIYPYfcdluhyniKxU1Jw
	wQMrCzuXEAnNvgNoKeAdzZ5lsvb4i5+MHRycockqMcftZroIEGQlbNW6zrrcfu+YmO3q3g6Ucpy
	HyUJUwkrKY=
X-Google-Smtp-Source: AGHT+IGEnllZKc46D2GPpX8tp6qlYesswGm+zRYFM4v7XWzLwEmIplTDvSQ6hbelWc77fsdE9AoPPA==
X-Received: by 2002:a17:906:d145:b0:b1d:285d:185d with SMTP id a640c23a62f3a-b1d285d2b12mr512201366b.0.1758210763485;
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b23a1227bacsm60449766b.41.2025.09.18.08.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 08:52:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	Jeff LaBundy <jeff@labundy.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH v5 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Thu, 18 Sep 2025 17:52:28 +0200
Message-ID: <20250918155240.2536852-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_085245_597368_F5FE1DA6 
X-CRM114-Status: GOOD (  12.02  )
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

The series allows setting the glitch threshold for the detected signal
from a DTS property instead of a hardcoded value.
In addition, I applied a patch that replaces opencoded masking and
shifting, with BIT(), GENMASK(), FIELD_GET() and FIELD_PREP() macros.

I didn’t remove patches:
 - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
 - 1/6 Input: imx6ul_tsc - fix typo in register name
even though they were accepted, to avoid generating conflicts detected
by the kernel test robot.

Changes in v5:
- I didn’t remove patches:
   - 2/6 Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
   - 1/6 Input: imx6ul_tsc - fix typo in register name
  even though they were accepted, to avoid generating conflicts detected
  by the kernel test robot.

Changes in v4:
- Adjust property description fsl,imx6ul-tsc.yaml following the
  suggestions of Conor Dooley and Frank Li.

Changes in v3:
- Remove the final part of the description that refers to
  implementation details in fsl,imx6ul-tsc.yaml.

Changes in v2:
- Replace patch ("dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add
  fsl,glitch-threshold") with ("dt-bindings: touchscreen: add
  touchscreen-glitch-threshold-ns property"), making the previous property
  general by moving it to touchscreen.yaml.
- Rework "Input: imx6ul_tsc - set glitch threshold by DTS property" patch
  to match changes made to the DTS property.
- Move "Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros"
  patch right after the patch fixing the typo.

Dario Binacchi (5):
  Input: imx6ul_tsc - use BIT, FIELD_{GET,PREP} and GENMASK macros
  dt-bindings: touchscreen: add touchscreen-glitch-threshold-ns property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 122 +++++++++++-------
 4 files changed, 97 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: 8b789f2b7602a818e7c7488c74414fae21392b63
branch: tsc_de_glitch

