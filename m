Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6786C02194
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 13:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=; b=aTskz/U2j/K8ojkZsdo+fF0XuL
	+lHYv5wW0sr66aDxpzeAA/ZM+kplMZbCOhzC+xIm46aa/jDueWmzSpncnC7kEXOHfI+1WEIecgEqm
	9hZ0ZerLx8DiiNtVi9lVjS86ZiZzsj4wUDNXjCIP86Tm3bqaI1rId74wY7FcrIl8fPQlOQnBA+xj3
	0K56W6Lx6rYUFl/8yHxv6d+cfszhm8IsVJ6S0rng5XRbkWOC/X1zrh2QAx1MB9kfsWV3lubFL5N1z
	7ww2V/9isN7hOC3SErEDIWHyEpY7WRG4m+8N5I+d0UHsfDZICBZZD7tTSBFiaow77C9vTr7y8xSsi
	k9Dqk9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tewtM-0000000FZel-0wYV;
	Mon, 03 Feb 2025 13:53:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tews1-0000000FZOd-0L9Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 13:52:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BUUax003900
	for <linux-arm-kernel@lists.infradead.org>; Mon, 3 Feb 2025 13:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=; b=FrQQsG/izShyy9H9
	1UTtnmuTDFZtS8bqaCaxbx3HQPCRNeZ5KMcOAMKF+tpJWNfTyFLTuX/lDRPiqxjo
	iWjdCjXeSi12T9ZrDkHatJznA3miLC8aKRFYF5SRCe6HzRuPAu4wq6dJx+m9kT1F
	OD3ISQ8GWUFwenWUSjZTLI4mTtdbx5yXefbt0dq2qsl5PyeaYMmt1qcvC1xa1GsE
	01c29dcq0uHpPbtu1eC+cTUmuK/K2EyLkLb/uIjC3M6NUKlbFAnaw2whVDxBasOB
	m3aCPRq0pbxrKKeR6ah3xjhXe29PCzj8WIBTb6/Bdw+y6qOLsTBJ/HrSe34TfAo8
	Twgb5A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jw03ggb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 13:52:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d880eea0a1so9741476d6.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 05:52:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738590731; x=1739195531;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pkSYbDqaSwny2usVYAuISCwLWlA3g2QgJUmnqeBMSg0=;
        b=A13ZGjMi60/IfiipqDUWn1VqNXGwXrudkA66Qe06mh0Bj4BbMrXJa8nutpnv8NRw3e
         YnSK5L9+cAJiFYf5LWhla9qUoti/2RAKq+7x/712Q7oQTHx53BAoE3gogYPqg1Of0AXq
         Gs3o6ZDLoqxkKqW/EEoGJ9CePTeqbYJN46NJdeBnQNzaUc5CV4ROSFb5Sv7av5CpaaGz
         +w0bg/7JmxBGDqZ9s4oWdsII3BPligGVmzJEYDeSAXrDx/LPvpUfiM+1uQfgW6uvfatb
         KX2yw+senx3bRe+ZF2STm/HEwR5VZI5CI3z0i47yPLbeBU5EWtBWjlwXdXsQMIhbI2ks
         /MWw==
X-Forwarded-Encrypted: i=1; AJvYcCWFpayrrAfofcHSaxqrXHBvMGy7/VEXOJHR4GoHFaStbIWgN2kOOtvmeqnUQzQIcboVYwp3d5887JZTjPhST3Cw@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3tRPgP/G5sMwpjb4BpPe+0f6RmQseJyhGlp1RZNDauuZdzG+z
	F8NU20FcFe36rzyDDw9MJNyLc0GqjWMON1UIj9OTfW9ayngBejg6UzBGCJe18CDkuMSdzOHiWLY
	pnQpsPWzjOBF87tXIehFH1YAaIH3kAAT1xn1osimAONe4jLNBB4YxWIkgCbNB7qGhW4hdfktVIw
	==
X-Gm-Gg: ASbGncsewJ/jemPLR9fjCbMZ3HAqc7S3UWvzB2GF2D1rJIbh9LrrvA4FdfFoCZ8/Y90
	as6veUoAncVUGNOQG89OhwvTTvZuJLQG9Qrj7ivCaa78THkfc7RLny3upK0gHSgzA1bIZdFWRrt
	/WRlbGw89+OIBSB9mZOK0hJdDZ0/eUZGIsy1Dg8SsRwtatH02mH37OVtdUO0nC3q6MkODkfW1RM
	u47QugbNCPqHZNc5WpdUBtNP+PdE0idTcc7DxtScZgkDgMYO7Tqu70EkIxyZ5dfB1/jbCl1MqSS
	KupUljWG6rZUvs9XZ8S9AmADKgaA19ak98HVzBq8PeEkg9zhGfhQ4A/7jcY=
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7bffcd0a31bmr1196149985a.8.1738590730950;
        Mon, 03 Feb 2025 05:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHt9A1Ywm1nPEK63UqBS+e6UYwlx6nzIpdhoFy2TYlNeJUUhk8BGO1TQBd333vNW/v3P8zaqw==
X-Received: by 2002:a05:620a:254b:b0:7b6:e9c0:9c3b with SMTP id af79cd13be357-7bffcd0a31bmr1196142185a.8.1738590729156;
        Mon, 03 Feb 2025 05:52:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc724aa0a8sm7559984a12.55.2025.02.03.05.52.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 05:52:08 -0800 (PST)
Message-ID: <21b4813e-b5c1-40d7-b536-3fe65a53affe@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 14:52:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: qcs615-ride: Enable ethernet
 node
To: Yijie Yang <quic_yijiyang@quicinc.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250121-dts_qcs615-v3-4-fa4496950d8a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vvSWYqfecjpZGqi2OzWw9Na5ZNeOIPV6
X-Proofpoint-ORIG-GUID: vvSWYqfecjpZGqi2OzWw9Na5ZNeOIPV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=783 impostorscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_055213_132218_7D5CBB25 
X-CRM114-Status: GOOD (  11.75  )
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

On 21.01.2025 8:54 AM, Yijie Yang wrote:
> Enable the ethernet node, add the phy node and pinctrl for ethernet. This
> change is necessary to support ethernet functionality on this board.
> 
> Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

