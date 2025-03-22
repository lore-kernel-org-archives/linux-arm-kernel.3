Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E98C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Mar 2025 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YkMRAD9WlCYn1xOedFDEZ4kBwzZAibmza3SX4Cxq/dQ=; b=ts9HtszOJuxpC2NelKVKnAicOC
	DbiSUxbSHAtBjWZG31SBZB2EnEOmk9A/g8yBFzVWDz/IRvHuY079u1nS/m5sffWafFzioTsD+ioqS
	ovJCObMER4hfwYDgY+4xOED3c4cJXRUza3gRcdi8D6WEas8ZWOFYSQolmP8CA2Bk7BmorFEsr9evk
	ddaoUHNu9IxWNdoPqZklnZrU0EpO4svh64V06DF1fPBZc2dfGknd+Nek5+w16W27PCvEX7NK1w9ry
	WzpV5ez2JsKvc5DC09409NDjHuf7nIOSnUVZoLScWxTknl7WpNRUsmIkL/N8+JmjXj8kb6ckftUmI
	veNsHJRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwLq-0000000HI3F-1yWm;
	Sat, 22 Mar 2025 10:45:14 +0000
Received: from mout.web.de ([212.227.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvwKA-0000000HHvX-19C9;
	Sat, 22 Mar 2025 10:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742640191; x=1743244991; i=markus.elfring@web.de;
	bh=YkMRAD9WlCYn1xOedFDEZ4kBwzZAibmza3SX4Cxq/dQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=pe6nHEN443O7V290nCMNqYFbUgzsFFTjoyl3Wvqbwnzf4w+p6zpK7BS8UhSmffsL
	 ytu6vkmtKI46ys4CuejZ8O3NfzlnfpkzXq21WjmgnkvTppBZFi/Da182mZOKCP+yD
	 SJo5LedQ2w0i/cE3gqelDZd2z3Fv4qx34jI2pszdZFuXj5/2OgslotItEXzN+DUwm
	 zlTv2mq6Uk12nFst4Sj9/YVT5g2RPJomoDfzDsKlmziZQVJ5zTK6ivkp34kD5k9hz
	 TZg72zAZyTG2ECGn5aova03xZ/QOahFG2QVTpvoAg9YZltklVN7J0361U5pXU2ESx
	 nMC71wFJIWlof2J5eA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.73]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqqTb-1tRIWF3nrl-00cVNO; Sat, 22
 Mar 2025 11:43:10 +0100
Message-ID: <68543b3c-2004-43e8-999c-a6579b6aeb23@web.de>
Date: Sat, 22 Mar 2025 11:43:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: mt76: mt7996: prevent uninit return in
 mt7996_mac_sta_add_links
To: Johannes Berg <johannes@sipsolutions.net>, Qasim Ijaz
 <qasdev00@gmail.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bo Jiao <bo.jiao@mediatek.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Chiu <chui-hao.chiu@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
References: <20250320201914.48159-1-qasdev00@gmail.com>
 <061ebbe3-557b-46d7-acb8-308ae87105dd@web.de>
 <631977c57b2236edfefb8db7a28885ff6888c823.camel@sipsolutions.net>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <631977c57b2236edfefb8db7a28885ff6888c823.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:UOKGF5y3H0aWty2Ge0EpsSI/+m+zx9k401Kz+ZPa+Cty5ktLW31
 aihaZWCSZQ8UUJgs2fdMpbXv4M4sIsk5Bxl7nEJPGy2WBVUKBFYy8wi7tWGf1oEjpgsZixk
 /zt7z4uFGe47bHkQS5dpSgKfXmZtmxhcfnfQudPNSGBUUn7ZG5GyaLLRocR95xZtOmtgqLQ
 zBz2rpg5XWYDmenTzovSw==
UI-OutboundReport: notjunk:1;M01:P0:Ds9ibI0GWBM=;KJP8Mkrg79VhvVfIdkUcJpe2zWw
 P4FSt08PPWUj2iQAHDT2ruL4CnVguLWR/EwQmh5ySL8KLQV8wvvPPVc3Pg5XjgT6UfndggAIt
 crBf/FF+ra359BEX3+RFfoAmwLY1bsSWK8LtYzcC4Xo8nSJmfoT8YGG0va8RVeCZXPTfZ1JyE
 fo77rKDX/dwZquTpr5HkJvexItJty5X70gKOOej1U+/DHlFGWoScPyE+TC4xld/8+MsnmX/+C
 fS9MYGnhSt3p2xDG0Q3IavWIFDjOvFVv8IMug8R1gjEzHoovQXGk9iiukvMi4NhPN3zPbE+Rp
 jjSZCA5ECkkD8ZCHKS+0BgfdrrAjCvewf0Ewxw5S074ft/P6hQJweWl+z14Jl1ZpECe95hHNh
 RuU1q67X5ijvKU22JtCBh7Zpu8sbOmqCQiCGJlAk9lkYdjEZKFwUcaTmJJ0C2XvScqn1h6OAA
 czaWdhbakIwsDa90vnrdYhoS5di/DlGlDmb+DLfFn+toh9+XRuiF/ku5Y1HOSudYPso7Mn5Vo
 RHKLkqF5B3cV5IGJZvP/dQdeabUJilc10MCeVWUwIxG92W7Ldbf8YF7QleC1sySfx0Gt/P+BF
 46vrloA2HHBuW/3tv0uYPFHEawnA59KCxdzO3Uhg9nlciIzKRmeC1+a0M6I/8zBvCMKuS7oh2
 U0+f9TuhXbB6EWYZ4dqtoDFiu26hxSHHR2kyYd80zi744upWndXlH6OqBthdIwIZCSXaHD6dF
 XsHbKPrlOrFtNCwRIx7QJuaWp8gF/j/D3gpS5HvdbFQuE6hspgsN8b61VVNgtL7oordRAnBnG
 y0WzoBoywS1+WF67aj9zp30yldJg9IGz1AmE+LS1/4n/xQpIHHcjdsWFrPWsEETZlnJ11j9xX
 v8G2Ix86kmrXvondv5Y9wXIyAj9PfYWcsi8Wys/fM4K69DcKqrEvYaEOdeA857urm7Pzf6V8B
 J1OOe4YBOuAeRU0qVeNOVK/bWGj1I/iWqCO3L1O3ITV4wCU25pnC04nHFmFlHPAqqecKpdDij
 yxhzYnGs548fLEEN6yf94h2DwlgcOIgFZWpEo0V+Ul3U0GCztOCIZIAyVRecOTT72DB5BKpxc
 N0FJtx2mwxxI83c4hPAYNJ2PWCRmcEB0Pgi/HJ/BPlF8oH++LwF+JnF4SsnM8M3fHhWS9neF2
 RGz1jn5avDfjjineWyQKkpHiU8eE9QHFe+EfiQsM0uRH7g9CyN89bsp+U3M7l42H1VH0MwDDO
 YeS+2yh+Fx/GxiU8meTZYKpNXVTkjJMO5VJVuUYzrlw8MMIB8EXAJrSdVcYkJ4g9QD/CjtRlB
 FONI1G0+X+O/lwgsREGWmEesogl5yX1XtrB0I6MKB4J38f62JTBpoqX3pRd+BU20oBd1jmuzq
 Ysv+X7Na/mNoWxfoBBrLJLZZ9n849354WbPMd/JpqdAf/O3Xa1hdYwGlHrq0itSbb6P0a79hX
 QuI+5Trhw9lfwEUS6aej6VmRaj53xRJfUD9pXjzpQQ0fj2DCt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_034330_628188_356F681D 
X-CRM114-Status: UNSURE (   5.71  )
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

>> I suggest to avoid such repeated error code assignments.
>> Can an additional label be applied instead for this purpose?
>
> Please stop your "suggestions" on this list. None have really been
> helpful.
It seems that you care less then for the avoidance of duplicate source cod=
e
also for affected error/exception handling.

Regards,
Markus

