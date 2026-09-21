Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069C4C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 22:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=; b=syhAl7BKXlicGkCAiymScsuM1+
	6h2toKGYfg+Fb/E5M79fIgfTXzFeDf/Lrno3YyGlqASyR6KutKCkr2tRj3Pz1bJVCdFQ/Mv6qElbV
	pyxYji99g9/afOy0vJOA3pFeXTUUlE2UkRN3AgolmPy83d+h1F9HaD+DxuPwEPhfdCKd7fZ3+tk+A
	rJS7mgVvfM1g1ioKrIJ1GHghwLcpehKqUFbxOd2tQaMW55TYO/jnAtH42HHGo2dAE+nHzF5UejGrE
	0e32ac6rV2PIRJg8Fqc5F0X1WD+nHpIbDZkj2j4vqVPxOAiGwQ+i6JAPqYstArAs6UFkOVgL30xmD
	ocAOON7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mSU-00000003Yk4-2C29;
	Mon, 21 Sep 2026 22:25:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8mSQ-00000003YjQ-3jzb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 22:25:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LKeV2t955727
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=; b=PeLSPndbJDcQzlQ/
	NhkJBbPaIa8TbAWSTRhImPSlxiRLbkMFjKIdXHx49BcRXl8FAQYp9y7nJip9I1W1
	EI/EcCHxg2PlO+VnWs8yfpabp9ieziEAU3QrP+f+RmZAs912ynTorYlYlJEsT41n
	YT0NKe1fH7V8fXeS5Ofhlre4AiqFODduy5SqTVA4wfmkDhvX0tuAHlas9gdSUemE
	Pm0bZtFONmNMdyQRJ9ZMQyWu3p5MKtjOoQRJdz2MLlaUZ5UvnZOcHFMZSQJTsIEQ
	ZpgNPaUTG9qUpPrPLCVEUJlBAlZlRMdv+x1/cQa+iqW4Jhrva33bJ93wOlKLcy8H
	lmXfQQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu7tshecj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 22:25:54 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc435388657so5157270a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 15:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790029553; x=1790634353; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=dODxB0A+ZPkhsi+0wACGSKlkHhXy283MS4bmiYe3zSfjDOWyCXaAFwIVtX8rr9JwQY
         cjQgFUWrgRoVvshuvWdbem3AEomFVAAkTIxMZHxz5G5kpqQ5txABO+VtIRPbZEyhR0z0
         iaqDciIHn6DUeImo0DQnNobJ1ylFemEDx6jjLRTQmxmHB3ZvsM7LI2DKvmt0XFKqo2cW
         Lz+ROetYZToREJOBdOyhR2RGAT5WDy0MvOlD8HIsaNtlI3oIoav5VGvx7PllQfnnDCvz
         ejBs/eoQ03MDIcOCvOLB8tUtnBpEj3Bct8W7z7BSiyoyit/eDRkPShfjNpzMEN7nfSmQ
         gOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790029553; x=1790634353;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFjmIIFGSPlWWqbqQjYy7DWGZwNCN8h6t2jDnL948AY=;
        b=WEmHeOm3xQhhfHupUp/sesiQJ99xZF4o9Rc61pOvig4bv57H5Ykrhg8hHQDPRTSNHH
         KryuaTgysf18mJplksBszWVs9fkMy/Q3blWy5Jic7tCDt+UCG26//JtCFNt0Zdg9zG5z
         tPpawOUNDJ/NxbFETnZi7enyih5zJ4OIqmN0zUsbU0AcSAhNDChglnMaIU0p2RlxHsJR
         mSV6O/DO1+FkJZr42jq4jukQ9uJR0/Rglg1S9O/eSArSDLLax2pNEg6nGPvpwYNTuQbK
         oo8wtIBgc5kRt7R+N8JF2QIOjbMonRLIgEtEkza6zvsCOGJac2ZFEWoI9nx+8m7Q9gas
         WuRw==
X-Forwarded-Encrypted: i=1; AKwUvBwReESH3qTidesMHd1ymdeNidveoq4yBJc5gbqUexUhtse4dXzLC9iPIT1aKiIWe/ThFVZGpjZNd7Z3d4fy5ZDI@lists.infradead.org
X-Gm-Message-State: AFuF++mAEcO00EFV0vxLMOQLn0rhBDptvhGqfWxQVmvs0xHxQpjNJcUB
	NaIIkZ+1iE/MLgDtB1Tf02dpLe0rAGMZJtDuwW3iQb3WWEGcAUSLNMTe9eELGzk8BdA5ShGW2qu
	ZweyFgphC1G34Wst6UOS0ooZR/N8D4bAEhlqI7GNoHviidfFRGLz6JPwYXROSzL+hcS37hgmJi0
	uIhA==
