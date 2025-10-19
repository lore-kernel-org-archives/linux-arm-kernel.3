Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49803CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Oct 2025 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGQ0MOLcCnQuGNFEws8tSgmjY6Cq/DDB5jiuxcA7h9E=; b=vG2fEnsRt0zqJSIHnAaPFnazDV
	S//bmofADrB49cbR/l6J1hHbbx1PWwfDRPbC59uT7fQ+7UkFkvRWSQK7c/7oUpbwMJuVvhvq4G+hY
	iEMnTHHL2/MFJlniydD5Uy0ECiGZwW89RoPpVoC3GabcC9+/jmmYZNBSOrBBpIE9HDfr6snULJEhm
	YrszZkzFroeT4ZP+Nk5iL/3Cz2IxO9SG0zf1UKBwLd2C8dKK8it9QSp9yn5ZpOV8q/X/pApeZrNAN
	vNDA3vaMJbXwifQaKTeOuZ2qBvkUEEv91SlvXGGPJh8Uva/rjgVbxr7HNXwZ/veyBdlyNxa6TrKP6
	Rgq8Tu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAS2X-0000000Ayi6-0VzW;
	Sun, 19 Oct 2025 11:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAS2T-0000000Ayh7-47qQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Oct 2025 11:57:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59J2On81030782
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fGQ0MOLcCnQuGNFEws8tSgmj
	Y6Cq/DDB5jiuxcA7h9E=; b=lVoVWAA707Wxc31l/VYGNTxdteth2GASXjMSBSdy
	+zoc+/PCElxn2YJnsllNtvhJmh28jb33bTb9sYU2NBMcWV/rzUITNI6g+GidLXEe
	AdSNGUi5kwcSeulH2s5IHbgyN/AfR/t+9Pxrixs42WGQ7VYlbkZ7JyoqWkhCTWhB
	ZjuvIGKsAayNOthmF3gubpaan1ODBJSpQPWvb25PfXcMn5bHqZbscUvVcEvFK8ID
	jmqBEg4BtNflagzLYxhz4sjSx9ID6BDMo0xVXK83JXTj3z5D3Nezl/H2I/ohLVwM
	c1cLG2ffTJu5gLu/5Y6VPTc6KhDGxAoEw9V4CbW/exAoPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfa8t5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 11:57:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88ef355f7a3so1396319385a.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 04:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875037; x=1761479837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGQ0MOLcCnQuGNFEws8tSgmjY6Cq/DDB5jiuxcA7h9E=;
        b=pj5scorP3a0HdHjtodoKTkHS7MnnvjTOBdM6x4WNC2ZNGLF/Z8XtneSIO+/nUDwDot
         h6nSQ47iXc4HT6S1wcVNaHk3+KV/Hh6QDX/rpwWKaQZqdMEvcowqH5eoauQvmOxL+jt0
         ozBI2GIAmGAgrk3lyFeUHF6HBT6Yb8a8QaBqiSIW+2FV9ms9SKNQGU+eg+wiUxTJGb5S
         SGJEQx48FGSN0XOvaSslOLKIf0uQh1ZcTR0haEOYDF3waJ9XK0D7HXBhKkQthmPgpLjs
         R1tEoHnBTN/jHx0ztGqdXUOvjtsmFJh9zC/gphKoDdxqQuYxDfueMR0EY8SRAfYiUyIH
         ExqA==
X-Forwarded-Encrypted: i=1; AJvYcCXi0emxUO+Txd+jtOpdkyOCgWIQGwRf2OTYtBCNz0Us52fbYqXiveiAT5w8dGLClzL6g4PO2p6Ke+5FFcfXq50c@lists.infradead.org
X-Gm-Message-State: AOJu0YyFdtUyMUog49UXbj7iUS/gdaosAl+3sk1ZdrG9D1SZKYkdtDtD
	eMKO0KcpLavnJnqL3bKQ47yflQE0vgBYwlvPbqQfzPY1rT/igm/EttRRqTb6Hdb6hKG8fSzQDtt
	d5/2+5HbHOcA4YCND7F6Bdn9mqM8tqSLLWOOztNZKRlpGsb91kbdH/AuKrU1Lm9yB+4LpAbGsAu
	nAgQ==
