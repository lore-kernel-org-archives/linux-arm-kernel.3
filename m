Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AB1C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SS3LsZZUDvLKSs9n5Nw1CMWXGcUNaHHXYFnDw2nJXgU=; b=e3Qz/omoj5BztRG8czcwIuiTe1
	haCTN4kbtMWA+zrR9blQWoEHOi3nti4XH38fHSsWYuvFHsqsZCRfmk2hIay1RviXilIkiIrpXSi9H
	lY+rmff67xAlqdu6PA5NGRu2/pIo+Nv+GcO35P3jzaeM3amJ2g3zTA3QuZ8CM77OUMbpROhOBcop2
	Rhx578M1w9TMAOh1R7sg9RgRchNQrmO3TCh0JWZFkzMQJ4cvApTdIqww5lnVkKjswB0ik469U6QwL
	029AkLplFEkfab5b0IQhkWVDwRe/oDktRayMT/TVcoxoMz8rj2uPvoOLbOvCcSBVonSg8rs9XzGXB
	lRBRyzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufS9f-0000000Atif-3XYm;
	Fri, 25 Jul 2025 23:48:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufS7D-0000000AtPG-3MoD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 23:46:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56PJFrfh017776
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 23:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SS3LsZZUDvLKSs9n5Nw1CMWX
	GcUNaHHXYFnDw2nJXgU=; b=XESajgufqWZpi46/y4tVeJ3PW+PDX5TOLNJDgvIl
	VEwkVpva2gu2Osh/Pi8o9xX/9JEXPc/5s8IwR9ZdLUtTAejkC/GoteVaZrm/2LBR
	l7ho4qz6drtYCf8i1nazKxjZmQaRPG7NpZMB4N5pf0ZP/cYA+Q/+03XlMnKgdgka
	lldkmaeb/8ArWEx+IFAiFWYljr7c0M9S1Djhqxy28Wtvh5ktSW08q7Q7PUW3pgNN
	mUvO+wi/hnhofRR8hTjdFCQQXxxgQnZGj27YWq4v6yTHug4maU2NpPWxIsVJZwCm
	MChIqBdFjPx+OOVGxDFiXlmqSFVmhmXNMwxQGxKaBBXHeQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2wksn0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 23:46:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e34399a08fso656662385a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 16:46:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753487173; x=1754091973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SS3LsZZUDvLKSs9n5Nw1CMWXGcUNaHHXYFnDw2nJXgU=;
        b=dQ30mDgyJi765NFTCtMb7Ttyw4DuZ3Q1O/rTElM4PMM7bxIHK3FiGcijF208XUVWa0
         DAubzAk8BTLbPxLScAAnLs3p4BnazLQgrd4Q+MmFsd2PsKi611NkhjLNAWztfJdU7RkS
         Q0q2t55ihB2Wd7vzTsO4y5WVS6y7SZHUJNOmINoQ2Tp5Uwwb4ELuS2JoROfVZrMv16g4
         iBN39yniubQkkXnkU5ml8X5H5fGPI8Q/xJAhwVNHd/2/lvAk4y4rdmp4LI1baOr9R5yy
         ueBLg6e72keFuRpnsQixo20MS6rnlrFNDk/idLZR0J2mnCEn2XI1uvZef0+pbWOha0nS
         r/mg==
X-Forwarded-Encrypted: i=1; AJvYcCVzqsJhfT79YBOa8/C91zbLo+w5ULjQP86ED5WReNdEzqXDbaPPawBRCEz3ES5A+IOdxZNhnmQK9zc7rC3XelLn@lists.infradead.org
X-Gm-Message-State: AOJu0YxXb+EfrlVdpcXU7131fDTvN3NnVVtSpopopjkOVoZtxG3EtMQJ
	HB+/olTediQVd/pfHo7niKcqZD9eLymbsyPQvMy3iz5RZ6yoZqAxy2aPQudFNYkwYjxNyzScA/g
	rUXoetUJvlPjGX+z+QcqvVRhszv1aof9Us96sFymio3iv6+S7Fpeg3v+n/+13AC+6i0BAcx7+4P
	zpBg==
