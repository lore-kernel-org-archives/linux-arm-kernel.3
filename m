Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F00E937E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 14:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoQMzrEfqabP76Y6uGlmNLddzS3PV06Po1U56SFqwkQ=; b=xM2HZsFwKj2P+2xeibpBxHCmn8
	M+yRCUZWmUeUv+qoiCRZOGNAjfhr1lpsK+gEOMEW+znx8L5t+whynMEVD2OjX6SUl/9nss2A1jNdl
	geIJqwLifdqS/0xqjdw/+U+cuVH8V+WBle+xyzEGPdLDhWzOJRG1KADxjLpcLKXrgw33eUcHheFu5
	cMexXrflQADSUM+4FVo1xFWITVAt+K27hfgNH2PWAwO1OyJd1qFDGrFD/sQjmB3L+PM0k+A13EVIz
	FQSkf+AeNfPlfiSkvbLdRZipzZ6U1yYOAmCuSc6s6UfXaeZPwMo92x0mYs6Uyw/5xoTcdubP6yBem
	e/v5ck+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvuZ-0000000EOSg-0Lhs;
	Sun, 12 Apr 2026 14:35:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBvuT-0000000EOSI-3IqC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 14:35:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63CE57tG543547
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoQMzrEfqabP76Y6uGlmNLddzS3PV06Po1U56SFqwkQ=; b=URiI1saOfffMNt+0
	Ejpl/ExuSmaDEAgUFO4gTkRRejGT+xzz48QbNUhVBfS4wIDlExHIjeRFQROAX3tv
	ty6uWUgL5b32TpAgRtCZFeoAoSWoj4Mu/B6Y5CtK/YYRBRytm1InHxe7Ar4cJRx3
	1XDHOrU2vrYrrK81sn7u8JQyM/xLYlZ5VH7MIHtYDKvQNie/AZq2OSfF+EpD+MNV
	quphappC3Y+T1MYt65Wf4N7WU38ab9L2FE3yGYnVqrgHGyy1ewj17p0C0G3wCJBE
	MJH2OWHulKUpjrjihvYWlnZUgnIh1FCutrgFP8iDoSC8VyIhc+rkw01F9NPy/kx+
	GkS82w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexftfy0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 14:35:36 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9467e85aso3672364a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 07:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776004535; x=1776609335; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoQMzrEfqabP76Y6uGlmNLddzS3PV06Po1U56SFqwkQ=;
        b=ZjOVYXMSq+nlurxeRCbav4fahqRpKu5xvQfU0OyTfn13LrRcIlh0s4AipufbsSNrHz
         lh+Ckwk/FAtt4NdJgpaiTkq+vi6d5E2ajuYDyFQ+xYGN8T0n+IyxDBHU7hGti/FHYtcx
         pUSV7cG5feVrwSiufQk8Ey6+SOS+PMfI6lkVGAr7Ggc5xxG3c++SMNmJ69btTJ1vZU9F
         wcimSg0OHDH9aHVDlXLVuZ5BCyhfxt7Md19ctiltzLliHYHINqdrLSeUY7kvq24hkHj2
         j/bqjtYDpVRt1IghXbjUaWlejJPFYdbmnKUSWeP2TI4bNHTXf26APiqv39qfEzH1XujT
         eQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776004535; x=1776609335;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoQMzrEfqabP76Y6uGlmNLddzS3PV06Po1U56SFqwkQ=;
        b=ad9FOrPPYxji9LKidXVksRDepAmnNcVCkKAVlCnmF6DzLx7dg7qWwc0vM6Qpbzm/6c
         HxG4lzqpLCEa92K2pmE1OAXT6Etsyp0vTbr6eaeAHEIBdvBngVaiscCc8kG+6gd++nbX
         Jie6JBXXjTzn118hwQ++v5SOwA3ERolmTcPsIGwLtwYT/yHdKf4yRhwsxnnXcqQy8TpF
         e4w23Rd+75qUzOFcsAjr31fzdPuU4EfWKyOl4SqdmYhb1FQ+IgKw0Ih2zZiscfU9V3M9
         p4lRWYrrq1VyVPvFxdRKpfQEvOu/ix7F7r/5WO/BRO08AeQxIv1jOB0Mf3bV3whqWHWE
         lVbw==
X-Forwarded-Encrypted: i=1; AFNElJ8Y66ZkohjvfxT88DxpkwBuJK2b8hz6k3Hs3dHdP7ujwtJlsfi3Iwe9hhXmXOpbclsJ2ib0TbRhSLU737WerZSD@lists.infradead.org
X-Gm-Message-State: AOJu0YxTLzWIMB3hkRT8RdUHL7Ns0shUU0AMQ53f+C66IR0j7cc1UZ2X
	e6vyX8XRv9HY1kFL2wIt2pLD49xrCHIP7NoHThINopsg0w4rqlrio2iAsJtDvpLJ1MmFLHjFsVp
	aMuaVV1O/xj4Egk17tAkE1w0bcn1F92DQHD0kxHIA51XnsmBBdRuqDO9yVFRo7fEZJEQcthR83x
	5t4Q==
X-Gm-Gg: AeBDiesyHnOffDYPzQGR84M6RKn2dCMVkj6MorbL8skR72+u15vP9leUuhbpF3ZHwoW
	uom3bPmlpRRNM85oGGONjPR+UoMus5k+Vn3YTEYdyZaKpWwypSVmJS7HAAcbxPQsbbkBy9JJlBL
	hOs0IayG843RWtZjrNQeH5vgFHCry6ZmlTDeEoQplGfHRdhyqT5JQ9dfqujZU4d1zv2dafca+z8
	NxglF1tAZPRoDd5MBRRNwAkXaILZlcve//R8W9Tt9t+tW/h04xj/DO4VYx2p2T2FGX0BaSAIKg+
	OHU/0ZumHDKq8mOs63dxOnIfP9aMIa7j2kxTqvJvinLwmmgu6VfQXJss/SYHj1IHmvkBkPXRtUB
	yL0VS5hTaJgNTGz4dFAnLzktWw+uvS5hUHSV75b8Ja2EmIbJzys6IW8H6NSvEx3OXHhz7wcqPdz
	e7H2MV8cUflg==
X-Received: by 2002:a17:90b:1651:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-35e4282bda0mr9964387a91.18.1776004535040;
        Sun, 12 Apr 2026 07:35:35 -0700 (PDT)
X-Received: by 2002:a17:90b:1651:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-35e4282bda0mr9964359a91.18.1776004534337;
        Sun, 12 Apr 2026 07:35:34 -0700 (PDT)
Received: from [10.133.33.83] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e5723aa50sm3312874a91.15.2026.04.12.07.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 07:35:33 -0700 (PDT)
Message-ID: <46776f5b-7167-4e99-ad8d-abb221f02aee@oss.qualcomm.com>
Date: Sun, 12 Apr 2026 22:35:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] coresight: etm4x: introduce struct etm4_caps
To: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
        alexander.shishkin@linux.intel.com, leo.yan@arm.com
