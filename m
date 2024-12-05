Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD54E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U+QytUt8PTvOxkZ/ABlAQSs8VdfmBTQBBIgoS0hwZ7E=; b=skasz46XCJ9EgccTqF2vW1NyFa
	5cgjQaWMkj04Gf21B0sR3duZndMvPY8CiY3vbQnz00QHeQsA7mGXM3BUjbPcJhJu7PukJcGlPQG27
	HhH6GsnniUa4pqyhj4VgAiGU3+2ElwTwqNCx6I+Fp5OLG5pYjETxFgwBFq7662R2oygjkScY/xRVh
	WITd664Ih+Kp3Sx6wU/m5AUFKa4XaNlcoJdOw9I0vC53otfoo3lQ4OMvKXqLrcAr3fPFcdzaAupMH
	qJ31dkEUakLJfPItZySYuDRkbcnu8OcZTnuLN2MMpm4ciTly9dmoYjx1bSGhQmke6KQBUEYPQ1mn7
	qkXFDRNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8S3-0000000FPi9-2diz;
	Thu, 05 Dec 2024 09:47:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8R2-0000000FPTm-2dY4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Dec 2024 09:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=U+QytUt8PTvOxkZ/ABlAQSs8VdfmBTQBBIgoS0hwZ7E=; b=qzZdZE/mjaylrGhDShCMexHcYU
	g60PQiiX6XNRsKLDkCEjVBbK3HUbyb5gIQgJ9xV0zzRKkno9jNrdpaXZ1rBm0wJp7pexpDndvpys9
	1gAvDrD2AQrNhimRm6nRXlszq/2Fhw7p7OB5b/uiIE6Q0BRDNL9+88/KH4jjexILQq2HTXCj+CfBV
	pQIIxhcADfOZAEdpODCTXGF8mJOCCS6rPrWyiG90nXlF4PENL/ulwCSzyOmDlP4DSadlJt4DfD1pS
	EUirHRDxQ68srjIa+p9UGvZHfXcFzGFnZM1L52zoyLH/g4/36CR4JjtH2RTWeeBfSoirshdCF8Zwy
	CXZLp3rw==;
Received: from cpanel.siel.si ([46.19.9.99])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8Qy-00000002obe-4Axp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 09:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=U+QytUt8PTvOxkZ/ABlAQSs8VdfmBTQBBIgoS0hwZ7E=; b=DYEl09ls8FgLNuxmVJjf1XI5Qj
	2EuSWMBu5Y9MPRcZWHbecaH97HQQo4NhkfidSiFIL+ptbzpYpLLTQufPhdo/7ITzD+SRvkfr9g5LP
	SyFiJFy+r9YHZuOcO3y5bptmvnsrvExwuJmO2YWsQPGOKf1a3f9mOq0QBytJoBbfgO+DhoyMGlp00
	8P3EZo+c+kfAixpSUk0v3tMDpTVOThx9fu3bzPu27/ShF0qy8diGyfCKNN55U0U+Ae2fYeP3nhkyu
	W0euaUPR3bJFi+1ztAg8LgPl6uTCk8Yfu7GRu1TEBZjyWe8v7+B4O+7ss+WYVrk1k95OKww6b70zb
	KG5EWFSQ==;
Received: from [89.212.21.243] (port=35824 helo=[192.168.69.52])
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1tJ8Qh-0015nQ-0b;
	Thu, 05 Dec 2024 10:45:50 +0100
Message-ID: <be973fe9-ac7a-4904-923e-93f87c9ff615@norik.com>
Date: Thu, 5 Dec 2024 10:45:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: drm/bridge: ti-sn65dsi83: Add
 properties for ti,lvds-vod-swing
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 upstream@lists.phytec.de
References: <20241203110054.2506123-1-andrej.picej@norik.com>
 <20241203110054.2506123-2-andrej.picej@norik.com>
 <vgg3bygtmj6sotatddkqfapset5bofsqvkzuj7ejuvomn6hs3n@mscq2jbhtaux>
Content-Language: en-US
From: Andrej Picej <andrej.picej@norik.com>
Autocrypt: addr=andrej.picej@norik.com; keydata=
 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
 xtT/8OxBOVSHvA==
In-Reply-To: <vgg3bygtmj6sotatddkqfapset5bofsqvkzuj7ejuvomn6hs3n@mscq2jbhtaux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_094609_295711_BEB3FD25 
X-CRM114-Status: GOOD (  13.76  )
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

Hi Krzysztof,

On 4. 12. 24 08:54, Krzysztof Kozlowski wrote:
> On Tue, Dec 03, 2024 at 12:00:52PM +0100, Andrej Picej wrote:
>> Add properties which can be used to specify LVDS differential output
>> voltage. Since this also depends on near-end signal termination also
>> include property which sets this. LVDS differential output voltage is
>> specified with an array (min, max), which should match the one from
>> connected device.
>>
>> Signed-off-by: Andrej Picej <andrej.picej@norik.com>
>> ---
>> Changes in v3:
>> - no change
> 
> 
> One version of patchset per 24h.

understood.

> 
>> Changes in v2:
>> - move LVDS port schema to a $defs and reference it from there
>> - properties are now defined in microvolts/ohms
>> - use 1 property for data-lane and 1 for clock-lane LVDS voltage swing
>> - add 1 property which sets LVDS near-end termination
>> - since major change was done change the authorship to myself
>> ---
>>   .../bindings/display/bridge/ti,sn65dsi83.yaml | 36 +++++++++++++++++--
>>   1 file changed, 33 insertions(+), 3 deletions(-)
> 
> ...
> 
>>   allOf:
>>     - if:
>>         properties:
>> @@ -120,7 +150,7 @@ allOf:
>>             properties:
>>               port@1: false
>>   
>> -additionalProperties: false
>> +additionalProperties: true
> 
> This cannot be true. Not explained in commit msg and this is not shared
> schema.

You are right. Will remove it in next iteration.

Best regards,
Andrej

> 
>>   
>>   examples:
>>     - |
>> -- 
>> 2.34.1
>>

