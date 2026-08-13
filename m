Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFD6C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 19:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH8QJWbiTZSTmOX6SA35bZzI1sSsujgIbdHxX53JqF8=; b=jMV8UtxlYI5DLGW989NwXDmObs
	w9blebvismn38k6gkU3GAzTFT/zn4sYCrg3s+2MTc0PTCevQH9yLrgBXjhwGzFajsP8RBNVAOjH89
	JYtK2jqMyH7KAVV5nzOK8x7Wl4RpLS+MM7AV0b69IFWF2e7EhWEdGTTX7hnxTQ0D62JgFGGXmHw0h
	aK6X5r5m6jJ3T8DoJ9/rgX0FOyXEZ9QFWke7oFbS6wl7wNGoOMVSu/Pv+27WF2tcOGBwQ3cZr/ka4
	LRwp2H72jiovYnnGI9XBM3sHODF4Wj35kaSkankOPsTEKOTF+58Tg2HQfC6UQEUCeqlo/zih4vlYj
	1JVBppkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaoQ-00000001Qid-2v67;
	Thu, 13 Aug 2026 19:10:01 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuaoN-00000001Qhu-3jhI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 19:09:57 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-836cd7310f4so3556847b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 12:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648194; x=1787252994; darn=lists.infradead.org;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CH8QJWbiTZSTmOX6SA35bZzI1sSsujgIbdHxX53JqF8=;
        b=n3nnup1SF4k7iNK0rOJLpyDFXwMDudA9oqTdCZ5fM1Y8J86H8AIeUSZvzmZfOvapha
         CZx6f23lJq8T4rxjWwKE3w9rJNzGoSq6E5K5Lj2koOKT8hl++6mnL2c/GwEEnMwOru6/
         dIOatVsez8bonlJOlzabG0opO13K/JwPUImocaiw3oSD7TslqjP0+rNPm2TP2ucDllEX
         5nVY/QXk1XxvziPCAfNNWRle3NSV3Z0owvbaHc7WEsLksW6jFII0v5Ayxb47wfWsu4Lw
         H6RgAfhJmtixJHObsCu5elasUIijXy/eWfuHmVaRzLybff1jchf4Hiay04Xtjik7Bl6+
         QhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648194; x=1787252994;
        h=content-type:in-reply-to:autocrypt:from:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CH8QJWbiTZSTmOX6SA35bZzI1sSsujgIbdHxX53JqF8=;
        b=EiUpppvcW1ctP+19lMHUElVL1g423ucgnuUlRgrM/UR2KhZE7e1nRhm64I2iVbBCUk
         KZr8eqqh//bFFxrfmFsEI656phxemGyYxBAy0LyU/P7zs8v0D2I/Ow1nYhoOhwlfFTvQ
         GR1kpXLd1i1+m4exEYGdu+HV0m4VN+ZESwtBWqx+0Y0s2Po8lNTk9V0Yd56VEHS4aws/
         emQwIbydyzNYfLHHRtztCYbnfStGBkdgGFe76u25LbF63Gn2sPVndFtVcdqQ6QUOxpXg
         1Ct7x8Z4lesYt5GW5dqcLRYQxfvB4aig2kFfkmns+4iaERXahtpcI4ga3hN3h30ImFeI
         0TKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr+b1b+8UabXW0q1rzf4W2ZTqWTRXHjpYyIplfJUfPH6jrRNLCOz/uQODK9RwLE9Jphu6W6vI8x8ifnS9PwmAHV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7H3ZtaxfHP7iySSm+vui0HVOynnjOeeb9TESUptSuXKZVcKum
	MjM0VJtb7+kVHzjSAQqnOttu1ig41wZLF9u7+HJyQvfF4eDsh0I9WsGA
