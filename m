Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CFACA1002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 22:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2ZmXdsQ/54w5WowIihGqdaTs+mrxtqpuw1gMsEJWuic=; b=VwFIsidGy5MEYYlfuiHTPnasvh
	msE+yxHo55kZynHunu8gXEG9jmCQ02eiFySxGIxYk/cCjMAK0TjHQkJeYp5iG7VOQrKPa0f5M0kTu
	/4lKb9WGLbj74z58PHG6g1ZTmKOrpZyzRwq/Px6GTjFMa359tt9XqYTZLFmMhYDYH0cP6qMa69U8B
	ueMZpWJFfSB8fcH+wlJjOievGMq9+M2uUzBrsxYYwJ7yodQTf4n3/lEmCuPST24B1kCjAXvl9Pj7o
	OD1RgGUlmD04nSgfXc3MoC+7sMkP+mmW5uHhILX3KaHZe1TD0ZLSKgcAFDGOKdDSFx6HlHdbA8cs8
	67+0TsgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urkm5-00000003S8R-2UBK;
	Thu, 28 Aug 2025 22:07:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uriB6-00000002y5i-3bB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 19:20:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D7DD408D6;
	Thu, 28 Aug 2025 19:20:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39148C4CEEB;
	Thu, 28 Aug 2025 19:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756408856;
	bh=xgoO4M24DDsETImgJteajsEhHPcXATQbldGDe37SjjU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HyvCtjepwxlQbLPWbRwQxWRSnxUoo3KIxjt0L7MzUTd1nz/g3xGlxKDaQZDRrCRVp
	 Je656D48eJo7JycZf5LXz5JFHotSFgwUbjuWJVl4egWp/77DFSfpoo6y52p+fpxsjJ
	 nuQINnQtKhLOu6FW2Szrrd06eA+l/Kw/QojwNhzyiHPPXl0A+ee97N4oSSXItZFnOA
	 NmiWpaHWxCv9ON02pbwnXXazsuEtCi0cPDMlqt5PGMy6AlF1x99nu73KtzsPByG0+4
	 MeQStzP2fN6VGd/giQIpXjZcv+hYaiat58ztolRCJHSQAOUSsNIZZXAMmZCWPk/Y7Z
	 3wZFycMpNCiXg==
Date: Thu, 28 Aug 2025 14:20:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linus.walleij@linaro.org,
	corbet@lwn.net, p.zabel@pengutronix.de, shradha.t@samsung.com,
	mayank.rana@oss.qualcomm.com, namcao@linutronix.de,
	qiang.yu@oss.qualcomm.com, thippeswamy.havalige@amd.com,
	inochiama@gmail.com, quic_schintav@quicinc.com,
	johan+linaro@kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v13 06/11] PCI: stm32: Add PCIe Endpoint support for
 STM32MP25
Message-ID: <20250828192054.GA957771@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0fbf4be0-af6e-4119-a838-e3fc9ab1fc9d@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_122056_918458_0009CE24 
X-CRM114-Status: GOOD (  23.41  )
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

On Thu, Aug 28, 2025 at 09:06:33PM +0200, Christian Bruel wrote:
> On 8/28/25 19:22, Bjorn Helgaas wrote:
> > On Wed, Aug 20, 2025 at 09:54:06AM +0200, Christian Bruel wrote:
> > > Add driver to configure the STM32MP25 SoC PCIe Gen1 2.5GT/s or Gen2 5GT/s
> > > controller based on the DesignWare PCIe core in endpoint mode.
> > > ...
> > 
> > > +static int stm32_pcie_start_link(struct dw_pcie *pci)
> > > +{
> > > +	struct stm32_pcie *stm32_pcie = to_stm32_pcie(pci);
> > > +	int ret;
> > > +
> > > +	if (stm32_pcie->link_status == STM32_PCIE_EP_LINK_ENABLED) {
> > > +		dev_dbg(pci->dev, "Link is already enabled\n");
> > > +		return 0;
> > > +	}
> > 
> > While looking at the "incorrectly reset" comment, I noticed
> > stm32_pcie->link_status and wondered why it exists.  It looks like
> > it's only used in stm32_pcie_start_link() and stm32_pcie_stop_link(),
> > and I don't see similar tracking in other drivers.
> > 
> > It feels a little racy because the link might go down for reasons
> > other than calling stm32_pcie_stop_link().
> 
> I think that as an excess of paranoid that was meant to protect against a
> driver unbind when the link hasn’t started yet. In that case,
> stm32_pcie_remove() would disable a link that’s already disabled.
> 
> But that shouldn’t be a problem to disable twice the ltssm enable bit, as
> well as the perst irq. I’ll look into removing it. Is it okay if I do this
> with a fixup patch?

Sure.  We'll put it in pci/next as-is, and if/when you post a patch to
remove link_status, we'll squash it in.

Bjorn

