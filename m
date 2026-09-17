Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7904AC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=; b=4xNkoEsgXm/834e4k6F6VUq8ut
	8Y6ZYeGiStxSniuy/tLbVPfXDMOSG6DWJoM9ltSo3MGIg8hJh9eG9/H+uVDdvA9cXqVMqQty8adzY
	W/dzOpZh7v58Lo82ItJU6v4nq56KVX+2lcPUizEDpY+3ZyeWyShjVtYG9FuW251WVxIr/ZX3aFb/Y
	A3cWJGyby1Ns+9hi1ofQUCYHXdFf9IU6VzkcvAk1tcdfuBzVdhonr6D6nnIBWrO8t/fe7bBuuZHFM
	T/4d50aZv1UnRJlxzPGojK52W4idVsYlklZ7mtP1tMHoh03xLLti5UYv5nFmju3/wr1Adr0Pk0Z1y
	cnPc/IRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E1B-0000000BfrD-27A5;
	Thu, 17 Sep 2026 15:27:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E16-0000000BfqF-1Tdc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:27:19 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFOVWu782560
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lOcf1R7o5InmAsKwg2E0EjTS
	IYI7yDGuX6N2Ud8ufV8=; b=MQ0AS78YiydvB/L9ivANs0HuhU7RutkgB/3kwdsG
	kMln+VSjUbSBBkbM5olq7ZRZzRo++BRaqiiaJEvyz0Akj/Hp1UHnUUiNPhcVNDSq
	pBDSU2oW7E2Qzwfg6V/uLmt5m7FsWiMArz36lg4/pTUOcg04wcln4stYkJvzbgiF
	baJAbhBtKQd1MqqD0O2f2nwVFWzvlvbm3z5RoUurE/IWD78pLrjtaHdulPd1NWwg
	m/+K+R9RONfZyvdSC6pJKvZZ+M2QdJsKFhO/3iyPqUVyd7Cyh3DcuKaYkSkTj//Z
	X6KTcpwF+lDdjZ3eULZUuIS/dgjHB6Dq53/u/7u1UaTO1g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttr0e8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:27:15 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9124b265371so16378546d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658834; x=1790263634; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=MLzgnn580MLi+56rNMiNjjEz+Ss2G+cM9mlZ0/Ino/63UZG5zdSOLGJG5ePB7csh1J
         OFS5Dzt5ygk+KokAaOcYP881Dlj8ckXxB99NyZRHWs4/SX4aozQNHcS9xSNkbWfFwn/O
         rxe2cLS6uK3Z5N+iGHtMJbtwYvpBg44rr5BhbQe/O2hvB+L/iCfLnJuGVgijPRu+mS0H
         3BtiNv+2NQJIejtW1bT8vUOUP3HI2TXgzC+bDcv7JzxYMYv4T0yAiyoOpToNZIpWIZlP
         Q1RQS0oAMl3OH3V6paZYt9EhlTeuNd4sspdG/wms5B3+ifXAY86xr3KJegkSbJ8IcW9q
         eUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658834; x=1790263634;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOcf1R7o5InmAsKwg2E0EjTSIYI7yDGuX6N2Ud8ufV8=;
        b=HdfM0H61NzqzkRkoWglmqCPSJcYpTwPewR1qBQW/L2YJM0T0XdxgTJx9Taz9bqi7XL
         0nE8cWqLASCfumHuABOUtk35ffqTUlJvbh8yA6JPZkjL2iBWwzwhHZY23XxwjHt6PNLP
         0KIttVQJqVNYu+ra1LEPt+YPycLgtNjfmtuMwTCw2uvzC0NXcZNGKS+d2Qz8XY6SAIZS
         oYrfBomzZIsCwoWOmOUz6qV5gipP8ZcTw92fiKmGBA8MzDU82pnTBGoU1jNrpE3X/N/g
         WPR3wLZpPUyZtkciUO1z9PmcMvFGikD+OeWMA6/4/GssqYU9WVgUz/tEyX9Wvd0ym30p
         WYeA==
