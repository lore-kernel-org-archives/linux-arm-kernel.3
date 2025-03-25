Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFB77C3600D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 13:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJvaTHvV9TkEAhE0kh7p5puwgCBBIeP27IE9sliGY+w=; b=CkDMnw61Rhd68K6aKSpZQQFn4q
	8kBYI/yxR24/jdkSjqFJun8NMivS0PngBtc8Qrq3MfzNxbfmcs06t8bB6Gt6ETH0RFLTVnI/ay2cH
	DUsb+3mqQfq95IEGirusxWh1l1Ma65j2lkSE9ZwCIRWDAMkBvEJjGBJl4aOBJECykTwMxDsKJAo2u
	KnsZ16ESS7nFbkk575XjldCt0fmvlK5RbtltF9BIc++0eAgZu8D789cGftEbrvJyFym4/1F4pp3Qz
	Bzr6b349AeaILDofkI3eJCzGtI103VCSfM3XsU1cuhZFaLO0gQGAPBlLFDC/97294oSvTuyy2EZHb
	hP1r3psw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3w3-00000005xbT-0pQy;
	Tue, 25 Mar 2025 13:03:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3ZB-00000005sE9-2M0s
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 25 Mar 2025 12:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=EJvaTHvV9TkEAhE0kh7p5puwgCBBIeP27IE9sliGY+w=; b=Leed0W2RevKa/aro7+RR8cT35c
	5JXx8CKiDGdHDLcagk+eigvAZ/2Zno55S7wx3In3BBHc88d1F3rw1zawpinKH3bfj5W2CVGT9qMUm
	lCU0gRLSM6CPK9sYjbkH4fAn0mKBIBJvxpEaP83ihu/TEivaj03klRLbgYKWoDGi3qBPxWHZvGtok
	kAKgnrFojrlVQB7H1ZHNLwExAaoc6OZOTHyuVU6yCqj4mlVUe93emop//D86teGCUJwIewPpPk3gs
	tGHSJt97L99SESY62qGUXZGA0P9Y7jfq7Hu0XfmYlMoTx8pscW4ZhqHuAAGqKz1z97yC/4CktmRk6
	jr5+TSYg==;
Received: from mout.web.de ([212.227.15.4])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3Z8-00000005PqP-1BUv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 12:39:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1742906347; x=1743511147; i=markus.elfring@web.de;
	bh=EJvaTHvV9TkEAhE0kh7p5puwgCBBIeP27IE9sliGY+w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=f256tSmpfUX0j5+Q4cozF60Gl9YvBzgvGaByJlOH3aMJ3c8Q+NhBHy45n7VipXli
	 KARsEXc5TlDbfVE2+9DYAVMjud8Dgl+fOLcfQlIB8r+rvh1AWwARgfkLNqoJTPpxM
	 4Fbg2zDF2uPqsAj0xtPKbPiF+h080QIbzJwiSUfnxiQHRaiqK3yLoh9ymSmv4NoWP
	 l/tXs53QDL6NwNPV2Z34Qom71FwyrqhlLoG8zCHhCflCEO9h9bqGHlSnykFxbK4tU
	 nAGcv2o9hwzproO96TJ0ydTeZSud1FqHU6zKWDNWQlEpfrHBjOaqWdcOGHp7fXtaC
	 9qw94onFeFOGQBTQXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.33]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8kEP-1u1kOQ3G3l-000Fue; Tue, 25
 Mar 2025 13:39:07 +0100
Message-ID: <77fbff4c-443d-4ed4-8335-a6cbec6b2809@web.de>
Date: Tue, 25 Mar 2025 13:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: Julian Calaby <julian.calaby@gmail.com>,
 =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
 <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de>
 <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
 <26e36378-d393-4fe1-938a-be8c3db94ede@web.de>
 <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGRGNgU7t85oG3Bq7L3KjKUAbRyd6SHSM6F6BvmdXDVkbNegKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9CyG8ypY5QKj6AhZu4bBlBd7xaoOmtjIcy4YmaBDsj3YqIyZhKk
 PUktB1EqYYQoHv12uD6eMe7ewOJNfdqf+a43VZcmuf+xW/B+cqjHZF1YIuddtDDM82Srbmm
 sKIaJ96U4yyml9L4xAgB/lVLUCUzDmOWhol9hSdfEJ7COscAtAsD5d/SRH8GkLAhoUcQhpn
 GcfVX89seWKeYyfg/CSlA==
