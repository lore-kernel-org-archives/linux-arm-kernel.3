Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF7AC5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86t7FtJbfTtH9+F6tc1w5TM+iyE0kvnL/OQSt2AAHuk=; b=1OYWQFeI0euMyIQusY+O/CKbIF
	xBtrlaF2Y5gRgpvb29hOLoq1Pv8okjx61HZt8Uuh5qRt5Y389H/hBjWm4wV+w4JsToXQBOC4vAWWB
	prQAwVmXqwZdAFI9uLx0mLxyGLCO1QuORTu//snQWZK++Lj8FS/gR8uQvzR7//BXvvgO1T6BKy2VZ
	QgH8u3Z18tknUcQPAW5Vuhhi46UtaYGgqJr+Qbq72PCWKTK5xMKQMYKgFq5tRXPI50JtfKYF495Lu
	HHBKz6w0TAUNmaK3Ur2kuhjyyoogxGFHkOFWp1f4whs9a8XVlbFIc4bNf7hc/NdlddtC+VDgnoi43
	1ajocQEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQE-00000002Azj-3x2x;
	Fri, 14 Aug 2026 07:33:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumQB-00000002AwB-1rdv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:33:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QUDN1741488
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=86t7FtJbfTtH9+F6tc1w5TM+
	iyE0kvnL/OQSt2AAHuk=; b=SVj/c4bhl+F+FQdHMT9zcV7LAGio+KeiN5bTcnqQ
	n1mYjBGFDlYKUGmSm40SykSpN5zJeWrxsSJzMwIck2YlQxSycuopE1WEnccO6lPW
	jdUgrd/M0P2OevSMlNJlSyoNEPu0Pk/8BZz4eXhIDriehpb088RwEC9bdcWBthii
	tAf3/de3ucrOLBVQUlBmx6cqojJdl06c5e0i2OK8u6h4W5VwIGsefWqddl4t2yBd
	72uNWsCST1WV03M4s+XAzJp3/U22k/DwgvGIaVy70HcBUkZ9sBaVA2gF1xQzyA93
	Ko4bJtGERXm+/YvsJEDoGsd7fA1dylsD6fyxwlb7ez9mHA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1j2njvn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:42 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1864007a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692821; x=1787297621; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=86t7FtJbfTtH9+F6tc1w5TM+iyE0kvnL/OQSt2AAHuk=;
        b=JriLuxnrpYGl7IjhNaApIqlx6Qn0G32WAS94s8jmmTmWXAeyS/EN1fE228V/uG63rL
         An2RmIQjFekByCpoRhHWOuw+UOGETVI5hsX4nQ+u/mMnPqRZ3ErfyzNdBPC7oHVFMMJL
         ATllG0GAI1fYnV/UiDDqxdtTHk614r2Ac7JxNpVBzqhUaav+ScehDJOnrrRITYFWvsHt
         i62mJtwwBaYxK+1f8P9nSCWJ0aKH/fhhNJhH5MwoOQb2mh1cufl1fqBZe3TdB5eQIaEx
         Q16XJ+gRRHapjV9XooBHHHpougVcNqAX6vogWeVNTpCwu1Mbr+pD3feO1793bYs7wlpa
         OPxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692821; x=1787297621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86t7FtJbfTtH9+F6tc1w5TM+iyE0kvnL/OQSt2AAHuk=;
        b=U7ognmOlJCPdOfEE/7AFx4YtRvspuKF1gjqAavSIWiJek8W8PKb3yUijMStDDAhwOU
         wEFHycIOpWN/AG6qqyDHWeTgvxJwgdVxptXgQFkBC8DXjLBDrLcqSwTK5s09ZQHdS9/I
         fAg2zSCwND8yEygqHulaWm9+Bzp6f+E+k8Ttm5CB5ZKrnodrRyG0ptsQwX8LxrVtqFxk
         ynCU2CcqG/DW7DyLG52L1p1ggCxNW3KnD1rpPvF6pBQ2cRh8HdeltqT27ppQTSsLDkpG
         jBI8nSmhens7cQadD+R6knsbOVabQeKBHxw3gNLzQN1B95ArtkiterQw7A4c5uIDTohs
         LnoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrn/0bu/QIZvOMLquqCbJhsXTLHeNwx+qpyVsZ+7P0k9iaa2sZtUPGwxVQVte4avp0VPq2bzPSc1b8h43RX4rWo@lists.infradead.org
X-Gm-Message-State: AOJu0YzmSi0l1F4Iq3vcSBTbbEUk/l6vQXfO81yke8m361ZKafogb27g
	sDk3h3jDsqbnx82M924I97Qm/L8FBqw2y7pzdNF8bK4s1bFbORtYMhERFY1YT1VLiXYIZxOolYJ
	5/p/axQzGe79y6AW3o8nBoY5vB3qYQLz8d4yaAmjeerrRXXDf+lS7a2KIf2+K1eNEnSnv1Dzswp
	ybjQ==
