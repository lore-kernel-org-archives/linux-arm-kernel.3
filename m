Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42491C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwx1IfTKh1rDEZJZPwub8nyeYTYzilJEqxSN8ou+0bA=; b=XXXtu69uz7hrcH7vu8EKPcLgXJ
	Xvg9liIxax0OQhSrosOC66uOgciH0jVlqUXK/4wdC2CBaoOOq8mZzePT35iRAHlBWCl4zZJRbFugk
	Iqs1/HtUZryUEnaF8rXV3BlWIlzs5GC7jgwCb0v0vkM+X48AhvYJR2qCtR9vwU0U4kiod5B080YQp
	v6TbBOO+Fj5soYFXhKLuyzRQOgm/eCmTH1VjVNc2DO5+GMAhoTB5YV1FHcfQdSfVGG/2Bax+Wk+sQ
	HwPtGsRIv4mflL76/yukWFKnoqSAUGjANA6r/1bttoHc2m84hdhnrCnetTwROi/qVPM6sdQ09Tif+
	v1WrS06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQPP-00000008xEX-3vcz;
	Tue, 18 Feb 2025 16:25:19 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQId-00000008vdj-0wHo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:18:20 +0000
Message-ID: <7446c987-3286-4b8a-a105-96443275d4d4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739895496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwx1IfTKh1rDEZJZPwub8nyeYTYzilJEqxSN8ou+0bA=;
	b=E/1xu/wM2vYeLhBelvWB1ep+Erfy5NmqLoD18c34a+RTGqEMMLuJWDWww4FNlWeRqTnMvU
	FBrQAhQ35VNhqWo0A23fqx9r3saaVlbNJW68Y2I2ltIg0PFt4FQd1IhHYebD1qpHbXo9FX
	I/qF3/bQpYDcElBYNYFJpRqvhtYWFmc=
Date: Tue, 18 Feb 2025 11:18:12 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Implement BQL
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
 <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
 <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
 <da67b82c-1068-41c8-93d6-df0e7b009e4a@lunn.ch>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <da67b82c-1068-41c8-93d6-df0e7b009e4a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_081819_472000_D16F6A2B 
X-CRM114-Status: UNSURE (   8.69  )
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

On 2/18/25 11:16, Andrew Lunn wrote:
>> > Could you please check if BQL can be implemented for DMAengine flow?
>> 
>> I can have a look, but TBH I do not test the dma engine configuration since it is
>> so much slower.
> 
> It might actually benefit more from BQL if it is slower?

Actually, it will benefit less. The hardware is the same, so the
slowdown is entirely due to extra CPU overhead. From the CPU's
perspective, the queues actually drain faster than normal.

--Sean

