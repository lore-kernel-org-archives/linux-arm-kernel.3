Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4C3C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 07:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=; b=nPuSz/jWbwZgaAowNKf3xx4UME
	pH+h8KoR4ojy8iFo3ImC0b1jc/YNAHPkteJdVEHVwE8bBH6si2hqdq5sG2GZ+KvOOgXX7oaQiKzzU
	bKcGcS95bvVf8Rw2f4QlWA8cwmLTIUHL0wbsgtHnW6tpNyZuYmZ6EpPGMR3lnO2m/N+ujEqgnELYY
	1puBQbmkU/dTm8tR3oFavW7PKmCtNATrkWWYxMB56Nn3GCFZpK0zlpbK1wUoNYcYntEYr775RX6IQ
	6AjsNPyYoRo1D6e1T2l84BWDKrPYXcLilvmIpOXIBbuIAet9IBy/mU2tZGm1rqJ7N9ubw3BuLqhAi
	qbFmaPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPaM-0000000GARY-4303;
	Mon, 24 Aug 2026 07:59:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyPaJ-0000000GAQp-3SoQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 07:59:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5RhOH3067344
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:59:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hwy34XbCewo0bCBjlQRatKiE
	GjO+3FoHbts9Y4GEKpE=; b=KNZTul51kgfQ8Bu/0L8pJkthUJ7iFr0jUmkKrkis
	g6sq9Q44BeBeAuCJ2E1GUymNhl6LJzTSU2COMFs+9ybR0c5g5yKYBacxIb1q0+MP
	iYIC42PrRoFxw7Le7DYJxv4mI3/yGDTthrJnhnl5Exr9eA4l1yf+bY01pY7nlqQ7
	tPboVXzfVwSMn944Jzrod4fBlVOFNCnmIOC0vZsKww+AfYO2hKknJrEFS8nO/p0e
	DOhi3F+9eY3zvOwTt9L30RoKBZ/ghi/UmEmqrW7zGRvseFyaHjyfHba7zsprbZU8
	pKSuMDAPmkdazz7DVccXd8u0AfwvQnTy78QFQU5za8ewsg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jphj6s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 07:59:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-526da7e3c9dso32256401cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 00:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787558350; x=1788163150; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=IO1aNEkxyLyBvarL99/TCSCNvwkRymiL4nt7NQiHL4ycODWDZzvRhyzZeFU+N90sLm
         +ymt9HhuvBj3BO+uWrMGclWBk1N8dTsuITNJqKgHfColwf1CDHgssaUD1U/vRj+f4IQj
         qhAmF1HG1jp5WqpjRTE0RG2wAFQ3ahEUvXZrBw1RkoMY6h50U8jltHj6VZBGf+xIIFf4
         6lV+e5NjtwxUfa/oqH3455MDFhwwEIH5R3rQ+7OWHh+rUyFe7j1P+v1GIE2EBUAaOCrO
         77gTqWvEa/IobZYjdhvDJePw3z+/IHKJGzTINA4hr1lbH92oa8i9zlN+1uLJZRni4Xpe
         fIgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787558350; x=1788163150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hwy34XbCewo0bCBjlQRatKiEGjO+3FoHbts9Y4GEKpE=;
        b=PqCCzF+SynUdGqBDlZB+/P7mc+B0wq7408ca8DyDqAgllm7Cfsy7YI8NtH16J16T8H
         bzHek55rSjGbNriD+JWRrKHdYtLkTrG6+PCb+rd1+qr59gyq6PcNXcbo7oGctXpB6+/c
         IkxBJuBHbQPNat++jeKYFmISEwxIpJ9OqDT+2TjH4mkhhRxxvbV/Kl8XpuZEH9MfUy47
         2sRci2C3rrSmKdtZ80L00yTSjPNbv2K4UI9rnjBEp8r+wH6snVN5Jm4d5F2l9ikso1MT
         yKWhDLQLlE0zbiZvAfSrO+eP9nkgqrYPoXloIOCa2CuYRf1zDZi6dSpfNGavenwPT2Uz
         fRbg==
X-Forwarded-Encrypted: i=1; AHgh+RrkUH5Il1nR7H8XYbfRlxit3Pue/pIV8AA60xIFwoiWb6ePNTblHjLmu+j8RmGI4NytQAojwMVR5uQ9cw9TgccS@lists.infradead.org
X-Gm-Message-State: AFuF++n62DOtDmqr0XKDOqij/p2F5Orf8Cx+epwA8iUsPExrvT1RVjfM
	xlkKK+oXsFjy79hHxf+GLDdbjSlil9zo9Npqrg8GSFcXkx2vi6aDcuHPRvp4YLfLxaXgvylZsrd
	xFesAMpr5LG5kVdsrvud8v8oc0PVUElOoogqw+iHzSDPqv0O1cWzKTcqQpWvwPquTMyAw72hoVX
	hZEw==
