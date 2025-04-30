Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC86BC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=gNLIR/2Q7wSsakjKUDjlQFLqVW
	tjAo8r1ig8DQ6QFX4u/U0/nhqd408EEBgaNJzD0uc0e4NkPuYe5UV7Iuubxg2eJvbU5iFNudpGRrU
	uYDfT89y3JyAArbeAF5Zcq4Bs7ShjV+SBdUdczJ80NzrEoDiMioUoTKDbRaPOk1krIwJtJpIeVFrP
	CEq10BT2/5SLHHSwB5nKT0ruaHBaaEUS8jrFL5MKZCoj/DRgQ0wUwlts0LITFTv2bfA/+clwLK21x
	IJ8r00zTNK81c3aVK2NgyVY7LaJ6xEQVhs47HK9yMauhh2TcYuaIwh4Wm37A/CWKZJglOWgJPZseb
	RqCU02WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5Lk-0000000Cdxo-03YM;
	Wed, 30 Apr 2025 11:11:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4hr-0000000CX9i-0VIh
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Apr 2025 10:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=BuQwitGBQYJia0jaeDZNd0mNcp
	8iGIhxV4eZSfEc0MFoOCdGHl1BZuVw9yC+0hUuldOLYGP9AS2zBVzDh5VCCqwJufESM+AGawhwyaP
	9kco7kAXbDRAIc1erxuwPFE6+rGuB+VAPAfccsILeO6NXPYyKlBwgRy0JoB1Ngvd6t+E9bugcMlbK
	Rh1jT9r2Sp3HiFgdAkl0cSxhhTy4UMNLhTIB/t2FktymDKOW0ySfMLBIF/Aiw0fKUJBSWfeKbJZgX
	9Zowy0ehdZLxUinvyYlrCQLBu3m+LgfWHnDqo2LyTl8rAIj1SU//4Cn5E+QlJmdqq+SdtxQvkZMiR
	Mcyqxsdw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA4hn-0000000Dldd-1hDV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:30:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53U9CNaO029623
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 10:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=; b=iM4E/UQS/KtzSS/x
	SNEBJUQZCYLdSbL+r6w4OmeuO/tsWg85XMKWTJ1Cu9C7v9mMRp2Llw+UpfEtgI1M
	laid5A33cbbFEmqupnRbfVAywzml/Xichfm18kL6J7E5brVhvZtS5/G6G6QsAChG
	Ki7Lnxm4d7CDIXGGc8Fp5SCOCHFThyzJtFpCU7BP9m752hN7ayMB5lXZZtbGRe2K
	CMu2azS1sj9o2y2/9uPI21IxsZeXqZ6vaFVw7ExrtY1W9sbLsh05uYXxlCfI/X+V
	Sk0/C2cysih+EkpqlHpeGmbwYPlVM7+daW120GqDqm6rlfcqCsmIlhOqSe7S3h3Y
	h7kfpg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u7ss5t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 10:30:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4766654b0c3so14602571cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 03:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746009011; x=1746613811;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dMEDitlwliRXG+C7lDQReeUjMvhJGh+ywOSS2cE1yI=;
        b=GBVQQFuuiyYMOhQWKeVAFwzm0vI8rMzLunzTk+S5yJJj/uYoEmxM2zXU1CpPeGiuuu
         2ATMFy9U9oJFpxkZAnfCsKlwt1giEejc1R36TYEVKhxzuAc1iHmPJx6cOG3+Uovrm558
         uWdfy/iGiB6tgkr/ML9FN54x1dP3fU2pFE4yTVazy9UZopy1D228+WJjVRi2i6nEIEhv
         jC9/prgcBOTUzhcUraKmDjGUJgqPq4azJSdez/j30EaNm3YkuJDvAMnFp2R/oERe9uId
         T0Zfe/yvc8fQzH72ZS8ObAkf9D8PU/fgoemfuPZk6OKlD/6Cee1vk3Yyt5VEVFZBmTQI
         WQyQ==