X-Gm-Gg: ASbGncudnSAHEUam+qOXDFbpffp3Q2slA1amUAn8sMImSzTDtO7UvTj6niIKCJMIFmx
	Erj2nfSr0kVxOE4FyfkdmXW3AfeJgWjnah7N200K8O2e/rlaqOxkz+1IVRaR56jZ9u9z1sxEX7K
	F6F5j2vItwzcLJG8uGj5ESctHET5Vam/PhnGnZ8nIVvQ94WTtVME+LPAfzB0IA7Y38eI6xwP+85
	ENWiJqKnustcFaVa9mf9P1GBNUriWacMoU4JNA+UO8YLjF6KHNFACQufMuckiCQhoDKPYZF/UIU
	8KKguM8yRnoRh0nxJMmSiTs1X3vApJ2Kybbw6fEh11WyaHXtqRqnDZWftK4gWqZ9hkKXHvzpK0t
	oYLWdGAAuXcLubgV2maRNzl+RumcVFejtarhZwRdBUa9UDLCOtwpn/vBI6xG5Hcj556QiX5CDUo
	uvTPR26IOxjZI=
X-Received: by 2002:ac8:5883:0:b0:4e8:abe4:9d38 with SMTP id d75a77b69052e-4e8abe4a39emr77390871cf.41.1760875037437;
        Sun, 19 Oct 2025 04:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX+YQp615nB1m9e4OBBL2rDPwe9z4DG6TaUYbaoSrZe/rJKku24BCoQyPFtL21NMa605kdaw==
X-Received: by 2002:ac8:5883:0:b0:4e8:abe4:9d38 with SMTP id d75a77b69052e-4e8abe4a39emr77390621cf.41.1760875036915;
        Sun, 19 Oct 2025 04:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaff12sm1501803e87.34.2025.10.19.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:57:15 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
Message-ID: <s2u4wktoi26b5yjfl52j4y53r2bgtwsryacjd22smidl4kbtsj@ahiqbwgrcpif>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1xrBPTRpJSWdwm3xTwn38sHih2FAG9T-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX2FtMKWuQ+XjO
 CnKNyMV97rxl5nIaUJvnF9kdn5nS4+XF02j5YN8+ey5CMGFIvhxAwg4jRzv2KWS1y13hCOKsQwy
 ASitb9ran3id4xg5Sx6XDCzSuo5clRlZgiLdRzxeWiRLFNxWBSVgEN2TFC+VWx8ecQj1eUA46vZ
 kwPyyAO7av+6FHf2mr5eL94A2qAWGQtPCykrMKMmWk6Y52s5eMLix0dgtIMVdnsll8xzuNkirDF
 jU13WokV3krGbj4mxdkfWPCj7+w/LNFDOnRT6h1n1WC9+rSjs6s8Y2GnDDAvu6+o60VCa5j2idX
 Z4Eiuc092voEOGIQih+DggiV8NllpQRilnpQJwAPn4U2epwZ3m6FKMbNvxsRFy3vU/+ZRRedckR
 wghlgTz912Dg9JFUsXH7u74HIRW1gw==
X-Proofpoint-GUID: 1xrBPTRpJSWdwm3xTwn38sHih2FAG9T-
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f4d21e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7rlisPeBpEk40MJsvS0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_045730_036337_EE08EE5D 
X-CRM114-Status: GOOD (  25.56  )
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

On Fri, Oct 17, 2025 at 10:46:43AM +0530, Taniya Das wrote:
> 
> 
> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> > On 16/10/2025 20:53, Taniya Das wrote:
> >> The TCSR clock controller is required  during boot to provide the ref
> >> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
> >> the UFS driver successfully probe and initialize the device.
> >>
> >> Without this change, the UFS subsystem fails to mount as a usable file
> >> system during boot.
> > 
> > 
> > That's not what I observed. UFS works fine, especially that it is a
> > module, so no, this is not a desired change and explanation is not only
> > insufficient but actually incorrect.
> > 
> 
> Krzysztof, on Pakala MTP we are observing the below issue and it
> requires the module of tscrcc to be loaded explicitly. This patch also
> aligns to how it is on all other targets.
> 
> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vdd-hba-supply regulator, assuming enabled
> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vccq2-supply regulator, assuming enabled
> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
> unknown)
> [   10.573078] platform 1d84000.ufs: deferred probe pending:
> ufshcd-qcom: ufshcd_pltfrm_init() failed

This will also require you to set CONFIG_SCSI_UFS_QCOM=y (=m in
defconfig), CONFIG_PHY_QCOM_QMP_UFS=y (also =m in defconfig), etc. So, I
doubt that you are using defconfig as is. Please extend your
configuration in order to pick this module.

Note, defconfig is supposed to be used by multiple platforms and
multiple defice. As sych we can't enable all bootable devices. It is
expected that the users either change their configuration or use
initramfs. Only "working console" is expected to be working with the
defconfig and that's only because systemd doesn't reopen /dev/console
after probing modules. If it were, we could have moved all pinctrl,
interconnect and other similar drivers to =m in order to make the
footprint smaller for other platforms.

-- 
With best wishes
Dmitry

