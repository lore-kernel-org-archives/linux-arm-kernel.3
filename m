Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590FBC982D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=; b=tjskDQj5MVIQ3QZLIStbBReO1t
	1BgmL0/LbFIlx85pJz1cmO8uqnLJllt56b2MwrHZg5Itmp7rx1+fhJQ4BzNgEK/0DGrF6uvCbGJOi
	YQO21QZmlFK0wiW7r9aE5OetGg814KcdbPzPrVHJRIBWP1eOwVgIExyn2xWR4yk0QYWgIoBdvHzyP
	645evP9U27wXd7P+/EGGu3Q/NqNR9IwosECw99e3T6F6F6qA2a/rB3TPaDwkqNiSMWE/PehCPsk8Y
	HE4ZqtLlukB7CVYe4x4KLvw5y2ngPnqbtpVO1NuiibBUNoaztTOAZ2kNoYb85DXhfnCb4rRkhh48n
	0R7xCLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E3v-0000000BgTS-0qcz;
	Thu, 17 Sep 2026 15:30:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E3s-0000000BgSL-0cWQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:30:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HDiP9f2086466
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:30:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ri1E8u+BKFp8OWjyXvh+uMJ4
	co8edga6jii1ZtQDCCU=; b=PDsyaP0eFQq0gY9bRGD1dBPRKI+Mti6Fa6Mjx9P4
	/khZUBYJ0eBzHeRoEwoD2BIAv1R1UYKV0L0YH6aTLI9OE8jA57mYaHLv3jelQ66Q
	2vN1baVoBfaUxZfXQRxJ/MWfg9+zKIqYi32F18ewUXW3XhPsDW8hgyuXpm/npdUE
	eh0kwUF0zhAS1AO10UaJngpkjcqIA6sQmOMEqu1EZHf5tTw+UyGNX1M69T6FYH3D
	uwGIaJSJ0XTUBI2Zmu0T4rdQOuc6mYtXsJoD+KwwihlcaBfW0YWoUGIcpm7N5LLS
	pvypELLWoJjYJxxdP5Alw0GmTnYKP+QNFEMG4ZsO5NFlPg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu4117h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:30:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a05d645acso219931985a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659006; x=1790263806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=DSndOr+gvCV6cPso+lqnlEX5haPfAHCKY0/HYusWx9uYNvOdx7afHiHqvCSblt2tVC
         tHZATDzXpBgPsgpThwMuENT4PcALMjW+hK36ixyfiRLv8oaLQYrNwVr3XywPLNQr92ns
         CJlGzODU7ISREanNwrl0RPDHgZZDK5cI1araCpl0vMOt9GB2pxZYoVyPTXKQxT+915fq
         qwiKB65ZL08R1LZICq9F101/jxW3jkHPQDx2rBqKrqNqZZSCUvUo6cDocezkzzgMP0sG
         PpPMLLHF/Q05E339QqP/QNWMDrSuqPLuQU0osrcuyJ9aMNqlp17XCq2bLVw7aS0qEhWd
         XiFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659006; x=1790263806;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ri1E8u+BKFp8OWjyXvh+uMJ4co8edga6jii1ZtQDCCU=;
        b=V668HS43eIRE5+oiY742ynBCmF0BZKV0EgFNIK+rlPFGBL6vup7Eu5ElaNlc+zwHIC
         VcOznLzgJ/T4p/RNTwMH8Ix5jOf8/Nizhg47aJh6xlsr1jFNM2S6Jzr1igWPrh/JG7Il
         aXahhLxSyK7O2GZYvpQ5YH2PVLHfFbwtn7N8+UvpLtuSb8TCy/XgjnXaKsmxSAmmrmOI
         jhrJlJiDIy57oFStZ8NAqoQOOxnh2/Wav+cOdEZo+Ve8e2MC0yl8V5EEo5Dzj9PXzXee
         VGDhop13td+9HYuWse6YdjqmZ2z67Y05NNFy0LG0DvxttT1iw/JSWl9B7mAjgN6BBnZC
         rCNw==
