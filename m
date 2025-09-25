Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B104BCAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 13:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EejZf4QziLZePomlHcKbVbhRWJO3IKyIRNdV3+twcUQ=; b=AGPssa/EjlwSA5QzcU2KTvbOOI
	mZjVQEPhywydIWDAd17P5lkuvJmjJgDsDYSCKsO+LRewyqAuxSOYBMWkg4VY5N4NjulAj1uPaiMv8
	32Py75VUu/WDKL5jzq7D+Rm+F0xEygdAVqrgX7NpiSQtnR3xufx/UP3wgdOd838W65W6TIibgTe0f
	WeBeG01QI6cScEUax2w48KwS2/W/lYifMm0/ps5BGm91Ck6su/UALG8lJSZdqVeJOS3yrUg3VsuWe
	aYqTJVvFrc12uU1ukElQNztcfDZ5R8+OfCzBnr+ulzN5+mxTBOePlYWwnAKuXA3+/+TJ+WinB9BhA
	96DPr18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lgP-00000009F0Z-1XIi;
	Thu, 25 Sep 2025 13:06:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1lgN-00000009Ezk-3b7a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 13:06:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 46D9D6054E;
	Thu, 25 Sep 2025 13:06:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920D7C113D0;
	Thu, 25 Sep 2025 13:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758805607;
	bh=tqHiPuaWvPkWNyWSejFJnXiHQaUaHLR+Dsrl+qUoonE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kQrG8RUhEmZDzFq7uUXrW2aUzU/juCKW/Z0JZX4mnIHFCAL6KODWeh4dB6AQLe6xc
	 PfTNxofgZFn89DvL3mZLIRwlAly3B2gydD1YejNSWbYD/KV0SDt1uvMcQRRLaMLwtQ
	 +8sMFXWtkbVqMLsTdaUtt1DH0fVU1UR3YmCk3AgoIJgXuMaLo5iGBTMy8UPyUr2PgM
	 UQl41Q9MTh7Vn6O08eEOe+v5UjEYvbunuUT6kNGuoHvq1G0jiDKO2C/E8yCaGgHwxB
	 5Jzp+QsnsbT7ljExB8ER52wfMKfndh3GlRPPivYMCuvdBclDMeUI1o1BCCb5jrtvzR
	 2wyZH1ZSnLBAg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v10 0/4] PCI: dwc: Add ECAM support with iATU configuration
Date: Thu, 25 Sep 2025 18:36:36 +0530
Message-ID: <175880556056.15879.13833041080045099781.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
References: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
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


On Tue, 23 Sep 2025 16:56:50 +0530, Manivannan Sadhasivam wrote:
> The current implementation requires iATU for every configuration
> space access which increases latency & cpu utilization.
> 
> Designware databook 5.20a, section 3.10.10.3 says about CFG Shift Feature,
> which shifts/maps the BDF (bits [31:16] of the third header DWORD, which
> would be matched against the Base and Limit addresses) of the incoming
> CfgRd0/CfgWr0 down to bits[27:12]of the translated address.
> 
> [...]

Applied to pci/controller/qcom, thanks!

[1/4] PCI: dwc: Add support for ELBI resource mapping
      commit: c96992a24beca0768c1c42ad25d6a466e17ec70f
[2/4] PCI: dwc: Prepare the driver for enabling ECAM mechanism using iATU 'CFG Shift Feature'
      commit: f6fd357f7afbeb34a633e5688a23b9d7eb49d558
[3/4] PCI: qcom: Prepare for the DWC ECAM enablement
      commit: 4660e50cf81800f82eeecf743ad1e3e97ab72190
[4/4] PCI: dwc: Support ECAM mechanism by enabling iATU 'CFG Shift Feature'
      commit: 0da48c5b2fa731b21bc523c82d927399a1e508b0

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

