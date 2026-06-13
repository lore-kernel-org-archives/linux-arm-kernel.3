Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7504CD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNX/lSr1eAIewD5raDSzWjla5fQS29KFlsi+CQtdSy0=; b=nBiK/Tcf6a0HCFOFM1/ZG5ShUh
	NMo5SX61tiaHF0L9ogapONeLKW9Hq0IX9rpL5G7YZRO1v7D+VaCyXQjSn4KuEcoAS6DGPCYX9dz1Y
	XhVwcql2DFle7gxD2uimVJDwAQZkhnrUBjbFNlOMV1AxfsLUW2JLfZpH5Ifs0OisEyiXq9tVRUw/g
	+8tTbyoir9kPB6lCQMUOT/S7djXukb/M7YKTZz0SNL+0EklwIksC2zddaVAKOpj0iQKcJnTl8EihV
	K3Cy6tJQki6fkrOkrxsSz/r0vOEukdi2RxIO0JC02D5ABFdzmtz2uzttsYMwvmXGercubhNtjed1r
	gC93tNpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWMM-0000000CYyZ-24tg;
	Sat, 13 Jun 2026 21:57:46 +0000
Received: from chaosmail.tech ([77.81.229.115])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYWMJ-0000000CYyE-3MvI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 21:57:45 +0000
Received: by chaosmail.tech (Postfix) id 753921C812E;
	Sat, 13 Jun 2026 21:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chaosmail.tech;
	s=mail; t=1781387856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jNX/lSr1eAIewD5raDSzWjla5fQS29KFlsi+CQtdSy0=;
	b=eUF3MRlF0nhurOSYnUXvjSua8K2fyjsXiMvEXe9vOC+78PzdiSSx+TP6JLIhewVcVel9ls
	m+HTOfju9Wh6N7LZxozaV5nJkUeIYC8WYQE1nldOzSNDhQamyq9XmAwr9/aUT+gazaCV3Q
	cpm/nHWyqvXsE5eFMJ4BEjx0m8x0Ik0=
Content-Type: text/plain;
	charset=us-ascii
MIME-Version: 1.0
Subject: Re: [PATCH] Input: apple_z2 - bound the device-reported packet length
From: Sasha Finkelstein <k@chaosmail.tech>
In-Reply-To: <20260613-b4-disp-b1926f1a-v1-1-3a277b7c0cfa@proton.me>
Date: Sat, 13 Jun 2026 23:57:25 +0200
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Neal Gompa <neal@gompa.dev>,
 linux-input@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C6E5770E-7102-4D12-B8BF-58F902FE8176@chaosmail.tech>
References: <20260613-b4-disp-b1926f1a-v1-1-3a277b7c0cfa@proton.me>
To: hexlabsecurity@proton.me
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_145744_312354_C437C720 
X-CRM114-Status: UNSURE (   6.07  )
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


> On Jun 13, 2026, at 23:42, Bryam Vargas via B4 Relay =
<devnull+hexlabsecurity.proton.me@kernel.org> wrote:
>=20
> From: Bryam Vargas <hexlabsecurity@proton.me>
>=20
> [...]
> Reject any packet whose length exceeds the receive buffer.
>=20

Reviewed-by: Sasha Finkelstein <k@chaosmail.tech>

Although, if you reject the packet, the datastream will be desynced and
the device should be reset before it can operate again.


