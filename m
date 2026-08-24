Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BDFDC5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=; b=ornJp4P8GdzFVICbVXlpCSVZuW
	z3rsWjlmc3DZu8iQgO3ShN/2strDWixJ8P4TpCVCGCxj9N5WtMbKYLMVH74ocpG+IlmTUNtdX24Rt
	4Y3XbJmTtv/AO/O3jc9GqFMs7kNAqg8Hkj2FKyIC102uWviZzmezmeqNN/Evt7XevAKWdAeTD+lBc
	jgF/H1/jXCrTh2Ijj8lO1K5Df/fdepWtoc8Eam/khV9z9vQvsDr8tQFVlKV6AbYIv0DTLRvkjoNLZ
	GlvF1hHWoH42I+gLwDUlrP5pvAmjKUXP5XYrW8DfzKt/z7gQ+AZqarYbo8vHis2AJB+oR0mew8UT+
	3vd8sV2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPIp-0000000G6uD-0xKe;
	Mon, 24 Aug 2026 07:41:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPIn-0000000G6tn-1nEV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:41:06 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RYA52042553
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:41:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=27aV82B2iwHpqeN6UcRflHNO
	30IeqGoP2gG6U77lA7U=; b=Qi8LoCT7QC+bCW8Y2IWJiN22jB6q9JMo+jE/HwLZ
	1NYR05hrm6/W1X4knaq/TtgBHPHYQYo2wtHFucITlI8bi88cn1da77bNqvxtiNe7
	gShKs3D8nA1kf80Aq0jRgM6HE4CJw3PN19jyVdDGamiulJPYzN961GiuqI5vFUuQ
	QNmBLKaFOeTUsk2vd6aXG9Mm/Qw7/l42zmxIzeNfj26JkM21P/JXzbd34CVu/6oj
	y/4K+Puzwcpf5a1E+fGY/Q8FD3N39JuAK6Yr1KuC3aAm4cTBj83gZtB8zQLMg5Fg
	iy6v6TT12KeEB26h7ucCfb6whHwP8q9AbimerF7Wa2KCwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hfk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:41:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso29928341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787557263; x=1788162063; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=aHb7HOdiUwjpRRVkqKjSgwryNu67FVqioTZ/d7bKMQU9av4OLUAweDgjW1SdAIg9dq
         QW5ZGH6Jr+ErZyDUhQVaavg0UoFDQ6ozFxIohRmOgFADORdQmfHtNnA3WefS5m1o8i52
         6+wMubSLTGQMzWme2u9gzRV0L5F7gp4UFDV2GL4f5kPHjykHgnwpOyxf+dsZ73ZgVyE/
         CSRDTjHAhs3J/vBbnBXXGSpViKogHddcXvg7l3Ck51hDfKgiAQiC1KGEnFvUth8D4qLG
         w7y6/MwZPaz6V4YiTr+bO128+VNs8gP+CEEfWuCgCAdlwTK1wrSPRFB/pAcv7Pn4n7/q
         cxEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787557263; x=1788162063;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27aV82B2iwHpqeN6UcRflHNO30IeqGoP2gG6U77lA7U=;
        b=n86Tghy3/YcGNNRyY5Q/9oox4KyVnkmxBXdPuBesKqXeV/EDY6xUdYaobpWwv08CDF
         m2nNefKjhf2WuV8sFj8la6aLrC57snXTkc9IJbfd79lVibjK3i5J4LY5WOhxBUbFEItm
         KEMmnZdqWQkACp8s95va9Wv+jJWRp4sihqMqFxVzi9vOKjMrxS1dGFMkJnEwr885Ovsx
         qwjOTzsW1jUgotjpuus1YfVGeiJaOu8tCqHlRw1cRh+3ISff81mDNnveUDF9ixL1RBba
         cWqUZsGxtwgOSJ+qnifFcgWxQDkywP7k5MkcbLlsygnVkfGVxttKPnS5SzwVv5yaIFTJ
         kh3A==
