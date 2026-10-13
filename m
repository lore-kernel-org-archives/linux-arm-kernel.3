Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6669CC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 14:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=; b=B4kYZy4hLfBCe+2eXktYbO1qgk
	SP4UT6Sb0ZzCEy1Nz0RAHGXAiA2Sxuk90bcKGMP0Kf8UstQnoNHV6V1ypF4vHblXxqbpVAEAe8+NY
	u/TfLfa0hYsRAorFerxiMxAaB+QWDiAZgtRm6du9xsn6GchaOsb8qU9dnkwe8WlIrBnJu9Vku7sPN
	6s5Njhe/Jp5IkO5rRNgY3t7vPO2brfYxTkT++GxDx75VOXFVru32/4n7hsmbeU9nFu92/NSG6+1oc
	BX9RpapvN+P8zA0m8eUGxwVGFKTljpL+U0fK2Weap4inY49H8qYae8/C6f4hqK3Dv905QzYUNjc7c
	sFbpxGrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd4q-0000000D1mu-0TY0;
	Tue, 13 Oct 2026 14:02:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGd4m-0000000D1lP-0xQO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 14:01:58 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D901DX791192
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=; b=Wpjj8CGKvd6syAsW
	wtKuWOEMzXdAwfjyWwU63oFbmTGJfc9gDeAOVjepqzpkkwH2dYSgTtltVa7IPRAA
	75SD+S49d5Ta2NT8UQbJavnB1yms8R04z7KGX9/T2o8WZZYRTbsiDOiYK5+X+fbq
	ADm3eslKt96bcRGzrl58ToWkng3HWPaKp5Kxq102O5hvnQJ96HuQ2ghQThOjYg6/
	D2GT8VtVNImIR797Bb40m6XIzGj3ztNJbUjovqtOLzJMGC16JTJK812OFSw4ofAn
	khHOX9hNckkAnRUnuoA1OKmbr2Jm5WZjW0+wrGX+m7dXsNNhbMOnrxOY5Kx52GUt
	ZFBK/Q==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9hmjs7cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 14:01:53 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5e0a8f73addso3450866e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 07:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900113; x=1792504913; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=HQwSOQnl9MIoCwlH20iQ30VziH4b2SIEVzisUWUAUbTsMlgf8GCEwKJncD8uEtRnQO
         xcjsTcZjpfHNLjZIGfftaUzZEWwXhwzxPZxrwI8/q4RjtAKZaivVLB0LkLC8NJzSrh23
         w8AhyX/6eN2wRJadVGWcsKuFLBopel/xO0sRMFe6EvIRoVk5CNJmqIx+jeU9QZJJMDz1
         pI96RrM3d1jURQJKKyweZDp1DpfJvLyQIvrFbz2rwXDFOJClS0sVch5oAaIT/JGmSMaq
         UExUR4Umgsmy4meheHDD243WWKMRLxIkSINsPKci3IwFZsPd5iXC78+nZsdHSZd0m177
         hqTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900113; x=1792504913;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLsYpGybDcFYL54DVjqRniJMNcGDsEoOwITI4R6fhMQ=;
        b=mhsDHB9NvtqdENrwSTveRoO+YxA8K/+t9h0vgKZdsX3kI0vQkRo3o+GRiTsTyHgmOc
         lSk19M1fKiBL5m8yo1ZFiSn16yK77ZqKxt1LfGmfNIVaKg+q7X8GejRQ500P8c3rsaEV
         Y00UBjw6+/Uay3KWgCAbgta0vmTloN7bLBAuoF+8JMPxJfcKiNjWsCZS2cMIIbxPaBgK
         53p3JF4HiDR8n6gJGu+/2LHXJKXCB7JqKjod/SDlhZFC9hd20QY3c5CH6b5K2lT28pZG
         sHsECDaCUrTXMlpVWoXIrQ7zyGeFMgNGbo3Cdp7XZFyVQHhruyekNI4M8jt64LV7n6Ro
         apEA==
X-Forwarded-Encrypted: i=1; AKwUvBxSEnkPWIKmSGAVtFfv7qY8cAJETTBReScXBkwU0Egc76KE2v17tSXRP+sMaiWBTzuJURqr96GMor9/0k8hvb93@lists.infradead.org
X-Gm-Message-State: AFq9FYJqEehMmNZfC/L9uZRdzVDXQiwt3giwjwzfzwrzykXXLXpJy6x3
	lEN++OtmGFBfX3yjkD/HgPrT7wFr/yeQ5vdiq55RnGqLHd+Xa+qc2ylrWFU5ybrM04Ewc7sS/xV
	/KcvDWPaRq8yK9BSiTHq6infSA5fWKY+vK+vS9BQZ/kasvA55KgO2uzWNX4fMAGBqH534jkmzwo
	0ieg==
