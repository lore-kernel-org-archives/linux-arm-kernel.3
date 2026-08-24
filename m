Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB2EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=; b=kqCWgI8QyPFhL2MEyxjj6bgxjf
	FCzzFQzz+/DdzjIQ+jlgi8JqrtHxxD4mSHHjof09jjt5OSmL8GT4G1zV5gGAENCzT8gRODkYF7E8C
	MU4BNnCLos7oEJ4qZ1I3f8BopBYC3/A+DX1NOb4CfV4do6EutvMydKibSgsUoL/6JuOkVMVE1G6Hs
	CWWiME2WWMQkDuJgehWuB7WbwW9DI9G6sWnxTfNiHf9uCuf+wN2LG/PWyeSXnH1zrTg5E7/2lDNAp
	yleU1qe1DukkKatWWXY2pQlHT7hE6oc+ki4Xw9cRVExoo4DVu7ysnyzkVNvMweXH8bMvNs2K1FBGX
	p2Cm+e2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybNz-0000000HNAt-3Mmn;
	Mon, 24 Aug 2026 20:35:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybNx-0000000HNAB-1j2U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:35:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJH1Qs3914735
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:35:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=; b=QBqX2cXECxUzM1XJ
	WfAsxafAL+U8LEeWZY7aYFIKxDLTk4DcUmrnCyCoW58Pz5k3D3UlMkYAC0j67KJl
	7zPXbCweJtUkOaNOLlz0oVTXYJYkl+R7RMjJUJaO0gEtBVh7TauGUrG4XKUX/pTd
	7ShltVXv6/Yl1zUW+XyYWKRnIFE13cCXgbWIpYjE2U0ANx+SoM5cmX5LvEvjY8Sm
	XoCni4S81gqE10Sn2LpzgTRyGQSKeNoOxwqQt86klnZbOSg5WFLnGvFMiytKiszQ
	cmid8zGuAZu8JXpZSJVt1TiEyaw+JIPEwRHQirkaqr5HMBc9j5WIDA7A5uhQABIg
	v6RQrw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8pkdhutb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:35:12 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84859a64079so6358905b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787603711; x=1788208511; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=V3FjW9BeVfFIEjtXoIEuwMMbn7+4sxk5utAnCfnDmqRPhxcpSzSvhlkvSBWaNJwv9i
         GRDygzIFlYWcn7S0jXQNfK7wTN9v06LC98nnQ2Mwc9/P9FStYQqahJUorADpS0mkbVAk
         E+baUEWgwhFPdREtZggaIz5zy8rwC67eo+CSbNwb1p3mzQxQmGE+HwPxNnXV5BlT2Wr6
         t3TK2NmPJ6yL0VmJqAjDxXai4QBJbmlahcR0w3wP7ZM82sbXH70I1eMRTDu9V/PZ1ADO
         oF+Pbk4xA8Fo4iUx2jkZPfSJbSs6zXAfnSlpuCIbXDs00nUGG08uSiUMmIviovF/pGt/
         +QVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603711; x=1788208511;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qwb6Za5Jh+xtMbV4sA0pv+cTfOUaw+dS3gVnx/6DE8A=;
        b=ISeQ3jlN9psFAQOOKON74P76Da6RdnEMpu/Ma871LN3sW39K2nTLJoqvXV74bxxk+D
         uJupjvaH1Wq0chgvhZ1aWU6s5x2Q0cYQ5Mb6YiJ3sQTySc2c4UdJQoMMaArp9jomh9q+
         Makch7pOdhksjo64T3yZ+1u8XBIbQiBXIGykhLaLg2PyNYx0Ky6VuhX3TVvL75ETrtpk
         pfOUf9vCQITFSTC8iUysm7SkxFtbc9+bnM7Ykxji3HfiJApr3JkQG57hwtbJEjzOsJ96
         /inwtQWnGBAvP+VWXOv3tUPTC44Zdx54Cpj84yGzQIs4aJig9lQ0FSke+rSTd/cJYRrN
         oA1A==
X-Forwarded-Encrypted: i=1; AHgh+RrI1RYTgxLTMzgrRSaUbq3T1mCqJAwmvKg4azN029ZqCyuOD2kGq87d/JNofWofLdG014awiGQL1ecNPSgu4vMo@lists.infradead.org
X-Gm-Message-State: AFuF++mHfv5Iyikl3Uii5oxK18tHskpjKFDWY37bSl95AZQOd+Or/OaA
	rht58FJ8mgN7hK8ZPXnBwzZK4h2SiX6u7eaNMj8DKcy9p712xcH1eqwoNGFJQhAhBP3XNzyPAcG
	RXU5XBVLQ+3WVRFCMUH1RrcnHNCVZooX2lO9WBaQZzo8/bG8N9iElTA4UjJNajTd+FCVhErgMsd
	bYzQ==
