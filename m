Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A455FD0061
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=; b=0JXYbpI3vNac+1xfkAEK8ki/yu
	Snyqd5RdLQmCLeYJKIhoFe02xILHqQFIUbi57yMAZpaQa8z7lhE+/aeSlBqwqhUGnSK9lPtoHw2Jm
	XxeLPMvP7BZ6TrCT76nlnfgD8tU2YF9YyVfmCFFZm3JCt9fscFfV6cmeteMhztH364hZdqxGrEkMJ
	uq86jvSgbJ3tptBql2HEu7dGfBLQMlvaZSWmk9i3S8Y0+iKUnm51ZGiYSbsLAZQJvboFn/8C7R5xu
	PbGoGopr6ZOwGWOX6HYqXowgv4Xof/j/yypsThyyKmuhpekRuR04DAHkT+qmjhDzQx3wLyP7KMXvp
	YgGI1FLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vweWM-0000000B2wT-0Huu;
	Sun, 01 Mar 2026 10:59:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vweWI-0000000B2w5-0P4p
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 10:59:32 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6212LASQ4071445
	for <linux-arm-kernel@lists.infradead.org>; Sun, 1 Mar 2026 10:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWvbzoSirp2+/mfj208EVtuC
	kSsURTVI0XL++QIzXe8=; b=ZbRtpKNVrLZlATBeln8U+o1HVMJ1NJFODQD2g1Xt
	5zqmD26FEi7oT89X6dB/3Kf0XkkF6A8sXLJiy6k2cdCfTElYXz+CjMK5FIy3AQPe
	xpwFsAEbry2aIJz+ovYfTdhNnokCCupYZNrBBmfiE6N5iXxEnaecxqJfkBq7jA6g
	atxv+7P2SKJ+CThu9PnqyE+e14r5zyxB6+fChJWyb7bmsbhO1nbIl9sdXtyQ92aF
	9NNtP7wU75FlG/y0oxLuqIE1sXvncry7ovuFrwD64sbYiUvq0bz1X2QeTCCuTyIj
	PQrXowySKFMO/mebdHFA3zvBB6060oQ2+M3ZZuPrtLkY+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksg72gcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 10:59:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb403842b6so3546393485a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Mar 2026 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362768; x=1772967568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=Cw+y3cJ5YzE/mT+aydEffzbyWIw3b7cmgVXnzDWJ7eohqFWYLL4g4d8/gv4jVRNvME
         CVhAcS7rFQ7/KBUBKQOWK28mLKNExAn6SoWbHM25ZsERCu4/4Br9W/0q5brNgu75vPBZ
         JOkZMmF6LQk9y7B8INAtu4hb+jdbPZoT84k1HLeqlV8tilj5RI00SBRm+J706XgDmMWS
         c9nvGWWzWNDOioMrexO2GN5IKtucliuaY34kEzoTCRjkCxZnp9ko5B4KurceS+8ZpWzX
         UTs1+Gl5waZu2Epq7c4nr9eTIf3f7WGyDlSGbh00dK90Q6e8rM7VeCXPbFPbx2/xB2qu
         fOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362768; x=1772967568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=cqGkGHbxv9sPboFaeDTgzMHVDSR7Cgxn/yPBpW57RT5ALqxLX65WNSyW2es9vnqnUx
         t/70LHxK+YOTMDV+b5V8GBNjxlXkfWXAvhNAiuT3Hj0f2k31isjjfJtzkCoKrSkatPlK
         mywhgCc85mkHY2bee2yivdhQzXbaegD9mgMeHgOtOmM3QqoxY6jITx5P0p+vb8/jYDMs
         8UiH03yUl45/hHwmtu8oR/7H8O2ILpZkzrBHn12p7cfJu7JeavDigukXAcg5Ct5mFyeI
         fnXAga9KH6nrWrD97RjK2AyIjEISOX+NhL9H30Yb04uprKL2FQl5IuDxRG3LMtLNs/tE
         vwqg==
