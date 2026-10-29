Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449E606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 00:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MkHnTkBt;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=HCG9R6E+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uBkoYVVkTY7EAIi/mmiI2JHj5K3iCMaezc8HVdReC/E=; b=MkHnTkBtlg9YTW
	JwFH7g9nhYbcn/ZCjtcKusDg/ohHGjyXWYboDdLz7NmvZTCNp3bmIsv6WDTZs9TBeAqhziY1SXrDN
	0BcCrFXjGyWW/9CWSAoCqRQxekf+KtG4gFHp/WRNjnmQCFqtau4YIAnr9iB+QPN2NwPYY34emPjR4
	AlZ57VjbogMHNJkWYAEFzZ2D03wRukd0nUNCPK+iG2TeVUXjCC45IF8J2z9n+D+R8XyTAHhPSj/e6
	wW9Le0LDBcYq2oLimHwOwexOdyhmj9XWSWnUK8hZYKWCIyHbUiNcPk94xj77u6yqeglUx9qMNj2eI
	q2Tq5lxcd5Fu//klXGQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEBq-000000086RT-1sxG;
	Thu, 29 Oct 2026 00:40:22 +0000
Received: from mail-m83158.xmail.ntesmail.com ([156.224.83.158])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMEBe-000000086Mz-0V7a;
	Thu, 29 Oct 2026 00:40:12 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 52b624e00;
	Thu, 29 Oct 2026 08:40:03 +0800 (GMT+08:00)
Message-ID: <9d52d66f-7eaf-4fcc-b445-751e555707d7@rock-chips.com>
Date: Thu, 29 Oct 2026 08:39:59 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 mani@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
 bhelgaas@google.com, robh@kernel.org, heiko@sntech.de, dlemoal@kernel.org,
 linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iav@iav.lv
Subject: Re: [PATCH v3] PCI: rockchip: Don't lengthen PERST# when power is
 already valid
To: =?UTF-8?Q?Enrique_Hern=C3=A1ndez_Bello?= <ehbello@gmail.com>
References: <20261028005603.2399220-1-ehbello@gmail.com>
 <cf541723-eb4c-4ba6-92c5-33baafc20e7c@rock-chips.com>
 <20261028015923.2436122-1-ehbello@gmail.com>
 <95aeecc0-2794-4cc6-a635-5c042afc1405@rock-chips.com>
 <20261028171122.3422629-1-ehbello@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261028171122.3422629-1-ehbello@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa18519806403a4kunm9f3b40bdfe8d1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR9OVhpNThodSx5CSxlJS1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=HCG9R6E+IaJm1bNyBjRQaYBRGMVM3yRbMJQQx+50D1clXehcLwi6007xiUERJWtuPkNhcUBQsOv+CFjqhyrLLf8bsEKukzuUpiNFhtpZ+yu9vjatBpjX16bWUlkWx9pKR/m6EZHhybj/K61IhWICAPvfZM3vk4i3hKoH6DypNxA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=uBkoYVVkTY7EAIi/mmiI2JHj5K3iCMaezc8HVdReC/E=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_174010_753906_41BD26EA 
X-CRM114-Status: GOOD (  22.83  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/10/29 星期四 1:11, Enrique Hernández Bello 写道:
> On Wed, 28 Oct 2026 02:21:14 +0000, Shawn Lin wrote:
> 
>> Was it possible to add a DT property for configurable delay? I came
>> across several EPs need quite a longer wait time, so add it in the
>> vendor tree for dwc-based IP[1]. That could be applied here to slove
>> your cases and others', and might avoid regression.
>>
>> [1]
>> https://github.com/rockchip-linux/kernel/blob/develop-6.12/drivers/pci/controller/dwc/pcie-dw-rockchip.c#L865
> 
> Thanks -- that is a better shape than mine, and I will do it.
> 
> I will mirror the vendor driver: rockchip,perst-inactive-ms for the pulse, and
> rockchip,s2r-perst-inactive-ms for the resume path, since the two paths want
> different values here as well.
> 
> One thing I would rather ask than guess: should the default stay at
> PCIE_T_PVPERL_MS, with affected boards setting the property, or should the
> default be the spec minimum, with the property there for endpoints that need
> longer?
> 

  I'd suggest the affected boards to set it via DT.

> What makes me ask is where T_PVPERL is measured from. It runs from power
> stable to PERST# inactive, so on a board whose slot rails are regulator-
> always-on it is already satisfied seconds before the driver touches the
> GPIO, and the 100 ms then only widens the pulse. The one pulse-width floor
> the spec gives is T_PERST, 100 us.
> 
> On my board that difference decides whether the JMB585 answers config reads at
> all: 0 of 5 boots with a 100 ms pulse, 5 of 5 with a short one, with the
> power-settling time held constant across both.
> 
> Keeping the current default is the safer change and I am happy to do that. I
> would just rather we did it knowingly, instead of carrying a number that was
> only ever right for boards which power the slot at the moment they assert
> PERST#.
> 
> Secondary question: do you want the vendor-prefixed names, or would the DT
> binding maintainers prefer something generic, given the timing comes from the
> CEM spec rather than from Rockchip?
> 

I think this kind of settings should keep vendor prefix, documented in
vendor driver's dt-binding, unless other drivers would like to share
this which I'm not sure now.


