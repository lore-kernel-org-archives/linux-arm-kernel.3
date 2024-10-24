Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F2BD10380
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 21:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YFSCR7IfY9tTJHnomR8IWpjA3ksgmVsEmuV7YWqhDac=; b=Sst8XIFaNGYKrHtVRXR2acFH42
	qF8ZollVu3k4LAtsrDU2npsEGXfwmqXGJjatEGt0aGye9BLORSFMQ8Xx/8nkXhaWUIq1bAOFwCo/9
	zCp4KRLWyPPROwCwxmbrUWToMJ1zwB6gWsDHMPaEEGTv7eCsYF2kCDwCX6Rn7JCTh2IvWWNIrRUO7
	CUcpP030CvrF28KlMIEe9Z7mx+PXLWW9EWc8O4n5lt6W1ZJn4VGa5DlOtIUF1sTpEvZ2xXnT0Yx5g
	ohVEKMJ1Mkg7fOc1HfZ1kJaDQyNDY6xo643dOzmIe7S3HEjEeUTp/tVWmbJAVFbytUBwh0TvWMisu
	Qy/FRjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t45B7-00000001r0h-0fbf;
	Thu, 24 Oct 2024 21:15:33 +0000
Received: from mail.rosalinux.ru ([195.19.76.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t44xf-00000001o6y-3Xt0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 21:01:43 +0000
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 7D26B1CE86E68;
	Fri, 25 Oct 2024 00:01:25 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 9oq4DAnOWm9h; Fri, 25 Oct 2024 00:01:25 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 291291CEA7786;
	Fri, 25 Oct 2024 00:01:25 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 291291CEA7786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1729803685;
	bh=YFSCR7IfY9tTJHnomR8IWpjA3ksgmVsEmuV7YWqhDac=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=JvCI2bpfYn6dddRZiFpXBEzWeMaIIIutw82nrEpFKELoHPE6QGlusc8ot6Pz2qsRl
	 xgHZlg0ZN4qSjNTvX61QWUAB7GUVXTPMjDh1akMWR7Bv4mMuo14u26B5xrIwAhP7XR
	 Zhx7eK353znte05A8c+mxDcOLCydBtTG2ls2w5c9/Mo4C87hbpDNzyXbRsAchC7Ks5
	 XLwSg/4N1t2FVpz/nBcGXLz3qFrQp8PdasmrTypM0817oCh9kImIJI7nLBMD++8mIh
	 k/jBTljV5jxoD21CpoJ1X8V5EyMSn2YqMYMoH55SN7eGLDRMqD3tW7zwRTBXHwT4Xf
	 C3mBvJUzpSmNA==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DcLkSC7j36Ww; Fri, 25 Oct 2024 00:01:25 +0300 (MSK)
Received: from hp-xfce (unknown [89.189.111.209])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id 21D671CE86E68;
	Fri, 25 Oct 2024 00:01:24 +0300 (MSK)
Received: from localhost (hp-xfce [local])
	by hp-xfce (OpenSMTPD) with ESMTPA id eeebd703;
	Thu, 24 Oct 2024 21:01:23 +0000 (UTC)
From: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
To: torvalds@linux-foundation.org
Cc: aospan@netup.ru,
	conor.dooley@microchip.com,
	ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org,
	dushistov@mail.ru,
	fancer.lancer@gmail.com,
	geert@linux-m68k.org,
	gregkh@linuxfoundation.org,
	hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru,
	jeffbai@aosc.io,
	kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org,
	manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com,
	netdev@vger.kernel.org,
	nikita@trvn.ru,
	ntb@lists.linux.dev,
	patches@lists.linux.dev,
	peter@typeblog.net,
	richard.henderson@linaro.org,
	s.shtylyov@omp.ru,
	serjk@netup.ru,
	shc_work@mail.ru,
	torvic9@mailbox.org,
	tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru,
	wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com,
	xeb@mail.ru,
	m.novosyolov@rosalinux.ru
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various compliance requirements."
Date: Fri, 25 Oct 2024 00:01:20 +0300
Message-Id: <20241024210120.4126-1-m.novosyolov@rosalinux.ru>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
References: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_140141_377765_737E48E4 
X-CRM114-Status: GOOD (  14.30  )
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

Linus, Greg,

First of all thanks to you for taking by far not the most harmful actions=
 to achieve what your lawyers very kindly asked you to do.

Unfortunately, already a lot of highly qualified people have started thin=
king that you acted very badly. Of course, there are questions like why r=
emoved maintainers were not properly notified and did not receive any add=
itional explanations, but, to my mind, it is useless to try to find 100% =
justice -- it is not possible. Overton windows has been opened a bit more=
.

Usually the first contribution is much harder to make then the following =
ones. A big problem here is that now many people even will not try to con=
tribute to the Linux kernel and other open source projects: their pride f=
or themselves, their homeland, their colleagues has been severely hurt (w=
e are ready to fight for all that).

It is not clear what to do with this problem. Any ideas?

I am sure that people from any country and of any nationality will have s=
imilar feelings if you act with them or their colleagues in a similar way=
.

Thanks to people who were not afraid to say something against this action=
. Chinese, Latin American, African and other people probably understand t=
hat they may be the next ones to be dropped from maintainers. Hope that w=
e will not have to form another Linux kernel upstream one day...

I am sorry that you have to read a lot of text from people who you call t=
rolls -- it is hard to keep calm.

You know, you have really made it much harder to motivate people to contr=
ibute into the kernel. There is such problem among developers of hardware=
 that they do not feel comfortable enough to show their code, for example=
 because they think that it is not perfect. Let=E2=80=99s take Baikal Ele=
ctronics. They do publish their kernel code, but in a form of tarballs wi=
thout git. They slowly, but constantly worked on contributing support of =
their hardware into the upstream kernel, fixing not Baikal-related bugs b=
y the way. One day someone told them that =E2=80=9Cwe are not comfortable=
 with accepting your patches=E2=80=9D. And they stopped their work on ups=
tream. Now that man has been removed from maintainers of previously contr=
ibuted code (code for not Russian hardware, by the way).

What do I suggest to do? Well, I don=E2=80=99t know, but I do not see dir=
ect legal reasons why doing this was required and why patches from Baikal=
 could not be accepted (the fact that I do not see does not mean that the=
y do not exist, but please show them). Politicians and activists can be s=
hown a finger in some places, by both developers and lawyers, at least to=
 prevent them from being too ambitious, when they decide to break somethi=
ng working next time... But maybe I do not know something about truly dem=
ocratic regimes :-)

Thanks for reading.