X-Gm-Gg: AR+sD13eSwk4WESYFT3e7pp5QfHly4Ug1WBUn0DbesOzHrCuY0FyVT4ubkcj+HpbQ+b
	FFTfm/YPJB0VBAmtDHdW3Q4XJincwFTK2cEfTfxw6AjoIl4SAEHS55JO/8+IMafQp/+L+pNkQg3
	IdIw3LCHzMs/E7JYbvE8PldNT45YmVHbFOxG9hw7DBZ7ulS/wWsauEeGqGDzNGzDNAXb5mz+CnL
	PYZT20A0lAejusSdWDQ7dinyycalU6fYFs+EgE55HezUm6gMJ2dS9bWcDgKoPUaOU20ZzdMou35
	W/Vryes19af0Z1WCV0GFeYrNkT8mOwhBGU2ItRq3CVgIlYRtQToUf8xNOgEQiAExYa3bTuZteib
	HYdYoEk4rBw0eLA0UxibtaHl3D1s=
X-Received: by 2002:a17:90b:2c86:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-3933afc1382mr3188373a91.8.1786692821251;
        Fri, 14 Aug 2026 00:33:41 -0700 (PDT)
X-Received: by 2002:a17:90b:2c86:b0:38f:657:6823 with SMTP id 98e67ed59e1d1-3933afc1382mr3188345a91.8.1786692820619;
        Fri, 14 Aug 2026 00:33:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387e49d3sm6408911c88.7.2026.08.14.00.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:40 -0700 (PDT)
Date: Fri, 14 Aug 2026 13:03:34 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Message-ID: <20260814073334.7orbdongswfxgc42@hu-mojha-hyd.qualcomm.com>
References: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-interconnect-qcom-clean-arm64-v3-0-942e8ee7ebda@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ApXeGu9P c=1 sm=1 tr=0 ts=6a7ec4d6 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=K9csx1bNu7bmPCVkKm4A:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: ARYOUR4weSI9DWB1FyEJl44qvQHu_jNV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX9L7H0kn0VbGk
 tMfy41YP0qe/wgxhNWoVjETKWSQ3uULJCc8phovbxqM3adC7kNuYfMQzn2lsN3ETARbjGtlSZgV
 gSWOvigewUC7w41myOBblsSfROYFOxE=
X-Proofpoint-GUID: ARYOUR4weSI9DWB1FyEJl44qvQHu_jNV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX2ULw+/1Jx20Z
 iSnV+CrwcGLS89ZSrmfMDhG+yTgM6xz7euQ1NyAFqtPp0grSr0edguPlV2InvWDohyoDX9hEEfd
 mOnPdTd+CLhrZ/9U9Mx1LaukF8uDbo/XMY8sxSpEBZ2nNes3G2ypTj2A8LMjttBFsVl3N64czkm
 Lslb365RNZAroizoAVP4nY3BfNCnqzXXj7u6A0XYd8kGTLAzoVaUmxSBrrAZwIs6DWxhWTywvF6
 5n9beuCvma3gyK9mHkxJXXD58/i+rKDvtIdBrUgJsYcfOSoMUPadlLCHO8VNF7lHDr0GNzUdgtU
 eibPgcLztSFrBHE7nek7IK8P203tTfzfhSbaFuodivhJW7+xy2x8zcKHIS7Zj7FOqOd72PLxVi0
 y77/1eFFLMdwysdfrXLw3b/KL8NAOZjF1peIxmMbBCQVvZvPNA8cGjg1ct7YiPejuWotC1M8NK9
 slslItjHFVfugV4HqRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003343_537938_AF921158 
X-CRM114-Status: GOOD (  15.29  )
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

On Mon, Jul 20, 2026 at 09:03:26PM +0200, Krzysztof Kozlowski wrote:
> Merging:
> 1. First two patches via interconnect tree.
> 2. Defconfig a release later via qcom soc tree (dependency to avoid
>    surprises).
> 
> Changes in v3:
> - Update also Nord and Hawi
> - Split defconfig to separate patch #3.
> - Add new patch #2 for arm64 dependency for Hawi, Nord, Shikra and Maili.
> - Link to v2: https://patch.msgid.link/20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com
> 
> Changes in v2:
> - Patch #3: Switch to built-in for everything, with explanation in
>   commit msg.
> - Tags
> - Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com
> 
> Similarly to clocks and pinctrl, interconnects should not be a user
> visible choice.


Looks like this got missed in this merge.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

-- 
-Mukesh Ojha

