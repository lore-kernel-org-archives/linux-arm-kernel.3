Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8634AC88E4C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 00:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2yMCv/IeveZIRpMaqplxaIqOiiEtohcRWE/XMtqizo=; b=NgGvk4glD41RVnZVdETFFgDk3Q
	Jos0ne3bmi1ZFBYuiUG6AWeBgGoP+Diea1hXAHJ29wbySBXeodgY5sAc1TCCtD2Z7gs1z/NNJQhWr
	bS5zWbrfDYuyrvWPLynhMp6EkpjE0byqBpGpavHpslRaFdT4D9VqNDjujwmEN4no0rNVxNjW1Ku7J
	BRw5q40hFNPQPzKmnYgZV06AMH16BUHU0AvJrOS8KZqUHkpWQzmq4ANLGTLluivI8aMoMr6bxtFDY
	nFQAb8agb+5v4W14uiKiG8hfwnVYs8R6NYIce5sgSKMMhaMpfuBh4pHa+iy4HPLEVGD2e5i1DNTPg
	Bacu0eAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oua-0000000FboG-3k0q;
	Fri, 11 Sep 2026 00:14:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ouU-0000000Fbl4-48Gt
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Sep 2026 00:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+2yMCv/IeveZIRpMaqplxaIqOiiEtohcRWE/XMtqizo=; b=pg2G3YK4C5riNW8WqEJE0KwnEP
	P/4LeZo/Sr26PxxxGbEtfA/fmWUEMz1jJl1Vmgc1ldJ24aAFRrUutU3YPZpQHYedKzhveHnfPt8xR
	GO695TcgkyRUtI6ekhfi1ff8af+7UtIVXbMAlqPYk4QNbY+vWMX397bVHT07ldyXlUTwC9mMrI2ZF
	5D6hkhB5HZj0KKwBfas7sJEkT4NpDQXZRk7i2gddiKyRy+g6SmCayGEJxXMVgFIm75TUW9hbJGy/W
	WuUkSEbdIH6J5xe43IDBvY1SGcXlh/ZLG/A3ZX3Bu4qnDbbOv4ZyBE5d8fBAI37kaEfWy+P02xNhg
	BNkBmMUQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4ouR-000000035gF-2l4K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 00:14:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AMowbX2676753;
	Fri, 11 Sep 2026 00:14:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2yMCv/IeveZIRpMaqplxaIqOiiEtohcRWE/XMtqizo=; b=iptK1Xc+U7jZ7NW3
	hV3+mhl7IukWoNUfPY0I5bI+8HY0q2xURP5JCX/YJ8TnpnLoPCcbHUW4bYLgbdhD
	3Urf5hZvDMi4MwyH60jaQJe1Fxc7LSdc7PWuWsowMWHuVR58pIvoiftFvn911We9
	FaS8qcxeDQoarvy+0DE8iqDE4IXrQSZLxoiuWW9Y/X0gBZeVxmL7RetmnKPURpri
	zJtClDV6U3PAlTKisCLC0llVJE6y4SeR3StVWrRYiJrs0J1qBh13mywOYTgAC9an
	vG4f2LPlfDGy9oOl23F7NLXwid6emL7p3p6SeJ2t6xJllHFqt7gC/1reo3Y1+nd8
	vJcNWg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q407hd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:09 +0000 (GMT)
Received: from pps.filterd (nalasppmta01.qualcomm.com [127.0.0.1])
	by NALASPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 68B0E9be2566639;
	Fri, 11 Sep 2026 00:14:09 GMT
