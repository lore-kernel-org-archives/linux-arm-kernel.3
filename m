Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 155E4C531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ug7bLBpHjX45qP49mU8fjcsQGVMwERqU7kYczg+3I4=; b=HBd9CGoZhQDU6tW3IrLs43Aw/j
	67occtHgkj7uVHvJ8PTQy52IyjciHFnVGwVqbiGXPnorpqjwEUC+rfsEASBFZxRlCnlcMw/9ybC8H
	gJviJNxWmwbmu48MNbNuHhuNVsb4I88fsMJO+uYRkAm/xVWmAd596st67nyQ4YrRa27ej3FOkSLEH
	sTVTOWHq/peZcaMeNH166MV0VhU9NYUjW53rIKEW4gP3IoPgxKpQDb3z9eV3dT6xM5Mdt4oFs/kLA
	/VI/QkOvWBnSN3C9WW2ZFb43JvU8w6il4Nhmha1+b0OzoTdwzGU4GB8XswjX5dfkOVTSWWIPD4xLv
	q/NayFsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqH9-0000000DyMB-1uTb;
	Thu, 23 Jul 2026 10:03:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmqH5-0000000DyKw-3hRE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:03:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DkTE3567632
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Ug7bLBpHjX45qP49mU8fjcs
	QGVMwERqU7kYczg+3I4=; b=bN1SGZWZtHqfxPzfnWJn8XsbpIVSBzFjK/U8LRb1
	IBLC+uduGtW+znDgG6mAZy/iXiUTW7RyKAmbdKOdgPNNPFl7ZGbfjNfftbqmKseF
	zTYOyDchPPxnsV5V2CZWz5N/VfrSa68+NYJ4Prml3/OfM4qfiC5GBjyx+GpuzFx+
	GTtge9eQtUzSG8PWv/2uI2K39lKFK0W3grrP4wo/75vt8NqDkKjlZ2qcYrJec6aH
	oYGm0nr4wLwnO1XbFdzOB6vpJkrzUPqkX+DuVUHPJKIczk3ZqYyIk3/TPXgZju7N
	jd8H/RVkGQsve6P0SxdCYUZ5HTijG2I98T+2ZhJRwbkdoA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg5206em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:03:30 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38edd45cbc4so332615a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 03:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784801009; x=1785405809; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Ug7bLBpHjX45qP49mU8fjcsQGVMwERqU7kYczg+3I4=;
        b=TcTOaqqcrN2ckH+J/7ycLZq1BPW6+A8q1U9vpfV1EPKJvNTvvD1D1fzSb8Fp2rHs3J
         KIelD1gpdU3JQ87yTj0kp0FcTk+nx6pLVjUk1FdofNnbW+TEQY8/HHo24/+D5JzuMp9x
         6rtEMC40pVOmxvQHzlinz1IPOthMiS4jCEuzPlnll+CyOtDCO0ccVFqPhRbVqcD5aKoB
         WZcSbJ25iRbRpoW7QUBZ7OT9BblR3rQdRI5ADQ0nRbMNEgIsdd+Dr6Q0zJN/bYd1PXLs
         haxvUBHSSAfXz8m+prJjlh+7QwPvwK2V04wBENX29Qsp7Nu34TzxqWusLWkCC4OQryOz
         2Aew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784801009; x=1785405809;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Ug7bLBpHjX45qP49mU8fjcsQGVMwERqU7kYczg+3I4=;
        b=Swjx7K4rvKr38QogElHfci/aN8zfQy2svbe/otvO4DFfiK/OPoE0OGQpODRspQEqLc
         61dzLyGaZIguylC9OqvY7cOIVuHgnbCtTRts2ub0QQVqK5AlEFTAsGCXsykK6TQQpDOS
         7z6YTxj90NBHoHoaBYUc1oWBZfrjX/TBar4trHM9kyqHthhHdCbfhv6UBqItgD7KChxm
         dKxvpO5FC99B3v9EYwFPqsykddaFtHxj6jneXnVJd41dk/krjxYylbZUCmz9nMFPeLL9
         jjEbfOYGYdmqqMkyO3DXuU6R0kSHXY+2p1u4Nlianz9UZZYaoVbTdxRff2NQBdvrLwNX
         A12Q==
X-Forwarded-Encrypted: i=1; AHgh+RqcJXNf8tAwyg2OosS7ajLXrz30VpF67e45HPcVVjsXUk/Dhy/jLauuUIY2A+NgshQ+UpJYpY9vOo2fbJrUsqck@lists.infradead.org
X-Gm-Message-State: AOJu0YwVG8CnS+S7gysN4rmjGVsnjZeiWGlmv5A5j7DvE4f5ytli4/BF
	NTlvtzRl130yvWSwkW7RS1F6H1Svj17s94kxUogUwLuL3Ef1kNPrySiXf7Zh1WkLUW7HVFM1cgz
	rAYxOykqM9YSkwdnXH11bqnm36fDYITvvapzXxWPzJ7mZGzRZqZ9N6T9LTLVOqvHDKxfFXqjMbd
	Pj4Q==
