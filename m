Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13780CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 01:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtF5hamNMT8w7gwfV8u7Brm72XuPs2uaU6pQ7P0r8NA=; b=fV8A6ZIg845OFOYXew+Chd5pIE
	fVieUS8dO0oA0Q2UcQgUbXR3IVXQYgDEKH5MZbNDjZ440du89BRQ0ZjEPpptUMQZzPIAga0fgwjYZ
	5wpNxHOW7atnJdLulwv4j6PvH7Exodyuvuuu7gb4o5ZK81So1Pz+FQWcDKbmYpYXDw7eIMkn5UDsG
	O/n/xC9wUtA5m6tnlfiwMhynHkn3ChzWgm2vWUdEOWk9xLTU9DHUC1d16R+V4Eh7CeYJn0b6edcfJ
	5d9Ca6qfUjzjr8SwxUlhSAj1z0XYDDjsqPP+RKouKWaNNycNwIxCM6x8IxtXL8ISJcom5V2PpbwoB
	ZlouhQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWP3y-00000002h4a-2Wuy;
	Mon, 08 Jun 2026 01:46:02 +0000
Received: from mail-m128119.netease.com ([103.209.128.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWP3v-00000002h3y-1VYK;
	Mon, 08 Jun 2026 01:46:01 +0000
Received: from [172.16.12.90] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 416bb7c88;
	Mon, 8 Jun 2026 09:45:55 +0800 (GMT+08:00)
Message-ID: <0919ffcc-81c3-483a-a3ba-404b455c2040@rock-chips.com>
Date: Mon, 8 Jun 2026 09:45:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 6/9] iommu/rockchip: Clear AUTO_GATING bit 1 on the
 RK356x v1 IOMMU
To: Midgy Balon <midgy971@gmail.com>
Cc: Simon Xue <xxm@rock-chips.com>, tomeu@tomeuvizoso.net,
 ogabbay@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260604135255.62682-1-midgy971@gmail.com>
 <20260604135255.62682-7-midgy971@gmail.com>
 <e44b506e-e9d2-48e3-acea-ab28b7be9b37@rock-chips.com>
 <CA+GS1Y16++cztPxdUGLrPA73ENm4vJGFrjm-jP8r=8OQqcMJGA@mail.gmail.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <CA+GS1Y16++cztPxdUGLrPA73ENm4vJGFrjm-jP8r=8OQqcMJGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ea4e8693b03a7kunm5581ce41167e8e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCH0lLVhlNHkJLHRlDGU9CSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=jIgtsz0TyrcFAl+irGQT/FzW/PHecgbmGKsmkt1lnYbbFGDHi1B7akwRMLwY6y/4vFy4+FD+auD6oR1rDOMqmmDFeT8wfSpcb6uQYaIlHVgWzsfkXqJCGQLq4+vHplwYP9NJaOVglVtq7rO5PPu+Hx5XWacT4HRifZn4QvoaS0g=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=gtF5hamNMT8w7gwfV8u7Brm72XuPs2uaU6pQ7P0r8NA=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_184559_639073_ED5DD06E 
X-CRM114-Status: GOOD (  17.27  )
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

Hi Midgy,

On 6/8/2026 5:05 AM, Midgy Balon wrote:
> Hi Chaoyi,
> 
>> As I said, it is v2. Could you please try using the code below instead and
>> see if it works?
>> [ auto_gate = read(RK_MMU_AUTO_GATING); auto_gate |= BIT(31); write(...) ]
> 
> Thanks -- that's clearly the right shape (read-modify-write, before paging is
> enabled, keeping the reset value instead of my clobbering 0x2).
> 
> I rebuilt v7.1-rc6 (with the rocket RK3568 series + your per-device-ops work)
> using your bit-31 version and tested it on a ROCK 3B: the NPU IOMMU comes up and
> services the NPU's DMA cleanly -- the NPU probes, attaches its domain, and runs
> repeated conv submissions with no DMA_READ_ERROR and no page-walk stall. No
> regression from the write.
> 
> To be precise about what I can and can't show: I tested both ways on v7.1-rc6 --
> with your bit-31 write, and on the reset value (0x3) -- and the NPU
> IOMMU services
> the NPU's reads with zero faults in both cases (no DMA_READ_ERROR, no page-walk
> stall). So I don't have a failing baseline here that bit-31 visibly
> fixes. Is the
> AUTO_GATING write needed on current mainline, or only under conditions I'm not
> reproducing (a particular traffic pattern / silicon rev)? I'll keep the patch in
> your form unless you'd prefer to drop it.
> 
> One question so I document it correctly: what does bit 31 of RK_MMU_AUTO_GATING
> control on the v2 block -- is it a master "disable internal auto clock-gating"
> for the page-table walker (i.e. so a TLB-miss walk's AXI master keeps its clock
> to completion)? The RK3568 TRM I have doesn't cover the IOMMU registers, so a
> one-line description would let me write an accurate comment.
> 

Glad to hear this works. Please refer to the commit below.

[0]: https://github.com/rockchip-linux/kernel/commit/7f8158fb41b5cc8e738aaeebc3637c50ebd74cae
[1]: https://github.com/rockchip-linux/kernel/commit/6a355e5f9a2069a2309e240791bc3aad63b7324e

-- 
Best, 
Chaoyi

