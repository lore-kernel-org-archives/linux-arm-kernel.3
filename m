Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90CB6C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=; b=dKXA9m5vxvxg/D/6gErlXouly+
	uwn/niIqAsnGt2cmtGpNXwnq2ROqnA1Cm2PZF924tNwhRy38VPRPUX2jta9itaJnNWU7fCPe6xw2o
	Z00Doz53kOzqSAfV9Hl4Xr/4UpwiRk/D5GtmZlU0nAyMb0W6njr1Oeym3H23n6MZy66Vf0TXH6k+3
	gd9ZXg7PjsaG4PPBU0lOpq9H/UfnbbT8UCGSHzb4yEY6cHGaS72uFd81R/kBY7PBrRj+D+ylt+OED
	GKdtgMqUqatRZJX1r5AsGHL7Enz4M9OzxRF1cYnaqkDjS/gZDKBDHxessSufkFS3+HVpfQ1IS+b88
	sRGpLW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E2D-0000000Bg82-3Hdn;
	Thu, 17 Sep 2026 15:28:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7E2A-0000000Bg7M-3Rfu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:28:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HF9kcm2024080
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/+Kdrxqgr+DvSDtGHpmdyPJ+
	B7JjcHm1WIvNra5tjA8=; b=SoDptICml04LDj+/Hm62uX9L2Hm9dE6SyQxVys8Q
	k7ktWMgoOV8o+O/EpE8Qp+cXlre8FEjO/SdNH3MwBzXNJGtMoIrI6g+s6U61AQ7T
	37sYmKtsXOOYyf+0vxHw4Zkx/DAXj2rgUksaIzaS8YDdQ1RYSuIz7WDHtg9tOZtp
	uQQBGFuVRb9ybhW9TsaznIgeGGrYljvpNc4FqhDc3R/2u5yOj0kHA8VoZEfelkFn
	aPm+6x/m22buDEGhOAbyBBsu7QHewNMActhvFlBDUN2LjS2ijS0PaB0uKAevdswT
	3p9MyAqJVqWMTrNpTIsXcFnVAALR1pKtR0bo7i2f76CM3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt02wk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 15:28:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so184448185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658901; x=1790263701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=HjE1/eGDO2XgOey/cHmkJUOd3YDfA8wcjZWhTtfeuSyWFcICSdxhm+OCZWA75ikrn0
         Ew+HKawZPDwV1WxIKSVFM57Mp6MN8GnC+ZbZKfPjeHNHacOH8RmlffGu5jP1TWjMLbeM
         ATKrGBMu/St69TV+dXlkzaOg+mTgBhv/0RfPYwybySDm7TNGvN7fsv3q5o6GvM63VOBP
         1ydvtksb4akpFgsvJyeLKCQXWhKYpKUobAc99Zh8M3H8kC8ongRM8S7zCfcEdm3bsioE
         UxFV0/S3UiGY9GsD/0CV0vzr8FFrLsDjJq0QqK0VzXbERl4cQy5pz+f8QyFzyGr9U6B5
         ksaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658901; x=1790263701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/+Kdrxqgr+DvSDtGHpmdyPJ+B7JjcHm1WIvNra5tjA8=;
        b=GzTgih3PQLQKhILWFILUn8al/zeXHiQNJomuKVyjshsFjHDSYByhXccUYS1ueUyZLr
         pvVQPt/m/BAiYco6gkskArgbm5of90R8gY8CHbMF0ylVZ1s2yx+na1FF56P333kmtHwu
         1BUNjo1dQ3xhMCcds8JWamLnuyhK+IjMwHWmYqo/hWL4WqRQztlZUhpjNs0kUp6BioSp
         QWhd9NlDaw/V0AOqfzL4/vj4cNPt6O1DpGqDS+LCmQ5wFhq/U8CQGlcWj3XrtKZWYHJ+
         ACbdGEYtDlYB35IM34ApI0G8oU+UAPK5MHfD9AXbpuPxy+cHGcV+Ci5NeGy8ewQ4pwd2
         nBMg==
