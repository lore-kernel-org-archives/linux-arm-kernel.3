Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C57CCCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmb++IP8J3cLa3q2pSDpPvi8mdJrzMC81BGViM4u5tI=; b=X9plC/w85j57UcExu6TLmWsQe0
	Q7Tmobp0Nvaco2eG6yXCn2bQCc09PZ2cjCQoyAmlHyl3TbDNAz58sOmOvw2UI5kzT60M0v2UO/Ies
	baUC7zlJTGU0awrCu1hAozDOft3YiiVe4M2S8s/pQZ8KhpBQES5Kp48hUwt4SGqOiXd6iCu800utP
	6X2UAXiplajMjFTb2Pbs1ojxT7J3dRysY2hlfoJKWZFIiGHPRTp4L+zof6xoSesULwTiMbbROGULp
	30aButRzSmPHir3KUnUEjwT1MgGePJy6gsco7dU0f2iZNcco2mgkDM+KAVW2TMNUkpSXGk205qF/s
	g/2sJcmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrai-00000009aSt-2WM1;
	Mon, 03 Nov 2025 10:15:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrah-00000009aSW-2Qf1;
	Mon, 03 Nov 2025 10:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A5CAA60007;
	Mon,  3 Nov 2025 10:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ECE3C4CEE7;
	Mon,  3 Nov 2025 10:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164910;
	bh=O4x0jqqxagDU/VftuFhDlptuntE9Kac7vSj33pi2VvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kJ+MBqKfKXeU/teJKJ87gBmtT1H1BpXVfHwO16qP63B5LdGVaJSV+ZjQQmJu9RFK1
	 7ImrzDBiLUdYKyv/kEzjpwZWhzcEL+29oAWdzzer2uxPpLr5FWTEK2cHSVutB00P0j
	 aSCJu+fpbOQHw1up1SDyYXhspEpM/WX63O9IfCYozFIpoE1IcIICeg1nYpA24W2/C3
	 UP+l2hYftcqz7VhZfnGW1e+Pl+yoq752ZwpWFpQPfj8HSGTcwUuhCs9mpFd+DIxZbu
	 1JRpmWucJkIC7kZRS2gXoGxuCjhqFqvhT7jw6pFD119wN0z1NnpfqtAv7ec98zqTMW
	 LdKbA99Io3xLw==
Date: Mon, 3 Nov 2025 15:44:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, stable+noautosel@kernel.org, 
	stable@vger.kernel.org, Linnaea Lavia <linnaea-von-lavia@live.com>
Subject: Re: [PATCH RESEND 0/3] PCI: meson: Fix the parsing of DBI region
Message-ID: <mwdy2qe2kp6ygwyw7ohjykzwcsi7udzitizmbzk2rfuf4jesnj@gbjmjfuvzkvw>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83d07b54-d584-4297-9aae-2a170c0059d4@linaro.org>
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

On Mon, Nov 03, 2025 at 10:50:20AM +0100, Neil Armstrong wrote:
> On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This compile tested only series aims to fix the DBI parsing issue repored in
> > [1]. The issue stems from the fact that the DT and binding described 'dbi'
> > region as 'elbi' from the start.
> > 
> > Now, both binding and DTs are fixed and the driver is reworked to work with both
> > old and new DTs.
> > 
> > Note: The driver patch is OK to be backported till 6.2 where the common resource
> > parsing code was introduced. But the DTS patch should not be backported. And I'm
> > not sure about the backporting of the binding.
> > 
> > Please test this series on the Meson board with old and new DTs.
> 
> Let me try this serie, I'm on a business trip this week so don't expect a full test
> report until next monday.
> 

Sure. I may post the next iteration, but will not merge the binding/driver
patches until you confirm.

- Mani

> Neil
> 
> > 
> > - Mani
> > 
> > [1] https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> > Resending as the git sendemail config got messed up
> > 
> > ---
> > Manivannan Sadhasivam (3):
> >        dt-bindings: PCI: amlogic: Fix the register name of the DBI region
> >        arm64: dts: amlogic: Fix the register name of the 'DBI' region
> >        PCI: meson: Fix parsing the DBI register region
> > 
> >   .../devicetree/bindings/pci/amlogic,axg-pcie.yaml      |  6 +++---
> >   arch/arm64/boot/dts/amlogic/meson-axg.dtsi             |  4 ++--
> >   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi      |  2 +-
> >   drivers/pci/controller/dwc/pci-meson.c                 | 18 +++++++++++++++---
> >   drivers/pci/controller/dwc/pcie-designware.c           | 12 +++++++-----
> >   5 files changed, 28 insertions(+), 14 deletions(-)
> > ---
> > base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
> > change-id: 20251031-pci-meson-fix-c8b651bc6662
> > 
> > Best regards,
> 

-- 
மணிவண்ணன் சதாசிவம்

