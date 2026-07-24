Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 745B8C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=; b=VkGE7XmCwgim51mUvTX/+0PwcH
	o7h6UCneg7M4LSrUtQp7PXhi8iPueLFMTyvZRDs8Yg6E37LWIm+pDxHPFO9m+Ma9VWtOLryBXRv8H
	/Xl/JtSh8p1qOaP/D96xyiSPfITWD0fFQFAmB9b6upFQ/QrcRflIKx3w3JjYjGsvyJCeSRaTLWqRS
	8RGe6u9LJDTiZgIexkMXUq7eEqQz6ehCz4h1iaXZChhqK4AZAW2ZHxbqrBnPRzqZfhpPaqGL4uk+b
	Pmyv3+P9cRtp1gqBsHqdCr30oWUcEauoPc80TEC2mIWDMIrCakTHHBtWPFUab6fODtCrzGgQD1NDy
	QftuAtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEvi-0000000GMPm-3wkU;
	Fri, 24 Jul 2026 12:23:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEvf-0000000GMOj-29Lc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:23:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OADWl92720591
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=; b=XOA7KUZy5pk6PVqE
	Nc4Ta5bdbp8FPw6UN6UBTUZItLw0RamLPAjQLYfYFfU9f4lXXakwv4L3C6ubnPOE
	Gz5PjVhI9ZSKdTodG0gQkr0fDrFr/UK5ZBn8MXpnOy6s6PRAIyL8KyAxQoxlhNjC
	65a6mUyMdFY2D/Gn7SB8VIkqPnvGrHPSa/fOrND6nJ/1OZSPfaIMhflF7kMKN0vU
	dPfPcFOnlYFndTitzlIk70aHKkSOF90ZQOiq0UckkepiYDHd+pskcC+vHhDdNrt2
	iCdJR8NASVXn3e63hqKiGF1WTyrfKhFja8u5FDEKyNzcV9FOFwuwvu942F6C4Zgy
	SlLV6g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yagfyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 12:23:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52845bd815bso849791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784895782; x=1785500582; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=DtuuRQ8Zshql7xxt/1Okyt88esQgMHJ1ptXH41RWNWEq0FHl0ULREQCwX9IcYZuEt0
         0lMLVFZNf3qeav/cOJCBtaqlcvcfOEhH3wx49N8EykVORZk7usge2y51y1Q8RsTofqOc
         /4nH3Yy2Giey//AH3IgMajBP4MBQVhxPuVRV9Wl0xXGRPzEVmc/lURNYLbW61kw4N4DG
         KThGC1IYcLy5YNkV6FrwrTY84GfFyRoQaDpwhsuY1gYjbmupCO2DhS3XwvPY5H+p9gvp
         FgjF9VsDxJipaOBQoVrFx9K9n8cHE+PyBX9JeQFJPcOQrxWkxaf5FtQblYUaXS9hXcXr
         aS7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784895782; x=1785500582;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=swyQuDarVDN5VJVqjAFVM+bZ5jRGsu+zccVbSS0Cmqc=;
        b=pV1I8xVbihO5tskxm7YieVi/ftTqzBbFBtEFMITcLC5El2toaKOzLzdm1WLotyfXWp
         oQH76EE5PNGcof0k08NxJ7pmAKaZnnXGEAvLMGI39olDve3cgsJQhB6CDuanTwde/WLN
         O+USQ7uqpZ5v5bZms0K996hGEiGsS5wSsUE4BYmi59pziAAtcy0CRl3klQX05KKAYTG4
         M0cubBzEa4wO8Z5ON5fvC/pHYpxjbTjVfQ5+6PABQ3KxB3oB0DuL/b3dWcFXuB+euhsR
         w0p58RmT/c09kCJaakiKruAUZX0ZvnywCfQK3S1/3XhtcOiuM94tULhIpcKBEAtlIDt2
         j33A==
