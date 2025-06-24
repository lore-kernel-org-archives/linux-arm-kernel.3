Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871D5C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 13:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qRMSLkuE2eUd/JTqEQFPTKEE5Lezk/EsRWxuxZY3QmM=; b=AAGWEgoEvD9DB6OdHtdC4o7xc5
	Ayp/OIPk4SPibJoLwEuZ2KVILV2PUvFMKylnoLCcJ+28uMt8HxGrpPINW1qmlaENUUTB6O1CpdYm3
	s1bRE1tRVTF/BuiKzvg/fuWGabjAZIIfCANxq/jXhzXru3/0TWd5cLpHhc7ngRK3m02r1VTFDP+g2
	17ywPZU4JJsl4xfSBmU2D9er+/QVQQBhyZhhk7MogeacxOZMz7WCrHqWZ3irfV97+7JUQhzzvIhX7
	iMaNpxcB9EQ2v+pVhloQBwoBZm7Y9KqNI5xBs7vVLgvkjnFqFj0yWHlrVPpMwGvff6RJo3jwfYHVy
	g/gYDVhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3qd-00000005jhh-0l6U;
	Tue, 24 Jun 2025 13:38:03 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3b6-00000005hJL-14D3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 13:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1750771301; x=1751376101; i=markus.elfring@web.de;
	bh=qRMSLkuE2eUd/JTqEQFPTKEE5Lezk/EsRWxuxZY3QmM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ARkii1EcnA+16PPab+S5fmRyuyL0yXZqcVPE8NFv16pEzB0pIZ4vFZSxMlCj0R19
	 O1Y1XK7VoU9KVskQ857IXUF5AsxDU46Tnbpay7d9cg8g7T7ChMdqPhr4yJBRELUxs
	 NRPEpyZ9ih9s/cuCIw4I+OR0pUgKkAMYpYaPxi4DN4c64AWYMBPaDi6MSBqOYGei9
	 C29UYDiogpra13M0Rl/nZ/ticzAQ8PAHgP/o6pmTtxhjsh8gUm4XEQ8hRWZ4ZlPyR
	 MF5IUECNomUSnAJtyO52+FJB244YgxSgj+2ss/JxTRoXUDPQ4KZQU4NhM5O2Y8FZB
	 yv2b/iNPP7c6GOcmNA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.200]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MHmqC-1uYz0F0u5W-008WsL; Tue, 24
 Jun 2025 15:21:41 +0200
Message-ID: <f4981e10-a56a-4197-827f-13d43d0c03c8@web.de>
Date: Tue, 24 Jun 2025 15:21:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Birsan <cristian.birsan@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Chen Ni <nichen@iscas.ac.cn>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] usb: gadget: udc: atmel: Use usb_endpoint_num() rather than
 duplicating its implementation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Ygupd27R5j3lu4oMHRpR/dvmACwj91rlGfFyCBHJjvWRbsYWUSV
 BFuVL87O+rHe/BiC/ePHZiyilBbT40jBoWArsd7IB1RLFYbPJ8jElsbXNiUBxBQk2rLgtg2
 LTz46kDimXOf28N+Y3m0T0+C9gG29P5McbGkqRR5zqPeT9BDiDH2J1aqEaw1NtgQDFbMk9k
 wA4kk79BIlPV2scwzJ1Gg==
