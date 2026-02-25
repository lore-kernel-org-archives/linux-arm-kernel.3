Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1042AFCEE8E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 11:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0OQnEeU5Q+WwKOM0afwTTmeLdjh3sD9aEF0/WZ5DEc=; b=xtK+IM8lUV/3ofCHxrewIUTAym
	Wve9btxb+q6nRFKUkBjrOudbSSkxrFT4SIjXImWip/j0FPI8l+veuHXmD0if7qpq1DvQmgtipXRHb
	hiR+rNa0tEjjjUlvUEnxxt3qgK5zwvcau7J7K8VXDmAXlU7gYHrFyBeloEWbNNHV37EJX1E04+5Bw
	PQbTtyJ+cbsSIjlNB0R16Wbzyfpcst6kz3PayGQ0+eBQFXjqrCscl8yY96OAUcfl0T4A2ikKfSXlM
	hMif6LxawUD1/xhb+t1mybt8rQ/IPPuFyvkwTVRuJcT0sVQss8lc0K0r9OU8YAxs+ELnMMYy8Q5oc
	DS4rBpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDHT-00000003vtY-385a;
	Wed, 25 Feb 2026 11:42:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvDHQ-00000003vt2-38Eg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 11:42:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TBxc2365339
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 11:42:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0OQnEeU5Q+WwKOM0afwTTmeLdjh3sD9aEF0/WZ5DEc=; b=Z1ocSeFSSKfx9CKk
	Z7W7lxxpWsPTa1SXmVzYfh9Tc9OUamekzIOGJdCotWmggY2LGihUWpDGwbDa2R8q
	J+9PUy1yXQAuSOE9iOov3bPcrZCcYVH12zqUWzDCv2wL6F8aFQOYsIpm6vJusyRA
	lrHqP0uFLgRlvyAcbDKYMkJxVqvx3ROIFUamKt5LYKbK345laD93SRgbiqTYPkYt
	Op8U2WylGH8jo9kWQVmJRXTA4rPcyDUvOcCtvDrpT153YNiK4TeP95SO2uNmfzkU
	sNZ6/4wdA378RPxsfvHPImn1K3UxlOLDmMoyvZXnawuLmf3SBHzQBERmdVaU3QIr
	sbmFIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cherjbdjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 11:42:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso5811026385a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 03:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772019731; x=1772624531; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=M0OQnEeU5Q+WwKOM0afwTTmeLdjh3sD9aEF0/WZ5DEc=;
        b=c5Kz9T3ZvDX14gcMmuj//GV1Pz4k9IGgH7d5Xi2bOMgTb/jub/6DIlWEku90z0y5/R
         D02PCL4x3dTdgOJEeEz2srtlQ+CftVxbvOxMer50lkj/IHcu/Fy6PaRn1IWibnR9O2SN
         i2x9kbkoW5Y/wJMWRd+/kiFRUB5vxyruIahQ9WiDGHN/w1fgx1qPBX0RR4Q3Qqp8a/NI
         hqtlnD5jheuIzQPt9vNe5XNJ5kP6LXuOhKWi+HXu1jWQZLKCjCsNpXLLXGA2jsQ5Cm67
         5tV0BKjVc8Np8wWeaxLdMo7Xx+tRLInrCnoB3jHeLbuZzHIxPdPtFlL1ww+cmKvugorZ
         Pr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772019731; x=1772624531;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0OQnEeU5Q+WwKOM0afwTTmeLdjh3sD9aEF0/WZ5DEc=;
        b=W8EIrqsbeHzhkV7PYdmMlEMthetGSCQgfe/CtUUEL4vQSqBIGlyStwAZ18oz/P+ORF
         9MjIkQ45ebvhSmvO2Lo6xHdUCT095WtyD3RouaXJlT2G2Vk22Fi+vWmZq6XL6KQtudXm
         N/mo2fpYfXqHheKx2oQ3mQtt/dsDCSB7K6LoeB7/F4ea21/d3Ec7djcT+FvlloAGeaK1
         htYTo3oGwCUUfgGnh3l48wT51+8otT/qL7Ie5GRFs7ir5UIQAnXozCV7EnFxmt4aY8K8
         JwqtfSCtyjsLYt8gNOMRxJwAsbCioqzks4jvlDRUTJkv7mNE08raMgNxNGACz63FX5Bg
         GDfA==
