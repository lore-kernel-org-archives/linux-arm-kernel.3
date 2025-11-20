Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514CCF857F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZcPaIUmTWhRvW3hgiFXUWZcKDOna0ZGDiy0Ou4SzaHE=; b=An7+ou3zTkySOBTdzUuAL+2Obj
	YtHzpmZ5ryel52ZFGXEpOqH6A+U3ItXOTVpG7rRH28rXpBK3fjuW3dm22eX8Y78GvvKjUuPo91HSk
	ykVc9YDvLM1XLj61ecWeq2htlB0Olpf8XY4RC6Qj22xUr9KcoX+YZCMLpXz72FTHFFfvWtpKo5T9M
	yhGLTqqrZcGw70VIR6XoQgi5c8AsWXV/Ngyo12BWD57Dmg5v27VSRBIFZ+wmlz3SsqRuDcKrXE+IP
	UD+D4et7O8JBQw0aCTEiCRKuHfMH8EnNMSFsPLpQkG12hWsDrCtClZnGKdzjsLQqd54CUZAQFDd6I
	vTta7Kow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2G1-00000006XJf-3nYa;
	Thu, 20 Nov 2025 10:51:21 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM2Fy-00000006XJ3-3bAO;
	Thu, 20 Nov 2025 10:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763635863; x=1764240663; i=markus.elfring@web.de;
	bh=ZcPaIUmTWhRvW3hgiFXUWZcKDOna0ZGDiy0Ou4SzaHE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YZV8O/wsGgv0KkV+ckz/WjLCXW7KcohJguEgoOTgqhDkcj7JVjUotcB3ia1g/DCO
	 UbCjZNu7kfWo4UcEJHaKc3QRBXdI3loM19/MNpeEmQH5oaIvGqOiPrd9bPqS6Oj/2
	 P16fvozH9B9Zha6pjq+4VKm7Gp+B0Qq1tzgeP5ar2FPfv/2uPPrnevucX63KgfPwy
	 +808TSXGjtbfh+xIAQESdpoQDxCfJNq9o9ITIA3pNU7uaYUI85FfOU6D7h8XM2FvQ
	 OdiIJgzqUSd4M4x9/hPrT8JiYwVAdNBRlIixLGXCvWrIeVgcSC5P3lfsxRG3QI9Je
	 wzOR8L3KNGLxmjYCHw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.176]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8C07-1vHLHg2cV9-00HUeV; Thu, 20
 Nov 2025 11:51:03 +0100
Message-ID: <d9da11f6-3a4d-4aac-9d1b-eb6ac1ef3fe7@web.de>
Date: Thu, 20 Nov 2025 11:51:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] mfd: mt6358: Using a single IRQ array instead of two
 companion arrays?
To: Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <84ddee3b-df7b-4022-a864-66da95283394@web.de>
 <20251120100545.GX1949330@google.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20251120100545.GX1949330@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6X+Pxxiajbx54EOclh1Z5wi7+DSrJoP2Mc/8z3Y2xmq6Pux//35
 bYkhF964rtPz07SpMcY/q4+8FOwjBJsnEXh/wnjzrRDzAanCEiQZyAzmX/UeXVpgbWuB1fO
 riVr0x5EMvB9SDU213lOT5YuaiqRBCwSIJ9TI3SiO/dgaAHTZrdVJG+szEVC9o5m8MIcTCG
 C36j3i/YQby7LcB9evgbA==
UI-OutboundReport: notjunk:1;M01:P0:NvR5Zn8X5RQ=;4b5Dkq1uKHnkFXG8JOfTVF8PDp+ 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 HMqwYW6BWXujkYmn8QoPVMK+x6H2WoZCubhrFB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_025119_188538_105AA80A 
X-CRM114-Status: UNSURE (   7.86  )
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

>> I have taken another look also at the implementation of the function =
=E2=80=9Cmt6358_irq_init=E2=80=9D.
>> https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/mfd/mt6358-ir=
q.c#L227-L293
>>
>> I see that there are two arrays allocated so far.
>> How do you think about the possibility to use a single array with the n=
eeded data instead?
>=20
> It'll be easier if you just submit the patch.

I would appreciate to clarify before if the adjustment of array usage
can influence software run time characteristics in desirable directions he=
re.
https://elixir.bootlin.com/linux/v6.18-rc6/source/include/linux/mfd/mt6358=
/core.h#L19-L26

Regards,
Markus

