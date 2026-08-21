Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34AFC5DF8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 11:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=; b=yKHPkJWAMUQJD/LFErGhxDsuBm
	4RwKceXpqen/hpmVDe3NOqV6plbIs//Cs22RdcTrTWB13gkQx8IM0cw+0JdNbMU9XuBBlXxpRnH1N
	t93T6L/MSwjdU6j6ntm3WvqpkP+xNZ5TUIohP7u+CvwNEcfk3HfJ5WsEl+ZxHNIIui4FT2b6dwxsW
	gbgofVIol6fKncGAXFKGYsvsJm8YScOootE2Si3TsNesw1memw6QGHb78wlMqpD5IXAz7IqnK9SfK
	0ssTTdPEy8ysGL/LLXRF0pEkC/lHlAiv16U+AWBw5yhuZTpQ6ckd35hveh9xm1lL22enCedeTM3UM
	n/eJP1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNlC-0000000DEJA-3YXB;
	Fri, 21 Aug 2026 11:50:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNl7-0000000DECd-3tZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 11:50:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9M9ES1550681
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nJAl5S1NBzbKBpbUUBk1SfID
	XbwF4A95DTodMVYzqaM=; b=j8PHXZ8GBdDkM3IDRboI7LKBPbbzwqxs4KnQlMYT
	1Ad8/AXHODvZku6Go6tyiPvS090dopICCRXKcRVyWKRSulcFk2B8bnlWJa1B+2mS
	ZAiqr/wWUdHPcPYq1B0n1RsGpBBya5BcZJzTyUqp1dvHmpgOu6ZaAapBflWA8gDD
	ijP7c6uioQp580tCaWvWUTzTsG59L/X73X+9lrrBiO0z1SRa0LF1Xi94AMHTLn1T
	8wzw9OC41hLtIPwstukmNKdy7mUSiGKZWrYjAbtIAgTvbo/5ggz1dKLLdVUlgl4X
	oIieT8JcD+PvsX9GubSsFg0luJc7pCld50Spzd0X9c+VwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6d06a106-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 11:50:05 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738d9935e23so215389137.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787313004; x=1787917804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=BzSYPkw611FXtmnVxZfjXpfZV8jVe9r/gx0uelz/O8YjNXB02BylJcQj4lLHPw67Gj
         P5ZMKciWZLx90onMzHb35clo3Gyvwi668X9YaVTPi2mwqk4BeoMyPV99xJKix9fY3agw
         jmTBqbOxptM9PxIPDBcHC7wPPVpHDK0i8Is1P/UpnGqe8i53U1w9UgBvwBAxqaku4Gkj
         qmLIz7z0lIiQcDUXgnwHOXU5BrFS6ivGXmFmUBVh15WK9PYVfqrAoYpcY31rMoMGpgGn
         eijGSlct6ElcWV5X4FnBZAoPN8Ro7yzQ2FnmcnspiDjjjLoLN0Yt3ZmOISbJOpgOHd8p
         9H/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787313004; x=1787917804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nJAl5S1NBzbKBpbUUBk1SfIDXbwF4A95DTodMVYzqaM=;
        b=nbSiwnH/Krn+VD9eVCbzWyrl9gsy2oTzv1dJ9rnR5drGxgzFMk/FeJz9oExwsN18vA
         jRXFLjHd7rT24T/uqB+aWQBzoEDJ7V7agectjMKfWvqrejFt/mb+NbYCxpQ5Nk0i5ex3
         fsZxgQspdDxb+KnPVIYE9no7NNXVH/o5J0OGNwAal7WDUrn1e+mwXP5E3a4BeXQXarad
         19C6+QQEzwJYLG91RsqKDXyWM2q/AO1/I2+u6+YmADZahgs/I2fVXXlME1/5N80GBvzH
         L9o3RJSWtVWTq+glz2jgmUOVXUI2lID3AV9ZlBr3NO0LUFe++dmuBo6lHl+H8Ccyp08E
         6MLQ==
X-Forwarded-Encrypted: i=1; AHgh+Roy8NEuV01z8xXO64bal6GURW0/Vb0z12Nx5SfcvijNb1h4IuKFmlSvC8WSwPf+AaOIgk8vFAvvHY3DeU24S3Zn@lists.infradead.org
X-Gm-Message-State: AFuF++lD+Jr4Kq5+7m1woRemn1xzwwogsJ7o6LPvsHP1f9w9YouhasNb
	C0BiYrk1k/FndygA7rZCMCALvgLvH+Y6JZ+e826KUammk6i9qDbuDP14VphJjjVjo1Ne+C6Jjqq
	5M7y2LUJJyROJF3rFtjc3kwUqgF/2cqXIQuQEBZxyP9yh6ESfdpsry9phvpLyZiIOzYR63y4Q+O
	WkHg==
