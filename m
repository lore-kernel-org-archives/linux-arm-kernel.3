Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B894CD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=; b=W0pn5TZUvgAHKH6/R8Yi4/iS59
	YCV9ZkrwdmjwVJcnQJ+nzQ67/oQn3BuJKYY0IJN3SKfKnMk9WCHfKeKAkUL0vx9ru1iQHLb+nnD02
	4IxFZkNh4M94E4s0mVr0D2O30MT59mTbv94Wfm9CjGLRBDtIJRup3F3GpIOt3oUmoSPCkMmLFqriw
	qZM7ksGEYOtOAVZqrgDLhzf9BAb+jfVpyCaKdRqaEjYjYkva1xSTofhpHHQWDwZyxcE+lrQW3yo21
	gNnd7+F6zuaIx7jZdxeACGLC3BeUEph40bDxoAcBUN0Db+FDyTlQhmg3BMK9Dd4ad5msu64fOBSfK
	6WNIT4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRgP-0000000GpLO-3GVO;
	Mon, 25 May 2026 09:33:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRgN-0000000GpKu-2P4Y
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 25 May 2026 09:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=; b=IaoUAzEuGf061FNQLytpiF2Her
	6sP9bXsRtifUvyyEGqUA9QdFZ9AzIE/ComDr2Xu+3utBxl5yn8yzX9A3zQ0nYPEhrmq32GtefSL34
	JdeM/2dzyK6qUtoPHY3tNH4wVup7EcuR/FBgBAZe2P5hKroblbZ6HCEk2E6WVkqVI+AT6Kg84b24U
	+4mQ/JjbYAbSjHMkBdxuBmXw2TPIYpfzDrb+dRUbY8bUCpV3B6ZcdTr+l9V9h6EwTuoxGTJYWBRG5
	GvxCQWOH3atFlRzQH3uoX8533VchTmIHG254x/1XLJdq/IxS80GP32PsSbTQMySqVGWWQJ+c1m6N+
	xKUrGgPQ==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRgK-00000008ueH-1BiJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:33:10 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45e7c636e74so4922418f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779701586; x=1780306386; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=MislluTCawTtaxdj5TuMUsGtsH3X20v2YcSRE1XE0rJJ0/wSMKyB5BkycRxKwqd0IB
         Cg2pAelB2W6ta5EIfyFdK8WO+dxNz4gk2W6tf3v7crol2lsfNhiyvhhbW4Sd9VdKp++m
         O2Nq3O9+4jjz5lZvNEgBBZl+GLohImEp2Stoki0II8fMG4sAecS8oo5zHiXEklLzCHfI
         cntdvsmzzPJcMrKhMVPn6GpWHBo+tv5KE1mFLFbeYxHyPm3lOZZH2h9qTWzE8/PkWcxK
         SMz2Nw/h288Xe2k6u+2L3D9xhrkFTC3xOkyJIsZST4/74hzKq6toXoptIbhPyhV5XcpN
         7efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701586; x=1780306386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DoERE+8L5vLj1dPanKPuhfMBdwOHVvuHRasN+h+wvto=;
        b=DPnM25jp0v9xpcwUBLPWdrVcfAQGnCHf1veo7sdrP8/VTsWvjIEJhH/IaT7/G6wWgc
         1fONRnBD9cJIi8fDqIGzBvK1wL3ScsOlzS6j92oSWKMC/mIIx8E64SgPG0KmTyPfPa9Z
         EhqcMFh86jozIKCgxWduaNAPC1ER3sQnPwjTZ1fCfh8+IghOvJCDBKS8hD9Xrg5EwEnS
         RSUyGmBJipqB+oADPewdsL9/i4T5Wfl1qOc0CuNIgEZbN5XMN1j7EzJyz+1xIgcwHd+Z
         hp1UUR9wAb/59GAmqhfDzQ796Vg9OaUlkVcwn+V7u61n+m+p3xDpTeUK1ukkA0y1+6MN
         XZYQ==
