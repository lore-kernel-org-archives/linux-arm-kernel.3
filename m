Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1979B107BCE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 21:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V4oZSkQu6T/a0BfmXwdgdm6hzaytdJTtyyvou5AvV8o=; b=0kxMz06POrx8q1EVJ9Nf9Xtv6z
	/f3pHPy+laXFDJpbv1z62LuCrkwgnVdXDPc8zLSUt71mC0W8qvc0/ScWE2qzyKmvSUQiq/gvb/QXR
	aLGYDupc4TU++nADDRs2YKYPR/xdVGv44+4mt2tmhXI+1EXgWRjYcPX7Htn8au7vXc7dRG2OZ9lPN
	7BIG+R7bjvvuJpXv26QAaRXu+r2nIdiCfsocN4e+im+ji85j3PeJlU1fT1vgegg2nyasJeYtF2fc9
	PapFfhil5wn370COTijnILz+2j2kNQs05ndFLcXF1l4wQfd+u9aiXepVCOCS54MUeeji4BLUTmQPz
	O1qpinBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AUq-00000001FOm-0ChL;
	Fri, 13 Mar 2026 21:56:40 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1AUl-00000001FO7-0R0i;
	Fri, 13 Mar 2026 21:56:38 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fXdbv0371zlgqw4;
	Fri, 13 Mar 2026 21:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1773438982; x=1776030983; bh=V4oZSkQu6T/a0BfmXwdgdm6h
	zaytdJTtyyvou5AvV8o=; b=zUbDJSr5v0j8Kv1asu7xXLMF3lDZvqSWJW36+5sw
	P9O00VBGURLzMj2hysAuyYr0vqIkJbhOaf904Lj+dQSc0Ipk7LwohmsmmFIPLsyU
	y4Dab3KMDtj55xPpdi9q3B4GO8Kdyi8fcpGTBPZA1g4kHBfQdjw8yX8w3C5uY7qd
	O0zD4yuob+FM6zrYDS9YL/4HpuomE3/0X7Xks6+Gcqrx1YWXejiJAic1e7wjaqWl
	DVfNAbeY7YuvDmGr7MPlaj2qFXPv8ThWpfI3RHgfZnESkCTB6hIQ++BqI40iFSx5
	UPznAjzbBOYripOKvip0Tkeq3NZ/ZRZYRTv2gmRbTp5KRQ==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id 6gERkaWR6Y9l; Fri, 13 Mar 2026 21:56:22 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fXdbl444Kzlgd7G;
	Fri, 13 Mar 2026 21:56:19 +0000 (UTC)
Message-ID: <d4b09db7-db5c-4d99-afb2-47deffc0cd17@acm.org>
Date: Fri, 13 Mar 2026 14:56:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260308151409.3779137-1-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_145635_995532_9D2BBF28 
X-CRM114-Status: UNSURE (   6.95  )
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

On 3/8/26 8:13 AM, Can Guo wrote:
> The UFS v5.0 and UFSHCI v5.0 standards have published, introducing support

have -> have been?

> for HS-G6 (23.2 Gbps per lane)

Hmm ... my version of the M-PHY version 6 standard says 46.6 Gbps for
rate B or about the double of the rate mentioned above (table 11 /
page 45).

Thanks,

Bart.

