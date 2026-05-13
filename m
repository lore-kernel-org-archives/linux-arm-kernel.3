Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CCACD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=; b=toFMDMejnYVtNNJ54Z1zf6/nBm
	C2uvglKJBYNsthPAKVTVSzrjr0Li22AXkYNIIxKObUxqUUb8B6/ZeawOmYV6qqm3rdyLZqNQAspzF
	fyijzgRAAni9bYgVhylngWag0TnA+rsc+ublQI/fKxgw7XUQQvBqyb4zJgoO00K4K4S2edxI8E+F4
	DLIsm+7QZAzKlSeJbxGiYtwYhCVHZEW3DtsgehdmdY9EJwbg+ZkUPIrJ4bxTHULgA7ZTiAfDaHkpb
	1j2e4CPKfLKGARVj5OVg5fTHFUxnrryHkWTo1hkaV6PSC8DRIKZ13OGqSKKKJBCgKsi0fASRKUdLI
	vtC6NI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBwY-000000038sq-10ph;
	Wed, 13 May 2026 15:56:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNBwU-000000038sO-3hRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:56:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DFdsvD1242983
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FV62wPVqhcL8BTl6zWBGVeKP
	No6dhCw0zP2Wz9XZfdg=; b=n5PQwejakgy1Saq6D2G03GmD6kBJncnv8hU27ZiB
	Uto/DUdOe3r/ZM6zSO3Eo81hzGMzxZNu7eYrUsjLon2XAQt1D2EWQyr1wMgyLr95
	flB4aeyO5XZ54jLVAlqceRmj/BPzMcISmh7epxztJjuZ9XNP0X+OznK7MZJZocnE
	Pb2teSiY+ISgraRD4+ooddaQdytqdA0sbUi2aS/Zrt1TA2PGwdpQN0nm6kHQM18n
	DJJylK5gT7yPDfog79SgA7uUK7JJEfA7ZoY0+/YWMkPAKNjBa/bzb0Y4jnGl6mBn
	bA9p9Xl5tTsMGpCL4G4jSai102pKgP8ypLlqDtkqUZwUig==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4v4tr2cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 15:56:14 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-634ce585b41so1981456137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 08:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778687773; x=1779292573; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=F06xWjh4lFTgijE1fQv/xQUZ4bMwgDK/KsUfVwfONUzOUdeipC3DNzSfz+3k0Eg5fV
         gZJIKg3cTr94drlXPcGddz4ApSTYQTx1YGGYHhiENU1LrbkqcU15LDsQW1+i+myBrPkM
         8kX8hF5Rvs99EWanfnJNRcaaqoS0+akpd1S0YLtq46Ic1ADf7Bi29yXUsMFg7BfRucVI
         IC8dC0+QOQPsi8PjtdOrUia2kRMs/IgGbicdIbilf8tZKBKUW3n0RN9JBDtu5NcOqRvk
         2ypvAFzbCsPhJ2kE1/+H6kzpyAbydmGk9RdFJD6zMhsHlsnGiKkn85b81jmJ8H3/iaOg
         yyFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778687773; x=1779292573;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FV62wPVqhcL8BTl6zWBGVeKPNo6dhCw0zP2Wz9XZfdg=;
        b=XfgM3NYwjLV+kntjZiHTe/r2KbSccOA7Ur/d7et2jsC9DSL0rruFZvoGOrD+B6mpsw
         Nx1YYzaQL0Lf11FAADt2RieptDu+1ccOsKJCdAmJLsMOgzF5SrKYhmYNNiY4WJ67k6Al
         +Nq/3vad0EBAdnnzQciJHXq1GBOhnYuRJGRGtggTwZqP+1lF3YbK8wgbku6IxlQHS2M3
         Hybqx6Yhyq9sJ8ma7ck6xyLltQyRxjBrN/QwlzUI4nKYEXx7k3H7oYdn99DxN0Dcq5Z4
         dBxRaPC8gJzjJyXSp7k/tWcddoZ1VP2/LD9KDedK1uMQIQ2vJOfAtpym9R2yUY/S+mlL
         YMVg==
X-Forwarded-Encrypted: i=1; AFNElJ9r+i4/dD/WYp4/wzN2nkrvFeJV6slGQxH7nf1Cj/PtQCrpO80ZxYFkZ0r/NoaAbJokmusao2mNuXm4vElI6Cuy@lists.infradead.org
X-Gm-Message-State: AOJu0YzdWTYWi+MEo/ErhHMrvtnrybH9wD1GkGJRzNrE3zQAOwwAlaip
	rMMt6M3iAknfrti78DTWkyYOr1H2pGZaZGUz6A2bLatSqmChXNRHZyC42RcI6LBrErXMls0B+Tp
	hyEoz5YTFFbVLD0U6aFM15BBtV/PH27jnPXsV9YVLWb3ihKxwI31bqwY7+4SsklSopw0c38umSw
	BR2A==