X-Gm-Gg: AYBFou1lBabv0DaAJE9uC/cWu3rW5ejBIMY4V3/PF20xLHQqYBa/YBvWRtVaaXm0O1N
	cNXD5gd7h3CrUtj7E91dLSMjOKBHn9/Arw+D9OMsUy6Df2B7RO8nMp6lvm1WSIDFEYhdWzaplUF
	4bV7+AWGn9mCiYfrU9PHMdAkwEXww95p+5QUMm5ZalNT72MNjlcgq5sPKAzL/O+bLcLfBLv98Dg
	p++BWFj3sEnNg/aRsnPr8r2lDVuQlTc3C0OHGprTBAYd1WmxuWayuVDshyhWLp7rPiV/zh7zg5Q
	9PUuum/Z7/aOFgzoAX5QlfyW/zBfvB6hAeLJ/SNjzR9nbFVb/Ej4z05GvCIw5b8E+0LDQWjqGLv
	5CxrIIXa7hNVHMBTdbfr7PVvobpjR
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193273e0c.10.1791900112838;
        Tue, 13 Oct 2026 07:01:52 -0700 (PDT)
X-Received: by 2002:a05:6122:d1b:b0:5e7:8bd1:731f with SMTP id 71dfb90a1353d-5e91f4815a8mr4193151e0c.10.1791900111802;
        Tue, 13 Oct 2026 07:01:51 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm377260985e9.1.2026.10.13.07.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:01:50 -0700 (PDT)
Message-ID: <8796cfa1-5ae0-41fd-b3f2-c6b588157b12@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:01:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/5] thermal: samsung: Add support for Google GS101 TMU
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc: jyescas@google.com, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260603-acpm-tmu-v8-0-0f1810a356e6@linaro.org>
 <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8142519a-0062-4f0f-b978-980e049f99c1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX09ekLdxPUILG
 4MDf/kA2iMJRbmbH7QmzO/xe9N98eh7J0J50RmD0TF6QFoC5YEHWaN2mgItd37UBaghwfnh+WJT
 8+breiI900WN5LNgmGLcJNEhe3tFzpw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX+NZLlZSjaVWg
 gaVPdlHbAYVZMGcO6TxLJfay0wiHfYUoUijejhWtbWezGiVDeeBW5cObiqRCmSzEN19LVhYB1CZ
 jxSEPD1jqWOYogXgaDaPvjfVyY8lOzhciP3tmAzb34MoV6LB3hr4WKyiO15vDxRYgHee0PgKosT
 TnWipuIeqUX/XXtGs39BQCYxC0cMo/a/j4qEKIi6SafAV+X1YexI4XftBsgYpDOdZY8etI9m2wZ
 NDzuQANSHsK6L0Qtb0KQpq7exNgWW8enmEqcRz2MgeclO5yUTpDFsFxSayzNSe9T94wwzOFcqpA
 kemOj++Cl8fUI++V9dsUHW9xpsCSic31kPG9702fEOYYQKJvgAPtE60HBbnbUGZeRNvmrPQ1Iur
 8gVpGuX291WtCB/8an2SR+IuY9z/gDWkHWcgC5w2Q9zzh9V9/S4nDLZwfJesQBE889WxRbrjJaf
 FE1inQNudotXUVo4cGw==
X-Proofpoint-ORIG-GUID: ywEBrca3Zri9BjsqYc0AXxXFHVkULYE3
X-Authority-Analysis: v=2.4 cv=O5+sLx9W c=1 sm=1 tr=0 ts=6ace39d1 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=xpaw9_Cwbs5_s0yaehoA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: ywEBrca3Zri9BjsqYc0AXxXFHVkULYE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_070156_391049_25382BC4 
X-CRM114-Status: GOOD (  12.71  )
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

On 13/10/2026 15:33, Daniel Lezcano wrote:
> Hi Tudor,
> 
> I noticed I picked up your series without notifying you
> 
> However, I did not pay attention but picked also the dts files.
> 
> Shall I drop them ? (AFAICS there is one comment) and let you handle 
> them separately ?

Were they reviewed? I think no, so that's another reason not to take
DTS. Anyway, it must not go via driver subsystem, so please drop.

Best regards,
Krzysztof

