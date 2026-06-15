Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEFCCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 13:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JFdcv43vw4EPbj2pYJuXY1YO+uQmOnZRhQpYncm8gw=; b=bDSb1yxjvXhfdRXHAQJ/RGU49g
	iKcRWPO67zJSN1rfYj90OX0OA1YvZfLB9wnppEr/SvfwifC8+EkgH8i7fAr89dG97ugYrdG+EIywB
	fGv7kcLP/u2woo+CP53g3EsIQilrMpPVAkpx2Xpff0ud9X2rxzLCuEfATzE2GcaIWFZPaHDGu7KGF
	nA/9nsRvMMBmiIMIeYCvz8LigxyMRdBkV7RbG+9m4GPGT75/yNV3MvRB2yAOwSOtjffKiQ4WcX0n/
	PiV0zfnNyM3YsD3R10ziCDVfFdmhovxBv/7UCB4YtXVO9FT8PfLef/q3//8W9Tu29SReNWTKZFKok
	jnk5V0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7ZF-0000000EKNH-0XqW;
	Mon, 15 Jun 2026 13:41:33 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ7ZC-0000000EKMG-1zeM;
	Mon, 15 Jun 2026 13:41:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4gfB9Q02Lfz1XM6J5;
	Mon, 15 Jun 2026 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1781530882; x=1784122883; bh=/JFdcv43vw4EPbj2pYJuXY1Y
	O+uQmOnZRhQpYncm8gw=; b=EXbibQZNF4hEuQlmCeXwJOs2bhoV87jci/OzDfxH
	zD7i6mpQjepum+hLG6tVbQO83m7U0yYkSpSkDTuekvd5DZEVkxphx7daMUtjSK+1
	mtEYY2+3uLJ1aenJ7OL8sZEP96UqQMfvA6kfaZOgF8I/6VjZURAr1YMjwzZutYAj
	E3wAok4+XrH5QSJ/Ee5PoTmEg8O1x1FsSEUjTp4+TMwUxVYG3Z0xhFZoKRHf+wgf
	CVedIOgcnJKPCYJ5RzFQNWgDuEqlDCK6sukqeKt8Dr7AP6ayjzjTxqFWp+sXIMuZ
	WfMYXN7L/GdBdzAzLFr1+Dc+zCRaIX3AY9U8SFktJEllag==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id dnAFi-96rd81; Mon, 15 Jun 2026 13:41:22 +0000 (UTC)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net [73.231.117.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4gfB982DHJz1XM5kW;
	Mon, 15 Jun 2026 13:41:15 +0000 (UTC)
Message-ID: <88ccf330-28b9-4101-9f5f-c05130c75636@acm.org>
Date: Mon, 15 Jun 2026 06:41:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] ufs: core: Add get_hba_nortt callback for
 vendor-specific RTT capability
To: ed.tsai@mediatek.com, alim.akhtar@samsung.com, avri.altman@wdc.com,
 James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 peter.wang@mediatek.com, alice.chao@mediatek.com, naomi.chu@mediatek.com,
 chun-hung.wu@mediatek.com
References: <20260615055802.105479-1-ed.tsai@mediatek.com>
 <20260615055802.105479-2-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260615055802.105479-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_064130_528472_99C58F4C 
X-CRM114-Status: GOOD (  10.04  )
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

On 6/14/26 10:57 PM, ed.tsai@mediatek.com wrote:
> The number of outstanding RTTs read from host controller capability
> register is problematic on some platforms. Add a new vendor callback
> get_hba_nortt() to allow platform vendors to override the default RTT
> capability value with platform-specific handling.
> 
> This patch keeps max_num_rtt field for bisectability and will be removed
> in a later patch once all platforms are migrated.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

