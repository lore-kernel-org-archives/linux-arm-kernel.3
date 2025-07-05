Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31A9C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 13:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gQMTAhe570YE3iP8EB5vKYrzv7CsKlrKa8/6xKU6bc=; b=0pHacZN2IkQJd0y3WbbA48S+Zo
	KAGE8JQyZLmwmdiOiKPTuyUj/p/XIPEni8vjtPAbrZXGqLfLX7mYw+W1Ub4uZiCwxNT0zPVfBHnK2
	AoDrFDl8TQaGI5/zw7iNvQNP14lvO6H+SVqhYDRRG3xXm5ZfT6M7m4CyEHIbM7RSCxH9K5h6mzV5U
	D2eMO6mC5RaEVPQ1NfBAy2YizMSYZLFl/7d4u9tgUo6xg0Gk8SQ1JbQ2s8sXgJhcfH/IvUTwjbzed
	bw+j+h5T6zDQGMP+UiM9BekCUnBYpAjjEVHHOlWXG3gxzj0cZF5BSjbmHtuYFJpWa1M83xbo3IxZX
	6KwlRsNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY2uB-0000000GYLr-2a3j;
	Sat, 05 Jul 2025 13:26:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uY2rs-0000000GYDM-2cFu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 13:23:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565Ca668020816
	for <linux-arm-kernel@lists.infradead.org>; Sat, 5 Jul 2025 13:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6gQMTAhe570YE3iP8EB5vKYr
	zv7CsKlrKa8/6xKU6bc=; b=jGwZBNsY7lfBhGGTTJVDaY9eFTydbEkTCwD1Hlhm
	Ix1Gky9BvXFb5OosVwbFQ4uv3nGR9tGfs00cxghq+hDrGLmjMwLuMedkqKKfOdB9
	KYXD6UHMkfHeooPO8AhFsMp4r7VmU/A4UoVYVwy74oJrhv7l0EN57Ky34lftYnnH
	7Xcgqk7KYNSKEpab6ZdZoOJhHHHGnATSoXUOlq4Ut1P+62k8xOfNVuhI96rmSE6W
	qynR5cXcs/jHqRQd4yWqoXy36nyn5f/k6uF58LGvaG4rRT7AdEUUBgqi+jI825QI
	5cki/napIsViskMvYegppWip/CsErU45B8CUvxVFOKuZUQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0y5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 13:23:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d460764849so467968085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 06:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751721826; x=1752326626;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gQMTAhe570YE3iP8EB5vKYrzv7CsKlrKa8/6xKU6bc=;
        b=KN3LmFiMlfVGPjBFzEV1EwmGLs1g+yNruRl7Lp6p9jpXj3VOcvEBgiQ+T+a/SxDGfw
         vCWWIf6QBDPnHf186YFSPeEFYRfmtV8PY+s6/OPx3Vdtp1O9bRufvsJkTEZamqzNWtjg
         ss4d9AwvJ9cSPUp+qqYPNPXyAUHdClXk8PLr0cp7/Q0I3/mO/u8GVzpkyiq9uEvRv7tF
         T47OtqUiLErAvJwBcey1j9w1O16pK849EmUK+mHgg8WevLU9E+qMfInZZ4Xhag5sQ+55
         V9gomCSmTsel3Siw5hto68QkwAX65ujEmHx7/qj1Iv4ioVuSkYKzojt5AMv4esEPV7xw
         SQgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXAJTYotY2cYZTut2KFw4GTs/FW6CeMTOlLM71VwxxGV+g6+YvVcMRmuq/07Ib+4Oqie4YW0cJvMPmizhwST8k@lists.infradead.org
X-Gm-Message-State: AOJu0YxoYg7FAOlvq1gA6/F+GgeYAIH6JI+w2meOEbCxB+58hQGK2u54
	Hqike5icllMAhGXUXQjLt1tPLb4EeEzAGbKyNw6AR5iQZWdV3GBFCtHrg9WYcJUu0q2je/aq6WO
	BEtXJqPquQJBK2IUwifxgOWag2lmL9HP6SEP8Dy3dKyBir1Pqxv3v1w8Qp2CQYB3lrFo+srsBAT
	cUYg==
