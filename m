Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D39C6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 02:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86ZWYyPnzwyBT1SEdx2OYD4YN65eSOUUs/UhqpCdnLU=; b=UYizYfCzfCOSUuAH1PJn4kfs4u
	TLGOp5zpHrAo8X8QurLsYSxH4EVIWa38muv6MJB8bfJ2y6ajAhgTnhwqgCYuNvRx8i3DB8pZZY0uE
	xhNtfXayBCgU3eVWMJqMRnpVJg50GRZnWUfzLWmt1qJUwB+4HRL607TwJb3RdQJsrLk9hoUakXL2+
	pxHEpYN2IX02MdsCIpyPzalUcXShX6FOvl8rSpCXM4OQKV7AzJRXlghHI/OV/QagCZkqjja29zk5+
	kNakSfTwfLs2LWRYyA5rlE52HiYqgIh8PeNaAWYvxlI3PAXWsOKiqmCFolY3b3nF+/8B52NZKOMFR
	U7IWadTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v882m-0000000C62F-0EdZ;
	Mon, 13 Oct 2025 02:12:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v882i-0000000C5ze-0uqE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 02:12:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CMhm4e024646
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 02:12:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86ZWYyPnzwyBT1SEdx2OYD4Y
	N65eSOUUs/UhqpCdnLU=; b=DgBt1V/4SL91g2tYdnkd8pnKY7IuVA+EB+yRk0Vq
	v8PHbqTD0VzuzZyY21lKErYPzBoXYywy+s4e9jCOvA3kPBADojpuhoAXBxGvmtgc
	BT4BG9IFTTf8n2dEjw2F/8FWrtb31sviYrI5Se30CpVvFpocz165YwzJHDEKo1fX
	frSI4/nEPXQqFlP2+MjVLT7S48x0lOc+kmYEdEaEKYzGPP5zSJxvf65fBjKr1EPQ
	38PCMSI5I4C9C61Kd9DqFv0aJrFSHpfv19sw9sqCiu1xKoh27NK5iv8bqgbbvXIi
	YOqcZu0byPqYfQcYHIC/NJIBC6pMoZTkbHOFEA7f67qLwQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfby2ydx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 02:12:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-829080582b4so2155622285a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 19:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760321524; x=1760926324;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86ZWYyPnzwyBT1SEdx2OYD4YN65eSOUUs/UhqpCdnLU=;
        b=mZ95g3JzqSkUaU3+ttVIn6wt29+s+sgDvLIQbN3CE+S2fKhlavt2cnF6pV2+9FQb2d
         lFkQQ2rEDRXIZuD9863jtqzrrCYjL9dL0BVLsWoCpiTYZuTsrBgwZNucJwca5PvBIiOP
         A1nSlYilIOygdTg/qfvrnDR8PMiqQF7AiGKoeYwrIrz/l31b0STd2Y+rwMqF5fEdQj/E
         ch0sFaJUgE5TjYesyJQdrsr0rrc+4tEzPpalJWedO522g4iuycuZ9uPMHNha2D/wAUrR
         JYX74pF1xoCrhntC99GRGdsM6naK68TOR/87IqP29G6QmUYiobY2GUOq/p7SxajaeEip
         a+sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXL1sQNImculNuxbGCD6FZQ23b/6sU97FC05w3vXvT6U16B3pKu4C6nueHjEcaSme7Bk6dGsFydxsUMiDuL9Mre@lists.infradead.org
X-Gm-Message-State: AOJu0YzCGLPS3HO8NIzmPLi0VDwjd7X/e4h7SBPjtD9l4CE7T1b9JGgp
	p3Vd0pRhLetHH7GsErLL1FlAzs/i8Wk+sceU5+8Feu/19gtydzl5biVMBN9kuJ0U2WcXjcgM8TX
	7yIRVW7g/AMK2qmNBDILENWaw9mDabLXSGUk23ZhwaAWdDjIsn65MnPnRPKSUvij9DKQGRI9Byy
	yXVQ==
X-Gm-Gg: ASbGnct45CzuVXgCL55d0qu253JIESPfWjpztuiUEfnPLhZqEJ6OiMW0pX8EIcS/xtp
	COrR8QVe6K2KncSe8sxA91Z3dAy+G1tT7q6313nyxBrcVi6/BxB+ift0XLW8o5YP6/iTRzCwcqj
	jKRhEIw37U8zD3wJAC34Th7KzukUdfgi/iwANqI7T69U101aFV4zOA9BDxQY6CfjAHT1iZv0RfC
	FqAiR/agutua4gRTKeXDQDdL/9NVqSzSifS+dFa7ud2dTBNm65u+FxKfGcu4JJgV3R/+W40qvpo
	LdJkOy5DribTvOH7fIcVf/UkZCfpMLrcAIiWCseb+8l/Gv5vsts1dki3HiQAontF6XVfpKO8HEi
	KOCrA1A9Ly9R7/lh3gPNy8/HvJwbU4xz8wE+MMCI2KBepFvk0cAkM
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id af79cd13be357-88352d9a142mr2371625985a.78.1760321524307;
        Sun, 12 Oct 2025 19:12:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMoQF7op5MF9g/GW/8bpQeNO9MGh0k/WN4mxk7m/kz0sYWr+GEzFx7kK0Z0muN7KMj1v1Eng==
X-Received: by 2002:a05:620a:1aa7:b0:863:42ea:d687 with SMTP id af79cd13be357-88352d9a142mr2371624385a.78.1760321523808;
        Sun, 12 Oct 2025 19:12:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5909a119fdbsm2285439e87.112.2025.10.12.19.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 19:12:01 -0700 (PDT)
