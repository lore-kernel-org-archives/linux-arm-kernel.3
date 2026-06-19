Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4ACECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGhiVMwPkreKp0vHZtTTCkMwKPr/e26nfYjRzDJCX+8=; b=b9Oi/ZR94zfNuwU11VNEkg8pBr
	xbdz7t8yAtSebaGwwmkKTY1Qxs92JXapbJDCcGJBUzRK3rYZNg4vpBr+IPCufylSUlErvw+TuzPHs
	gW0oYT7r5ezGnU2kP3PIROZe3HDK5pKpfieow00PGbRX6hEspFBdSIVCEQnLhikxWQFtmglCNyVf1
	81OjVRj08yL1luEyREzAUvdiEVkmn7zZbuEx56EBjQhB2NUvBHeD/og2nJqCjEMCp4YqWOcjvJalO
	iP6gbZTIMDmG3c+k1A69b727AYJlcSaSB0rkfzmXNJMN3B1DnPY8IaNFeXUqdOZbRKZTIAwQjlqFY
	uXpYEjsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZg8-00000002VbN-3gZJ;
	Fri, 19 Jun 2026 13:54:40 +0000
Received: from fout-a6-smtp.messagingengine.com ([103.168.172.149])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waZg6-00000002Vaz-0qqr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 13:54:39 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A892DEC02DA;
	Fri, 19 Jun 2026 09:54:36 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 19 Jun 2026 09:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781877276;
	 x=1781963676; bh=fGhiVMwPkreKp0vHZtTTCkMwKPr/e26nfYjRzDJCX+8=; b=
	X/Xb0wZeFaM0bGpYpDvP8pANEC2yjPKnVlSUr9ZgEgfo830lYuQBlPc6mGy16c+b
	cilFtsdbYMh+KWTyasxrnwds6iVmOD41cvdWsMs2N61RgxuxaeKz097Bsq3ZRpxQ
	wlTgKuSQMMC13oD4g99LI7G5pPYpB5UObLVvMG0Ir/zhiPIKTc72ASdVoBV9zr/3
	qVn9SITEluBt3CcunzDMfKoX21EW5ZQFFZ/Os4J8tSNDvULGcYGUPn2DgJEOMjms
	v/Nb79rNu+6cUPrYXC1Zss9Muo5Rer3nhxnaKh0LVKsEu5wDjhWqXt4ifQWQyTjI
	vgI9YVgh/XUZM4kuWCc0dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781877276; x=
	1781963676; bh=fGhiVMwPkreKp0vHZtTTCkMwKPr/e26nfYjRzDJCX+8=; b=S
	CAYL4Cx+YVlyZleyr1bqqCCzpLzx42CRoZgnq2C6k1MOSmVZc4toOD/v4XSbQRVP
	yn2v2ol8BTTuewgKl5FLLf4hqwM8sW3GO0GPJxO1gOAK1SN5xOuN8i2nBYDuA3It
	V3qkcDU1t56PUlG4d4bQkP57M+ICYz6miKH/D/NUIV4kYspN/fcEELrxd/QZ4kf4
	yrjCRJ2iTH6jo6p9Zx/OIsf0DxBpST02jrsllXyBonMwIG1VE5wup78TUQAiOPhd
	0qY6n3eM1uTg4ShqOpsmWKc9cspiKMotXN/Hw/6dxtGUE/RWSS7lqCkM4IjTUz7a
	CxBPsG/ObM7TTD8Bvl1RQ==
X-ME-Sender: <xms:G0o1aoYysvl-fdnI-BXvdvagZEaqODokYW7Y1xV_5kZnARpQ7tN1vw>
    <xme:G0o1auO6Wg0GCnV2GKK3XxLmXszdPhwIG83cp0eUv3c1HnSp5Za2ZoyLGEDCfKY0c
    Yfe7IvX15_Ylzpb_0tMPSH1ZvIgNhHFPFY3K9L3LMCR1naz9fltXXk>
X-ME-Proxy-Cause: dmFkZTEME0i7hFkUzbVaA8Blwt5lFCClrIVHk96pidkFC9CoLs+NZJibpKcjbdNBA/GqX8
    OHotBRwN4B+uk6gSRtG+lr75wy4a+ISIQwYbSV/CmUPmE+2mpxozY6dZmXz/gERBe103Do
    7+iYxl+TaJCGq0xHkKbuwM5nVV8WfGGE0KKSi1f5fNL1pgTP27kyDx5j63funhXxCCjvaK
    V1enqJePl7rsfllgQ9spD886+NhEoX66pi/pIWtKFWKNKJQfHvvPSg1NrKc0qqSDSd+XoN
    lvr6nqNjvbwteNjhLvaOhJ6szLcVXiA15ZIpT6RcNIBa3kzt5pz+HG3EOqK0HosibjZ1Py
    oswmHTM7d7SEXsMQaCPrj1M/c2V0hy1ehtY8WHPF3NwtnWBaDJIdNsrTcNyqxsESLr2ygn
    QAKne8sW2HU5WzygNyHY25puYkS1iXkaK1V1WfSaYwJYBl6CZgtvgJcpSmDY0CexOykhk0
    wwHADwhoLi+09pnKWjwA2lG2grCL6GasZ7CWbz95S+jXVxA2fWT26WnFLFzv9dNXJD3wqt
    3HodDyNM9nfYq9x4cIL6O3rO9a2QSBXK49vdy/OcAG7rvCYHPLbCJW0GuQVuxm8cK6an/A
    1atTaIworsTj5eEpJcx1Lvs+5yNUgRktkdmyvyXkpCH4Tc/NaXXcbqPBvz5A
X-ME-Proxy: <xmx:G0o1aqliEpSFMCeC89Vs9PfUKGS42VFMY4zD2oKDMjgtbTJ2sngMFQ>
    <xmx:HEo1agFevHRJyitLqWnp2jlpQQ-zLSZbIiVhu47qb3NVzMDrRNaiOQ>
    <xmx:HEo1ah8w42448NXmDmaNiwzo5cSfFStKqN5hzjX8j1XshJ_8y65lWw>
    <xmx:HEo1ahkqcIlzM-ywGLrKFHohqI7tOpaHjG-L3HoXCPO3MVuNticokQ>
    <xmx:HEo1ahoV06yv9yBqHeyXpjBFZxRFT2-iOLIOagdnfxLjelKQsweA3FVP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF18E182007E; Fri, 19 Jun 2026 09:54:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A94YXJhgp2v7
Date: Fri, 19 Jun 2026 15:54:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 soc@lists.linux.dev
Message-Id: <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
In-Reply-To: <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
 <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
 <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_065438_313001_C153959E 
X-CRM114-Status: UNSURE (   9.94  )
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

On Fri, Jun 19, 2026, at 15:11, Krzysztof Kozlowski wrote:
> On 19/06/2026 12:12, Geert Uytterhoeven wrote:
>>> +# CONFIG_NET_VENDOR_ACTIONS is not set
>>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
>>> +# CONFIG_NET_VENDOR_AGERE is not set
>>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
>>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
>> 
>> [...]
>> 
>> I am not sure this new policy is a good idea: none of this affects
>
> I would not call it new policy. Just an idea which got accepted. :)

I think when we originally added the CONFIG_NET_VENDOR_xxx symbols,
the idea would be that we would one day change them to
default-disabled, but that never happened, and generally causes
more problems than it solves.

      Arnd

