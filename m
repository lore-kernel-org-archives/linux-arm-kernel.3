Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41714CD98F0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 12:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=; b=FzjRa+LNxZnRwrOgZSqk7pKR9B
	0FYR91QD0E0/w4sqgOKgfPCwU6wmEbEQRKqJDmpATvvKdLosP2HS1qHDLvsss91r3QNiBXrb6WY4O
	kxH319OsuD0dyqcxEzQmnsu9zr7B6hzWCPBAI1cE/im+A3Ii7kl19iR42TEhVByMbtcnncBqxLQi+
	UgxJvy0skZ4RsqOOO9fjNY/4gPZ98+1xGwWiiS5QW2JbSDWp6J9+d/JTE+n5tCZnG8p6Xhuj+bHaf
	mxYXd7I9TXsEMhTsDK3GUTiDX2JyCORVtMBDONWRCNODdaqy3k7QPhhr3IAPW+t7Yx/YTnwHlUsHi
	yGJHCHIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpdD-0000000HMUl-38l0;
	Wed, 17 Jun 2026 12:44:35 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZpdA-0000000HMTx-34qv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 12:44:33 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36babe2c4bdso3514029a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 05:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781700272; x=1782305072; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=;
        b=B0KVcj+nxG1LqVn8mJCEy56RSkjEKL8nHiHsom51Svo7zpucaZRrhBSa6jMuG3UtUX
         Q/a32y8v7Ti4fZFiDVtqf6Zxrb6B1vmaEaeautmZIUSYEfX6sWdRNqEAi2YyOabbgcrU
         qocwampiHZHTG//8HAcX1etvUj1zSe4+c+mxCXTLJ5LQLinIoCzEltA1uu3gSzolcb6H
         yB0udEZME2JBJ52b8wQ4WEgfeVy0i8DoeY5AqRg5MFiSPcxxiWYTvsZNpFlNAUDZNvtv
         TUBvI2RSz1wzlyQ+k+F6xGgdms7NNuVkEWNPNOx66pGM1FIjg3g8ou893XnAmWp7XRAs
         tQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781700272; x=1782305072;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtZpg6+SNfqVKkCzu8nevfRevHrYlcFg9kiIrAq1Sj4=;
        b=oXoRzXf+2RPuGIwAgPi6TIvw/Nl+/KV0jwEaD/YTcKb6QkStl7vUMlBNKJpj1ZWJJq
         WOcd9KZMDxUYo52BynkADC8OVrXrrccAgfRckWns6NaeX5WNmwdQ5P4kZEujugKtjIhg
         t/2LL5olkW+fERMxgEGLwYoLy2jtiwtqzma9MMcrlBO9FhQ3h1Q7jBmTbam8HCuLOtbX
         wDZGQMRCkH9gQFjnFMZPHOd5aaZmI43AJ362oNuuJYK2Pimw9grTdLZkSNRnSKBz36KH
         Bqj5JlHHenZG7FDhhdiaW4RJnx0BKcq4NDjlR3L87Mjf+e0elidqMBFqN0YLPL4PZfyh
         05Jg==
X-Forwarded-Encrypted: i=1; AFNElJ8WBHjtQRT4Q1fFHRfZP7bSSAmpIyq4P12zOiKEkCpdVBffGwOOWBQF2ltOypGxjA4OlCMka5il2TxgGuY85gJd@lists.infradead.org
X-Gm-Message-State: AOJu0YzH+IpT0HwK7M4mDtHrQmsPqctZgILQS0QUtAuqCiWiQQ7hkDPc
	XRz44OaS1WizXA7wuWgy1TdscFWolLxV1bpJ1lI4Gd9vm8ir5cHCEdZc
