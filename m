Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B17CCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 19:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GXlbr7M+4a1GxvAP+G3ZXjJwcK9AWRREeeh4emtmxmk=; b=B1J49lda+ZyKXZ4FuW4cMuG9ps
	kbEdsEO/Q3cLfuRt7DjKNMGRwklTahoEMUhJzIPgOd4YmO+O+XejcYNkhjf9oD/gv8PlB1u3yDWtp
	cgeksLz56tuoY4NhlSvHNyoMnToqhk5MLjtCSSXEyc3axMGBuOVhn8ZsPttxTyOKBKW17Q4J5nJtO
	BiHySQtxbPNyDiuNhtGupTe70LTpvjbS3sNB2/6HQBCBP2JZd5C+Nxi8HNClFiuquMW0TDPFq6g4V
	KuK8P+8tb3wxgdKUr6rjZ6cZPS2MEsRLakUJdlhK2X9YadXQfb+fmDfuQgCgSYsIcfgK8QQqTsKh9
	9dLUoTTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fcU-0000000624N-2ug3;
	Tue, 30 Sep 2025 19:02:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3fcR-0000000623g-2Ppy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 19:02:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UC1vlS020349
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GXlbr7M+4a1GxvAP+G3ZXjJw
	cK9AWRREeeh4emtmxmk=; b=prJio/p1Pa9iQoymrsQUzUwSwVlmy62rZ0boPOeG
	5Co5oHJaznpcAf7BJjir0I0ubdKav7gNDPOI3BNhzvNVU2u1G1uhd2a06abQovcb
	/saq/MhHYC92LvUIaaB4jaXLPQPJtLSaK0t5ErQB6rSk7JyAd3xDQkowIG2rxbUF
	957QygvR48Eomfe6HOQ5Stw7QNm7S+HdvSFGVn+tlzJkmY1II40Vvdyi9BTLN/oG
	i04nl4mMg1WS4TFSJNoHVcmPcipJi5BoYPhGwlfe+D8b8gnSbpNU1REPcDVYQYl4
	JGYK0P8WVNCLk9noVXZFSBzhqetljnENIu2G8LDgl2w9cQ==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6x5t9xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 19:02:34 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-42a076e4f9eso46551625ab.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 12:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759258953; x=1759863753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GXlbr7M+4a1GxvAP+G3ZXjJwcK9AWRREeeh4emtmxmk=;
        b=EQ7QsbowmGNlCfbkkftxdIwsd6qD1We4pe00wVMTafOVmBPxWm/OYdXKj8aUkPkhOV
         arbPOy+HMkIbj4rLNL51A6maEmxgz84znwPKsvgNeDRJ0tMk7qMPTZePtzohxMqGZMJI
         0e7rdtL1dPHf7ZZEqSFZPpogWCjtkPL1uVW1DyOOu9w91Xi1qnmZXKfEGPjK1EYnNdvz
         4/X5kAT0op+X098Lrtb5uqeVvT8uHzx5gQ0CbztBtGyfWgS3OMUTdlOaxeWcmuLpf5JX
         aeKZ6mivCcn2PDqTUE+krcYJIlFsd7pETdUQUUuzH5JH8YN/odkM4nI89wscnVtRbwGO
         tB+g==
X-Forwarded-Encrypted: i=1; AJvYcCXWC678bK/5enIaDtkhrkvKlaSJ0HZRw+LBQ8c1RfgZMr82POL4Gjv6rCwUB+8uB9nPLSXGa+rKHLo+DzP9ytGP@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ9iYJqdCHKU3+JjsHJAteCOvYjELxIIpOnV/BBRFDfb4nW3+W
	Nr8rJWsDZVeOtujRAKG/lmKe11Jxj066GEqxGDsgOwWGqIUZsPpbrtsJ09z4lGcHBL9gFqiQ5Ox
	S6FDrCK52MoM86SGoESIMN1+pzompOaUZsrvfNLo8O7MVaPhfjWSeuv6/IipbCOUqUXZNIFF31C
	zDyg==
