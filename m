Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49966C624D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 11:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=; b=rxxntZ6O4gzVbGQEWX15pt+Y5B
	TA8bcPdNUgXceFBCYHoyoSEKRYifTySKQg372ono3JqwQ1Jx7FCczXrUzDuUOlk7Sj+fgmnBgwmWi
	iOu/j/raho2xQygLW0nqgJeSw1+R8uIbhu1egiBdBWy+BbKmoWNuT3XthZbfLWJ814/WnYCWiudSF
	jPOYp2LjwBErHDj27kYwK/7ZRLSE3/6SyO0xelEgn+g/nRXHVSNyMlUZ7LvMni2VnFKlXIBSGe+7z
	TVxmBxabYJ0aWYVB+6I/+6yyOsx1HY4z6+oKdWCTx0LGYzQqw80fQItQE8AFUa+iTuzKOFUYJaA5C
	6jjU0U6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Mg-0000000HAhQ-0zWK;
	Thu, 03 Sep 2026 11:12:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x25Md-0000000HAgq-3puT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 11:12:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHE6Z327174
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 11:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=; b=LJXVP97HayG1Dv7C
	jQEPU0vh6xtXnb6/P1FBhjS0Fqw74DGzxDyaQ66EdZCaN9TeqcDlPaQyFyXQgqvB
	4qOi8wsjiDTEN6bemi4S8mCZ3k11WwOb+8Zq4Spg/ug9C8Gp9KZ9iK6jea2/1Cg8
	MVAx/KxFPSwWHTrnYldy7VnQq99mww3l7v4awnNm1tH3uOChwS526ZStTjg+/2dt
	k7e9DsRB8Y+3a6djKdubpGFBwbHCIwTziV6Qo3xVbBdvSwd2zzg2GyWq0b949yQf
	P7UnC038QumCkqvlm0SgELGkX/4iL5fA4THrrtQIibSNR5Vp5/mVVW49bwcUsX5U
	7yYZFQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgx4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 11:12:14 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso3331411a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 04:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788433934; x=1789038734; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=UR9atlF89UgzghycO1y7mtUHlkog9JWD86p319oqW2bvqUtH7I4mTrUF9xirUOzyN+
         Ut8oPErYqPMYpgJmpe2IE65rtAgCS+5s1FEvtdL82N+csFq0vjEamrQCbgCBO9Kft439
         4WcbyjtD3Npq+WEr5z7ynSMPS8jLrW0We0nvwGQ6lLXD67godPF/Zve8JL1uOK6g6Mxs
         3HBh4gg68fkAQgnjdhh05f9oQluPrIyhhV+Nd2vBPXFB66Smwf/IrQX+WnqO54tke3Kr
         mMiFSDo3cMNZhSg07VnRZ0SItQLN643nM35hTObXhxAVe/LiVWML4tIuzVEccPy2bIo7
         I2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788433934; x=1789038734;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lXuegiGWgMC7LS4JW5DZVIPYdBVcElPGergWXc3e79I=;
        b=FFhZErlvJ8E9SfMgLN20UITT7FKbsDB9D0EzacSlkYxAbdWUoiQQ8wTtGtuaozKSL1
         ipD/TG2EMLQ2OZAkxf1H2FeJxN6O851Sry9RKdoBiLtQkjIcvT4VA+h3GnGaKnRH13PU
         zFE81mTO8CsU4HDgdF0kZfafJQFYYqtxMpbOoNNS7hHntVnSeLBVszEAFXlkIuSjfvQY
         c/hLzJgflmwptHFymYzH5sQbdjCYw8CcdmwKIfYGa/qlPw6V/8u1jfNBpmFpmvRfPaUv
         qz2o1LX9VlHYC34NTHGq92mfWu7aUdiReDrFdGEq7PzXVNcVcrbKExWk0LD1oYL1IuJP
         ojOA==
X-Forwarded-Encrypted: i=1; AKwUvByMgl2BpZj5HdHSE0RYjr4bv6Qr7F718slYAM3WJ+Ri6ZNF1hqBJ4y1cQCZ+GT9OjKg9dwGKy3KsOzOa+phqeZS@lists.infradead.org
X-Gm-Message-State: AFuF++l6c6W0bwn6t4BfYExWv7VnVpQKWYMLC5yCE+CZ6RlOkZ88OG5/
	kBwnIbSadIpL2bndZCTFZlMean/J/mfT/u/mUoLU9K8yz/O2ZLZf6ja/lKZMDuonhjvh9k/aTzH
	3Mbgz8hltCXaM5v8LAfTps48BA7xgUy2eseVqTG0S/pTGtLic6NFq5wroH7WinYrXkochqUEP/D
	vftA==