UI-OutboundReport: notjunk:1;M01:P0:vfBSgLlAv6c=;PkQqSc29Ls7pBjMJBSDoed/R/ly
 D5Mb7dfM7nDrFCWnreix4q2sct83Ie0hgjoiVGjh7WLsb2EVfXHWuc5WUn4hnlBwKoh9GEOsU
 UYEdBpc8zCdOFdMXHHY4+18AkUhEJLo6VAMMZrx5u/L8w9IOP2qMrJSVSlnnQsGfa4NDFNHK9
 Yi/ZbsqkNcZp0jtlQyLyazgrWmEwa8TD2RVWiozfBmgKC6qG0KMDOLLgogoJni735Gnte9ARH
 kMmtEr8LBS9tvlIkxTUA7Bk39r8TLXoRx5D6QVu0E4n7FkXls05ylhSrSh4BGDkePYr0OanSh
 +cuHld06B1cuf3GUKVXEDVGauAl2azUQe9XSsS7H9lgLzGDnul3v0PQvOSfoZ944H1NI9ijRC
 emhl6hexgnCYQEkW+7Xqa9jzrYrLdvE88sFPiy4h/bCdC81tgA7Ydd8FOqQaA6uwrczCPPXQo
 muR5iGpYopHf3iCrOcLo9y7DYiU0WeSIMUH/ZskUalsJvinncTQFpQqh/URbhuHplySC/ZI17
 IQya+aAOxEmFiPu139Qfs8Ikzz2eQq7Z9Bg7GvTYsbFymTXR2CI2RJ2vptaKnjEK8m3zzFIjK
 DUgTjwpgtcpmzBOmCRJCM9EFtCc0ImT5++ya8bvzLGhw3BlhV/pcCMOx7JWBkifzQIA7cgxSK
 TwO01+DyPye8mdI1PF3W0FWP60JmzHzE7ew5bDP4HaglDJHnW9YeHsgZ0Zh3zexuhS/Ozs/nN
 No7tQsPcr4u3I9IVLj9h+eM+DWvVtPCfewROoVZ7TM9vwG0ypQfJThVXCSZXJhNL3ajPCJlSv
 u1uTMzUUGEzeG9NEsv73LjezJRBplefQnZSx9Cxt9T6QW03tua6oNalkO7Ks8S3jI5gOs1nO+
 AJyJtppqEHbdBebVzOdBtumwZfwBk+6/rQT+JqsYY1xuVXYwfXXdgcffuXktaJ19zix5+YP8E
 +ds+ScdRkaz48OTlUEouwr3lan/APJQTjxw1osCmhiX7e0IceD/hHTbhgxesbuWav6wXiOnMU
 q8J4rwIhMUQhj/a2avmEByVK6tfo6DqV7l5a38dgnlulqd8vjk2qrZg+KixaCsi8+KojYqyXx
 IHf1ccO5KM5I5uj+URLOgAvSopKi/sKOWQtbAN0Tb/e8lABe4/EgGnKA7SoS3hhYW6Pk4PNA3
 wom8u6o2XgOXMnwztPvvcd1zp5kQf09BIkPu+GVLdNvOROg3VU7aXn4wubEKhTvSr+VgPNLRf
 DNEhsx+iN3Jq/uP3d5JD5pTxUQtnuLc1mp7UazusCuW9Ejqjq4ruoPfO2Mw3/6N1tWVKcFXjr
 dXzzaT2BH/d33n/nxOxEC8ji6W2eAI9SpOZV491ZvpjsfD9XSg0QcnFkMrAwU/eaJotFNShZA
 23qji79MIIeMv2F6S2CH3phMsyuS0DFqEFq8pP7ohR6HH3GEA/p+D+v0RcvcL1en/vhtYk6aI
 SRIxTQxqhcnjCJJSDxVN462Wq3lPODUUsL+e4MWQbNUsUXGtJVj3C9cJfjv+oLuyGIJdFJCf2
 7Yr8ywdHt+lJqldiMY46IoSDy2a1k/uupqpy8FZdyVf7nJiw94OUwiow/jVYCtD4Szt9yIoa3
 TG46KxTJvELNc9qv+ynlXupEo6K5PsoO1fIRHLQCCW4MuVG/ko0APH529fp7lGxnukPy6i+mg
 884+EApV6cNxexm8zPtiDJmBj+XlkSiObX/heKS1U3WmTybIZHUt6ZijLktUWbJ0W9/SCguPa
 uAGMQqtdtrtw0evLeyhaX1C54Nv1rKww5fPDqSRttZPqC4CGoKeoquMzDlH/la0EGWMb1Qm+m
 gvcQVvQz9cy1Jh2maRCLvd+chQJO7Luilt8y1l+0kWrGnsklDaFWOLxuwwgv6Qu0F3rzRR7HH
 4b864nPYBIEzJWCy9PBpjn3AYKrCrH4HQLJ53mW2Mk3CnOfQQVW5jaKSf8vdGxGt7YQvqiRwt
 U181/Xcrtu80ImFeEJz+SMPx9so1+yRjIAm8YxI7JbSiBlNf8Jivfe88IhJ5X+3dDCWJBgdA/
 +OhDb9njXxU0DttBBhN7y6OdLDgZ4oHTTKR/5FtXzwalD9h5d1xT2wg8KCbXezRwcyEurfR4C
 UDfriE6jhRTuHSpC5RFWIDnX/Vy9865pkZ7wBXo0uEYEa5ADlODWOTd3lUGgyyuJitrMy/oX6
 YFvZ2U459i/OD7yDJYHEbUMINkphXJVHS2Isye7zL+8f3eT0J45lTCfr7S4skIa3mcbL/re9M
 FaDWOyhzSZDTuMfUpqsaHPVwFmXp14vE0r5xBJbNASrupXqZa+MakyC1pFunV3kT0yUCeKUzv
 DsQ55mZT0XORLa5e/A6qaJ5ep8r0paCMKHwj8jPdYPzvOcN2Daa+ze8+c/ZRyuBMD98d+TSeT
 WUL51pGPg9OtyXwPfIA8eFiIBge9htSsVKPfQxdVXGQYLFkI2JZjicfbJiyY7Dtg73cZHjfHH
 WgQisLh92ZOMH336dgDoiN0Ii3GsuovXKjluCrgsoinWiKXSSxwNV5T9K16MHSzFoT/0fqS0c
 tDi5keUSqGPwRp3ESgHpdtUww828N3tfrv/Mo2XRZgGauh5oz5iIzkJbLw3/fFLf0Cjcln8A6
 FxXeu4xwqYwzN2JRuBtPebB6fMBmsiB0SdKJllxeZ/20McGIwgA9LZ0D22dN+Ns9TAEURv3JC
 AgDHF7e8uuCkitofi1LpKrbnulqaB/iv6guCQKIcQREafYm7IcXvsohBVJGzNFT8K8BJmalAH
 D63dqMiu8QI1eOZDDQ2CPlJxM8sGxpw5xlVAbYHBGmkOQOYl9Cki4pMa959b7LOCcMuKjkJYQ
 VCFe0WbDMI+u7FNaeOofqsswTG4eWFggVmhf72VWIy3Gkmq/i0KOztDp2eWhQuorQGNH8ztPm
 +RlnyBcX9gO5gwuvs8uBsecqxceaRYmmTaynCr9m85aqCSE+xlEoA5ssQFAsdFB4oeQvyYOAW
 DZXykhYXK7XY9hwlAEJbbf3sk6/Y4UhkBVVozzkK3XUdrH3n0L7PgK4aPgPW+is19wcb8EV4X
 m8VuwonDzjSYDzUDFpAJR38zMLNlgjgsxAkfyN6sjYDkTQKJs8GleF9w99ZhCq6efluKk6tgH
 aEssWk4l9iErvnKdtT9PMFHmrsRPTVjzt6hBMve+51DtWo/ce1KW7sy7t2KF69vDNh/lyFiMJ
 YBm/TM0w4uh6NmzDyjmGPDJXNIxV2bmFBvfAw5nlp7bwOzi9FXHA14RuLJ3i/ORIp8tesGt9P
 mXb9UAcCMpoSqtQusgrgJx2XA4YCbQYrl6S7HyHsfJRkD5J17eJAvUcIwF3ZuKChljhaQpFAs
 b9DkwDqpDn3wtKbFDA3qwv+sM2qVeuIiNDqrLORW1Zbjj1fyvY9fN1TtKgLZYGPlscnDwtikK
 Ewlq2oAiAVPSPUck4oJg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_062200_668309_6C86B83D 