X-Gm-Gg: AR+sD13SKKpLIg4zW0CvWfe8hV4mNBdVc5leWb2Mab2iNmQBHCeIUo93suJMwN2NLPn
	roI6WMbFlypTs48hu1xesz84uqMVSf0alOQG/GkXHCxDiwTuasepCd3QgO6Gg02bBjqphqoOz+D
	GyK18QQDOI0l6oEkZrXoRpyp85kAvGvmkh76LuFlmoQLFCWjUM1NgNcJVCLViSSGt4ZmOKwi4R/
	jf10+K4ZbzE2swsjY2P8sym9w+P6ta7KQKzths+v0cPf4TOxa70bQY4zpNHmNnjpLM1OB1kUOXZ
	f0LnIKW6Nkz6hf0p5fkXFzq9hKsRKlJf0oqgNzAR9f1CTa9PubqgTvXFriotlM36rEcyMF9in9p
	7CRhz7eE+7+rJuTYUh6Q9hjMXLhkxEkQmSp317eF3EKkJ78uV2dGGcKmg9SI5ym3MZH5fvyAKU0
	kM0uw7ncJvn1S4j/H9gPBPQCKXN3pV/oZfAjV0VVLwkSf6AWMLrpylKMtesCGaTmkUB+b7uQdva
	g==
X-Received: by 2002:a05:690e:d08:b0:66c:2d72:38d9 with SMTP id 956f58d0204a3-66c72b1d9e1mr353282d50.11.1786648193908;
        Thu, 13 Aug 2026 12:09:53 -0700 (PDT)
