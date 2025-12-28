Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A580D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/ULi7au16RbQhuxLQHDwhGe8b7wqTmnUudIRkdZns4=; b=a5m1wiO7G/jwyo0uyv2GK9TeZ9
	N/Tyosk9E/bcoFkUJQhum58dcV8ERjMioapho/see3XZw+exU7MOmZ9pMOYi7grq3gTWYnVhftKY8
	NR75uEio+SVzN+mJq2tBD49u4knPMonRgeBtpoFpbIPLeIOY45jINfLs81ZzDi4mxA9bP3sztD101
	iiLwH+pjL0FHkjLHuxVFJGfyZPdYhA2kwfpcKuivmKrUPGlCHgRdQ1Ol9pqGV2p/YaIXVNV44pz1t
	QpvtYBxwVKl8BKiPPMDQMyxYUbiAknlT2wHkugDxCUOKptlOQ/We6ayLz/YhiXVm6cRGOTTAZk0Mg
	jQuLYDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqJ0-00000002lR5-0k5K;
	Sun, 28 Dec 2025 12:55:30 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqIv-00000002lPj-2UXD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 12:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1766926509; x=1767531309; i=markus.elfring@web.de;
	bh=U/ULi7au16RbQhuxLQHDwhGe8b7wqTmnUudIRkdZns4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZNGFqxs7FS2oGiZOpdR/aovbO56kKLsXHa7aDzftKQ/Dm16D9vMVIWlDE0lTXTdI
	 TRu/ty55Oc2LUvK7gsNXe8dwhJ6KTU0rwhhu7aPKJT+Eo0stWh7BKf67QiyB2Zdpf
	 HKphZA7+KMr0DEQf2CzADmF9HnB9zpzCYm5E+A0SaC0YlItdni+iPIHUNPO000iTP
	 /4ehHamTT5HY2/pnFG0Z3CmBG16/lb4T7YN0SMECcjEKFGJnyTPNB9KVEAX3gM8hs
	 qKlzNWWtZl6CU2x9th+juFJvvSmeYDILuvvxhUHV8tkOhCaTrImbh/T/wNJfOCsrP
	 fm9bZDbgbpZmTaLS1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.183]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrOhx-1wEwTS2jfb-00dpsL; Sun, 28
 Dec 2025 13:55:09 +0100
Message-ID: <8570d445-30d9-4742-afc6-5484cb7d3d75@web.de>
Date: Sun, 28 Dec 2025 13:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-arm-kernel@lists.infradead.org,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20251225143256.2363630-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] soc: ti: pruss: fix double free in pruss_clk_mux_setup()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251225143256.2363630-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UrEnOYvbG5xv/M/DTtWjD3glvyUUcYkEFZXC7EuPOLqVSVncbea
 Ey7s6qnVyxlHAh8yhIaGEHDZTBIGaX9UlQPWy6OH+1JY7wb5KfnCcxwnxElH3M5oCM3g/XV
 9BWnfiutkR9rqgfTuxFW2imTlxMLguODhBwe2gNFxtKecJnqt519CUaUn2Rg8JCwOzllrxF
 E/6UHDEcezPjgKM0Ug72w==
UI-OutboundReport: notjunk:1;M01:P0:oYmzYJpqhLs=;4K1yMgAG9SASKYGg5W6FRv+cbhA 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_045525_998988_EED00572 
X-CRM114-Status: UNSURE (   3.10  )
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

=E2=80=A6
> Fix by using a separate label to avoid the duplicate of_node_put().

May you return directly?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.19-rc2#n532

Regards,
Markus

