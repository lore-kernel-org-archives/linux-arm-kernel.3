Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E61D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 16:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=; b=XS47vMdnrYgIzdGuGsZBaWluVo
	LSXqTjvqY64JQ1x7HnOTofKLJV2OI1Zir73toMZ713p4YG4CGx9vxJ4ScVHkz/8vxp35AI1db8yPC
	l2zzuBYL3aM2h86VXdZq7gwoFhGbefkeE2BiOZdCzy6UVqGO6QCdx1t3Ed+nvon+S9Ai2C52uEk0D
	33rNAh9Gor1/tzCtKkO4qOvZFt6tEkzKVS7bl1IJTDnBK7htVmAVHtjKT1WfU8YK/SqqErcIyYlO+
	A0ojiJpuyds3J9EhdbWFi57KiishA7P+wdFYFsXmZCTsT8Uhijs1MVYU6TN9aZ6S1Wn0AqPy4CWwt
	J5UehiWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF5Z-00000002Yk0-3VGF;
	Fri, 09 Jan 2026 16:11:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veF5X-00000002Yjg-3IXF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 16:11:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6098XOSb822825
	for <linux-arm-kernel@lists.infradead.org>; Fri, 9 Jan 2026 16:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=; b=LHHNohgL+h8Dn5BK
	Ux0iUHBCy+yQettxBalskTQBCp9f7oc/8kKry1xzZZAg/e3HaDlMuSC1eH0k2mZv
	NLdHhuDM1ICNanc+q02wF5T1l+Usdnj2MdK6MQcHS/Q6VnnEnRDvaDV6wLA1lldb
	ypeirGKyy1Zqh1J3qSsREe8bJxe+iRebKpO4DmkFW42xoHb2T+QTHt7djRdBeZAh
	IXE7Efyg03dJBZQscswdBQASgMnfVelmSNrC5zcGzHVIOCrAv3T9OzC5IzQ6vcow
	4X/1XN8dGT+CnXNDgHwnRIaTBslEI1RnXfBK8h1plNlHnK+Yg27Rb4uX6AveXiZ7
	cB4S0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjx94hby6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 16:11:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b2de6600c0so1113438085a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 08:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767975106; x=1768579906; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=YMiKNQmGZJwmuf7xXF/TJljNoLVhzDN95Z2jtqbZ2JNhbL2GhGSipABbvlsMiQEUvh
         J2y7L2nG69HMuTllSaKC9JQfGFXxOSsJhNkIH4MPqOWRKgN1rVyop9xYVTnnM55SGmjT
         1xKPramb3svcfrSjLJf71rb8LPF0u80upzcF8b/bbUf+F9kirnV2q08rPH/j0RWJAx9i
         I2LZ+JWjqHMtHLnwsPwZABfHGaTICv42xT8i7h/K6V7hha7ZLFCdOEjn/vmLSRFPAyPp
         I9z9N9YUia953AqHA96YnHjNWuodYbsNfoe+YvAk0sfNUXN6CEqRTWHf3LxyzXFWrESk
         neSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767975106; x=1768579906;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y0F3msY51CEG685pZ5Vd9mM1nAPXE1h7mU6gkqrwSxw=;
        b=kwqUm2xVzD1AQMe0cZ7pZNFLvISn1Z8VbAkDSXb8cD2iZYd3GmYv+kW9f9miZk8GnE
         Ccaho1jgw651VSx2Zsdrhq6BkkIWohH5Z+HC1vM/OqxBIqyc3k48RSIAzmZec1QqI/bS
         wvOTpLflImw+cgtRZYgvU/aBLBmGPypTdVZUJx+WH8LFwUJL6R4cBuirgEA7yc6axC/r
         +UqV8UznVD4uDSH7HzrG8OUmFPka+6mrVSrtSdFKa0ynpJ0VLrLl1PNL3hvlva7sy/Eb
         jIlTRzMV9sbmn60rq3EYxecKwIt2gaLLsnthevarfc8QsbgwCMsrr2gpk1vXxe6QvFSq
         4esg==
X-Forwarded-Encrypted: i=1; AJvYcCXCks6Yms0UXNB+AaNjx1UfgxYKoSWmtmTgRez7P/4FtXIbAxS9AYuLQsbYjL8IZFrt4gLrZNLHiIVHRIp4iM7k@lists.infradead.org
X-Gm-Message-State: AOJu0YyYdCJKMIS8I0NY8maY6o7YpTg8HX9MWM/x0l7wFARPF+Kar0dm
	v7aLFqSV6lMhiQ1ajT/qdjjm9kTiarpXAKdpzQwL5fDs9iek9YNdauzUfZHKjdNKJErG5n/6v+p
	Sp5Xjepa6H+3u+FIQGWbly03WXeIdmRJTQ37j6cndeAmKEPmYhHchOzfIJsSMwmcFG1nO8BNwX2
	kLoA==