X-Gm-Gg: AfdE7clohAWdmMpZKWheo2uSUMG+Xa/QK3BSojj6mifNetk5IPExSDmrmJBwB+hzlVr
	e0DYbdkNa+KyvW5/cxNsJnfo9arzp1RqYoQbY7U1tp+IFLZ7FiwII0/sXD+V6SpG6DHI0uUla7n
	ejwXDSRQG9eDYcPwSYW3qenHuR72zhlXG9iudBt7kmvgdi//gtKGoewkkffWsR1xrzFYPAKOgWM
	XV3ZVIdV1b5Tr8n3JHDTLTN+RDYR2zPfePElNiv+pBr3io7kPo3ec04cRp4vfb6BmYkqa11KmWS
	b5BMs70Z8rCcjrntx8QDy2GzDKxprVtEwMqD/FyQu8KTMiIGEPbi/zLsPYjj+w5pdEP9yIcKSNo
	Wh5qZ4ihTQPEMVUo6prqpDTh8wQCVv9WF5/c479dyhO6JXEIcTL97t+w6v3wGPZ8ymi7jtesYtI
	vHUtHxEVav
X-Received: by 2002:a17:90a:7347:b0:36b:b4a1:2939 with SMTP id 98e67ed59e1d1-37c9366b4d2mr2876234a91.15.1781700271792;
        Wed, 17 Jun 2026 05:44:31 -0700 (PDT)
Received: from [127.0.1.1] ([58.240.122.156])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521ae78csm5987071a91.4.2026.06.17.05.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 05:44:31 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org,
 edumazet@google.com, andrew+netdev@lunn.ch,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] [net] net: airoha: Clean up RX queues in airoha_dev_stop
Date: Wed, 17 Jun 2026 20:44:26 +0800
Message-ID: <178170026659.2238511.17652659042899875248@gmail.com>
In-Reply-To: <178161160256.2165161.14322392784449633554@gmail.com>
References: <178161160256.2165161.14322392784449633554@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_054432_793638_022B7C61 
X-CRM114-Status: UNSURE (   8.10  )
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

VGhhbmtzIFNpbW9uIGZvciBmb3J3YXJkaW5nIHRoZSBBSSByZXZpZXcuIEkndmUgcmV2aWV3ZWQg
YWxsIHRocmVlCmNvbmNlcm5zOgoKIzEgKE5BUEkgcmFjZSkgYW5kICMyIChSWCByZWZpbGwpIGFy
ZSB2YWxpZC4gIzIgaXMgdGhlIGRlY2lzaXZlCmlzc3VlOiBhaXJvaGFfZGV2X29wZW4oKSBoYXMg
bm8gUlggcmluZyByZWZpbGwsIHNvIGRyYWluaW5nIHRoZQpxdWV1ZXMgaW4gc3RvcCB3b3VsZCBj
YXVzZSBSWCBzdGFsbCBvbiBuZXh0IG9wZW4uIFRoaXMgYWxpZ25zIHdpdGgKTG9yZW56bydzIGVh
cmxpZXIgZmVlZGJhY2sg4oCUIFJYIHF1ZXVlcyBkb24ndCBuZWVkIGNsZWFudXAgaW4KZGV2X3N0
b3AoKS4gSSdsbCBkcm9wIHRoaXMgcGF0Y2guCgojMyAocS0+c2tiIGxlYWspIGlzIGEgcHJlLWV4
aXN0aW5nIGlzc3VlLCBub3QgaW50cm9kdWNlZCBieSB0aGlzCnBhdGNoLiBJdCBleGlzdHMgZXZl
biBpbiB0aGUgbW9kdWxlIHVubG9hZCBwYXRoCihhaXJvaGFfcWRtYV9jbGVhbnVwKCkpLiBATG9y
ZW56byDigJQgZG8geW91IHRoaW5rIHRoaXMgd2FycmFudHMgYQpmaXg/IEEgb25lLWxpbmVyIGlu
IGFpcm9oYV9xZG1hX2NsZWFudXBfcnhfcXVldWUoKSB3b3VsZCBjb3ZlciBib3RoCnBhdGhzLiBP
ciBpcyB0aGlzIHRvbyB1bmxpa2VseSB0byBtYXR0ZXIgaW4gcHJhY3RpY2U/Cg==

