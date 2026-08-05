Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43555C55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 13:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRaaf8WWSnJ1pmJ6tVvHl8GBo2gEGBic1A3WOSTflrU=; b=kLoPO5vUjcQOUTTbj47KI20XSn
	DYJfHycG0KmVFkdpYccGN/n4WwqadIHpYCb6jc/ok3JcsuSBH/C2mUVvGEIBVC43vw1bcSRtMRX6C
	xVOQtLf6SFzNmaEYbEBB7YEQ0RsJ5ccolY2/C8a7nOfIRiN6+C1oSpc1ypLkT8ZD+8JfpkUfED7xE
	FYYsrwu38Yc01CI6hRgN88admGPa4xbRxEsLFN3UXgmlPFJJmnhtfy93nnR5NEasmvIOdlvnm8nw6
	/DdEr1XXsqZnnTe0GHa78PFU07DxZspFekukM2WOG+/Xeu7bEpZBxZa3axdrX6HxXZxtKuSESYQZr
	0MbiFjeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbra-000000040RD-17Fc;
	Wed, 05 Aug 2026 13:40:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrbrY-000000040QN-0r7z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 13:40:53 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvYwI3998277
	for <linux-arm-kernel@lists.infradead.org>; Wed, 5 Aug 2026 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eRaaf8WWSnJ1pmJ6tVvHl8GB
	o2gEGBic1A3WOSTflrU=; b=bb5Z+i3W9LxD2gtcbI0Xp4V1WRwGvLQOj89+DDjx
	tqDxJDFv1usDy1PKaDcWxK0NTW9rrZhZ9MGk7gfYxvDsaTp5YGcfq/dJy44AYBGG
	MurxaBPmLsSZCB/AjmSYQBRX5AG0Ig2vA0nvFSzfoLv+HG0VNQXIbg56azfimcDG
	OXaTt0s2jPTifWrzYakSIu+NxlOgD4huL3ZpeOqCJ7Nk5YUz2QV61Q4BOGU/VjMe
	oR2wrf/BbzK9iEkxec2BoFPwRU/pQ9TNwAAIom+do36OmtOhkKQmP1mp0KL/IqHj
	fDZU6/Lcxd9t8Q3n0cgwoy2mWfA/hSi9O9LbwNx9pl0JmA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuu3ujyh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 13:40:50 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so10294091cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Aug 2026 06:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937250; x=1786542050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eRaaf8WWSnJ1pmJ6tVvHl8GBo2gEGBic1A3WOSTflrU=;
        b=MnZ1R0Y2jRB/MeayFUdnqgKhXufiTIqpv+IuSHT47lS87FvBbHW4uKm0RFRXOB2FTH
         Qd/EwagDkCPxJDROdxpJ69aiPPAEbBuKqsd5UQgXDHYR0ncD94+hUf2Bsdi77Q2dLEZQ
         yKgcGR8qr4Vv5Lr2kEkTyygEFC3Zr0lhD6QgmF/g3aVNvzyUNWY8IdUX9QR0pY+j46yR
         FlkKAgCcLs9eX/utgBCJk8pEtZkgcOdV/yCo22eufdxXcwsCtP/lZouT/mjFIK0Z0Hvu
         TqlEhatTQ5ItSdGEXWWml0M1uoWi0E2sw3ZqssnVdTGHxljUF48XhRd+n9CO099NL52s
         BrDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937250; x=1786542050;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eRaaf8WWSnJ1pmJ6tVvHl8GBo2gEGBic1A3WOSTflrU=;
        b=QCDf22t+5lwGMNSrG6FaMdaBg7UP0uvb26naMITfAfrAbCkbMg0i68o4ZVNmy/gNR3
         1l9bUfely3BfEc0vhsEKBNXtxwSl0AiPNWIpCIlFx+7zhDkbYZ5B+/LWuvKOYzeQWU5G
         88O7nxKSmG+p+6K5BSMZ1OGiiehTeRlEE5KVJtg5QgRjpU7H1l2e2y4cE7zIMGvTALip
         XiuKGj1rr+dGwVaw0/rQvg1bpSoaIq3EwbD2JIQR2f+SC/C39EFbftdpFsavYy3gKKK3
         itPpOQ7rfRqBvo81RFRx0PZOStjFLBxX1fPaiGVM/H04oAzmdbTzOrg/kUAbLNF3yrXY
         4AIg==
