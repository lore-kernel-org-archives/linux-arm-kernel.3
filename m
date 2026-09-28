Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D3D1C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=; b=ABQcpCaUZbJ5X02REsQuPCLPex
	ty0zcAx7JxaeJ2B5qEkFz9+uzPv0EeC1b2SDN9ZpuAADD2dkMIcZNO9vnmJrLZEBLoXbu3aENJEM8
	XIhAaDsD86vZM21COAl/+gZiIabcgploEewPkhnoE6IPVdxFml11cXjgcXA1S7HBAQNeOetQmN+2/
	XqzfMLE55faXBqi/psxE7l4t2a5idVs4M9miJF/D5tv2mzjF5bEIrQanW8b9xhRtlgU3WGM8K7PZ2
	RBrwiBinmAS/neTI4jKh3I5A3PrY6pDmU9plUnDszKpZ+Y0PE4cTY96MXbVk0vq1ok3o8I6VZrfoK
	cvIXNNlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6jc-000000005Yq-1ono;
	Mon, 28 Sep 2026 08:29:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB6jZ-000000005YJ-2jR5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 08:29:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S7xN4a136937
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=; b=S8yjOfErmuAJa5CK
	zD/oYuaxlC2z5L8x1I+46O/EV1d3ZFTl2c8Zt9QXrH2cv3eDSgzDexM8i9MPch2H
	sEUqS4OUPXth5hYsQILK5DMZNxnvWgBWekW8nW3lVEj47DcqYWxHqG/QGwsmd+lb
	i85dIjnqb/PeLaph6alUKJs0MSKBx+SbjvV1+ZI+zbX/21WmT5N8DiiMTJqLGLzf
	GxveJ/zbuLAE4nOFUr8KT0L/00KzbyWwAeM5eP3H97qhAnWnsbJVXdAm30vVxvkr
	Ka2IQ186TNnQmu48dnlM3YNmpqfCo7oVGctyEECH3/6tCuc6Ko0Hn/mgywEIdKlO
	hRg2TA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq17w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 08:29:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e82060977so532513985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790584152; x=1791188952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=IE4j00YNfDga+C8JiqNDrfLP8qiJ76PfpQiq6GyrmiE4bv5GfcCeDMYDn1pqwQNdr8
         36cpr+k+VhGPC0TFFxOq64NqddyXJJ2KxkxfANOeao2+XbxkEtFcJG/i9wBcfL2TNBk8
         o+Tfkl/2ffurtSitBTkTmaGsdbK8l9SRHZeKW4iyxUFm7k3nBaDM6tnj+pFwMe6La778
         kTe1ra8XLOxzIbX0yC/mFsGhL+2XHe5XSpWcPNBuQIUilc/sYXg1xIm1nuGSkgMyB3sb
         eX+HNaIC2FktgrTc019I9J8m2JKRxaeZ6a8qIAr/FR9deDv+JbnyMKM14fwateRQ2Fk3
         OejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584152; x=1791188952;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JFAq/53iLi0CBXhyAhNHZWKRxRPK6TLgqMDB54xLcNw=;
        b=uY2x4nwBqpwyqj8Alb0HPBt9wxV8ulehPAT/YfzKLp7MLmwz+a8ixOpkvz6gNlJxS4
         fqugxKjE+dw3g06MMH4+fHr0ttQzc2XjPZLIAMr7kf3PJxDiXAXy14f7/bPI3GQpiXXa
         Ap3cde7cOHQL1A48vlYp5XFBWYjA08kOT7YMtXfsU9AyqDEynUooieuJbR/NDLnmZml8
         JRo0+ZtiB1nSLT2+uK5RlQYP5cyPjlVW/1QmGUgi4fXRzroEG1hYf2J0luFV7DQmQ2Eq
         Y9oveSME0T/cD0CvD3d5WxfFmtMC67aYgwD1LZ/i0FBQtj0vy5x3zVU4Ac9HzEfN2MY2
         8drA==