Received: from [10.138.10.6] ([185.98.168.14])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-836c1777930sm3475807b3.31.2026.08.13.12.09.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 12:09:52 -0700 (PDT)
Message-ID: <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
Date: Thu, 13 Aug 2026 15:09:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kuldeep Singh
 <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
 <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark>
 <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 xsFNBFp+A0oBEADffj6anl9/BHhUSxGTICeVl2tob7hPDdhHNgPR4C8xlYt5q49yB+l2nipd
 aq+4Gk6FZfqC825TKl7eRpUjMriwle4r3R0ydSIGcy4M6eb0IcxmuPYfbWpr/si88QKgyGSV
 Z7GeNW1UnzTdhYHuFlk8dBSmB1fzhEYEk0RcJqg4AKoq6/3/UorR+FaSuVwT7rqzGrTlscnT
 DlPWgRzrQ3jssesI7sZLm82E3pJSgaUoCdCOlL7MMPCJwI8JpPlBedRpe9tfVyfu3euTPLPx
 wcV3L/cfWPGSL4PofBtB8NUU6QwYiQ9Hzx4xOyn67zW73/G0Q2vPPRst8LBDqlxLjbtx/WLR
 6h3nBc3eyuZ+q62HS1pJ5EvUT1vjyJ1ySrqtUXWQ4XlZyoEFUfpJxJoN0A9HCxmHGVckzTRl
 5FMWo8TCniHynNXsBtDQbabt7aNEOaAJdE7to0AH3T/Bvwzcp0ZJtBk0EM6YeMLtotUut7h2
 Bkg1b//r6bTBswMBXVJ5H44Qf0+eKeUg7whSC9qpYOzzrm7+0r9F5u3qF8ZTx55TJc2g656C
 9a1P1MYVysLvkLvS4H+crmxA/i08Tc1h+x9RRvqba4lSzZ6/Tmt60DPM5Sc4R0nSm9BBff0N
 m0bSNRS8InXdO1Aq3362QKX2NOwcL5YaStwODNyZUqF7izjK4QARAQABzTxEZW1pIE1hcmll
 IE9iZW5vdXIgKGxvdmVyIG9mIGNvZGluZykgPGRlbWlvYmVub3VyQGdtYWlsLmNvbT7CwXgE
 EwECACIFAlp+A0oCGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJELKItV//nCLBhr8Q
 AK/xrb4wyi71xII2hkFBpT59ObLN+32FQT7R3lbZRjVFjc6yMUjOb1H/hJVxx+yo5gsSj5LS
 9AwggioUSrcUKldfA/PKKai2mzTlUDxTcF3vKx6iMXKA6AqwAw4B57ZEJoMM6egm57TV19kz
 PMc879NV2nc6+elaKl+/kbVeD3qvBuEwsTe2Do3HAAdrfUG/j9erwIk6gha/Hp9yZlCnPTX+
 VK+xifQqt8RtMqS5R/S8z0msJMI/ajNU03kFjOpqrYziv6OZLJ5cuKb3bZU5aoaRQRDzkFIR
 6aqtFLTohTo20QywXwRa39uFaOT/0YMpNyel0kdOszFOykTEGI2u+kja35g9TkH90kkBTG+a
 EWttIht0Hy6YFmwjcAxisSakBuHnHuMSOiyRQLu43ej2+mDWgItLZ48Mu0C3IG1seeQDjEYP
 tqvyZ6bGkf2Vj+L6wLoLLIhRZxQOedqArIk/Sb2SzQYuxN44IDRt+3ZcDqsPppoKcxSyd1Ny
 2tpvjYJXlfKmOYLhTWs8nwlAlSHX/c/jz/ywwf7eSvGknToo1Y0VpRtoxMaKW1nvH0OeCSVJ
 itfRP7YbiRVc2aNqWPCSgtqHAuVraBRbAFLKh9d2rKFB3BmynTUpc1BQLJP8+D5oNyb8Ts4x
 Xd3iV/uD8JLGJfYZIR7oGWFLP4uZ3tkneDfYzsFNBFp+A0oBEAC9ynZI9LU+uJkMeEJeJyQ/
 8VFkCJQPQZEsIGzOTlPnwvVna0AS86n2Z+rK7R/usYs5iJCZ55/JISWd8xD57ue0eB47bcJv
 VqGlObI2DEG8TwaW0O0duRhDgzMEL4t1KdRAepIESBEA/iPpI4gfUbVEIEQuqdqQyO4GAe+M
 kD0Hy5JH/0qgFmbaSegNTdQg5iqYjRZ3ttiswalql1/iSyv1WYeC1OAs+2BLOAT2NEggSiVO
 txEfgewsQtCWi8H1SoirakIfo45Hz0tk/Ad9ZWh2PvOGt97Ka85o4TLJxgJJqGEnqcFUZnJJ
 riwoaRIS8N2C8/nEM53jb1sH0gYddMU3QxY7dYNLIUrRKQeNkF30dK7V6JRH7pleRlf+wQcN
 fRAIUrNlatj9TxwivQrKnC9aIFFHEy/0mAgtrQShcMRmMgVlRoOA5B8RTulRLCmkafvwuhs6
 dCxN0GNAORIVVFxjx9Vn7OqYPgwiofZ6SbEl0hgPyWBQvE85klFLZLoj7p+joDY1XNQztmfA
 rnJ9x+YV4igjWImINAZSlmEcYtd+xy3Li/8oeYDAqrsnrOjb+WvGhCykJk4urBog2LNtcyCj
 kTs7F+WeXGUo0NDhbd3Z6AyFfqeF7uJ3D5hlpX2nI9no/ugPrrTVoVZAgrrnNz0iZG2DVx46
 x913pVKHl5mlYQARAQABwsFfBBgBAgAJBQJafgNKAhsMAAoJELKItV//nCLBwNIP/AiIHE8b
 oIqReFQyaMzxq6lE4YZCZNj65B/nkDOvodSiwfwjjVVE2V3iEzxMHbgyTCGA67+Bo/d5aQGj
 gn0TPtsGzelyQHipaUzEyrsceUGWYoKXYyVWKEfyh0cDfnd9diAm3VeNqchtcMpoehETH8fr
 RHnJdBcjf112PzQSdKC6kqU0Q196c4Vp5HDOQfNiDnTf7gZSj0BraHOByy9LEDCLhQiCmr+2
 E0rW4tBtDAn2HkT9uf32ZGqJCn1O+2uVfFhGu6vPE5qkqrbSE8TG+03H8ecU2q50zgHWPdHM
 OBvy3EhzfAh2VmOSTcRK+tSUe/u3wdLRDPwv/DTzGI36Kgky9MsDC5gpIwNbOJP2G/q1wT1o
 Gkw4IXfWv2ufWiXqJ+k7HEi2N1sree7Dy9KBCqb+ca1vFhYPDJfhP75I/VnzHVssZ/rYZ9+5
 1yDoUABoNdJNSGUYl+Yh9Pw9pE3Kt4EFzUlFZWbE4xKL/NPno+z4J9aWemLLszcYz/u3XnbO
 vUSQHSrmfOzX3cV4yfmjM5lewgSstoxGyTx2M8enslgdXhPthZlDnTnOT+C+OTsh8+m5tos8
 HQjaPM01MKBiAqdPgksm1wu2DrrwUi6ChRVTUBcj6+/9IJ81H2P2gJk3Ls3AVIxIffLoY34E
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------i894QC0fu9NisDOBnbo7myGW"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_120956_001142_F612F79B 
X-CRM114-Status: GOOD (  23.02  )
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------i894QC0fu9NisDOBnbo7myGW
Content-Type: multipart/mixed; boundary="------------iw28fzqMn9Gj0JhxTrO2tL3G";
 protected-headers="v1"; hp="clear"