X-Forwarded-Encrypted: i=1; AKwUvBzCO4Po+r7cGjV88Fb0SK2kC8+5YM8ZJKS+LhdfoKtB7nL/OGWRSMya1WRVQ+wk8x0jEc9iXuisMuKhsoZqo8s9@lists.infradead.org
X-Gm-Message-State: AFuF++lJnAvjNIoSxJMRKXmYMfThYqNyXG8fTVoxNd3c6jcPF/reo2kR
	Bg1SH1A5ZlNQqvLGOztFAp/A9DYVK4YWsP26n/1kthaqnnXM1IxMPaC1qqpZo7cb6d/CuNkfJ1t
	xq/BgLrN3YPxTuT0CQcZRaWYmwoKTD5MZPH2Tu/Ncy3VXEMdcnpNwbdP1mgwbmUBeH9NoFEE4Dw
	AUdg==
X-Gm-Gg: AYBFou2PMOkf4x50+e+lEXScaHZx0vsk3RQYKiU3TMw/BKVQ2Sf1+4EkqgVPB1QWUW0
	V57LNV/ovrZaeLMfruKnCo94JL40FrAvxYUMNxekczvBT5P6lfwAsiICcbzGErojzMLFr7GLEuE
	Kqq5G5TAicMSpoPXV/PDMKp9ZtXxzk0bCAmz/jufMJq8RIRqh3vSTkE5DFh0j3ky7aUSjqY5Odf
	PtDrC2QE7A5gBW3dcOY+xFzKb/E4QBJud1rekF8a3eYK4tCm3xfZUpZYB9QpZIfCeJWdS5wNU9x
	QYAMG3phVZgzKA9xyCXGYn0HFCz2kRcAJmQlOjOjoo6VXqUXDggHSUIhKV+3ypaxZP2Bz7jBxEP
	Q/FoAge54NQ3/NUo=
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6212016d6.23.1789658833846;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
X-Received: by 2002:a05:6214:62c8:b0:912:4527:7ba with SMTP id 6a1803df08f44-91252411994mr6211096d6.23.1789658833203;
        Thu, 17 Sep 2026 08:27:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf26c8dsm16288601f8f.14.2026.09.17.08.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:27:12 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:27:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/5] arm64: dts: qcom: shikra: Add CCI definitions for
 Shikra
Message-ID: <ns6fwcvy53zd3yx237nrnbyzs2dvnp2imucgdxmj2wqi7pupsf@dkif3wniurye>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-2-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX1QpmsVlwqju0
 s+l+jX2g7a6wjshO9A4ma3VNYTjD0rlTfSwx3Q5Hbf7st3gDtT/KtsNYFHnRx8oAmt4Hb4um9Yp
 SKpJKlPZBEHHi4XIDOz8XdXIM/WtDcoOURF/OwzrQPrdO4W3KQufsKcshCj+AVP+uSaw24uX0kS
 04X7Z3cP9DctNw15dvN496Z7UMwoljSzhYDr7lnTTWKVRg8ADsQaF2MAJRr/NrY9jLHWezZ5eWr
 SRpxJaehJdHlm3nfhJUyzwxpIgb7huRVbHJ/OeVqgk5j1rm0pxrs0VNf3DLvScVG5ke2q+Ob6aX
 JGc1HiugJCv4CH4KyXU3ghran62tLqdMeldmqpynWm4etwdLXT/NvrljqTa5T6g8XKQ6E45r2XT
 ipIMGCGb9s0H0A8o9rhEGEhU0hr9OEcgsFvtlTM5I1waoNROG2DrcGjc29bYRsoOvlsXTMvj5ws
 I2pvnZsmKr2qYIc2RnA==
X-Proofpoint-ORIG-GUID: j5V1ZnQIhPpLL4eFBWQooImN9ioZVMP0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfXxhdWwl7dvhfX
 VbQZ15wdFIpOqzvAKdwsgk4LWTt29rKbWiL0450X9SBb6GQxkdQgy8UThjkdLiVj7aSW3JYbjTm
 j941YCU4poeF/22Qmqfap+lEjQwMays=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac06d3 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: j5V1ZnQIhPpLL4eFBWQooImN9ioZVMP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_082716_391754_0DF55EB6 
X-CRM114-Status: GOOD (  10.03  )
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

On 26-09-17 17:11:01, Nihal Kumar Gupta wrote:
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

