Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BF4FC97EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:In-Reply-To:References:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9wEL7YhtGTlkZIbfzXrBHx4q/WG4oQ21I3JWs74ZMg=; b=aq5U2Cye4ab8mAOeYOSo+D0r9B
	dzMXIUZ8x/pwLTF30RNZ2z3mDlDFrQBiAWK7kT71/waWKHlQMeJmS++8p5zfixDn5VdxVSxCmlfMO
	ZrB7J7g/wHTbGX6P5bGbUJVE+M8wo+nHmzJrJzed36gtJFB8w5pyuia8PtLlE+LC+aT22tHi+A9W1
	Z9nt5ipokfGAgT3vr5Y+fwvJNoHWsy1cPnB1HnpERymBNDy7RAgS4u+zYC1BAVcHozNCPltHsJdRr
	3QRfXTJTKNBzmBgEYI+RMI33tMhyHcx1O+GsCwvUJ5rYNoj3DF46j8yTocQcopmvoo2ltQCIASzyu
	g8pxfWwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6wKD-0000000AIAz-05C4;
	Sun, 29 Mar 2026 20:01:33 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6wK2-0000000AIAC-382V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 20:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nebelreich.de;
	s=s1-ionos; t=1774814469; x=1775419269; i=eitschman@nebelreich.de;
	bh=G9wEL7YhtGTlkZIbfzXrBHx4q/WG4oQ21I3JWs74ZMg=;
	h=X-UI-Sender-Class:From:To:Cc:References:In-Reply-To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=2kPmEplM60DiYbYfogrA9DY6To9JttQrx0lWm4e6jS8IFjv2wzqfLy/uG5Ya7ZJN
	 NClAx4ys7V8lnE/08AwNBl6cfehsah8FeTmfkD4A94sf4JJhc008z1nHwtv2V9tZa
	 ymCl9e5iOKquwtmlp6/I3E+9V94PzPng+MRS+xwxlaAXfS/nUNXwkLor8Erop/POL
	 XgZ/fCf6wnnIF7XX2m6v18+lnK8hNX8QNUlvTX0+jIsvVH6gMc1ReKq66FdnBK2O8
	 0p91/PUzaurstiDn5Fa3V1rQZCWafMpk+XDB44rt9g6nNW3CIcK2lIWHdFTjPkemX
	 NXBQo3nXghF2TORhQQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from client.hidden.invalid by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MV5G4-1vztKd0zA6-00XNt9; Sun, 29
 Mar 2026 22:01:09 +0200
From: "Andreas Haarmann-Thiemann" <eitschman@nebelreich.de>
To: "'Linus Walleij'" <linusw@kernel.org>
Cc: <ulli.kroll@googlemail.com>,
	<netdev@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
References: <006201dcbf63$84593aa0$8d0bafe0$@nebelreich.de> <CAD++jLmVPCL6p3jcdg1y_w=Zij6oVdWTvSmQFjWLn4yRJL4g=w@mail.gmail.com>
In-Reply-To: <CAD++jLmVPCL6p3jcdg1y_w=Zij6oVdWTvSmQFjWLn4yRJL4g=w@mail.gmail.com>
Subject: AW: [BUG] net: ethernet: cortina: gemini: skb leak in gmac_rx() causes kernel lockup under sustained RX load
Date: Sun, 29 Mar 2026 22:01:08 +0200
Message-ID: <000c01dcbfb6$c8fa6b40$5aef41c0$@nebelreich.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLUme4N3xNJ0EwL8UVC5C2k8HMTYAH+30GOs8ZCkwA=
Content-Language: de
X-Provags-ID: V03:K1:9ezzx3KcIaT9BtlchuUc8xv0bbAlDqMAb5FzatEXOkeq3X3bYAX
 MmdUe8KpGFfCjTvxnZbMRkWY7sjTt5Sgg3F2wsOO8S7hg1t8B09CoMcVMD/ieytViedKwkm
 yPUs03mnxrAgqqPPeCOZOB0R5BH5ozWbw/mYTgKtWcUG/Iv5cAFV57eDH7pZ1KdexBh4nOt
 HdzIpLJetkl5m4WliUTPA==
