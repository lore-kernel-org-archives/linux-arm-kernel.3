Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D65F4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 22:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=; b=nNsR7dS32imVhCP0Q/E8H649tE
	AKDgw8M2GS0LBmoa515WEdM6gA/VcA1qtH5oEqHAn72YxH9LEQ4zExkE5BSk+JW9jbjJwGo9cDuh1
	CkGAJGFPIMs081nARtcAGnUmCubFlTOAUJK5DbPNiwP7EAbN0ftSwEKzX9OSb4rxIElo++kZKS4ZW
	k5uk/oBsUxEHx4OokNee1sT0chyfzTM89fjcbltfFFjuV4XhW1aqwuO/M9oYi9hw63sA0T6FREtc4
	X66PefB0gMhrikbBVwnSwawar8s+4+8g29LOhdrGtFhJRO2xuC4pwi0ehd8+CwqXEodvi3aCm/JLb
	PAHOSVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nVt-000000003cy-3JVd;
	Mon, 23 Mar 2026 22:12:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4nVN-000000003ZZ-1ESE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 22:12:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqVF1943490
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 22:12:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VULlbFstwJLC9xQhGYSDQ6Ek
	53wDkhr/lXAneX8+L4Q=; b=IpaDkzgEuuaeoDQbRmeCrx96kOPGELC4AwiXDijy
	WNC19KXhTsvM3P/ApdYLE5gri1WU2Pa6g9fAsNSe3zzpN0gBdqY8HXntabmsFQBT
	wfLCFNM/hzr4kTg9PaS7tvoajQFMCADFMpufJFUlXPIR5Jg+USVabHZZobys9dmi
	9QkB1XJrBtKhZrVF2XQ0cl7L1SRTHc9MqDgLUH8r0idz+mPXCtVfWwBE7ouCfSfE
	+maEH8oIz0VChNDsRLxE5qg/F9LqKK01CsrsQu5JGnpiNecX3PBpdr7QWVa+6iN9
	4t604olHqWXvqSddY52DPWhkWI3pBOveoi0TLxNibO0gEQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt34m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 22:12:11 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b34223670so174032061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774303931; x=1774908731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=EAt+dy31sZQj6OFiS5i5wYQNqGlqjA60choQpWx+sOIJ766TRGFUTWbIepUbAzNFoy
         G2Ibq7/mn0KW9u02K7BPEI3Cero//qDQJVSvI5m9xnkWQqr+WFZkiZiG6NGNJHRPHBex
         gcofxziiIpxQ7OEsZF4/DDSseisoJPQhAF0W4NRyApWuQ8J5AvfOyo60KGoIBKn5r4yQ
         SuIFUslAugCprNyUkSVnLCIfUyKVD+PBSXETV+bk2o1735jHr9vXDX6i5X/flEryKS5p
         3edXlFxAycIQR+spKNDx4XpzrYkgsy+QNosd+Y6scH0zLor6ZMId7UQUBXj262oI1BNJ
         uteg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303931; x=1774908731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=hLMEZjC/qSURCqFGCx9J9X2FdPFo06CuocCt0dQSIUWbxX7zjI9p59ng7cAgooNb1D
         VNDyCQ/o+EVRE5v2BHUAb+27uc4le3mwjDSTPm0QaGX1BWq6ltUz2VA5K0IwqDLFOna8
         ji298sim7eS/peyphgd9x3c2OVQrJu508aX0zy0D1I4JgKu9WQhcYSOwWNuLy1veULdI
         +jafjTU3e4wCl4MgG8qhyM56dTCA+s/mW8YDhWWWC+xbbytgw4ZHzyn9dG+FJgJ8JeUM
         qr7wm+uSfxtDcf6i2NEXkFNemVdI65tPPNGera9ZQS6icTWRVmbvn9WsD9KA3EROgHoP
         lvYw==
