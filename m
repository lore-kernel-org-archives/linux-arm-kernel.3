Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDD3CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9F4kF/0PG0gqpOGPryNaB+t1E6t5FiaNAX6DsaIWBY=; b=v/GwnfwTOaZeRQezjG1cRKo7Mq
	xvENrS8HTknR+wvNewCygPO8r6AgjjM5D5Tme+/lNzkPgsAAFZC56aeiLhizQmRS7C26U3JngCL82
	0aw8QEA2CWQe/a8vhGhczSRPdVnWt1GUd62vh6oP2bq+lQ73LNCEk9vFQTbF+tXJUeDVV97GpWUVF
	AdnuFCBcwtvRyBaZYEq1vh5uZ26tlwR6RmChkofr6Mnt0Gi62R7EXoob0LpBTWrxBR3ERvqVZFh1Z
	8UJq8K4MICOGn22WKlgxkK5OtqYYj5EJEtfFtsdkQL11Ncv0DbruJN/zYh8wW0vrOML/n0qfg3X/C
	iqdNRaBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphxI-00000004EWJ-0oMs;
	Sat, 23 Aug 2025 06:42:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWFW-00000003IY3-3BiC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 18:12:27 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57MHVCKs032035
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 18:12:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/9F4kF/0PG0gqpOGPryNaB+t1E6t5FiaNAX6DsaIWBY=; b=jIkIhtgdj5s0I7Db
	TnMfmrdMghAf+6PpmRtcXHMhhLOut7gGkaK1ibTUkBVDIeBKf8d6RUWjayhKnX5h
	bCKd2EWhQ0ZEw8TUbR3xmxsuoDuyYDlZHv+3nE5y1fb73/6lQYfqCBYc8/Y+kknX
	oOEgAi7NKytojhlzZLvyKo/vxb1xZ/dTu8mBROnHUP3szxGUWlO3pLadCOXnWCLP
	Y/H6d2K8O5zwsBE/P2m7osqazaEaulLzY2VpvXE9olmN7OkdcmPfKYdAXDysVH2h
	+P8T4ECoUMgGVKoNdNn3eBJ2WgZECC2OOg9fV57FAVh3yc2yJC9E87jDJIfTIeH0
	lCuJuw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48pw10g4ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 18:12:25 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f562165so73849776d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:12:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755886345; x=1756491145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9F4kF/0PG0gqpOGPryNaB+t1E6t5FiaNAX6DsaIWBY=;
        b=TEW907fDUpJAGQVzuWT9xIDuM7atQUrF8+Q2jExtY2jGFv4xKbxAGDXiT4SqNLg0AF
         Q5bNe6dFl8Ss9pjHwe84T9JA6ZQ9hOnGntd3VEqggppvICB08kclvhGXQD67O/pm5do7
         5jn2EX6TmdYGHiRCCRZ4R7FcW/az2WPGmxlgQ6zu1RE06fUPIoeowc8C/Oo4kyO6JX9I
         Ic6uG06nc3PtHHt4Kt81gXamXUJ3crsSc+y8AeK19VU63ekVmCV+Gnq8xk2tqWixIdNK
         BfNU7bQWVmSSXimvX+QdCX9ywpJIGeZUiVqih5+T/jmpNOndKsm1Maap6Oj+5kiJJvpZ
         /rxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWN22WkMHEIMbCFzvthi+HGXpFHkXdwawN9Skcg0DV6ebW0tafHiKWxVjlpduO14F2md5QSi3FXiVD8ANF89Pom@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk6MofCPwz6cLLzXVFGMjwq1o6V5mWZlqSvZx66d5Orp652aOI
	SSLXQqtPCFVplBydAwvYbZLL0DY9j58iHc+wuF6j23cPkQWcNa2Ow2ZEBrWLXWidvXYmIf4jHt2
	A6EFbWn1wkcuJTkMFSdR67zktnDRjTbod2wkXil6F0ud84+awVmkkapfNRMUZhrtb0XYRE7LGLq
	WdYQ==
