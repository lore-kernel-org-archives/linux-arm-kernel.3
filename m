Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA36C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 09:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=; b=R2S8pFPFSuh/8V7RWydGPdd9jm
	W4zm/28AsGfSQ6fEOlayat/8y73NK+ahIJSl5xLZsOKYsfv3Y9QNUs2pfRS1FtiS0nbzy8cBs8VdZ
	v1/FncgperiVjdZz8TY/7Sz53SA/6CWyolLrU4Jk99+dG0zS68Vl4TdiElUBtwXFqwiR3npzwrxVs
	FsbrwkyUCbu1p9YpJ3TGd7QzEqPKfPSmVvWib1ypuopLZE4my54FeVJgSIP7H22yS3I8NrQp3wQ+Y
	ssfrKkPFEYnmBFRL8B72lmcqBOW25i66xXyPGj3DqIlhnp9c7YmLNxXYH3agExadNGgOykZSj390l
	mNCis6Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PnW-00000001TSo-16l7;
	Fri, 04 Sep 2026 09:01:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PnU-00000001TSR-2pNK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 09:01:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847msY02351612
	for <linux-arm-kernel@lists.infradead.org>; Fri, 4 Sep 2026 09:01:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=; b=jdPDAK053fGQzOXD
	4cj+xPyScRRHFDeNL8zcHzs4mOeJur0khdg/RqOwN2LWNkaAIBRuQ66CDy9SNfUz
	cdjxEZOdcuoo5xTcBheqPhDXrE3G5fga5X8nlO191lDpsOMTqPXi6oWY2jljfKQV
	59dl4zlsOQKAGJaFwidGakLayrYMXJrPbLTGEjifEYBP7lgmaCOAlYeIx9GCaBDf
	M2HQZMn55+SmjevbfDJp9azLFpkl/eyqSfKf8dsWQyuZeGef6wUQhnewV2I6jRla
	FTBgBvCfz4S00/OEhRxPpzd4j/JAyFQY6vx5JFZwoS0qJnO2TdcU0HCQ3mRYVUjR
	lvuEAg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfp1fh0s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 09:01:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53002215979so1989911cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788512474; x=1789117274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=;
        b=VCbCfeGgX6+m0QhNij5ovDUk1VOJ8jDD/d42st0sgyidmAzrFE2/+PaYz1xgmWLeId
         onyuu6nnsC7f0nkq/guHkykQWqpX3lmpyfjMrdF3p/0whY2wsv6PPum4fHqro5lt04tF
         H7EviDWonncFm7h9zT9ALsgRmvpwGNb5SBPvmDOd6OpH9dZGeKGBksS8ew58s/byHbKP
         JsQOdjBI3rv/GG7X3ygtn0UzZfNU88FKpC2XdRr+dNlLc3ZkfBTgLjoVmY2k07OYyyTl
         PVBEDWyjzUoHthzFNls6BpQ9xLQTpSMSTHVyJKsBwcmpibz5Syccvhz79uAPW3/1uWgO
         C77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512474; x=1789117274;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XfbM+zSlZv8MMTw8htQZYg+PCfRFWtMlG3dHQRCYpuc=;
        b=D6JuBbsQjBjJrLg9XFkfNsilB6Jstqsfuq+4z3kMB6/x+6+UzBcDLqrWFnIRlYLStQ
         IDALpMjB9SepVxl/m8aq1JTw7FVjC+eo1EgmGaEc+DUIJdP6lNXnFpVtK5D3wSmf3Fxj
         2X4QIz37NDFwsvdsSWEU7iYDpiWDRxYceGlgjZWHo6FMr+Qm8HyO70A3+eAfDHynn1Ix
         izYRS/ISDdoencVzy5aYPR73UMMzqAnf4jmMjOvT6nZCH0FG0Jf4FHmqSUE1XMF0PPMQ
         t1/VfUDBU1UTpEtKxzjvIYD+GU/aksaJ9dq+cgg29+e/b+uv8L8wVodE4nUOl9gRViwq
         nbnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI8pZV2atDtCGfV1Heekr9+kYDkZJqJLsLSKNsNpPZ7EkbNcqv+gncOPnETmvzhDpu7DmIRTP45D5pQQq4okCS@lists.infradead.org
X-Gm-Message-State: AFuF++nyj9byiRfb7jHm5Lst6aCKJUFcW32PCOlf06j/lqLGbRkjEMsm
	4HkIbrKQpFGUAw/BOx6m4/Dis/w6qTQkVMcZLQMNhofRwGd6p99Mk8OIM3u3uVZJA4zngA9XAqH
	Weeo2BjdSWUnc/B2Q1sv6pCuATzHIt6wDOewlLXlOCjIhCRo859Ucfw1SLDdMIBFGVqK8Flt5KI
	9i/w==
