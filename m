Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D559CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kXml5sxL5FgHFGnvzVrZnUmyeRp7OyAQ/g5lY07K1o=; b=LKbBf07A62U/1TDPQb8721hBvI
	sDQYagtB0Jcif4MmLMIiNn1CuRxLX69z7SR78iE+w0q4fQAGx7MQ1WsdQYVIyFBKrWi6FFk76cB8r
	gTc1V1uZe12SO6xVLUWD2C9c5pinJW1sbJJkLvvNw9KaNodtf2IfFv0WchhEmWLNWVr8T4yZOpfJ9
	RQfjT0PXkev601DyQGMkO03+h5ckYfTxKpr9NbgVEOvfUNTj3hKo+gvPQtbdpdNEuBrnpsacODqzt
	TMn1xVEaK8oNXmewLg+YYWgserHHdrsrT7l5zW3wbGOy3lRBf6IW9sR25oR9I43CEctKcOAX9N/It
	vIpf/u/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvssS-00000005CBO-2Rd2;
	Tue, 09 Sep 2025 07:34:57 +0000
Received: from out203-205-221-209.mail.qq.com ([203.205.221.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvryW-00000004jl2-3WYc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 06:37:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1757399815;
	bh=6kXml5sxL5FgHFGnvzVrZnUmyeRp7OyAQ/g5lY07K1o=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To;
	b=CvIVn6fgob10jxKrWJxG8Q59JQJy+a9uSXca7xswKNJHAVsTIPKuR9NHg0X89RXxJ
	 8NR6q2ROWXUrbIcnVzhy1JkzIGNAvLz6yD3chN5KEL8LmqhQ0CXDSC8FdhSQSmTuq+
	 4l9rqu+UB1VnK66beukf6KbbHDdpRg6s7IeWM0h8=
Received: from smtpclient.apple ([14.22.11.171])
	by newxmesmtplogicsvrszb42-0.qq.com (NewEsmtp) with SMTP
	id 9348F241; Tue, 09 Sep 2025 14:36:52 +0800
X-QQ-mid: xmsmtpt1757399812te48gzjec
Message-ID: <tencent_0DDFF70B944AC1B7CE9AC20A22D8DA3C4609@qq.com>
X-QQ-XMAILINFO: NiAdzfE16ND4NQ6su2bkHyOQz/K5BaRiBzsbhGv1dDvbM+5/vdI/qKIqFh6Bcs
	 U6xc6sfCRnJf5D8cMk6JwwwxnFVyLapQkP7e5uAA714+XZghiEIc1tMah0CQAj9H/tDX5VH1Vx1n
	 gs1qeamg3C9PjHNFI9lVeNq5fab71lZ/j9E7MqfWyocYVUikEplrrslJ5gvOfcNZOCrNR08vHbHs
	 FoyXf5mY/xwgkH2gKZY1oCVWvqCJ5D5H6VP6dVv5WPTyNgnf+Wr9toIWRTsc2R2XSOdpDXcHk/9w
	 UaonWze70r/FgcWUHI6rqftWKUk0dZMaY4B9lweWnfkIKcqrBPQbkKx0kXW4X/qBNSaapib8vAD/
	 gPpvvlWlgDcoWXAyolYTtNnQU8MUVVFQUgrSSVqzi4vWQ6wm4CZpULWlNroCQceS5z180j6xddD9
	 /7LhE5KSS5ns/mBUPig/4B21Mm5WP4vR8isb8FMW8hxo4tAxMfoWugYRxJUtKpNmT/k/aPDGMx1e
	 1bF7dU1bGsH4wNV2qdlAHL8WbhfAve06Sy0fKlfzzhCEBjmV/y29cqfSvtR4CVjICg8Kthl8g8IG
	 BVHpMxClSpG2aIrJ+++djTsolaZl1IpQkMREW7N0eJpCLqpgcT9rgvqyPS9324p2SChwstfZ26Rg
	 jGP2MrwFSFnOR9bPq2s21BRK19zZSFsQZOhAJS6KdukCE1nPf2LqMn6Thy/9Esqh2h/7hOf01Y26
	 P9MAHNKiJO5QQxQSL7676ZCYhnQW0+su92MNx6IXAQlUmIUHjFENxrRwvPPxjErTr2cU6J2CQwZs
	 38NZFBGsUfVc7IDA1pRDnjw+ywhVPzPLHOz0gK8+UD3YfCuHDoom+XSxCEJeuCfcpi5Pd0/oX2r+
	 la0TOediFO3wXEyPGSGhGsFtS4DKx6Ur5jKUNo/rbIIk5OqWfUjlnJ6o6vXdI7LtYmmG6xe7lr0t
	 KmgpcADswoNPkFTKzJoAv9ll5bOdo2OIusU0K43Y7/Y+2nyyTMfRMAqlNSDhdDr4BCENUDpWliu6
	 shHeVZtDrGXdinJs82
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
From: =?utf-8?B?5p2O5YWL5pav?= <conleylee@foxmail.com>
In-Reply-To: <20250908132615.6a2507ed@kernel.org>
Date: Tue, 9 Sep 2025 14:36:42 +0800
Cc: vkoul@kernel.org,
 davem@davemloft.net,
 wens@csie.org,
 mripard@kernel.org,
 netdev@vger.kernel.org,
 dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
X-OQ-MSGID: <97C888E4-C860-494C-9199-F8A3B9A6046D@foxmail.com>
References: <20250904072446.5563130d@kernel.org>
 <tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
 <20250908132615.6a2507ed@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_233709_360144_1DC00DA9 
X-CRM114-Status: GOOD (  11.89  )
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

Thank you for the suggestion. I've reviewed the documentation, and =
setting the reuse flag while reusing descriptors might be a good =
optimization. I'll make the changes and run some tests. If everything =
works well, I'll submit a new patch.

> 2025=E5=B9=B49=E6=9C=889=E6=97=A5 04:26=EF=BC=8CJakub Kicinski =
<kuba@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Sun,  7 Sep 2025 19:29:30 +0800 Conley Lee wrote:
>> In the current implementation of the sun4i-emac driver, when using =
DMA to
>> receive data packets, the descriptor for the current DMA request is =
not
>> released in the rx_done_callback.
>=20
> I wish you elaborated more on the reuse flag not being set :\
>=20
>> Fix this by properly releasing the descriptor.
>>=20
>> Fixes: 47869e82c8b8 ("sun4i-emac.c: add dma support")
>> Signed-off-by: Conley Lee <conleylee@foxmail.com>
>=20
> Hi Vinod, could you TAL? Is this fix legit or there's something wrong
> with how the DMA engine API is used on this platform?
> =
https://lore.kernel.org/all/tencent_D434891410B0717BB0BDCB1434969E6EB50A@q=
q.com/


