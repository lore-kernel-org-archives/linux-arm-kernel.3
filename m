Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342F8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=; b=5AeacQin2qNb2Xi2Clqr5lZWAC
	7dzLUlTcAvnsvHs3/kBsJrsSxkJVcHaEOhrGVeRGzjTtgEyoYjJYTP7Dp4b05/rQKL+RR2oK0QMGw
	J9TvhT88VqIybl0I9k+aPUNrW7nyttBY6qPS5gO5M2lcURTZyecLQw6EodYCuP5b1nqKX1JSykDYm
	8JUbOp+kcTDy0GqK22BW9qqpX94FtrXTZWw8BjJze/O9C5IBIYS7tyJ7kVuZqyN4pAICS0nR0DDoy
	c9a4edsGhD7GekQ8K5/5v84BCLeAEPgdzLfBgrBMtYO3J6gLYS7IxJ/wLyHRPD16n/ZIjpaOAdaU1
	SfY1qGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPZU-0000000GAID-3G1B;
	Mon, 24 Aug 2026 07:58:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPZO-0000000GAGR-0Xeu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:58:18 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R9PL1937618
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:58:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p3JASRzJPlo+L0XP2XXFPrSY
	1nf08xrvhVUiRcRtrM0=; b=YaoAd8OCi9DqGPBxfZmdQzFZTBGOTh05ZV4pMxUQ
	nBWSDydWpm9WYRA2YudNwG8ywZuOH4YfoTvOG1jlIK+/o/t9gRzlBCXH9tfrcQpc
	ZjpCTSribdeK46rPIgTh70Slq3s/zGsFnQhzFfWIXXTRB6deKvvzUPuS1YQmpaTn
	LhtposxvL6rY6AqzNsz2NyZ8IVrgugMYY4eyLs/t1E3olgJQShZ1hooGalPc6lBQ
	XOmJdT2atBWdyZR+Efg+HEm96e8f0MLW2ORq+WFiWXTcg+k2xt+UlbrOXukSvPFj
	Ph4EmJYaGZvoy3iHFC7Vkb0UyUleXSQsSIdeeb5tvK2Xhg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g741qx3ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:58:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d7b3adda4so32821721cf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558292; x=1788163092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=jNu9iC7XM+Cy26M3EVFKC2axoVDBrwTmqkLf+oVPY6bRoy5ks9IWNmY9+Ga3EaU/S6
         qB4IXk/h6QGr2t/XXma72BsIZNUKqoJvRdJJnAKgixqC/GLgk2N09rt9jl04s5evHFGM
         +EeQK1XF3CnLJxkNAh4eqVEja2k/6LWUpX5iKNNHLd4yFAV6aZO07fZvGF3jEh1hnZVO
         YMRN8NvjfThB4eNVTq+eh7P2dGilB45D9Gvnyw2ikA0Js342+iHYpNUSypiSlVQtc6UW
         rPoc7jjY+EZ/5COSfn5dtQV2oETFEnGc/tvVUEv962LciYdfnu3lPMxJSDugpxwmceLZ
         oR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558292; x=1788163092;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p3JASRzJPlo+L0XP2XXFPrSY1nf08xrvhVUiRcRtrM0=;
        b=UeZsYvlsoBCuTEagVQEyBSAs9d2AQvLyoq3zwBrSTL1ZRjv9h/kxD53MBYZcUd8dQP
         ow2BmaOwxKqDxcLzaBC8A510Hfh9YRrpfhEtBh/X7lb7IIjsoKKMWgRpMLLTIL4J9RxY
         +33bivZ1JY77ZMKjyWCAhHbCziqnIkbfKO7FkaBSLyxU1R+uE/VKLbDlIyVEKlcX0p6F
         h3B5d79EkjoEnugh+HvdcMkBH5f1SwOhm5Eqx+7RddXRpZDqUsubUifJt2RzObqIHJe/
         +LxCG0T1NvB3rz9LtkvzuBZgW3HPeIfkS+d4mg2KUwLNgs6LtWN35xQnMq6SCCBW0Lw0
         YiZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7sbBtwNRHCXRRVA+Q6Uc57ENqs6QSEV7c3B3dmSJPlysbAOY2+KieaJxEfI+7FO87HHPMVas7JwBQ0nvUM3Ee@lists.infradead.org