X-Forwarded-Encrypted: i=1; AKwUvBwszrVtLlv5LuU7Z4yjxNRf0k6RwDjVLgMsh+U+2XfP36oK/P6xCoPzOJlejYBHW44bh4UV+msEuSxTkVN2btCC@lists.infradead.org
X-Gm-Message-State: AFuF++mcEzP1JysDeuFge0SO07P8gqUXDsjBiFf7Yojpi4b10pSw0cuI
	/7NPr+meCcnBA2asV0mcOTA7Z7Bj2UIL3Rn3FEtwFARe/gfS/2pldby9a6MuCq9sBfyC2YP9v/7
	Ez26cU53+CFlQN3i3ZK8y4Ok/521aAOnr/AW79259yCjcCo1ArsKPY5KZpiZIG+IDqlIb0y9im8
	vrrA==
X-Gm-Gg: AYBFou0K5TJhMALEC9e5oggAMx7ni+N3e9SpyC5W4uhNVdixBhtFvQbgNw57/97uWtB
	Y20zB+NlsXbDTdWhpkFFcb7k8i5dirqEI9CZUzosZ7Q8BagVZz3VfQJvJHTcPhe5kNzZZcwuVEv
	QdpIqGyA/IzZO8gSOtphZMkYtfUTuRtI9X/H9AjD4BR4pWij204wqoZXhsnCDLq+ySN7JMX72JH
	+HVBJwUE8X7hiR+fZn06qO2z3q4/oUf5yg4J0GQNPXhZx67Rc8KNiPaiOXakEPirG9Z8A74Nhr9
	3NWcso+wNMTWi9y4YHSxJVKTKekV7QmnWHjAxznMFoftZOoMp0am+h3Jw0FB0t9K+n9YX3KpsaE
	+/VXZ7FjOL4UqUf4=
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300811085a.11.1789658900980;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:600b:b0:939:fc74:b6af with SMTP id af79cd13be357-93bb76bb19emr1300804985a.11.1789658900484;
        Thu, 17 Sep 2026 08:28:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847ecf52sm135817625e9.2.2026.09.17.08.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:28:19 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:28:16 +0300
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
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/5] arm64: dts: qcom: shikra: Add mclks pin
 configuration for Shikra
Message-ID: <o4tjzh6mufahuvhllyxse7p6vvbmbnw4mlqg5zrmgyqa6ated7@m6rmnyse42g4>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-3-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX4f/8Ua7HZw3k
 8PjoqA+qjmXKLnct2XN0hEpPwxmEfMc16l5ov66qqfN6GvtpZNgVljc5naoC90APpW/rLygvOOX
 qpdyqX47QvyRGZl1EaVM05X7TqC7F1cn9bqP0L5KxqDZueGQyxH2IJQTr+Ne/9jhOG7WXiST2o5
 ylZhO8eC+ul95ziN0QyljnbwdY3qN1HkKN9j3saclCpPYHsQsV70HdfW86+P7//Xa33FNQJNtvC
 EuMIPGR+75mk058cjV/QydayOyiREnMkrQY8n6xM0gEyI0nyVZQq+i/xNC4etfc7VNQbeS1qhtX
 7RpwWyew9NBsvfsCXdOIH66x6o0+hI2z7PuBClZJxt5FWSh/IVuZldypMKMrSMzvL1MOgM0qqYJ
 2y0bgW5a6+AwNIVt30kDLYmDdsClRS0uDLppnNiJFq3lOx9Cn9GOvb1scg90GWjMTGiTzXDJkhn
 w6+1JWKfs8TTgBvN/5Q==
X-Proofpoint-GUID: bkBAlQSEljyOmn0MPYzDlun1-Jii41tI
X-Proofpoint-ORIG-GUID: bkBAlQSEljyOmn0MPYzDlun1-Jii41tI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIxOCBTYWx0ZWRfX6OVjs6uW24Iw
 pqEFCP2uklHYJF1wz4jhrNYlUMoJUsybba7i8g7JQO6ToUIpEKxhJG8IxN+nb4C6JgCLKNVmN64
 4ZRciVv611urmupsc4G1wGLAgspmLc0=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac0715 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kTwRDD6jQfcqJCPQX_EA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170218
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_082822_973722_BA634E09 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On 26-09-17 17:11:02, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

