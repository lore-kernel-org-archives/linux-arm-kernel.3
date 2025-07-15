Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E2FC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uewLyWaWo+XEtP3pU1ovudooX8FXuLSHNKA5wv9Jbhg=; b=unUWYL/cR0jH/WFd+KFsekwFBL
	xlth+dVo36fCttAuEYdemHLt09hxzZqZ9rWQUxe8xIpGsPSt/42VKstVOcXOWoMxbM/RDVZpf54pr
	aBch4mJYLmlTbii4x2NGRxxEYC9JgN1dOwZ4kBk51RfBnZdydEIxI10o8WW1fzg8rxAvqKtLeSCRm
	WIRvJJFk3KG/t9SsesOPwXKoMTFaV8BS9GPykS/DD6cWVwDNLvqyj6+OBkdjSqaPEB4UjTZSZK/kz
	8XYLaBXzx/tt2zSHP2Rk6xr5vSZO9fU6uSXtpV/+uXuGjTfLdkkUbzct2pSvlBoI/R1Xqr1/Z+iNu
	EQMHWdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubf1v-000000056lC-42My;
	Tue, 15 Jul 2025 12:45:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeOJ-000000051U9-0pUa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:04:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56F5vmGL024343
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uewLyWaWo+XEtP3pU1ovudoo
	X8FXuLSHNKA5wv9Jbhg=; b=dGtPvDSXLEiPdl3CHjLxdrhQbN0NwOq3l+YIPu4X
	hVkm5cNDxft1J4ab42X7iJgqqENQGeXEmEU36rxBCi6BDwLZa78Ii6TK61uWkNEL
	H9DGn7x5fOduOzuOz6Z+S7RbZg9o6LQUuDw4Ls0rRfeHx5bQtUWxnbt379YRfbHq
	1sTTyY7oPBz+I0nqX0ojmZx6Hu2sZ0QI4RiOHoUEHheUKrl//Rs/4oBAGA9QeeUf
	OYwVj54GmbV91u36r1i83vQGmmXpHhYf9guevfNPIWlzlr2Y0RBbxKAzx1cu8Wwq
	shVqwzuDNxs4w5lBq68BQGmYGhYB86tQV8LAGtiCgIoNXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpax72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 12:04:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e338e627f1so218401985a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Jul 2025 05:04:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752581049; x=1753185849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uewLyWaWo+XEtP3pU1ovudooX8FXuLSHNKA5wv9Jbhg=;
        b=Uh2d2SdhZ2ocheHxN12GHG9ljsphOyb8i428S7mvdN0Qf95oc7iv9KQoK6QTBQQtzj
         6dB6mOcmKe3Mj7CiORL9VWq9G1+QTA1ZpUTQvuyt0CkXIp1eISzdKFltXXo/f5j4rbiq
         yvAhQ4hnk4dzPfrwy6Io8nkRpeGCYCJ64bm8jky0mHvk9KDrF7ICxs510RuSHCZJQtI7
         ObT93Oa71kB9Y7o25ld1scQgWBem3pp8TaTzoGnvHNYhmN7aECZ4mNLtdp/AGbJKmaP3
         y1dpWYdj8ui9Vc9V4bvB+QNt5zmdVoLEv+SQkBQDQLA51pfPnm3Dh97WkDqDn1DRukGa
         LgSg==
X-Forwarded-Encrypted: i=1; AJvYcCVXafnvK60tku5IhrhCGZzvY0Q5/3FsWF6+zZotsg6IfkwterN0QRSM8ptqxd6H/v0+prJuwIBU3gkBNq30klSV@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7g2ep/XOAL1HVuyM434aem/rln1cS+BtZb/2kDbO1DI3QnuHm
	w4HODaAmPeusMfZPhLHTxNxvp/sMfJahN45ForGPBcE4O1CwOu16e2OodXQk8osch2TGjXFm5wg
	dhP0NB9zkC3mKtJuC5MovKR91731AiQa/6Sby4pEpUwqVqAQJWdsKHUUpD9rWSQSIQJgwbk6Nh2
	qKkQ==