X-Gm-Message-State: AFuF++lLokVnnalyp77n8GPkEtG75L9RtP0YP/s+iqvz9t0ZqAjwjNqZ
	lr3IHPne8mRsQ9AF28r39jomoLnESZvj3NSdM2zr8ll/j15yFFXNKn594K9BjC9N2AkD4O3wBjp
	7XyaQdXE/w2KZaai5/0G1SWkGWA4Go7r5cF1VSLLCk5hyZ3VTzvG9++fJUWqUa0foEl+qsqkqfG
	8gww==
X-Gm-Gg: AR+sD11lOOW2co4yH2U1Zl7+29rSU6Kh1XtEFcOstBw50zK7BObTIJVoH34kOjXgxuX
	XqPS4jSvaCBvNO2EK0xWgcEcmKlsqtrg3vhBfWjaBXhM8tUZtNSpGxqSm9BgFYmHzE7YbqS7+H9
	L90hf91Rh0VB+iI3xTZSW/UvSnw19Eq9Zbk9yDRFnFLZfYs5MF/hbW9jT7X9Kkwwm5lvIDxZA8i
	ZRnwB0Kd/k1odyK7RmedcjYpaRTj+B4xQ6CbjVrTvoH/lQsv3qPCr7ji396LalZOyWK0XLKmsQp
	7rcETS7aaBBCXCMY0343EbBhHZnzwwGRWSBXn9OYe8ma07dPdeEO0k3+3v+UPG65jMJAqytrHj/
	RG7q1R0NAy8JSm2c=
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269752001cf.33.1787558292513;
        Mon, 24 Aug 2026 00:58:12 -0700 (PDT)
X-Received: by 2002:a05:622a:5c07:b0:52d:918b:92e5 with SMTP id d75a77b69052e-52df5a54e7amr269751541cf.33.1787558291971;
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2496296aa0sm1198117166b.19.2026.08.24.00.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:58:11 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:58:08 +0300
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
Subject: Re: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
Message-ID: <gqmzboqh3njrjgyf3yla7gzmagk73hgeb7qt3qcg3afi64suww@4llrqww5kke7>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX111KaZTaGVGO
 GVo94npWDGAlI6Lbk7c/1B7mDpiU99j2dSJqUeSkg8FGksMyzKhhpxNq1bGFRy7LJMuu0L2ttaX
 KukhYmmygOEsseRMsA4wP+MUNDdo9/q4rc6JZ+MUmbTYfXzUKCV/rlRCTKP5xN7zS3CQMqEhEFg
 Ig6/mguLT4ZbfzheQR2neNd5uA/eaxaLbD1ehvTBRRmthy8rWAQmjERnBxVw1WNqrsUfKBTWNgO
 RKyAofaP8JI5ShXmwJxuwVj8E5mbhAyGjc/IMiNnvl09BX6TnMEBECEKqlpBiCyA1z9Kn+N5V7O
 ubM3k03WRwSShVohyQsX3E2X2a5ikK/9erDi/RASX7lX2i4TickqOiJ/qQqiBCUCD6mYOZyA8Wj
 zGvNxHCG/2sMkf1DXlEOmS+z0V3FAYkAmCeBIJ5/jYwmeefzpBmvQyVzo6J/4shaHBAni4ZF4JK
 5iR0vQ1nIxVSVpgKHtQ==
X-Authority-Analysis: v=2.4 cv=GvNyPE1C c=1 sm=1 tr=0 ts=6a8bf995 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ugQu5lbr4eJmBGCNh1wA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: yi6wg3rCjVrh2GBllwfkL1o8Cj3sEBvD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX49cnvCUkqYvX
 0YsqfNaBcy/eoQ/xxnI+spEruvQLdjPIJh3hnIfNhefdZLL+0UyvWzdro3PMD5sIbm6okZFWxIJ
 4MIjYVLlyuAxVNd6lGu1DXWjy882vGs=
X-Proofpoint-GUID: yi6wg3rCjVrh2GBllwfkL1o8Cj3sEBvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005814_291263_2AFFFF6B 
X-CRM114-Status: GOOD (  11.53  )
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

On 26-08-21 21:38:56, Hardeep Sharma wrote:
> Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
> new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
> exposes CX, MX and MXC domains (including always-on variants).
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

