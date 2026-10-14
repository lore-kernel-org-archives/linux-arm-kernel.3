Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4C4CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=; b=ruNPIEx3AXJEnTZrBo2LYhNrFZ
	wj2UjFks+Fb+LQlcsKoXtiPlnl+YEIKXiWM/yHq7oRI2VKsZTNXHa4okhPL7SWu96owhEesAkK4ep
	B1XkkGJbzrERQaPIq3B9RjGDQQjP9UZnVrAaZKy7M6k4gOJsfBKHuULSBc2DCpk+5ABUcR6Ql6TVP
	70xEPF4Q5sOkW3+RN4iG4kC1GXapjZKPJFccrSV1a/g2YTx1vTb2fU/lYwfigh/7qc8o2yI2XpTFW
	15n6qksxX+79nUdx/ETxGyJqMVcrFmBI4wDK8KkqX2mcg+2MZee+qm1Hx4yOIbCGkrtZPKCpuS7sE
	l+bAWn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNZ-0000000EtSc-2Hz0;
	Wed, 14 Oct 2026 08:30:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGuNT-0000000EtR7-3udn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 08:30:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E4RSNi2222100
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 08:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dobmJMNsUw57587c4QcKw09
	gC0COHOcPZrtPPfuPUw=; b=CUgXgUMER0ZTIewiEPvYRLEEcjMbTE0PMldELdDc
	vH7FraZ2aaPVdtqMCxPV5AvdUS+OHUI0Gk+oH1eIK/vqlzOnxxYxATJLC3s5Q4tD
	uNeg3gPCCo4OOZn/Zki5eEIEoDCqsZbcx0V/h0HoDhGKJGCEdgpp7qKLB+ICYqfY
	Zwzt6JvJObl3gPQEc/KgX3xEMkYRsfTbVULnCoqwVx7ZwnhzHcLQrb46uob0oB7e
	SGBPibWIu3ibf/yy4TI6cFVYMF4uP9V/k+YCGQk0+SWHx4IqPfIgMDzArZFPLwxM
	XXeAsIU9GJawVc9stPbAEN/33aQafbS4zA23K9c03Z/+YQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9txsamfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 08:30:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so839000385a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966622; x=1792571422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=IELiOie49jwwNNRibitF8NPoLYyUidh9FbsVNQHPY1Owxr09G1ZRC1H9dNrP+O1esk
         JPdfYCNDUihifVM11VR0SlvL4bkHx0yIOgFW84C9zo5iEw1xi8BBildMmBkOY0SPU6uN
         MPvzplWoGP7eBdAsAJzm75+yR7app5Rv5Oz/nM28LrphuT9NqlPByGvhpmnRM9ln5ux4
         1eS6NhC4h8DamPA//fIYteReIwu0cx0ggAjdtIKLV/OufsRjy9U5fPaiXn+tbEuiC5Lp
         /+eZ7V2NCx4ZvIe7RUMp+HX1vXgUbF3AFpOJLTt8t2zvMQyYPA1mzr91MZtWRogJIzbV
         CsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966622; x=1792571422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=iGpIN816iQepIBeG56QQhPbtKSgYZtIGh5loT0ZRvP6bdkewB8m0ydViqpAeQUNP9n
         xZ44pMOxzOHSaNDzpVlpwAnQ6XqUvjXEijzDJpRSEnc/+9mNdsMwOj76aSnHTFaVzxed
         U4Zhe+i+W07YcKnJ1iy8Txs/J4AwZAgdI8FSxNIQyjY7g/EHTyYv7qcwfYGMoBedGxx6
         1fjJc8xVA0aXJVSo+q1441sHJlPDciC6PFWpjnRVp/Y5caQmVtGGJqmnDBQ1eOhiM587
         WNrNhG+Y3ez1OIYOFq1NZjlfj3aXGLAkRbhObssiPLLnkc6ZOg7umnbS803rfuAyjlX3
         QWxA==
