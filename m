Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3059BD339A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iGj/2RrjtCME9sfaOGl76QJ8dsNtSXG+PLWljGpACOE=; b=mIILOA2z7iKo6q+SbmYdcxXMnh
	XtaLIgyn6ZLt7ZVtZ6Y1uMQSv0+1hS/+Spn+5dEP9HzZ+SrVL9EiT9kS0pC17eG+AdWyAv8LGlJFt
	Lc7GDOBvIgcJiHnB3DnjEyIe6rFZ8YVfP9TLuUcwXRRcDDpKzSgdBEuVLeQrmR+MbKo43x7zqLK+s
	Ud/4dkWZyauFCtHTTtaxaNRf2WdjrQW9G2KTXvtFGkEdqzwYiDptx3YVBLRBWegEKz9Z/smL/orOJ
	V9MeFfyycPJofKMZ5piFW1tc2VeB3aWebTx/TXfRU89YLFQk/tJUTEeOH3DXDfz6vM2amZGRZaHIf
	KjKJXqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Sku-0000000BWJM-2PdR;
	Mon, 28 Oct 2024 16:38:12 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SVy-0000000BTtb-3rmI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 16:22:49 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id DFA71A0767;
	Mon, 28 Oct 2024 17:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=iGj/2RrjtCME9sfaOGl7
	6QJ8dsNtSXG+PLWljGpACOE=; b=qV07+cWiw94LKr8EnW7ekg/8PU6Cq5iklcxY
	RkY/yh+JCrnbycKAiPVOWk6dJZTEFEfpGUMQ8fqT5Cco1RhcQhrr/w27xcWnll64
	qazulhAYyIo8xMSHNZ6a/12xpmMXZpf1+oltT57Aw7Qo4099cPFljKoSZyP/xBz4
	f0HAo3ZxSHA+AZ2/0mbLIBNQmmIbV4ug50NCVdOois5tDffuX2HUzsPSuiAv/l6S
	Azrz5N6PpAPhInyTNsPfBY6VPAg95OL9gzpEEyDCW0TriyaLyaJl/FFf5F7Ba1/X
	b+c8qJmxV+G4QDsdkVlVffisHd0TLoQtkHakMkkrlfCDMye1OvAUGnV8BxmGQR1h
	RVh1c8CJFLGI2/mCggqlZ1NWTIoMIIgnJWXkinK9ktVrSyLq76EcYJsa2I7LNPBO
	n7UfGwRT0ZChxUWzaAU72AVW6gmqtjPyLfJFY8w0yHVNCeagpvWF0AXtkK1PnyWa
	UJ2GUlYwdrNTseFIv+F5n3IqUdOhXeJ/DYMAItyJy/yPM6aC6BQqDErWgEbdEU0C
	e8obxrAbuAV9Qk6ZrsECY3haoJN/xAl0Bs62S+cryJyHhrKSNkuSykscaUExcT9g
	3wwPmH7b1him2CvnKSbKkBU9T9gdK7iyRwBMjsOBTJE2CcbirmXrFXodZ6I98fjK
	D6BQ1fY=
Message-ID: <bdf6a38d-e113-41c5-abc9-c18571ed13d8@prolan.hu>
Date: Mon, 28 Oct 2024 17:22:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
To: <wens@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, <dmaengine@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-sunxi@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Mesih Kilinc <mesihkilinc@gmail.com>, "Vinod
 Koul" <vkoul@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, "Samuel
 Holland" <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu>
 <nlhsxigg3rbfvua76ekmub4p6df2asps2ihueouuk6zkbn56zl@xdj6jzzt4gfb>
 <b74dafed-197a-4644-a546-54c7a1639484@prolan.hu>
 <CAGb2v65ZXftjrG9+f1_88=EsU7rM8vnOPZCszWfWYFQ+Do9Xsg@mail.gmail.com>
 <1811aa2a-3d19-4ce4-83c5-863aa0f4daab@prolan.hu>
Content-Language: en-US
In-Reply-To: <1811aa2a-3d19-4ce4-83c5-863aa0f4daab@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.7.14]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855667563
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_092247_446922_A374E74A 
X-CRM114-Status: UNSURE (   9.08  )
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

On 2024. 10. 28. 14:12, Csókás Bence wrote:
> 
> 
> On 2024. 10. 28. 8:44, Chen-Yu Tsai wrote:
>> I suggest adding a patch to switch the clk API calls to 
>> devm_clk_get_enabled()
>> which handles all the cleanup. Similarly you can switch to
>>
>>      devm_reset_control_get_exclusive_deasserted()
>>
>> for this patch.
>>
>>
>> ChenYu
> 
> Huh, that's a new API! Thanks, I'll switch to that then.

Actually, it doesn't seem to be merged to Linus' tree yet. I'll probably 
just switch it after it is merged.

Bence


