Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9F4CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 17:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE8mHdE/KxjGL6VP/icg38Woqfp2urjjOfjJsE3HU0U=; b=iSICUMyEuGGR5z7qAJX12bhlgM
	d8yt2k9s8pYohBMCaNmLCjWrBGww9QAiL0kJsUQmbWhV7X2BOfQuMZmToY6e3uvHIMMFL+BCsRx2i
	HyQ46jgI7P734R3010ad4kNJCdZX2jmGWmx5T/bdC0w0xjoJSZNc7fFuzAqf9oqDTwqNRuvll3EnI
	iJ1GMcqc40kAGIU7WhH9ncOgPfpk9JInChuCayElao6emSfIhSa5EUIa733s2dEhXQbAfGHatmcAv
	TcUFHV5v3l8QGsuEB4B6iLsSkJw2atSyVU53nf9Rjgq5QxxEvOC5RJuB34jaKuF2duL6WQIdzwIMR
	APReTXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJQP-0000000B3CU-3IeK;
	Mon, 12 Oct 2026 17:02:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGJQM-0000000B3C4-27Gp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 17:02:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791824571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BE8mHdE/KxjGL6VP/icg38Woqfp2urjjOfjJsE3HU0U=;
	b=WfYx7XRbsO5LNulKLZn9BknnSrQHptU43XvKQeFya2sumZdijxC3Q6p/9YKLdQLGGMR803
	wEyAaXPjXmpbi0Pv+jmoRykgaJxUG3aKkPCW0r5/Fw/91EpOHx1geopEO8ZyLw3FD7/STo
	Ky0bRvP2givxlyWnufgjIzE2zxJxjTo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-8b3LJPO0P_q_4pSdhP-2xg-1; Mon, 12 Oct 2026 17:02:43 +0000
X-MC-Unique: 8b3LJPO0P_q_4pSdhP-2xg-1
X-Mimecast-MFC-AGG-ID: 8b3LJPO0P_q_4pSdhP-2xg_1791824563
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48c7fe9736eso1656007f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 10:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791824563; x=1792429363;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BE8mHdE/KxjGL6VP/icg38Woqfp2urjjOfjJsE3HU0U=;
        b=nFpEulKhmmCdb+X8sr9v8Df1zqLY9wpkL+3XJRPPSn9Vx0Q09lrUT9X/xAFObUU79n
         NyUJ32bNlILjJM5hDe3Oz6nvoZX7Er23VYerPx9hk6i3EhRUrxgvIbZatsuCsKZGlVQc
         wY37n2IpkLZfXKsU7oES2Yukb9qUpkwNpIDe7QDXAmXPbop+CQadjRaxVB+Qu2/E5kqJ
         0owZvQo++NfIJZR67ZUXwZuW9r7ZSBDUPA6hxPjeRrOMRBUp76sSlwmlVp9cvsiiuT7P
         sw+WNynZvpo88r0m9WRund3e5EnBNKVAEqFqN29A/nuiRl1l3GMzwDXA7AyS8wUthxEv
         fbOg==
X-Forwarded-Encrypted: i=1; AKwUvBzr0UPlEAMBf4OPIRpb/MH7qqiH2w1Z/DwgGvZtSVRxOTpVyI1A9fufJaTV5aRv0wN2dSuUwjnD14adWpmpwRoM@lists.infradead.org
X-Gm-Message-State: AFq9FYKsMj0SfmpgVRwA106hZUVo1BLYj1tqlC6uLaT/a7bX/H1JdxR6
	ecVDTzAMbLed3FqAVEN9hfVsvKh8KSvo4xNxzD436etyBsVy8ExmbECXTSFAJH/5OfZ4ZxIPaze
	KBr5FjL6H2ilVBRJqdJrAjXDmhJiopAwSpVnjSr1Vn1nro5nk2gSjUl6A2wBRuzumgGeVzD5MCb
	i8