X-Forwarded-Encrypted: i=1; AHgh+Rq440JfRBzWY26ty2RPawQrVw5GQUNT1y0qtB8f4StjUKnpYrRH3dnWm1IkfOQZ/yh31qMkH1IldJnjwiZYJkwL@lists.infradead.org
X-Gm-Message-State: AOJu0YxmMmwAao/B4nEl1jDJ2rBjH581fqygDCCbrxn6fWHCFAXMJ1nd
	waxnR6kst5IVc8YGwqMbUE0Fqw7zIMZV3dmFbaVgl+8qrvvP3D/atq+p23Pfj3S4PzYp8cDk77t
	RIWwIHwWgLdLRFfI5TouSApiUgrnwOJtglWI/e8j8FCwuEpG9l9qH0pjt/UJQZ9o7Ey3fMDW6/7
	BnlA==
X-Gm-Gg: AR+sD13pwD2HgNeIk0SbazE+CFzCA23fOcj3/0HVWVnwAwzjeqDBxi63W9WFXFmXVEW
	HS92Gji05VKwX8C3/5YCWRiXm9+J5jxUDyHcwMwhyAx2P6mq0Vv9yf+MTKjrVAnu7t765lKrkYk
	aoKoW7qJDYG+zcWGch6ebiO8ovofraSXvNSibMHGKl++SAA/haTqG3t06e3ppxchV2YZmrvXElb
	BSBUUsh8z4d+eUXcR+falhTIUO0a8wAH73JofPLpvEcmq+RAKXgHMnTM9u+k18QCMGvieGVLlup
	wXovNkCylgVZTPsU8CXQ9h8Z2s3djEmp228MXSwo1t5My+EoKmQfyJx2kq6pYKaZo/+hDx3NkLM
	eo/0ViZgPggpe2Q==
X-Received: by 2002:a05:622a:4c6:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52ce5ff0c31mr60112281cf.15.1785937249681;
        Wed, 05 Aug 2026 06:40:49 -0700 (PDT)
X-Received: by 2002:a05:622a:4c6:b0:51b:fcb4:7576 with SMTP id d75a77b69052e-52ce5ff0c31mr60111231cf.15.1785937248955;
        Wed, 05 Aug 2026 06:40:48 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e04db3asm105570255e9.15.2026.08.05.06.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:40:48 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:40:45 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 08/10] clk: qcom: gpucc: Add GPU Clock Controller
 driver for Eliza
Message-ID: <2dtrfcquy2z5ukybd5xgo4e5cojyvnvzxvfdeuitpatkgjc5s5@xxpc537ho5hp>
References: <20260804-eliza-mm-cc-v9-v9-0-39067760dc3c@oss.qualcomm.com>
 <20260804-eliza-mm-cc-v9-v9-8-39067760dc3c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260804-eliza-mm-cc-v9-v9-8-39067760dc3c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX9Oa9Z5/4ynxu
 ynPtXcur/KEaQS/WpBW5ia/qsqRnd0MbHL5uRoRIoKMMPViNMf9rIkrCjioAMh7JENo0qtL5uGj
 Omm1mom+MsHIpijNe5gkeffgxvl7ysk=
X-Proofpoint-GUID: 6OyRrh6qEk6YDdukcays8oK20o4Z1xyg
X-Authority-Analysis: v=2.4 cv=B5aJFutM c=1 sm=1 tr=0 ts=6a733d62 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=whjPl3NbLinN2m9j5McA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6OyRrh6qEk6YDdukcays8oK20o4Z1xyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMCBTYWx0ZWRfX7ZdybnJq250t
 Ul5GvjQYEyPO6a/Kwxsp1hQ9+u9PHgUeJZ9wfcjZdem/EUiZP18d+cWkdSYV/VNfTY2yjl5+hNU
 bLV9G610+0fjA1tQ4atZJPonJ6XdGsNWVjfWJyNFoTG5Th2a8kn5eWC9rsbEouephJjhM2A9ZGc
 SdjVPujEMR2Y80yDE8kj3fKl7zuihx0TBqmvsj1fgDDWpaw6uVz264sGQKoIVi+n0Qbe2yVgwLY
 QCGlu1I0GpGiGV2x7tMdFQ/zPXSYzxZbTw0qkijhPi4iK3ACyPI2csnvY4E2k2smh6wH/f16U5z
 ziphzeu18FJgdLVI23VXvwc+1c5/AfroRPLbyYrj2vbZQo1Kdy4kj2EKT/Fn34FL43GOzq6F6U0
 hDKOMSTTNwoYIdrG7V50V5zehbC18IvULs6jZUba05/MCk/MOV0zyuk6RWqB2Rya1acH3JO3Qjs
 rYwWByZecS5K8mul2mw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_064052_269423_2D4EF060 
X-CRM114-Status: GOOD (  11.40  )
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

On 26-08-04 23:20:21, Taniya Das wrote:
> Add Graphics Clock Controller (GPUCC) support for Eliza platform.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

