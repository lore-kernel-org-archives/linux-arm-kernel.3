Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=; b=CldUlCkR5SJ4hhfCyOk8uh/+MQ
	KVmsJzZ3MX9UEzMMy95POI6/THzUSewJTIL+y8gexVAC0Z5x+uoB4DuwBVuXt1ji5nFYwSG3B8G3R
	wzGQrVjIPEO05IOLtt3opYyaXCapvCTNgYD5YgMmzx0uz7b47QbCbqWIpOFP2LSONLwtPBecmBy+H
	Cnuvt0PjH8qbHSEYSkGTX53WDTUW582t414C1jq907w5ZrFwXG6m1B4Rp7UDgL2HjZRlcEjmpWlK6
	DNkCbd5I+suF/E0XfFS+csShFnVxSeWFxvfsqd8N2xfFKqyOiHAzJJnMsRn/oH6A5CilXgmclmwYm
	ByxMf4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZMc-00000002hyO-3p1V;
	Tue, 01 Apr 2025 11:01:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZ53-00000002f6O-2qpI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 10:42:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743504172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=;
	b=N5n62tSh5zQriizZp6gnjI4An4Brro16bNn6nANT6Xb7P6Dy0gv+tgAagi086vzeaJsLKm
	iewO5bHd/g2kJgy2btdZgurrGGGcgqNt66wV9whjxc+Lg8CL7xBdSplwk03CIUTFUMIom7
	gOkHXvbRN/nc+65WHryItx4N+wyQ2TE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-ZsBCz28OOMeRsL_79jJF0A-1; Tue, 01 Apr 2025 06:42:51 -0400
X-MC-Unique: ZsBCz28OOMeRsL_79jJF0A-1
X-Mimecast-MFC-AGG-ID: ZsBCz28OOMeRsL_79jJF0A_1743504170
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39134c762ebso2227997f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 03:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743504169; x=1744108969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L70RQfP142JDi0wg/GLWbGt4oR+cGIYDeU9CiOJovqU=;
        b=FqEY1hoFnxKTDguEpgggqRYslDJ+HBhjCo49kII+895nYgSsihGYB9gGAaXf4oG0zW
         M9YAtN5PMXZNyc6YFUHDkYKyDLn6u0WCgNBtsI3/D64d+eJugT8zNnUq13Yl7OdAr6Q0
         J3GZAHsrxSdzKSCsIkBtisZw+ZfhlazPwSp5F2eH809bggxpJTyPMitPNCvg24EHVb9V
         RmvhFQyjpIicLFpRVSZUmPbBjCR7FCrE88+TlLMdza3b2QMdzxb0xwhk6c9mHRyvTYRS
         qdEf05n1v3fSL1JvhdJTRSg2U+drgrTrq3SznvK/jClp+E6yG6G0Aby/aSQ1uMFyVOXy
         Vc+A==
X-Gm-Message-State: AOJu0YzNX/IZEAbVd44hqpC6PEqek9evE5D3BZXBkGB9AD2coKfjNBDH
	NmVIbT5FG5PX9T3ati4EZ2rQTeY2WUQaeTJcBm0yfbquktew/T/CcuJ+b/DVSmwsuyr4lU1NB7+
	+ZelMnnuTwXHCsYMrj51qaxlTzBRLzVeFOVlL9oYenZ723fisAkchccASif4PZUqUJvNTbbqS
X-Gm-Gg: ASbGncuOHV57l5o8a+kteDJU5+ih7U/1G6bdD2CSwwzjL6bEBsRZ6im3TzUoquVLMMq
	VjYSuv35qSFgLT+KKkiJSgR46l6NtWsyriucHSm+3DAx5MbLokIyrtVWWQDY1chC3CYyU8KFxGP
	/ZTiqJNgOZyX0nwuKTYdGlbaho6k3OOnkIV9u4VaOqSwCGadgtT2aerUwOszYR1dSUU5pdxcRtP
	TeJsqeK903B190AgLbfq8iEAjlpH72BVHmptCcdvu4yhld+8r3WDcxwXnIBQGPWI0ma5gkxCdJk
	3u5ovtQJb2doPbMqjTeXgF5+eOYBY/Rm5PjKQnD81sivgQ==
X-Received: by 2002:a05:6000:2409:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39c14106c25mr9465877f8f.45.1743504169667;
        Tue, 01 Apr 2025 03:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErjtyNpQgTEEfLNTpXMht6fpOiuyDyvAzgK2cO+MDz04IWniLzgBXbdUzCkiAA6Wpk9SMqnw==
