Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED2CC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 11:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rIm1c9NF10GeWVSkFfVIVpsAHzV9Llg7tHlH6co2Zek=; b=oyIfy3uBDUuUU5CR+NAmMdFNYX
	+VavrhjobIKaFfJRdMWsNQahNuLxwNRHMq734HwOTV2/akivGjQj81CX4x387aFRQNpeP9Kz1w0Ok
	74tNGihaMl0TbvxnLH5lPyyFpWzbUwGqOLyiESbJQ2dFYR80hJc5S61VvveQFzOpOmDWLu29R5I2+
	qXfTp1XuPRxAFfTKdD7DiAnqdhxT01+pB4NO1WxyHdhy9KwV+atY/FT9b+W6+W5GUqrXILQSfJiif
	3kVhkjbQBWqaNWYNAX3Y0gs6jF4Kjb/Nm8TzCDcGzfQqUyO1x7QNs2mOd4lJYSPq8VUxn6ME16fxt
	slVp8OXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrFz-0000000GA6g-01yx;
	Sun, 30 Mar 2025 11:55:15 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrEE-0000000G9wK-35ud
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 11:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743335595; x=1743940395; i=markus.elfring@web.de;
	bh=rIm1c9NF10GeWVSkFfVIVpsAHzV9Llg7tHlH6co2Zek=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IiyoRS7/t6nvp9KDitTU8YPBgcS2KHTDjgRWIKpZ6zFDfOZAmDC7GZlCKE/ljZJs
	 4n0M1AC2dz31HNFuoCkl0w5ERf8co9tL87sADX3pk74DRptch9sHHAmdLae6VxdcH
	 HrOPQcMV3iOJO5VBzzYwWOppDc8+XBX0bHngCZ46kQtoBtdKmR3jUEVn5zptZdiLK
	 NMXZ1a63QrWzk1EBc5M8qCCCcZONorPuLDWPfBEvKtUFrdc9qca0qbfQgaB84o0jU
	 S0HfYimkCJRms6R2Os/UeR0AGEf3JOWROV6JUDqqbpCZ2ZRLOqRO/+AtmhnsOZGm7
	 JB8gJav0vN1uWA4c1Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.13]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSBQ-1teX5J03tO-00Lw7q; Sun, 30
 Mar 2025 13:53:15 +0200
Message-ID: <c9185d57-0c01-4f8b-80a9-dbdf5062586a@web.de>
Date: Sun, 30 Mar 2025 13:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Abdun Nihaal <abdun.nihaal@gmail.com>, linux-wireless@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Johannes Berg <johannes@sipsolutions.net>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Khoroshilov <khoroshilov@ispras.ru>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
 Erick Archer <erick.archer@outlook.com>,
 "John W. Linville" <linville@tuxdriver.com>, Kalle Valo <kvalo@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <20250330093320.22293-1-abdun.nihaal@gmail.com>
Subject: Re: [PATCH] Fix use after free access in at76_disconnect
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250330093320.22293-1-abdun.nihaal@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rwOVgU3D4C7MNdwpCTnZQF6oa1WOs5sfVQvAiOWuLvll5THd0Tl
 CZNcCjzK6mMP4LdB0k6cmYu9nfDWSL1ZQwJ1TcHJ7UFTycNhB8CDLk+5ItEEe0BZJhGElL8
 JKP/WtPGEOjsv8X1/RDXth7L0n4HawHrsyEJqKoVciuHXTricG8rax9aq+cbbSCGH/ZqtYL
 ErJc9FcBuXx58XLkryDgA==