Received: from hu-devc-lv-u24-a.qualcomm.com (hu-jcameron-lv.qualcomm.com [10.81.84.69])
	by NALASPPMTA01.qualcomm.com (PPS) with ESMTPS id 68B0E8NY2566591
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 11 Sep 2026 00:14:08 +0000 (GMT)
Received: from hu-jcameron-lv.qualcomm.com (localhost [127.0.0.1])
	by hu-devc-lv-u24-a.qualcomm.com (Postfix) with ESMTP id 32D4C24D08;
	Thu, 10 Sep 2026 17:14:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 11/15] iommu/arm-smmu-v3: Discard partial PRI faults
 on PRIQ overflow
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com,
        Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, joro@8bytes.org,
        bhelgaas@google.com, praan@google.com, kevin.tian@intel.com,
        kees@kernel.org, smostafa@google.com, baolu.lu@linux.intel.com,
        Jean-Philippe Brucker <jpb@kernel.org>,
        Eric Auger <eric.auger@redhat.com>,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        skaestle@nvidia.com, mmarrid@nvidia.com, skolothumtho@nvidia.com,
        bbiber@nvidia.com, harsha.v@oss.qualcomm.com
In-Reply-To: <1c274d8836e59c549130170d5794d22e9b8c7d7a.1789081084.git.nicolinc@nvidia.com>
References: <cover.1789081084.git.nicolinc@nvidia.com>
 <1c274d8836e59c549130170d5794d22e9b8c7d7a.1789081084.git.nicolinc@nvidia.com>
Date: Thu, 10 Sep 2026 17:14:05 -0700
Message-Id: <178908564507.2841562.2353413729337908028.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: COarsFRozZSHn0b7CCxkSRcRipXD5gWB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX5zHRmsVYGgSQ
 T0qo+T7TXhxLea9WnqALxltsiP14bxfRS/Yi9iD+WucSJ0jJxdrAw2dP+mErtVleivUSI/aDhsc
 2cv9X6Sq4Be/0RPu060TyjvUjT7P/uU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDAwMSBTYWx0ZWRfX3FDCKjQ9LpUs
 wW3M5+JO2J+3ErnqQQ34r0doKodX4uxM5lHHMJ2OEjZyO4PIDlRiIsiPzwIEPRvTbatG3l/o53b
 ICe7gV8UlwKgCUJWHn7hjpaJxMTRtOTChY+xJkrEWOi5SByGFPgo55a+kG1i0EtsFfuyuSslN8d
 ZKdbB1d6d2C6vHLoVfJvaP8/cdrSXhIemN9JFP7C/0CJGjzpbBrGSSw+nhdypwUsscEAR3JxctH
 vzCgqNdKqvCluVESpd0x6WSxZKPaPVjhWDiz9Buk6F+wLuHyYEz0xRT7IWxllkpxOxbgbFNZLaN
 CWwwwIBU9Q4LObhJvF7jXIZFlVFFXJAbKh6mtcxn9s/pKc9HsUlyeMkOrRlIUKx6bBXig4yoPDs
 RtblJuCkvwJwR47dzrqImKIlkE1WZ/XZmoRbvZyJyAkZ/+/DKqqoDmVNgZM9JVh3v5OSrqXqeun
 U6cd/4ZEbJmTs77e8rQ==
X-Proofpoint-ORIG-GUID: COarsFRozZSHn0b7CCxkSRcRipXD5gWB
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa347d1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=9AJO0qswdzV_ezoDFsIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_07,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_011428_158643_B700D0C8 
X-CRM114-Status: GOOD (  11.72  )
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

> On PRIQ overflow, partial requests stored via report_partial_fault() whose
> LAST-page entry was lost stay in iopf_param->partial. Drop them by calling
> iopf_queue_discard_partial(), matching intel-iommu's handling.
> 
> Do it only after the queue is fully drained, since the visible entries all
> precede the loss point: a group whose LAST-page entry is still in the queue
> gets assembled before the discard, rather than losing its stored partials
> to it.
> 
> Nothing can arrive in between, as an active overflow inhibits new entries
> from being written to the PRI queue until a final CONS write acknowledges
> it (IHI0070 8.1).
> 
> Suggested-by: Harsha Vardhan V <harsha.v@oss.qualcomm.com>
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

-- 
Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