X-Forwarded-Encrypted: i=1; AJvYcCVPwINQFhCEXWbQDdoo+Q3qirvxTovgfhwA/qsV62iJBq6lyMit7bw2FMzMM80g+VC8S+u5JCwfwoATHevslwMB@lists.infradead.org
X-Gm-Message-State: AOJu0YwcjQCMfx/2QaM1cPs5T22OXiVwKkeoPb/UmI2rMQ/NsTYRkvhu
	2NUgjo00XItJX522YB58v++7aBChPI/qKHNvHsQ0VdOw8uSydGbu0SdMbDUPMovubUJZAwgAvDs
	hIm+Lu1xWbPrrZk+Fy3WSOBC3U/77YU/QwWtv+TithRkv5BlvISNykDX8DKMTxKy5gAb59H0q0c
	9l7g==
X-Gm-Gg: ATEYQzwj+5Le9r1+XUTPlypdsLcRFepKHYObTsUnQ6XYlqw8T9f2Kna7iBGqt+x0ADx
	oAEw3ibT5kJWS1+AshoQ8bL/bRw1op56TD4ddj7Ye/lTeEm3d39lEkXa2hoKKnXy01UJJoREH/W
	yvBgYVgnunSB8hoeRIsfqySl0hBrV42bG6TzvWCh0MpxLI3EsAhcQLG740zhxPv3YRwMm23SHgv
	oo5QDhp67nFuXXhybR5rEMxKvt13/4lqf8g82IvJnfseM69M0obl7pjAuiopzsJ2S/9mnzy4g+r
	juxY01+xgvcg4gjEvdTgDq+leT6Pccf4GLSXBNb5ikoBI4dRpRNc97XafMEJNldX5ln1SK1QbKx
	1/gj6cCs2hKMKtqfLYEh6x2Wi02nlInpkk7e4de5VIbpxvwzRa41s1TqJHin1T4Nzi3z09RLP4E
	Pm/hyIsIWFbEBiXMWnWmJzkBhhMWg25g8u0gQ=
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132415311cf.3.1774303931105;
        Mon, 23 Mar 2026 15:12:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132414871cf.3.1774303930511;
        Mon, 23 Mar 2026 15:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9982a6csm27994131fa.25.2026.03.23.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:12:08 -0700 (PDT)
Date: Tue, 24 Mar 2026 00:12:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <zr65bat2eaegpuudoy7okmtazgfkubhg2w74aeomi7gxjfhtmy@bsnjg2ykiyyc>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfX9mtimyZr257n
 e6zf607male7TvkDsdiZ1goYsYvf1f1UujHPhxtHAMT4zIn5OwxWBF+EJ0fe1EJGRqohoaVkqk5
 s3sNJX8UpoDTqGGuP9SVoUoWcg+N3/GwH92i0fbtxQIxmeEDA6HOhci/mzXCdE4Bc7+LS8xpHE2
 5vkA/EOusftzt5ZHaq5v+/Dm/iQ0xF7PTV2opgnlU0J/i/2+rYDaiyIjf2QOaCxmzM211aO6tjE
 jx8Z2BYJGGHi1fZZrpiUcqEjW8/J+Ps6iJvtHavtAZzxJZrpFkvKrSNQyNG3Anv9LoDgMmbey30
 4C+8EOvHrUJz8YAB5yjP92w7BGZyQSEzbslzA1S7t/vueSdSS81A4nHYHim3xAg+aKyD/M1O/A1
 1vzFqQ7LdylE4D70WWQQNohL7G44pQhETu33LfXI+FNVF05oPi/Jl6o+tQmRvITBCxwoFa9aSBC
 pWcZsxWHX41SUflvKVg==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1babb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: z6HvrnVrVSUvI1XIpJVDkHjlalj7wbeZ
X-Proofpoint-ORIG-GUID: z6HvrnVrVSUvI1XIpJVDkHjlalj7wbeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_151213_460189_93A4532A 
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

On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Please switch to oss.qualcomm.com

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

