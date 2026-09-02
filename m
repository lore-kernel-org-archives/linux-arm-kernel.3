Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A51C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 23:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=; b=XFKuQArNs23d4bqJc0sVBD+8kQ
	hGHUoY79qS6Y9aD53bRyBnHVPhDngwiHc7jbWtPoI0u5EO3uhFN+hVTlNneZfMG80rxDpJC9EnZVt
	eEMJAHHmKw70s2uu+9XpH/GEJyZmb2fDJDaYYXrOlXNg5WR9rLRDFZjY2uNcGbH7MA940iGoLjVnP
	Usai9OI4NxRcFud4RWFos5owLAJj6LGRND4KQuR7/4wWtuc/FVE2GVdW8YiWE3eY7Am735yiIKGAs
	Utrnf+p7uKhtN5UAuVonQ+aYaUBauDIYvOLgoTalaQic44xsg+ORhIQLwxBsgfnzjVJ8lQls8u0Pz
	zV1x5EiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uQW-0000000G5lH-2M5J;
	Wed, 02 Sep 2026 23:31:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1uQT-0000000G5ko-47c9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 23:31:31 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682NHb1v3076502
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 23:31:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=; b=AkyMYLsIPX80W3c2
	UcMtM6MtTW/RC4O7AzOxiaGw0Mj05RGZWRhOCWGTRMvcHVx8dxMLRZX9dipdY20K
	ALzbDKQKe6fUmNkpbpB6X+Has2ZZ2uFUn4MHNoWtFf8UZeKoVwaxYv8XKYv0guFn
	rRsgC9X3AOeBjUXsHw9v1hkvEUUDJZLZDxflsYwVgLXsNB7jP2XcYe9pEUMCFte3
	ODfvnlFEAoIXUKbbXacK5SiJsKN3JVxDmg6expCl3lfX9WHIdGjafziwZnrB0Jma
	Otj9TfCb9Y5wipIA68YHCp1di6F9kFdjvGNjfP4coHNeES5Kb6Q58s3eDtQrRJ36
	5RxHMw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gejv8b2nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 23:31:16 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398fe469aa0so2719469a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 16:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788391875; x=1788996675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=;
        b=QX+irnbRvpAbpoMXpap3EmCiAIVHaXo7l7RnO3u1QMC0t6RlEUhrW0CDKbVoTx/HYc
         IY9KQ9VrgMNMG1NKwo2LUPtOYfnk6uasKge3dl7XwFCKzmhmlU3JTsu0QOJnUITHO2nf
         VOIUeiMumbzrBm6wE9Tn/POewiUgzg/qdaH87mS+VIQeP+k+AxCBJ7TH1yrj6lkzb6u1
         mK7G1zU3xRi0/AhSyrXA8KwcifQaXsVzHs7lslEb6YZHLmxdmLQ0kIq2szTPds+y2yUF
         lA0rE2VydSgWVMmbM6NeFbcMPxMtznXFTxMVU33X2xrcts2/kxzyHi8FBcmKToQIp3R1
         B+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788391875; x=1788996675;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mKKR4HTFazCmqDjGZwCQpnxxG6aHYng7ce+aC01HqDI=;
        b=hoE2KQhwqfiEEnr2njDC5QjZoVhXj9Ybqs1Vlw1gR+fy1cbT+WX/30a1fDFdoVH3is
         K88BXTd8MOt97rqsGgF4dnuJeWh0RtFRtnQD0GsVkum+X59TisKSmgyjN5ZU+14V8U2h
         oCLcQFHoWGeWbKzHONAK+VyoVVGdbxo5AZXTBUVvRrStJAVsqhmWOYt8O1U8s1HaRb1W
         zLh9iH5EDHL1ADlQPtZUnGM0MW+FNEiU7MXgY8CfFt9cgQYYGi8PCljfOqcqAhjf2QVB
         83d04nA0rwHb29mLrS5jelZhpS38dT/Nj8OWfotZu3cHL0U7MPbiOu3HjS4MSJLvyWGP
         RCmg==
X-Forwarded-Encrypted: i=1; AKwUvBwxHfun5HJYdNLyeuCCMTJ9yhd1HY3igMPjJ79P/bNFQs4ZYO1wxozAb5lJLIcwBR9niBH3jKwncFH/4Q+MH/9/@lists.infradead.org
X-Gm-Message-State: AFuF++kp6vgCuFxup5gV8Gv3Lh8mf3vlNEn5/hd6ax2MilhNgH9s3wW4
	HXzvo/K3xqXUYUB9r9L9UuPpzlBjmGrKJB64v/cQPhbXmWcmdjWZQ6zv4ZWyojTZjlCvsoDGBzX
	+dTpHAzXgIpi2IJZYLgBt2JdGyu75tFzG0elBd5NzTdn54yxe6ZGZofup800g4lAir8vSvQ6wtl
	lKaQ5rXTW26A==