Message-ID: <0d2706c6-79fa-40fc-a24a-6d5ffbf02330@gmail.com>
Date: Thu, 13 Aug 2026 15:09:36 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Kuldeep Singh
 <kuldeep.singh@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Eric Biggers <ebiggers@kernel.org>
References: <20260731050838.158825-1-ebiggers@kernel.org>
 <a28c2903-0976-4559-b870-4de5553ba9ab@kernel.org>
 <3ba57269-3305-4d80-b3f2-aa82fa59b59d@gmail.com>
 <b9b655a9-c683-4c4e-ba0d-f98577dd2912@kernel.org>
 <20260801162900.GA2021@quark>
 <e7aeec9b-11aa-4635-bde9-fb8c7ca38260@kernel.org>
 <20260801171242.GA3567@quark>
 <CAMRc=McL5QQRk8C8zzkHm+FUj-SAVi5PLJr2pXo8eNpaxXuALg@mail.gmail.com>
 <20260811224110.GC1905@sol>
 <CAMRc=MfVqphaVsfcmUXjGmu6m+F6nJYXgAPuTVjZBwFnd48BkA@mail.gmail.com>
 <bc95e0b0-2cc5-4ad6-a319-ae4e159b92fe@gmail.com>
 <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>
Content-Language: en-US
From: Demi Marie Obenour <demiobenour@gmail.com>
Autocrypt: addr=demiobenour@gmail.com; keydata=
 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
 +MYSfkEjBz0E8CLOcAw7JIwAaeBT
In-Reply-To: <CAMRc=Mcno_F2UuLXZ3ruaVSbYhssVK90m3KM=+dwskLMSp8TXg@mail.gmail.com>

--------------iw28fzqMn9Gj0JhxTrO2tL3G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8/13/26 07:53, Bartosz Golaszewski wrote:
> On Wed, 12 Aug 2026 18:33:45 +0200, Demi Marie Obenour
> <demiobenour@gmail.com> said:
>> On 8/12/26 04:07, Bartosz Golaszewski wrote:
>>> On Wed, 12 Aug 2026 00:41:10 +0200, Eric Biggers <ebiggers@kernel.org=
> said:
>>>> On Tue, Aug 11, 2026 at 08:42:55AM -0500, Bartosz Golaszewski wrote:=

>>>>
>>>>> No, the rationale has never been this. FWIW it can be that it's use=
d for
>>>>> testing of the crypto module on a supported platform and that is al=
ready
>>>>> enough of a reason to keep it upstream.
>>>>>
>>>>> As I've said before: we don't just drop maintained drivers from lin=
ux.
>>>>
>>>> We definitely do if the drivers are not useful or appropriate for
>>>> inclusion in the kernel, though the policy varies by subsystem.  Eve=
n
>>>> just last month an entire filesystem got dropped despite someone wan=
ting
>>>> to maintain it.
>>>>
>>>
>>> I suppose you're talking about EFS? A thing that can't even be tested=
 on real
>>> hardware? This is a much more extreme case. Here you have several peo=
ple
>>> representing the vendor saying they want to keep and maintain it. I'm=
 fine
>>> having my own tree and sending PRs to Herbert if he agrees and you ar=
e of
>>> course entirely free to disregard any patches targetting it.
>>
>> Would you be okay with one of these options?
>>
>> 1. Make the stub driver as the default, with
>>    the real driver guarded by an off-by-default Kconfig option.
>>
>> 2. Keep the driver as is (with the power management issue fixed),
>>    but don't register any algorithm implementations with the crypto AP=
I.
>>
>> 3. Only register algorithm implementations with the crypto API if a
>>    non-default Kconfig option is selected.
>>
>> 4. Only register algorithm implementations with the crypto API if a
>>    non-default module parameter is selected.
>>
>> 5. Move the driver out of drivers/crypto, delete the algorithm
>>    registrations, and then add support for restricted media content
>>    decryption later.
>>
>> The last option would be my preferred one.
>>
>=20
> I actually have a slightly different spin on the stub driver. I'd like =
to
> keep the driver future-proof and avoid all kinds of needless churn when=
 we