X-Gm-Gg: AR+sD105FjipnHyyVEBzSBsxXOIKdCPUdHKCJyhbx1S2QDrgWlkgPqWD5mH15O5Dhe2
	tYmYw7wgBWPYwdUTNS4Ch86EhpqU5qSZ+TxTFdKxX02/AGMCDcMyyHUU1ay1hbEL17Gq+Hdmx6v
	qhiA1qiskPO+9++DvC+mve9va1kq8qW9z49X6tgNyuxer6quM+DXRnLCqC8S7NhkSLncC06Gmci
	+qAWgzFXitePAbuJFiUXgd5KYgaqMF6HgHlyDOqBZs7FMEG5ygs4JlRKDfZT7d/qnobDMCTsdTS
	5D6yhzCwZ3Ne2esY+rzjg5DF2bj7e04D2F8sn4OJF+yyjn5iQkZhbZ1fPN5I1xL0C/QdP0sDy6S
	DSp4Crz0Bf4DJTmA=
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154416791cf.9.1787558350286;
        Mon, 24 Aug 2026 00:59:10 -0700 (PDT)
X-Received: by 2002:ac8:7d4a:0:b0:51b:f40b:2fb3 with SMTP id d75a77b69052e-52e09b80e3cmr154416551cf.9.1787558349816;
        Mon, 24 Aug 2026 00:59:09 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c249689fa97sm978725366b.57.2026.08.24.00.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 00:59:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:59:06 +0300
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
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/15] soc: qcom: geni-se: allow selection on 32-bit
 ARM Qualcomm SoCs
Message-ID: <ssts4xmgxvfy5rctjskpva6aq5imxi7b4q3jerbnfyfn5sfehx@hbrk3pbfc6sb>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
 <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-kuno-soc-support-v3-1-196e2b306368@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX8PR3SG75lI05
 iT1LWsD+1aZaEbCgTqEFAnfti6EueB+gzlEyX+pObz7OVR+jIJTcysddit1dQFc4VvWd0bs/q0k
 YLZDtNdxpaJMsSJ180RDD1cdl3RC8mSGMGRQmVgNAqqKTxLNvHBlnspnEmn0mE3Ilr9PsPXfBFC
 3AeNN7LL7dTay0yUg3x4J9Xip9wnEz1psY5nFTpREaBygwdWEtHWrTjByvP6rupfPOXOjBScCa3
 JSpooZb6iWCO0z5+6ExyCC0mrUqW8fuXL+yckroIjf0kZOW7N3POXMD0C1wSueOw7C43nViRmeq
 TxooRq8bGfQ7z6lrKG00tmMD6T/1D8/VnnW9I7dsLE5W6KlsCRn3ToJg6utpx4Ukh3qvrrVguIv
 L9X0k4LlUto+xmb6fKdsvfQMpMWdJ8GSPzppUTT/28jrVlG9u7mpyABLSZVeHQCmHpQrO3T3pMg
 ycYcucU3wBq+PFdZr8w==
X-Proofpoint-GUID: pF19t645VxUigjeqvgLaad-Ames7Gatv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA2OSBTYWx0ZWRfX1KshEkacmAcc
 SM1zmsc+V67JY43kI5D/xRO1Z2UooNoKrW3yJWFGYLBMxrhnlEnn2Yu9Jdo07lmhPk2wQRZEhiQ
 z2dVQ4rmtH6uU0BdWmXw1SDIla7rWIs=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bf9cf cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=rpqCqEIPHYpObKgDwZ4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pF19t645VxUigjeqvgLaad-Ames7Gatv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_005911_867166_ADE84B8F 
X-CRM114-Status: GOOD (  12.75  )
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

On 26-08-21 21:38:54, Hardeep Sharma wrote:
> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
> wrapper for its debug UART. Drop the explicit ARM64 dependency so the
> driver can be selected on 32-bit ARM as well; QCOM_GENI_SE already sits
> under the QCOM_SOC menuconfig, which is gated by ARCH_QCOM ||
> COMPILE_TEST, so no replacement dependency is needed.
> 
> Acked-by: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

