Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1005AFC72C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqfW9F16nML5CsGkJS5mkwUC4wRnRvNmIeLf4MWREbc=; b=L99huibpRxbzptgnGiGf8hhgYo
	DsNgLts9IKCEuJEv+8//JZ0CQRTjnW1AyM+FzzKEh/n4VvtubGpwC/dO2He0oWN3c2Rfi+XAmjZbZ
	fK/rWBwYc+MH058ZLmdhCqHB2HE+LuZ1sfG1NJcf5x6tfsX055cCUkALId5mU20doL09a88RY9iTB
	pbpxREc33I7U1T2o3Y+z6eYftBtQWrSUobHmAtsAaWJmMG9pOsDthf9BEz6nVfAqRIqymFQ/ZHZST
	zIpoWjjUYLvdC91Q32qQh2crynJEDZpmIaogkA3yBxUwl0Bp/kNkUjvj8KNNtdWsSpcwOzewl5BOD
	to3JLBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KvP-0000000FSss-07U8;
	Sun, 22 Mar 2026 15:41:11 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4KvL-0000000FSs3-0Avp;
	Sun, 22 Mar 2026 15:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774194064; x=1774798864; i=markus.elfring@web.de;
	bh=OqfW9F16nML5CsGkJS5mkwUC4wRnRvNmIeLf4MWREbc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QmSp+aTEP2B2BSY0P97BWIzFRbtCu+/JclRqHING1eHiGQZizScFHj5wEMhLm9t4
	 aGIlSmtSeiKGUfgN9NgAWScvL6xBSdSp3yC3qj2V1rPbibHoEtC/p4IDNhlvH8KyI
	 qd8kyXlc/oR3m7+ZMLu30M87Z4lL0fPjldHlPo7V48L1oF9irUreURci4DOtSo/9R
	 X8FD6vIVVQtognFPx7GOxiDbPnft5UDi0iy14XVg3VJYdPkZ+p7xjTfQMHLQqIVlQ
	 wzydYY//lzVc3JI4hADA3gtLyDiseVCWzncFqXxSVHx4CHEoV0zkIDeTtl9xiZSq+
	 jpnM+qVkuStU63rQvA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MY5fd-1w3cOY3gGD-00LWq9; Sun, 22
 Mar 2026 16:41:03 +0100
Message-ID: <874c84df-a6eb-4024-b81a-149ff52707ea@web.de>
Date: Sun, 22 Mar 2026 16:40:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-spi@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Mark Brown <broonie@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
Subject: Re: [PATCH] spi: meson-spicc: Fix double-put in remove path
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260322-rockchip-v1-1-fac3f0c6dad8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:opnQCVWCscvbiOV5OwJ8v8ayG0MoaW1oTJS5TEpEXOmuIm6N95J
 Kp0YaEssnsAfpJZ/5Y0KWArfmRvAKJpzD7JxxPN5cUcelWKdaXtNT6aihBekXbyMaT3U5zE
 BQhsUms2TwZVspqpGHQcBn/1sYMM0A0qlr+bp+2BiGnunpIrwJDC0slCWXk0iKDdw+k0vaW
 kFqj2XsQklonU8ZzZP9QQ==