X-Gm-Gg: ASbGnctmYxnpEzaR4hKwW6cIPkuyzk0lizvPX/VuxawGP8ANERcqqoL+XtCtHSfxnzz
	mE47z9+yGu2yYfsFnv5BJpBZzmLApQ9LbGd+ZYcmBnFsYxdbekZCgLezty51kMI/B3DMXZ/H+2e
	LfQDwIdPskLXzFx9Qj2IrDjMvksN6Hx2H+yxpuA2HrV28V8dJhH2CLiccc5UqYjbAVhY0OsWqkc
	xfY5qN4BPRRZGZdxnaINse/ThEUooP3YPbUdyYBuc9NdsUtzJaPC5PqIhbSpswSHwYcksU9Uoqb
	+MyDHSQ0ipS7iZqdyZaf8C3Ixrx9g8pOKFjIGbe3sk8eycY3jNMBEFUniIICqR1q6qLHMZf6Q86
	mkGQrGBCaAr5clZ72vSHqjGBXtHJj3PQbpc4R4avLzUIU1i36mEp9
X-Received: by 2002:a05:620a:440a:b0:7e3:35dd:4829 with SMTP id af79cd13be357-7e335dd4ee6mr517582885a.46.1752581049145;
        Tue, 15 Jul 2025 05:04:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG+QA3kcqdK27HrgZ41em40tegk2sEjV/HwigntzMPoVZCR1JNaYYEpmMQ+MrBS7T3eBGxTw==
X-Received: by 2002:a05:620a:440a:b0:7e3:35dd:4829 with SMTP id af79cd13be357-7e335dd4ee6mr517577685a.46.1752581048678;
        Tue, 15 Jul 2025 05:04:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5593c7bbfcfsm2266306e87.40.2025.07.15.05.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 05:04:07 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:04:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Yubing Zhang <yubing.zhang@rock-chips.com>,
        Frank Wang <frank.wang@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Amit Sunil Dhamne <amitsd@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/5] dt-bindings: connector: Add displayport connector
 for hotplug notify
Message-ID: <r7b4y74lr5qwejkejquosaar75mthjvjfy4pp6bbl4pgte6cq4@n3gwjolsaw2j>
References: <20250715112456.101-1-kernel@airkyi.com>
 <20250715112456.101-2-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715112456.101-2-kernel@airkyi.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDExMCBTYWx0ZWRfX61QDgE5zmDD+
 qTdwyOupjM88OYDsKmRC4iL/UJlPovk20bDfgLhILCOpd+XyYV92I0QVYutvLf32HUKzI3y/RG5
 VE5a+MG1nijqT+gedmhi7PXwSezNM9QJQbJ+40l/eDmMTYAUm1RUVb8UmFUGe4XlEiluhPKuKAA
 7EcKTT5vMrxa0Wsh+PDmi5YXflsQ9Zr4yefDeqxcN7C2UmcFa1tEh4cSa2dVWuzqEo8WwV0phDo
 TsYHDelpZDoBR89VUzcdcc53AsyvL9xmqclj1gu9GCuDqmQK2WgYltnqpV6J0Wo0xukU73MxIs1
 HeeJd90Efrf+LFatlb/RdF4xKke5dBb8rSdBfAmRzGsT5ipnODT8XdMyfto1AX21KGKvymQ/yr9
 5c9GB+sJHLg5HFkI1dRvW77CkI+vDEkPAR8kwtPN0TLFmjaH+ly846Ny/mNC0+z2c8IjqFZf
X-Proofpoint-GUID: y3tXpYZOiCXb-d_s9w9M4mXaG2_IaHhQ
X-Proofpoint-ORIG-GUID: y3tXpYZOiCXb-d_s9w9M4mXaG2_IaHhQ
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687643ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=s8YR1HE3AAAA:8
 a=w3lZJLl83XfeLKIF-PIA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-15_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=983 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507150110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_050411_262031_4BDFD36B 
X-CRM114-Status: GOOD (  17.40  )
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

On Tue, Jul 15, 2025 at 07:24:52PM +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> The USB Type-C DisplayPort alternate mode driver will find
> "displayport" property for DRM hotplug event notify[0].
> 
> [0]: https://lore.kernel.org/all/20210817215201.795062-9-hdegoede@redhat.com/
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  .../devicetree/bindings/connector/usb-connector.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Please see how it was done on other platforms. For example, qualcomm
(both tcpm and pmic-glink) use port / endpoint to link to the DP PHY /
DP controller.

-- 
With best wishes
Dmitry

