Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88479C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 21:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEPofVvgLXeaS7bTEy/4niL9XtDAUhUTLDA0AO+iElY=; b=yPxumifJxkkcBBoNpMz1As04yh
	oc/4n57lvk3WGnMl78xE3cHy5pMTFU8+mILWquamCyneNUzVoKKKwZ8ChuYRP2Qh3qr3E1DtIix7s
	oPVe9Idqxkqal88qDlhQnJ4UdjyJBmhvNe8kEcyTSApX33MulxVjdtQoppBJqnQrU58yZRAMCGkBN
	rn0zYz3gEpDxtVvyJwpi7eVoF3291aJHWRmk+JRolyZX3A77NvZKTkAtKjmn4NWlaQgaOQ4JUPT29
	tbjyf0mKyGe8XswUQWxGp1yC6P/GXNE5ZNqPZahZMOjNxjcUmepR3iF8vENptVVi30kljpfVpdr1C
	aEEYfG8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7fd-0000000AU5U-1ozE;
	Mon, 19 May 2025 21:05:13 +0000
Received: from 003.mia.mailroute.net ([199.89.3.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH7dU-0000000AToh-1SKf;
	Mon, 19 May 2025 21:03:02 +0000
Received: from localhost (localhost [127.0.0.1])
	by 003.mia.mailroute.net (Postfix) with ESMTP id 4b1VWl04lrzlvxb9;
	Mon, 19 May 2025 21:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1747688575; x=1750280576; bh=YEPofVvgLXeaS7bTEy/4niL9
	XtDAUhUTLDA0AO+iElY=; b=4dFFAmoZjm/t+WIfTczGm1srH0zZuAqVYjf9JGMt
	diQ0Biz/ahwGoS6xYMD9mPyvPfIURd1nLyIjmuV9enGrLaPQT5ugEzDoI84rjqSB
	lnoFKCWYMcVIZtJRKHgromm0S5JlM3kBGSDUSujcZHFeN1h927hDRgZxUWMpXzzE
	eJ0WTuGhBRT9G+5N8rJr8xsvgpNB8WlucQpgwgwa6SaTyh1LeWImW4RuErtfUliZ
	q+FdGp6puXXe6+9eTn8ISyndPDu/AjfZCOAsvZtNHA+5qq1zN2no83gpiaOQK/7l
	SNDIn9Br0Ai8lfu4S7dysE+uoaDbSO3GKzAUBBUj5QoSvg==
X-Virus-Scanned: by MailRoute
Received: from 003.mia.mailroute.net ([127.0.0.1])
 by localhost (003.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 2xkBi9KeFzdj; Mon, 19 May 2025 21:02:55 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 003.mia.mailroute.net (Postfix) with ESMTPSA id 4b1VWR5x85zlvq7Q;
	Mon, 19 May 2025 21:02:42 +0000 (UTC)
Message-ID: <08e67735-d5b0-47d0-b476-c22a3b5acdda@acm.org>
Date: Mon, 19 May 2025 14:02:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ufs: core: Add HID support
To: Huan Tang <tanghuan@vivo.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, peter.wang@mediatek.com,
 manivannan.sadhasivam@linaro.org, quic_nguyenb@quicinc.com,
 luhongfei@vivo.com, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com, Wenxing Cheng <wenxing.cheng@vivo.com>
References: <20250519022912.292-1-tanghuan@vivo.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250519022912.292-1-tanghuan@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_140300_466701_5B579BA5 
X-CRM114-Status: GOOD (  13.45  )
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

On 5/18/25 7:29 PM, Huan Tang wrote:
> Follow JESD220G, support HID(Host Initiated Defragmentation)
> through sysfs, the relevant sysfs nodes are as follows:
> 	1.analysis_trigger
> 	2.defrag_trigger
> 	3.fragmented_size
> 	4.defrag_size
> 	5.progress_ratio
> 	6.state
> The detailed definition	of the six nodes can be	found in the sysfs
> documentation.
> 
> HID's execution policy is given to user-space.
> 
> Changelog
> ===
> v2 - > v3:
> 	1.Remove the "ufs_" prefix from directory name
> 	2.Remove the "hid_" prefix from node names
> 	3.Make "ufs" appear only once in the HID group name
> 	4.Add "is_visible" callback for "ufs_sysfs_hid_group"
> v1 - > v2:
> 	1.Refactor the HID code according to Bart and Peter and
> 	Arvi's suggestions
> 
> v2
> 	https://lore.kernel.org/all/20250512131519.138-1-tanghuan@vivo.com/
> v1
> 	https://lore.kernel.org/all/20250417125008.123-1-tanghuan@vivo.com/
> 
> Signed-off-by: Huan Tang <tanghuan@vivo.com>
> Signed-off-by: Wenxing Cheng <wenxing.cheng@vivo.com>
> ---

The patch changelog should occur below the three hyphens (---) such that
it doesn't end up in the kernel changelog. Otherwise this patch looks
good to me. Hence:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