X-Forwarded-Encrypted: i=1; AKwUvByR/wRwOOiQjtRt9KZsWIFJyfFO/G//eUHmEBGOQGb4pWyZsOBiNEO7sMFcQLdgmniMivG+q/vDqCDmFPxZG7Bp@lists.infradead.org
X-Gm-Message-State: AFuF++k8zTjrZeQVAGTLnljKHjojBsTBdG3BUiKc2L4+v12ryPLrVCmy
	sx22uIGRlJqoiLh/GgQvqO9vRN7PWoZhROesqLeI9aLGM8/QmtYvWA1NwQEngOSRk3Ge23SKKle
	Aexp9tMvmfjxoicOdX6+UUg543Gx3aLbdFlYqd9kA3dcmvS3JAqgDM8Sw34Mot8+Ecz22paaLFq
	cxGQ==
X-Gm-Gg: AYBFou3Hf9URqfbPQ0gQlY25521d/FNX73wGAw7dZUCcQmuBirJayHoOdti7oqrQ3E6
	DUyCj9tlnqDucrpXDnQFdtAZZ5rEn6aYhNulnU47mklvfjx5U62yyToUO9X5Bnq1X1gjKJJnbu0
	Q9+wBQcOXWDf1Bc+on/yO1bchgVCQDYG1648ZkF/D2TozzywGz+tS2TWpfRpd3iDgag/L6fpOuq
	KjhgSBRDftNdNj8ak3JmpcnZjzsXfWeNirNvoA6UZa4Z7zyD1TCr+0OMTvX1f5ApnLI650Vg/xA
	q5tRSe8yJon6pVwEnuJb33gi+bBE84NJYW1DnCN/0MDpJNQ4oHq+zSSqMzfEQ9HylfH64DydK6y
	HeCElVYB++/ejzFKkCrdZ4+mjLlA=
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928793285a.5.1790584152191;
        Mon, 28 Sep 2026 01:29:12 -0700 (PDT)
X-Received: by 2002:a05:620a:6409:b0:93c:6450:9cec with SMTP id af79cd13be357-93c6450c36bmr928790585a.5.1790584151713;
        Mon, 28 Sep 2026 01:29:11 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d5f4:8a0a:ffd4:396a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001922102sm125209615e9.15.2026.09.28.01.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:29:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: xilinx: fix runtime PM leak on request error path
Date: Mon, 28 Sep 2026 10:29:07 +0200
Message-ID: <179058414451.16214.2667543002075189333.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
References: <20260923113905.1409290-1-khurana.ridham222@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 9a8S72QeH_LH3FwRXDTxboOBKF4AN1OS
X-Proofpoint-GUID: 9a8S72QeH_LH3FwRXDTxboOBKF4AN1OS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfXyUsDVJwyjY9Q
 a2aKnu2RW1L5+SVrCrbR+/LCaLBiIcgn9I1yeWAlvozx72WtGyQ8pcg9JYL0kJlGcrUDjv+YaCL
 ZamIlZdjptJskx8h52v2Ghhqf63JthQ=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba2559 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-tgoi-CBN2K4obTd82YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzMyBTYWx0ZWRfX40HyP+WyvgfS
 yRXtowJXFYWnXvl4M4zhCkQlFSONroAQ38hsuRakTuAbWzuzCd40w45bOVgoanEPMP7IEDP/VGI
 ihVRjdtZpNy9aXRqR+7kKIUUqrtMWwGm5Ieb8Sds5vk1ES7KcaPIpOic1H2lh8yaduKv/kVl/r1
 S2cYUDxp+A5/pkIkQE1t90siTHaZjpdzHc/C5MybmZW0T5edk4zF63+BX/pSrYosKlV766J9xTV
 4bpXmM1GfRQrUWPrasvSwuHJzX95UsF/If6i2yfXmNMeEJLlD32hnTX/SHO8E1t5IBdLyStBUE4
 eWboDiW3N0D2ejfalzQtwZrI3/1U21yMW8nUaAy58HMwlP2JMT/PJDpTR7yMUKXfhscYigGIora
 OGZ7bAMUbVgF4l2j/bT3YQ8kNx2IcbUHjBGh535PQDxajnsvk5SsotWFvMoBqpsWANRswb+ezpS
 kQW66MnGefFnl01T8nQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_012913_700754_3DD89632 
X-CRM114-Status: GOOD (  12.55  )
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


On Wed, 23 Sep 2026 11:39:02 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and xgpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so xgpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: xilinx: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/ff82fc3a4a1d417dee1229681cc5285986edb1fa

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

