Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CB0C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 16:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuAxe1oc0+r/u7FGuT0j5suXqns5H7z8OqHhywOTHjg=; b=RzlhkyAn8j1fmbaoj5Gu4Nd4xY
	BimDRg+gGvdcz5TV87zBWF9eiYXIPaKmSyu17Do/PmqQlxg3W6VKBrmKO+ndkRHjf51WuV8nMkKl9
	9j4BqAbFq9R2g89sdmsr8gTWbZkkHASmt+Ve5yfXNN+0nb50CuPEa+aDt0Z6fmHyxzhS0RAGb2iIR
	ZFxEK111YDEv/aFJyN2NMn/ovq0XXcBcXtWCBJW/nM1YfA+784I/QwyK5JjUlEohMHqIeL0YttL9l
	DqFiiTLoyHI0iPCwGG+ka0U3I0At41llPRLcC8EJ7YHDpXEERxIH70W/DTzqEsbbGXLXYV72xpp8p
	LhT1eyDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ5D-00000008sHm-1pli;
	Tue, 18 Feb 2025 16:04:27 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQ1x-00000008rYF-0mwf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 16:01:07 +0000
Message-ID: <aa58373c-a4ac-4994-821b-40574e19be3d@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739894460;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuAxe1oc0+r/u7FGuT0j5suXqns5H7z8OqHhywOTHjg=;
	b=AiViI2f17rbhBJI8KOYLFJYWwWSGZqWG/NxeVx1JFlMeXhiSvTpjyY4rN6FwcQEWo1V6tm
	/aj45MnJ2ZJPCQppMD7NkLREdcRMxNX/dIxKmb4mKy68bvWj1O2YZ9xfgzG7UKqh0k0SX4
	U5rLPbRq41B5c9cYoJzhvk9dZJKn7pQ=
Date: Tue, 18 Feb 2025 11:00:52 -0500
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: xilinx: axienet: Implement BQL
To: "Gupta, Suraj" <Suraj.Gupta2@amd.com>,
 "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250214211252.2615573-1-sean.anderson@linux.dev>
 <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <BL3PR12MB6571A18DA9E284A301FF70FAC9F92@BL3PR12MB6571.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_080105_378356_89F2F671 
X-CRM114-Status: UNSURE (   8.40  )
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

On 2/15/25 06:32, Gupta, Suraj wrote:
> 
> 
>> -----Original Message-----
>> From: Sean Anderson <sean.anderson@linux.dev>
>> Sent: Saturday, February 15, 2025 2:43 AM
>> To: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>;
>> netdev@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org; Paolo Abeni <pabeni@redhat.com>; David S .
>> Miller <davem@davemloft.net>; Jakub Kicinski <kuba@kernel.org>; Simek, Michal
>> <michal.simek@amd.com>; linux-arm-kernel@lists.infradead.org; Eric Dumazet
>> <edumazet@google.com>; Andrew Lunn <andrew+netdev@lunn.ch>; Sean
>> Anderson <sean.anderson@linux.dev>
>> Subject: [PATCH net-next] net: xilinx: axienet: Implement BQL
>> 
>> Caution: This message originated from an External Source. Use proper caution
>> when opening attachments, clicking links, or responding.
>> 
>> 
>> Implement byte queue limits to allow queueing disciplines to account for packets
>> enqueued in the ring buffers but not yet transmitted.
>> 
> 
> Could you please check if BQL can be implemented for DMAengine flow?

I can have a look, but TBH I do not test the dma engine configuration since it is
so much slower.

--Sean


