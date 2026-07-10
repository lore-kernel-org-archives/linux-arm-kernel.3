Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31EDC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=; b=h9xIj9eBRuZbXHbnkUppdebBzY
	UbKWjaGeragpCWTruFoNOShFuB2VzD5USxplHUjsPyeK3vRtj/7VDurKLcouVngDySCoF7gIakIwP
	0Hu3VmQR1eOp19jJCqIqr6fg81kFxeP62cTN5kh7BaeFgIlspA913qDUEe5EHZaIfZ0l5hGQEte8A
	X+F7imeI+G14lsX9N/je6+PzBfE21wW1p8ng13gd+xR3fwsX0wrfCJ72m9h/tlOBVmANpXWFNnFvC
	nF7ODkOoHzijYCw28E1CH0yx3MZrIr96qsNhTRjUxsQA1QP0TooFcPdBD5yFvZYuET/U0eXNQ9IHk
	mPZ0zLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7s7-00000004dOJ-1wng;
	Fri, 10 Jul 2026 09:50:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi7s5-00000004dNI-2Uke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 09:50:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dLMA172311
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=; b=TCjeYyxt2uUJ2vtw
	/UbmyqltkiGL0af9Zu9Gy6NDi2J8vmczKisc4AlHagWo7sIUOB+wwEu536JCwyGy
	LrQ/fFVJ3zj0XCvYkkFxvkMOwQMQyR50Lx5JZF+kJJvw8yEuB++TxqAvWDNaszJa
	Bh9Z7+8DQdSQX3UZ3Z8jU15d3RFkJWp99Cy84Qq8/9hLDWJaHhyiS6wo1G+AgdC0
	F/mCRQfN2Y1iu2m+5H5mU3INESUf7p4cMR6io2edev+3qc7N/9GKROOEVIfObAJZ
	M9Mv2JhXitdeNmyrPzKK11X307epV6K7F9HhoLG6b+qzk6AYYXuo2U8rEB19McZk
	rCoeQA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9wck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 09:50:13 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fd356ee3a4so2322046d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783677012; x=1784281812; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=g0Hwg2FP8Derk3IFZbSQ31xH5uVKBGIbQPZubhQGpODJU4YE1P1vMfT6C5C0JvlR2Z
         TmVXi2ouE0GbZEp/tYOsM6Rn20fe1MM5+QF64XqA4CMcBU3mM9gqhq7pYoHXO5GOIwq1
         i1CWreYjaz7KHGLDmOrJ5Gz6gNCR24gLEkYc6XD6KTTvUCiaKz/G5om8L7uMFliCB4c6
         k96md9IryJIO6ANkeizAjlEc0+TKAdvo1p9MKcn92MH4B6Z0bW1TXyRxXUEF20ViTDBH
         c+TrbJYDG2iuK8VLkR5QdFHFBRpGdy+e/JCME7DvQ6WVc4xH5JeiZZoCNUJYb54mdPCJ
         GiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783677012; x=1784281812;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yLjfNKn8LnSz2XFrVVI8/j3tvyUWqMbqdwNr8lAk6oE=;
        b=p9135Uqk186vBXtj6S+AQACKtIoYZS4E6X7R30ZMmiIkGw0tKSGkxDj81DY4+Xzolp
         zwPrqOIGoM1hIHLUi/j12/PRlqHhzk07yYStdmsSVC7BLN/WcWlmWEVi5Vl4s6AWl/22
         bC87FE+lNdwqE3juSwO5+pLJLYvTlwrax99E1A4J5rw4ahXEreDBkvfAWLslkOxfa+p+
         iSV0Wt3r62VBYoaB++GPMvVxWSqMMdF/+6vqg59gzWKplVeNZp4DoVO1UfwJBkQX4KUV
         lskCpcSrcTYOdiTRgBS/mGJtqi/xth2WkWlEzrAo6tWqkW4FTjhYEbvfa+f6EzBRmFNO
         T0Rg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/0i/YuJexhIuVVejE4BJNrc+mY62oHrTJEPsgTKrCIlhRqozj51+rlaDZ7JcRJNQ5Mg6T7pXamFQRs2QDHR4Y@lists.infradead.org
