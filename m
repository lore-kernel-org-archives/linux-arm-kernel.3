Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B48C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5sh4I3uZEwOtEYpw33x5GG/9XO5c8ZsodmbDjJSbeV8=; b=GpxbSYXZsmsWs+FhQJnxDur07j
	21IylsJ+vI+UaRMdqCFnmU+JWJDkHKL41Mn9sguNUHdCZvW5v+NgJ0rPjLz8wmWvZnkmBiIKiEy6Y
	UiKgWJcuqrRz1Febsew9Ok+QqD7mifLIuQBSDJxiwaHsfSGf+tJpSxpZ+h4rPSZgBMhMvz+OW3T2i
	FHnwz9anrQxSXK6CdcuoCF+V6onzRU7nF1eOu7LHOrc0T3296y+PD/stCg4paZtK0rGErvIC56Skz
	DceNs94nsMHo8WqlfZAAd+sSdk7nz2Q6217F8amdcAmavqqLrLt9lzgp5vyDTmiuLkz87qgwh9NC5
	pGhdav2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yrW-00000005Cko-3T5J;
	Tue, 22 Sep 2026 11:40:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr4-00000005CHI-1woQ;
	Tue, 22 Sep 2026 11:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077208;
	bh=IFfZ70kjB90+zj0QtAAYEQEl82esnuhwlzrSu2ntQMk=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XGB5oRF3+j++jbJ96WMoP4+lbPftpA7nKnIh6w74Ou5RlNua15wDD5eOZrRcopdPQ
	 GFaknc/DSCXWjmVoiRqPMqqxgfTVMQAEPUjlprskzJGXkv+Au7gfT0HHhf9/24pwLi
	 gyRqasPj4lwcUtPkjo/u9gql6EFCI2MSIkre+j192Ir1v/35qcThA0G3QReCDgdJSa
	 kppQ7EOHKLOssNjDMYdt9P4kFvFUF1nBC7SGik0jBdTccmXxup+CJVtsacJrTqFzr9
	 3ZzL5/EYwj5Mn7eIclrsREP3orDNHYhDWRjd34I6YvqXFDZtUM7b7p0U02eJv7BOkN
	 Ao7/62ai5wUFA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9ECFE17E05F4;
	Tue, 22 Sep 2026 13:40:07 +0200 (CEST)
Message-ID: <99fc3209-ec8a-414d-9838-3a92e133d63f@collabora.com>
Date: Tue, 22 Sep 2026 13:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 03/12] media: mediatek: jpeg: fix buffer structure
 size and layout
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-4-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-4-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044010_708796_D81213B0 
X-CRM114-Status: UNSURE (   9.29  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Updates the `buf_struct_size` in the JPEG driver to use the correct
> structure `mtk_jpeg_src_buf` instead of `v4l2_m2m_buffer`, ensuring
> proper handling of source buffers. The previous buffer size led to
> mismatches and potential issues during video buffer handling.
> 
> Moves `frame_num` in the `mtk_jpeg_src_buf` structure to align with
> other members appropriately. The first field of the driver-specific
> buffer structure must be the subsystem-specificstruct
> (vb2_v4l2_buffer in the case of V4L2).
> 
> Fixes: 5fb1c2361e56 ("mtk-jpegenc: add jpeg encode worker interface")
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


