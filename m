Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E72FD88D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 02:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=; b=vzQT9BWj6othI5kBKqaVtd2o09
	ueXow5ewyQs4jyzQMFc9u/p09r7xBbeovXjQFDThaJtiHF8RTEywoIIkkJcygYt9maAazlMTqoemW
	VcDHwoFn9Pzl6I30WEGHOWrCq061xo/J1M3Y5zdD9lHoxZfoseDbi1mpQVgcpkhOT8ri/oYMI0G3k
	HNshiHKUlUhUQ6PBsivAf/TyLv4qFEbUm/xHRRQKmMck+8iQtK3FJqAZDKK+R9mmnmzh0czFNjCOj
	AIl3xKqanc2+YlFVB4lgVyFZiwYdsLAVVD3WGTYyB9tQ4t4zTdJDiFcpjbOWa1WE8PzsKAE65LjRo
	PLL2b0Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w099Q-0000000AXrI-0HE2;
	Wed, 11 Mar 2026 02:18:20 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w099N-0000000AXqe-3Sfm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 02:18:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70f91776fcso5779727a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 19:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773195497; x=1773800297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=CpCNtKYBIHFzcFD8Y5h6c8fwQNKe09bIhk56EXR7hKxd7Qvlbaw1ysr9KvnscucpbI
         HRmWgl0nZWKAZvDWTf5StzMDaeDGiFA0NMkK49j0paSCqaNoYbn7DZPKPrUBV7peTRWi
         mIF1+igk1+VbxHBQxigX1PU/JwoV4jTCMl8lBp/ZdOWKFVBloljHxhIMETC0NxD5II8D
         qUFvVbNSadYhm2y1axW3n6U6GuH9DQA3aU2zyn6Zd/33rW42btRfwGnAQvp7T+aDfJPI
         x8bAJrweFa6g/r8GscCpMcbOd9zUN66QmNvhambuyulFvXUvqwm6wCXHr7KlhyY+ZZw9
         7lhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773195497; x=1773800297;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZAqF770CjctREhKahUCDqzMAEkw+GXfuiDNjYlwSLk=;
        b=C4jRNFmkAMQAnbOE7nP6O+MtfX+YmhNZRZBUQ4aNilIx4dwZZB9Ag1zNm5UNbMRRpR
         cg//mH1xHSjHCcUEZ5YgG2xjUcn1aNtPPqZoewkf/13i2Ld+XzcfEfZZiR6lHVYOZ3GP
         5GY4UCfoS36IQTfCRIjTY2dlDE1IOjbSYPgAxM06XBze4+7jUjMCYOgogoFyaivQYDqR
         eIq5B+/eakcLdsPF0E//6MKA5EUE8oXfRktk6F8UOCPXCxO0J4R5krXtXRRBlvh73i83
         UTz4yeJ0sBFoLJLjLyRQpuwXziynw26PRmkZncIXDRiBmmgiIh5XHYE4Opqc1pk0h1sm
         AyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUv5r1APRvXSSQjIZchf1bg+X2HxlUeJ/zbg+j3Q++ZcQJ48CfcUSBYToW83ZMuwgAhQPU6SW9heSc7GMj8RJS9@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd+ECjdNEXspzGsMG8vX+abDaUlU5srsM+KH0ZbBNtwP+N1ITr
	2OD5S9Lu22AZITC18fe9nB+nZWCm3wZPMtyj+I/O5etF8gKw1fFxOYIe
X-Gm-Gg: ATEYQzyemK6FLCVex3ow4r35v1/0upLLqA6rtoXuCG/6BBg4MrPfHjyjnq89laXCnaD
	S40Xw1yk359cZfVvQWD0r6FggVI+BOTbPg8CgeVUn4ITA7/8+cFd4HO+e/tPsmjZsL00CXVZEx1
	MThEwIXK2BP0+KjZ6XuigwQvn8vxiHXBlW2e7CUn4K00+aUyMbha00QDa0lg26d5LlwF3S90+fB
	96V1HyBXUQhN5aiAWSSHQlnQl1rb3Xft/cxmpkEM2sXuedj9JQIsalFcurDy4dwuY6qr+yKRlV3
	mWhQFVJ8b8zm4L8YuW7AG7zSxalN4pUx6rJrZF2Zl8ABu3Gzz8VlAIOz0LCaW88VhjH91BjrCqc
	ykCRXPnvd6TRwhD4Msxr4G14iOH0/PTwOFzfxRRwohsxIg2vyRt/HoM2N/J5xW7fc9DSjID+xKT
	QMBGG+en2EspgNlYxF/LAI8O4h/Xx/9dq9NrQ=
X-Received: by 2002:a17:903:1666:b0:2a9:47ff:101c with SMTP id d9443c01a7336-2aeae8eb7dcmr9366255ad.46.1773195496591;
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:aab1:729a::4bc6:faff])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae34e009sm5679355ad.46.2026.03.10.19.18.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 19:18:16 -0700 (PDT)
Date: Wed, 11 Mar 2026 07:27:18 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: David Lechner <dlechner@baylibre.com>, jic23@kernel.org,
 m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com,
 yunfei.dong@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, pure.logic@nexus-software.ie
CC: nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org,
 nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com,
 maudspierings@gocontroll.com, hverkuil+cisco@kernel.org,
 ribalda@chromium.org, straube.linux@gmail.com, dan.carpenter@linaro.org,
 lukagejak5@gmail.com, ethantidmore06@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
 sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 skhan@linuxfoundation.org
Subject: Re: [PATCH 0/7] drivers: Simplify cleanup paths using __free
User-Agent: Thunderbird for Android
In-Reply-To: <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com> <79bfac24-dcb4-4fb9-90d8-3ef2393f51e3@baylibre.com>
Message-ID: <7F16ED38-6BC1-4D31-B5B6-6C1E45D24C25@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_191817_869328_94803B0B 
X-CRM114-Status: GOOD (  10.47  )
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



On 11 March 2026 3:22:28=E2=80=AFam IST, David Lechner <dlechner@baylibre=
=2Ecom> wrote:
>On 3/10/26 3:05 PM, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>=20
>> Hi all,
>>=20
>> This patch series replaces manual cleanup and explicit kfree() calls wi=
th
>> the __free attribute from <linux/cleanup=2Eh>=2E This modernizes the me=
mory
>> management style and simplifies common error paths without altering any
>> functional behavior=2E
>>=20
>> The __free attribute provides automatic scope-based cleanup, making
>> resource management clearer and reducing the chances of missing cleanup
>> on early returns=2E
>>=20
>> No functional changes are intended in this series=2E
>>=20
>> Testing:
>>   - Compiled with W=3D1
>>   - Build-tested on i86_64
>>=20
>> Based on:
>>   <linux-v7=2E0-rc2>
>>=20
>> Feel free to share your valuable input in context of the cleanup API=2E
>>=20
>> Thanks,
>> Sanjay Chitroda
>>=20
>> Sanjay Chitroda (7):
>>   staging: greybus: simplify cleanup using __free
>>   iio: ssp_sensors: simplify cleanup using __free
>>   iio: st_sensors: simplify cleanup using __free
>>   media: mediatek: vcodec: simplify cleanup using __free
>>   media: chips-media: coda: simplify cleanup using __free
>>   media: allegro: simplify cleanup using __free
>>   staging: rtl8723bs: simplify cleanup using __free
>
>There is no reason to put patches from different subsystems
>in the same series when there is no dependency between them=2E
>It just make for more noise for everyone=2E
>

Thanks for the feedback=2E I will split unrelated patches into
separate series per subsystem or individual in future submissions=2E

