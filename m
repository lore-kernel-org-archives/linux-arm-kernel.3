Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082DBC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=; b=LJpjsxp9MM9oNjUrE3qKywBQnA
	brR9jTFqdhQc/xuFnwk7iIyS8cte8UV0RfIQb3u/+aq2XWmwCNbK+thq0NeGXGkQ0jOZye2yDEGuU
	8i13KnpkIhWe7wLAxRtg17ITUtfoiSnRwI9y8uSQsI+1ATMnkkwmMKGQ3f/vGiRuQn3LeIoCkBh3c
	gN6hauDX/T/914pb940LeXALpFcbjtYESCq0gE/JSoY7g6jdjnHb1GquO+ECKILYO2fGSd3l32ih+
	cTkMZXUZiRbwitYxevoCthwuxW1or3fMyW4QpBFDhISMVj9paF5ejnxTAvvJbwZErqL4ugnUKnO2h
	aRIdh7nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Ov-00000002c5V-41KH;
	Mon, 14 Sep 2026 07:46:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x61Os-00000002c4Z-1WW8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:46:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4F3063742
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nwYpgflsInUUYK4VL8amNhk+
	D/quGcQ98duZ4xjrjTk=; b=KKl83eIzRltCkPZFiyYmI7YU1hfSgBdKpYEdtjza
	VtPwAm9lnBH74olln+D5xlWhg1toP7sqIO9RZDPRX7mcK3n8ddtqlFbIpTOXn/OL
	nNtQq8lNLZ0F3RYu9T7yZzofTvjJryR9bnWr7ktGEhsI1+6uhmev5yH1n6Er3ubL
	1YupiKTHf9SF0cQgiL8PLGyDGq5xerqj6EbjPy91EAxCzUtbSiM1UFDlT/j9qrmv
	cggbMAQOmFOkSJgaUNB1TF4p3APn0/KbBa6Ijq8yz8Gh2JtyRK/X1CI9F8/uxSji
	t+T3eqGF5mE06eo5oBnvW1swEydqI7WqXnHzNCTBbUtDAA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnmsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:46:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93918756165so559955085a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789372009; x=1789976809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=NYjhGmAvXVxWJbJtGmdX2sKcmgA38jgn6iL9SVGrSQcdHZD3EnOz3ynrYD0WiSLQsv
         tW6LICNAn/Jmm/sdkch2uyWUUosxtmThr23WjCj7S6azNpccI9oeUjmPMkMWxGyyJsMV
         FIDUnGn+Q4XbvRsIQil1G2hys//ZHnQy8nBpYKHiBDTvMmmz65X4yo7rkAfbWT6tk3lB
         SrPQswCBKqU/8U8kLzsxAo1qhTdSvoDs1OvZaHvH+JxUyF71ZHmTn3TEm9MujQ2A1orv
         UzJMJc5MxgL+ehqexkzLwNlK6FY5SvOmlQ8SKGbTckU5+f4wyRh3dN39YT5jagmR98kE
         WMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789372009; x=1789976809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwYpgflsInUUYK4VL8amNhk+D/quGcQ98duZ4xjrjTk=;
        b=H8CJb+FKsSC6hNj37iuPqENU7UKG04rwAXgaA6f0v0IuwT5mqTatVcq/e9ZEG4fY8s
         oyzKLcGgogZlOzoGwPdTbDmm15DxqOEq/mT8Ud+r5gsJFh/Phs910/bnZd52xb1NF0FQ
         hRHgkI0kiGDBChQEqS6wcUOu80m4eS2kuGiYOLv0/MxVDzFoOTi3dr3a6Qcei+bSe5HY
         eWZNjVyQq+lE4ShJBY27TEJNz92JRDxLpnXyGWytyZse8KCy0b3DboGq1GtHNI9xYe3g
         tHUoz8977vCSEKMkc1WpKR2vGjzce6u5DwOpILZSNiW6TaHZNqef6WUXn86D3Ntg9dGz
         HcqA==
X-Forwarded-Encrypted: i=1; AKwUvBzZBZCHUNpxapTAOGHqRbK+XzVeFvXa/nhmSbmnwBQNloNJ+En1tw2vefxAa2rV/o0pB29/goHlHtRnTCSqz7H8@lists.infradead.org
X-Gm-Message-State: AFuF++kQfa3Q3q9jPTnkkZE/xx6G6gTnPwsUO6PgB4/pA8lS2g/GTJxQ
	/b7+YCsD8W1qBtdoX3V9fcuabf543A2k+kHOtrNUKC2GQyeHcS5KxpT+fDsyWiqixjBwmpuL8cg
	kDXVDMUEl8T9KQ9kELRAhY71/Ze2trOrVM8+MH3UTOhwrs4Gjoz/A2Con/5oZ8qzGWzC8Bgx0pf
	GWxA==