X-Gm-Gg: AYBFou1a1DCUFUwK4XL22ctsk/R25c0q30NW4FXtPaj2mEuWPX8zfmeWRafB7UkpVSQ
	S1EHGd90k+K2/gRZjfWy3pteLVhth7QCCoOtw62cnJBdm75hHX4BuvhXp6wjXen94etzgEuqi+S
	FXUTb8cZFnrJAVI6EfKWqRUcxjS4E0UR9tC4QcupLb7LZC5fIiUBelZeNwzoG7Tb0WhPE/55yKZ
	n8MqcER1+CBOz7lJIu1KQVaa9x7dPr3VI36Elf2IO2Lf1bNXipniCiueka9Y4FQ8R5hgvGxQi/H
	pD4YOp0cBD7dUuNF525ddJYyDIBR3kHt3JLnnY57lMVmhI+jYhFVB3z6TGRgoGEHPQgLsFg5rov
	WU8Nkzmc5qC/wUfkAi9uvsA==
X-Received: by 2002:a05:620a:1b81:b0:939:2c96:1551 with SMTP id af79cd13be357-9398055cc61mr341424085a.1.1788512473939;
        Fri, 04 Sep 2026 02:01:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1b81:b0:939:2c96:1551 with SMTP id af79cd13be357-9398055cc61mr341372085a.1.1788512468661;
        Fri, 04 Sep 2026 02:01:08 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm76155866b.40.2026.09.04.02.01.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 02:01:07 -0700 (PDT)
Message-ID: <b245d6c2-825c-403e-ac73-d569820895e4@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:01:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] soc: qcom: geni-se: Add helper to set SE clock
 rate via OPP
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-0-091697dbeb02@oss.qualcomm.com>
 <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-derive_clk_perf_tbl_from_perf_domain_opp_table-v2-3-091697dbeb02@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+xnsKhN c=1 sm=1 tr=0 ts=6a9a88dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=9aiwZt7zaXvVnErAyWsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: IT1TjVSsRfMowwtpIEZHB0UFH8fd_eWO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfXwPi7he/DYmWt
 Dk7Hr9ZEUn929Hr3FRgDpJk62E8azIVzeizpt4VksB5hlZMXH3U/d279H0+RDMl58AnTESiVPCM
 4Wtf3eUMPftS7t+bRyUl8q8EmxjXjp8=
X-Proofpoint-GUID: IT1TjVSsRfMowwtpIEZHB0UFH8fd_eWO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4MSBTYWx0ZWRfX+GiajSV0WsGA
 ogeRSljM5iPs44sbbqQRouggeh3y8td4/UVJ6bIYvC2vNyLgyDJf13H9rpGfplPSTMlwrdBWk4B
 SjQ189ZtEf1w6knC6/uSlQqtXAu4Kn9GETFYpVvdlC1lDAyeQqx6FJJ3yZjoT5xi+MB7S7o854b
 XYZXVg7AkqfDuvlgV4Htedk6gzKZKJsQGLDvp4N35U1N7Gey95tvUliUr7i1kMpc/L36vD5gOjO
 vYsMFapoqIqZd9RnXyN3/7x8NptuES6BCFU0J17lSL+4knsarWj1vHN20nnDODyGKdK1wRZxsTY
 i07LR04Q+bRX+tOxOvZ41JYN3KKIV7iUIUBvy4IkRwJOb2w8vuVA0/0u30+M0F6l3W8BoyGTvIT
 2ChjzFaT7m9oVn+K8jWySZXOZG51BxF1nNcQG5SuMRZlDMXAk08N+rKrBNC+eFeDyx3Kcb1NTkT
 5iyKuHHgdcYf6ZB14Lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_020120_830996_F0809DF2 
X-CRM114-Status: GOOD (  15.14  )
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

On 8/27/26 7:59 PM, Praveen Talari wrote:
> GENI protocol drivers need a common way to scale the SE source clock
> through the OPP framework. However, the device that owns the OPP table
> differs depending on how the SE resources are managed. For Linux clock
> managed platforms, the OPP table is associated with the SE device,
> whereas on firmware-managed platforms it is associated with the
> performance power-domain device. This requires protocol drivers to be
> aware of the underlying resource management model when requesting
> frequency changes.

[...]


> +int geni_se_set_rate(struct geni_se *se, unsigned long freq)
> +{
> +	struct device *perf_dev = se->dev;
> +
> +	if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
> +		perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];
> +
> +	return se->has_opp ? dev_pm_opp_set_rate(perf_dev, freq) : 0;

For !se->has_opp, this silently does nothing, which presumably
may have bad consequences if the caller is unaware

Konrad

