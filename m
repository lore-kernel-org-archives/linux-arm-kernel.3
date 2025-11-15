Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C98CEB2C1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 06:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:Cc:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22V9LA5EG25ixQqAK3BaH6CZbg6omG/q5oeXsF1qKJY=; b=HS4XnyHWfz2nwe
	CJfz0GwKqfLGHxMUkdMYhJAbJaRuCjFZqWLlT3mI0UrNXwwdHRcI4gWyiWnqUe4PlAdhvyDiKHqLX
	/W8kvBvKUNWOoLF/E/01jsXSfjeWVjakzXQqGhBt7aRnfGnxlkc6MVW+gUuBUyix3YCbk26Ssyg3t
	u4oYv6Ce+GuFeA9jieGO5k5qQ4CBx8aRp49G6vwaeDASaVx+X/o/O1s+57sGs2P+hB40GdPeF4h0d
	Z9KOs6TqQoseAowhRblCfdIcUOct9EAhAJOzRfT3lV5cvIk/9D8PvitKur4qcGBGfFzLOkJSBUr7I
	C8bcWAUUiPEtOLmqhgYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK9Ns-0000000DWiu-1cnE;
	Sat, 15 Nov 2025 06:03:40 +0000
Received: from hedgehog.birch.relay.mailchannels.net ([23.83.209.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK9Np-0000000DWiV-3dAy;
	Sat, 15 Nov 2025 06:03:39 +0000
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 64EAA82216B;
	Sat, 15 Nov 2025 06:03:36 +0000 (UTC)
Received: from fr-int-smtpout30.hostinger.io (100-96-111-23.trex-nlb.outbound.svc.cluster.local [100.96.111.23])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 48FBF822130;
	Sat, 15 Nov 2025 06:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; d=mailchannels.net; s=arc-2022; cv=none;
	t=1763186616;
	b=w2Jtwj/0FnGUAqDQH3DA3adxITImHXLaqF16kOU5IXehEj5lAPdUukH3AelDbns15TNYu2
	o1ZNIlOsW2GTQZmYBCl5G9b7thog0IAnPJiZbMR+Ox4PITinGOlXJNsd3FquQqyNqYspg7
	QIUjXHs9dCRxgBz5mpos4mGRuuHViuOPDvTAoKEC6xFfrc6nv+YQd0QE8l9JMXRQXJ1NCY
	tfQCWn6+q2rmodEmv8hITTwj6rQvtGOXZ+IQr8FLKV8OdrCZZ8PgoOsiB5Tg6OwYfSxWGB
	2iL4go7zDy4eab6z4ZAj/JnxYdljTeiNE7+IOLvDDg1nplHfrFk55Lph8lAlpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1763186615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=22V9LA5EG25ixQqAK3BaH6CZbg6omG/q5oeXsF1qKJY=;
	b=U++NZFef/+4f7VLMGSZJkebmyrS2q5R/wt7EPslRDfoJsbMFrtxzgnrf7N9B2ZFI+BDggH
	YzffzH+6QiSHf8gmGk4g76snONjqBybnjDXTNEu36TyuVlpeue1jfaU81sU9TcV3SgpSGP
	UMPa4ad3PbudBdC5hRqB7ZVua2NRIWm0a02RhBkWZaHl7L6PJXfc1yoYBshqlk0j0YJc6S
	ucjUACHA03fdP/wPlqsupaD4Z4Z8NCpBomhft21CJHQSsVBP2RYcnLrETCdtjHxJNmKMwY
	VXQfdSc7F78UdLvdTuJLnm8wnCw1q7CUBtKrgoz+gG963euXO2+3nNgv+nxc8g==
ARC-Authentication-Results: i=1;
	rspamd-5664d6b969-mmzxk;
	auth=pass smtp.auth=hostingeremail
 smtp.mailfrom=michael.opdenacker@rootcommit.com
X-Sender-Id: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|michael.opdenacker@rootcommit.com
X-MailChannels-Auth-Id: hostingeremail
X-Shade-Arithmetic: 460b30fe28521824_1763186616178_192050952
X-MC-Loop-Signature: 1763186616178:2873199001
X-MC-Ingress-Time: 1763186616178
Received: from fr-int-smtpout30.hostinger.io (fr-int-smtpout30.hostinger.io
 [148.222.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.111.23 (trex/7.1.3);
	Sat, 15 Nov 2025 06:03:36 +0000
Received: from [IPV6:2a04:cec0:120c:d90f:a2e1:5df1:fe6e:7680] (unknown [IPv6:2a04:cec0:120c:d90f:a2e1:5df1:fe6e:7680])
	(Authenticated sender: michael.opdenacker@rootcommit.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4d7k2q6W7wz2xNr;
	Sat, 15 Nov 2025 06:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rootcommit.com;
	s=hostingermail-a; t=1763186612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=22V9LA5EG25ixQqAK3BaH6CZbg6omG/q5oeXsF1qKJY=;
	b=diS6MqfpzNDzmvO/x1gdzL6YRZ+gXusTOuVlMNysWipMgYL7LWuCTVoE5a0gL5B+zWQGxz
	TvG0D/5v5pEBopi+AhbrgFK07z11rcAgmgvv+ctyteNlIWA9H123MLd1PlpeU2cpdgGTa+
	TgP600MkiIIIQoSY2RPBBPOWKr9BUAsntobvFIaMgeVr880jiSwimIp7Daz5VB64aE/8FH
	9Awy0XnoDqwIl6Wt5w9IwNbjlf/Hef5PTrmiOoRYuXVx2x8Fg3/qSt3gTz7oJ8xfSBvI1A
	O54mKaIrMzhALSkEknPeHo8Op2teUtIFXtWL9dhBi0PMISWyk/TwWwvVZxXRMQ==
Message-ID: <bb74679a-ce21-4373-bcc5-1214e9bf832e@rootcommit.com>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: michael.opdenacker@rootcommit.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add Asus Tinker Board 3 and
 3S device tree
To: Dragan Simic <dsimic@manjaro.org>
References: <12d6e151-dfa0-ca0a-5888-ddffb2dbdec7@manjaro.org>
Content-Language: en-US
From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Organization: Root Commit
In-Reply-To: <12d6e151-dfa0-ca0a-5888-ddffb2dbdec7@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Sat, 15 Nov 2025 06:03:31 +0000 (UTC)
X-CM-Envelope: MS4xfBhh+tXSvsPbD5H7iNzCO9gve8ko1ClBApKZM2HN4hoCJ8bcKcs9ulpFY3KXwA9DgWbEdVzQi4K8/ejXA6+S4r51pNvjP0F4gFIHaIrzMeKTcRqSkXeU nIObt1x4r1BceyJXy49kfa/LT3jsKC/Nu/5EMiOf+t3lwaw/cDEVAU7xaHBwrc6RcXtE80nMmfEwXxhOyt/WfVzs5ViVWuwDWT9azj+od2RyJ+/g8V3tQFuO urpbnIjdPURB+xSrvul5wb0qlOtfy0RZK7VJ0HZXda0PBrRwjyNLkLfCEHvnQoMBNUfKNhg8+SVvdwojv1yKZUkzYSigIlYDGVizh/eJ8bAvtR9/4L0zFEgM ilkipZsF5J3YS5WQ3AoiLWEoV2PBFmF7FptZ0Ams0yNIjeJTPSDG1PX8BdOb3GaSfWN6OQOZpM/MIu3gTAWLf3MI1iY4lpIGlHbvsMS3qtL/O5TQUWotD8// lFM94hLv5S48jAVJ5fj6DgBBa5+xA04BohY31ZXevOhu8Ee4XJa+QK2p2YrDANBXx5nzcVAjcrvpEJKxIBd+JH1xFXzsrRfohgt6Z0fW70ef/G7wzWUOU8+O LsxZ7suvM3DfQMuPtJjOKAG3wedFse7lv4YdVdTeGhpH7ETyv4BaD0ZCtydG/uTvqy83Yvo/WK/OANZoTikFU/gU
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=691817b4 a=eHakbqL08FGSeumsndRQeQ==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=iGHA9ds3AAAA:8 a=d70CFdQeAAAA:8 a=DLBR4L6yPKTlh_JyUqwA:9 a=QEXdDO2ut3YA:10 a=NXIwzYraRHkA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=NcxpMcIZDGm-g932nG_k:22
X-AuthUser: michael.opdenacker@rootcommit.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_220338_213080_6774C221 
X-CRM114-Status: UNSURE (   9.93  )
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

Hi Dragan,

Thanks one more time for the reviews, much appreciated :)

On 11/15/25 01:53, Dragan Simic wrote:
> Hello Michael,
>
> Thanks for the v2!  Please, see one nitpick below.
>
> On Friday, November 14, 2025 16:46 CET, michael.opdenacker@rootcommit.com wrote:
>> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> I'm sorry for not mentioning it in my earlier responses, but this
> line is redundant, because it duplicates the From value found in
> the actual email message.


This actually comes from my Git settings. I need this when I send 
patches to the Yocto project and OpenEmbedded. That's because their 
mailing list server which alters the address of senders ("<sender> via 
lists.yoctoproject.org"), and ultimately the commit author identity in 
Git. See 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#fixing-your-from-identity

I've checked that my patches apply fine and that this "From:" line 
doesn't appear in the commits in the tree.
So, can I keep this?

:D
Thanks again
Michael.

-- 
Michael Opdenacker
Root Commit
Embedded Linux Training and Consulting
https://rootcommit.com


