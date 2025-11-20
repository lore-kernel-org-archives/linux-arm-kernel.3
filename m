Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF498CF857B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=; b=BS6ZIeNg9CtCoXoNKXZ4aLav3V
	atFVhSwUuK2fLCwrhaqHEAyseot6vJGLggK5BXTVs2Pya3BsJ7rcY0pgSYqRJrFITcHw9dqgXznWS
	DQfhrdwn69EFQn40uRBpTuQPbbKtxDrlcvywJMAajjtTF9Vhe+A42hJNL2k5WKSmsQ+p6QZvIRwFs
	p7MQybRQOJlhG9WK0GaL41VOcydua2kGvWc/NWVAR+OXgyYxXpxoaK13Exm0e5YqceBh7c7mNTOek
	4MgYBI4Oi7+8QECEQa8dyp5kF3jUc9ce1ikILCkIJ3erpDefc//OX/vDACvQ7oU4tRpCIBpR1+4eg
	gd3q7rJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1C2-00000006Rp9-31wI;
	Thu, 20 Nov 2025 09:43:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM1C0-00000006Rom-1j01
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 09:43:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK56ZEW4026491
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=; b=hkocuJ4ZWK85qWo+
	s0wPA0FzDYrKQywcYqNCHNVP3nscP6gVXuSku7GtewMtk+eF7Hc48x6VAdZ1/TXf
	Jx/3kTd8tVU9FPktqjVMpK7NZEuHCmlP2vJXQ6/L8o9neG9ygrST9RAiVRMfTHjP
	Ch+Ru2t/9lfHZ4jJcxUj9Zq9im1rf2LoTUKZbL81T5nPc3DvH/kRR/NZOgfHcM8a
	s7kh3wOUI4TGLJmcmjOVPZ1bHdfuVTK7f/6bWAtwAj+5F5GcK/4wuEBeaJZfwvT1
	nH7TGTXYVoVsglJdF1V8sQXerroM5mKac9lUr9i8o7UUfRMKZx8vuVbaPa0QXYgt
	nFfNXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahvj3gtjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 09:43:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed9122dce9so1025281cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Nov 2025 01:43:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763631787; x=1764236587; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
        b=GCDD+J4u6j8EL2/z2kh9XJ+d1ECg8FreyjerfhQw2TltMe7ewHrnG9LF0bmlpaE1mI
         GX+Ihh7PeQctU7GSKqSnJebdrR4Df+vWP2gJojDRWrisfGlF/sb6glmiMFP3XDjyYb4m
         rsYH4hZXyOpPU0sEJYU4h+cW5Jvikary+6OXb9Qfs6B+LTingHqrD6S8jlSOySHMpKzH
         8E6HTqAmbO0rkcO+/QLQkH9HufGe0bKy3FLvuUfPlVzG7+cRJMAlC4NM3nRf7IxLt6+O
         WgRjQDEV9CYJ2+Awnw5h4yZZOEnp6Cz1K+6/kUjLfWBGVp1VHM6Zl8UgpI3AOBhbllbU
         0Cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763631787; x=1764236587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LkyzTXeZYMSp/bdyDfMh+rWB60QOoYeXnsoTS3SL938=;
        b=MJivbS05TQHtGnrJ1gAbRWGIhXodtAofJHqKhXIvJkONkNew80qomva4ipXAQ+BA+p
         9trYbEWCkBrwCN4epceTwVVztUDPW2zl29v3xbDlgtyggqhyQ+h8jNhB7mmWzMWLZS5+
         H21e3azlMvKFnTXyEDlTwtyE2PUyftULltRP1xJnz385sx7UjUNV9e/ZNmKofxrMfPnn
         Heh56xtQ0JCZQnXVYjoX4SKij+PwZoOO6u4PZ56LvdwLyL6WPZdSLfVVcmPOK3W4//+C
         5668h2mB3tzZKs9ZBOn7z1qi9mOK2zaMMU95dZfiBwoHuMgywrT/0Cu24jJjhXWZ/PHW
         JCWw==