X-Forwarded-Encrypted: i=1; AJvYcCU7Jq4Q2QDg7QLimxEpWd+ROx2iPdVbmQuBv2BvmiqMLuU2CP4b0oT2t6udzBw2Pp3z1MiOccbleEDzOyI8KUCf@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8nolgiAylexTUMyF5M2q9a5ffWCd9rz1OvY1O/nWXgTuz5C0Y
	RszwOuBCzihQM1HP2+PcLp0dcinFOjN4284Bo8zWGnAqns55MI4fRyDurBTawyqzdzE8sH7Sfao
	5B0C/1gedkG7f2gvIjlbMgKLpOXjW0qMO0Ns7aqQ1ApJi5xSuapkg867ncxsqwA7i6nYXYK99CB
	A1Bg==
X-Gm-Gg: ATEYQzyX0Mf06W1cEtQvoyYbRTWzhIeLsHfiNtTxdFE94+Vf+kAq3iAcQTTKwET7AeE
	o7yFX+hgE7r5GfnjjOt4yviWVFiOOHOOtG5YW1Nvhu6slXuvQ410H8b7JUOpYGEK5skM4v6V6iR
	8nzbR9w0Fg+ZtCWnGxuXRXF8Ljf8AOGS2JGUHMB8bt8sgZGrEUsOrOc0Z9PrIXTHhOQOxiTvuvh
	vYQnI9mhFAl6+I+3A4TznteB3MnKrADlADKGj3viNfjKVDI2ao6oBe+vy81zxf6nrTu222+gRUs
	KEJGYdS0eOj5vP6+S+2mGamkNYKh4x/1JCDuHmkBcMd3K4JVOXR7ngM1xQkLCghysq1qXsIpkjk
	Nfn84AFsmjwv4f27yea4OdwQBXrbb5zDzHQYpZkIU5ho7XOLAky1d7UFtC9djRslYitpaoZt6up
	6unqKe/y9qKkxuTSMOXt2x4mp1bp9ZaiJMpx0=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090395685a.16.1772362767966;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090393285a.16.1772362767407;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm872280e87.3.2026.03.01.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:59:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:59:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: zZIS5sPkBa9j-5oAcl1gboZwsYNSsfmf
X-Proofpoint-GUID: zZIS5sPkBa9j-5oAcl1gboZwsYNSsfmf
X-Authority-Analysis: v=2.4 cv=FaA6BZ+6 c=1 sm=1 tr=0 ts=69a41c10 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Dq95N7oyZucg39lo86YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5OCBTYWx0ZWRfXzyTJBf8tCr5K
 Tvy5sj+PSnApTHSkfAsCtB7odX2XTZYvAZ1s1ivOdUPGY7UMyIF8vqeR7QgVSnU5UyP7ub/xmmn
 eJJLtu1IPjLjgR9wJFbFlzTLh3H11hp+WC+SiQVP3n2OmpUMPG/dnYBJywSx3rDFH22T6rHwL7U
 zKqzpDwhkamrt7flWMyELwQgyNyJKY+jqQZ4QAKcbP4WjL7IJDySR0AxrHtYKIKSCWGjAWeYhwb
 1tocJSB2M4aGrpOfRQ4TzNUfl3x4ujHLIS5zZnn+xQ8JnXnsObNVBC/h6afk46LPdifT+sGwMBe
 rIvYOsnJnkT2WRFmMO5LoH/YYOKwqvJR9FHRrXNieNljYa1/HNqjcbtND5uGrfnFVBxWgf49O98
 /RXsiUgmSsAwiqSdkbtUOEq5qxkR5biR7gvMOU9UPf1JEiyPykfEQPQ6JKlzZUzhCnKcHB4TXrH
 fB2LeF25mC8yce8hRnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_025931_448338_88A5CFD3 
X-CRM114-Status: GOOD (  21.24  )
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

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };

Hmm, I didn't notice this. Parsing functions are expected to ignore
of_phandle_args before the parsing. So passing .args_count = 1 is
strange.

>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);

-- 
With best wishes
Dmitry

