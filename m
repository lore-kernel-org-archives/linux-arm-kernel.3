Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF2CC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 10:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=; b=0ZlPsm8dz8WicUvxR4UpY5BnBM
	WK6IXyqGPJbXAxo+rKghhMfxDuYe2SuFTUZasOZXN4fzKG0aCjXJ0XuorrrcL6X9veSZMWZM+yZ3U
	BbMQ84U2tVA8qQo3TX9xpO1chdiV4g0zMw4csuZGamcLlZHKLZTGQt1ltmI7GzeQbuDTBvjLP+YYz
	QKZnm54CeqS/DPXvLpQt4iq5ISk7bnBcQRw/cpEs8643dnl7AIEuuLUX4WVbwRebtCa8Uc/ku8bLp
	T8AlXI48TYlj3KV4E0m6PW+NLSuJQhhnwRK/DrXa5e8cmUTW3MtsGhqzbgkxft4Am6h9+Y/R+mw57
	gHtEh8CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X3I-00000006aXI-2VL4;
	Mon, 07 Sep 2026 10:58:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3X3F-00000006aWS-1yhz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 10:58:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnBup3863121
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 10:58:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlgWTU4l5TU2Z3+onQ2BGvvK
	P4C66DgncaDRweKJZts=; b=dkvbUMDt9tIZsDKDnW/qumgRf0QCoKn5DITnjLmh
	09vpx1rYA6zQJtZew/7pgFSenXB/eCXeg6CNmQBsaURlD0X549nMthQPOWaVkRwR
	clG0iVrhlcekgF2caXDAI3A1nipprDRsu9UaMTkpOHTVWN/r/4suIF+E/OjxFHw8
	QZCH4vfnAUlU3aW9rcVs81J/P/FLmquBkGRldolZ4VJg6IVOq2BAaobr7FG975zG
	i5zajboEKOrLseTmU42I6pXdkQHGPQcPcBPYm1V5Qa6/1aFvSN4AZc+4wJIVU2Zy
	v1dvJzE/XKGO0aWY7t7Lq5yHKO4SksM6X9N7N5gkdBkWSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hfhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 10:58:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so580179985a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 03:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778690; x=1789383490; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=Edl8FW2V8dE/WSqaOouKtlb5AEu6yRZmgCcqosvMYYmWFeOJOw3FHY7qY3PN8dlNgM
         GgNKysqhhlMJuIKjrxI6DxPDRWq595r0vgxQLc5b18PgmIf716pOs38ZArH2TR3dv0KH
         h7KVROTO1nMTh3Exgp/dyRahllJOG8Ca4znqe+gbQM1/MllGZfEFRgQBtkmbb2gf4D2I
         bf2df+jwmVPZaWQnFYoVafQ3m2x4EFk9tTgv+HaLgeuhj//Waz1uicEjB4iqWe7/9XiJ
         OgNC2MEhlO5MG5peRPzCAUlRqJF51J3wEL1os444WO0HSUyN0iR+2yuzM24PDn0UcP5u
         CcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778690; x=1789383490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlgWTU4l5TU2Z3+onQ2BGvvKP4C66DgncaDRweKJZts=;
        b=SUdctBbH2cQQwaUxGOFW1zCHPUPzCyji/XeRALGtEHfqc8yBZl3tsoyy/8R6n+RWzG
         N+Dj7BWvE65xkyF/DpqCzwawna8uZRxbuCmd+qvSJrQaSyYpBXDIXyemdlAYka60Rdsq
         xr8ROH0ryNR0vKSb9GaiCXRE+DSARwPo25x9BHWBzBOPe15Q2/70uaFKf9/tfy+bwCxc
         e/RlBviRkr9ZlTJDil/KwGoelTnBxMQ77pc167k4TfJ2d/1QpHnMHRj0ISl++b3Ljqwg
         yJfn+qqy8U6AJ8TvzPllu0CYAKyffReTy0S1Bczrzu3WVlosL0CfLhJAxqq7BoAXk7S9
         zzsw==
