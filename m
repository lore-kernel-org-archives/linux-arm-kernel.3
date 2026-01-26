Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1408CF65CE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 10:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=; b=q1TufGnMm0H545oqsMh25lvxYf
	o6H+yF3Hn8jp44kxIzQd/iUcPbgHhhrqOE/UMjagexVloMlCQzM4YoGcYGYHSE4AD3s5mieLE5W2U
	zdjfr2GXHyoPAfTcOXNB7pFgKxcvkPRWBhtwgY0XLzIAR9mPoW3H33rMWw6UJC5F27qTuoCc2ZGs2
	4wy+wCNw1kgC8VZ3NpKYBhBdixJiTPr+SOp0VQ1PftpfWtQ/Fdawlq5aoXswl/XxpEE+NjROIyJNl
	6jcXu/IIf9o61kWFyDFh3qYMCaOUo2oFN0Y9l7VtKgSpD6sDWg7j3aq9Sd8Wxa4049pfIIK9MDB8R
	DQiQ9r1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJcP-0000000CG5G-2e8p;
	Mon, 26 Jan 2026 10:14:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkJcN-0000000CG4q-35iW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 10:14:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60Q8cWaE3982275
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:14:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5yhpcFu8m2C4OmsSHPsRpoVJ
	XKRoa1siTRePuREnYoo=; b=TEVY4r2p1d2thn9eDmOkpbYvk6tfeFPh1u1Gst51
	tBkqv5uz1+CeuEMKpP6cUHl+Hpjn+CXwfp1RJD1sJUWIAQp1CfUVByHLM8GotX04
	Uxk5ZosIAh3wtFuuVjmiBhnQx70ZMaMXr6ja7AJwfLCxBEVDqtumVcyxi6V9XjFm
	tI6OWfTqKIOUzUNfzEpswoX0xu1mlh8wIypa7N5CjwUeFrEedFWyfxQ8Wpjuv5jb
	Ntrvyg/sFW8YUpsopwp9/plNdXpRJMX8PXXgfFq1m8IVLBihjIpOy8mOedtAemy9
	H4/0un9b958F2Khng5QOHBMeyT1BBEkGPS+vPjLHYT2fqg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq24m5yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 10:14:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c5296c7e57so244898985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 02:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769422485; x=1770027285; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=TqlMPF2ol/tg6g/pJm1adwOhS7NMDBCKvPP6ZVkDnLLsKZdr7SACYwsvrX/3fR5Jm8
         rQrWj1cWWHF7X3Bdr+bKa7sYA6QhjzutfMF3y7gTvJSp4BwhKQgr1ggttU4KJHAGv0cH
         cfCjKcDoDIURWh3diLm8qb38OUY9VgNgDbnkR/6NraS5RS19VTRMEpsHvDST0GfMxEET
         zyAeUf50pfbA48ROVTb87u2bQ+9eDxC7hPWS29vvaVRi+8hW5T/M3robrzXqsLA4cKGv
         xej+8oT8S63ukhrUXrU3bSpiRmJfRV1K54gjCuBmqXfgNUkyweoQqkOdD7dGOOaHHSzT
         Thog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422485; x=1770027285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5yhpcFu8m2C4OmsSHPsRpoVJXKRoa1siTRePuREnYoo=;
        b=KPKnd/vdudlu2TORj/0FzlU3sYlDGeiJtE+WuU0YmjPu7ptFnRDWLsRVhO1s5gHqTH
         V8lbdlDQYQ+3WtZ7o9y5ak2Ry5OfAo2B2g8K1UkY3t1wfmFbFLSCXmymd17JAKxP8DoF
         ojwubyS4b7bzPRKUJO2i+wWWjdd6Zuq8BxQbWDSTDYZiakXb62v5c7Kw65om0FTtTTaX
         TFZLNCFkxO+xW8GDO5FJZYTHcHxiBsmzZbyL4j6J+gOu9E1syvc0Z3kThlTrpheHMqUw
         eol/KGb0OVUVS9TyY2kwWuwXOlRqy488IQkf+MiF4j/NJUOfizNEp/eRaNmiKYYTufkx
         oizw==
