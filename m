Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7273FF513E9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 02:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TgGMYh2DP+ijYv+4mXIdHZZry/vv5D3g9hz3pz4gUUg=; b=pRZdCu1Nxdj9g6wihNtDPhw8yd
	X8C5xP1p6B7Zq23MVWjT+6dRFeU/eszSzJVM7XeY9bhVyYDaQY2SfzQTpdXKCOvdBL6MwcGkrsv9u
	uZ4sH/yK4GUbRq1v2VOuQUWfa4xGJFE11VF0E8axo8GIzj9eD3XZrzGIrZGCHPH9pKFcJve9S2muP
	NHQJDY0gJWD9whKlNtP7zdhRlCyaau+53t0rQ6sah+YHTDnFLtEEwBU6CjxCR1jnN/sISjbt7Qw2n
	CP0gv7YR50Kx8+4EwT+oiXvOGiS1qUv69e/NrvQczwrYvE4zXtWDOWoo+qHftxM9OgvrAorN2ud9Q
	OaXEd7JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKkD-00000002sDA-33B2;
	Fri, 06 Mar 2026 02:16:49 +0000
Received: from 013.lax.mailroute.net ([199.89.1.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyKkB-00000002sCZ-26mO;
	Fri, 06 Mar 2026 02:16:48 +0000
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fRqlz0NRJzlh1TC;
	Fri,  6 Mar 2026 02:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772763403; x=1775355404; bh=TgGMYh2DP+ijYv+4mXIdHZZr
	y/vv5D3g9hz3pz4gUUg=; b=Fmb6MmUO9RTAb/zAArlRKoTXh9EVLjQQzSsAWOQX
	hslDxghfplk0YRi2ns3vbTRjmbfnlpQ0LTJ4v6vGFvOy4/3BTRybHKm6AKIOqltW
	RtXPOJIerQqy0HkY4hdpNGvXK1c41t20+3Hc9HHM1EA03h1Xgya7FPx9+qAY5Krb
	Ux/78eLp4OSGk14UMrsd3p8Y+VEY/NPhnJ8RQa9c/XmvXE2gcFBrXRTDwRQ+Hbh/
	xzqDxnhzm3ixaVNOJ/sTzdMbTudP9sd/takMpHJRuXozGZiOdW+W4bcLykgRFMIE
	KirPeiOul0KqYwrY3r6+YlIcGWyony6nwL7/+qKDvOWN/g==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id OMO8-5YPHm93; Fri,  6 Mar 2026 02:16:43 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fRqlr0VCrzlh1TF;
	Fri,  6 Mar 2026 02:16:39 +0000 (UTC)
Message-ID: <fee27e1f-ce3f-4a32-9eb1-4b97f6cde0fc@acm.org>
Date: Thu, 5 Mar 2026 20:16:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ufs: core: Add quriks for VCC ramp-up delay
To: ed.tsai@mediatek.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
 <20260305083610.2672344-2-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260305083610.2672344-2-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_181647_554959_9929F83A 
X-CRM114-Status: UNSURE (   6.68  )
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

On 3/5/26 2:29 AM, ed.tsai@mediatek.com wrote:
> On some platforms, the VCC regulator has a slow ramp-up time. Add a
> delay after enabling VCC to ensure voltage has fully stabilized before
> we enable the clocks.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


