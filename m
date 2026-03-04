Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2DBEFCE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=; b=l6VBMfTtCtf0V+3Tq1TBsz9/7N
	81fGaOR+yy1pFY+TOpDcRXMMjWprnffrg+FniO2IlF6puNX1kX/xtqgVVib7HvkkT/doH3ge6Niyt
	R2q6BacO5qWzWIcxjxxKJefD2s17cHK7BXY2ozPtX/ilMfslP92eX/adUp8zKCASGlZjdm95QpT0N
	2K11rxAhHopHzPKrn6jnVD00Fgoyg4DOBNXgNC4Fkkfj2yf7Cfo4qQifFmr7Oeg2Q0CvYq+dxpUc+
	WxtcDHPBg/VLO1dSxWj1+EpqW6LEqzszumdqnO22UaDamt0vvL+Bz18PDQbctLxrOb7uUQ7QP1Mrm
	PJQpwehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpq-00000000OWX-3aod;
	Wed, 04 Mar 2026 19:24:42 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrpo-00000000OVH-0xRF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:24:41 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82747396358so3770254b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652279; x=1773257079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=;
        b=inNSkhGqV9obm5AW/3KT2zSMx2OXyYXe9OJOVvn0kACB779Ec689ZiPy2wQWIPkJiV
         Fil1dCbsrqJjiG4CSth49e/EtU8LPLSQWBTpwl9bWXPvl4bD7HmYOz1NBEyG2JW3XyNA
         aTQPBM8nO9LMTO4dky04BC1kQml8ffrN01fUi0TkvCd/vDYcL5lDnNywBDQoO1l7Ev7G
         VCqO5b3d1EAihmdXESg6wTQkzN+E2ZUZi3Ar8ro+oDtOWSHuGPYiYB+0k+KwDm9Xzszb
         iYx1DGTa+0TUvmtinAGR7AN6I64THs9rzNjmAkhIo8wQXhkTrocd0sZ3dH6Otkg/w311
         BMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652279; x=1773257079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zOuIkmgeu30O4yBUUR0bUaK0PmNnE0z/sa5+7m6TQAc=;
        b=SRPcoWRZOTCPgc4HdaFhQzR8C99C2MfX0LHfmEMJovwP5B1Pn4oalNWi7NapxnotrS
         Ra68Nfa16w4VySupe+xIqQsmy29u+UIY2L2JiFibzsFt+Ju7JP18Gu+DVgsUORiheZvL
         ElwLuY3hP9e+XibB1gz1Pxg+722ZR8an4ldaZgZ3wxmo4AQji+ufkOXRXRxrjHY1YQuE
         LB4Orj2q73SJON3v1WDzy8Ub79EdRq2QSilYZDsCtxLnPGIXI3Ry/wUWdBgy16KZVE/Y
         qQtZZ3F7a4FoaSWS4FdjSsh+9rEKoG+zcqneF6Jpke4X+GkKskYJP0PSw/fD/5UcR0++
         i6FA==
X-Forwarded-Encrypted: i=1; AJvYcCVRHk6jDHH5BBQvtDHV9Kgt+XYao0HHRnhFn+grRZpI37rU1QPmH1/8jEHwFqxlQBB/XhLBTNtwEYGJ4UESOSQs@lists.infradead.org
X-Gm-Message-State: AOJu0YzR6+K0PsX1vVWopc/G1/GCrEgw6mD8sXXeemZ9XqNUSkUCuTj1
	9nyHSSAZkpqj5e02DnZEAa/b6RHQ7xSeiYsHBLAWkJlu18zvAeLhzTXJ
X-Gm-Gg: ATEYQzzCl2QjYqfN6AT575NujFPQegaWiMs7lttIhqD85bC+OYLphaBpnNBRPPkcLU0
	c+DX37XxV1WwcUrWf9u94YWqpFlhDu+emYPVj9a407A4MHQKAvAymh10QD0yXqo8ogtolEutHtP
	J1xw5PHdnle61NN8e9pTRGI9BADxvPa7IbYPhziWxVE61x2elPV/XVzYKVXN43T7O0HcFWuzgDv
	lg7c+k/eU+YMvaN6JKsDZ6aCWAZBQqOG8zsmPMoU663PVvx+lA73p6gtqZmJPbuiOUYLm3Itl7h
	EU4FAopNHYKugxKn9JM/PrAJe6w7tlaJFcW+TQcoC4yhfuu//VH6cmN4XYWdVl0oMOaROe5jD+P
	f57U72jC5lCdLcX7UeYRkGF2NZU07Yi+OqKFhDtqVb3Rmu4QZUzkUEDlgDWJxqoj1oUWMGSGnj2
	m3rdplSexE9PbeP9VJ+N8ADnUB87fJfXQOdblpYm4sKvHKCWYPc5YKrcqxRdOhuCysPXUKE6bR6
	F+KB34=
X-Received: by 2002:a05:6a00:22c6:b0:81e:8e66:38d8 with SMTP id d2e1a72fcca58-829728f0c2cmr2388151b3a.10.1772652279202;
        Wed, 04 Mar 2026 11:24:39 -0800 (PST)
Received: from buffalo-ssd.taila54753.ts.net (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d8805esm20233563b3a.16.2026.03.04.11.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:38 -0800 (PST)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 0/2] Add initial support for Lenovo YOGA Tablet 8/10
Date: Thu,  5 Mar 2026 04:24:15 +0900
Message-ID: <20260304192417.818211-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_112440_263883_9A125D99 
X-CRM114-Status: GOOD (  10.45  )
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

This series of patches adds basic support to Lenovo YOGA Tablet 8/10.

Akari Tsuyukusa (2):
  dt-bindings: arm: mediatek: Add Lenovo YOGA Tablet 8/10
  arm: dts: mediatek: mt6589: add basic support for Lenovo B8000-F

 .../devicetree/bindings/arm/mediatek.yaml     |  5 +++
 arch/arm/boot/dts/mediatek/Makefile           |  1 +
 .../dts/mediatek/mt6589-lenovo-b8000-f.dts    | 15 +++++++
 .../dts/mediatek/mt6589-lenovo-blade.dtsi     | 39 +++++++++++++++++++
 4 files changed, 60 insertions(+)
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-b8000-f.dts
 create mode 100644 arch/arm/boot/dts/mediatek/mt6589-lenovo-blade.dtsi

-- 
2.52.0