X-Gm-Gg: Acq92OFKjoGetypOnja3ejsrlVpC2FUYaAVcxZE+9SoodckBAoK5gVK+c30h3R6cx50
	fszkzsGLMKj8RM/64g3OgkLDAz+sf9rJDy+yhZp71F1LkgZaJh/yYq5DbgZVC9aXp6IMXE7fyQk
	DwYreF/apN+NGiXEy17z20FElmt/tJ4+Nx65Rx595u9N8+CXgWwJerotfUSoKCLzCod2Da2TPvW
	hhiYG5qzWdmIk1cHpwZ3Sfs4D3SsP4DRPJMEO5tOYTtaH6M4ktbmAEae2g52f11fKqrysKLK+Ku
	uERgr6hPHLIQrKFl2M3DT9GGy8jf0FJMfzYvhxiWKD6Sun0KXI7Emequ+4Nkryhvv+ganLOEeRS
	z4uM1v0fu5wb0jM9YHpwCGiU8niFodF8VUFmRG49ZJvfBNTvNtpOajSrXq1a2zpU7lLLI+QpEmn
	uJeZu3n4xJPihHXoPQ2UrrZT/5xisp52kHN0k=
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944947137.21.1778687773252;
        Wed, 13 May 2026 08:56:13 -0700 (PDT)
X-Received: by 2002:a05:6102:3909:b0:631:d3e4:efb6 with SMTP id ada2fe7eead31-637749a964amr1944833137.21.1778687767933;
        Wed, 13 May 2026 08:56:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8c873fd59sm2547257e87.57.2026.05.13.08.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:56:05 -0700 (PDT)
Date: Wed, 13 May 2026 18:56:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>, Nick Hawkins <nick.hawkins@hpe.com>,
        Robert Marko <robert.marko@sartura.hr>, Pavel Machek <pavel@ucw.cz>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] leds: is31fl319x: Fix shutdown GPIO and update DT
 bindings
Message-ID: <tyzqx4s6puwkee4i65ysimcayc54a5wy3sgps4h5cgb76zpsl5@r5ijowlt5ujw>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
X-Authority-Analysis: v=2.4 cv=XIIAjwhE c=1 sm=1 tr=0 ts=6a049f1e cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=nkdmZr8mgQ_COcTxPvYA:9
 a=CjuIK1q_8ugA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE2MiBTYWx0ZWRfX1eAXmtsv0O3K
 KlliqIk9gaDJihA5tTAWVLU4tjdjmXJkt9iTly9DcYpzVAIIsaLfsbCMT1nvOApWz5XYuOgm0Xh
 vrJO2YFLz39fdptpZz7osZXro+hRqdI1jdusliI3696lgqYsAZl81y+t/EEAvHT3ZSCvdg0Wqgu
 AQVgiUhZIL5LFDSWo+cH8PPjmkbuWqYBdokDySvy9FYhR6sE1qh0CwGVE3nC9DofdDncIU+mUcL
 mUUcvH6WHgmddczCdQf3NMNU2tDzeyFjCh99PfwvAQYafiGi85fqq/WNLh016AaFp1+dV0M5KiG
 X1bHpnG0zkGK3RZeUmdRgqQ8d0MTaj8Wcnvt9aSEIh8ayzDAK/HQk8ZxqGmB+iRGIxDNsG2OhT7
 maN3FUDYwMYbsSqUc5QzdaJq3oxSA65XOVcepVi5nsjiKb33+pAwqN5TfXf49UH2r5Xlczx6Cjz
 74Pt/DwT8cJeNUjDYMQ==
X-Proofpoint-ORIG-GUID: F1kxKrvC4ZuaKNckVX1y-SB9AlV_3ahv
X-Proofpoint-GUID: F1kxKrvC4ZuaKNckVX1y-SB9AlV_3ahv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_085614_926125_0A1A897E 
X-CRM114-Status: GOOD (  19.02  )
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

On Fri, May 08, 2026 at 11:24:17PM +0800, Jun Yan wrote:
> This series fixes incorrect shutdown GPIO polarity and improves
> shutdown-gpios description in DT bindings.
> 
> Patch 1 adds detailed shutdown-gpios description and fixes example
> in DT bindings.
> 
> Patch 2 fixes shutdown GPIO initial state and removes redundant
> startup toggling.
> 
> Patches 3-5 correct shutdown GPIO polarity in board DTS files.
> 
> Jun Yan (5):
>   dt-bindings: leds: issi,is31fl319x: Add description for the
>     shutdown-gpios property
>   leds: is31fl319x: Fix shutdown GPIO initial state and remove redundant
>     startup pulse
>   arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO
>     polarity
>   ARM: dts: qcom: msm8974-oneplus-bacon: Fix sn3193 shutdown GPIO
>     polarity
>   arm64: dts: marvell: armada-7040-mochabin: Fix is31fl3199 shutdown
>     GPIO polarity

There is no easy way to merge the series. LEDs and DT patches go to
different trees (well, three different trees). So when any of them is
merged, the branch after the patch will be broken until all the patches
hit the same branch.

> 
>  .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
>  arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts | 2 +-
>  arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts     | 2 +-
>  arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts     | 2 +-
>  drivers/leds/leds-is31fl319x.c                           | 8 +-------
>  5 files changed, 11 insertions(+), 12 deletions(-)
> 
> -- 
> 2.54.0
> 

-- 
With best wishes
Dmitry