X-Received: by 2002:a05:6000:2409:b0:39c:1410:6c20 with SMTP id ffacd0b85a97d-39c14106c25mr9465851f8f.45.1743504169250;
        Tue, 01 Apr 2025 03:42:49 -0700 (PDT)
Received: from [192.168.88.253] (146-241-68-231.dyn.eolo.it. [146.241.68.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b79e31csm13961368f8f.68.2025.04.01.03.42.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 03:42:48 -0700 (PDT)
Message-ID: <d994809c-7960-4fea-b10a-9c1937f00fa5@redhat.com>
Date: Tue, 1 Apr 2025 12:42:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix qid report in
 airoha_tc_get_htb_get_leaf_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250331-airoha-htb-qdisc-offload-del-fix-v1-1-4ea429c2c968@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pK_kEC-ktasmnN9AVni4rcmLhGJ1x6obA1yDBdv-Ysg_1743504170
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_034253_805189_69C4D935 
X-CRM114-Status: UNSURE (   8.09  )
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

On 3/31/25 8:52 AM, Lorenzo Bianconi wrote:
> Fix the following kernel warning deleting HTB offloaded leafs and/or root
> HTB qdisc in airoha_eth driver properly reporting qid in
> airoha_tc_get_htb_get_leaf_queue routine.
> 
> $tc qdisc replace dev eth1 root handle 10: htb offload
> $tc class add dev eth1 arent 10: classid 10:4 htb rate 100mbit ceil 100mbit
> $tc qdisc replace dev eth1 parent 10:4 handle 4: ets bands 8 \
>  quanta 1514 3028 4542 6056 7570 9084 10598 12112
> $tc qdisc del dev eth1 root
> 
> [   55.827864] ------------[ cut here ]------------
> [   55.832493] WARNING: CPU: 3 PID: 2678 at 0xffffffc0798695a4
> [   55.956510] CPU: 3 PID: 2678 Comm: tc Tainted: G           O 6.6.71 #0
> [   55.963557] Hardware name: Airoha AN7581 Evaluation Board (DT)
> [   55.969383] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [   55.976344] pc : 0xffffffc0798695a4
> [   55.979851] lr : 0xffffffc079869a20
> [   55.983358] sp : ffffffc0850536a0
> [   55.986665] x29: ffffffc0850536a0 x28: 0000000000000024 x27: 0000000000000001
> [   55.993800] x26: 0000000000000000 x25: ffffff8008b19000 x24: ffffff800222e800
> [   56.000935] x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8008b19000
> [   56.008071] x20: ffffff8002225800 x19: ffffff800379d000 x18: 0000000000000000
> [   56.015206] x17: ffffffbf9ea59000 x16: ffffffc080018000 x15: 0000000000000000
> [   56.022342] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000001
> [   56.029478] x11: ffffffc081471008 x10: ffffffc081575a98 x9 : 0000000000000000
> [   56.036614] x8 : ffffffc08167fd40 x7 : ffffffc08069e104 x6 : ffffff8007f86000
> [   56.043748] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 0000000000000001
> [   56.050884] x2 : 0000000000000000 x1 : 0000000000000250 x0 : ffffff800222c000
> [   56.058020] Call trace:
> [   56.060459]  0xffffffc0798695a4
> [   56.063618]  0xffffffc079869a20
> [   56.066777]  __qdisc_destroy+0x40/0xa0
> [   56.070528]  qdisc_put+0x54/0x6c
> [   56.073748]  qdisc_graft+0x41c/0x648
> [   56.077324]  tc_get_qdisc+0x168/0x2f8
> [   56.080978]  rtnetlink_rcv_msg+0x230/0x330
> [   56.085076]  netlink_rcv_skb+0x5c/0x128
> [   56.088913]  rtnetlink_rcv+0x14/0x1c
> [   56.092490]  netlink_unicast+0x1e0/0x2c8
> [   56.096413]  netlink_sendmsg+0x198/0x3c8
> [   56.100337]  ____sys_sendmsg+0x1c4/0x274
> [   56.104261]  ___sys_sendmsg+0x7c/0xc0
> [   56.107924]  __sys_sendmsg+0x44/0x98
> [   56.111492]  __arm64_sys_sendmsg+0x20/0x28
> [   56.115580]  invoke_syscall.constprop.0+0x58/0xfc
> [   56.120285]  do_el0_svc+0x3c/0xbc
> [   56.123592]  el0_svc+0x18/0x4c
> [   56.126647]  el0t_64_sync_handler+0x118/0x124
> [   56.131005]  el0t_64_sync+0x150/0x154
> [   56.134660] ---[ end trace 0000000000000000 ]---
> 
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Acked-by: Paolo Abeni <pabeni@redhat.com>


