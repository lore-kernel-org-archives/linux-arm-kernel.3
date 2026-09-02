Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32077C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=; b=uWGH/ppnRzHEIxlRc62YMuN51W
	xavcF6LWHMu84LBhPFf/OapwNj06zi8kY8Wk+OFg+pTohDQOl5ru4N302lxYOmkEXcpp/fzXl4nG/
	oQyp/KZPj+32SYUTJ2JjUzAcbq4Dzl5D/jsQUdosyv7JaYsyQ0LcaLfaSYq0hrMHfmvevnwsO1hR0
	O7xX6hYWkI2L9WxUkbCGEoIoxLMwFId/Nfkeq4Z3Vif+NnmwdQ+aBDNrVQmp47SPDUTNqixqYSAbQ
	bqUsDgfHqhlSS9DV46fSNeY5aSSuUjc5eKAjpvL8WMgC53L6pyuA9Bzcg91EW6fFBUXUb8925Qdrl
	ksMlo7sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iCm-0000000ELjH-345U;
	Wed, 02 Sep 2026 10:28:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iCk-0000000ELiY-15J1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:28:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682AR0m41287089
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 10:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=; b=fgIObG4IJ1k7QrEU
	cP74toYep4HOEcUyq/X3sRPm5E5t8BC5srdwxYeufvGKj+oGDKG0Drz9yihHXglU
	tn9+NpBvNcupikKBGNB0Xl5CrsVKbsjdAbAd1uSdI61gr04hycB2nlzuIwoI3IS9
	ngw1+ZW1Bn5gQDLl4rrd44GhsQtz/Bng8/1iuv7byRIxqQKwWtBi9GrPCLz5sVn1
	FZetGGtmYn2HixLNJ8C8wfRKHgtbBuahn4RTTQ5g2x3blVWDvqx/ONFcZPysH+pa
	Teqh+rh9ndeVmNOy1cyBPwT1zyd63mQ5ymV6qA0umK1ut7eai6p1WTqnhyYIXVZh
	AAS4VQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gej2c805a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 10:28:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52fbe82672eso15228111cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788344908; x=1788949708; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=;
        b=jOMOZ/lv4WwhQEeiPlaUtVAGrEb4plsEGSly/tTG6ZRZAzJ9wKgS5zLC13ID+G6diq
         6Kr4hG1RGp89xBuapllEBiM6gbDvxnh36lYtlk6fywFkb9V/0BxEuivtHKGCTbkSDC6d
         bnfJYffFkuIsa21/EAza0LI5TrJRG/NqXgfPzC+lrTAr2dEXjpPGab0ZvzLIOHd1+PQc
         21fmPmA8Z9FNy4q8OqVmiXmTs5WeqxLcY6PAvS6Tm6+EfQUs4Gs6ZSR68jaCGDes8BMt
         2gtYFkLHxnFyiaoxsRsJ9TxAbIMzcBc/yVpIkEUPRBgEQ1r7FlzZVkrUAtBtfkm9UFus
         1J6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344908; x=1788949708;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4sS/8auj7XVVOCiV9ipoVmQuGPplhEaUoIns8k/ZjJE=;
        b=A9LHPDAjEKFxVW0I8UqvQFj6Kg0/Cmqun1wVTwpip5HpFkYngbrbnGj+HMeawAWO4T
         5AIv7K+/lLv8f7gSY2W7OY6f+XaXEhLU7AJ2xn71ymVXMYR3DQDOycDe3sy1ks5Xw5pL
         SQ/mjKBJ+dkwb2YtxcwQ3gRxEEe7t5UQIXotNLDfDC+w62+4rYevM9w1Q51hdsSkFodB
         EyDA/mwiCpqm+yLf+hDKM1RMFk2VbodvZB7ICKXRMnMpCW0jeojDLwQo3Nvb2smVfW6I
         b63zzk2fqPyRXQ1JS4RCs0K3ot7Bk3xc4MUXwXwLt29f2AiI5h3oaigV6BRqJSvzzoS5
         avIw==
X-Forwarded-Encrypted: i=1; AHgh+Rq3WQ9tcR9cYNwVlcP0sHJsYaprwgvIWa/4L00XDkcodyiZc2H7dysUwhdPOb7kb1IZy7HF/n9u04JcZZHnWTtD@lists.infradead.org
X-Gm-Message-State: AFuF++miZIWeoJnMwsqluOhGzoKY8r3oI1c/ANlEurF1XenqTF/ugcCC
	LjBJGE27BXLApZSb1mK0Fsnj/EoGfUlEyE4kstG+2oVg6aNoaConG5a5NzukpGW1DjGCTYN+D7C
	K8dByzbqr5VDPEnWr7+I9FD42IMSth8TcgUJ5q3cZpbX1ECeNInzlT1APCGbNjCXUXzbJYvKdcq
	6Xiw==
