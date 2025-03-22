Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C9FC36005
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 14:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KR1XGA5UlrZYB/EE75mcNea8LxdNsuvuyP1JLzY93YI=; b=DymcdfNprE7IG28L4mw8nq4qgJ
	qdaJOMq+7RC17/hO76ihpNlYZFOwmm7pSYhLd5hu6Us2JNqA7AwtHZRYxOH4xJq7TPfYDj6M4PpU3
	LCFmk/BLuoT7fsRWMs6VNMgzUQdAYZYiV3RzZ8g+eIwrXXbxT/EMscijylNrRGB7XplNvcZrLweeV
	d7CPKxavvv0ShipsnXzMcrNiGYaF2w6R5my9ZcYvz/IVb+axcWIXWeiEIlNCZxnpwfGX6I1dDSVmL
	gZ/eTG6bMGnYbgaWu1/QHYlrCU0/K9gEgNmmrtmoYD8VST6X8+VWnIxg6dTLq0AYZcRhQkNjlT8Jp
	m+HL3Eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw0I8-0000000HZ61-0s04;
	Sat, 22 Mar 2025 14:57:40 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw0GQ-0000000HYlC-28Ru;
	Sat, 22 Mar 2025 14:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742655351; x=1743260151; i=markus.elfring@web.de;
	bh=KR1XGA5UlrZYB/EE75mcNea8LxdNsuvuyP1JLzY93YI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=V/yAGRGDhlKct8VpACB6OwOKrXpExfRBs1IQg81eh5OKGLSyvTZzGq/Tjmjmm/xc
	 aSWwUUFw+g+lJxV2SOEaCKL/ee5egi5HRmGkkzfxH8t5MLuO1qhXY7mtzcwvZczs3
	 kiC1+n3qvhdXykumd1NPIx+7esq4idCz85Dw0PNBXrUuFBHlYIuuqBcRX1Wj2gvrn
	 aQQ/AiW+hJeyXmXcwHqMZfTZD28SNGVUGL1etrS39k26TxnUkvqJ/MiFL+GDZ5+Mf
	 Dp/YG+j/wWpSL/q11JgR4ayuNm40iIm7niFBepqv2k1WVnQABRuHTGvoXAN2pNUZJ
	 /O4bK9eRevpv9iwZJw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.73]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M59nK-1tutnf1ug0-001Qbn; Sat, 22
 Mar 2025 15:55:51 +0100
Message-ID: <d1df5d97-4691-40d4-a6cc-416505f35164@web.de>
Date: Sat, 22 Mar 2025 15:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Qasim Ijaz <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes@sipsolutions.net>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250322141910.4461-1-qasdev00@gmail.com>
Subject: Re: [PATCH] wifi: mt76: mt7996: avoid potential null deref in
 mt7996_get_et_stats()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250322141910.4461-1-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zGgYsMVFMC7gMzLMJMEaOqOzG4KCvD6WdUj5Wr+OkPGAGJatYKZ
 MSyQ3MBAtAciAngF+P2u2paZGglBI3KYJ+Ca7K0VGJCaenqIS9f7Pq7uklBPKxLD1faeh/7
 3RB8qof/kEEvhVQQ/qetSRlrb1Chy9ljJPPLTtnXRoY5ywmKwgwqgVRKN7zyYDPXGy/lZTy
 LI1yB6/ZhSRvt/TSPSPrA==