X-Forwarded-Encrypted: i=1; AKwUvBzBbSaHC1QknTv2dGA+aZdbtzlhZ5CzYPd0YOaT+aglft7Aj14L8wwPM0FKbtGUtet0XKp8iOzfmk05a3phy8K6@lists.infradead.org
X-Gm-Message-State: AFq9FYKS/vCsd9GKkO690Wnnqs2VsKlvhEFKv2SCvyoJr2Vz0kHUnKYk
	X09MSdPJc+sGM3CVrZHAW9Arz/XAZbIiepYDKLu4t942oSLVfy0lM4S5YxQUzuRRAkfa2NwVXob
	toKD/a6AQpU/0juLUfPJwxIflHygfT8Y2G6JX8hv64h7hIapnFxFGqOjXoiybvTVYycEBIHeuQD
	lZ4A==
X-Gm-Gg: AYBFou0VvCrIPRkpFmvdyIPiqWSkRR7ffeXvVOhiLgC3il8BlrwbIYRpv9JWlL21WHI
	hNxGw08/STRS7MBeKGFic4s0gF9+u8C/HQ/peOJoeF5YqxvGcwfL7s8V9czRJ8yHizFql22J25/
	BK8fWVI+xVs0toFRNqpnUo5Z8cUcyzPECLLZUyev5XHyezJYWh4BlLTTNteH1thinhyYVrvrw03
	60y1hdFqmtkd4MooeGTLevtxhKo5BXSMxIbuivA9Omj8jFkQ02Krpa4oNc7KenkJxGVsAp0jDrm
	a+ogkZx8++W8NuhWEdgEIJ1SirXAkEoJf41neVv8YsL4aX4iUHU7JOK3/b566QkCzbqUuLOUyv1
	MABtLyBWdnlRdZumZ
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524663585a.23.1791966621717;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524658685a.23.1791966621064;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b8cc7dsm23559775e9.4.2026.10.14.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:30:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Message-ID: <2cfacl7qglbbognw6g37qnhslrc5fhstluiol4eqanqn2qg33y@4a5nevgajbgn>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX5rExbu5cFC04
 rROD1g/up07jeKcvhAOSaB/JAAUzEpoKKf85QlQlvHDLyoGX/0zoNQQd3W2DJ5Us/hLdfGXfgn0
 fyUphVVix6kNy4qdBV8UxwW46nmWolh9j3T0nW9JMMpJ5JxxmZBOHI7Metxk5fgyFZCadFEq+S2
 qUYeLt0Xdy0A0yKb/SMmxYRVtu8tlTOTpjcLHRUne7ED0qv3ZuaCPkrN1gRTYtGdpcda7CR9km5
 eNImyvqMemza/POBf73RlxUaRJyBYblHNybkI6A1C4TrDpgzpo1rWYwPrIgcRn0YiiXarr5J9W8
 yZ8So+n/IDuhmGwAdzniQBsXEDOJytDv86S0YZ8zx22Fo31waqUn6IWA1ymQluNfuQ3umUWT0qk
 YiCkd+flSWM1j26DKiu4i9a1sxxRezuNWiO7NQGwaHxTrREgX9bw2mytpL8w4ZVdcjB3KfkOERP
 apkVflmB0X/EhHmC0zQ==
X-Authority-Analysis: v=2.4 cv=LPPz05W9 c=1 sm=1 tr=0 ts=6acf3d9f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mf7eSssg9PIvhwxWQfMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXzasyP3hc19zo
 mOadMv3km3O8uTxz3MN6/8fJfCbJQy5xEXtlNm0IxUclZJL52UnUr/PQQ6NE88HPgKDw1MscbPG
 /P2Y9ZP2INzRyqNTWFK4/LuiRG1OmV4=
X-Proofpoint-ORIG-GUID: Bft1heM1TKXUPgIKOlMmb_0PpSzTt842
X-Proofpoint-GUID: Bft1heM1TKXUPgIKOlMmb_0PpSzTt842
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_013023_978178_98AB2988 
X-CRM114-Status: GOOD (  12.48  )
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

On 26-10-13 11:57:41, Bartosz Golaszewski wrote:
> Add the core driver for the Qualcomm crypto engine. Its task is to bind
> to the qce DT node, set up runtime PM for interconnect down-scaling and
> register the auxiliary device using the crypto offloader driver.
> 
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