UI-OutboundReport: notjunk:1;M01:P0:2idS/XK9DaY=;OR4JaWiRAi3GuG73tU1MlMDztEJ
 2omG9oC5KLryibGuBsLaDCnazAklLQZI6ijbJnjl1gTWn866z4XRMeq4Dy/Wrz5phvgVXsfZD
 pE2F4KZfhFvBkgtlZRU6SmXulu8bVNoa9AUx5vOxGPgEC6l8O7bud6oVScp75NUUDHaiLaZuk
 FMrttwhLGvUuoCNcIwO6FHbpQ9YX/ngBhBRXWycGwKjnpIQDiYKwtD76dp8niiwogeDKy+lHY
 eCzm/k8MG1RwZcn7twSGSCuny1I4dLb/ILowaX3xHHjq4VLKH4+2BC4lP+MVUsQVnH+YrR6Da
 AIo0rcerYZCGQqSU9QGkp6vOba+Cvqg0NR6ITIB0UXqHShjnYeUKPSHE4yvraouAGQI/7wM26
 b5wW49+aBrZ19Cwoi/YOV31HcWIKKpuv651hrFMR1GW3/cgrj9zDlmwReHodHfGerN5MlGCG/
 gCaj5eYlNU5vF+h/8h8d2UpN2PoOfKIzrBiNi3udY4WYruQcFnbjhz+KK943mRVTWGegorU0x
 R7C3gfH2W8jO9s9flcg545AeighTffx4a62AM/B+VW52uU6f+BECy+0LHw/s4bcGKQ3xgZMGe
 KsEpSN6+RBW7QBY1xyWVox2pA8NjlD/rgeZD/MohrjgbzGM23Zt0sKh+ubYXQ6sj7EEl0S+iz
 Ile0M+h76ViE43tPGnezxl1kO5m8C35aCdSPrRAt1Nr9pMHtB6zgICPlX5lCjUpouh9Q1kX4f
 /7Trl4ErBxvVb0N50ABdY/8ltifwMOveO6aci9Yfap2/7nAC6Lv78U78HoqfCseOYIFf0sLse
 +5ekVJ3Nki37L+8ZhOA2v3pfDrl77UdxQxRutFOS/kjRbsnPvJ89iidwziJ72NAUauDFdLYgj
 WGly08yr0Gg4DzGHXsVa/Zy9SwrRG5PrkCadBso65Bx1SN0RB5PlCHiSTLww1tm98BrEu6jSD
 4uHZqC+XeRej0/673H4nZJfuDVxI8oy9TNKFz6eHmwm14vJDGdebaUAcy2xCfwmULk9vnppFa
 fh+10orUntjsg1yCZ0UnngAEX7ZDZPJfvGb2xFM7/o8+wM39TgBKbIqLjtCbRvCzLBu8+dcon
 ajsopM9cSZv0eMqsHId8B5Yze+SucoZ78k4Ond2Z6c4ySsxjYE0inVHiMJ6gVvLyEJprq5Mn4
 9unOwHFZC9/Wt4inxSucuJJF5oH/aYpf/cOahaaMZxF/T01nOEGlpbsXoEx8/2/l1YpFXbbv7
 6JYlomrvAemfNl5N1T5TFNRJIGDKp7HqCOtkGzReWaHSA/HLnGcAnucr7rApzjk82lcHbZyCy
 s3Y5sPcgXiDl7gWy2mAnJOojKmNrj/dPSrsW8atXGkCPLS7aLvpPNRhQL365+yzHWYlFSsEg3
 4GTXstWJH7zilkrzHP+YDiLGPAGtBVsnRTKx02V20bLckLydpKZiLxPBcyCL42bjgdBGUR4CS
 fjsBM1lHbil8rlsvbI3D77qh6n4znPzR2GuSM4pHddlZZwOY9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_123934_527527_D9EBA0DB 
X-CRM114-Status: UNSURE (   8.59  )
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

> You're "concerned" about patch granularity, but this is not the sort
> of thing that some random person would raise, this is the sort of
> thing a maintainer asks for when patches are doing too many things or
> are unreviewable. =E2=80=A6

May additional patch reviewers influence the software evolution another bi=
t?


=E2=80=A6
>>> What do you mean? =E2=80=A6
=E2=80=A6
> Once again your comments are just noise, and your insistence on
> repeating them over and over and over and over and over again is
> borderline harassment.

Some information needs to be repeated also according to known communicatio=
n difficulties.
Corresponding views might be evolving further.


=E2=80=A6
> Please block or ignore Markus, at best he's a nuisance and at worst a tr=
oll.
I hope that development discussions can become more constructive again.

Regards,
Markus