UI-OutboundReport: notjunk:1;M01:P0:6WNxdDY6Ngo=;rgvjXtJMAoHIrEJ2fRmFicKctqo
 nr6njC9l6NX9BsJ/sLJZrR5aB+TGnQsy33Dpy+HDmswmS9/DQ7h/3I7sZTx8LWwQgUBuj53pO
 VzEQeUBFjZREWcp0fJF3QaXVpVHTc4zJ1jNBWN3M4gk1Dav9VekVaBg7GH3gfEIogNUCVdFXm
 jOnhm7OGz7YEAHUSK01/OyQNQoZP/wkXJbWp7KMD98Wuxj1TcP66IiUYBYHUcXGzOBUhTfWpB
 AvN+AKBtg5t6piGCQyJ9M2EZTDo+HAGdi1qOlOUuHLY89NZTOwhSJTWYT1JWqRr7v7QkjZMSs
 dWV3IKlO1yFyIHakpjfySgmxuA6dzICdLpearWp9PcmWYiVdbEN5dfSMVtLzW6Zyr4x6Ls9NV
 B7+ZT3/ehv942+YzTfN0mEIdYeTcEjZhVpAqmkDJ2Kj2NNyf92TgxU+x6VONSP+Uk/sIp/g0v
 NKkCBz/DO4wQjCoSdxt6/jjCD9GCrIsBzcg7KRlcVpS2GHIo21exhqw1cDKyNQatzSe7iZa6y
 CakUlSj0RwPGglZi289WqjrYFMm7bvP7kZ+3cnU7W4TG0cs3TSIIkjzEBpIPKmfq+nCamOOy5
 kCHBi3+NqXEsPpCAnVMSS7qmgKBJtA7CcRUuhvZmhoEYDzCJgL1xSMlcwoHafdb0wJHKLOm0+
 BJ4pydgUfAPzf50FttZozx7KccXgyXpk+1Dv7Fos0hAb861itqtRputaLB0ZdH1hTscJeS49Y
 5rpL50plO0m1GE8VCu7A6zWH/pPD+slwfU+GP5Vc/hS8j7KB8k8+/s+Iu9RUhygrGEkF4tPje
 oqbtKuk0u3SELsGRzE2w1gxDk9rta3v7gt0iski9TC+ErkGM6yDxl6sKrQ1hHbFGShuxRBOWb
 IO8RlyR6Hoyq7LKLvpQrA8SMtlnryUTabxZwM1LoiVCgciWFfc7mbGwnBXR1fFi27ikAaQfl4
 W8y0p8pekQT4j+Rn93WAl+hDLn4c0TiRBsKwaITXW9yuScr0TX8uDy6PaebH401hwVykxM9Qw
 kbSy50jOBFWLfViZ6/r0o+1ENqKIsBfO/kV3OOLlKuOaTpXnCKfBFWn0/MxaCUYqutxZQU+rG
 c4uExsZKQB2am4TdfOKrowgLP01ergXdIR46T7y7w0JZhwdLHb+b2Rux8LB7f1UppfIWVX76g
 duCUcnJUOV1LsPw3xRYkjbCMdIHVsQszN3wZUSQDSA9NrdpcAyXid+gzgPL/L5ABNSL7B37DL
 rQZ862j/QbZPkHs61XwT/RkeTlwT7ETjmqkHazRYrzYMfrF/jPdEaAGLuZWB0BTD6UzNNH4Zb
 ySHc35e3RhtlDbs7B9pG4AV1olV6yDCJDGCXz615i7YV2a+Zr/wnghstWGMbQ4q2QOf8XgJku
 M4ofFROuDhs/3FhtF6gRsdsv9LkIY/pVFa6W2qxKxbkUQ7DaPYjWsjTV0kZUn4FzdY2YvQXfT
 ETgyk8K8863+6+jtF5E433JlDT0di3gWbk0AwWcsHE7S4PN0l
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_075554_923216_E6A9D23B 
X-CRM114-Status: UNSURE (   6.39  )
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

> Ensure phy->mib is only accessed after the null sanity check for phy
> otherwise the code may trigger a potential null deref.

* Would you like to use the term =E2=80=9Cnull pointer dereference=E2=80=
=9D consistently?

* Were any known source code analysis tools involved also for
  this software improvement?


=E2=80=A6
> +++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
=E2=80=A6
> @@ -1886,6 +1886,8 @@ void mt7996_get_et_stats(struct ieee80211_hw *hw,
>  	if (!phy)
>  		return;
>
> +	mib =3D &phy->mib;
> +
>  	mutex_lock(&dev->mt76.mutex);
>
>  	mt7996_mac_update_stats(phy);

I suggest to move such an assignment statement directly before the place
where this variable is used finally.

Regards,
Markus