X-Gm-Gg: ASbGnctUFVpVuvRsN2wY5xMo0NlTIwZaPurZ6WYKczz6ML7XEedZUbF7+zbNI821zjK
	xyKlkRBaDeHEpsDmVQBIYob/Mwh7YncQxClAYXJrFvhIGV0b/05wSe7qdeT/exQzxfQR+hm11Z5
	LhWj2f5l3JJif6B5icuNPuAmQ9mEWPZYmlSMdjWbsVt6yENdQ2R3V5C9T2fyTRaQCXiVL9Toipn
	7CBBfZBAgFb4hGz2dpCMlhaAMnZ5z2ZhfkpGMOkbRbjMFy2gBLQ9UNIUgyqUpyJR6K9yygPXwzE
	/eZIILsxjTY/WfMFcXc+ZMCMIgMd3dkdpE3ReUfdV9OeRR/Q4kCaOyfNIt8xZ+e1DSkWxnDBVIr
	XV1R1fjHOxbLbAq80pFIndl2AKYbTIym7LC4=
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr909522685a.23.1751721826507;
        Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHanLfpu80wvQenehta9woxKfrNX6xaaUmW++9VxpAOncuk4XTvJSIeGS9ggcbqk0Z1zosQRw==
X-Received: by 2002:a05:620a:1727:b0:7c7:c1f8:34eb with SMTP id af79cd13be357-7d5dc6d1daamr909517685a.23.1751721826031;
        Sat, 05 Jul 2025 06:23:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ce344sm585559e87.244.2025.07.05.06.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:23:45 -0700 (PDT)
Date: Sat, 5 Jul 2025 16:23:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, kernel@collabora.com,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Algea Cao <algea.cao@rock-chips.com>,
        Derek Foreman <derek.foreman@collabora.com>
Subject: Re: [PATCH 2/5] drm/bridge: dw-hdmi-qp: Add CEC support
Message-ID: <ahnm4oor4qiac55zyggwe3ndxn346cx2bpzghb5j5wwmfjmdyx@gt6e5fjyq3rs>
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-rk3588-hdmi-cec-v1-2-2bd8de8700cd@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NyBTYWx0ZWRfX8Ue1HIBQYU4w
 nWxTnyUbAK17JiB4zg0r1J/N+5QK25FIioQs4MAexSAdrnA/nmAcGT3TdUABB7QYv+SHJ5LwuNY
 0TI/FkTNDTZ+/DLVoTmcYtIHpoSTw+/srk0yt1xbq3plTffSeC6aXkglJK8pR1zKL0ObK+GRIqu
 ANfgKEYNphibbe7l14IPssvQRTEFJZGxQCog3HOo3zcRSRD8iEgLg9UUE8JS30l7O0XhY+E0axh
 BJNAGA6vmN8CF85nAUb/QDGu8RVXGZ3urMD6a/ikfWyyqIX4uOELwl8RHLO2p/yqIi+XV4KmIvd
 qE8Sl3++aVQtpTGevtGbtPLGVb1V6oWZoh1P/3cSXeAV0Rup0A5tGvVj3xmqUQEwo+6z6pfrgm/
 c5XwCAHgHKSFTWOurJAV7ccQqxM4s3g0y5jfxRDEOiRT3k3fb8aMTyomEHpX6YG6cNbeVQHo
X-Proofpoint-GUID: Tab4bbSvAZapb20kfCJRC1dCWUYV-ktU
X-Proofpoint-ORIG-GUID: Tab4bbSvAZapb20kfCJRC1dCWUYV-ktU
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68692763 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=V37JziMzuUeit7xzw6UA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=jGH_LyMDp9YhSvY-UuyI:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_062348_671590_6F548289 
X-CRM114-Status: GOOD (  14.64  )
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

On Fri, Jul 04, 2025 at 05:23:23PM +0300, Cristian Ciocaltea wrote:
> Add support for the CEC interface of the Synopsys DesignWare HDMI QP TX
> controller.
> 
> This is based on the downstream implementation, but rewritten on top of
> the CEC helpers added recently to the DRM HDMI connector framework.
> 
> Co-developed-by: Algea Cao <algea.cao@rock-chips.com>
> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
> Co-developed-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/Kconfig      |   8 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 220 +++++++++++++++++++++++++++
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h |  14 ++
>  3 files changed, 242 insertions(+)

For the DRM CEC parts only:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