References: <20260410074310.2693385-1-yeoreum.yun@arm.com>
 <20260410074310.2693385-2-yeoreum.yun@arm.com>
Content-Language: en-US
From: Jie Gan <jie.gan@oss.qualcomm.com>
In-Reply-To: <20260410074310.2693385-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 8L0FoL-fPWoCghrMIYLoAjGWCGT-sQG0
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dbadb8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=XvcFQj_PuQwcStI2mocA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 8L0FoL-fPWoCghrMIYLoAjGWCGT-sQG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDE0MyBTYWx0ZWRfX0pZZ/MOm44pG
 83kAJJVggWaRjNPJjSCOef8tELv3QuhGAUPKLDTRLDiWZzeTC/W5LjRqeVUP8PodWdAhOQgrlWM
 NmCi1ib4rr7v1VPOJZQkP9EMLczo7h+uX9LPlRHqXTRFnGDp75pYKBIWGzvQ2INwVDz07DWdOqB
 547ZrhLt9svZxw+cYXCgq5+IEP/uGWwPr9z/SizNIi6hqN+C+0Gvre/bnzoHIVh52re0I4s+/Ro
 74xc3LVqvDD/fbGj2bueZx4UNuH1ADqyf1PTrp4N2QahD5At3PxbdVnZAkZ1FtRr35up90jsjL3
 YPeyT9RMRbp+zdGJP6nNfOlEnKhNsFrTPDExXkXwskfPh9hJ2zqZiJ0G2HQvioKR9Tb4Z0VkGKw
 1evXW1LJxshuyMApEKqKfxVSpvWxtSrfdO/YUPb04log5wo7ARWB1CTqVEJH4w24qrJ5kvptqU+
 Q8Kk/0JBzlTED1vai0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-12_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604120143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_073538_065767_42709B83 
X-CRM114-Status: GOOD (  25.94  )
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