X-Gm-Gg: AYBFou1hEOrpnJff69rv+w9XgmMvP4ta5Z+4J5qvbxE2/z39WLK2wMnI9n3QoP3lbDa
	8WWbGrRPKe5Cii53PDttVLsyaDmd3SkgSit28UrTyg0hKd8RyOH/cURsCxIlyzXJRbAdJ6Ymvxq
	PimwN02yD07MjvcSV6a1237RcZobIR1tVXNQx/qCyzoGjoEJK1+Qd8pWey22Qevxb5INoTbY+ns
	pzN6z8iWHu0aRlvOf77SvwN0swc02uqTfPJSdngP84/xC2S0cktPLA+RzJyBxbCfkMZvV/Hg/SW
	6zY53OHQZxIt/VSkXSd8oOMIPivr6pTBKeBoxX8XKjmXRyGMGyythXBxXc6OQHHrh+QiEQnfm6t
	c19nfPfMrQnluHe9u8etf821yyB5XJFJCmw05ekhBX1Pk/j2BZkkwIN36dkww4hTeXadJCXAd7T
	k=
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020404a91.18.1788433933513;
        Thu, 03 Sep 2026 04:12:13 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr19020280a91.18.1788433932942;
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Received: from [10.133.33.193] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacbb0sm4905284a91.13.2026.09.03.04.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 04:12:12 -0700 (PDT)
Message-ID: <60b12a54-e930-44d6-854c-0d76eabc50af@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 19:12:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] pmdomain/cpuidle-psci: Fix behaviours for CPU PM
 domains
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>, linux-pm@vger.kernel.org
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
References: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
In-Reply-To: <20260901111441.122436-1-ulf.hansson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pm1teMSx87CmA_Hcp1qmYp-2idmUwavI
X-Proofpoint-GUID: Pm1teMSx87CmA_Hcp1qmYp-2idmUwavI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfXwkAymWCttsVL
 C8YALH9cMMYQ9jskeVl6zjU5kH45S4cn9MnbkqZAnUFEkPCX65hpqJDA5VZV7RgIaZbM5PjMnMX
 LOLveG2+YJwsNel7oiD77Ns/mAHVAF9UveDdhOc4Mr3OVRoi6jsNFSwHLOCXbhHmPrzt8KkX5uo
 UWRrG9npP0b+OBcz4IrIj7TaBzTPDoKIawb/pkO/j9l7YtlvyIbHNoMq3YwqlnHlQ3jZZHU8lBr
 G7odt7OI3Pqf27NFobeDI0Z/3foSSnFACuD8lNxGTZcxccVw1HiN2f5IioeXwMq+rgtbcicb064
 OKI33ueJYDY0Ju7/VFdGLZ8nellsNUnlxVVfKpThIo4saOxtjmwVMm5ojFq5D8JF7NVnD0pymFW
 y9W18So6G1ufJzOdBCAwLCBReC1bVPuKJeZaahKT5iM1uFn+m9vNr/jhVnRQ8FRnUHBXk9FJuFB
 xOGA8Zmb0f8wweURGPw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5NyBTYWx0ZWRfX5F4LH+87j9Ci
 MePenYf3HMEHg6ELxcMRzmzwfeY3lAeGEYcgTLrsrOuFz3WTgZXGytE/3VeLNdWNXQmufBnwHcl
 x8vzroebsdnEa74Yq9YXfMa8pv+PaZ8=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a99560e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QURvCu9eW4BULfhiHY0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_041216_071096_77BE6CF3 
X-CRM114-Status: GOOD (  18.26  )
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

Tested-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>

On 9/1/2026 7:14 PM, Ulf Hansson wrote:
> From: Ulf Hansson <ulfh@kernel.org>
> 
> This series fixes a couple of different, but highly related problems, when
> dealing with CPU PM domains. More details are available in the commit messages
> for each patch.
> 
> Note that, this series is a follow up to fix problems that have been pointed
> out in a series [1] from Yuanfang Zhang (Qcom), to add support for new
> components for the arm coresight subsystem.
> 
> Changes in v2:
> 	- Dropped the RFC.
> 	- See updates in the changelog for each patch.
> 
> Kind regards
> Uffe
> 
> [1]
> [PATCH v2 00/12] coresight: Add CPU cluster funnel/replicator/tmc support
> https://lore.kernel.org/all/20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com/#r
> 
> 
> Ulf Hansson (5):
>   pmdomain: core: Rename genpd_status_on()
>   pmdomain: core: Allow a non-CPU device in a CPU PM domain to do power
>     on
>   pmdomain: core: Add a genpd config to support unknown initial status
>   cpuidle: psci: Initialize the PM domains in powered off state for OSI
>   cpuidle: psci: Move initialization a bit earlier in the boot sequence
> 
>  drivers/cpuidle/cpuidle-psci-domain.c |   5 +-
>  drivers/cpuidle/cpuidle-psci.c        |   2 +-
>  drivers/pmdomain/core.c               | 111 +++++++++++++++++++++-----
>  include/linux/pm_domain.h             |   9 +++
>  4 files changed, 106 insertions(+), 21 deletions(-)
> 