X-Gm-Gg: AY/fxX401dlWRiHXpsPEV+OLbH018+DoMFBLWa4KVRzlamHf9ITlNuRQ0YqfQVD2g/T
	LjV/A2SqJOQGpgSzozGI6dEPBljPbGyihA4DDl0pqTEMbbjiVdNC+q1t989VMTzjGnp7JDq7ELx
	aEhyFIROv4dd8D9iEjOv8aMAYgAPHdRTZaeBsmca8INJqS9TOsBXEtM8pfC6r+tCA9yU5BIYjBA
	MtPtYa1ML80Rp+CyRs760VWY3EdHC6Qtg0x+WXOE14TU6yMKNaX60VnmjzhNOTuXl8COjr+W0D5
	HLPQQ+3+qIwZvVVFVUJEhccaRfnmIDI7lBvty8NUDoeUyfSpQy1cW4VC/YvBbucT4LmpZtRduI0
	zS9035B9FuVWQLTe8wAzweeK074OJXH+VRwOteQ==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302266685a.24.1767975106074;
        Fri, 09 Jan 2026 08:11:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy5T1E7jUrBX1bssLpIPnC4OcyFtfkLbBfyt51Wt45hTzCQ0qm3TofJwyMoPJOoK6/cA59Eg==
X-Received: by 2002:a05:620a:2849:b0:8b1:f1e4:a3d2 with SMTP id af79cd13be357-8c3893917c6mr1302260485a.24.1767975105583;
        Fri, 09 Jan 2026 08:11:45 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d31e7sm1189140466b.42.2026.01.09.08.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 08:11:44 -0800 (PST)
Message-ID: <09bc1f51-1836-4981-9fec-e3385c61aac6@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 17:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] cdx: Simplify with scoped for each OF child loop
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor
 <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar
 <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, llvm@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
 <20260105-of-for-each-compatible-scoped-v1-6-24e99c177164@oss.qualcomm.com>
 <20260106101733.000059e9@huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20260106101733.000059e9@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RN2+3oi+ c=1 sm=1 tr=0 ts=696128c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XFS3ILgPfShOvr1i8A8A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 8QtxW3AjTK5SVAC7ebeamN_l4SIkHVpr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDEyMSBTYWx0ZWRfX2mm7c375vu9Q
 NAqnmkAsYCwY9/jw/q4Jz1Vem1DeCRrMZt2IAwXQhmv7I/TLjH/yi5a+DLvDh8CT8fgDuTAP+ED
 Hot7VGzzmKs7hG4jhNGgmmeqDrvRb7xmDyX5RtKdV9BIKYUcZN1X7zdWHE6xlKHqeUWpVx4dxFz
 Fsacpdv4TmESZM3q2eV8FBQVIP8fdmT2Z+dB6eLjjXI2cEenj8+V1PjCmygCN9gTiNUCKwagycD
 DGB6At+dwfH9Snr2ll1w8emmn4GFNDPyLFvjqpNXniiMQiYYO6kHFL60frUvlzlYiCq4wz3MjhM
 MTI8eJkKtdwvqZZnLSx1rNtLkhDKPeaV87bjRJlgKtvO4bha94E1iNl4OIQn4+BoC7g+dW9kn1m
 Z8mfKiqU7+jfTLluLA04D9TBhd02otwp4WXXfrNSfep+e1ORzPLZylp5Og5aBLgcJ7c+HxKIlSa
 DVM0VqoZZfEW4NVTOOw==
X-Proofpoint-ORIG-GUID: 8QtxW3AjTK5SVAC7ebeamN_l4SIkHVpr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_081147_860334_65D6FAB6 
X-CRM114-Status: GOOD (  20.73  )
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

On 06/01/2026 11:17, Jonathan Cameron wrote:
> On Mon, 05 Jan 2026 14:33:44 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> 
>> Use scoped for-each loop when iterating over device nodes to make code a
>> bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> I'd be tempted to make one more tweak in this one to bring
> it inline with the suggestions around not combining scoped cleanups
> with gotos (see the comments in cleanup.h)
> 
> No bug here, just nice to have.
>>
>> ---
>>
>> Depends on the first patch.
>> ---
>>  drivers/cdx/cdx.c | 4 +---
>>  1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/cdx/cdx.c b/drivers/cdx/cdx.c
>> index b39af2f1937f..bbde529aaa93 100644
>> --- a/drivers/cdx/cdx.c
>> +++ b/drivers/cdx/cdx.c
>> @@ -608,7 +608,6 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  {
>>  	struct cdx_controller *cdx;
>>  	struct platform_device *pd;
>> -	struct device_node *np;
>>  	bool val;
>>  
>>  	if (kstrtobool(buf, &val) < 0)
>> @@ -623,10 +622,9 @@ static ssize_t rescan_store(const struct bus_type *bus,
>>  	cdx_unregister_devices(&cdx_bus_type);
>>  
>>  	/* Rescan all the devices */
>> -	for_each_compatible_node(np, NULL, compat_node_name) {
>> +	for_each_compatible_node_scoped(np, NULL, compat_node_name) {
>>  		pd = of_find_device_by_node(np);
>>  		if (!pd) {
>> -			of_node_put(np);
>>  			count = -EINVAL;
>>  			goto unlock;
> break instead.
> Or better yet a follow up patch to use guard() for the mutex allowing a
> direct return here.

Oh yes and it allows to drop that -EINVAL assignment to size_t.

Best regards,
Krzysztof