X-Gm-Gg: ASbGncvcEKcbP9/DF8MH9kB4Spe6WMQZB79/f6D0UNHgTUI22rqvQXmsBam5ZLm4OAh
	1UvcdGKvjT++0UX0W5clrb46R90imjf2wmE5LgqGaG/kpN8GGtZfUqa0jLF6ZdrsarySeq77nQj
	lbariFreK65cs3ky50p0UkC5o1NKybo0KdGzV0tnCUF/YJwefNaWytB7HZ145O2ozUGqWkfi5rj
	QlHLvpWuPiFa83VLtqSmzd9Wu2mKwb2YSzHkY40Q41nS5yl9fD1FCuy4sLEJ96dn2/ON7CPl0f+
	llsPEx1RhtzBw2RPV6R581J/XY0iNlXGbwLz2ZCW48cOo9mRoUDwSEXuDxu8YfMcANfcZdrHAmq
	MSVqxF8ZQnuiSRtaSTLyd6LoQAoaEXXjrvDha6akQOlWLUEStJWNpAREdoA==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18055215ab.27.1759258953236;
        Tue, 30 Sep 2025 12:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJV3txOav9sQu2ukayU7ugj9yuYkFavKZlUgXjEWPN2HKtbR36iIvOChi6ogqZ1DDolHbXtg==
X-Received: by 2002:a05:6e02:230a:b0:3f2:a771:9fb3 with SMTP id e9e14a558f8ab-42d8162461dmr18054575ab.27.1759258952745;
        Tue, 30 Sep 2025 12:02:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-36fb7fe6b29sm35412471fa.63.2025.09.30.12.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 12:02:30 -0700 (PDT)
Date: Tue, 30 Sep 2025 22:02:29 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Romain Gantois <romain.gantois@bootlin.com>, Li Jun <jun.li@nxp.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: usb: switch: split out ports definition
Message-ID: <hio5xdgjb6oxejrnk3hy7ylro75p2ebqa6oczyuwuxk3xsbp5l@aewbvmuk3ldk>
References: <20250930-topic-sm8x50-fix-qmp-usb43dp-usb-switch-v1-1-060568de9538@linaro.org>
 <vwlshz5li23xlthn5delxwxdsdci5nc22iey3xih4qf5uhbory@clskdsy64xpx>
 <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <426679ae-03c4-47d5-895d-7c927b2c3b07@linaro.org>
X-Proofpoint-GUID: vHRa9evebWmAHh0bZ3cBsas5eLn3p4f9
X-Proofpoint-ORIG-GUID: vHRa9evebWmAHh0bZ3cBsas5eLn3p4f9
X-Authority-Analysis: v=2.4 cv=ZtPg6t7G c=1 sm=1 tr=0 ts=68dc294a cx=c_pps
 a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=jIQbB08qyBSz40biqjoA:9 a=CjuIK1q_8ugA:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxOCBTYWx0ZWRfX68cqHGtxI3kl
 jdnhPyVk7yGM0x+GocFSMG0/n419EJUbziri3SUCh77IL8YdiR30omjL6B9UASafqMRRzVFbGou
 DR1HR3J7zbwxZoFK0ca3kK3a5+bQYlrL8gMCj+NinNNATXf96ylLA3lgo1l4llOBdNu8xtcr0/1
 cSohJ8yZGp3t/pEkTAMmnFQ4+J9nmeRq1mG0PtkAINy0yBOO1DM940WeIUjNSkvZplg9PQ7wPOx
 5koFqo4MrlVDH8tq+RDAAi3uig7pz9MGoZd6/nL0iTD9AkCsuVVyVvQ5jjG7TQoEvSyR7OVSS3m
 346Ydn4WIs6fm2Qc82iIahBY9uB2YWaV5dUOR1lip/R/sjRQ1hFF/fEMEpNCh1vsig+yprs15PI
 KmY/XmUa+bslr9U5v3KChrbs9OXrxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_04,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_120235_730736_C4505714 
X-CRM114-Status: GOOD (  19.83  )
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

On Tue, Sep 30, 2025 at 08:48:13PM +0200, Neil Armstrong wrote:
> On 9/30/25 20:43, Dmitry Baryshkov wrote:
> > On Tue, Sep 30, 2025 at 07:17:21PM +0200, Neil Armstrong wrote:
> > > The ports definition currently defined in the usb-switch.yaml
> > > fits standards devices which are either recipient of altmode
> > > muxing and orientation switching events or an element of the
> > > USB Super Speed data lanes.
> > > 
> > > This doesn't necessarely fit combo PHYs like the Qualcomm
> > > USB3/DP Combo which has a different ports representation.
> > > 
> > > Move the ports definition to a separate usb-switch-ports.yaml
> > > and reference it next to the usb-switch.yaml, except for
> > > the Qualcomm USB3/DP Combo PHY bindings.
> > 
> > Isn't it easier to make QMP PHY use $ref for port nodes instead of allOf
> > and keep ports definitions inside the usb-switch schema?
> 
> Rob asked to not do that... see https://lore.kernel.org/all/20250905175533.GA1000951-robh@kernel.org/

I'll respond there.


-- 
With best wishes
Dmitry