X-Gm-Gg: AYBFou13vdS+GRT89lgsSr5H0VmrQhI7P/z0efVvRknNLZrDc3ZlRzJB34kSS7tDnnG
	Vsh/9uqbeRg/F69M0Dzdq97Rv16uo6kMrUh5RpA9HZyRWloZOG4Fyzq+pBGbx9AeCLlEdoO/mDT
	vmgHrz/rrwb2LS8gIajdXq4vSSfRSmcyNzSIUlnuvqckhFKjbs+O0RREYEXzMJ82BEMgDYkmI4q
	ZmPXsvSJ/h2uxzYnnJ9DfcMo8gHMJGLF8seELif6eNsiRIE5/TSd95NO4ta40yJYbqMCSLu1d1n
	bO/T85UahAH2QPxxNjs2Y/Q25q2e229HTu7Sy/VHLOKvs7TQsu7j+RoVttVv13oZmG1Og8qA8Uc
	8g99JjmVEdXD90Q==
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185030785a.12.1789372008588;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:939:d38:3ab8 with SMTP id af79cd13be357-93a297e8fadmr185028285a.12.1789372008058;
        Mon, 14 Sep 2026 00:46:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e0asm429923155e9.1.2026.09.14.00.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:46:47 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:46:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/2] interconnect: qcom: Add missing depends to Hawi,
 Maili, Nord and Shikra
Message-ID: <4kwnvr6azz2hvnel4ti5epqd7tyj6lzxgbkqobltdthdpmxkym@k6cymd6tah2u>
References: <20260914-interconnect-qcom-clean-arm64-v4-0-5b2c0e6a929a@oss.qualcomm.com>
 <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-interconnect-qcom-clean-arm64-v4-2-5b2c0e6a929a@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfX8swqqIJkH47U
 rADQA5FyW1xR27Y+zl7NzBQVASuEj3Z7ADNNis6QTsb0h5yZPVaLcxbZi7uzGeDQPnTFfY3Wi4V
 XtXbDGnJsTmpUfguWrt9YL+EeVZJM/G1bI6lVTbvwR3eS6oRAikDCGL30BiYS4+1MRa/+m5egXx
 t92yyZoii4zupu8kNU9GJG22VgJEzr8YEPExO8gkXrC2sxPrjGcq8ZQ0RhhD0Cu7zF6jcrn4/8N
 Sf4g4p65bYMHgJYRphzfKlOsH0HAXV/B3sQb9DFwjwuVaN/1K0JkFALZRJhSQbiZRMs9IxbX6EM
 WGplKX7uGwy434ND0wjgdHCA7NroJ7kRDSJAbC1JZYsBxxH4gsTWeLmKYQ2cSv4o9QRuo7eDDPM
 OjPD0CbLHRfnn00ac8FxUQEL6QEjNZKcqlkMWl+zFsl1b0+62cy/sY+CvW0ve6+pQwZC7gl1clb
 5Y9fRKe3dJfFuhVXkPA==
X-Proofpoint-ORIG-GUID: O1FxmRluEvYB1QS6qL4zXJ24cSuoKYvp
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOSBTYWx0ZWRfXx9uMIGsGid5n
 IzqST/X1Xccr/i4eZ6bYLhLpgV6i47Oh5+9nsyTF5MdL/gHfuBjzeWlmhP30IJL/PQX9pYZa+Z1
 ghezB23y1PvVVuOOm8G2TZ6t8Vz1irQ=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a669 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=bOu3b-dmFffoK3qT8M0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: O1FxmRluEvYB1QS6qL4zXJ24cSuoKYvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_004651_549626_728861F5 
X-CRM114-Status: GOOD (  11.82  )
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

On 26-09-14 08:44:05, Krzysztof Kozlowski wrote:
> Hawi, Maili, Nord and Shikra were added in parallel or after
> commit 5b696f065843 ("interconnect: qcom: Restrict drivers per
> ARM/ARM64"), thus they missed the update restricting them per
> architecture (with the same rationale).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