X-Forwarded-Encrypted: i=1; AKwUvBwiykj5fmua5R5xoTSsEgvEMgjyHiwdkVsqH/tmORXa7hLCkU8spHFZCG+AR6xxhmdeKbhzuxUvc969Ea6WN5F0@lists.infradead.org
X-Gm-Message-State: AFuF++mGjn6a3B5Ur3wNhDl8R+NaLyhmAz0Ump/YYfvnBX4v9K6iz6IS
	tN82ia1LkeJHC2XUxKMX0Sz5KjJyyBIGOUQUINl4B065jdAaAIUujEe5Ov+xBi68KRj2/PcOVDe
	OM3PV6FShUscWbUNBSoUMUSXCN1seML1+T9UM3GVWg3eeU7mLCo9B7VX5WfoA5JjO6Id2i0fR2t
	ZK5A==
X-Gm-Gg: AYBFou0RAcxtFxF+Wrwbs2G1DcZH7/xfLffyw0pnJDmct4nEKqbsaKIPGXxd4U2Sp2p
	ZCSWCFdlUOpNvISGnKT7yBGEOT8f5YGDfgOARlxObdePhBJbp7cWjne+qNGVtBkp/bfX/u9ALhE
	QwLkyXQkeyhhDA1j5Du600FB2npGP8RLZxN7CtmMC0C6nu5PxjWPtF4IxPYjTgvOwCSi2P+NQ5s
	iU73tY7jAzqKu3jF8/HhVOjzEQSnx4Ehd9cJVAktHe0gkiX/SX6KwLOz31SZoBAKgKT61HGn9wp
	0xUC570HDfft7DmzVt4ANPGq1ESkmrzc4RbK7Io9WSuVSYhESYqpmdxKSxZAjBjrrdMHxAtODzo
	hZGTSER9BoxTPEQ==
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288319085a.46.1789659006319;
        Thu, 17 Sep 2026 08:30:06 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:939:6de6:9517 with SMTP id af79cd13be357-93bb794e07dmr1288311585a.46.1789659005708;
        Thu, 17 Sep 2026 08:30:05 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd247809sm141129705e9.11.2026.09.17.08.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:30:04 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:30:02 +0300
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
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
 Add DT overlay for Shikra
Message-ID: <ok2efl2jwkpm4etywz2w256gozewohaznorhhb6b3zed5ktr6f@vvqtflnebftn>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-5-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-GUID: r7BuS39AQdF127gEtA-i-i9ENpf7ZGj1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfXyqBdyMYSZ696
 sYUegT/ODQhxsl9hU50KghkNkr6sc9a6qOBQDhBFdNMtkN+GAaRpq5CofxDKyP8D5fMdlkRzC36
 oC+aj/xBvi2Vv6bmoneVOe4oXJuibwk=
X-Proofpoint-ORIG-GUID: r7BuS39AQdF127gEtA-i-i9ENpf7ZGj1
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aac077f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX1X+E91uJovWX
 K/aX+frJIIbg5SfImRiA22c6ABdn/k98lJVeuVp2pH4N+dhT8+pi9j9432PW9SXGQiaEplZLTNA
 7k3PYv6++YX03kmC9tY6xkmf31arfFJuZiRIq5ZGfzY5sMmNWoxenTbsdqSJSpKKAs450Km4QvC
 FDKBKWrND4NdjvFOZRcbRsUUoe/YCPmzKufxw7XXtvv4odVVMbjYuEdalrro+wxxn4YXbHb5337
 qTPGPyWG/9pCik0pyib8IyONGo/jKoaXTWglL8XbAid4Kpuwn+o6rvQmFpaXYx51GNz8bz7cdgq
 ZmE+Y7A3q5RPgLPLuQJKBt/X96zA/aCm59gUPpwIVNeOPWjt5lid9uku2ojqlFFSsgtSWcZJf6W
 tHts0UtPPKwaqCsqxMqRKaCDruoKECM9w6XdKXw+soRHiw9NEAUWFDI1dfXC/GJGREmZwOY2olC
 lfPsvGFAzhgju7a33ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170220
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_083009_047500_D787AA97 
X-CRM114-Status: GOOD (  11.05  )
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

On 26-09-17 17:11:04, Nihal Kumar Gupta wrote:
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

