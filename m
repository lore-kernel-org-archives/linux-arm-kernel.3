Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41474F483D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnYgYuXcIQ+7TyrlpDweAiws5Bn+1gGFhpfnZ5U278M=; b=kdzjAoM6+6KoOSuUATAbAoZ8Zu
	IAx2rfGIzYyoRAP+EZxD9SN625nYzvxqmw5sFnTan3g9pZPfe1qCc+88X8vaotVYixQo5/6ht+FoV
	l/wlgVLV7pQrSPQi8nPZwLP99ENaN/s8QuAQMeZniqR4HRKZXTF1uG0mGeygbiCxaKW0VhXV1qzBf
	5nnx1VOLh8/qR29j8Nfr6naEeW2WsgLwab+6cUcov+HqhBxiDfZh1rk9aGLv+q93WYKQkQASAroI+
	pjmlGomixuTe0v82wlIHg+1x0SomBk7misjHnx3RHFJfehPCBf+8gj41kX1FrICKmlkKv1Z8AXCbE
	/dt/mzWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iU4-0000000HATJ-26Wd;
	Mon, 23 Mar 2026 16:50:32 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4iU2-0000000HASj-0rvX;
	Mon, 23 Mar 2026 16:50:31 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fffLC4TTWzlfgf6;
	Mon, 23 Mar 2026 16:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1774284622; x=1776876623; bh=tnYgYuXcIQ+7TyrlpDweAiws
	5Bn+1gGFhpfnZ5U278M=; b=cZmAgSF8XR0jmYZg+cG2x1O/nIHOVtv1GjfSUfng
	U/2DuCC65H/v4fpjDf0qO8g91kRXtEXS89oIzsztbU6gF3VChoJ3I4xRTeYlcL/v
	RFZavO1PscnkxJr/s10xeECZZZyRFU8Oor+KaPQSmd5R0wggSWkZVFZHO2baftGi
	jr1hdNsOYormjBJi5sPcZNEBsMUhqmfdEhQFAdV8bxXck+TSn0sbM6J3CZ5vVeAl
	GHM6KatjVPa9Szz4Lj2bJMxx1hgLzoWKlrpE0na/Bfg6Mq1pMi6xzLgtSvIV54jJ
	AHEPvjykSZVneZob2VVRwlJ2eVU9PzBQHAiZWB4tUMl3Zg==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id lPQOGTM2giwg; Mon, 23 Mar 2026 16:50:22 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fffL35kDCzlh2g8;
	Mon, 23 Mar 2026 16:50:19 +0000 (UTC)
Message-ID: <7ab9845d-cb7d-433c-86f5-96b9e48f650d@acm.org>
Date: Mon, 23 Mar 2026 09:50:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/12] scsi: ufs: Add TX Equalization support for UFS
 5.0
To: Can Guo <can.guo@oss.qualcomm.com>, avri.altman@wdc.com,
 beanhuo@micron.com, peter.wang@mediatek.com, martin.petersen@oracle.com,
 mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260321031021.1722459-1-can.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_095030_273483_41270637 
X-CRM114-Status: UNSURE (   9.17  )
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

On 3/20/26 8:10 PM, Can Guo wrote:
> This patch series implements TX Equalization support in the UFS core
> driver as specified in UFSHCI v5.0, along with the necessary vendor
> operations and a reference implementation for Qualcomm UFS host
> controllers.
Once Bean's comments have been addressed, feel free to add the following
to all patches in this series:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>