X-Gm-Gg: AYBFou2T5e8gJZfahbhwgdH6gaPpWchnHrkMCRxXBErG6H8g+Y1BiAURcmChZ8qCAxX
	I6vfbicNzieOpVMp1isCluffoy+3SZLSNyQ2XlWdWzXzczNYhMZkuk76EnRyhrVGbvY3iRY3fBt
	/vgmjrOcefPiVk1vWEmp7/7DjGJpFi8vHvUJKmUmQi6Vn0ea31Kz0Plqku4JeLXPXWr6Hoy4Nx7
	Dv+VsOeoJC/lGXtGf4ne7uWbMr+FDBg82XPSbHU8aj/hhdMx0aUux8cq2VcvPd2dwRq7+ICkyUS
	Ff/DP8pNatrOpJFDchzeGNi7mk6koBIZJoT3elBRiNETmYibzXE3wXN8qWXS1KU66cpRRoMg8ww
	K4axkadXKxWma+HM281tVjoC1fA==
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850218637.42.1790029553524;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
X-Received: by 2002:a05:6a20:9e0f:b0:3dd:a007:cb2e with SMTP id adf61e73a8af0-3dda007d296mr13850188637.42.1790029553086;
        Mon, 21 Sep 2026 15:25:53 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e610e786dsm118585eec.1.2026.09.21.15.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 15:25:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:25:50 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland
 <mark.rutland@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>, Will Deacon
 <will@kernel.org>,
        Steven Price <steven.price@arm.com>,
        Suzuki K Poulose
 <Suzuki.Poulose@arm.com>,
        Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v12 5/7] virt: coco: arm-cca-guest: Rename TSM report
 source file
Message-ID: <20260921152550.00004373@oss.qualcomm.com>
In-Reply-To: <20260921053807.354802-6-aneesh.kumar@kernel.org>
References: <20260921053807.354802-1-aneesh.kumar@kernel.org>
	<20260921053807.354802-6-aneesh.kumar@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mPq3F51MJpiTzxJvHtrrzKOJNl6NpbCM
X-Authority-Analysis: v=2.4 cv=aqgnmiZV c=1 sm=1 tr=0 ts=6ab1aef2 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=Ikd4Dj_1AAAA:8 a=EUspDBNiAAAA:8
 a=ijXasmccuCAQJU1yyekA:9 a=CjuIK1q_8ugA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfX7VMbV4CD5IKO
 JFOpQ/cWwC7w6gIJ7vYgiSHqISTOW47N6Xp/U3k/JoSEltP7/px9/XtUSMo/ugNAEGw1okBz2RW
 22AisihIhNSqo3DDSMCp8B5ntr3XQs8=
X-Proofpoint-GUID: mPq3F51MJpiTzxJvHtrrzKOJNl6NpbCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDMyOCBTYWx0ZWRfXzW+mzT1ihF0F
 Gsg64R8k54I2H6U08rWaUUgqxk2v0jGC3A7dwtTuVcMzaE8BvLzWVZrmK1I2dR9FMO5EMBb1Ilx
 1MjKX04XxQC6oD12sPXeEStIIiPbti7jKfU6JsyPu5wpC4aorYATpq+k2TRr2cIOHcnC2b+9zUG
 +l4fgsuKXVpvNSVOBwYHmNF5Z/fT4z0D2iHu2uMchUV0r8DL/5ZmYdw7A9Z9PfNHBS2bvT7Qpwc
 TARnnvxE9Qu2COoEoOqJ73hifnHgBr3NEWN7uI0nXQziktRz9i7VfV5FRCMwkBLiskwYZKX+n9n
 HohjKp+p3cSga0V3PVT1ONzGwDuKmuC3f3QW9csz2NWvtckPq7VgtUQUWQVnuCvXv45ppdDBCKl
 +6nKT9MZ+MkKl9mFX5ediiasebUCavXXd0n/Z2bQMkRZwAlSSVplVLY8miZ4ysq2r2KcHT8vcqC
 wC5exSyN6oRIJkeV08w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210328
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_152554_945967_EAE8AD58 
X-CRM114-Status: GOOD (  14.22  )
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

On Mon, 21 Sep 2026 11:08:05 +0530
"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org> wrote:

> The Arm CCA guest driver currently only implements TSM report support, but
> follow-up changes will add more TSM-related functionality to the same
> module.
> 
> Rename arm-cca-guest.c to main.c and build it as an object of the
> arm-cca-guest module. This leaves room for the module to grow additional
> source files.
> 
> Also rename the arm_cca_tsm_ops instance to arm_cca_tsm_report_ops to
> distinguish the report operations from other TSM functionality that will
> be added.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