X-Gm-Gg: AYBFou0pbj7WqyBkky6l4p5RiFGSPeIwpAH4GkXZDTGxuXmRsXiQEVKJEWqBs8vi+ln
	gpoHYAwusg+TM8ssZySlTeXA5BBFH9Unj91XhobMNFaAq7q+6VtIt+8hxJ3MAaxYQZaWNjjn2Pv
	dEG7ELBk2rDyfwHzpxqIG/eKqSPzQYraS9jK2R/ONAAINksoJooqlZVIHn6QlZA0NORCygNwOPA
	5SlPsdShCBJn87ew5k+EVKdf56K8hxl0OOJmtBuEdNM/E7DSxaKSYT7BwLsj4kjSyRQAVn+N1yA
	6Ledo4E22bOExhMvRxP4jsOyPd44jFrX/oZDFg9y/m1lP0623iqpzJxDtWYScKlYmfGl6xYhbyL
	4eIdPFBJ2g6EhunPgu+/08TBhqsKtPEstVY0vqEKV1Y+TvXFTNekwcwHp0+3SFAAZajDefV0CKg
	==
X-Received: by 2002:a05:6000:984:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-48dc29e4118mr14053028f8f.33.1791824562674;
        Mon, 12 Oct 2026 10:02:42 -0700 (PDT)
X-Received: by 2002:a05:6000:984:b0:48d:c29e:40c3 with SMTP id ffacd0b85a97d-48dc29e4118mr14052972f8f.33.1791824562147;
        Mon, 12 Oct 2026 10:02:42 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm471519f8f.30.2026.10.12.10.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 10:02:41 -0700 (PDT)
Message-ID: <97bc33f6-1566-4449-9343-9e3463d5b8bf@redhat.com>
Date: Mon, 12 Oct 2026 19:02:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
To: Daniel Thompson <daniel@riscstar.com>,
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vladimir Oltean <olteanv@gmail.com>,
 Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Davide Caratti <dcaratti@redhat.com>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
 <ase3UrUehtLY6b_5@aspen.lan>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ase3UrUehtLY6b_5@aspen.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MBaJ7a67GQ_8iQ54z-aJ0RzFunIuAVIAPpn5-WPgrh4_1791824563
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_100254_632168_0F3D5ED1 
X-CRM114-Status: GOOD (  16.24  )
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

On 10/8/26 17:31, Daniel Thompson wrote:
> On Tue, Oct 06, 2026 at 12:46:27PM +0200, Lorenzo Bianconi wrote:
>> Implement the offload of the tc mqprio hw queue priority in the stmmac
>> driver. When the mqprio qdisc is configured in channel mode, the MTL TX
>> scheduler is switched to strict priority, and the PSTQX/PSTC priority
>> bitmask of each TX queue is programmed from the set of frame priorities
>> mapped to the owning traffic class (qopt->prio_tc_map).
>>
>> The channel mode offload requires the DCB hw feature and a 1:1 TC to TX
>> queue mapping, with a single queue per TC. Configurations with AVB queues
>> are rejected, since forcing strict priority conflicts with the CBS
>> algorithm. The CBS offload is refused while the strict-priority scheduler
>> is active, and so is a channel count change that would enable an AVB
>> queue.
> 
> I don't think these CBS offload checks are necessary. It's quite reasonable
> to mix strict priority on low priority queues with CBS on higher
> priority queues.
> 
> In fact on the hardware I have (TC956x) the lower priority queues don't
> implement CBS so mixing AVB and DCB queuing (whether SP or ETS) isn't
> just reasonable, it's pretty much unavoidable when using CBS!
> 
> As a concrete example of combining mqprio and CBS, the following works well on
> TC956x (when I tested an older version of your patch):
> 
> --- cut here ---
> tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
>      map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
>      queues 1@0 1@1 1@2 1@3 mode channel hw 1
> 
> # No CBS for TxQ1 means we can't offload this (h/ware stays in SP mode)
> tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
>      idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 \
>      offload 0
> 
> tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
>      idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 \
>      offload 1
> 
> tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
>      idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 \
>      offload 1
> --- cut here ---
Given your later tested-by, I assume you are looking for future possible
improvement?

Also it's not clear which revision you are referring to: AFAICS this
patch is (attempting to) refusing CBS + SP since v1?!?

/P