X-Forwarded-Encrypted: i=1; AJvYcCXaFpAZEa+QcATBHZcRhnionepPruuOmGakP9zbfSOiCRpwXTm+xrdFRXXabJPWBW/+N4fx8eg2DBbIpmROosKx@lists.infradead.org
X-Gm-Message-State: AOJu0Yygx6KMbl5gpGJ0Usn7gsIo5BEuB5YHmB588GKWP40EG6UkGmRW
	QJLt8JV52rMJFE8sbX7yoxTZZLLMhIuQppA4/6rC3taRJuv/glzMrysIcVUuBKfuHjYvFKkmzjB
	twX8Jg7nDT7nMhKbDDnG7eKVfxcSUWuAg63y8Ff6iNhg/1MFBBDIVuTOrW5yb04SN+osOrWMAwE
	NZ0w==
X-Gm-Gg: AZuq6aKIUSx/ZINd0xCL7ruLSElXR1sGCgsMPTKRKCa1JDgu+BXd+J+mhIKblFbZkMm
	An47GCUeik3WWDsTO5A5+rhxdRZ5BrHcp367dTyIl0L39v8qwshIbZN7iob2z9gVexlAtHQ3Z1G
	xzOl7vzqQQzgR9E1JxlfA3oI6IkW/8sFm+mhEu14qANKK4WL6EYUT6dSm0FaDJLmLMtLpbu8+zJ
	VEIMtVrErXZZgoqQdgaoNodDiqP+taUD6mRUbgR1A5QEbyHoUmEBQBD12R8zifdpHG5qd+TtWq7
	RpHCp9CAjAFt3gAiqhDims3W4oc66zMgPAtpI470AGXUoN+frLqx6zooWTxM1SZ4eSAP/zJt9Kl
	On5UuNSeqBqKIPYKoqXuKVCVB
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418714785a.9.1769422485505;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8bb:18fe:d1c5 with SMTP id af79cd13be357-8c6f9572c3amr418711485a.9.1769422485002;
        Mon, 26 Jan 2026 02:14:45 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d85206fsm266606285e9.6.2026.01.26.02.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:14:44 -0800 (PST)
Date: Mon, 26 Jan 2026 12:14:42 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add optional
 clock enet[1]_ref_pad
Message-ID: <uilxikzky53j7sg2barmsu6fkco2fiwgak3fh6eqc65iggmbge@7oogboikthae>
References: <20251106-ccm_dts-v2-0-12fa4c51fde7@nxp.com>
 <20251106-ccm_dts-v2-1-12fa4c51fde7@nxp.com>
 <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVwV8/rg2h2x4OwN@lizhi-Precision-Tower-5810>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA4NyBTYWx0ZWRfX2ulgJ12iHk0b
 CyxyivQs7U8Q0vUmh+4taky42VqtO/SSOb52CnQb/1nftF0VPMwtGNtlogpwUT3L2bzSur1pFip
 moARklaa2Nsu9/uTIIgfdzMP/Wo8HorO9S8AkFDY3YwwwjXFu4Ie+pDcgCVj7KRDUFArlC2qZ1A
 gOh2EoFvk96An/X1+l2+WG+QT/EhWhhSiMfk7082x0JXlirlC/h3eZuN11vIBoAAownphD07KFP
 6Xex9FSsTHxbn5zHieaRnRb6elQmXkNFGwA4ptRmNPmRecSpgkDUflksjg0egFIDz5ivebjNb9M
 YWmlz4vD02oHYlt2y3MZS8ltItO/28qd/kyuHc9XBTKZ6wtBhnNKGX2v3fESKAIG5Pm0KdmKfS+
 IkK942c0GdcNebvtY5epYxC+iQfi2LHxXYl5SMwalF3kK4EsJLscM++79Ozurk3VjIP1kMvgKJf
 ovGfWMQiu1oJ6iRmw1w==
X-Authority-Analysis: v=2.4 cv=EsXfbCcA c=1 sm=1 tr=0 ts=69773e96 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=XYAwZIGsAAAA:8 a=8AirrxEcAAAA:8
 a=7OV0ED95LoZXi-xfo7wA:9 a=CjuIK1q_8ugA:10 a=QYH75iMubAgA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=E8ToXWR_bxluHZ7gmE-Z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: _qH-Dzw1mpumumxSXjvaI2VTCdzcsEkm
X-Proofpoint-ORIG-GUID: _qH-Dzw1mpumumxSXjvaI2VTCdzcsEkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_021447_895453_1A219B21 
X-CRM114-Status: GOOD (  13.82  )
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

On 26-01-05 14:50:11, Frank Li wrote:
> On Thu, Nov 06, 2025 at 02:57:21PM -0500, Frank Li wrote:
> > Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> > which input from ENET ref pad.
> >
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> 
> Who will pick this patch? Abel or rob?
> 
> Frank

Missed this one. Sorry.

Will apply.