X-Gm-Gg: AR+sD12dM4C7CL3zGfkDKrzFT7u4yYVAbHYTaYM70QlUPRTxbukrOqGqmYpeKgx7xqN
	eubrJ4B63Rmcwki4lLkGco4ey9HXeWnH0cF3Wv0R0JmPGQcrL7uBlDUGo+mgKVeFSrOl1pLQO0W
	AfDP5AUbEr8vklwvxxnCwps+pTr1+HpqYG/hVHQq7vLXh5zCgy3suZTGBw6P9l00q8f7m6T0hdt
	YmyRGGSrYD3N9bIN7y7B4xneSqU1gL1WQva/TGv2MyictmHCH2P92AVoyd9c2Wb4ZQmPp15Eoz9
	ZW+ymamQXOgTLfUtHGNcK232Pw9v+MB7o2kBzdVev7qXnwUA/4ZdstzwvOHqn0GwRh0qkbSeZ+e
	xh5te+oB4Vz4VboJeAR8kRGD3XGRsulLgFg==
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr2477443a91.7.1784801009220;
        Thu, 23 Jul 2026 03:03:29 -0700 (PDT)
X-Received: by 2002:a17:90b:1d52:b0:38e:75f3:ad4d with SMTP id 98e67ed59e1d1-38ec69575acmr2477359a91.7.1784801008638;
        Thu, 23 Jul 2026 03:03:28 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f42bbsm15811644c88.14.2026.07.23.03.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 03:03:28 -0700 (PDT)
Date: Thu, 23 Jul 2026 15:33:15 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
Message-ID: <3430f083-37c8-482d-8110-dd161ebcc269@quicinc.com>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <38115586-9913-4d6e-9447-e82aee811dd1@quicinc.com>
 <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac2633e-db28-494c-9b31-358ed6d0ce14@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a61e6f2 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SS_D-kt5JMbThxPhXzQA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfXzjmg71djqwYq
 iRr5IKNng9ZyGr4pgbfzj6dxi8Rt5civwkP7y0EQ74+xbs0lp6a003a92WBi+iVbokoeIUsi5BI
 BbOhCzHpwcdHLOR3ccWOONSdkxw5M9k=
X-Proofpoint-GUID: BGw1IqxP2OOjyBIl6ri1Txl9ZQmAYTpC
X-Proofpoint-ORIG-GUID: BGw1IqxP2OOjyBIl6ri1Txl9ZQmAYTpC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5OCBTYWx0ZWRfX532xEwcWKk77
 YZj1lMho00JXfGqKuRT9JznAAn6dlSK6tjVE3j4GKiAzqezlnARrkVZRg8+lZYYExKdu+2J1Sg9
 rlCQ0bTwLpIKh2iYGdpnSmy66S76BQRnqU+TSmCWAo7pqZhj0mVSFv6TLOUJXOTjLXhgWxYygoh
 7qbTy/LNgGXTZtnc6HOBGxEM11GTbsMPQQfp2k+QJWEzKToLJki/PCThguQqm0YvBWgP4az49oM
 6H5rh7ONhNNfFXx/MnYIG7wemhWNZnzXwV0krwecRasrp28qgiTW8MnksEOAd1TtqKgJNDj/qHS
 kKj1FpltKuU4sBh848pFimYch4i2mC0Xwqeq1oRZy+Mru/kxWugy0j81xv/F16GO+qKIIqkzOmj
 RjwRxO5c1mv2stneaaznJdAMaZ0L/8jcPazoT9+R9MyezlNgLD/eEucDN60y7xN0qtXKVOOLHA6
 rhmoscYCSLA3cladsog==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_030332_038615_D23E4B93 
X-CRM114-Status: GOOD (  30.86  )
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

On Wed, Jul 22, 2026 at 07:03:22PM +0530, Shivendra Pratap wrote:
> 
> 
> On 22-07-2026 15:20, Pavan Kondeti wrote:
> > On Tue, Jul 14, 2026 at 10:46:30PM +0530, Shivendra Pratap wrote:
> > > ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
> > > cookie as arguments. This cannot be implemented via the reboot-mode
> > > framework, which supports a single 32-bit argument as magic value.
> > > 
> > > Extend the reboot-mode framework to support up to three 32-bit arguments
> > > as magic, per reboot-mode.
> > > 
> > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > ---
> > >   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
> > >   drivers/power/reset/qcom-pon.c           |  8 ++++---
> > >   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
> > >   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
> > >   include/linux/reboot-mode.h              |  4 +++-
> > >   5 files changed, 46 insertions(+), 25 deletions(-)
> > > 
> > > diff --git a/drivers/power/reset/nvmem-reboot-mode.c b/drivers/power/reset/nvmem-reboot-mode.c
> > > index d260715fccf6..ac69b5f39fb4 100644
> > > --- a/drivers/power/reset/nvmem-reboot-mode.c
> > > +++ b/drivers/power/reset/nvmem-reboot-mode.c
> > > @@ -17,14 +17,16 @@ struct nvmem_reboot_mode {
> > >   	struct nvmem_cell *cell;
> > >   };
> > > -static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot,
> > > -				    unsigned int magic)
> > > +static int nvmem_reboot_mode_write(struct reboot_mode_driver *reboot, u32 *magic, int count)
> > >   {
> > >   	struct nvmem_reboot_mode *nvmem_rbm;
> > >   	size_t buf_len;
> > >   	void *buf;
> > >   	int ret;
> > > +	if (count != 1)
> > > +		return -EINVAL;
> > > +
> > 
> > The count can be different per mode. Because `struct mode_info` has
> > `count` member. This single `count` check across all modes may not be
> > useful.
> > 
> > Either drivers need to use count passed to them or drivers needs to
> > receive `struct mode_info` in the callabck.
> 
> will add a once more write function in reboot-mode to handle the multi-count
> support. If a driver implements it, the multi-count write function will be
> called. And no change in existing drivers.
> Does that address this concern?
> 
sounds good. it is just that `count` is not fixed for a given driver but
it is fixed per mode which needs to be handled or provison must be be
there to handle it.

Thanks,
Pavan