On 4/10/2026 3:43 PM, Yeoreum Yun wrote:
> introduce struct etm4_caps to describe ETMv4 capabilities
> and move capabilities information into it.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>   .../coresight/coresight-etm4x-core.c          | 234 +++++++++---------
>   .../coresight/coresight-etm4x-sysfs.c         | 185 ++++++++------
>   drivers/hwtracing/coresight/coresight-etm4x.h | 175 ++++++-------
>   3 files changed, 327 insertions(+), 267 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index d565a73f0042..6443f3717b37 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -88,8 +88,9 @@ static int etm4_probe_cpu(unsigned int cpu);
>    */
>   static bool etm4x_sspcicrn_present(struct etmv4_drvdata *drvdata, int n)
>   {
> -	return (n < drvdata->nr_ss_cmp) &&
> -	       drvdata->nr_pe &&
> +	const struct etmv4_caps *caps = &drvdata->caps;
> +
> +	return (n < caps->nr_ss_cmp) && caps->nr_pe &&
>   	       (drvdata->config.ss_status[n] & TRCSSCSRn_PC);
>   }
>   
> @@ -160,17 +161,20 @@ static void ete_sysreg_write(u64 val, u32 offset, bool _relaxed, bool _64bit)
>   static void etm_detect_os_lock(struct etmv4_drvdata *drvdata,
>   			       struct csdev_access *csa)
>   {
> +	struct etmv4_caps *caps = &drvdata->caps;
>   	u32 oslsr = etm4x_relaxed_read32(csa, TRCOSLSR);
>   
> -	drvdata->os_lock_model = ETM_OSLSR_OSLM(oslsr);
> +	caps->os_lock_model = ETM_OSLSR_OSLM(oslsr);
>   }
>   
>   static void etm_write_os_lock(struct etmv4_drvdata *drvdata,
>   			      struct csdev_access *csa, u32 val)
>   {
> +	const struct etmv4_caps *caps = &drvdata->caps;
> +
>   	val = !!val;
>   
> -	switch (drvdata->os_lock_model) {
> +	switch (caps->os_lock_model) {
>   	case ETM_OSLOCK_PRESENT:
>   		etm4x_relaxed_write32(csa, val, TRCOSLAR);
>   		break;
> @@ -179,7 +183,7 @@ static void etm_write_os_lock(struct etmv4_drvdata *drvdata,
>   		break;
>   	default:
>   		pr_warn_once("CPU%d: Unsupported Trace OSLock model: %x\n",
> -			     smp_processor_id(), drvdata->os_lock_model);
> +			     smp_processor_id(), caps->os_lock_model);
>   		fallthrough;
>   	case ETM_OSLOCK_NI:
>   		return;
> @@ -494,6 +498,7 @@ static int etm4_enable_trace_unit(struct etmv4_drvdata *drvdata)
>   static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	int i, rc;
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct device *etm_dev = &csdev->dev;
> @@ -525,14 +530,14 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   	if (etm4x_wait_status(csa, TRCSTATR_IDLE_BIT, 1))
>   		dev_err(etm_dev,
>   			"timeout while waiting for Idle Trace Status\n");
> -	if (drvdata->nr_pe)
> +	if (caps->nr_pe)
>   		etm4x_relaxed_write32(csa, config->pe_sel, TRCPROCSELR);
>   	etm4x_relaxed_write32(csa, config->cfg, TRCCONFIGR);
>   	/* nothing specific implemented */
>   	etm4x_relaxed_write32(csa, 0x0, TRCAUXCTLR);
>   	etm4x_relaxed_write32(csa, config->eventctrl0, TRCEVENTCTL0R);
>   	etm4x_relaxed_write32(csa, config->eventctrl1, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> +	if (caps->stallctl)
>   		etm4x_relaxed_write32(csa, config->stall_ctrl, TRCSTALLCTLR);
>   	etm4x_relaxed_write32(csa, config->ts_ctrl, TRCTSCTLR);
>   	etm4x_relaxed_write32(csa, config->syncfreq, TRCSYNCPR);
> @@ -542,17 +547,17 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   	etm4x_relaxed_write32(csa, config->vinst_ctrl, TRCVICTLR);
>   	etm4x_relaxed_write32(csa, config->viiectlr, TRCVIIECTLR);
>   	etm4x_relaxed_write32(csa, config->vissctlr, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> +	if (caps->nr_pe_cmp)
>   		etm4x_relaxed_write32(csa, config->vipcssctlr, TRCVIPCSSCTLR);
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +	for (i = 0; i < caps->nrseqstate - 1; i++)
>   		etm4x_relaxed_write32(csa, config->seq_ctrl[i], TRCSEQEVRn(i));
> -	if (drvdata->nrseqstate) {
> +	if (caps->nrseqstate) {
>   		etm4x_relaxed_write32(csa, config->seq_rst, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, config->seq_state, TRCSEQSTR);
>   	}
> -	if (drvdata->numextinsel)
> +	if (caps->numextinsel)
>   		etm4x_relaxed_write32(csa, config->ext_inp, TRCEXTINSELR);
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		etm4x_relaxed_write32(csa, config->cntrldvr[i], TRCCNTRLDVRn(i));
>   		etm4x_relaxed_write32(csa, config->cntr_ctrl[i], TRCCNTCTLRn(i));
>   		etm4x_relaxed_write32(csa, config->cntr_val[i], TRCCNTVRn(i));
> @@ -562,10 +567,10 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   	 * Resource selector pair 0 is always implemented and reserved.  As
>   	 * such start at 2.
>   	 */
> -	for (i = 2; i < drvdata->nr_resource * 2; i++)
> +	for (i = 2; i < caps->nr_resource * 2; i++)
>   		etm4x_relaxed_write32(csa, config->res_ctrl[i], TRCRSCTLRn(i));
>   
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		/* always clear status bit on restart if using single-shot */
>   		if (config->ss_ctrl[i] || config->ss_pe_cmp[i])
>   			config->ss_status[i] &= ~TRCSSCSRn_STATUS;
> @@ -574,23 +579,23 @@ static int etm4_enable_hw(struct etmv4_drvdata *drvdata)
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			etm4x_relaxed_write32(csa, config->ss_pe_cmp[i], TRCSSPCICRn(i));
>   	}
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> +	for (i = 0; i < caps->nr_addr_cmp * 2; i++) {
>   		etm4x_relaxed_write64(csa, config->addr_val[i], TRCACVRn(i));
>   		etm4x_relaxed_write64(csa, config->addr_acc[i], TRCACATRn(i));
>   	}
> -	for (i = 0; i < drvdata->numcidc; i++)
> +	for (i = 0; i < caps->numcidc; i++)
>   		etm4x_relaxed_write64(csa, config->ctxid_pid[i], TRCCIDCVRn(i));
>   	etm4x_relaxed_write32(csa, config->ctxid_mask0, TRCCIDCCTLR0);
> -	if (drvdata->numcidc > 4)
> +	if (caps->numcidc > 4)
>   		etm4x_relaxed_write32(csa, config->ctxid_mask1, TRCCIDCCTLR1);
>   
> -	for (i = 0; i < drvdata->numvmidc; i++)
> +	for (i = 0; i < caps->numvmidc; i++)
>   		etm4x_relaxed_write64(csa, config->vmid_val[i], TRCVMIDCVRn(i));
>   	etm4x_relaxed_write32(csa, config->vmid_mask0, TRCVMIDCCTLR0);
> -	if (drvdata->numvmidc > 4)
> +	if (caps->numvmidc > 4)
>   		etm4x_relaxed_write32(csa, config->vmid_mask1, TRCVMIDCCTLR1);
>   
> -	if (!drvdata->skip_power_up) {
> +	if (!caps->skip_power_up) {
>   		u32 trcpdcr = etm4x_relaxed_read32(csa, TRCPDCR);
>   
>   		/*
> @@ -666,19 +671,20 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>   {
>   	int ctridx;
>   	int rselector;
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	/* No point in trying if we don't have at least one counter */
> -	if (!drvdata->nr_cntr)
> +	if (!caps->nr_cntr)
>   		return -EINVAL;
>   
>   	/* Find a counter that hasn't been initialised */
> -	for (ctridx = 0; ctridx < drvdata->nr_cntr; ctridx++)
> +	for (ctridx = 0; ctridx < caps->nr_cntr; ctridx++)
>   		if (config->cntr_val[ctridx] == 0)
>   			break;
>   
>   	/* All the counters have been configured already, bail out */
> -	if (ctridx == drvdata->nr_cntr) {
> +	if (ctridx == caps->nr_cntr) {
>   		pr_debug("%s: no available counter found\n", __func__);
>   		return -ENOSPC;
>   	}
> @@ -694,11 +700,11 @@ static int etm4_config_timestamp_event(struct etmv4_drvdata *drvdata,
>   	 * ETMIDR4 gives the number of resource selector _pairs_, hence multiply
>   	 * by 2.
>   	 */
> -	for (rselector = 2; rselector < drvdata->nr_resource * 2; rselector++)
> +	for (rselector = 2; rselector < caps->nr_resource * 2; rselector++)
>   		if (!config->res_ctrl[rselector])
>   			break;
>   
> -	if (rselector == drvdata->nr_resource * 2) {
> +	if (rselector == caps->nr_resource * 2) {
>   		pr_debug("%s: no available resource selector found\n",
>   			 __func__);
>   		return -ENOSPC;
> @@ -749,6 +755,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   {
>   	int ret = 0;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   	struct perf_event_attr max_timestamp = {
>   		.ATTR_CFG_FLD_timestamp_CFG = U64_MAX,
> @@ -788,8 +795,8 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   		cc_threshold = ATTR_CFG_GET_FLD(attr, cc_threshold);
>   		if (!cc_threshold)
>   			cc_threshold = ETM_CYC_THRESHOLD_DEFAULT;
> -		if (cc_threshold < drvdata->ccitmin)
> -			cc_threshold = drvdata->ccitmin;
> +		if (cc_threshold < caps->ccitmin)
> +			cc_threshold = caps->ccitmin;
>   		config->ccctlr = cc_threshold;
>   	}
>   
> @@ -837,7 +844,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   	}
>   
>   	/* return stack - enable if selected and supported */
> -	if (ATTR_CFG_GET_FLD(attr, retstack) && drvdata->retstack)
> +	if (ATTR_CFG_GET_FLD(attr, retstack) && caps->retstack)
>   		/* bit[12], Return stack enable bit */
>   		config->cfg |= TRCCONFIGR_RS;
>   
> @@ -853,7 +860,7 @@ static int etm4_parse_event_config(struct coresight_device *csdev,
>   
>   	/* branch broadcast - enable if selected and supported */
>   	if (ATTR_CFG_GET_FLD(attr, branch_broadcast)) {
> -		if (!drvdata->trcbb) {
> +		if (!caps->trcbb) {
>   			/*
>   			 * Missing BB support could cause silent decode errors
>   			 * so fail to open if it's not supported.
> @@ -1028,6 +1035,7 @@ static void etm4_disable_trace_unit(struct etmv4_drvdata *drvdata)
>   static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   {
>   	u32 control;
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa = &csdev->access;
> @@ -1036,7 +1044,7 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   	etm4_cs_unlock(drvdata, csa);
>   	etm4_disable_arch_specific(drvdata);
>   
> -	if (!drvdata->skip_power_up) {
> +	if (!caps->skip_power_up) {
>   		/* power can be removed from the trace unit now */
>   		control = etm4x_relaxed_read32(csa, TRCPDCR);
>   		control &= ~TRCPDCR_PU;
> @@ -1046,13 +1054,13 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
>   	etm4_disable_trace_unit(drvdata);
>   
>   	/* read the status of the single shot comparators */
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		config->ss_status[i] =
>   			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>   	}
>   
>   	/* read back the current counter values */
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		config->cntr_val[i] =
>   			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
>   	}
> @@ -1350,7 +1358,7 @@ static struct midr_range etm_wrong_ccitmin_cpus[] = {
>   	{},
>   };
>   
> -static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
> +static void etm4_fixup_wrong_ccitmin(struct etmv4_caps *caps)
>   {
>   	/*
>   	 * Erratum affected cpus will read 256 as the minimum
> @@ -1360,8 +1368,8 @@ static void etm4_fixup_wrong_ccitmin(struct etmv4_drvdata *drvdata)
>   	 * this problem.
>   	 */
>   	if (is_midr_in_range_list(etm_wrong_ccitmin_cpus)) {
> -		if (drvdata->ccitmin == 256)
> -			drvdata->ccitmin = 4;
> +		if (caps->ccitmin == 256)
> +			caps->ccitmin = 4;
>   	}
>   }
>   
> @@ -1374,11 +1382,13 @@ static void etm4_init_arch_data(void *info)
>   	u32 etmidr5;
>   	struct etm4_init_arg *init_arg = info;
>   	struct etmv4_drvdata *drvdata;
> +	struct etmv4_caps *caps;
>   	struct csdev_access *csa;
>   	struct device *dev = init_arg->dev;
>   	int i;
>   
>   	drvdata = dev_get_drvdata(init_arg->dev);
> +	caps = &drvdata->caps;
>   	csa = init_arg->csa;
>   
>   	/*
> @@ -1391,7 +1401,7 @@ static void etm4_init_arch_data(void *info)
>   
>   	if (!csa->io_mem ||
>   	    fwnode_property_present(dev_fwnode(dev), "qcom,skip-power-up"))
> -		drvdata->skip_power_up = true;
> +		caps->skip_power_up = true;
>   
>   	/* Detect the support for OS Lock before we actually use it */
>   	etm_detect_os_lock(drvdata, csa);
> @@ -1406,71 +1416,71 @@ static void etm4_init_arch_data(void *info)
>   	etmidr0 = etm4x_relaxed_read32(csa, TRCIDR0);
>   
>   	/* INSTP0, bits[2:1] P0 tracing support field */
> -	drvdata->instrp0 = !!(FIELD_GET(TRCIDR0_INSTP0_MASK, etmidr0) == 0b11);
> +	caps->instrp0 = !!(FIELD_GET(TRCIDR0_INSTP0_MASK, etmidr0) == 0b11);
>   	/* TRCBB, bit[5] Branch broadcast tracing support bit */
> -	drvdata->trcbb = !!(etmidr0 & TRCIDR0_TRCBB);
> +	caps->trcbb = !!(etmidr0 & TRCIDR0_TRCBB);
>   	/* TRCCOND, bit[6] Conditional instruction tracing support bit */
> -	drvdata->trccond = !!(etmidr0 & TRCIDR0_TRCCOND);
> +	caps->trccond = !!(etmidr0 & TRCIDR0_TRCCOND);
>   	/* TRCCCI, bit[7] Cycle counting instruction bit */
> -	drvdata->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
> +	caps->trccci = !!(etmidr0 & TRCIDR0_TRCCCI);
>   	/* RETSTACK, bit[9] Return stack bit */
> -	drvdata->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
> +	caps->retstack = !!(etmidr0 & TRCIDR0_RETSTACK);
>   	/* NUMEVENT, bits[11:10] Number of events field */
> -	drvdata->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
> +	caps->nr_event = FIELD_GET(TRCIDR0_NUMEVENT_MASK, etmidr0);
>   	/* QSUPP, bits[16:15] Q element support field */
> -	drvdata->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
> -	if (drvdata->q_support)
> -		drvdata->q_filt = !!(etmidr0 & TRCIDR0_QFILT);
> +	caps->q_support = FIELD_GET(TRCIDR0_QSUPP_MASK, etmidr0);
> +	if (caps->q_support)
> +		caps->q_filt = !!(etmidr0 & TRCIDR0_QFILT);
>   	/* TSSIZE, bits[28:24] Global timestamp size field */
> -	drvdata->ts_size = FIELD_GET(TRCIDR0_TSSIZE_MASK, etmidr0);
> +	caps->ts_size = FIELD_GET(TRCIDR0_TSSIZE_MASK, etmidr0);
>   
>   	/* maximum size of resources */
>   	etmidr2 = etm4x_relaxed_read32(csa, TRCIDR2);
>   	/* CIDSIZE, bits[9:5] Indicates the Context ID size */
> -	drvdata->ctxid_size = FIELD_GET(TRCIDR2_CIDSIZE_MASK, etmidr2);
> +	caps->ctxid_size = FIELD_GET(TRCIDR2_CIDSIZE_MASK, etmidr2);
>   	/* VMIDSIZE, bits[14:10] Indicates the VMID size */
> -	drvdata->vmid_size = FIELD_GET(TRCIDR2_VMIDSIZE_MASK, etmidr2);
> +	caps->vmid_size = FIELD_GET(TRCIDR2_VMIDSIZE_MASK, etmidr2);
>   	/* CCSIZE, bits[28:25] size of the cycle counter in bits minus 12 */
> -	drvdata->ccsize = FIELD_GET(TRCIDR2_CCSIZE_MASK, etmidr2);
> +	caps->ccsize = FIELD_GET(TRCIDR2_CCSIZE_MASK, etmidr2);
>   
>   	etmidr3 = etm4x_relaxed_read32(csa, TRCIDR3);
>   	/* CCITMIN, bits[11:0] minimum threshold value that can be programmed */
> -	drvdata->ccitmin = FIELD_GET(TRCIDR3_CCITMIN_MASK, etmidr3);
> -	etm4_fixup_wrong_ccitmin(drvdata);
> +	caps->ccitmin = FIELD_GET(TRCIDR3_CCITMIN_MASK, etmidr3);
> +	etm4_fixup_wrong_ccitmin(caps);
>   
>   	/* EXLEVEL_S, bits[19:16] Secure state instruction tracing */
> -	drvdata->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> -	drvdata->config.s_ex_level = drvdata->s_ex_level;
> +	caps->s_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_S_MASK, etmidr3);
> +	drvdata->config.s_ex_level = caps->s_ex_level;
>   	/* EXLEVEL_NS, bits[23:20] Non-secure state instruction tracing */
> -	drvdata->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
> +	caps->ns_ex_level = FIELD_GET(TRCIDR3_EXLEVEL_NS_MASK, etmidr3);
>   	/*
>   	 * TRCERR, bit[24] whether a trace unit can trace a
>   	 * system error exception.
>   	 */
> -	drvdata->trc_error = !!(etmidr3 & TRCIDR3_TRCERR);
> +	caps->trc_error = !!(etmidr3 & TRCIDR3_TRCERR);
>   	/* SYNCPR, bit[25] implementation has a fixed synchronization period? */
> -	drvdata->syncpr = !!(etmidr3 & TRCIDR3_SYNCPR);
> +	caps->syncpr = !!(etmidr3 & TRCIDR3_SYNCPR);
>   	/* STALLCTL, bit[26] is stall control implemented? */
> -	drvdata->stallctl = !!(etmidr3 & TRCIDR3_STALLCTL);
> +	caps->stallctl = !!(etmidr3 & TRCIDR3_STALLCTL);
>   	/* SYSSTALL, bit[27] implementation can support stall control? */
> -	drvdata->sysstall = !!(etmidr3 & TRCIDR3_SYSSTALL);
> +	caps->sysstall = !!(etmidr3 & TRCIDR3_SYSSTALL);
>   	/*
>   	 * NUMPROC - the number of PEs available for tracing, 5bits
>   	 *         = TRCIDR3.bits[13:12]bits[30:28]
>   	 *  bits[4:3] = TRCIDR3.bits[13:12] (since etm-v4.2, otherwise RES0)
>   	 *  bits[3:0] = TRCIDR3.bits[30:28]
>   	 */
> -	drvdata->nr_pe =  (FIELD_GET(TRCIDR3_NUMPROC_HI_MASK, etmidr3) << 3) |
> -			   FIELD_GET(TRCIDR3_NUMPROC_LO_MASK, etmidr3);
> +	caps->nr_pe = (FIELD_GET(TRCIDR3_NUMPROC_HI_MASK, etmidr3) << 3) |
> +			       FIELD_GET(TRCIDR3_NUMPROC_LO_MASK, etmidr3);
>   	/* NOOVERFLOW, bit[31] is trace overflow prevention supported */
> -	drvdata->nooverflow = !!(etmidr3 & TRCIDR3_NOOVERFLOW);
> +	caps->nooverflow = !!(etmidr3 & TRCIDR3_NOOVERFLOW);
>   
>   	/* number of resources trace unit supports */
>   	etmidr4 = etm4x_relaxed_read32(csa, TRCIDR4);
>   	/* NUMACPAIRS, bits[0:3] number of addr comparator pairs for tracing */
> -	drvdata->nr_addr_cmp = FIELD_GET(TRCIDR4_NUMACPAIRS_MASK, etmidr4);
> +	caps->nr_addr_cmp = FIELD_GET(TRCIDR4_NUMACPAIRS_MASK, etmidr4);
>   	/* NUMPC, bits[15:12] number of PE comparator inputs for tracing */
> -	drvdata->nr_pe_cmp = FIELD_GET(TRCIDR4_NUMPC_MASK, etmidr4);
> +	caps->nr_pe_cmp = FIELD_GET(TRCIDR4_NUMPC_MASK, etmidr4);
>   	/*
>   	 * NUMRSPAIR, bits[19:16]
>   	 * The number of resource pairs conveyed by the HW starts at 0, i.e a
> @@ -1481,41 +1491,41 @@ static void etm4_init_arch_data(void *info)
>   	 * the default TRUE and FALSE resource selectors are omitted.
>   	 * Otherwise for values 0x1 and above the number is N + 1 as per v4.2.
>   	 */
> -	drvdata->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
> -	if ((drvdata->arch < ETM_ARCH_V4_3) || (drvdata->nr_resource > 0))
> -		drvdata->nr_resource += 1;
> +	caps->nr_resource = FIELD_GET(TRCIDR4_NUMRSPAIR_MASK, etmidr4);
> +	if ((drvdata->arch < ETM_ARCH_V4_3) || (caps->nr_resource > 0))
> +		caps->nr_resource += 1;
>   	/*
>   	 * NUMSSCC, bits[23:20] the number of single-shot
>   	 * comparator control for tracing. Read any status regs as these
>   	 * also contain RO capability data.
>   	 */
> -	drvdata->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	caps->nr_ss_cmp = FIELD_GET(TRCIDR4_NUMSSCC_MASK, etmidr4);
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		drvdata->config.ss_status[i] =
>   			etm4x_relaxed_read32(csa, TRCSSCSRn(i));
>   	}
>   	/* NUMCIDC, bits[27:24] number of Context ID comparators for tracing */
> -	drvdata->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
> +	caps->numcidc = FIELD_GET(TRCIDR4_NUMCIDC_MASK, etmidr4);
>   	/* NUMVMIDC, bits[31:28] number of VMID comparators for tracing */
> -	drvdata->numvmidc = FIELD_GET(TRCIDR4_NUMVMIDC_MASK, etmidr4);
> +	caps->numvmidc = FIELD_GET(TRCIDR4_NUMVMIDC_MASK, etmidr4);
>   
>   	etmidr5 = etm4x_relaxed_read32(csa, TRCIDR5);
>   	/* NUMEXTIN, bits[8:0] number of external inputs implemented */
> -	drvdata->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
> -	drvdata->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
> +	caps->nr_ext_inp = FIELD_GET(TRCIDR5_NUMEXTIN_MASK, etmidr5);
> +	caps->numextinsel = FIELD_GET(TRCIDR5_NUMEXTINSEL_MASK, etmidr5);
>   	/* TRACEIDSIZE, bits[21:16] indicates the trace ID width */
> -	drvdata->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
> +	caps->trcid_size = FIELD_GET(TRCIDR5_TRACEIDSIZE_MASK, etmidr5);
>   	/* ATBTRIG, bit[22] implementation can support ATB triggers? */
> -	drvdata->atbtrig = !!(etmidr5 & TRCIDR5_ATBTRIG);
> +	caps->atbtrig = !!(etmidr5 & TRCIDR5_ATBTRIG);
>   	/*
>   	 * LPOVERRIDE, bit[23] implementation supports
>   	 * low-power state override
>   	 */
> -	drvdata->lpoverride = (etmidr5 & TRCIDR5_LPOVERRIDE) && (!drvdata->skip_power_up);
> +	caps->lpoverride = (etmidr5 & TRCIDR5_LPOVERRIDE) && (!caps->skip_power_up);
>   	/* NUMSEQSTATE, bits[27:25] number of sequencer states implemented */
> -	drvdata->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
> +	caps->nrseqstate = FIELD_GET(TRCIDR5_NUMSEQSTATE_MASK, etmidr5);
>   	/* NUMCNTR, bits[30:28] number of counters available for tracing */
> -	drvdata->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
> +	caps->nr_cntr = FIELD_GET(TRCIDR5_NUMCNTR_MASK, etmidr5);
>   
>   	coresight_clear_self_claim_tag_unlocked(csa);
>   	etm4_cs_lock(drvdata, csa);
> @@ -1691,7 +1701,7 @@ static int etm4_get_next_comparator(struct etmv4_drvdata *drvdata, u32 type)
>   	 * nr_addr_cmp holds the number of comparator _pair_, so time 2
>   	 * for the total number of comparators.
>   	 */
> -	nr_comparator = drvdata->nr_addr_cmp * 2;
> +	nr_comparator = drvdata->caps.nr_addr_cmp * 2;
>   
>   	/* Go through the tally of comparators looking for a free one. */
>   	while (index < nr_comparator) {
> @@ -1869,6 +1879,7 @@ static int etm4_dying_cpu(unsigned int cpu)
>   static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   {
>   	int i, ret = 0;
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_save_state *state;
>   	struct coresight_device *csdev = drvdata->csdev;
>   	struct csdev_access *csa;
> @@ -1905,57 +1916,57 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   
>   	state = drvdata->save_state;
>   
> -	if (drvdata->nr_pe)
> +	if (caps->nr_pe)
>   		state->trcprocselr = etm4x_read32(csa, TRCPROCSELR);
>   	state->trcconfigr = etm4x_read32(csa, TRCCONFIGR);
>   	state->trcauxctlr = etm4x_read32(csa, TRCAUXCTLR);
>   	state->trceventctl0r = etm4x_read32(csa, TRCEVENTCTL0R);
>   	state->trceventctl1r = etm4x_read32(csa, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> +	if (caps->stallctl)
>   		state->trcstallctlr = etm4x_read32(csa, TRCSTALLCTLR);
>   	state->trctsctlr = etm4x_read32(csa, TRCTSCTLR);
>   	state->trcsyncpr = etm4x_read32(csa, TRCSYNCPR);
>   	state->trcccctlr = etm4x_read32(csa, TRCCCCTLR);
>   	state->trcbbctlr = etm4x_read32(csa, TRCBBCTLR);
>   	state->trctraceidr = etm4x_read32(csa, TRCTRACEIDR);
> -	if (drvdata->q_filt)
> +	if (caps->q_filt)
>   		state->trcqctlr = etm4x_read32(csa, TRCQCTLR);
>   
>   	state->trcvictlr = etm4x_read32(csa, TRCVICTLR);
>   	state->trcviiectlr = etm4x_read32(csa, TRCVIIECTLR);
>   	state->trcvissctlr = etm4x_read32(csa, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> +	if (caps->nr_pe_cmp)
>   		state->trcvipcssctlr = etm4x_read32(csa, TRCVIPCSSCTLR);
>   
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +	for (i = 0; i < caps->nrseqstate - 1; i++)
>   		state->trcseqevr[i] = etm4x_read32(csa, TRCSEQEVRn(i));
>   
> -	if (drvdata->nrseqstate) {
> +	if (caps->nrseqstate) {
>   		state->trcseqrstevr = etm4x_read32(csa, TRCSEQRSTEVR);
>   		state->trcseqstr = etm4x_read32(csa, TRCSEQSTR);
>   	}
>   
> -	if (drvdata->numextinsel)
> +	if (caps->numextinsel)
>   		state->trcextinselr = etm4x_read32(csa, TRCEXTINSELR);
>   
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		state->trccntrldvr[i] = etm4x_read32(csa, TRCCNTRLDVRn(i));
>   		state->trccntctlr[i] = etm4x_read32(csa, TRCCNTCTLRn(i));
>   		state->trccntvr[i] = etm4x_read32(csa, TRCCNTVRn(i));
>   	}
>   
>   	/* Resource selector pair 0 is reserved */
> -	for (i = 2; i < drvdata->nr_resource * 2; i++)
> +	for (i = 2; i < caps->nr_resource * 2; i++)
>   		state->trcrsctlr[i] = etm4x_read32(csa, TRCRSCTLRn(i));
>   
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		state->trcssccr[i] = etm4x_read32(csa, TRCSSCCRn(i));
>   		state->trcsscsr[i] = etm4x_read32(csa, TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			state->trcsspcicr[i] = etm4x_read32(csa, TRCSSPCICRn(i));
>   	}
>   
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> +	for (i = 0; i < caps->nr_addr_cmp * 2; i++) {
>   		state->trcacvr[i] = etm4x_read64(csa, TRCACVRn(i));
>   		state->trcacatr[i] = etm4x_read64(csa, TRCACATRn(i));
>   	}
> @@ -1967,23 +1978,23 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   	 * unit") of ARM IHI 0064D.
>   	 */
>   
> -	for (i = 0; i < drvdata->numcidc; i++)
> +	for (i = 0; i < caps->numcidc; i++)
>   		state->trccidcvr[i] = etm4x_read64(csa, TRCCIDCVRn(i));
>   
> -	for (i = 0; i < drvdata->numvmidc; i++)
> +	for (i = 0; i < caps->numvmidc; i++)
>   		state->trcvmidcvr[i] = etm4x_read64(csa, TRCVMIDCVRn(i));
>   
>   	state->trccidcctlr0 = etm4x_read32(csa, TRCCIDCCTLR0);
> -	if (drvdata->numcidc > 4)
> +	if (caps->numcidc > 4)
>   		state->trccidcctlr1 = etm4x_read32(csa, TRCCIDCCTLR1);
>   
>   	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
> -	if (drvdata->numvmidc > 4)
> +	if (caps->numvmidc > 4)
>   		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
>   
>   	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
>   
> -	if (!drvdata->skip_power_up)
> +	if (!caps->skip_power_up)
>   		state->trcpdcr = etm4x_read32(csa, TRCPDCR);
>   
>   	/* wait for TRCSTATR.IDLE to go up */
> @@ -2000,7 +2011,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   	 * potentially save power on systems that respect the TRCPDCR_PU
>   	 * despite requesting software to save/restore state.
>   	 */
> -	if (!drvdata->skip_power_up)
> +	if (!caps->skip_power_up)
>   		etm4x_relaxed_write32(csa, (state->trcpdcr & ~TRCPDCR_PU),
>   				      TRCPDCR);
>   out:
> @@ -2027,6 +2038,7 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>   static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   {
>   	int i;
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_save_state *state = drvdata->save_state;
>   	struct csdev_access *csa = &drvdata->csdev->access;
>   
> @@ -2036,77 +2048,77 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>   	etm4_cs_unlock(drvdata, csa);
>   	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>   
> -	if (drvdata->nr_pe)
> +	if (caps->nr_pe)
>   		etm4x_relaxed_write32(csa, state->trcprocselr, TRCPROCSELR);
>   	etm4x_relaxed_write32(csa, state->trcconfigr, TRCCONFIGR);
>   	etm4x_relaxed_write32(csa, state->trcauxctlr, TRCAUXCTLR);
>   	etm4x_relaxed_write32(csa, state->trceventctl0r, TRCEVENTCTL0R);
>   	etm4x_relaxed_write32(csa, state->trceventctl1r, TRCEVENTCTL1R);
> -	if (drvdata->stallctl)
> +	if (caps->stallctl)
>   		etm4x_relaxed_write32(csa, state->trcstallctlr, TRCSTALLCTLR);
>   	etm4x_relaxed_write32(csa, state->trctsctlr, TRCTSCTLR);
>   	etm4x_relaxed_write32(csa, state->trcsyncpr, TRCSYNCPR);
>   	etm4x_relaxed_write32(csa, state->trcccctlr, TRCCCCTLR);
>   	etm4x_relaxed_write32(csa, state->trcbbctlr, TRCBBCTLR);
>   	etm4x_relaxed_write32(csa, state->trctraceidr, TRCTRACEIDR);
> -	if (drvdata->q_filt)
> +	if (caps->q_filt)
>   		etm4x_relaxed_write32(csa, state->trcqctlr, TRCQCTLR);
>   
>   	etm4x_relaxed_write32(csa, state->trcvictlr, TRCVICTLR);
>   	etm4x_relaxed_write32(csa, state->trcviiectlr, TRCVIIECTLR);
>   	etm4x_relaxed_write32(csa, state->trcvissctlr, TRCVISSCTLR);
> -	if (drvdata->nr_pe_cmp)
> +	if (caps->nr_pe_cmp)
>   		etm4x_relaxed_write32(csa, state->trcvipcssctlr, TRCVIPCSSCTLR);
>   
> -	for (i = 0; i < drvdata->nrseqstate - 1; i++)
> +	for (i = 0; i < caps->nrseqstate - 1; i++)
>   		etm4x_relaxed_write32(csa, state->trcseqevr[i], TRCSEQEVRn(i));
>   
> -	if (drvdata->nrseqstate) {
> +	if (caps->nrseqstate) {
>   		etm4x_relaxed_write32(csa, state->trcseqrstevr, TRCSEQRSTEVR);
>   		etm4x_relaxed_write32(csa, state->trcseqstr, TRCSEQSTR);
>   	}
> -	if (drvdata->numextinsel)
> +	if (caps->numextinsel)
>   		etm4x_relaxed_write32(csa, state->trcextinselr, TRCEXTINSELR);
>   
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		etm4x_relaxed_write32(csa, state->trccntrldvr[i], TRCCNTRLDVRn(i));
>   		etm4x_relaxed_write32(csa, state->trccntctlr[i], TRCCNTCTLRn(i));
>   		etm4x_relaxed_write32(csa, state->trccntvr[i], TRCCNTVRn(i));
>   	}
>   
>   	/* Resource selector pair 0 is reserved */
> -	for (i = 2; i < drvdata->nr_resource * 2; i++)
> +	for (i = 2; i < caps->nr_resource * 2; i++)
>   		etm4x_relaxed_write32(csa, state->trcrsctlr[i], TRCRSCTLRn(i));
>   
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		etm4x_relaxed_write32(csa, state->trcssccr[i], TRCSSCCRn(i));
>   		etm4x_relaxed_write32(csa, state->trcsscsr[i], TRCSSCSRn(i));
>   		if (etm4x_sspcicrn_present(drvdata, i))
>   			etm4x_relaxed_write32(csa, state->trcsspcicr[i], TRCSSPCICRn(i));
>   	}
>   
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> +	for (i = 0; i < caps->nr_addr_cmp * 2; i++) {
>   		etm4x_relaxed_write64(csa, state->trcacvr[i], TRCACVRn(i));
>   		etm4x_relaxed_write64(csa, state->trcacatr[i], TRCACATRn(i));
>   	}
>   
> -	for (i = 0; i < drvdata->numcidc; i++)
> +	for (i = 0; i < caps->numcidc; i++)
>   		etm4x_relaxed_write64(csa, state->trccidcvr[i], TRCCIDCVRn(i));
>   
> -	for (i = 0; i < drvdata->numvmidc; i++)
> +	for (i = 0; i < caps->numvmidc; i++)
>   		etm4x_relaxed_write64(csa, state->trcvmidcvr[i], TRCVMIDCVRn(i));
>   
>   	etm4x_relaxed_write32(csa, state->trccidcctlr0, TRCCIDCCTLR0);
> -	if (drvdata->numcidc > 4)
> +	if (caps->numcidc > 4)
>   		etm4x_relaxed_write32(csa, state->trccidcctlr1, TRCCIDCCTLR1);
>   
>   	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
> -	if (drvdata->numvmidc > 4)
> +	if (caps->numvmidc > 4)
>   		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
>   
>   	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
>   
> -	if (!drvdata->skip_power_up)
> +	if (!caps->skip_power_up)
>   		etm4x_relaxed_write32(csa, state->trcpdcr, TRCPDCR);
>   
>   	/*
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> index e9eeea6240d5..3d5f343130bd 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-sysfs.c
> @@ -62,8 +62,9 @@ static ssize_t nr_pe_cmp_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_pe_cmp;
> +	val = caps->nr_pe_cmp;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_pe_cmp);
> @@ -74,8 +75,9 @@ static ssize_t nr_addr_cmp_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_addr_cmp;
> +	val = caps->nr_addr_cmp;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_addr_cmp);
> @@ -86,8 +88,9 @@ static ssize_t nr_cntr_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_cntr;
> +	val = caps->nr_cntr;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_cntr);
> @@ -98,8 +101,9 @@ static ssize_t nr_ext_inp_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_ext_inp;
> +	val = caps->nr_ext_inp;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_ext_inp);
> @@ -110,8 +114,9 @@ static ssize_t numcidc_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->numcidc;
> +	val = caps->numcidc;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(numcidc);
> @@ -122,8 +127,9 @@ static ssize_t numvmidc_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->numvmidc;
> +	val = caps->numvmidc;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(numvmidc);
> @@ -134,8 +140,9 @@ static ssize_t nrseqstate_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nrseqstate;
> +	val = caps->nrseqstate;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nrseqstate);
> @@ -146,8 +153,9 @@ static ssize_t nr_resource_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_resource;
> +	val = caps->nr_resource;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_resource);
> @@ -158,8 +166,9 @@ static ssize_t nr_ss_cmp_show(struct device *dev,
>   {
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   
> -	val = drvdata->nr_ss_cmp;
> +	val = caps->nr_ss_cmp;
>   	return scnprintf(buf, PAGE_SIZE, "%#lx\n", val);
>   }
>   static DEVICE_ATTR_RO(nr_ss_cmp);
> @@ -171,6 +180,7 @@ static ssize_t reset_store(struct device *dev,
>   	int i;
>   	unsigned long val;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	if (kstrtoul(buf, 16, &val))
> @@ -200,7 +210,7 @@ static ssize_t reset_store(struct device *dev,
>   	config->stall_ctrl = 0x0;
>   
>   	/* Reset trace synchronization period  to 2^8 = 256 bytes*/
> -	if (drvdata->syncpr == false)
> +	if (caps->syncpr == false)
>   		config->syncfreq = 0x8;
>   
>   	/*
> @@ -209,7 +219,7 @@ static ssize_t reset_store(struct device *dev,
>   	 * each trace run.
>   	 */
>   	config->vinst_ctrl = FIELD_PREP(TRCVICTLR_EVENT_MASK, 0x01);
> -	if (drvdata->nr_addr_cmp > 0) {
> +	if (caps->nr_addr_cmp > 0) {
>   		config->mode |= ETM_MODE_VIEWINST_STARTSTOP;
>   		/* SSSTATUS, bit[9] */
>   		config->vinst_ctrl |= TRCVICTLR_SSSTATUS;
> @@ -223,7 +233,7 @@ static ssize_t reset_store(struct device *dev,
>   	config->vipcssctlr = 0x0;
>   
>   	/* Disable seq events */
> -	for (i = 0; i < drvdata->nrseqstate-1; i++)
> +	for (i = 0; i < caps->nrseqstate-1; i++)

from checkpatch:
CHECK: spaces preferred around '-'
     coresight-etm4x-sysfs.c:236: caps->nrseqstate-1

>   		config->seq_ctrl[i] = 0x0;
>   	config->seq_rst = 0x0;
>   	config->seq_state = 0x0;
> @@ -232,38 +242,38 @@ static ssize_t reset_store(struct device *dev,
>   	config->ext_inp = 0x0;
>   
>   	config->cntr_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_cntr; i++) {
> +	for (i = 0; i < caps->nr_cntr; i++) {
>   		config->cntrldvr[i] = 0x0;
>   		config->cntr_ctrl[i] = 0x0;
>   		config->cntr_val[i] = 0x0;
>   	}
>   
>   	config->res_idx = 0x0;
> -	for (i = 2; i < 2 * drvdata->nr_resource; i++)
> +	for (i = 2; i < 2 * caps->nr_resource; i++)
>   		config->res_ctrl[i] = 0x0;
>   
>   	config->ss_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_ss_cmp; i++) {
> +	for (i = 0; i < caps->nr_ss_cmp; i++) {
>   		config->ss_ctrl[i] = 0x0;
>   		config->ss_pe_cmp[i] = 0x0;
>   	}
>   
>   	config->addr_idx = 0x0;
> -	for (i = 0; i < drvdata->nr_addr_cmp * 2; i++) {
> +	for (i = 0; i < caps->nr_addr_cmp * 2; i++) {
>   		config->addr_val[i] = 0x0;
>   		config->addr_acc[i] = 0x0;
>   		config->addr_type[i] = ETM_ADDR_TYPE_NONE;
>   	}
>   
>   	config->ctxid_idx = 0x0;
> -	for (i = 0; i < drvdata->numcidc; i++)
> +	for (i = 0; i < caps->numcidc; i++)
>   		config->ctxid_pid[i] = 0x0;
>   
>   	config->ctxid_mask0 = 0x0;
>   	config->ctxid_mask1 = 0x0;
>   
>   	config->vmid_idx = 0x0;
> -	for (i = 0; i < drvdata->numvmidc; i++)
> +	for (i = 0; i < caps->numvmidc; i++)
>   		config->vmid_val[i] = 0x0;
>   	config->vmid_mask0 = 0x0;
>   	config->vmid_mask1 = 0x0;
> @@ -297,6 +307,7 @@ static ssize_t mode_store(struct device *dev,
>   {
>   	unsigned long val, mode;
>   	struct etmv4_drvdata *drvdata = dev_get_drvdata(dev->parent);
> +	const struct etmv4_caps *caps = &drvdata->caps;
>   	struct etmv4_config *config = &drvdata->config;
>   
>   	if (kstrtoul(buf, 16, &val))
> @@ -305,7 +316,7 @@ static ssize_t mode_store(struct device *dev,
>   	raw_spin_lock(&drvdata->spinlock);
>   	config->mode = val & ETMv4_MODE_ALL;
>   
> -	if (drvdata->instrp0 == true) {
> +	if (caps->instrp0 == true) {

find so many foo == true && foo == false formats from legacy codes.
I think it's worth to change all to if (foo) && if (!foo) ?

example here,

if (caps->instrp0)

>   		/* start by clearing instruction P0 field */
>   		config->cfg  &= ~TRCCONFIGR_INSTP0_LOAD_STORE;
>   		if (config->mode & ETM_MODE_LOAD)
> @@ -323,45 +334,45 @@ static ssize_t mode_store(struct device *dev,
>   	}
>   
>   	/* bit[3], Branch broadcast mode */
> -	if ((config->mode & ETM_MODE_BB) && (drvdata->trcbb == true))
> +	if ((config->mode & ETM_MODE_BB) && (caps->trcbb == true))
>   		config->cfg |= TRCCONFIGR_BB;

<...>

> @@ -1037,46 +1081,11 @@ struct etmv4_drvdata {
>   	raw_spinlock_t			spinlock;
>   	int				cpu;
>   	u8				arch;
> -	u8				nr_pe;
> -	u8				nr_pe_cmp;
> -	u8				nr_addr_cmp;
> -	u8				nr_cntr;
> -	u8				nr_ext_inp;
> -	u8				numcidc;
> -	u8				numextinsel;
> -	u8				numvmidc;
> -	u8				nrseqstate;
> -	u8				nr_event;
> -	u8				nr_resource;
> -	u8				nr_ss_cmp;
> +	struct etmv4_caps 		caps;

reported by checkpatch:
WARNING: please, no space before tabs

Thanks,
Jie

>   	u8				trcid;
> -	u8				trcid_size;
> -	u8				ts_size;
> -	u8				ctxid_size;
> -	u8				vmid_size;
> -	u8				ccsize;
> -	u16				ccitmin;
> -	u8				s_ex_level;
> -	u8				ns_ex_level;
> -	u8				q_support;
> -	u8				os_lock_model;
>   	bool				sticky_enable : 1;
>   	bool				boot_enable : 1;
>   	bool				os_unlock : 1;
> -	bool				instrp0 : 1;
> -	bool				q_filt : 1;
> -	bool				trcbb : 1;
> -	bool				trccond : 1;
> -	bool				retstack : 1;
> -	bool				trccci : 1;
> -	bool				trc_error : 1;
> -	bool				syncpr : 1;
> -	bool				stallctl : 1;
> -	bool				sysstall : 1;
> -	bool				nooverflow : 1;
> -	bool				atbtrig : 1;
> -	bool				lpoverride : 1;
> -	bool				skip_power_up : 1;
>   	bool				paused : 1;
>   	u64				trfcr;
>   	struct etmv4_config		config;