X-Gm-Gg: ASbGncstE6LdaPC2GVyToNfEf2rAZCn60FmwSbBOIx4vKDkmaIsq1NHPqlfzG2Ph9VO
	/tuyYCY3IP86C01c5m2We7HjlaiwCOy5Ax49DklhH6mJ4dL8p2/YmtsqmqxvYGXV8ol6ZzpnCGj
	vb4/YgfxbJykP0vLe1i3dHnNZbsBUcmLAd2h1CDKt3/CkSNRiZ9vCzaG0fbQ50BWsBRp38Ar0sS
	cALgBmvbhXU6cGfj80R0k7qZRLb7SI9JKh0QgMWL1XywbCOw/aU0qmOHpFtcjp9NjNqbjlY9Q8z
	aqvMeUsWwgjpUClGE63kzezcAzcLdRkaZw7v5MXuejl17sQY1Laz4mZY5NDVCRkv77X0A9Yp48X
	ll3QypQIWCpJXv3ZXa14obZMEqOu+jg2QxzVplq70EPjTR4ShevcZ
X-Received: by 2002:a05:6214:2244:b0:70d:a4bf:66ae with SMTP id 6a1803df08f44-70da4bf69c5mr19417736d6.12.1755886344793;
        Fri, 22 Aug 2025 11:12:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZ9vrMkeP87y8XS1HYbM10ipCEtP2NQ/1/i89/UBtmnM3Uakd6ZPlSGQcOg+/ENSPZGgsjeA==
X-Received: by 2002:a05:6214:2244:b0:70d:a4bf:66ae with SMTP id 6a1803df08f44-70da4bf69c5mr19413446d6.12.1755886339585;
        Fri, 22 Aug 2025 11:12:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c01e5asm89897e87.26.2025.08.22.11.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 11:12:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com, stephen@radxa.com,
        cristian.ciocaltea@collabora.com, neil.armstrong@linaro.org,
        Laurent.pinchart@ideasonboard.com, yubing.zhang@rock-chips.com,
        krzk+dt@kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        robh@kernel.org, sebastian.reichel@collabora.com,
        Andy Yan <andy.yan@rock-chips.com>
Subject: Re: (subset) [PATCH v7 00/10] Add support for RK3588 DisplayPort Controller
Date: Fri, 22 Aug 2025 21:12:16 +0300
Message-ID: <175588622226.771426.4504932000654632813.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250822063959.692098-1-andyshrk@163.com>
References: <20250822063959.692098-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NMTV-lf5-KBpQq0H8j-XugFMHbzHRUer
X-Proofpoint-GUID: NMTV-lf5-KBpQq0H8j-XugFMHbzHRUer
X-Authority-Analysis: v=2.4 cv=VuwjA/2n c=1 sm=1 tr=0 ts=68a8b309 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=s8YR1HE3AAAA:8 a=u1nK3qfxStItYws1ViEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIyMDE2MCBTYWx0ZWRfX8SWNmHj+xTXT
 smC00Ll3uTWpqkutnkMNrsa/bri60BgVllADgC1O86ZLEDUiOZLZo8iVKVdDanzEB/fkK3rtpGA
 eKjctMA0rmzuhQ0VrktyIjOi41axqpTnQbIph4uqpfZt8Mb/VCzuLDCp4/MQaL0PnlapNckYkf8
 6icr6lXtbEjCnJf8AD0q6SRgY19Hpv3hryh7r1gCV+mdvmJZF0nTgdJZDktsgN5QosswNUfU9rx
 qEFbiieW++zZBOZ3QRHXzrc9SeR4bukx4ERVxrph3QxCgqhJ2X1JdELBSzNw8c/BNV/2GfbFeW4
 cSZ7JGUDsd4S3wWGuHmkaTxXYl/BDx2sjRDgfdb06cphXXNW79WnfEl12ClFJNG+CgreeY0zzk/
 A3gF6Wh8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_04,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508220160
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_111226_910978_8085DFB6 
X-CRM114-Status: GOOD (  14.63  )
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

On Fri, 22 Aug 2025 14:39:44 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> 
> There are two DW DPTX based DisplayPort Controller on rk3588 which
> are compliant with the DisplayPort Specification Version 1.4 with
> the following features:
> 
> [...]

Applied to drm-misc-next, thanks! I will wait for a few more days to apply the
rest, maybe it gets some more R-b (especially the MAINTAINERS patch).

[05/10] dt-bindings: display: simple-bridge: Add ra620 compatible
        commit: 480a76c64f4f6a7f8d4aa2ac86cd2178687716b9
[06/10] drm/bridge: simple-bridge: Add support for radxa ra620
        commit: 73b81fcb12df1051bd169e488245f8bf4c37bc93

Best regards,
-- 
With best wishes
Dmitry