X-Gm-Message-State: AOJu0YyM0lZFYxt8LQkGqw7JJuxmiI1wmQtvb2EWtnam/A75H0dE0IfL
	KhkxtrVGTVumWhmYQI31n2Mzmuxo4Z0fqui6goBwTAtyMlZN1VPAciQ9j9LwUre6MxmuQIGznLa
	ZIxDI8whXjjKKZZYhyW/E0OJHZInSUbF+LNF7R4ImOE4XRILsROq5QtWwTuM4/1QSGx4AnBkHy4
	wxeA==
X-Gm-Gg: AfdE7cntFvvavL1ukgIfxsDo+SkBP3LA/OX1/qwtqDQLj/98UeJ0huNcOsx/NfYWj7h
	OuWpciICJlP6PCCJckwdAit3hJzL5UStGcrYOhTETK9VUmvrkff/alIBQTScGQJYmsxdGZxrdFn
	Yl38GWK0D2saNbqfX+6lQ9jjArqjFZAuoxS8NuNWE7Wi8XCDYQWmfd2a/4qXMtgaCEDmU2TRxxI
	eKen4oBvBnzxmTFVAyBfprsX4tW/WYsBDXUx0QnkC1NvGZ8A6BkIAi//0HZ9ywsHn3asHCfoNd5
	AJ6YLorGhDd68oUfeFYDpDTbTEfnZwyGzGLm4eK+3hm8qQleNsqBHAGARPK5/NEgHHLSM8SgiZq
	B8iElDbmTb8gjldlR7MIYRBjRT4IHFtiHbEs=
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535956d6.1.1783677012146;
        Fri, 10 Jul 2026 02:50:12 -0700 (PDT)
X-Received: by 2002:a05:6214:40e:b0:8cb:e65c:e527 with SMTP id 6a1803df08f44-8fec5b45e37mr97535656d6.1.1783677011733;
        Fri, 10 Jul 2026 02:50:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.50.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:50:10 -0700 (PDT)
Message-ID: <31905a48-54eb-4693-8725-71f065a8bc92@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:50:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c055 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HHMlELgPwHXHAMwrrFEA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX8+bQUKD8NsbF
 emOCGuNcE4ZMkXGTpNYtVHG2IEdqsg3xdMaTxaXM+RgFOBiJYAcdaQhP2N2hyoaaECaT6y5sSm/
 X5RuOoCnPZZx9ofMqZEt6s36iURjl/oochP/w0POl/wiQoNItnMalQrlCc7TcvInnTvpo2IvjIQ
 wiJSNMhIz4SOujwDWSd2AtTgHsD4nCdyMmExpl3LRR8Js7DeDoI6k/43MbCUbehPxNAEdir8XCs
 SsyuHCya7j3S7tx0iAwReYbU0xyGjcEPF/gAtw5r2rEibHCZrLStR01PuineW12AiWGf9PB35JB
 DV43cnrWUoWeQvjyytu5n5wyFf+PBANEo1yN+D6LiLPlCBt0V/aS7U3ooKo8njzdKHVukJzyR0c
 lRlBaDoJhOqxv6FKMH44ZDim6K60Yw9BFUPm2f88J1Yzps53TfjAOdYzFuxVOhPnr+F6rc1mggq
 E0b8OVhI3GgEBp4ljCQ==
X-Proofpoint-ORIG-GUID: 2BEeRAV_nnVFBW5NAZR2e6UjhZuJYJjg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfXx9peFY0mdPGQ
 phSFWRyMwNBc0OT7Q8IyLC1uZJ06FnjlMt1xqBeFnyXVNER6yaUmIKWEiHAOe07LbxXD7PyAHyP
 u153aSDnhBmIdplN3MuGkM8LbSe4ISA=
X-Proofpoint-GUID: 2BEeRAV_nnVFBW5NAZR2e6UjhZuJYJjg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_025013_650898_BA510811 
X-CRM114-Status: GOOD (  15.01  )
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

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node is the system-level Aggregator TNOC, so it must own a
> valid ATID that tags the whole aggregation path. It was marked compatible
> with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
> an ATID. As a result the aggregator had no trace ID and could not tag the
> merged trace.
> 
> An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
> the ATB sources within its subsystem (TPDMs and other ATB masters) and
> forwards the combined stream to the system-level Aggregator TNOC. It
> carries no ATID of its own, because the Aggregator TNOC downstream in the
> path already owns the ATID.
> 
> Switch the node to "qcom,coresight-tnoc" so it is described as the
> Aggregator TNOC it is and is assigned a system trace ID. Rename the node
> to "tn" and use the "apb_pclk" clock name as required by the Aggregator
> TNOC binding.
> 
> Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

