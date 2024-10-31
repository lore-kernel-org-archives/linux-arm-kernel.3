Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCB3D74959
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 13:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VA2D/3s3T/BEXi5y4Fa4JGpA6vR01kfLSIvpX9EDjM0=; b=SG+GaIUu3KZN4L
	QvAUgz/ecdFCjbF6eEr5NK9x2nzCuHao2uM3ZAmsC06DO+4ECbZ3+7Apv3gLW7RoYd3LoOGv+hJ6E
	sU4yBt8od1Am6jceZ+bXlOdA1VTUCINBRa2+iEaw2zepfIHEap80rrtcsN/1PFy2tkT+pwhTWkTZL
	nI7xABIGAXSU97cCkFIzFLoocyF3ARpcP5SyeF+1kbNmXGiP9xfEFkz/urec3gkY9hOEusIby2bZq
	Q1SGleRgcwqgw/PYdoV3sZ7XOX6o46G1NaR5d+r89DLK6KymzbM/YZCY97wd27vjp4kLRRL6cZiuZ
	yN8p7UjvvsCfKV5yWprA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VN0-00000003hPS-2A8x;
	Thu, 31 Oct 2024 13:37:50 +0000
Received: from cheetah.ash.relay.mailchannels.net ([23.83.222.34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6VL0-00000003h71-3Yr6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 13:35:48 +0000
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 6D89982EA9
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 13:35:44 +0000 (UTC)
Received: from uk-fast-smtpout9.hostinger.io (trex-13.trex.outbound.svc.cluster.local [100.103.175.141])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A74A982C00
	for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 13:35:43 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1730381743; a=rsa-sha256;
	cv=none;
	b=miTxGnrZ9Jvp8YxNgAOtAiwYNRzqfUhHuc1jF0s1FXA3xAFYBK1310neFMjxhokazG9fxs
	1lLrSSkIoIP1VLoCQXyMVKcO/VRUXrEyg+V90vHAiTNV+1rkYNmyS5T3FxdLFXdIpMBWI0
	ypcFJ2VPbgln8L2FfnKjbraE2XxvZ6kSeq+tJ1km7ag1gQyT14Fw1KmLxZJEYxVJgJqd28
	STDMwAkMAkGdNiW9pdyaJO0fH/DuuiGj/TDrV07VhPrpDl8IuELoY1/s0s17r30ry9hzmw
	HafN03AaQ36rm9I3g3oOYmNxUBhZr1n9yVMT7XPQpXY5RhHuaPVVCBES4M48jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1730381743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VA2D/3s3T/BEXi5y4Fa4JGpA6vR01kfLSIvpX9EDjM0=;
	b=Xm9oiRyWzzju5a3XgqtIELxw0cwjqKIgMb5D9BJmEkHWFXxyyEMfPH/hlLLCNTZ6Kz1wzw
	amhkdaFkR4an6VUpxxz9qmtq4LxCXgjymMgic+3T8cQVMK3KoVeZO4ZEfgoy742K6zDJwN
	KjMCgzy95XDqrkOmwJejXX9nczQ9YjblAlOsiJbBxFDpdYfqhzrsKiBcVLviaBoCAiEJm2
	09zCrUtWp6q4SZMW94JQqj1xzRW7TqmbcRhU2NbbfVyaSPf9aHFxkC66xTA/6NUy7iREMU
	taRdsBNxuGTPn4B5gqYJ+VvxWEP8GTk4rjFdgbKtbITnTC2FC849+J8dFVaKpg==
ARC-Authentication-Results: i=1;
	rspamd-77cfccfb8-2nmmb;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=arinc.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|arinc.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Sponge-Illegal: 56a423e32c90bee5_1730381744171_3147655827
X-MC-Loop-Signature: 1730381744171:1689136246
X-MC-Ingress-Time: 1730381744171
Received: from uk-fast-smtpout9.hostinger.io (uk-fast-smtpout9.hostinger.io
 [31.220.23.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.103.175.141 (trex/7.0.2);
	Thu, 31 Oct 2024 13:35:44 +0000
Message-ID: <d2776a19-5176-4ce4-9306-273ec7cda0a6@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1730381741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VA2D/3s3T/BEXi5y4Fa4JGpA6vR01kfLSIvpX9EDjM0=;
	b=XZ93d0EpvzYzHqsXjJbn3ujqnNXJ6i58bnSgHu+5Vj7mGJdKWQxTLBlxpOs+cHwM2O/Q9v
	GcaVm8Ha71r5FMWxOUY13wv3gKPvU7eeGaSKfCmNZA9CT6PfodxwJoJryqNRu+eSwXld8e
	naB/9gn4qYMM4MqG6oYcZBEuxVVIJvWpZ3rAI6LXHHCG3EmPMxYkUqT8cISnd4z1E2ynMI
	R367UCo5Y0YcG2k+KtUa4K5dslTBvxIZpbjk7HzRAIVIl1YxHKgmPBDchgwnJKHGcUyk/2
	+yWH3IjIhcuHu/8+/OAxAZBQEvg3ml71p3YbcKHVqNsjSsq3JvICJC85i/SBRw==
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add TBF qdisc offload support
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241030-mt7530-tc-offload-v1-1-f7eeffaf3d9e@kernel.org>
 <a66528bd-37cb-46b2-90e5-37b10dfa9c78@arinc9.com>
 <ZyM5CPfQYHc_Eolh@lore-desk>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <ZyM5CPfQYHc_Eolh@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 31 Oct 2024 13:35:39 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=ZLWFmm7b c=1 sm=1 tr=0 ts=672387ad a=aGj/nXfi4qz2iMxz7h0kJQ==:117 a=aGj/nXfi4qz2iMxz7h0kJQ==:17 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=LYXDv5rQIZ189asnIbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfCfguuhZl9jj8TTlQ0BBGoVE4NCQHUKSMlnIjPUdQpeXnVRPJJIzY/PL1QnOcPwa9fEB9GoRLsmv6tlPeU1OUnQUyhOnssZj8K/3Jqf/y8j6GvIWThU9 6tNuW6h+uxTgOqQnS9GrVdB0FQUTsyIRpdf9//BYkD3Y1DubfPHmlWJBH+B9NeMUgXZdGlyryRWRtK1p2x2iUK/NRGLEK3MVHixjsSzi6BVTJ9oFC7Bymcnp jRStttJLp7W4KlV1OGSmqHM1vr5MxOGbxKKPaTQ7ErI60Tv2+vEYZDk+QXMAqzZs3VFeUUNxuydKwCv98dbMhdFdFr7Qv1xXDWlP/oncRWURJrBh7vhy77Qy 64jbcJph/3Lypl+8Y3Xh4pQE2igSoIQyyK3m6f18gUb1g/ReIlLXMvh59y8cXe6NYCgAnoALEgrX9Z0x5cYvsdqifryrK9jYPjYHJJud/dLJWyb2YnqswX8a SJD4+BitVvWpeMuzq+P3wQzAZMmFAHvJVGHmRb+QsSXW5re1D7GbTgoX3vvXBSnprKM5RQf8iSZBFbQPFN6OAHRH7vnkTf9C7mCu3gm7sNL9QlR8z6HEsCFV PwZ8JaOcXr/qVujUKBsqlZI5sl8aAwyrPfdJ99rCtAqMY5hU7GYRzGotqr6ZPHh7a0AWjGSpWfuVNJpPRRLjEcqRusArVz2Tj5uRtSBdqZP4ecpV96ueywVV 0zhzQK/Uzk8=
X-AuthUser: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_063547_268893_0D71ACC4 
X-CRM114-Status: GOOD (  11.78  )
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

On 31/10/2024 11:00, Lorenzo Bianconi wrote:
>> On 30/10/2024 22:29, Lorenzo Bianconi wrote:
>>> Introduce port_setup_tc callback in mt7530 dsa driver in order to enable
>>> dsa ports rate shaping via hw Token Bucket Filter (TBF) for hw switched
>>> traffic. Enable hw TBF just for EN7581 SoC for the moment.
>>
>> Is this because you didn't test it on the other models? Let me know if
>> that's the case and I'll test it.
> 
> yep, exactly. I have tested it just on EN7581 since I do not have any other
> boards for testing at the moment. If you confirm it works on other SoCs too,
> I can remove the limitation.

Seems to be working fine on MT7530. As we have tested this on the oldest
and newest models that use this switching IP, I'm going to assume it will
work on the other models as well. You can remove the limitation. Also,
please change MT7530_ERLCR_P and MT7530_GERLCR to MT753X_ERLCR_P and
MT753X_GERLCR.

tc qdisc add dev lan4 root tbf rate 10mbit burst 10kb latency 50ms

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.00   sec  5.88 MBytes  9.85 Mbits/sec    4             sender
[  5]   0.00-5.00   sec  5.50 MBytes  9.23 Mbits/sec                  receiver

tc qdisc del dev lan4 root

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.00   sec   469 MBytes   786 Mbits/sec    0             sender
[  5]   0.00-5.00   sec   468 MBytes   785 Mbits/sec                  receiver

tc qdisc add dev lan4 root tbf rate 11mbit burst 10kb latency 50ms

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.00   sec  6.38 MBytes  10.7 Mbits/sec    6             sender
[  5]   0.00-5.00   sec  6.00 MBytes  10.1 Mbits/sec                  receiver

tc qdisc del dev lan4 root

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.00   sec   467 MBytes   783 Mbits/sec    0             sender
[  5]   0.00-5.00   sec   466 MBytes   783 Mbits/sec                  receiver

tc qdisc add dev lan4 root tbf rate 11mbit burst 10kb latency 50ms
tc qdisc replace dev lan4 root tbf rate 10mbit burst 10kb latency 50ms

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-5.00   sec  5.88 MBytes  9.85 Mbits/sec    4             sender
[  5]   0.00-5.00   sec  5.50 MBytes  9.23 Mbits/sec                  receiver

Arınç

