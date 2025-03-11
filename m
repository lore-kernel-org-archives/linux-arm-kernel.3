Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA5EC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mImllHOF1f5YSoTFrqJ8XmfKfvLaVzDpIxgyVykwOsU=; b=3zEgZGgg2ipF57S8gICta6EKbB
	JpKm0BNQNsdwdFuV2ZdPtcQnejddFO4R4E7u6RVYxHCCaWhhHSYxQuR1G7FY8d6DAGYKhlXDweMzi
	XRiCAj7i0cBxjPEdElkm56RzlIOC2ZK9gynkDwvNI9VScFH9Nh0LF81PDYOtCZ4YBWIOi4r4ngbjQ
	S+se2U1Dg9kEOBRa+T4z8OlJFon+Gb9QHMRsKxPFv/PINcOQ7ZDCK5txF/i3AZiNF2Q/FedjWXg0D
	P2draLJ213SXlsJhiuCKXIoBBLwRDBDHLzynN8vQxP+7Ui+IovIyUBlGKd3GfUYlIPLxE3TwWtEVZ
	ZZYNW5eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Io-00000006vjb-080Y;
	Tue, 11 Mar 2025 20:34:14 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5gr-00000006qb5-0BlO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1741722855; x=1742327655; i=markus.elfring@web.de;
	bh=mImllHOF1f5YSoTFrqJ8XmfKfvLaVzDpIxgyVykwOsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A2DFV/9eELx+E0MLju+gvBYPlDj2tB5qXPjBJ6Ic6LfuNwDgiKPwYDxQVZ4BTFCK
	 Nbu+On6yMvpQNLHbTVXJ34Wv0ZeBMbF3syfeLjriWGq2JYLkSyYkwTq1EsK5yzwZr
	 NyhXW+d+KFmcuCrrhtXpO/vJLeKwe0v3kXBqTqUMGyautyDmFTnf5XA22wfUqP6Xr
	 Wy5XODwBippDAfPpbL+3CyXiUiLF4u+i0tGZcW+gdeQLlxRxyokyBVlwMerdaVz14
	 xNPcTvIcP/lZMFT3OTE+BEYIlL5EJCZHbI4baQ4QRqutFGF6T16hqDslFuf9poN6g
	 DcxyIk8y65yNLl16hg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.93.40]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MHmq2-1ty9gH2WaE-0076Ut; Tue, 11
 Mar 2025 20:54:15 +0100
Message-ID: <885ceb3e-d6c6-4e7b-a3b6-585d2d110ccf@web.de>
Date: Tue, 11 Mar 2025 20:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <csokas.bence@prolan.hu>,
 dmaengine@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250311180254.149484-1-csokas.bence@prolan.hu>
Subject: Re: [PATCH v4] dma-engine: sun4i: Use devm functions in probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250311180254.149484-1-csokas.bence@prolan.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:csxRDaKr6HL5KWEyrXTAxwCUqgGdHfeEmtfVOjb+dUzcX32YGAJ
 LKwKJCqKYMVT0xpMnBQyeBtJH8ETx4v/Klf0cqiH0J6qM3JxwfQ/b2FiT3gFHkld8w1EXb2
 fgnoFkK2KwhXhyhJ+pibeC/YghDSJd/YeSJ5xc/vaEtIYbyimsNUZoLcbKAfWq56Lrg+/YV
 N9pktnJXiqt6ibo9A6ZgA==
UI-OutboundReport: notjunk:1;M01:P0:yvb23s+8boU=;2XsQvEXf6tSU1WJIIuRcp4Jjv7G
 /GHJKSr2DTDPZI8J/i076i1oTK8Jkl6em4FEUxyRpVfYcdScEVrZn+kF0OcJloLCSvm/4E5Ie
 W+/hVY0H2NVClF1upl5sc66W+gh5QfD2C89grTSWSBQN/eAif/Cs7gS+rlm2Hie71wXj9UtJX
 BY3ukIW4/aO2HrWEpI8hzVOAGmaHHtVQJYX3Dewk9CLfA8DKH1QiFldjbu0LvLlWq0EHHY6Gg
 E2lP8MkCKmzNYjnomqdTfEp/+vlgsIM0qYnaP01L2PrXpmQNmz/YFdhBFDefgakj34XBfPd/d
 7qFAKt03JV8WVyC4JmNtkc9Yhd2wwXffUiKfYG7Ik2x9UQ6az73ZK/4SPhXA4STYMqsK0mC2k
 krDx20xionaK7CXWYB5P2odri7/BQcR09PzjkOIq1BYORAlUbpsoe8CsV1E4gOBY+YxhiRyvI
 g2N6nrrIM7Pj4wxr0qLIUWs9wohrqiAyb81LPP8MF8ekHIAFwcwQGGVPuEWVbypke1H9pG4H+
 k0SomtBxs8gepSlMgksTRhT0acbgSnaqCqjkAYeR6fwIUQZ9rumGWFcFTQHHUZ7GQ07XDDEjk
 t00S4437IghEiUMT9pmJNQBKhxpULgJ+RVxjlhuGvsCdZS0vi0UuQx5Ll39VUnIr2//0cRQvd
 Ork/M4MnjaFVrRrrQqKRk+IfkRIKbREMQvQ2p7QqCl0Zr4JghWMCyWFcsrMIH9tffW11e0IDU
 ApCOXAaJAcy3YU+GM7Rm6OwxZFWEMgjWDj8WqfB7yBQQbZGtKFJVuRNc621l1Nenocy+3KVru
 gdWw+3wu3DETzFk30wheJpqbWUET83N6NpyVBUrBGRaS8IelUvdBu//dCm4rXgp9TAJxN1FSM
 /Q51ms4jbEwKfwBAEqXuWc3DYhtF6ULUvL5+tneinAJO7Uwb0yo8dtCeD6UHD1e1XPzY2hiVt
 jfL9NhcN0S31QO8XDLVSa6QRwr0s1n3W6yFwNkhy1Ud+J7+1OhuJ/jsIg5G8zDawPLV759SC/
 llwKk2ScsflOtuAuldBNvQdMn9UQZNxOZ3FNXNpswMZC92Zf1Coe3pdm0p23v/PaMFdxaszZ9
 JsNa8uL3iZPL6jhNrUTw3uEXa9lX2kb27PNmRwvE69BkjnsGd5p+rLw0iHb1ywvJIcwj1ARlu
 neRGNhcFUBSn74DuudTlVTxECDZC7YDM3bWKun9z2EXECkMVQRMJKxKFSE42C4CfLfjLYaMlf
 o6WIM1ZTaXLQt+xe9gNg11fuNc4h4ZiJKJV4t4DefC3RkmBbjX8jDHcYVeBhw/FI/Z4FR4XEI
 zbRWrqKmjAi2LLsvdIKWWwh+SjP/ScIJupPVCwFMxDGYzsYXcfPM9SSZbLTlOr91eu49wELuF
 mmynfkvgDl0KFk/1LkC9CVQFaj8oOKd4UEnf2BmlvR6eBUFreLx60OKm8/Z3B1y/xkuTl6S19
 VAONiXg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_125501_377897_8F9FE7C5 
X-CRM114-Status: UNSURE (   4.94  )
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

> Clean up error handling by using devm functions
> and dev_err_probe(). =E2=80=A6

How good does such a change combination fit to the patch requirement
according to separation of concerns?
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tre=
e/Documentation/process/submitting-patches.rst?h=3Dv6.14-rc6#n81

Regards,
Markus

