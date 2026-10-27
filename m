Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 00:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BaK5RKGj;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=DzxT93fh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=5/VwNhxDqFDjAFzXiE0EgjT10Of3veuyQvr8j5Q5Fl8=; b=BaK5RKGjjvtWZ2
	tVc0s+spnB5WsYgp/jRDGrt/WcIsz8usxYRINDxQuRJ1OdSLG+tT4RydIXi5tj2UXVHBIkmYCW7ye
	uJrXV4odgpqmTeily7D7/355buGtYuyMlb4pZqnTFLlL2+In1YzJ5vxSGPu5kNctjJEHPJ1gw0leW
	xkumhvvf0cN9D5Xh1mi6VZ37WA62sq/t1PmVLhpAiGATdSen6Pky2gJ83JIG8wPgiQAMoha6Jh4BH
	8bHjQI2TvNDR8KM8o/qdc8HF5iwT3Ug8qMz2seevqE0skATgKVcIW6k9hkAsDbYj4NewKd/QheoLg
	pdKryU4HIuzECGgxcXKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVIl-00000003XuP-3mZA;
	Tue, 27 Oct 2026 00:44:31 +0000
Received: from mail-m82236.xmail.ntesmail.com ([156.224.82.236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLVIh-00000003Xsy-3Us6;
	Tue, 27 Oct 2026 00:44:30 +0000
Received: from [172.16.12.48] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 526dfc65c;
	Tue, 27 Oct 2026 08:44:12 +0800 (GMT+08:00)
Message-ID: <ff204558-dc22-4d38-b0dc-2c727f983f9f@rock-chips.com>
Date: Tue, 27 Oct 2026 08:44:09 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Rob Herring <robh@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] PCI: rockchip-host: Retry training and hot-reset
 a JMB585 on RK3399
To: Igor Velkov <iav@iav.lv>
References: <20261024-rockchip-pcie-resume-v1-0-58e54a5cf5f1@iav.lv>
 <4316c1da-f7ff-4fa5-a330-512800474e45@rock-chips.com>
 <20261026-rockchip-pcie-shawn-reply-1@iav.lv>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20261026-rockchip-pcie-shawn-reply-1@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17ad0966603a4kunmdefc543f472a32
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZGkJLVk9LH0IYHUNPSRodQlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUJCSU
	5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=DzxT93fhhkUwadv+bNoSjWR3pa5Fg+2lO5H9x8aSzNv8PZ+Qij6U/dj5xWoWHaGEJ7t4dnDPK6w9r5pe6dQJwgGwOTd768UARevM+xTQPOP53tGaz1hrcKKHOiDtaMitWBQMU76SNQ0Dbod6URXqogHljnpFuJAa1C0tI+KJP2I=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5/VwNhxDqFDjAFzXiE0EgjT10Of3veuyQvr8j5Q5Fl8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_174428_470864_BFBE9FA1 
X-CRM114-Status: GOOD (  15.62  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

在 2026/10/27 星期二 2:28, Igor Velkov 写道:
> Hi Shawn,
> 
> On 2026/10/26, Shawn Lin wrote:
>> The host cannot distinguish this case.
> 
> The controller seems to tell before the config read. On 26 Oct the
> link came back 2.9-4.5 ms after a hot reset in ~50 cases, all fine,
> and 10.9-35.4 ms in 8, each followed by an abort on the next config
> read. PCIE_CLIENT_BASIC_STATUS0 read 0x240 after each of 4 slow links
> and 0x1240 after each of 16 fast ones. What does bit 12 mean, and can
> the driver rely on it after link training?
> 

I have no idea about it. The PCIE_CLIENT_BASIC_STATUS0 says:

14:12  	RO  max_payload_size

So you are saying different MPS in different cases, not linking status.


>> You've tried PERST# with the patch 1 applied. So perhaps it's doesn't
>> help.
> 
> Patch 1 pulses PERST# only after a training timeout. With PERST# in
> the DT a slow link still occurred (25 ms, then an abort).
> Re-initializing the port, without PERST# or a power cycle, brought
> each of 4 slow links back in 2.9 ms with the endpoint answering.
> 
>> I've attached a vendor's debug patch, perhaps you could try it without
>> your patch.
> 
> It hooks do_serror() only and registers after pci_host_probe(). Here
> both SErrors and synchronous external aborts occur, at probe and on
> resume (the cover had that wrong), so we will move the hook before
> pci_host_probe() when we try it.

Yep.

> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