X-Forwarded-Encrypted: i=1; AJvYcCUcV55oYRMt4rQHgL4tNfUEdCoIkhKnq161QOYghCaFCT3j1Vj+59LP+Ns/r/eUoPGCUsriQRenivDeyHFTkvA4@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwmkd5S5gBGKmdgd1Uff3U2DpjtWgWyplzj80hAIzWw2kG00Wv
	5/qHvFL1d8m1BwwfiAbseb0qiWKtBcOjo7a2qEKLGZjDSFHAY8EJRIGkyfV54VMKBeWIwrkbtXR
	bsXIZFX0XM09+4dhmrelyzwPhgGR2aj9vBwJZGsb+u+SFMNwHk69/uc8pR42MzWU5JouxvTeMur
	vWrA==
X-Gm-Gg: ATEYQzwh5EB/1Wm6apmVDjWjwnMFxi/8YlJcA5VsiQin9jOC3qS26cfDezRhjXYmE9d
	6t9dS05LgWZMN6NZFfbbGyBIzsb0LpOw3+xhVxCluB+k+LueSXLrnGu+0aGWjSQuK53/h/0lMZ3
	talqA6g/pXm2LzlfkBy01C+2VuSPBzUDr2ukUcKADO7wXo3LxiFC3zLqNYbvHC0uSCFVJCAQ0OS
	i2ad7KSvmZ5mDqXClX18+BziN1e0+63Ebt02fNU1/e4MnvZctaLybPSi+5I7EwdzCEULeKVox7u
	k7e8YfMK43qvtjQwXrWzV+kRuLozbgrAQn3sl0s0CILx+K3viUlWM4u9jngf1L8uSm4472MBmf2
	J+hcJB1gcQ5x5FZxnPdomOaYBJKs3TXaRxBoScU9HuKg//6CFkQ==
X-Received: by 2002:a05:620a:4094:b0:8b2:eea5:32f8 with SMTP id af79cd13be357-8cb8ca0d5cemr2179429285a.34.1772019730886;
        Wed, 25 Feb 2026 03:42:10 -0800 (PST)
X-Received: by 2002:a05:620a:4094:b0:8b2:eea5:32f8 with SMTP id af79cd13be357-8cb8ca0d5cemr2179425985a.34.1772019730386;
        Wed, 25 Feb 2026 03:42:10 -0800 (PST)
Received: from [192.168.1.29] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439934cc51csm1432467f8f.3.2026.02.25.03.42.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 03:42:09 -0800 (PST)
Message-ID: <b4c42f88-80fb-488b-9ca5-95f5795fd2f8@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 12:42:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Drop fake 'const' on scmi_handle
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        stable@vger.kernel.org
References: <20260224-handle-not-const-v1-0-90bf93b53e27@oss.qualcomm.com>
 <aZ2aBD_u_RVhgsei@pluto>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aZ2aBD_u_RVhgsei@pluto>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDExNCBTYWx0ZWRfX1mHZtTkIuG1k
 4A1VmlcxSPzD4qEEDY6yqcz/ubppJlYjbv16skxW41wSwFEMnaQABMWoOSuoDk7Q8yzqeucLrlB
 xnsiovvV40lDq+45Q2fLM14Ff21EpTtOu+2Kxb0qMv0mRq1q/kXXEUD0b92lo71q/cH6h0Pk26r
 kZfVv+x7g2cHB4QwmQRvOqxJsX8x9boCb8BFr+kcoEgsII4GjD2XfDysyBLEk1bCZb2vrisxh5z
 kp3kr7yLnMtD0yWbUsi47dtuFwkxXEcH4AY3Fu5IOoOqNaHcRVYZkd0IMuLvoN/7dfJv2St6Rjb
 R8JfcMPy8ykKFQ/XJi36tgFgZDwM6+IIMgz814R51vaUNOc2o4sZYxRa7JgQyoTbgnuvh53QU/x
 Uq+kngY8oYsXDWpx1/EkTGAZ03pZo5S7qmlqbE29XsPO6yGmfpKvwZ00uR66VRndetztaB/KpZQ
 FBIHrsuqNqtpK2fj5Ww==
X-Proofpoint-GUID: RK9dHvfqDuE5R2BIpVKJyT31UH3expF6
X-Proofpoint-ORIG-GUID: RK9dHvfqDuE5R2BIpVKJyT31UH3expF6
X-Authority-Analysis: v=2.4 cv=NeDrFmD4 c=1 sm=1 tr=0 ts=699ee014 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=zDAgSCSiOJkZ-3sd130A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_034213_689659_B0E54C51 
X-CRM114-Status: GOOD (  39.24  )
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