X-Forwarded-Encrypted: i=1; AJvYcCVF0nLodns8oFOCGHZHi7OSgh2nuyo4+joNbsbSpf6yDuMGH+gXXinEpY31/THwBCdHA52b8PrdQ9Bx6wOfYmIw@lists.infradead.org
X-Gm-Message-State: AOJu0YwE962pone3HpdQuTDnheozZgx/oKYvv1BuSIWAnzHIKjLcosVs
	eWtUgoEAF0DSfCKT1XHVl3VHx92/6/xRgOp39ZXtgeKo8eNIHPK8c7+3FSjDhsrIhXp+48xgusn
	muL0PFr4+m2+y4B8I8UqWj+GFkblqFKadnnweNQOnV8CDliGyxHcWz2u87yzHYb4Z8GmUfCaIf/
	1WQg==
X-Gm-Gg: ASbGnctaLJkofk92+RS5tAQOKOpSp4/b7Gr5D0Fu1FHaozvVZpO9W9I+jwNf2XU6ZZ/
	B6TQ55KCp0PUWN3dDUU7HDKNQ2c3SVgR61Dp0YQXuXfEEcC/LaVkux7xKE49n6KwS/DF7MhsnGv
	gAHL6+HR/giSMRKpralSBMZyedTPI7UjCE8c2h8tAPfM58JMXPsZvtJQ035m8dn6YzQ7jc6Dl4q
	cWE4VOsDFWIKMv0shva8NGvrIrEUB4qgHokpz4eLzjIKuni0pJBiCZyQM85eMnPHb4MyhnrOCpN
	eFB2pEMaU1pzEkYx9A6xEWSJGhjtILJ/LD42mXAx5FOOGTm5LJ68/t6aALh5raxZJV4Iqr6oqX1
	YZCKgP7To1YgLnLo0VleHSmrGHWirx2jzWGttnPvKRoqh4Z5iHDhhfphx2N50q9YC9Tc=
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee4943ffe2mr24836081cf.2.1763631786959;
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuygrM15eYuuL+Eseo+gEcRRrz8pankqv3+qIrqVyy6fDxxjo0USx1x43jtWRb6reybm1ooQ==
X-Received: by 2002:a05:622a:1882:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ee4943ffe2mr24835991cf.2.1763631786581;
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43b1sm163235466b.38.2025.11.20.01.43.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 01:43:06 -0800 (PST)
Message-ID: <b8e5d6a8-c6bd-49bb-8308-a8b5c390897c@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 10:43:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: qcom-ethqos: use
 read_poll_timeout_atomic()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
 <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=691ee2ab cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8
 a=OSBbO3HZz-0BpLb1nxYA:9 a=QEXdDO2ut3YA:10 a=THfFRngN91AA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: NdQPzapzMO-BpWVhICj_K-KDQen_8OeJ
X-Proofpoint-ORIG-GUID: NdQPzapzMO-BpWVhICj_K-KDQen_8OeJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1OCBTYWx0ZWRfXxBhn8g+lf/N7
 B6yc6ekiKRIkkx/i+cnUM71L7O69lXKZwtshw6UuoywxGZoaGkyrfuLutkjF1nxiLF/c/EDPOBx
 SzfReR5tD97YRbuEZ6FjLMcPSj0WG9PY30jPyPUD4wogans/sxQjQMpMr+myMpp3PEXMpTeisF9
 9SQvu+T/jbeyHR68HJZHGeVNovbr0HmB1ARPTzoUL280KFyfPzn5alEsXNMY6M+CsyPLsdzu1ow
 GKcwM3vaixhh7HH6yCQztmiLrI0xOFr9egRX8fNORd5nj1+geA+YvfGRFR9a54NnHE5ukBRFdsB
 vPd8mOIiJZe7t1TxJZKQVc4GuavAnXD++a1cZC+Kc+9Sz2oRFgS79PC/eR25eR33XkCkqi0z2w1
 XRZiVOmqxqPlQwC3mv2O8cDN/h/ELg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_014308_565549_6306364D 
X-CRM114-Status: UNSURE (   9.80  )
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

On 11/19/25 12:34 PM, Russell King (Oracle) wrote:
> Use read_poll_timeout_atomic() to poll the rgmii registers rather than
> open-coding the polling.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

