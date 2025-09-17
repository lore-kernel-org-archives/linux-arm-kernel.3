Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65601CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 08:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=; b=18YmFzVoytd7dh1WRC72KOyyEi
	Zw8Ko3HGeBl8Y+V/UowQ2cAQUX9Uxj7dRTgUVaiS231PQdD+o0ppwu4og7EVCQcj1OyM5YGu7qWXF
	/8J+6+M/KlciOdFdujKecDBG7ZtRGZ+7RjLjCq4eTdyaVuICWXpf7o/lUADY/EO6dt6bP2OvazrkO
	JnloIPLad2NlxrwFX0o437s/hdMpK0cgfEK53HmfC3fFib5gpjuQOriFIm0kV6WueQl4axcCyXNeD
	TeEifBnl4rnjF+6rarxYby341Nsyaloxi1hDyGImmUT+tKufGlJTzg6WUa4KFjZWIjygoVkHgDCFH
	SgSLf6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAc-0000000AZIm-2UeN;
	Wed, 17 Sep 2025 08:05:42 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uynAa-0000000AZHj-0gHC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 08:05:41 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b07d01fd4fbso720636466b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 01:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758096338; x=1758701138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=nMyPWJ/706oNhDob8NFZZYLWoJx4XarfnL9SQytzNi7OUjTArGKJPiQEv780A5o1tf
         hNPdjD0I+u2/nLzXEarTiwmyYX+v3UB0Op3MsWo8w1BKS92LUhlSqAsgL5vY2tH+y2Z3
         QV6zBrGJQ31RzKPPFt67GUu5IDXfR15bZEVc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758096338; x=1758701138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NPuegdZHn6x7l8oR57Kwdwve5Qd3dUF765nGwdELATA=;
        b=Mu/ySWbao3Wb56LTCUDkFxhMTi8NhqNI8rjQ1qSE9FmAWRsy4+jiZgUzrJPArKnTOq
         Se4Ct5iU8tu+s/CUGCJmMyKDDQHrL+Kk4S25o7VWf8QDc+L0HmynjgQdwzcuJ0+I6HKl
         wfXsGGSR0x5NG43mjPf8bN8VlBh4VrtEIpgOnTbj/ommIteiCdbROUW0BvFBPUYq+fLp
         2rCdiDi0sleJYvCyFw6Y9blnYJRWzxy4jYFSWtO5MDkcYgnwq5cZhC9TB0dr16UNRCL2
         hfDNfaRQVHiY1NWAK12WxZEmDVn+EeqT+p/IOJ9qjiiEggSp+F+fwGwkgJWLzDDBEsGN
         TzWg==
X-Forwarded-Encrypted: i=1; AJvYcCXdJeq7KTDBf6invpYzztL83JjjPRsjGG4Vm4b8nPQAp2mC2jEGI+78WYMBjUa/wo3Zb4goOwqMF9FzOYRvbW2e@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7KmKZlxTy/IHsrhTic3pRlTBVEhsQXlfJMbLYXSOOrWA9H6Tb
	CvyRxwRlDPM9P21X3P9FJU5KMDWsuZEaPA6V22xNQrfwSKre1iVbfG+xooVszp+oGcU=
X-Gm-Gg: ASbGncsNwFdHTAjIg3lY2+3uw+Va6MgwSf3gOS19gvlHbrR8HItunvqUkbJ+wPATNqY
	Kc6Vk2fnJnCbq+lsfR01uVQSmoWJlJUztCa9XuJ/GRRs9xOW9SrJNhJ+DcMsnvD4xYJkjOPhpm2
	qgP56wvDZ2YEoftLU634i5tAv53QQgwD4CW54BrabLQUit2CdgVS9Pfzn9gDgo9lT0vPys+FdFY
	nKrsZw+iZRWnyCY+rgLavRVBJd5vTQwZxzj7lWPJaHDqatNUWV+ZyXMENFns4F28Kp26icTqba9
	e88n5z2ekDVpCmKI6o8hWoxoLvi3kNIjcja24mKDMSyI1gcwqnqfAaaz0NXnM3W7nvAVTYhXdul
	COddkA9aZAxksYLWPLGn1bYu66I1pAojTzGyQjgiRrx6cejlDV/otefqx32C7y5ej4cmjiQ==
X-Google-Smtp-Source: AGHT+IHVO4VaMS/G12IQZgMNriTBY++2CzCi4uYICi3wwhLDtof1MCwW7/7vKBLZtIfrjjavAGmS1g==
X-Received: by 2002:a17:906:d54e:b0:afe:6c9b:c828 with SMTP id a640c23a62f3a-b1bbebbb0famr156412566b.61.1758096337795;
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:1215:4a13:8ee5:da2a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07e1aed5ffsm924936766b.81.2025.09.17.01.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 01:05:37 -0700 (PDT)
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
Subject: [PATCH v4 0/6] Input: imx6ul_tsc - set glitch threshold by dts property
Date: Wed, 17 Sep 2025 10:05:05 +0200
Message-ID: <20250917080534.1772202-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_010540_237292_32CDCCCB 
X-CRM114-Status: GOOD (  11.37  )
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

base-commit: 5aca7966d2a7255ba92fd5e63268dd767b223aa5
branch: tsc_de_glitch