X-Gm-Message-State: AOJu0YzP9WZsv3OrvxHGoQtzPkX2F/hP9XlSMID0Xv9Qra3TdcKbtsXB
	EnbgzMbrNJ4jrqpxCL2UoyioY/7Pi8G4hCTpZxqUIpiyxnxwOU00t6KfhlJ/AlRXys1Tqbl/MKL
	NpsIDUrsgYH1zbMwDDEtTDgKOuPiHRoRfvfCAwxKUX79TqeFF0G1Eu0gfBdmdj4yWZo5y24rbiQ
	==
X-Gm-Gg: ASbGncv84sfYx4EZiRUF4kyQVER+EHuYbEYtIyynUxyKvhiHkj5aR8XuDVAV81CkE3B
	rpnKYBqK3O9KIEZIYKYq+3JyiN4jXFzln1NBS+8886ZHN9h6Bpfz8kr1d3xgVhZ/FDmknHkb+6D
	QCGUHOAI2abtrMLerT6gSiAMtXdPmUPQ4VzpnTDrie0NCVP068Lkna9ABMW6Hs/VcqLaPAsoIVI
	imLK5b+5EZSQtbb5oIhvnJbM1Pn9R0GAAkD8P3XRz6wgx5a5KEiNlNIfaaWgwkZ8+kcF/KBRb+e
	YjbP2Vq3Kut1L/P7L+72YxTSBI/FfgzfPKgrL41lF5hmpmJlF0Erok4NJDu3xJVGiGg=
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827931cf.4.1746009011554;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7lXha6b1LXm4abb6t1fB1qndIV4/7aB6CwAhaxwGXUOPktd72Ez4ObW6QEnJdW84G7irwCg==
X-Received: by 2002:ac8:7f8f:0:b0:472:165e:91db with SMTP id d75a77b69052e-489e498d781mr11827621cf.4.1746009011151;
        Wed, 30 Apr 2025 03:30:11 -0700 (PDT)
Received: from [192.168.65.132] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acecf27a79esm205373466b.24.2025.04.30.03.30.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 03:30:10 -0700 (PDT)
Message-ID: <8ec19cb6-bf74-452a-8a82-285b2acd90ed@oss.qualcomm.com>
Date: Wed, 30 Apr 2025 12:30:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP v2 4/9] arm64: dts: qcom: sa8775p: Add support for
 camss
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <quic_svankada@quicinc.com>
References: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
 <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250427070135.884623-5-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ldc86ifi c=1 sm=1 tr=0 ts=6811fbb4 cx=c_pps a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=J3B29TH01z4cvqQAex8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qFdYlkc1elOQXUWNSJlmTt5IvDcaAYRv
X-Proofpoint-ORIG-GUID: qFdYlkc1elOQXUWNSJlmTt5IvDcaAYRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDMwMDA3MyBTYWx0ZWRfX2L970YskB0q5 o5gFfWjcV+hjkvixZ2/9N2YEQqoW6sjdEfpQUl/9pK9po/AlUSLx/nAuHzSVAHN7Gm4fTl4SDcv gDVmAPZucljm6SlYZl+VkIGf6cdY8ZJAevw17ea1h68ugEQgWIoAmhZA2jR46la1Jvku1AyYUJz
 zaceG9ziPIoQLGc+eC7my04ZoyQWxbdKiUsPKqOaNM/dY2fzhKDi5mygN7oocTxJSeI7OChMzgC cdqcnVxkKHnl2dTYkO8+Eo0sZEQ0f/78E9Lz6msSjw9mw+Uqm0uJ0ox+0UjsH0lzzEwxS9uiFgc yQ/owg91zd7hw3PKNz54/pZWblZSUBU5iuSkSrE4X5CugP8lmmmaLnxHHP9D0cVuDPVFjrvWr10
 B2pRFtGltcPAzqjdGlLvmBzVRJdvpC03/4Et+82yEwmECMS890zb9XIDiAq/iy6uq1cJdbd9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-30_03,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504300073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_113019_880409_4D71C14F 
X-CRM114-Status: GOOD (  12.83  )
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

On 4/27/25 9:01 AM, Vikram Sharma wrote:
> Add changes to support the camera subsystem on the SA8775P.
> 
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---

[...]

> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {

a newline between properties and subnodes would be good to have

otherwise, modulo the ongoing discussions that the folks closer to
camss are having in parallel:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

