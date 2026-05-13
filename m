Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 684ABCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=2nDUXrdQJFD00c8wa1Nsx5KxLi
	Oecxhj/EcWuqFiFakrP7j3a9mekARVGyMfpEthz9uxnzJlcdvKxlYxrq+0Te/KBdsdn9pGZnD3MeM
	4WqoNhqlLd2DdFJQ0eDfHnAusOZ+QRUIkbRQEaDwXwIUkhC9LeYxURMfRwLmvRLSMtS2EjwU4QnVX
	NmMEsO78FwgCVASTFrFFMzSJboLMrU8H9GIRr9pb+bcta59AzE4aj6F7lYyXfATaAH2ZyiVkA5TsS
	KNRV0fXUKfGbrT3z2FqKW2URkG97lRyQ90IDlhikdW39iif8G+EoN+owAf/axSBgpQ8FB2vnwKvEK
	Ay0Cnu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBWa-000000034uc-2Hgy;
	Wed, 13 May 2026 15:29:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBWX-000000034rZ-2CoJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:29:26 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DEquLB4082600
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:29:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=; b=hXE7vLj3yu7n94+G
	2NSWc/Fje9lZq+7gEbw4ryS8rUQZeq1Jnkz6s9BIeQgmQQboDMIpATq4fN7WEAHi
	lDUwhBnUF+LXUiMGZmyWsR7eWTWh6jDUrkLuHqnlx0jtMV4uGw+/RknDesx24Jdt
	VqSsU+X3fWOvt+lJC7fSW96xxijDGr5oj3DkAzJtaf27PByg1ZO5P1pO015LWGqB
	9fOZpCbZDYnT1nSpdMWhQ2J/s+4bdSzfEyGWocGG7D4At3DJBt0QXUiwTgXOGQUH
	wOLDA/GoNbQYa+6cg0SN28f6OkYLLWLXIK85mKr0MzaFGG/WrSNVjrY4GQK4R1cv
	zea15g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1hx6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:29:24 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ba15e384c7so42428545ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686164; x=1779290964; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=MXu18Oj5VOX5VMAZuXyuk+vn9zwZpySmvMsrQpnokBLnkCWWgqyzsWc1OTd4CR5H8a
         cUGkU2CfBI/Lhs+kh7om1ZOCWxpSWKce6+EGk3iIP6KpKvynqzl4PsOT+0uHDK0qSOFH
         DDZyCrWhouMcLgdwZ0ZhzDYh/X8gIK+K2xkesfcVis5RU6vMI9wlAnuNDNDmHy5iu5sV
         md2WV1YWItQSRq6seOZxTymshwYCsoxOhhUJA8oY54IQTFNLS8raONSD09aTFodnP5hw
         yHdx+gsIRVd2lDWW3PWXJkSGM1T7u6Mfv/9P7PiNAbSDwY1dqTB+R7RicK+pZYoQZ+PG
         stgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686164; x=1779290964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Xl7aVA6M2uIYRJqzcUsD+r5wfUt+8gXt1FDzwee7lM=;
        b=c84EDFZ83AF0TxSqHjlD1sMVcKDlavmk5I4u3pR8f+Cg4QUDNleQpmy3iHwWr4z3Je
         +s0Rlu2+EjTbNkIDCHVyYWuVtrBaXycI+H2P/CQSv5/rbzIGJS00V29Kp5j2OfKIcb1N
         hj48DoTqzm81v9VeQT8tVgA500dc61MITMEIF2QOmNVOay/3cPEEOybyeJdyo+HHrQwO
         xsfYr4nBYQ5fEXkUUQ/rHpjG5/C+uyTiT7udWbi72vsJSvT0hagsqO3J/jufSbLW7Hor
         XEmCIYdFwWETETrREq4VmEj9HnjP9PktyXpEkvzJ0DUhfAc663g9Q1UWNUWWEkGlOGkS
         3uHg==
X-Forwarded-Encrypted: i=1; AFNElJ9o3bDW7lhXw49I5k+x9xj6YyWtYz0OSb0RIX7CB7e6ukal2j1LnKUm5Kf5jcoqZ7h3n8WmQqUERCXNrTTYFLSy@lists.infradead.org
X-Gm-Message-State: AOJu0YyrOe/2wTjZmH/pEGQPGnmk2Q0AWTJ1UoP6nRRzE11VMMBy9Aur
	AxdobT3gbCD2/wvmh9xXZWHjZ+VNkSK308bBcivsFkzQzv5bVczM9PTa0PJBGWCJqDeLNL42v4h
	4MlH83U6l9gikIGmVohh/jyDF5ESXsM9cBNtc5tqhflm0Sm51VINq7oTj8Auq/4hx+P9PmSyQn5
	Pd8w==