X-Gm-Gg: AR+sD111hoW0dgcAzYlKHAinap3RRPINVselAwy5NQoF3nEnjz/lZlLFU+5bcz6lafL
	veOCyDBnBBAQ8toytok97tvDuXuvuBSH5Hd0Lu4g//sx2zflIYuTWflEGsge7/SoWm6fkJUCyw8
	WxEBjpNTQgQWm/k3wixWnnBopEiBtbX7h8NI9tKH+drf70V+TBk4I596mCXg/ZfHiFUwka6vTCY
	zW9o82VCb5dhM4gzjQ19zFsJNH3eCp/m2tE+6VVNl/+a66wqSxCfrGGN+F5ugfCVWM06jiNaQtS
	jGIGx6A8YQbQErnvCvp8R0b/NlcpvHON7oKJH9zd8v3OemNfF4nVX0xXWV80+nLaSBf1xRvl205
	A9mjaJXZyJ3krXRw=
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880879137.14.1787313004174;
        Fri, 21 Aug 2026 04:50:04 -0700 (PDT)
X-Received: by 2002:a05:6102:2c15:b0:777:4f1c:15d with SMTP id ada2fe7eead31-77a64d6bd7cmr1880848137.14.1787313003628;
        Fri, 21 Aug 2026 04:50:03 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff158e82sm5959426a12.16.2026.08.21.04.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:50:01 -0700 (PDT)
Date: Fri, 21 Aug 2026 14:49:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Linkai Gong <gonglinkai@kylinos.cn>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
        Brian Masney <bmasney@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
        Jacky Bai <ping.bai@nxp.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: composite-93: return timeout from gate enable
Message-ID: <vfm4yvruim675ev4s6jj2bkyg7zjoifpbdsk5ipvrvpoqvr7yy@c5voyam4vceh>
References: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821085616.1129333-1-gonglinkai@kylinos.cn>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX8s87OsjHWFju
 UqrlJbr8MrS4RVd3w/xb9qodMa3X5ln5GIRFrgitflvBiX4nkX9OFdzqQ0Vs+g5rE/Z8AzsbvTz
 JOrpeZmbwP0MoQCYKSQH/m8e/2mU/N754QIFuIoN5GMHRCe1axc243WxbzZS0BTg3sgv2KJzfRO
 woADOHx/KW5Z9ii0cJevOUOR04FqcnU6c5X6azWF+HKNyBkFYrW3GoPZTVMj4fJ1kcgdtFt9bCY
 ubKgMwW02dujM43n+rMrdIoFDMDIbG+zrty9MmmX+M6wvACqUKW9OOITZlAwlgsYbUyYS2WKSUn
 L55Hjg5AiX45Cw8etDEY13Vec0HkBGlr1Sb/uutU07loZcok9mCuJ8Iy0A3aB7ktZf4xoh1kywm
 AgqTnv7imc0jXKodKkrlOuSE3MV9BLd+zP1svc9+GcN1UOJX7TgiltjA9nODqNZ/76JTjSnM/1H
 CeBxgkfQnwOoS7bo2sQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4OSBTYWx0ZWRfX5Dy+z9XgXo+8
 j0JVRUC12ivyZzuSncICK32gv5kH5xI8b+n/HGVYObFcgcHxB0SaKi9jEShjRvqTmci5f/8Atcp
 LWU1Bjl352duVOaMznV/2Dva9fVqNOM=
X-Authority-Analysis: v=2.4 cv=DdQnbPtW c=1 sm=1 tr=0 ts=6a883b6d cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=NhMZVuV82ezdd5x-88UA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: U3P46S-Zs591KFp9MgmX1jrcDBlcEHkg
X-Proofpoint-GUID: U3P46S-Zs591KFp9MgmX1jrcDBlcEHkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_045006_008500_A8F182BB 
X-CRM114-Status: GOOD (  10.42  )
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

On 26-08-21 16:56:16, Linkai Gong wrote:
> imx93_clk_composite_gate_enable() always returns 0, even when
> imx93_clk_composite_wait_ready() times out.
> 

Ok, so you are describing what it does, not why you are doing it.

Please make the commit message a bit more clear about why this change is
needed.