X-Gm-Gg: AYBFou2rgrn9o/ub4Uu/PFXNBBACXXZDu1meG+gCiqqauRw9g3+y3B3tVrxrxW+ZB6T
	r8aG5oZeWPFvhY65GnVi30i+iBTLEZtbZzyLblWFkMBpIBXka8FBjG5Ud8kE1mpCSBDr7pp1m2g
	wOrDs3hjaZ+mv73NutKXdNF9Qgg8Pz1MbInk8XBbOAL4UMupg9SGNFZKnK1++EMARqxbyAAs8mo
	mV+Z9yiarGE2j1aDvSquTOp2xq9bbejylLKUHx0T1toVG7eY29qXI+tfRsuBe3tSUFFRmM9+fWK
	Wdy0DSnNBK0rNhlBzJfZeYtMuAVsRuNpmEVeo3Ays5yr1BCsCoGAP+cTLMv3rM3XJjUjXcjbasn
	xNrIh53Z1Dwb3o6gjwzmvP4gUJCk=
X-Received: by 2002:a17:90b:1e04:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-39aee16ffd9mr10385528a91.15.1788391875228;
        Wed, 02 Sep 2026 16:31:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1e04:b0:38f:57f0:1f5d with SMTP id 98e67ed59e1d1-39aee16ffd9mr10385466a91.15.1788391874730;
        Wed, 02 Sep 2026 16:31:14 -0700 (PDT)
Received: from localhost ([50.35.44.179])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325534c324sm1379359eec.5.2026.09.02.16.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:31:14 -0700 (PDT)
Date: Wed, 2 Sep 2026 16:31:10 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 9/9] firmware: arm_scmi: Validate PCC shared memory
 signature
Message-ID: <20260902163110.000054cc@oss.qualcomm.com>
In-Reply-To: <20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-9-cb6b88b4ebb3@kernel.org>
	<20260824132450.000045ca@oss.qualcomm.com>
	<20260902-miniature-bullfinch-of-agreement-4e15fd@sudeepholla>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RA2mBDcDvx_9na5x63P0d7W8f74e0XRF
X-Authority-Analysis: v=2.4 cv=L+wtheT8 c=1 sm=1 tr=0 ts=6a98b1c4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=aNnz9XPx1a4JIXSYt2cE/A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wEqXFAteuqzos8D3EDgA:9 a=CjuIK1q_8ugA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfXzu9Gl4VZXmKN
 zl/r0/FTCGFdELAT3v7rfNq3U0QrDQ1M4bffLieN7Bsm2Mt5D3mHf83mskLmFaJV0hzSjOfBWoj
 P7JohB6xzCtKAVDF3Usj/tGJuO5uQvR12sjtUn+s+esTRghurOHHXJ/uGCL5U+At+2jD2bySS06
 y2ZzipNJmOAia/MjzVotpdriGCRyn+uGpt8b6XCFHaFo+kzeotDSHGeq1d0ukLYEB0SLAi9tR0o
 FabYspfOWXWMXkNPsC0phO5b4QFCBJab2po1lTYfTr8hNXi4ZttbH3nXj8YTppfRkpzmjRnqfaJ
 tpr/3YChRmmtZNeLBk07i1DU/VS8eZIU8ERg+w8/eV47FDvszMTFL3/mG7lUFHxxDn0s3AtxSHA
 3T4Q/nwcTQsRJCTCob/5oWsjoPICa53k1W48rbqudLztGqsKgtIpjC4LP8mJvbOUprGTfs1HxhV
 bYC+7WADaRUeD44oSoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDIwOCBTYWx0ZWRfXznUNFfkcHt6z
 H0P1aCvmjFK3Q1E/g0nSIF2/qp7HNAx/Bt776lxP1Fv+viCy3UDWfIpBCAtWFGSr4+Fj3/zoj4c
 VGCWgGavCmBjLeih2ycDaJVcYv8r5b8=
X-Proofpoint-ORIG-GUID: RA2mBDcDvx_9na5x63P0d7W8f74e0XRF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_06,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_163130_150367_9695B360 
X-CRM114-Status: GOOD (  23.06  )
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

On Wed, 2 Sep 2026 09:25:19 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> On Mon, Aug 24, 2026 at 01:24:50PM -0700, Jonathan Cameron wrote:
> > On Thu, 13 Aug 2026 12:33:04 +0100
> > Sudeep Holla <sudeep.holla@kernel.org> wrote:
> >   
> > > Validate the PCC shared memory signature when setting up an SCMI PCC
> > > channel.
> > > 
> > > Reject channels whose shared memory signature does not encode
> > > PCC_SIGNATURE combined with the PCC subspace ID, so misconfigured
> > > firmware is caught before the transport starts using the shared memory
> > > region.
> > > 
> > > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>  
> > Interesting there aren't more checks on this in the various PCC users.
> > Question for another day perhaps.
> >   
> 
> Tried cleaning up all but some platforms like Hisilicon kunpeng complained
> it will break their platforms. So added a warning in the core but I want
> to enforce stricter check here for SCMI PCC.

Fair enough.  I'd be tempted to check in core and add a quirks list
for those broken platforms but meh, not my problem ;)


> 
> > Seems correct to me.
> > 
> > Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
> >   
> 
> Thanks!
> 