X-Gm-Gg: Acq92OEs4sPtOMx2ZiP6ASerA0OJuuibezVFNZA+PTBUw6rQ6UZAujcduxBJ1sp66uG
	D5uX8YtPzibLKFakwkS9L6W4Eq+XuLd9ebCK1eGzDU7mVIyS2wgsWyO/aEfBwJokwIPaDDOIQgG
	yKdPqqMEXd+xeVVs6aT9tiE/IaB2JWVzYt3phdtRQrKrI/dTNJKn7cZIzV0Mf6U4gi8IEUqcrbP
	z8AtdlSEGf5gOf6OUR/WqkjCzYD/Jcx919ueLdi/znnKA1mv3q5e+Wnmsv/G8HmCCxXeU5FChOi
	WWdvkrVoZBDtEJeYHYvIuzeBeiHMPYlkoAX563d+1OcASOfUw9PjCf1jQurj94e6KpUc/+CXHm6
	avZcPuStAymRQqgHXDEKnhEixqUQ/IcIBxcIOeSy9unggELzRyQ==
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318985ad.34.1778686162691;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ba:9e1c:7cbb with SMTP id d9443c01a7336-2bd276e23b7mr45318595ad.34.1778686162197;
        Wed, 13 May 2026 08:29:22 -0700 (PDT)
Received: from [192.168.0.195] ([49.204.25.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e35bcfsm168295585ad.38.2026.05.13.08.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 08:29:21 -0700 (PDT)
Message-ID: <dc78ab37-c62f-489d-9497-998ec11080d6@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:59:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8Xv1cSf9XyMQbfLsVfiqPjO0RDUIDRoP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX2tNgvhGG31Q5
 CPg+OUF4Sy8n8SikWCNn5PoPmFkb15/6CUGEUlUr3lycX3YSa5d3+qFur5rK7IeQKSREj2dNCSv
 eUHuEwzrdV8R6O3oGS6cxz+Ax3omcvZ5pEUmJH5EFWMfWvNT0etp5z7j8nahhQ2FHUz0oP5rKqS
 kpe3++0dGO4rqoEg4KL2TB7QR3Bwn6Cdh7XK2D58rED1PAjIS0iIb1Kj4lkqtArKKjz41PTBRMY
 1GTNUmuRzKCmb2EY5t7oAWwWzr+LneOeewmw1ElrKSSLdXje24icp0lkBNRE5Y0hyWxNrpC8kpX
 JJckNRST9rrH9NcbNoahqj7TuGIpoulQ69J9pqriyLCzRrrT4snsRM+1nPrdLJJ+9Lq2/20o2T4
 UVLwRyPJeRSiXxWHq+h41xM3/XWkFdPLbtyLocSknBZqDYIjwktHOmR66Bh5ZKx5Z5lsxEEcDKM
 Q6nbIceSPtWbPwrrMYA==
X-Proofpoint-GUID: 8Xv1cSf9XyMQbfLsVfiqPjO0RDUIDRoP
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a0498d4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=QCtv3gAnLEb/jX3y9W1wMg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=DeNt0BJpUpdqGQuxoTYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_082925_574203_3F91F02B 
X-CRM114-Status: GOOD (  16.84  )
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



On 5/13/2026 7:53 PM, Taniya Das wrote:
> Add driver for Eliza SoC camera, graphics and Video clock controllers.
> The camera clock controller supports the cambist clock controller and
> the regular camera clock controller.
> 
> Eliza camcc and videocc are on CX and MX rails and doesn't have MMCX
> and MXC rails dependency. Since CX and MX rails are already ON when APPS
> is active, explicit power-domain voting is not required similar to Milos.
> Hence extended the Milos camcc & videocc documentation bindings for Eliza.
> 
> The patches have been tested on Qualcomm Eliza MTP board.
> 
> Changes in v3:
> - Dropped new documentation bindings & extended Milos documentation bindings for Eliza videocc & camcc.
> - Dropped the defconfig patch and included the drivers as m from Kconfig itself.
> - Update the header inclusion in the milos.dtsi.
> - Link to v2: https://lore.kernel.org/r/20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com

I missed the ordering of clocks in the milos.dtsi. Please help review
with the latest series.

-- 
Thanks,
Taniya Das


