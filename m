Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC16C021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 11:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BypS39ZRkbVYHg9KLMo4KejA7snt9N8vXE+PW59GqWg=; b=V2SCYqcdTQ7CZxzYiR2sfRv2zw
	MuyOcnl3knoWYQ6bCG/sXfO8QRUCaVdEuhJM39gKnQu5ebQYOzPb0TL7U1aTI04synIXP1tfn+1jh
	rIfu0kA5ZMZVS2QStgTtXDjswWdhIiorIfSvzGloorYS+3yySidkSTucYhVlgyn6gEAg8AHZwZqNu
	3FeHQozi4wFMRbeFQ8i7xDHOInCXr44mg2tOz58Ez/nSxZBT9DhiJanfZHbwCYPUm+xx6v+E+BS3I
	8rM7iQD04f+FPNfRPozks22MU2PIMBJ6dq+KR11iA/b8scXWKu3lGYLPTQRFDr/j6MOyM+fOsicTd
	S4DMtUXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmsjR-0000000Gwzd-228Z;
	Tue, 25 Feb 2025 11:04:09 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tms9P-0000000Gp2i-1Jeg;
	Tue, 25 Feb 2025 10:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1740479202; x=1741084002; i=markus.elfring@web.de;
	bh=BypS39ZRkbVYHg9KLMo4KejA7snt9N8vXE+PW59GqWg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XY3OmHW4dF/XvVkKqCgeb2gYtnYoryKMu8/sKfnb1hD5CTdSpHVRI99aDxN+J3cM
	 ICtj+nooEXckiNAp4Ug/guhTOAetM8eBJbqaPDqEx+KL31HG67HuKX90GKd0Y37tP
	 ER6gqPRoCsa64QNUl9kv+wsJ9d6gzQnwWxE1EGI62/Yj+mnmX95B/asz29UmC3U1a
	 svAZv3uh65DUdXe8CJt4r8ycCiePKGDU8YQjB+eQej7lyfhxfoCmgN6wH4BBNKQrd
	 ZlckvpLs3YYpNuTdNU13rH7n51aoxqT7WYFOCP8a6R4aN4kaz9r8fyMm9hHKI6X7t
	 6x4yflswhs4bXgF37w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.36]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mav2X-1tBbOD1EDr-00j0g2; Tue, 25
 Feb 2025 11:26:42 +0100
Message-ID: <0b18b6c3-1275-4560-a67d-a15382867954@web.de>
Date: Tue, 25 Feb 2025 11:26:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Fabien Parent
 <fparent@baylibre.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>
References: <20250212100012.33001-7-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 6/8] soc: mediatek: mt8365-mmsys: Fix routing table masks
 and values
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250212100012.33001-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EzHIUmeGE235QvGYzbi8u2fipYppf2iascydP1d2ZMQGWjfBdEw
 r/31IQKNePVtvPRbHYzY0DmyveIby3lLsyhlqWdT87gfBTxPTYX5IDvTjqTjLrraKKl2tSp
 xccWxhMo9iNLO0njR+spW/XBP0ibPx4vhnOxWbAU8pbE+ImLLQc+NBJdkip4SSrusL5OJsg
 j0BoGGwoSt+CW0RjUVUsg==
UI-OutboundReport: notjunk:1;M01:P0:IzFamMO3EyQ=;fxzPkjtXifCI9ZLB6gx+AssHT9X
 yCQqovvJxnJx/kcl/8xnDQVN7YinmABdSvQTx9jvKCyugxduK2xwKbkCKSfjkFCZPi7W7/H48
 Wjw/48Bm6KUUdN+cUZ8wh+hKGaQRZkheYxjJdoqQQAwf9p5QxGKEu/vlzo8P316EqQyzn6MFZ
 nliBZ9czsXg8/vOOkuoKCHqAecgmcQ70KT3IJcWzgXizjeXUMNU1+8FN/vmKBhNIgw0seXTIN
 o60lGfpCU1iqUqntSitw9pDmut92ebiHCVglsK9LHtOFRFE206Q1Kdd3W/S3e13lazowOFC+N
 b6+X3nX0BaVp7PCcTtY7Zz4aHbmHE3PgWIQuOsp2Us2wUClwSa2Q1XQ0D9w618EKUb5wuE2tY
 pQJ/yF3JnLCvFAs8tvCAjsubU+H22ZbWE67I19qlrvn2XpUwAyUPZepu2k3IMeOnnJJahaVnq
 lvUHS5Kg3TyNYSSXds+yMwjgkvoVL7F/8TTXYrqY7v2IHf7fSOpJTEFr6jvZoHFR8vDjM01L8
 TT2bwfoC94qoYKE7hptP5T53YqkPRm2w+NMKDPp0EX8dHdg+MvwJGL8Wl2DL7dotXENV/22vM
 1rYymPwxFl2b7g6BGxTAv6bTGpe4QZxJkh/V2V00E8QlNN7DBTb/2p9wkwtu3ffz3qA1X2MYT
 FDxxw/jvJFaKrapzD/zBTS9TtOuUPnt5wQVeutRCL8kiyhN8F50X6nepyJ1ZJa2pfHs7t6KlI
 TGgFICeo9pqJPmA7MpINsejj75dM09210Pks/WkS1f7dzBXotb/l0q1RI8m6PRRs56r8msvQw
 m4k3qPmBvSsUx9ZGQG50Ohvnagom8NBUHXmYfIDXLiMB5bCSEQt0W8DrQnTC5dWwVRT6PE9sf
 ZozUbkQpHd4T5U8IFCGAxYE8fJdTNYdAn+UpfnYyhNlKv/j2H/rPKynkRCjwklX/mUOO/xXql
 sNeVAR+jnJw2XW4XqTz24MM+xD5A2dJWMf3ui59Hqwy4XImbaFuXQ8TFXbSeDdx9VF3mULHAJ
 K2YTp/bccu/KSjaE+mveR2FpICPWhSHOvdWQAziuirUYcEqR3Bx0CjeWPAfbUNz2/0CKmqH+z
 9FgBL0FluozC5B/JhurkIa5oyZvYRBKF5lmT84xPzTcxbcWqKbCQ7dNql7bBmSh6yxXh8EAtb
 yqlfT1b04Cc/zHEeeWaG7XN9M0VwU5cIz5vdfsBpzRqEwcgDokpThcNRj3Iz2afJ6YIhM/yuM
 hSbkb18PHYvzSYLpZqZgs5p4xhr17gDaMWHuj6P9VMClPUBe0C4rD7i3WGiXQa8X5xMtBJNrr
 7OIFc/nWt6F+1TzDO7jnV3bSlsxmu+bQZCBqqDW0gXO2UW6y4KusWrq3DpN5hvjJy7A2+yd6E
 19/OQUiewozC6iM5+9qmeVm/011Rav2yB4YTXeAO3WJ1t2RDFvZ+vK5uSeRtily+sTUisBLtC
 Kx/2zIH5IVkgwozkYMo5w338kk8g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_022655_647292_F4B11CF2 
X-CRM114-Status: UNSURE (   5.88  )
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
> While at it, also change MOUT val definitions to BIT(x), as
> the MOUT registers are effectively checking for each bit to
> enable output to the corresponding HW.
=E2=80=A6

* You may occasionally put more than 59 characters into text lines
  of such a change description.

* Is there a need to offer changes in separate update steps?
  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv6.14-rc4#n81


Regards,
Markus