X-Forwarded-Encrypted: i=1; AHgh+Rqx3hupi2CcDSXrZZTLR+AAA9lXP6pnjFgCHPRt7AJYwWeP95Boq75zUG7qVT34CxbUvu5eeFEG1scecukmYutx@lists.infradead.org
X-Gm-Message-State: AFuF++lXkHWMUqznaX7kZZQp3CQ6mlyrikiA04WOlBbnE9Q2zUXXbySn
	BWNDRqx72vto7FxpfwKWuxS7+izHYZpG8NTpiYJWvbhUNVBHBdNGOtq8bapFMZSMi24LnxKjycl
	YHiqmVLhM5gRU3HRC1hnDAAFllN62MEQvbl/qFy1P+dvCD4ndXATbQe3tCVAPFFaQL7AbLleZQk
	N6WA==
X-Gm-Gg: AR+sD10VkZr9hf9VnHvb3cJAwd5vfjkDr3rBe+D3ISGrG8BAlGldYfTWx9atSmzhCVh
	R4coECc7MoD90WCig1xKZjKva2pqNuklJD5DmQyGgR2UTiwS63r4mRZK4TAHZMlawQVdnadpGgG
	HcFckX6GgCuUXUn3G39j4L/lFdIl+P+p1TM3Mvcb9JdoTyEw+OK23oJirLy4KDrh3/Yba4O0HcI
	76BA1pvnZSMJ4XElsxrq/oQwx0lCiIORn6DOQzWrEv6K21UDT8zDoPJviclfYz0Bc5asETv0JMJ
	P25P6Yx//Biyp9vqzj94pHy/CS1IT3YMFdBbBTR50mthJK/KtmnkDqwgFto9ddyqU+6ePJzXCJe
	KYhRlJEo9yIEEm5M=
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786291cf.19.1787557262871;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:517:63df:91a5 with SMTP id d75a77b69052e-52de33af115mr214786031cf.19.1787557262330;
        Mon, 24 Aug 2026 00:41:02 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24962bd8fasm1717117466b.28.2026.08.24.00.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:41:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:40:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 11/15] clk: qcom: Add Global Clock Controller driver
 for Kuno
Message-ID: <jvtygc6q3hts3vynb6jaivlmryrhzkifxiyiaxoghukkfbt7qi@ch4k4adkpdci>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-11-196e2b306368@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8bf58f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TGsF1qQkE8-pbLwaU88A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfX2mYuw36ZJS2Z
 PQIlkYp2iKt2GH8WsXj7hNnCLgVDbm6WPCGxpFdxOWTOYTjM5okebJV5NlFPSM+amYkbgtIjMs4
 /0V6HX1LPzbb71dYYNffdyy6nBOvac8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2NiBTYWx0ZWRfX7yS9o41u0/Wq
 nc7YHIFowJbApnE5OuNloaAf+3kRYfFQxu/79B2r6GFAcmkI8VoCRCXDYbjjNLWu7eJNgzGx6Hq
 4nq+e3FdB/5DITwYzfIPY0myN4j5XIjBQTM/C8e8VVM+MBszIBsrMuhUogM3MqqX6xnUvP4DZX8
 NUr9EsAgROyuTZ04ANxtRSI5bnJ79h/Y6oZXwgwN9mUz/tcNNqwLoYQcK+/u1HS6hqCE4I2bL04
 n/Nt7Tjux51zNI6IcLJm3MDRYEtDHPsEy1QA8Ofh4EwMShw42eBqEE3fJaBi0eWMnGUp7WpJd0o
 3b/rX6HPyIi1FcdYfxYpCsv7tiVme2HBik2piIwv6wlLqnBDd9GS2OT7V6euh3KaQ3H/FMNKFGu
 eLMBnW8lgE61biydrxuiknnOkn68heNxMos3bHLavXl06ehA4ziIePSm5kwxjEalEzfBztt3uft
 fyGwVW9coMEhpXpopyA==
X-Proofpoint-ORIG-GUID: FW7C3C7D9gj8sP4GpIL5dc7qFc06QPkk
X-Proofpoint-GUID: FW7C3C7D9gj8sP4GpIL5dc7qFc06QPkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_004105_469841_1B39BBC4 
X-CRM114-Status: GOOD (  13.36  )
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

On 26-08-21 21:39:04, Hardeep Sharma wrote:
> Add the global clock controller (GCC) driver for the Qualcomm Kuno SoC,
> providing the PLLs, root clock generators, gate/branch clocks and resets
> used by the peripheral devices such as UART, SPI, I2C, USB, SD, PCIe and
> Ethernet.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