UI-OutboundReport: notjunk:1;M01:P0:ljiPSMIkKl8=;/Nbour1tvGmoG9VVBjzVX5xf6ym
 9m5KipU6c5dSSREqaZ4veuOue4ozkKeYz3IeNyaezFW+7riZOKhiwWRRiHFSzhz0jdQVA8zz9
 b532tsgSZ/g8VDE4nkHkr2vf1jcqZblOKn6E/t49wXQYPdweRmhn52ZiKEk6I8Pnrep9YXPN1
 +yQuk1TVtZZEN3T+zXWx0cvYgwXTXt5cnGeAC/JLthT5Ri+RYqMz6LMjCLjkt3BjBmdxlS76i
 yON3lS0lGiRMWxK18PyWFt6a24Q+0A4HmZ3Gsmx8BcXbq7BD83tFjbUyuZvyrrrpZx2zkOfgm
 0njUBcT+XOY1OidTnp7H69KYjvteu3irro5nw6EMlPjBgTNcGLf7MZxUb1dGVQnqDgP/A6FjP
 PD9aUFXZeN2gIcPV9DTpljZTpgCQougPP0ltnw1p6bYrKhM6UT3Syot4Jm3jYIpgHkBthGCkr
 Op7Ed7VS8GybC6Orodte8pq/9f+hDx+sbz/1MAFtk3qsqsbeQPiyUn+E+TuJmEGxiFso5+x+q
 vAXtDSmu1eEx19CJpSaziuSA8saqVUSPnf9r+NrBHQbQ5rVJKLUdcnB6Ooj1IYza+hyIZqF21
 1EJ8Lmxqq49Otjmp4Y/9VBT2bg2KsosaD00nktNLf4pAovw0X5Bu97Cpv2u1B+U3Sdf7sYQHh
 K/RpAwWlS16pEUjhNKkyagWBjCCV6ld93ywosjO3KIpp+rh+8iTFH2a4Td8YUbEAQ8B6SyPM5
 91RMUjYhcIaVHzRmJtB5cofounC6P4P/Qq5g/Av3jR9K0UAL4py1eCCd0K6zADwme+gVYr6Hd
 spWtSEHkDkWnAt+KuO4KbSUo9yfOkwuA7sO85VTmi5nJB32m+kI1WlJHgoNDayuxLa2gvFVd2
 Kze6YupR1Rx9gr/pOvo5paUY2RbpfD/IFeEtaX4DIDZ/ymbQuz1qP2KvlHC/60ayMOTLNe2rO
 TPsbvV3joiw+UPT54SLwhQ5ZP06roVfHEXRSxZISXa68rD770fkUGJosqwOL1/nTKX67nketa
 QKfqNYhYcUQ0AZI9uuJz6d3btGIRRM9kVQg5q4SNfVZUPku28BE1cDIrH45FIqRBPETEsqra2
 iIO711VyPMTa1LcMKaUE4nu0Lq/EmiXCMBEimUTkL4HIFizfnYfAetk1koXNpe5ip6cPdhFS4
 xHyYdFU+skkDCGq+oZDDnj3XRoGXDEl2y5XMwpKY/o2g6kNON/+c5Kh7L7oX94noiYDXL3AGQ
 m7p0WbPZAAm3KdTwAVVqHFUlbCmvJu+auV251Z4HEGBC4enwMTAxCRv0gPvi4aQ96E0AzGATO
 RcPYt1+Jg5cQ7Z0VG1mO5rLtWLhh4n9egooHY+tZmx2/Y8gh5bRDMlF66NbG/9MFXtVPyPpsL
 JMfUjduqNnd71Nai2y07UU26aKuL6urJJN334FuVzerHQfv1RgxyZmPbGG3N+ofN/lwrMI7d1
 0aauhp1FfOw3EmqpFUkCSLvLxmAtlnXN0u1iVQPCS7F13qNAY45QJIqPMjorbJt4Yev6kVQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_045327_078060_7914D8E7 
X-CRM114-Status: UNSURE (   8.12  )
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

> The memory pointed to by priv is freed at the end of at76_delete_device
> function (using ieee80211_free_hw). But the code then accesses the udev
> field of the freed object to put the USB device. This may also lead to a
> memory leak of the usb device. Fix this by using udev from interface.

* A corresponding subsystem specification can usually be helpful here.
  https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/drivers/net/wireless/atmel/at76c50x-usb.c?h=next-20250328

* Would you like to append parentheses to any function names?


Regards,
Markus