X-Gm-Gg: AR+sD10vihlEXXGQoc75xfB4fYPNwUHJ9kHEyDG3wokhY2Dy7zl8kxYwglyj0RgdKLg
	lzf8psLlxRvM4joVMzbAd3gEBTIhDXds5z5N2+ZgJPWG+dMBc3+OQJM3/GUga7pTGBln/MNZKCK
	m7//YQlE9BDdBUZY5PhWC1+0YFs6QPpH7G8HYjRD60KtIYWvLCMe6egyCdI8OFINNJg2TZkDywn
	E13F+1Ho4G/xIZHBALxhDCUmQoL3LPQO7CvM+q+yRDXbhJKKY/woSRoRmCxxMSbecTjaVVbVNyK
	rwCEkroeAL7WL8etIvJqlgPz1MsUg/pseFmYRCJDUg86kfDqEs1+FbQtjt5kHjY/yvIAP/nRJZi
	BkquxU4Mvg3HApqdg4S8RAXRAjtc=
X-Received: by 2002:a05:620a:4014:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-93960e2b771mr416389285a.12.1788344908027;
        Wed, 02 Sep 2026 03:28:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4014:b0:915:e9c3:f1a0 with SMTP id af79cd13be357-93960e2b771mr416381585a.12.1788344907613;
        Wed, 02 Sep 2026 03:28:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b759:bed7:f8b6:ccad])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eeabbfsm5202660f8f.31.2026.09.02.03.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:28:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/15] Add initial support for Qualcomm Kuno SoC
Date: Wed,  2 Sep 2026 12:28:24 +0200
Message-ID: <178834482169.13446.5654514434501289508.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX6My3R7owZ3vC
 iySjVF/hLq/qhEr5I2n/AC7wMdbmhuNfyoalsBJ5EbQt7eeii/D7ibt4lSfopz13MdGFDI1OMBv
 KpGJpZ/Bjhs+EVKswK6cqqguYGIrKLw=
X-Authority-Analysis: v=2.4 cv=G+ss1dk5 c=1 sm=1 tr=0 ts=6a97fa4d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dNNRhoiiR9TqZAOi20EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BB1rqeSVbUnPqZH2LirMQteShVxYYKUF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA5MiBTYWx0ZWRfX2do459MiAfNS
 acy28eFoRyU6g20m34UEhDRO7jQrL4hmacRASFe+P361Z1mBfeYjpHaGx+qPh3JdzdanTZ2dABM
 mRD9EFbAV33h9F+EdG2l1rGyK7UoR8sU7f6BjSvVlypime8tPGZqQunc/DB5QGDk5ZMny4UE/ea
 R1iyhEFfiojp9t/HxJQuNYtcPWIPI2iDODgXHjjS21TzDN/zV3/wueWJKUoPtdOykUt2JagsLSz
 PoUfosqpYuYov7iuBS/JdpSgYA7TIXQGrpAI+w6k5VTA4EmbdksPje9A35AbBfb/HREJ03dk39v
 cPomYC48ZDdwUR6C1jkWzeQ0c++b1oHmsR5AWLZEcZGt/sgunMaVSxMttgzfaoBHeE3dZRd/KK/
 Nic10OG5yqTLfVzVHPnqTijrSjiYKkWxy4T0QoHUdWh7bGUL0f508Tz1icrHe6/hxiV0oVoXP9y
 A8P4+UOwFQLmMr5h+UA==
X-Proofpoint-ORIG-GUID: BB1rqeSVbUnPqZH2LirMQteShVxYYKUF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_02,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_032830_309932_101D0CEE 
X-CRM114-Status: GOOD (  15.18  )
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


On Thu, 27 Aug 2026 23:21:03 +0530, Hardeep Sharma wrote:
> This series adds initial support for the Qualcomm Kuno SoC and the Kuno
> IDP reference board.
> 
> Kuno is a 32-bit ARM (Cortex-A7) Qualcomm platform. This series brings up
> the essential SoC infrastructure required to boot to a serial console:
> 
>   - Global Clock Controller (GCC) and RPMh clock controller
>   - RPMh power domains
>   - Interconnect (NoC) provider
>   - TLMM pin controller
>   - PDC interrupt controller and SCM firmware interface
>   - Devicetree for the SoC and the Kuno IDP board
> 
> [...]

Applied, thanks!

[08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
        https://git.kernel.org/brgl/c/7d65a9c8fa31e04f41bec15fc4a4f51e207d2aba
[09/15] pinctrl: qcom: Add Kuno pinctrl driver
        https://git.kernel.org/brgl/c/d0344c6510d050ee79c6aa3997f2c641168ebf08

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