X-Gm-Gg: AR+sD10FRsn95yMAjDiQmQASvA2hh6XKoRQQ59tRR2Fn87ASfNWmlFC/4zLuCOD+FQI
	jtXTOcBv1ms2uNhYhp0F9nPuLytO6D3UHktFUbmYxu13DrTcpyv5ywsGjCPtNDDNDqGQOLqbSv6
	+bUSb+Mmf1djzDieQifIwQR82yWrOPQex1pFzb38v8G1874gMYtof8aKXbKWEnHAF1iWLu1e76e
	+9h9k11C4UUwNnm1G59dZZlbd6n2Nq+JKRiV0HSOPp5CY7xCDY8itn8y4OgBDO7bQwiqPq+9HBa
	hkTeZiRHamCdvF42aLHQRJ26lOVFcSB3Nh9vMuXVZoXH4LP4FPKjZZ+toUPNkw2Ov6MfPbClsVF
	w6I1qTv/alptJPenT/f9EfHeV2w==
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771626637.18.1787603711130;
        Mon, 24 Aug 2026 13:35:11 -0700 (PDT)
X-Received: by 2002:a05:6a20:7292:b0:3b4:7e2d:a3c2 with SMTP id adf61e73a8af0-3cd301c72f7mr44771557637.18.1787603710735;
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418600535csm25139612c88.0.2026.08.24.13.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:35:10 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:35:06 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        arm-scmi@vger.kernel.org, linux-doc@vger.kernel.org,
        sudeep.holla@kernel.org, james.quinlan@broadcom.com,
        f.fainelli@gmail.com, vincent.guittot@linaro.org,
        etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
        d-gole@ti.com, jic23@kernel.org, elif.topuz@arm.com,
        lukasz.luba@arm.com, philip.radford@arm.com, david@kernel.org,
        souvik.chakravarty@arm.com, leitao@kernel.org, kas@kernel.org,
        puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v10 03/24] firmware: arm_scmi: Introduce protocol
 instance notifiers
Message-ID: <20260824133506.000053ed@oss.qualcomm.com>
In-Reply-To: <20260815232604.3730754-4-cristian.marussi@arm.com>
References: <20260815232604.3730754-1-cristian.marussi@arm.com>
	<20260815232604.3730754-4-cristian.marussi@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfX/3zszElKrsYd
 9hHGFpsMPu++ERiRsowJWS7tE+nOXVZ7csysWpsmi6Zs72LXYje1aF/nJoFZOO0RM3B6SCxjMUk
 mwtst6TnlijalsHT02YczOK5+5Wc2eQ=
X-Proofpoint-ORIG-GUID: rfToI2azijIBFgltY6VfbbtP1Eg6P6Uk
X-Proofpoint-GUID: rfToI2azijIBFgltY6VfbbtP1Eg6P6Uk
X-Authority-Analysis: v=2.4 cv=Kq19H2WN c=1 sm=1 tr=0 ts=6a8cab00 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=aGd6ziPyllhe5ofM85oA:9 a=CjuIK1q_8ugA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MyBTYWx0ZWRfX2njcOhW2yuhh
 8vJ4ZBOOcphIyrqEUYNtm+1v2KUBryRellffYhYg2S4tiDfZ2eZuN1XaFYFWuuwRVhMS3Toc/Zv
 48HfYjNkTTEt+2u/v/0ASNL/+ATifvYB332L0MMyUJdRK1Bqe6Q9TBj1bvgL8EiWcZBjxdWV6VQ
 LbnEE/1RWwV27Gyi66tsdBvqy8kmR2tY7/7G5jRNhdFsbgvm9F3gR1921fzn0YNN7FWvrG85cVG
 xqXaoZdFohmSTe1mNMinDY/KGKlG8TBQuJva2fLnFMRrgpITxadJtNRd3OV1N0MCCxtLcs3/51d
 Pqjfo6sx5xqCZ6YfeqyBWZc6n3O0Pt7cP81C1mWUt4Yg1b7xW+Iu2KoYXa/GQ3lIhivs0Sl1f3+
 N+4seuI9/WhEfN2/e1RjjQbwLAUPcUu8OJ7FXUzCqlbwivA2Ep0xiZo4Tg4trO8F8DbPBNQPGML
 dUGDkmiCJI3Ze1z2LnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_133513_570302_0272708C 
X-CRM114-Status: GOOD (  15.01  )
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

On Sun, 16 Aug 2026 00:25:43 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> SCMI Protocol notifications are typically used by SCMI drivers to detect
> and react to particular conditions: this was the assumption and the classic
> usage scenario upon which the SCMI notification framework was built.
> 
> Some protocols like Telemetry, though, could be interested in enabling and
> registering for such notifications: in such a scenario each initialized
> protocol instance could want to register a common protocol notifier.
> 
> In order to reuse the existing SCMI Notifications machinery, allow
> protocols themselves to register for their own notifications and provide
> their own notifier callbacks.
> 
> Each protocol, at the end of its initialization phase, can now provide one
> unique per-protocol-instance notifier block, which will be registered, by
> the core SCMI stack, on the related notification chain: such notifier will
> be automatically removed during the protocol de-initialization phase.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
I skipped a few versions but what you have now looks good to me.
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