> do get to the secure dma bufs and restricted media playback (and we wil=
l get
> there eventually :) ).
>=20
> Can we make the QCE into an MFD driver with the core binding to the DT =
node
> and handling the interconnect bandwidth, while the part handling crypto=

> algorithms becomes its cell and is moved into a separate module? This o=
ne can
> be disabled in defconfig by default and I don't even mind it being guar=
ded with
> CONFIG_EXPERT. The core module would remain in arm64 defconfig.
>=20
> With that: any future extensions providing support for more functionali=
ties of
> this IP can simply be implemented as more MFD cells while we can also k=
eep
> chipping away at the existing code and use it for testing the BAM pipe =
locking.

I'm not familiar with MFD drivers, but this sounds like the best
of both worlds.  The driver stays upstream, but anyone who doesn't
explicitly need it can ignore it.

>> Also, if Qualcomm has customers who use the QCE via the crypto API,
>> is Qualcomm aware of _why_ they made that choice?  From Eric's and
>> my perspective, that seems like a very strange decision, unless there
>> are factors that Eric and I are not aware of.
>>
>=20
> SM8650 with the QCE is FIPS 140-2 certified and apparently this makes
> a difference. Don't ask me if that makes sense, I don't claim to unders=
tand
> the legal aspects of it.

That sounds like the kind of thing that would cause someone to use
a worse implementation of cryptographic algorithms =F0=9F=99=82.

For what it is worth, many common uses of kernel cryptography can't
use the QCE.  This notably applies to the CSPRNG (/dev/urandom etc),
storage encryption, and AF_ALG.  Therefore, I expect that anyone who
needs FIPS 140 compliance with Linux needs to ensure that the software
crypto is certified, as that's what actually gets used in most cases.
>> Finally, would you be willing to have a group call to discuss this
>> at some point?  That might be a more suitable venue for this kind of
>> discussion, and could potentially lead to a conclusion faster.  Also,
>> while at least I couldn't sign any NDAs, there might be information th=
at
>> you could discuss there that you cannot post to a public mailing list.=

>=20
> Sure, I'm fine to have a call. If you think about coming to Linux Plumb=
ers this
> year, I'll be there all week and it's a good place for such a discussio=
n too.
>=20
> FYI I've only been online for a couple days this week and I'm going off=
line
> again until the end of August with the exception of August 26th when I'=
ll be
> able to chime in again. Any call would too have to happen in September =
at the
> earliest.
That's fine.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)

--------------iw28fzqMn9Gj0JhxTrO2tL3G--

--------------i894QC0fu9NisDOBnbo7myGW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmp+FnsACgkQszaHOrMp
8lMIfw/+Kqprcz6oo8QmpcPVroEZnU8mBZm1kTqPFF+gxGc26IAQJGGXHb/yrvfx
VIidixfHFA26THV6qcQsgygKHEKsJsgboUximTQZoMs3jW2PACfU43CJf+puDbsp
WeBpYme2gDmPuWONQStHDyUPX8IoIM4H3uu8I8swnmqcFbug6UJ9GHQ2aPbkxMcO
5SX9AxB9pSoMwPXrdEH5jhGNKxKzmZ6wLoA76JMBzny+/8QvYQPSuAFM/b2FXJO+
KayMYCXYIodfolW7+jt9kEv5cf33qLDzfvLMiJRjnAG8/amEMTnAHjgCh3w3DqlO
2Mh+RY6W495XGMU4zTHbZxUENPhd0FB4hs7ZeelA2sHtMjr6/Rc1uEbWFmLSJAmH
DtX9atgq4cU311LpqAEVxCeGQl9K/Xstvk44ke9p4xDjLM8PVmkt/dBHW5YoCScF
lCKkyVfVlE+BIIPu6LYs6HMzl10QxI1bDDol5EjUYJDwu5b0phMgrKykxAbz6/Qf
lQJBbNb6fHX8WAPm9zZN0+GyXARuQrv3zZn3tU8R0S9w5/GvMF/kT1SX999coXmQ
V/yjzkxwJEaiXq7xb7ulNcR0l+61LMq8daThzyyDLcc0hqMyLTAbYygRiHxNs6Hl
xdnpw7Zn8UPo4BZ+UkLlVG74V0U4gYzsGLlNcD23vAsfnaI3RTQ=
=Of7Y
-----END PGP SIGNATURE-----

--------------i894QC0fu9NisDOBnbo7myGW--