UI-OutboundReport: notjunk:1;M01:P0:gzKSpq4TZgk=;CeKiKjC9n2jDaWjXY2lbs4GAfQ7 MWw8cG+d0qeCE7sc/XqIS5kJz0rnFDhce7moAEs8J0VSsDKym4ohYW+7O56Yyfa07zgom203D +r5tKC79v7XMQEq7b4YvBQJzqZ38EQ5DcaxNR0ms2hmtAaIZSxnS+eXRS/n+JQeYqu0qiHStW NihMwg8YMz19dlML2zXFFkL8xy1ToC97uSXOJbSXBDLUtvZ1MqNiQWTUovH0Ae5R/5iy7Ir8+ qq5oGDXoH1xn75Qgta2CE+w7HVB3em2zPCKhYP1AEPskFro6UF+0dvJ/P//tsiKAelKFMH9ox 49Dv22GSNyOS0pHe1j8NpYrJbGp5FTekOPimhO7j2luyaR0xfBbB9tlRcDaKxKw6o7qch7uwX 2MJJt1wEUSQVOTH29uLDxa4DIyd63jD39bok2avez/EuC1euIMPYJi5yhnWVoqL9Z1oDniqlZ roV/jfhn0mKYy37VLVtvaumOUHMFZwdtqQXe+/xrET9dUMsO34IRN5+m0VphdgvsLIQQpATtm KmmK1zLHpjIrESeZ2AiupOkoWClCEqQ7AdWXpxc9UrRTbyKuIdDwJrEJvbvIQdfviA+8cZzbH FxrvT4vTy9pYPxar3WmZ1V9TSRQw9o4Odh7PCSzsZfTyDad5u7GNFWA/VEBM0Y8LDlbj2u1uR pOpqtY4dZjCXdl1BB6ReevnC8Wc5uEWRYiNZwKY5okLQkJLkfWcpzRQ1RPcK/ZS5iQgwxkTUL vhs4J+Y7ZCn8hLhXS7g2hj6J9u+jk+ubc0zjh7a+OzKQk/ixZpY08aoqMfo61n68aTaXTonrR xCkHuBz9Nf91GwfnIMvQDp8RxZrAKjgc+5JupuZv1sYThbFuFpOnNsd5x8y86+yuJWgkDDDGj GJRDXK//Ho7Hb0wMe2/x+Xc+7HgM1RHJpUZnQHxulOf1DiG/F6lJ3UmxXhyaKP8rmNLx1EUfs 0et3GbLuG5Sb3tgFq11s/VbjLQlLPX05p3HByphooXF7Gu+pM9TEmEhMIJMyU06gkSNJyy6v5 lXw8BtO53RFwUmUiTvh3gPEwq+qyegjzH2Nf5rBaNqKh+mETaLiG5JHK8ATiF8bMgUsbe4fH/ 4U8UayxfB/nksX98CO0IpyY+swecZ9OkTXQw/qCwkYdttVpfAGFPsiRvOFoyBRO9LPBQhxoD0 +EUJV0iZGwPcoXrVqwvRQczJ+bdwvj3W9OFV4orZdOTmbTw9HW2Nxo+19vZYJoz3lRya2tERL SaIVEu/2LCLec30dxh/SLVXgYHrtv35rnP6D8L8qsrhhtfkht0UgBoaC+vSR8APxlhuEtSENr ngFGz4TiyuaGfzkgBPoy73ziojgLAL5+W9T3l5nP972TO3f9oGgoG3dF/Du0uJHIyWaXqI7uJ 1OKEVjJsu8yIGVbLvuZZm8bv+sOjDJCXSQNuVKac34rhmvYQyUingQPRSFRVATZnJpJbS4Lm0 ZPSckiryOCEShsnB/3Epk004mwcC5ImYqgyUadzQmFuPw59TF8nVpO7U6wq/Sestc4E0ESX8P 2gwh4OHXcKvPKUcGoeCM/gv8zCOyUYmRiRcr+FXJh6BU5RCvLKE3c+TiL37p2zApsF6KUujet FiOJgkmxRYjpVWRLag4z0wbjdnyyjDLDfg+3UexLP2Nh1l2FBiEPEQaGjbowfHTsAZ0FtgCmj cNP5yL1A9iEF8QYwBeW1kMeWUzSCsLpGO21wXUhlDe2eIKJgkBPGb3i6Q131zmSZF2NhIPtk8 lezPU/RF6l1dLb09dqvjQQR4HLUhGXFFoKVG+iKHyLcIHC4ZnEFysZNGywWAkYIWKi8mqiBxz YQBlxITIKzb88lbSToQ07O6qPSuQ3ayXdzyf83132WCDjByjOwNpLnuZvSBw91sVUNMNVZODh gsN2Voct8WsHBo0KL8rMaDMjq7DuEYT7MtIY8IQOIX/tD++iWYJHtumlSmux0Z10YzuoBrN1a 9LEizuyeemANxtqGuAf1mC7/C1b+DRtULGY/fBvNvLw45IPvFiI+kz+L4UiXOXooGIkvzXLbe ZY+jerveEUcj/JhMVJXFzkErP87TmS0+HPxld//yAOhQCwa8GY2/Gri60efSVT24GYeJmtb1z SlzPbghDu9/j8djmljLdEnpTzvdffDGC+UV2CrYezawsT2zUV+0LMuxThLxaVBGyHecAHRS7C Mt8xVfZAC3KrewU/ktnMsoWVyWt8BUOVWrhtWSMtgtvIbC77EwHaEZnNkY5CFw6wfDaGCUkqy HH4dZ5h4kAa2CsonXWr6MfND2qTzV2EZ/HwD+IVLTCrHTCUJ+9lmib1Rv9Av+QMY9QN2OKSpE 0nQTK6OLY5pHq4b7RZAkKu5V0wTDsRpV9nMF3csCusG7aGrl4YzGNmQs1w8EQoIrDet7S6/1B CQN/s7LN1RfWkWUIF+wGRYjfANvJ1yO7ZcKiypV8YIUx9DZQxFtjthwVwkS2uSzGdOE3umqB1 aMjEO5dzHQ+EvWqGtAIdYjPSQRab42CgrKeOS+eTwm0OXbu9YNG7tKNVR0Qs4+uTrcDGPU9EB s/AUKFe5Ff5bt070z59YDtFK70wqT00gR0+TysXao3jvTUXIA9vGupi74Hr7r4yF+32n52lfB kBsHACF/eJeWQjyTiNF/LuW7A8J4NOMA7ACrazNJ5Hh/dCm6BdypohvJXwUbhnUJDEyz6g4z0 YO6IBR4mxe8fchDG/g2f6i0CWM2+91WJEUib+btgW8r0ckuwdFN7aSkeeLzZ/017ZexdgWXlS jzUC00NpS17a1x4rlNs/Uwd1/sPrHP+LZH+5QCTDerD7xovT/IYDCJF3WsvMnUhCkex8Q3zF3 h4SXvBrVsYym0u+blZ9OImqh9rcn7yLHPx14YDOLx/S9SkETsuSqvGPuxUytJymAZakD4yYkl s6bRVM0A2hKOk3KU107u+4/60LmDYa8bw4ZVYGA2l8qrHq5V0FeovWUop3Bkkgi7dJ5UFa/fi kLFbYLbquHfeB6bqlzrl53Zi43Z9RyAbUR35MFaeIf7+ZIz6qCrDh1CKBZFCxGXR77aWLzVEO QoiRamYouoYaTUMw2FjJyrJunD/CCSqHBJvdiWm+iMbAuTypcrFdRWGffotUBZS/evIfvk/qq 1Z/M0umEtLJcekDDAYv/XbFcMKH9nT8ClqXYOBgcQyHp1GotKKbRAgrMUwRASmZQ8kFB6JgE4 DaZ40AQqLpEF/eS8qemfEXUmEkBcSTkgx06mRsuDgi5fdGwDfGsAFDoCRU/twK4G7mKIzMF+b qNPn3F0T60yGfHmrDSoBuAdP07T/HKLt5HG6qPwQLJeC2oOCNmTEOpMQhLHEi6it/S5ryisNh rCuKSik28ZjNBcvLXlbjLad6G5F4j6CHRxPcwJ72YaSPzS12aPAvqFxTnjMRoeX664THAgKFd 5f+IT3oZ/baerX6+ZcjvN9z4itE+Th4+pLAjmKqsxiVvDDokGfBC4jWlMMJ49c2JdNdU+YGtQ mSwIExVb/Hp+Xzi4paGd5y5NwDoNXYuSb16TAjO/6ONxc/PNSweQM949e1gkhDFfccwN0tQyn Aq2pG/Y/ycytkYAu/cwjIksRmnLxTbqwgQ22PV7XNcRWkx4qgR6FCC9I/fSixHLd/8FzR9tsp 2YsuFKn29CICHwqY7piHTsBICfHLCrEglacpQ4KWx2Y06Kx5GcqWcDXDvLD8BxE944NzLf0Uh XQxxMyUQIExN3NwI1ZUyTqmCs7Yl+ZmgNaZnyVZGsOSFyzgf+iFXd+21b8LsaSmVxgr9z6B32 i8Luk/DZrBOMURA+Jwps1SxoXXMs4a9RVnyDl4csFFh8c9wXYJFxrq8jwpMDi+uhIk5AmLJ8j YLr/vos0OUnQzYdfOiMjVsdBJwTHztDN4NMimMOgImnixP+YOBV8W2f3GmDoDIzdiAw4/BGh6
 Rr9i4o2fm8MrIvaVVb0yg4y8PEhT/ZnEXybqzZkeokQmrhw9XgEAtVBTBkSuWviiLULZaJxdM Y+VqPWsGZB0vFi5bCZKmblXJb5vtpy49ZSGcZIUfUzoZ7WRNDgMA+DFZqwQiLU9FEMVgVZKMB GqPbi5hpuKNE7cWUtQQJeP7k5z13W0UyqzEUNQwMb163xhIl+VYNHCcaf+Ufnna0z3fdyyxzx 4kC/4q8AusYFNPLhwZD0PuKB1Q1mRSqlRzauocZ1iLCwMNzHkpqdY4ViZyG2wYXyGsarPOHVQ FkpHNq3vi10ypEt3x0zA5FnflmX0spUV+Ne5ALIJrgAFH9ydTmrVmLQSLbMKOW5gca42kqLho nYXL7ejwZI2YSDzWK39ML+hZ76GsOeetEkzDf4oaKhg3lu3UrDwRC0Jc6Wlyge+3/6kp1Vw3S hnDuml8KsKhIL7sQqc+J6+ATW4pem7SUwfwwv703FgDhE6lKgX6pM0WpOoaRaQVYcN9uVtdP/ 9uttjbWYjicp0qbeEj+fZuHiAIkgep87TqNPex6s1HpmxvWk5g4DEef7dRKqGP40CtqgZS/Vw YM/6KYzk+rg5DPXY1rtGkDD7KlEYZ/q65cCyPjxelONud00EOhLA48JaqKGOMPmQYL56kyZv7 2kdy7zFMiXYHwdhL27YhRcpfC2PU5Oz4xjwqA2r2u7BGJHPoNc5h4/eIbXrJEc52kQELR4LH/ flKQgwttmNhCyuc8txKEfDr8+axmh4al1tHDfktN8KYnVru5flz6fFQ/g+acm8ik7TkMoulyG wJzAggLGF7iR4LIZnTl4kJ0Tj8zTfSEevIuEw/OB07w7ms79cwWyv+Qfey1YRXwc4tDo7rKBq WK8W0UI6K/DVJlp1SpRJdDyPZs9TmBJEWw760cmzsNfLveXFV+kUgCpRC1YNS1LrI94PbIz1o JKc/PQQ/avD1Jt2NoAxlwkRnas5SeBkTurZe8o6Z8gVV/2+uVkw8S0kOThjyABppQBj/YktbR snpInLt854MGlbdNatJe8D+N4m0xl8IT9lxUmqBx/zZ4Lygaz5rlM502R07jsZ4FGiH562Kke 4vBiRSXAuI3LrgGB2bqx2+CamBXdyOTglmGsoGIx9vv81cZVgszPzeJslekpIDmV/v1UHQv6b PpBzlAWZmPpG4+0XltVuK4npCXdbwz/q53mL8qkCPUKS+AQkzf0k02Vjp51P5PlOxofhaEiij pRdS9Zfb5IAA4pDu/Ileuq0++H/nOgG5dp4qz+TZaUf5f/RpYWYoR9Ea0i08G9y+K/7XfrnIx mgqjtwDLEW3fr79mdep+OOouhogYXw++4rwaKrSwtw20WeSiUje+2nctUzhBme/t5/nR5XeKD EIIT000IqgTRBTL1AajEoBnYxmR4sXWANw97UdAsoA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_084107_872374_9A03B439 
X-CRM114-Status: UNSURE (   4.30  )
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

> meson_spicc_probe() registers the controller with
> devm_spi_register_controller(), so teardown already drops the
> controller reference via devm cleanup.

Were any source code analysis tools involved here?


> Calling spi_controller_put() again in meson_spicc_remove()
> causes a double-put.

Do any contributors care more for another development requirement?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.0-rc4#n94

Regards,
Markus

