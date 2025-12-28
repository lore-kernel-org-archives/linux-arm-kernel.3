Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A60E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ODT4lV6izjlSBBO0fPN83weymhthmXy2Ki51JZYY7c=; b=1KXHA61IwW+yktxTwz1XTfIvwN
	/dqd68wmiM1v6SfMDKPM7souimvg7jIrNyrIjQny95+iz79RIHGz6DFpD1ffU3Gz/YdVZXd6uAJ7d
	Z8JpqaZlQJzYgQ5TQR1mX88C+DTH3GYYJ1/yOG8P4MNstRuuWEvgNpbZnjvOBWAVBhTgJ8hCrJvKm
	yQpCX3npDIVa/45PQGT+JpNK7YeRsrR5C06dIQaVWDL0t9vFZyVmlJU/xqmqNBRIDnDZsRHRRRokU
	HqCJAzFpdiiIoTf/M1PepRIrID4EgVMHYk2kqx8Q6XA/UNWYcMRloCjJBcjqwPQQzNxVdyVuG/r9m
	LOs1CTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrcH-00000002nrc-1yTM;
	Sun, 28 Dec 2025 14:19:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrcG-00000002nrR-1BEo;
	Sun, 28 Dec 2025 14:19:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4ODT4lV6izjlSBBO0fPN83weymhthmXy2Ki51JZYY7c=; b=GPP4rEbXT994xhR8EkeD5tFCjO
	SKAhwoaQXhFOMtFBtdcF6xhwThjBTDTCRl89UWCe3qJTT61fXXYRfZcAueLOyw+YBPi5Cj1lHz+Gn
	0Lk3dVHp2bwM8HFyw9V4pdp0cZGYW4mr5RlDKdhhvfhKet7/KkR07qsR4+oUOupGiY0DNTeOp+zYz
	nxH6088Ao/Y6cNJ44LhU9sNo95c23cbkHqEBS030ga+gCl8C7vX/13coyMgm8epJ8LpZ+2tOgfOPU
	/esGK2ZKrN38zCmM+U7FBpqK6hGl4SZ5h7I/AIZ1Y+P6Hf7EuCwqGrgfXaYAuVPYdt3q8JewKXqjP
	9crAayvw==;
Received: from mout.web.de ([212.227.17.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZrcC-0000000285I-2sAq;
	Sun, 28 Dec 2025 14:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1766931542; x=1767536342; i=markus.elfring@web.de;
	bh=4ODT4lV6izjlSBBO0fPN83weymhthmXy2Ki51JZYY7c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=CfDv+AbubRn20xmagkA8WROO0NRzsAMz9JAn124Xh4/5EM4ubk8k3O/4uvphvMp8
	 xJHU2XgPCtv2eG0Audqg/lM9dczqTGJ/va8ILijqejyYySYsm7OWTL1odalaiaR3i
	 Hc8wa8x1twwtCezaSeVhRbtkKFeSOGQzPotckBTnWr3J62jHfy+ivTQTtBc/Tqx/r
	 DM8LUUBt3yboQff3B3u24dwt3RdfCpPD4BQJG5LE0z31ICi5+7ZX9aSI05htD452G
	 iSNj/kZeVrk+BSa3wwzEy1yEI5mRyg6RgGIUngIZWd97wrQ4m8hVVODb3fLFnyGW+
	 IgQcGcELNAkOWOg6WA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.183]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MP3CA-1vHCf42TWu-00XvIa; Sun, 28
 Dec 2025 15:19:02 +0100
Message-ID: <20dca540-1c20-460a-9079-718db465c518@web.de>
Date: Sun, 28 Dec 2025 15:19:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jianhao Xu <jianhao.xu@seu.edu.cn>, Zilin Guan <zilin@seu.edu.cn>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20251228125226.3684517-1-zilin@seu.edu.cn>
Subject: Re: [PATCH] soc: mediatek: SVS: Fix memory leak in
 svs_enable_debug_write()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251228125226.3684517-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:B8e+y3STUYayueQsBYtgskDzQIWmkN7RnFHvWUCP5roxhASUpET
 xfC+E5+AwW5PJ4hFPHdhHbhVIvSFNnc4n7uhNnut5LFj0sU+ZYtBDq3nAaJY5YpVCCINNZ7
 xCRuQ9izcX58UtfG+dwlXt0+QLbuD39J7GPaZDpaMpXggwBBGDJWjL5aVLbe/Sl7rnmNBJM
 rW+gdP2GJMvlmqkjvYLLQ==
UI-OutboundReport: notjunk:1;M01:P0:+EGHf68uqSc=;P/hS36Nxwx+s7B0jB7BVqvb0I98 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 C/P/D35+hjAKRC0g8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_141924_879069_40F18A07 
X-CRM114-Status: UNSURE (   3.49  )
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
> Fix this by freeing buf before returning the error code.

How do you think about to use the attribute =E2=80=9C__free(kfree)=E2=80=
=9D?
https://elixir.bootlin.com/linux/v6.19-rc2/source/include/linux/slab.h#L51=
2
https://elixir.bootlin.com/linux/v6.19-rc2/source/drivers/soc/mediatek/mtk=
-svs.c#L785-L813

Regards,
Markus

