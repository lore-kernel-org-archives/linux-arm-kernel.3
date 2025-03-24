Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAB6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GFCBKnfbCnskKkijjLBwvXiBLir0FJWHNA+3bYXenAY=; b=EQLK0x0242ZBZ6
	iqf9DCSRbAAg9a0u9UvJbGuA1r3EZ/K1hcICC4BxjDjKSUnWmyseeWL01JikaI6nq6IjbCEiU7d8o
	HsTLWmCqvfGVuI5yoIUdrUuRzuextVAE5NNEdHLmUz2BDW5L4bXeCJn0pepRJ0dQ+b8bsoqjvr7jv
	pfYUScb3fZvg7km7bpXO8SzC3v3ztuMYIWRYE0TVBHyW3E+aAbulL8KCRvVlytJNrn6NgheysU5dP
	vLzuCqLSyzvXBB9ITI3L5NlCCz3Jk0PerLH4Pr/MxkFGUJPjf8GojhJIgsRzEIWg64D8xr+jKyuuN
	cWK23SqZibJStwKzmiCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twkNf-00000003ayX-0cgm;
	Mon, 24 Mar 2025 16:10:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twkLx-00000003aoA-06vc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:08:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1340F44140;
	Mon, 24 Mar 2025 16:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18451C4CEE9;
	Mon, 24 Mar 2025 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742832520;
	bh=uFHH2lwI0Hjlf+4iID1Ge3PrHz8y0Zaq/bXqOrfZV/A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SPv7bNe4C8BXr7Vq4e/JJp/viQqxELXHZxSNVQ2q7khTuXOcRWNmGMkI3pnhq6MZJ
	 kBLQTsIEZFUMee42P/Z9B+Gkqg3uGolwRdjXNCUbtc+3t4rw/Oinl4LAEhZ+gjLXiD
	 av5FN1dcCfv25f5ZOXhX/FnFAqjcO8Vwi0pi/r9SU6QL1Eh4bg/yMJc6vax794fGVi
	 zG0OWuPDUyi+/2PBpldR+YWIfYGDYUTLLdcmKhwRNacr3yv43GZ5/F1+SzYTNnucxT
	 6EWjt7HTlGnfQwWehbE2RdMnPHA1WTelBkxjzghp2DEQR+LWWpdH5elPzsdZBfA8JE
	 4UEdweCfuMokA==
Date: Mon, 24 Mar 2025 11:08:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mike Looijmans <mike.looijmans@topic.nl>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pcie-xilinx: Support reset GPIO and wait for link-up
 status
Message-ID: <20250324160838.GA1251294@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e7637a0-8b8f-4aa7-be46-1e7b8ac07a45@topic.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_090841_085340_946B8683 
X-CRM114-Status: GOOD (  12.10  )
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

On Mon, Mar 24, 2025 at 04:46:55PM +0100, Mike Looijmans wrote:
> On 24-03-2025 08:49, Manivannan Sadhasivam wrote:
> > On Fri, Mar 14, 2025 at 03:59:02PM +0100, Mike Looijmans wrote:
> > > Support providing the PERST reset signal through a devicetree binding.

Use "PERST#" to include the polarity and match the spec usage.

> > > As the PCIe spec mentions about 120 ms time to establish a link, we'll
> > > allow up to 200ms before giving up.
> > > 
> > This should be a separate change/patch.
> 
> Indeed, this is a separate issue, I'll split it in two parts.

And please include a specific spec reference, e.g., "PCIe r6.0, sec
x.y.z".

