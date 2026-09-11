Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621C0C88E40
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6gJ2io6CHbZV+in01bmVOivcND1h8Ntdr8b0UjzLrA=; b=njfLXgA2Rklmtg8IBT2962W3pN
	eYMt/uvOfq9FnQOanYIkRHWDxXwkPJ78u+aM6wQgcznkawBX3KQX+eobchV2r8GK8DUWkpDu3LN6h
	c+Rivxpkag0AIRCA8OtIXiCGcCg8/34ZxIzgr/LHh2/0Ur8e631rCtJMrmA2/4lbdY4LydUYK6smF
	8/Yen4YR4qSTfhURCjjByP/btW4ADZ+8Tb6YjczYfrTilFj/+I0WcuijO0CNIPlOJtrvR8SC8IaUu
	JHQod1fpNZiB6fMtp/2TJJUTL1SmsUkB/ciJFlnq4siQ5CHvbgLQLd/sWLJpawjDg0eH2Qb5g+Kr8
	8jOsqsjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxk-0000000Fhvr-0xyN;
	Fri, 11 Sep 2026 02:26:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qxj-0000000FhvI-2wMm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:25:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E1A1447DD;
	Fri, 11 Sep 2026 02:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16FA11F0089D;
	Fri, 11 Sep 2026 02:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789093559;
	bh=V6gJ2io6CHbZV+in01bmVOivcND1h8Ntdr8b0UjzLrA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PXmcJWPuqB09dI5WFH4TqhhcYaqNIF8hYst4Gnfo7DpAKjfSkchoYKUQdrvpzVWVR
	 HdD+qlQzeP3xyBw136cuPKmObfMEvtlEkh1uL1X9XJ5UApKS+IKymnsresD9zrugNN
	 WZDvaRv1Ghwq8ILWkREcibno363/XhJmLTdSbForq1X90SkmWig6fBRSFlR8qIdEER
	 8kMLjRirPoVtKpuIn0d46jNSvINm1DNfKHzHqqkM5LSWqHkiYnKVQ/lDi9hPs02nzo
	 RdbPUzZTXK3fIxVWQZqrXSwNl/CYxQ1sk+94Egw4zFvqoLdSM3/2jqfc3mHO/P2Sxo
	 XUUlJf4kJGkVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Georgi Djakov <djakov@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Thu, 10 Sep 2026 21:25:35 -0500
Message-ID: <178909353843.920241.15734171629938035637.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
> 
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
> 
> [...]

Applied, thanks!

[14/15] dt-bindings: arm: qcom: Document Kuno IDP board
        commit: e3fa925ca180aea34852e282211fea12501cb6c3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