UI-OutboundReport: notjunk:1;M01:P0:/4WUwhPeKpA=;/jUDE8d2G5IwM4zZ7dkWi9y9kT4
 YKVWObAX0owkLL4ksUe2HcvqRPeCcstcNoLsT0V8JuxnUoD7O8Zce705LfYG7rmOmNbr7HJRQ
 OPtGYmOhQChGbBZwsNcljzNEre8nnUELI2ZzCmTTvl6rYY2THlpyrMGJhXtXRT9vossmQpNd2
 /2rTmQYBC/3PHsec13YYHmziccGX2Ukjz/t2hFnwOI3sGdvzApJmmf3iNtstDZOTWWLoWmGBV
 vF9r7Z2+23iw+dT8QKYob+RX06fPSNzoPGyrBfzn8w8rfb5zVr1KabtsL5B1NTLyqnnpkZau8
 jr+z2pbL+hu+pqVJmBLz0BV+ORmq3S7H22Cmyja4NGfVqCP2I5dNnnYUeUvuzN4cEPRD8Jnzy
 v5sF8JXFpW4De2tpA6rLuQGwVfUhg5+1uWAAI1BWtjswbCqoNlpCzeZOpFssrySAmxZ7ilpYa
 FXP++dEEnhckzgBBhU9SJUFTw5Vt2ft1gMKkgRvilE/0Xv6PkKeiw2jvhkqfhXQnUSo+L2bVB
 a5om2t7fA8sJWS03klXDU33alv0uT9RVjUncs9GyZg+pZXWNsHlQ2Y5kUV6TT/skrdHJvqKcR
 PUkzsjyvJTs3M+n+diemq3cHYh9GAJmGt3jb3pIgqOBTlYHZ5mAvGpGwaD1H5gf74NvqIbjwQ
 HlBw77eDRxN6WejYiNVoLnhl6mmeuY8nQG5J1XbXmJMLgQ04IHjC2gLycewAYD69t6LFzjrq0
 YS/3p4/7zgDrB22fU+zsR92HXJUjFFM7FB4BW81FqHfL12uyfdA6n7Al3fIOleQtnAm4ZnylT
 sQMl+MVKl05ny8yN91OqLXpI5MeQHnzEWE4AVWnEeZIy+1btcjPRQ4Rb46hr1sETjXPJ443tc
 bf0X+yd330t9Rz94re44Mx+DnUZtOavUyW4AVqMi8+L3TAT4pFn4tEwbHb5jXqzp1iiFSsHT+
 PZgswT9vj9FIl49hCFr8xzIxWXNHeQWXbPR9UezXc3qha9lBUCe5tkMnJJX+Yb7Jc4R8faOpS
 YfLmk7W1Hn9QkvwetbwXvjP3/kBob7wkS/IkHmsPQr6J6kOnYC/GdYJp1RVNczrRM/lHDAmCZ
 nADD7i5N5dQiA69QMLhmtbX3K4NQJUjidMEkjccXVB0/3t4EsTsZHkIQgyry9ocmS1A6sqZw4
 wCaNzBZRNKiQta064pmmITnu/d+JR9zgIQP/TeGDKh8TH72UPdEh0Q+10fQ8WthsvF1N1MS1U
 tSg3l9J/JegM1+UY3LaPXt17FbU+JoxaWWPK3/kE93zU0CnWfJLCG95XveI7rRi6Sk9WsxIkd
 Z5ISJLWsrG3dk1v7Fhd33THJIUSKuW4Pvu7sXCwmrkNeO2MTsG+FHgfz/eVKQwLyFDaFuRMk7
 mKdrTC0LoFzKcqWD1ONv3+Hcu1RcRfPWiHSdkPegC1nPYE2IUYr7Ua/nZPaHeN1os3A5wnFbZ
 7vI+u8dMv/EQkMWitkBbC0bDinpotBJ8fr6fRjRGWseWMXQvNcNtUd4Ncjy3tzNoXuKVilHAj
 guma4RQoJhVKqCHW+v7HfEEtVmvdHAscurKjsoWa0okOporbxkMKKz+RNXaYoDKXY3+CHiE1A
 xRSWrnnQ+GDZ/A+lrPfBKoVPkE7IsvSm6qtC8enRf45mEPzdmrAEj/ep9eNUXs2iEnPq1wSJr
 aMeDPNV9M5CrWQ8VXc7yT+UdtCDijWU1LF2dQ62mCUeqCdRHQnJ894VwcDIyHDXcvKTOt9pXq
 sX4AxdFwhOIp4qLHaetK7Z4sBJGvijIElIw9vHjcxFxshmNpKN7IKU9xWTSqmqB34pMSS3kvX
 m8trUG1utrLuQQyi3uWElMRyIBZsYVWv/12Np+OKaiV9n1UOhWc+o9H9sljhLlGg3LuiUuY8A
 FefhKe5KCkytoUeZCU69hrjmxoQ1mzV0FcyWTA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_130125_787086_DB1B029A 
X-CRM114-Status: GOOD (  14.95  )
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

Hello Linus,

thank you for the confirmation!

Here is my Signed-off-by:

Signed-off-by: Andreas Haarmann-Thiemann <eitschman@nebelreich.de>

Please feel free to create the patch from the inline code.

Best regards,
Andreas Haarmann-Thiemann

-----Urspr=C3=BCngliche Nachricht-----
Von: Linus Walleij <linusw@kernel.org>=20
Gesendet: Sonntag, 29. M=C3=A4rz 2026 20:54
An: Andreas Haarmann-Thiemann <eitschman@nebelreich.de>
Cc: ulli.kroll@googlemail.com; netdev@vger.kernel.org; =
linux-arm-kernel@lists.infradead.org
Betreff: Re: [BUG] net: ethernet: cortina: gemini: skb leak in gmac_rx() =
causes kernel lockup under sustained RX load

Hi Andreas,

thanks for digging into this, I have wondered why this happens for a =
long time but I'm not the best net developer myself.

On Sun, Mar 29, 2026 at 12:05=E2=80=AFPM Andreas Haarmann-Thiemann =
<eitschman@nebelreich.de> wrote:

> diff --git a/drivers/net/ethernet/cortina/gemini.c=20
> b/drivers/net/ethernet/cortina/gemini.c
> --- a/drivers/net/ethernet/cortina/gemini.c
> +++ b/drivers/net/ethernet/cortina/gemini.c
>
> @@ -1491,6 +1491,10 @@ static int gmac_rx(struct napi_struct *napi, =
int budget)
>                               gpage =3D gmac_get_queue_page(geth, =
port, mapping + PAGE_SIZE);
>                               if (!gpage) {
>                                               dev_err(geth->dev,=20
> "could not find mapping\n");
> +                                             if (skb) {
> +                                                            =
napi_free_frags(&port->napi);
> +                                                            skb =3D =
NULL;
> +                                             }
>                                               =
port->stats.rx_dropped++;
>                                               continue;
>                               }

This looks right to me, can you send a proper patch, or provide your =
Signed-off-by in this thread so I can create a patch from this inline =
code?

The kernel process requires a "certificate of origin" i.e. =
Signed-off-by, described a bit down in this document:
https://docs.kernel.org/process/submitting-patches.html

Yours,
Linus Walleij