X-CRM114-Status: UNSURE (   8.14  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 24 Jun 2025 15:08:46 +0200
Subject: [PATCH] usb: gadget: udc: atmel: Use usb_endpoint_num() rather th=
an duplicating its implementation

Reuse existing functionality from usb_endpoint_num() instead of keeping
duplicate source code.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/usb/gadget/udc/atmel_usba_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/atmel_usba_udc.c b/drivers/usb/gadget/=
udc/atmel_usba_udc.c
index 0c6f2ad81d37..35d0909ab812 100644
=2D-- a/drivers/usb/gadget/udc/atmel_usba_udc.c
+++ b/drivers/usb/gadget/udc/atmel_usba_udc.c
@@ -580,7 +580,7 @@ usba_ep_enable(struct usb_ep *_ep, const struct usb_en=
dpoint_descriptor *desc)
=20
 	maxpacket =3D usb_endpoint_maxp(desc);
=20
-	if (((desc->bEndpointAddress & USB_ENDPOINT_NUMBER_MASK) !=3D ep->index)
+	if (usb_endpoint_num(desc) !=3D ep->index
 			|| ep->index =3D=3D 0
 			|| desc->bDescriptorType !=3D USB_DT_ENDPOINT
 			|| maxpacket =3D=3D 0
=2D-=20
2.50.0


