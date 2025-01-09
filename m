Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A3AE7719A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7vGWjZNCdFvL36McoU0W2QcK/hOkA5Ais5061RagWtE=; b=qfAhBhPUItZO0UR3Tes0cJ0rCy
	ntZ8o8JkWfCB2mQkSi9z2oovox/N2bCzCCnZGHq1K7lv8d3XAqDGlNi9+sKIUmQSKqQjayfH4TVCj
	lGJobZnpDbsT0f1T5Mpa/4J8HGygCq35az15i4ul6TdPesbMWHm782NmbFRHIh18wDyYbifbJe4GL
	/4sac6MX4C8FFr6BaMf0vYlRenmBCrk99wA0aHE/EURofyCxEwm1/k+QGlKEXU2KjOBaeaPs7Cew9
	JJCS/PrXIkcl1OLPeqGDM+8S3rZ+DUCM56zQHORzk3kEczKtv//jXCZupPgBSTr2oX9yG46yEL/GW
	FfawKlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtGM-0000000CBov-3uAn;
	Thu, 09 Jan 2025 14:11:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVtF8-0000000CBZN-3sHd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 14:10:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509CC9uq003636
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Jan 2025 14:10:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7vGWjZNCdFvL36McoU0W2QcK/hOkA5Ais5061RagWtE=; b=lIiF7u1V2FSvKkU0
	3fd8ghf3u1EJtjHeJN5QJQ6OPnuWPOcSj8Hc4ndmLwqUDKVoeweHUG1PmfiELfzE
	ahZZhoHXyb55xWqpKxdAvd479kT/eCs4NwsEMv2Nkc6WEqoX9OM5kxsibcIncOlt
	PRsAcXk5ps2wSjxGC9n0R1x0j44pLLS/wfLnqnNTT0s6ewjy/zxW84xNjun5HyB+
	Q+ryNu7Qfh9twdHKrFUA7exP8T8r/tKQbON0V2uiD30KATiX8mdvcc8M5IfEuae+
	T/HHhHMtqGkI2eXTBLy0i0G2DsiXTUPmOkBlF/SGxSXxe3wpI8nCwIc66KVUZeYQ
	0+8OHw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442e8cg8s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 14:10:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d8e7016630so2766166d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 06:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431837; x=1737036637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7vGWjZNCdFvL36McoU0W2QcK/hOkA5Ais5061RagWtE=;
        b=Gs2b9tpEkU1J/6MZdkKJexlDRmruu/VZ0WFRr6UPBsfZzAqUID+dASxiACepVdnV8j
         FsSmm8uxgMkgzzUHDqz7ms5Jm+x473PIh1QRu+QQvBlS1sr14FwxGLFTOk6BOLdlPfQv
         xqP9mP32YZJrKdh7kaTIABK5z9SRjYDeNZIk9/ya6fcIv1lWhOVAFqK9xWgZsLP3EkZt
         GlOU+C+2Zy+WtX8wWj5BC8XxJfz+tSZTbSHFWoW3IgB5bQVRStFsH7yj00cOGPDm/70h
         vvcLKlT0AF1sfuIOwejCG9rgwhSiXFulZObNke2PTk+CJS5IspdcXasT3gBIfaTDfzBI
         cZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUKf2VwtLwNDuk3Yb6E1XMqsC39i0UmR3rDZZ9ikVjohs1K3W+1T6igUoEcn2TQMv+PCv4gMvz3d8FDqKPapHuU@lists.infradead.org
X-Gm-Message-State: AOJu0YyK8FSbjr4rDHm+2eCItAuR4pCQQY+aXPja9ak1QWqG4mxzvdJl
	x5z3B7RuVys7IYGmaTsSxMMepd7VvAwEvikuW45V4RryRi3EYaZvWnsZGqcm+t2O1O6+OX3mHWo
	drglG+mf7vAcn/GsNhBOFj1nA7l73XhUYF915pXF+jqQmBbSZggBaORDGqJOCbge2ig9TAlm4kg
	==