X-Forwarded-Encrypted: i=1; AKwUvBw8GebdQ5pp+QJXzLT2J/+l1FCW5HKHP9Zo5ar3g2uS5yUcw4MxNxQAuLPws8FG6Ph0JtqSiWsDPOuI0QJ84y3J@lists.infradead.org
X-Gm-Message-State: AFuF++lsal/kN036e4V2ue3zGA32/MAAoJX7gc+5jIgLWWT+tqGRPU3j
	qFU4TCbB8YatHxmh0Y5O/S5UbPErIdxE5rFKqzNKSmSv6eiQkL7DwJ0hTS9OYdCiMwKm++WMKRk
	OVKTpY6vlvU4bltt5mE8FLouI8hFxh8jhRKgk9UIiJb+e9gYmVNbjtmQZ0b7mBmA3cQAvgEn1sj
	p+sw==
X-Gm-Gg: AYBFou1d2q1fRYIOW41q84GphjQuqI9lHF9xS/PX+5LSM59hIY0SZTSlpyTojtvbHhi
	2T4yOodyI2UAnVhrTwZfUVHHrEloxI2znY1+GJjZLlaHlqJNiNiCTpueMpWQ4sklY9wPnkYrx9u
	Fq1YxDaNziqwz228k+1Y1u+JkCBCoLUGHwYf8Vc8kTYn2sHplE/TBpY2+zSKVekQGPpGQKiPcOo
	dmHIh60OEDVn0QFby/Y+zaPwn3crlp39RXuX7Ya22CtuzqhL43jxzZSAzyJeLMpnCjA/9KY9KmO
	ZlhCZOSCnwnEdZkORZyg8BbWSQRkRcjNXvSF772yKLGKolpD41dPfsDeeLr0FMZRISfmcl1cNag
	uaBoHjo4FGUQcuQ==
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824664585a.28.1788778690491;
        Mon, 07 Sep 2026 03:58:10 -0700 (PDT)
X-Received: by 2002:a05:620a:a495:b0:936:883d:89c6 with SMTP id af79cd13be357-9398043579bmr1824659485a.28.1788778689899;
        Mon, 07 Sep 2026 03:58:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d0656e7bbsm200216825e9.10.2026.09.07.03.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:58:08 -0700 (PDT)
Date: Mon, 7 Sep 2026 13:58:06 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: david@ixit.cz
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 4/4] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
Message-ID: <bif2vhuzfskrniqvp4acoxfjvpyypr533ulwpvo3f7pwkcods3@wa47jbyowcpr>
References: <20260907-stmfts5-v7-0-4a53381cd038@ixit.cz>
 <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-stmfts5-v7-4-4a53381cd038@ixit.cz>
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9e98c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=sfOm8-O8AAAA:8 a=EUspDBNiAAAA:8 a=edXKPL0xb2b_iQIxsCMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: WN-5cS2beLaIHrU6N3pZWCkcQSmnQebw
X-Proofpoint-ORIG-GUID: WN-5cS2beLaIHrU6N3pZWCkcQSmnQebw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfXzxgR99hGgDgS
 IHADNJJdH734SBYMeyzlOgIrGCExCCV374rUbINA097wQRoDjGwCZbSYg0I/yuzXk582xwFOUfC
 wAXcvpVJwP/fJ2mN47ONaqpMvpaq1Gk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEyMCBTYWx0ZWRfX+GzL/YDd3o1q
 X0xoj2OJTyOj2H4fOiCfNBnb65i5cGM3j9+tUqSZYCxGgDkAS2LQ2+Wxw9PwSQ/ghHtQZnpnAb2
 C0HLiRCv0zymJAptiPa6pfCo00UTGaQZ97olrTBGn+E+dxXVhhi2fqUSUqM4Zjjqr4qO8Mel08g
 8ylAamYBaJuYN20nSnOf3uMYMhHPsKhVwB2xuhj+dNODUE2i1lxtBvkdkc5lrpZKL8USfVtXAjX
 2Q/kfe35iPRQISr1KdCDjab+7Qk5QrMN6kPj5D4CkfyKaPr0atNJdWZqacJzc7xxgEgsT7yoseb
 +LZ+aziWDesWP7gxB/Jk2CkD5PxEePq1e9dR1fiMx8yqscaYWKaCZSO0cvR/P7Knq3KmdLKrygH
 c2DapC7wW7MwHPh5zRFdHnv96YSYw6dzOIAHd+hRVhY58RgIR8FotJWT/KCy0+fCVSE/oa3dxia
 xdr2FI+YRpqie/TVeNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_035813_628993_AD31AA3C 
X-CRM114-Status: GOOD (  11.70  )
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

On 26-09-07 12:50:22, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

