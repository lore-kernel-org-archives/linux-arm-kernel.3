Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE34C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqvegHLKDSOG7dosSurNIzoi6LoKmbMvsLv6jJgqizA=; b=W/uUUL9lYnX9pU9aljtPdqqFkX
	1iiHC8aGS64LqABm/QYRICMNlo13nLQ5FLEjkOt6WzWNHNbYv6eQ9FQFZbdVU6kE4VTJEn7dUZ9B1
	DXAuzFUPokW7rjhxuTMtdgox8u3j3fduyxEVun51NewgYn8SNAf+dtnBdiEFHce2ICmdnULNgCPJx
	yMLMNyYC9Lp7IgCPwX65XrkEWXkGmawflLpbdZYysuxHqA870qtnLL2bnM1uehTsJB6TsokmdCjQ/
	wPmwDpVVlWKH8lOsYzRXkzfLCuxOZguAIIPwtfnKIaiEMrBBcvE9DtqvpoqURR9Z0aZH5zaCB+RQE
	1syHPyyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8a-000000085d0-0DcE;
	Tue, 22 Apr 2025 18:14:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Eky-00000007XSC-3tuk;
	Tue, 22 Apr 2025 14:37:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745332670;
	bh=XOcO0ArbH6Md0k0EPnq4IKHD3/xoAvNCfcUCHuD0Lws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WGoliEGEinb7je8e2k53/89bUcia/ONf19VlR/muqYxTJvQTIpPn7RU2kAS8IalBX
	 HBqTxt+Qx32P314ouKFeYlltDVmGzmuZ7RmrljJWQ5o3SJpNS1g3sQMr5YgdXXrOO3
	 jAndt9N4QgD+4RUORgHHvMdzO+k92cibpsrQQjbEYgtvAkXXinhB0O1Cj6lPySGthF
	 dUU4nt1V1QZUmkxNDA/bWDRNyYLzVdrpfno0a4sVFS46IHN053wJhrrVzTz8GAYDNN
	 Z9JsT2e7GhQrZGnqjia9T61x0O81msR8JIvID24EoOIi5KOB2czovYPihFUKLgKbbM
	 Sp6TzP4SRoNcA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 607EB17E0CAB;
	Tue, 22 Apr 2025 16:37:50 +0200 (CEST)
Message-ID: <28e3f91f-a786-4ec6-ae70-bd92c11be81a@collabora.com>
Date: Tue, 22 Apr 2025 16:37:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] media: mediatek: jpeg: fix buffer alignment
To: Jianhua Lin <jianhua.lin@mediatek.com>, mchehab@kernel.org,
 matthias.bgg@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250418032559.31043-1-jianhua.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250418032559.31043-1-jianhua.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_073753_149447_436B12B5 
X-CRM114-Status: UNSURE (   7.09  )
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

Il 18/04/25 05:25, Jianhua Lin ha scritto:
> From: "jianhua.lin" <jianhua.lin@mediatek.com>
> 
> The JPEG encoder image stride register must be MCU aligned.
> For YUV422, it's 32-byte aligned, and for YUV420, it's
> 16-byte aligned.
> 
> The minimal DCT block size is 8x8, so the vertical buffer
> alignment for YUV422 is 8-byte aligned, and for YUV420,
> it's 16-byte aligned.
> 
> Signed-off-by: jianhua.lin <jianhua.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