X-Gm-Gg: ASbGncu+Ta3PhahKqiUdRZboD/M6XWhVhyq6W0z//rdHwGF6+i+RHNWPnoZ9k8dkMwK
	z6KWmCwNzaJ5Nhg0sBWT3WHb9tWl7qTumwkeRZ+SVIZ1os+zbKUzB6WvDC5Wc4Ved5+ePqIVADW
	o0nDSUbfGlkCbMrexvXomIevLRKVUAGNGHIHrmyhloBjcqgq2PeZeEeCjoy2D/mxfgJcdOUrUrg
	4e2o7+zkoEBfO0CzTDQVBD5Svsmhrp3tKua2BSpg1T/ogMVPERppPzUrFNp7ANHs3tTZ8/U16sv
	1LgXF/eft82umOQIfXG8VTacngB6vEPTbLk=
X-Received: by 2002:ac8:5a41:0:b0:461:6599:b9a with SMTP id d75a77b69052e-46c710f2d4bmr38848621cf.11.1736431836786;
        Thu, 09 Jan 2025 06:10:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFtSSjy/k+utoRRUalpZi8LGiYgqSWxQBdYI15No64ZwJPcp37eUotTcMZvjExAoP66Eh9XQ==
X-Received: by 2002:ac8:5a41:0:b0:461:6599:b9a with SMTP id d75a77b69052e-46c710f2d4bmr38848421cf.11.1736431836376;
        Thu, 09 Jan 2025 06:10:36 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9564873sm75035466b.111.2025.01.09.06.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:10:35 -0800 (PST)
Message-ID: <0ab00013-0265-4336-bc30-f49492e96424@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:10:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] arm64: dts: qcom: sc7180: Add SoC specific
 compatible to soc node
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        patches@lists.linux.dev, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250108012846.3275443-1-swboyd@chromium.org>
 <20250108012846.3275443-7-swboyd@chromium.org>
 <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <n3fn5mnrrinrgrvadqgymv3cx355qpx5kk27nlrz2emoxfmjyt@ymwpfxf7lv4r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JxluBFYoIVJMVQj3yIaOt_4MWUjqQ1ik
X-Proofpoint-ORIG-GUID: JxluBFYoIVJMVQj3yIaOt_4MWUjqQ1ik
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_061039_098788_A53D097A 
X-CRM114-Status: GOOD (  19.89  )
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

On 8.01.2025 2:02 PM, Dmitry Baryshkov wrote:
> On Tue, Jan 07, 2025 at 05:28:43PM -0800, Stephen Boyd wrote:
>> Allow an SoC driver to probe for these devices. Add the SoC specific
>> compatible to the soc node. Leave the original simple-bus compatible in
>> place so that everything keeps working.
>>
>> Cc: Rob Herring <robh@kernel.org>
>> Cc: Bjorn Andersson <andersson@kernel.org>
>> Cc: Konrad Dybcio <konradybcio@kernel.org>
>> Cc: <linux-arm-msm@vger.kernel.org>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 76fe314d2ad5..257890a193e6 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -782,7 +782,7 @@ soc: soc@0 {
>>  		#size-cells = <2>;
>>  		ranges = <0 0 0 0 0x10 0>;
>>  		dma-ranges = <0 0 0 0 0x10 0>;
>> -		compatible = "simple-bus";
>> +		compatible = "qcom,soc-sc7180", "simple-bus";
> 
> If the new driver requires this compatible, it will break compatibility
> with older DT files (and it should be avoided).

IIUC the intent here is to provide backwards compatibility through checking
for sth like IS_SOCPM_MANAGED(), sorta like HAS_ACPI_COMPANION(). In that
case, power sequencing would be done by the socpm driver, whereas if it
doesn't hold, the resources would be toggled by the device driver

Konrad