On 24/02/2026 13:31, Cristian Marussi wrote:
> On Tue, Feb 24, 2026 at 11:43:38AM +0100, Krzysztof Kozlowski wrote:
>> Severale functions operating on the 'handle' pointer, like
> 
> Hi Krzysztof,
> 
>> scmi_handle_put() or scmi_xfer_raw_get(), are claiming it is a pointer
>> to const thus they should not modify the handle.  In fact that's a false
>> statement, because first thing these functions do is drop the cast to
>> const with container_of:
> 
> Thanks for this first of all...
> 
> ...but :D
> 
> ... the SCMI stack attempts to follow a sort of layered design, so roughly
> we have transport, core, protocols and finally SCMI Drivers.
> 
> Each of these layers has its own responsabilities and the aim was to
> enforce some sort of isolation between these layers, OR even between
> different disjoint features within the same layer, if it made sense,
> like with the notification subsystem within the core...
> 
> Now, given that all of the above must be attained using our beloved C
> language, such attempt to enforce isolation between such 'islands' with
> different responsibilities is based on:
> 
>  - fully opaque pointers/handles...like the ph protocol handels within
>    SCMI drivers...best way to do it..if you cannot even peek into an
>    object you certainly cannot mess with it...
> 
>  - some 'constification' when passing around some nonm-opaque references
>    across such boundaries
> 
> So, when you say that some of these functions sports a fake const
> reference, is certainly true to some extent, BUT you miss the fact that
> usually the const is meant to stop the CALLER from messing freely with
> the handle and instead enforce the usage of a dedicated helper that sits
> in another layer...

The caller can mess with the handle, because of container_of() cast, so
there is nothing stopping it. I understand you want to express that
handle is somehow unchangeable but then as you mentioned - it should be
opaque pointer.

> 
> As an example, when you say that the scmi_protocol_handle *ph is indeed
> manipulated by scmi_protocol_set_priv() and so it is NOT const, you are
> certainly right, BUT the above function and the protocol handle itself
> lives in the core, a different layer from the protocols, and indeed the
> protocol_init function cannot change directly the protocol priv value
> but instead has to pass through the helper ph->set_priv() which is the
> only helper that can touch the ph content...
> ...IOW you are forced to respect the isolation boundary (as much as
> possible) by the constification of ph...if you drop the const in the
> protocol_init protoypes you end opening the stack to all sort of
> cross-boundary manipulations annd hacks: helpers like set_priv were
> added to be able to manipulate the bits that needed to be modifiable
> while maintaining separation of resposibilities between latyers.
> 
> Similarly for notifications, they are kept isolated as much as possible
> from the core.

I understand the goal this code tried to achieve. And it did achieve
it... plus another goal of having "const" like functions modifying
memory. This is not a readable code. Function which receives only
arguments as values and pointers to const is expected to not modify
state of received pointed data. But all the functions here, because of
the cast, can or even do modify.

I understand we do not write here C++ const methods, obviously. But all
these functions look re-entrant from the interface point of view but in
fact are not re-entrant.


> 
> So, I still have definitely to properly go through all of your
> series, but while the usage of container_of_const() is certainly a
> welcome addition, because it raises the isolation factor, dropping the
> 'fake' const seems to me a step back in the enforcement of isolation
> boundaries between different layers or different subsystems within the
> same layer.
> 
> IOW, the last that we want is to be able to freely change the content
> of such const handles from outside the 'island' they live in...

If I understood correctly the composition here:

The handle should be in such case be not contained in the upper
structure, but be a pointer to const like:

struct scmi_protocol_instance {
	...
-	struct scmi_protocol_handle     ph;
+	const struct scmi_protocol_handle     *ph;
}

And since this is 1-to-1 relationship, the scmi_protocol_handle should
have a pointer to scmi_protocol_instance. This way you keep passing
pointer to const handle without ever needing to cast it.

The current solution would be much nicer than above, if the code was not
dropping const, IMO.

> 
> Any improvement on such isolation with more modern C tricks, if
> possible, is pretty much welcome, i.e. I am not saying that the current
> system is perfect and not improvable...but just dropping all of this in
> name of some better possible compilation optimization seems not worth in
> terms of maintainability...
> 
> Does any of the above blabbing of mine makes sense :P ?
> 
Best regards,
Krzysztof

