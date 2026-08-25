Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E4C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WfKwrsQsbhSFEOX6SfTu36xoTWQiVVGz+Pctm+PKW2Y=; b=YVVnkw/u/D7KkrWtrQV1+WPw4t
	pppMi64wkiXNUG+niQQi7HSzruoAKdvY8k02uPCFZAmEquaK8Hl95hjgwIlbGYeDpHOjorm7Rfc6V
	TNp1O6EkBJKc9p0ldVXUZ4xswaCE7JquS/b0caFNRYa80eKKn0dPdji2WV2/VjjL3YMICTq9m+/pl
	vye1hQeBef+pMHgp1i7xPkfkiqUvSBOaTTMvjRruofZ49I9u/QHNDI5WnyBEOhw3kMzRmgHnpgu4X
	33Fs7BeeZh2wdOo+fKslkX6I7PhnONuksWzuEWQ61DKfE6Si+OLhF9oeCRBZhUibUpMW1opAV6nUZ
	RGMuxRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrjl-00000000v53-43Qi;
	Tue, 25 Aug 2026 14:02:50 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrja-00000000v1H-32ae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:02:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso8109680a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Aug 2026 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787666557; x=1788271357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WfKwrsQsbhSFEOX6SfTu36xoTWQiVVGz+Pctm+PKW2Y=;
        b=No59KaaJ1yfqfruShUskSS+H2TYbjCVfXDbMt8iVER1f6EeigaGaRtTSx1Hyu9e8R3
         rl14VpO4Q83wYvwXDNzHJXextJjPsIvkwWoTzffsgMtulRdDcmaQ6EwMW73dCyp5NCCP
         x0kgXT5/hsuupzGkNf/Hz0kGMJb+EOycy55yg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787666557; x=1788271357;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WfKwrsQsbhSFEOX6SfTu36xoTWQiVVGz+Pctm+PKW2Y=;
        b=TqujNxc+wBKwPPr0Uw759RQgl9KGh5XenhGi8caMmEj6EI51W7KcPXycTvScox6ujt
         s297iuJCkFIBOcn7Cp37ORCFlxYMNsXyv4n1mihpqosHTCi+SBiliTMVebaeNlEkqvoK
         ja0fjL/ALkQ0T2+rVThVsrG42sjj/GkcvM4mxnLLggOfxAuK3ct4V90HiyJjzgnaENka
         7BypGWetyvxh5w+ZR6GTHHgtKnlv73JqoHSLfCnvb78J3OC3SqCJ0oVCbgnGh2l91D4n
         hQBLAFXCTl3fjeZu6+BQdNvN+CxAarQ80qSVScPbge6jVI6GitW85qeeWeOIYYIbPzLI
         rIEQ==
X-Forwarded-Encrypted: i=1; AHgh+Roas0RBOxOGGbAsbvEakDDuU72ZzaYY56gEforQ3T6acg5mZfH2s/JVtBkHixc9WYayk2tgJqd0ixSxQWR0EuV7@lists.infradead.org
X-Gm-Message-State: AFuF++mvtPOAD0pVaD4Vf3LLsYFErF69O1055CxMiFcVxIljh31X3LQ8
	Q3Ozo6CQp9OyLtn4COtGpmQixSEAzlLNRYWz0d0B/mBpyaZlVMBSiy9FQMGfjpbhPPQ=
X-Gm-Gg: AR+sD11rHvHnXEt60/qT5AlNI99TeVWPJ0NEc3k+nAFCKKI5ajRaGCJtk0f+Gna/hQS
	EkkfZiiH/5ehzcRCvl6absMfVjU29j9gvAciL+sSqiPt51O/MS6DbnQ4hWqxezlTZ80wxP79h/p
	TOY9Ch4v2H9OWso7ZaKWRStyMXM0Cif3pAaMYY6aFGdjB7e31Ww47RK9ADDaXRiR4bAGiafFdKU
	VDedOjrzTsSbp/y39xrKE765iSGedrQdWzckdNYuKlwLNDaegHg8el73arxOP67DUFxY8FoYvVV
	jzRjE9vUhWNd7tkFmOYD5B6t7TvFejPs7B2DCL3R5Dx2gnKkrXfblxyYl9LSiY9gWIoKkD+IUim
	W0xpCoA8xq++z7xyZXjlHijpf5fZ/k05jA+svMllmworr3eTgZFpIoGwY40236xvn96RuZyYBdt
	gocNZmOppcC0MxZAvWcglfcW62N0Y9cYRkpBVthwQET5qsmdCw02lFSqXjngPo46Hph6VDBAHL3
	Vu5cQ==
X-Received: by 2002:a05:6402:2490:b0:6a1:f93c:f0a6 with SMTP id 4fb4d7f45d1cf-6a5c4157aa7mr8612511a12.12.1787666554460;
        Tue, 25 Aug 2026 07:02:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e00129fsm17187878a12.1.2026.08.25.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 07:02:33 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v1 0/1] ARM: dts: draeger: Add devicetrees for Draeger's M48 board.
Date: Tue, 25 Aug 2026 17:02:21 +0300
Message-ID: <20260825140225.3968019-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_070238_973050_A5EC8E0E 
X-CRM114-Status: GOOD (  10.74  )
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

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the same
carrier and they are cross-monitoring each other.

Petko Manolov (1):
  ARM: dts: draeger: Add devicetree files for M48 on NXP i.MX6(Q)

 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 5 files changed, 495 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3