X-Gm-Gg: ASbGncvxRCBB2gFj74T/ivA+djmnfP3vDFv0mnNOkFspxDPpsNtFpQmxHRBcTMoia0q
	UwTJzN7SQmks2dzZSFGZVWFH013jteDtN86L9KVi0jZDya/C5GRUfxdFMhVgzeT3KFKi5UXiCNz
	qTjqkOXTusV7oMCMSaA2t1fpQwnlzk283bd4rbV3xUQ23vR+jPsXVw/H/CbTk/VsLYr0g3Aa2ac
	WMjiz6FyGJCj8i+bjvtG3uKbIldGyIHiUXqOPHzogQcWOpld8wRSBqUL8NcXMsPsYW0YdQM86IN
	xBJHMHu3nUKs5Yf+2NjhBEIi3kxMV5JgjtBJsgR4WSYPNgr1cZQ53YM9zl3zU4r6s+1+5pPjsFk
	Pd0hVO+jf2kkA49OvWELCZy56mv/rCCrPMzz3e9H+yno6PgbMDlwG
X-Received: by 2002:a05:6214:2aa4:b0:6fb:4e82:6e8 with SMTP id 6a1803df08f44-707206fc4acmr49971486d6.14.1753487173396;
        Fri, 25 Jul 2025 16:46:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0Rfyw4lsowFfqFRh0Tw+94/AYPklbtjVdrBLBTfDDOYsM1V7AqVF33x8eAQDradrWbESlSg==
X-Received: by 2002:a05:6214:2aa4:b0:6fb:4e82:6e8 with SMTP id 6a1803df08f44-707206fc4acmr49971186d6.14.1753487172978;
        Fri, 25 Jul 2025 16:46:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63363568sm180197e87.94.2025.07.25.16.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 16:46:12 -0700 (PDT)
Date: Sat, 26 Jul 2025 02:46:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, mripard@kernel.org, naoki@radxa.com,
        stephen@radxa.com, cristian.ciocaltea@collabora.com,
        neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
        yubing.zhang@rock-chips.com, krzk+dt@kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, robh@kernel.org,
        sebastian.reichel@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v5 09/10] arm64: dts: rockchip: Enable DisplayPort for
 rk3588s Cool Pi 4B
Message-ID: <gmc6cx62knfffgiburzzjgkxifzjk4c5nh6gwjdtk3uopvq6y3@azpfwhmrsy2x>
References: <20250716100440.816351-1-andyshrk@163.com>
 <20250716100440.816351-10-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716100440.816351-10-andyshrk@163.com>
X-Proofpoint-GUID: nQVISuNAKDYWgXO2cFt3QBWo06enCJVQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDIwNCBTYWx0ZWRfXyEF3aLVhFLcK
 tUaeekm8miBPTkHUaTuLTIXcoF/THdX/2O3Pqg/VgIbHF+vmIr3Ty7dG1H0bKneu7a/ZAA/Srxv
 6PASYMkZlDfse/sNJizVtIjaKRDFwTw0kVljG8upxy4hfX+l08W1GTcs9j0jYna1Vj45YmmRbTv
 qR9zPefTEiXBqd50QNmqVsZ7Ynwl9nbLA8ltxRb/g9GZ4jjNX++bmTS10zl1eHbXyDViNtgiP8w
 xM0mVXaROMzzQF7v31fJpNOB5it1CBA+SvpMxnLkyh81KvRivel+mVfNfMDoTOkSasRiE8f9cc9
 DMd7p8RKfND6e8X5Dt6BD+uFrkjofjpTeB9/HDcmbBCJ+17Wh+l2FZ3lJC16l1aFiyrIxcosZW/
 20lIJw5fsRYDXIsPMEzPacCtYqnDUU/UbF0Wnt2E55fTCWsjma2lhdOmjvGcJAZQFYaWGuGm
X-Authority-Analysis: v=2.4 cv=d8b1yQjE c=1 sm=1 tr=0 ts=68841746 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=s8YR1HE3AAAA:8 a=EUspDBNiAAAA:8 a=tTaqpbVWKKepMg41KaYA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: nQVISuNAKDYWgXO2cFt3QBWo06enCJVQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_06,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=857 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250204
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_164615_851720_B915ABD6 
X-CRM114-Status: GOOD (  17.85  )
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

On Wed, Jul 16, 2025 at 06:04:36PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Enable the Mini DisplayPort on this board.
> Note that ROCKCHIP_VOP2_EP_DP0 is defined as 10 in dt-binding header,
> but it will trigger a dtc warning like "graph node unit address error,
> expected "a"" if we use it directly after endpoint, so we use "a"
> instead here.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - Sort in alphabetical order
> 
>  .../boot/dts/rockchip/rk3588s-coolpi-4b.dts   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