X-Gm-Message-State: AOJu0YwlHFWaPbNvPTG9ZAJ6i1CRdHvyYMrXfIdsQx3HHatxFD6YXcDU
	kZd+ZCip39caW24znqhIuzakJm6wIM2S5Viu6JPHCod0HrxvCBB+pqaD1ZWfAMh6FHLl2WHu7en
	N6XFpsWHzhYIUVzdzXoTe1yHrjCmMoHjkb2c+MglMhd/Iu3wHjLXI5LSyTOgK6CfxBjR4IgHlQx
	O6JQ==
X-Gm-Gg: AR+sD10FMkCH2EZTZHzJ6OwibAJDbLlzTgtDFh+vCqHALUKU7GYL02fhb9EmyNwev0q
	aEjFERuNRQbVx6ZnnXiIzBs85RxPaD9asjeWYgU/jU3pXD+y5U02IwrcG0sk8eHyCxkhUDZLjnu
	ey1yjpqWmzMWBC78dYuWS2MZxGil+LsXIwjbedprWWoJtYfGyxy/K1uQ4vtp1OhNIY+/fJSl+0t
	KFZsQSPQTKeT3c8fxMA78kiWvpIOlbAmaP2riDyT4UOvaarCmjIBHVt8/JR/jyqBFA2p4TJoO1A
	gJX1gPRWyXvnT1smGdqYrXW/Jzz1DJlrXzIdOLTCHKm9hbkeRAoDpeEH8sMHfR9nJ3O8NO5X5OH
	9AWGE7G377BADKppUFjR42JVa
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380951cf.3.1784895782007;
        Fri, 24 Jul 2026 05:23:02 -0700 (PDT)
X-Received: by 2002:a05:622a:6208:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-528496c5744mr31380561cf.3.1784895781535;
        Fri, 24 Jul 2026 05:23:01 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ebad78sm339747966b.46.2026.07.24.05.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 05:23:00 -0700 (PDT)
Message-ID: <720eb684-ae89-4003-b167-e427b4d31add@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 14:22:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] clk: qcom: clean-up simple provider misuse of the
 consumer API
To: Jerome Brunet <jbrunet@baylibre.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
References: <20260724-clk-provider-simple-clean-v2-0-56f306156d25@baylibre.com>
 <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-clk-provider-simple-clean-v2-2-56f306156d25@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX7PSuQ+NBcxvF
 l2Ch25SPoPaPFg4dc59OWBa6SWMYiPVIVtWNJWEb96I504TwCmU7aUDSWa0OxuSdI+wBbuJTTyf
 o9at4PVqmeyFlz4Q4N4HUssI2woaJD8=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a635926 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=20KFwNOVAAAA:8 a=IpJZQVW2AAAA:8 a=EUspDBNiAAAA:8 a=4bE8Fl-H3dgRu3KWX3sA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: WQXAY0sAvjwhEv_AKTw-ICjMbM7YPzMA
X-Proofpoint-ORIG-GUID: WQXAY0sAvjwhEv_AKTw-ICjMbM7YPzMA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDExMiBTYWx0ZWRfX9XkfZux2BMET
 IfilNaR0ttpSLR0DOtxVus2BhBi4hL5JnCAErEQAZTezFLZAIi4XMd8kIHc9B8qqxnQVj5kZwRV
 vKld7jDo3knPn8VcHG20RFmADvVdhYfHxXJFYyvf2MMQY19tnFun008UN1mAheYEE/8urTyXYQm
 1eWbFIbuRJvNpmpbkxyK9BH1kKRjckyGJ7J1XNKFbJBMZYTrnkpEYtI/6oDfGiDLTVO/hFTgKv1
 8PMWWx1pqa7E4NA3TtKsrDLjOD/EPuyQdeVchaMblut9C6ndWFdRK/jRqeaYZ550QsPfkj4L/fq
 VKxedVt/fcWtISBfYR86WgDyWtriSRV7z+pteyF8UpcMhkYpjRWNNZfPg/ieqRsJPrB6M5aK519
 mm/wORLkidOQHU4aaeQo/kmsWkbgNBbzqT7nNTLwNF5t2QguHk1xGH9dNgz9kQYDKjiK3U7qUu7
 ImD/4v4BNWa/vnWdYdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_052303_669746_8F6DC185 
X-CRM114-Status: GOOD (  10.66  )
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

On 7/24/26 11:03 AM, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist.
> 
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