X-Forwarded-Encrypted: i=1; AFNElJ+n5CJnxSfHX59OoOy4A8OPQi05n/v5lfz2Gki9SbvMGrXjfvWA+TJ13P1xo00i1Z6dtPkT5k39sHESaRtWz5hz@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2LhnSWo2miMwanGc3MJg2VMhq/PH8+pHZ6rGHiiotqOouJ2C+
	hDK4jYzo997H/FjV7d2001u3l92w08gD9+cfd94nG/wJI1qzxbK4HdXM
X-Gm-Gg: Acq92OEwuv9XZNg/cBbRPMzrlCjm8TuKy8VX8/+ffST6Ou440sc+AnnfXlAztJDSiL7
	eCTO0sTOvY7pc+RsDuvN81918lrojhFcL8hDZSptBQhb/WnM+v4K8z4dHcikwkZaPZUosOkj36J
	tPq5CxftkwbDaY00AQP/ra/HUfkxkODdO0aw13PFDegt1RSaaWnED1+U9QiI7aAy8YhmYt0qo7s
	tD6jiFxHzJ6dg3OCSb2EX8fhPqqjsbExsp+J8EB9ha4y6qpqmPPYV+52ymTgDRaQ/TjPRr3OQXf
	HXjINxJ1r8tMPuCaPuP/zidX3gE3X7ThzcfuhFME7+b1eIzD0UFXXZkMGcje/HiDI5bMZkPhnAU
	WFsUl13YYxpLCP85WvJJZflRJ1IptOd0g8sVn2mA3tw2rPCSJgfJokQ3/cjpJimQrxLMsG++k1J
	xMmy7M1SOvoB9C2KmTy9T/G8L75+0S1GcxYt5/mHNDxAE3BMHg2fAY+Yn/
X-Received: by 2002:a05:600c:8484:b0:490:3c94:a3c6 with SMTP id 5b1f17b1804b1-490428e205cmr231028375e9.26.1779701586132;
        Mon, 25 May 2026 02:33:06 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904333146bsm135468715e9.0.2026.05.25.02.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 02:33:05 -0700 (PDT)
Message-ID: <3c2bc7b9-33e8-4840-af41-ce6e7308ae2f@gmail.com>
Date: Mon, 25 May 2026 02:33:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7
 node to SoC DTSI
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-4-laurentiumihalcea111@gmail.com>
 <ahOwvnij7Fwxh3La@shlinux89>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <ahOwvnij7Fwxh3La@shlinux89>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_103308_756385_4B3E21FE 
X-CRM114-Status: GOOD (  16.86  )
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



On 5/24/2026 7:15 PM, Peng Fan wrote:
> On Fri, May 22, 2026 at 04:18:47AM -0700, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The CM7 remoteproc configuration is common to multiple MX95-based
>> platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
>> Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
>> channels using <>.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>> .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
>> arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
>> 2 files changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> index 7d760470201f..c94a63a3bf8f 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
>> @@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
>> 		startup-delay-us = <2000>;
>> 	};
>>
>> -	remoteproc-cm7 {
>> -		compatible = "fsl,imx95-cm7";
>> -		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
>> -		mbox-names = "tx", "rx", "rxdb";
>> -		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> -				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> -	};
>> -
>> 	reserved-memory {
>> 		#address-cells = <2>;
>> 		#size-cells = <2>;
>> @@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
>> 	};
>> };
>>
>> +&cm7 {
>> +	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	status = "okay";
>> +};
>> +
>> /* SMARC GBE0 */
>> &enetc_port0 {
>> 	pinctrl-names = "default";
>> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> index 3e35c956a4d7..f8760ac067fa 100644
>> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> @@ -272,6 +272,13 @@ opp-1000000000 {
>> 		};
>> 	};
>>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
>> +		mbox-names = "tx", "rx", "rxdb";
> 
> Please not put mboxes and mbox-names in dtsi. Some demos may not
> require them and boards may use different MUs.
> 
> Regards
> Peng
> 

Not going to insist on this.
Frank Li, are you ok with dropping this patch and handling this at board/SoM level?


