Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CB1C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 21:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=fNM9dpFy5NEgQnNE061qtKgbMkVHul4r7f+QWa7ClC0=; b=qksTd5sFE8uPoa
	7IZXkOJBY6sK8TD+k1bIZTzpWnlFJswS4Q00yuufap0kCkyTOqx2RvIpYbmUp3FmI5H0UFt7QBTMT
	0XIkY/OtgrIYGtIgsg4HbhZi8g9k0Q0ifs7dwS+UDlfIQ71xRqCT0ynpajuaufLARQFr933k1314y
	BSLJp2mZ2B4rhLNlLVa6Jb+Kav7KtTzEZnjf7FnrjWvZMYw+HE1YljGsQ7ICJMhsafwe9pPbcC1Ja
	2rLURrttv7kdA9/6Lx3xk/snEKXUCTmf9ThrXtfiQBGpb+ee/zp4Yp3kl8pDY8oiNvL8wxBt+pf/n
	NFxAoW+b6IP87iK1Ow4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXGo-00000009vxb-1Y62;
	Wed, 25 Jun 2025 21:03:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUKg-00000009WkM-39yf
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Jun 2025 17:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=fNM9dpFy5NEgQnNE061qtKgbMkVHul4r7f+QWa7ClC0=; b=NdIwb6TFEvjx0J/FcnQ8LtraWs
	E4KaQ8/90Iue3QxK3m+U1wJzAMc7tllZwG9XohVHFlwXYdH819tyPGn+hC+AhgTlbi3hgVhrFGVyV
	egeCaz886I0FMMnGJ8nK5Z1Z8Mp2VTKAxR6TZx1G6uByBU/C+RiAhyO/yhfs2bn3tQVjYmTI7FFXc
	+TiDxVXlpX2k5s5dVyEabBu6qnPX4jVyzVkb7AZoCZdS7/fS/fzk0VOLx3h6vBhFCmJK3iCEJUpda
	LIhzXdiPzx7dABocenUAe2+c+5f2u6Cyx/dQVLkGWHaGHPgmKS9ZHl4Z6O0EW0PUqiV/5xZ3zej6z
	FSeAP4NQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUKc-00000005uOA-3p8T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:54:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C75AA4ADB8;
	Wed, 25 Jun 2025 17:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC41C4CEEA;
	Wed, 25 Jun 2025 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750874082;
	bh=V/776moD0WP3JA8kmJKpRFhViMjXtiD1Hu+QZ1gN3ik=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=a4ZHKFfM/MUH7wdncYY6XrWlP2fPRfVmsLpbFF+gwUxm9ucIgZFB5A819+w4EfYM+
	 IdC82XoKAqDp92w5NLOvTPSjp6gE9SGH/sFTWE19zj/0YrsqrXGwFNq3E42xElDtgr
	 +Vp1dOHyeR1G+XEKcajNklagWy1jzEF3m/d2xpD/qV5vAnGJu67u/CBOTARe5trz2U
	 Y4jwsjCjh6vxmW0H39DZ3XIgA7wPcKPkqQ+UWs86uUAYiQUYHDf2wzl/Ifvq1QjIht
	 VessRp4F48UN8weEyp0gvCFYX+TbdV7N1EP/Q8Z5efJP+q7PCS4JRYefgayvBidAIG
	 kuBHiMzqzBMPA==
Date: Wed, 25 Jun 2025 12:54:41 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Manivannan Sadhasivam <mani@kernel.org>, bhelgaas@google.com,
	lpieralisi@kernel.org, kw@linux.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v2 4/8] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <20250625175441.GA1579685@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ed851fd-6cdc-48f6-ae39-67c95e6ad6d0@tuxon.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_185447_375745_B824A393 
X-CRM114-Status: GOOD (  14.71  )
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

On Wed, Jun 25, 2025 at 04:07:58PM +0300, Claudiu Beznea wrote:
> On 18.06.2025 20:42, Manivannan Sadhasivam wrote:
> > On Fri, May 30, 2025 at 02:19:13PM +0300, Claudiu wrote:
> >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> >>
> >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> >> only as a root complex, with a single-lane (x1) configuration. The
> >> controller includes Type 1 configuration registers, as well as IP
> >> specific registers (called AXI registers) required for various adjustments.

> This is how HW manual suggest to do it. The manual is open, it can be
> downloaded from [1]. Chapter that describes the steps implemented here is
> 34.4.2.4 Issuing Special Requests.
> 
> Steps to reach the HW manual:
> 1/ click "RZ/G3S Group User's Manual: Hardware" button
> 2/ click confirm
> 3/ open the archive
> 4/ go to r01uh1014ej0110-rzg3s-users-manual-hardware -> Deliverables
> 5/ open r01uh1014ej0110-rzg3s.pdf

Nice that the manual is public!  URLs are a great invention; it's too
bad when we need directions for where to click, etc, in addition to
the URL.  Maybe one or both of these URLs could be included in the
commit log.

> [1]
> https://www.renesas.com/en/products/microcontrollers-microprocessors/rz-mpus/rzg3s-general-purpose-microprocessors-single-core-arm-cortex-a55-11ghz-cpu-and-dual-core-cortex-m33-250mhz?queryID=695cc067c2d89e3f271d43656ede4d12

https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591

