Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89316CF31AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 11:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHWhResZfOaWpPd7PHeiyqEECUJy61LJlOwuWtnbqKQ=; b=cVaD+kA4Ae9CY0oy/gpLse1Rjr
	jHNV+gpJ02N9X4mJpTf3PAR3LkXzaNWn2ECercKVQOYKp32hx0IYe7Cwd7sA3i/JtSVVOnGQDinJc
	pXRkGz6yKadFpt4M0JHk00oF/mUehQFzMJxkxogg44ryIwNGT7ElzfVASaDR3iJ676kTrpJAPi9wE
	ecNrtw2h4YLlJJF+fY1NLcdgkcNQPlwWW7PsLAS9yVZCIb/9+l8YaxalLhSPTM9Ix3q4/fBPG9Vmx
	OMHqOQbTEdM+fVBRW2Hx3gWewxQ7aLx0K/d46odt0qMvq87mXxtaBP/WE/W+wJcsFRIRvpp1iDx7l
	pkneewpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYC-000000033Hg-2mD4;
	Wed, 19 Nov 2025 11:40:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLgYA-000000033H1-1U1z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 11:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C8954408C;
	Wed, 19 Nov 2025 11:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31432C2BCB7;
	Wed, 19 Nov 2025 11:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763552437;
	bh=j8y0p3t50uO8yovm4KUuNPEx5NfrhdqpEjWhf0tKHUc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ercPpsKtZGUSKEOqZFFItNgPN/UTqpTObdDN6yopy/DDzSOkLGjidB6lqNaBhh5ko
	 byW7aRW5dYzRmCCVe3sKnJTgV5mcjWyEjwAXdWHjr7hwmzmix98Ud8E4xsyhFTn4SZ
	 T8zoukJ0zYRW23Bc5lAWPL147OXd7VJmB/oT5aUMQRRN3k26gMxyH0+zDczvqXEm+a
	 7b+cEwhQxzQNgpdjNH210VcYx2k3lLW8WiOsVjF4SDxsk/gksCn+0Ti0jOihIgpy8Q
	 ii+sCpYaOdhv51mfMm/4gbjp4RHzjdwfRD6ibU5i8No2Bgs3L3q0kNms9DGZWhG3EE
	 EgYVyHyC2atEg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jesper.nilsson@axis.com, lars.persson@axis.com, mturquette@baylibre.com, 
 sboyd@kernel.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, smn1196@coasia.com, linux-arm-kernel@axis.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, pjsin865@coasia.com, gwk1013@coasia.com, 
 bread@coasia.com, jspark@coasia.com, limjh0823@coasia.com, 
 lightwise@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 shradha.t@samsung.com, swathi.ks@samsung.com, kenkim@coasia.com
In-Reply-To: <20251029130731.51305-2-ravi.patel@samsung.com>
References: <20251029130731.51305-1-ravi.patel@samsung.com>
 <CGME20251029130826epcas5p180506ff38fb57ecca0e33b2f5c57ed6c@epcas5p1.samsung.com>
 <20251029130731.51305-2-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: clock: Add ARTPEC-9 clock
 controller
Message-Id: <176355242978.116968.261312419155141714.b4-ty@kernel.org>
Date: Wed, 19 Nov 2025 12:40:29 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_034038_416629_D04B38EE 
X-CRM114-Status: UNSURE (   7.55  )
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


On Wed, 29 Oct 2025 18:37:28 +0530, Ravi Patel wrote:
> Add dt-schema for Axis ARTPEC-9 SoC clock controller.
> 
> The Clock Management Unit (CMU) has a top-level block CMU_CMU
> which generates clocks for other blocks.
> 
> Add device-tree binding definitions for following CMU blocks:
> - CMU_CMU
> - CMU_BUS
> - CMU_CORE
> - CMU_CPUCL
> - CMU_FSYS0
> - CMU_FSYS1
> - CMU_IMEM
> - CMU_PERI
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: clock: Add ARTPEC-9 clock controller
      (no commit info)

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