Date: Mon, 13 Oct 2025 05:11:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Chaoyi Chen <kernel@airkyi.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dragan Simic <dsimic@manjaro.org>, Johan Jonker <jbx6244@gmail.com>,
        Diederik de Haas <didi.debian@cknow.org>,
        Peter Robinson <pbrobinson@gmail.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 6/8] drm/rockchip: cdn-dp: Add multiple bridges to
 support PHY port selection
Message-ID: <6hilafgpdbsppeeib75b5uamwf22kbu4likcp64ahb4u7zehhw@c3mtlzwx7qcp>
References: <20251011033233.97-1-kernel@airkyi.com>
 <20251011033233.97-7-kernel@airkyi.com>
 <qzcdulyj2enho7l6vyvad7ln46zk2u4z7rnsjv2nv4tbw5j6jf@6oenbixoh3sp>
 <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08eb7560-c13e-462f-8110-d4ce5ccbd687@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX+DKxwsaHqxK7
 o5197dH7I/HrvqHKMzVN0IirP9FeYHewtvkjnusEkzJ0RnJyQj07Fv+AIefjJ4uyTharhGZxFsy
 cbs5ciDQLKtMRnwNJjsJufniSX/Pfin4L0fxAulf37G6vo1PoKkKQLim+szb+xXQWv8SP0Xdcqd
 oSIrnDyIKVoarZciWxp7oLP8PP8y++AfIERfmx8CsjRdArLbp8arvPuDv/7oVPU6YYcLTdBfT2Q
 /r7ZvYzWhJriJBRfGrl3ov3F+DPgxHnY1ovxJrOD5QpjwkZ0P+1YlBn12RGf+XYq2vGd/C4gka3
 /9Wkap0wt9Uwuezf9SIPb/DwoV+b/WRAsTJXJf37i4M/ItPuXzqRsC/dnNlGKdPLFwouvHvKmc6
 nWVdwVUQxkamTJYuOU+THxt6XvvNtg==
X-Proofpoint-GUID: yznP5DUl6bojFRpWJYtSysPgrW6wzeI5
X-Proofpoint-ORIG-GUID: yznP5DUl6bojFRpWJYtSysPgrW6wzeI5
X-Authority-Analysis: v=2.4 cv=A+Bh/qWG c=1 sm=1 tr=0 ts=68ec5ff5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s8YR1HE3AAAA:8 a=46buKmVFnKFTYA1G4KoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_191208_371457_6E17C009 
X-CRM114-Status: GOOD (  41.25  )
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

On Mon, Oct 13, 2025 at 09:26:06AM +0800, Chaoyi Chen wrote:
> On 10/12/2025 2:52 AM, Dmitry Baryshkov wrote:
> 
> > On Sat, Oct 11, 2025 at 11:32:31AM +0800, Chaoyi Chen wrote:
> > > From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > 
> > > The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> > > the CDN-DP can be switched to output to one of the PHYs. If both ports
> > > are plugged into DP, DP will select the first port for output.
> > > 
> > > This patch adds support for multiple bridges, enabling users to flexibly
> > > select the output port. For each PHY port, a separate encoder and bridge
> > > are registered.
> > > 
> > > The change is based on the DRM AUX HPD bridge, rather than the
> > > extcon approach. This requires the DT to correctly describe the
> > > connections between the first bridge in bridge chain and DP
> > > controller. For example, the bridge chain may be like this:
> > > 
> > > PHY aux birdge -> fsa4480 analog audio switch bridge ->
> > > onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
> > > 
> > > In this case, the connection relationships among the PHY aux bridge
> > > and the DP contorller need to be described in DT.
> > > 
> > > In addition, the cdn_dp_parse_hpd_bridge_dt() will parses it and
> > > determines whether to register one or two bridges.
> > > 
> > > Since there is only one DP controller, only one of the PHY ports can
> > > output at a time. The key is how to switch between different PHYs,
> > > which is handled by cdn_dp_switch_port() and cdn_dp_enable().
> > > 
> > > There are two cases:
> > > 
> > > 1. Neither bridge is enabled. In this case, both bridges can
> > > independently read the EDID, and the PHY port may switch before
> > > reading the EDID.
> > > 
> > > 2. One bridge is already enabled. In this case, other bridges are not
> > > allowed to read the EDID. So we will try to return the cached EDID.
> > > 
> > > Since the scenario of two ports plug in at the same time is rare,
> > > I don't have a board which support two TypeC connector to test this.
> > > Therefore, I tested forced switching on a single PHY port, as well as
> > > output using a fake PHY port alongside a real PHY port.
> > > 
> > > Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> > > ---
> > > 
> > > +	/* One endpoint may correspond to one HPD bridge. */
> > > +	for_each_of_graph_port_endpoint(port, dp_ep) {
> > > +		struct device_node *phy_bridge_node __free(device_node) =
> > > +			of_graph_get_remote_port_parent(dp_ep);
> > > +
> > > +		bridge = of_drm_find_bridge(phy_bridge_node);
> > > +		if (!bridge) {
> > > +			ret = -EPROBE_DEFER;
> > > +			goto out;
> > > +		}
> > > +
> > > +		dp->hpd_bridge_valid = true;
> > > +		dp->hpd_bridge_list[count].bridge = bridge;
> > > +		dp->hpd_bridge_list[count].parent = dp;
> > > +		dp->hpd_bridge_list[count].id = count;
> > This looks misnamed. They are not necessarily HPD bridges. There can be
> > a random chain between your controller and the actual output / connector
> > /etc.
> 
> Yes, and more precisely, this should be `pervious_bridge_list` . Will fix in v6.

I think the typical convention is around next_bridge, not previous.


-- 
With best wishes
Dmitry

