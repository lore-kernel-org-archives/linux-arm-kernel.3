Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41296CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=; b=RzilOR22DFlc4PLKmOxrFkaYNS
	9//GEYHFpfgqn9GBdexs3PFtRykjiPH/i4S156kZrItVOY06h/byP+gCVXaBdX/seh+cKuLnsGRlo
	4JZVe/3gzFsz8dYaeryhrZF8B7rNqjk0QdKQQXT+AFLg3xSnr+OyyT275iuVo+e1PQoHoi/Fbqg6t
	EcMNhPoBC70/i83uSWqDjwxMEKT8db6tUx/pmUX5kZhsg6VCwdr5aQeIvhtLDkvwyvTm/CnnBRCLp
	gUZ06P6cWzHdXrAtmHiYX0QXP0xVF3KNVT5zsc/EgihojLkfDL8Uk+YY5eEIlZglGIw+6nebv6GDj
	LLpR2nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149S-0000000DpGo-2ARI;
	Tue, 23 Sep 2025 14:37:54 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149P-0000000DpDb-3uA2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b30ead58e0cso106460066b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638270; x=1759243070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=SDGZVwFNC1CbDE6trbVx5EXKXxjgQCFtW2EeIhrELHqJXzRFSFtbwx8Ck25Xm8y5or
         l24/i6ZbMG0ae37pIkH8xFT++lnpdmLhvfuda/iRC+34nLTuOkTMy4edJZXqm1UDk/qW
         4SXP0bNZb68TiOmltJ+Pu3lO3fdRJM69NET8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638270; x=1759243070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGN9wOEKVu6Y0MkI62rSbl1+YeaRDVK+dO7uXaWW+zY=;
        b=Fmo65T4v+H9I0scj4psFTaa8fglsopersX/S3wqQqiWRfHnEhIGmQMT52GjLgcNSUn
         tvrzPqo6nQYw98S01xNtblv8g3n5N2yytsg80K/JneulGXTAMymhPfSQjV/kIrn/GZnH
         Wa0lPQ4Nz+Ho1h0Pct88CzqK18VkRszB5NcVEEA/iyh8A6toRIN2TNuvU0ulu9b7aG50
         rKZFsrZDlNf1F2de5BPzoL2Qa2ygjaMbZId5rs1upMJAER19MTU8qcT7brBzXlDLoZhS
         1zqmV/h9XA+b7zuO6OGfE119+bO4U7pJwz1htHzkiHX0WsWqZEOc3Q5JpJBTa1o6FOwT
         vG/A==
X-Forwarded-Encrypted: i=1; AJvYcCWRX1UnrSZKke2q4tgUozJLi7k+vDGFP7M5Ck7IE+IuAFVi2PUNRUOz63Qu5sK1iauGGXu5/7DDZIiaY6HkLFZr@lists.infradead.org
X-Gm-Message-State: AOJu0YziFLVzPfvJpMPam4AKGGXkxVktCeO33aIg5dPpT/mIMjv8q65d
	5SjV8xionSPm7PDJEiSY91EG7GDrTy0YEBI0WdIuYr71lqQkoeA0OTtPuvBaodOcXZU=
X-Gm-Gg: ASbGncsSGuGwQTx3mznwo5cT6SkcWQWhHENHDqiSguWiOQMdPkOX3UiCG+Rycvfgkvx
	f2wSB7hO+AHvRl86zYf8LbrZWz9dPSPzyzM2DoNleTzTUUxHf66L9KfE4t2aiBnMEXcZmX5JAg/
	omQosR1LbfSpXxmPG9F3DcN+aRTsC8uPcqGN1TJjoBD6DWjVjZS/TQ22bIg1qUJ/49zjPGxwr0+
	Jx85LqaDFIXflO/7UBK/ax/OqexPxSBuyIijPqKiUaTodpYDmrrHZJxpTyI6Ybuy/9jgCwNdK/F
	xUDNFj3x7sVYlM2DJXFSmi9CfZfXFLcnSXdrjb6rs3ZedEvO3AMb/hPzf0tJX8KY/aYJSSBzBqv
	tWVr6Ac9fGuq7w3PKIhONRdHlCVUvyZRTlZA5JexrStJ3bQ4GGXNzHZu1rZu3GI5rIl9AUliY/v
	KG4qWzruqnQuwqg54B0LQEKO2XW5p8PJTrxkIGx4ljGlBJl16+8kmRQt01c6mj33ks9qxWeIMrT
	VlCEO5P0cQZI0VSneLGFg==
X-Google-Smtp-Source: AGHT+IFwttb50sZUcwgmSz2G3CQLQR5bfVABRjQhUNlQEOt6l2vdv9KmhVHV1IgxO1W1paqY4PecbQ==
X-Received: by 2002:a17:907:2d11:b0:b04:a1a4:4bec with SMTP id a640c23a62f3a-b302bd129eamr273054866b.58.1758638269935;
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Tue, 23 Sep 2025 16:37:31 +0200
Message-ID: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073752_163525_41FDB8EF 
X-CRM114-Status: GOOD (  12.30  )
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

Changes in v6:
- Rename the deglitch property from touchscreen-glitch-threshold-ns to
  debounce-delay-us.

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
  dt-bindings: touchscreen: add debounce-delay-us property
  dt-bindings: touchscreen: fsl,imx6ul-tsc: support glitch thresold
  ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch
    threshold
  Input: imx6ul_tsc - set glitch threshold by DTS property

Michael Trimarchi (1):
  Input: imx6ul_tsc - fix typo in register name

 .../input/touchscreen/fsl,imx6ul-tsc.yaml     |  14 ++
 .../input/touchscreen/touchscreen.yaml        |   4 +
 .../nxp/imx/imx6ull-engicam-microgea-bmm.dts  |   1 +
 drivers/input/touchscreen/imx6ul_tsc.c        | 121 +++++++++++-------
 4 files changed, 96 insertions(+), 44 deletions(-)

-- 
2.43.0

base-commit: f975f08c2e899ae2484407d7bba6bb7f8b6d9d40
branch: tsc_de_glitch

