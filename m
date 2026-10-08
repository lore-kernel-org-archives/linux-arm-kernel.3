Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448E7CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=GQNMFaAFbsD+II/kWGwq5uNE9j
	IprMM+zkVt6BP8FLZ9ojDX60+9CrBfJD76VLVVl+pu0HhrUtEWeDiSfP0I8V8wLnj6XQp3dUHVUZL
	TeZ2Z06xqIe9KSEmnymhDJpAe2abaZBk4TMRGCMXohwLWNMe2M1h8ygu8YIupCmP3uBH7J5H0b3Qo
	0A8RaNVKsQejb004m30gZJZQBIM4k/Q8UElnVmBVmBzN54lAmT/Nj1wDUjeCDG6K/yZWEWB2kQLAv
	RPlkiz5HeQ/07da4D0f84v/FDmvTDhSBAx31ElfLzwl2nSdffpDnkBHo5T+wBn6v8Ji1bfGYyJHK2
	ArnbZI9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuh-00000003evi-3KcO;
	Thu, 08 Oct 2026 06:47:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuf-00000003eus-3QuS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:47:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXJn1157823
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=pck4sEtouPHply+j
	N4rqGchia3wA0pQadXpMbBUeZqsKdaVnQXkpJiq7/Uhvogo/0VbIcNACedUfB3tY
	1zGnNcXUNnE7hYFbKU+HCyw+p8q5VhpWb6+KylcZHGpKTquJwDl//J6q/CmN5C8N
	49s3yh6IrwMhqJcXgptFn96A2sP7uA3XLWU3C0roLx5R2AtiXLajIrVKrEj1HVhw
	h/gO178lgx6HTI5EaG/460XCHqcgWx/bCATgEYHWItlDttz4CONRtfoh13wuAyXl
	5DvBHmCQv6XXr4FXRCiGisUgfKiod9UPpqVyUDUlOBjvG35XOzWUebJPkmBMhKg3
	yZmGlA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51het-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:47:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3823dcc1647so3946937a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442053; x=1792046853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=VZ9V+GSaQ+9D7CHJAxBeMZ4d1CqdLUQsmlx+jANY+OM2fMNhKjBzhTbxGlYS8mYimv
         K6CnmKgfipubg6mulbFNFKwk8hAnInZLGwp0osOsIYh54n4CxtYw0+o50OSPxpw2jrcE
         gZDd2pqEB48a0+Cc651ITnFKqx2NS+OOpyKdaKQLv+7gDxPM8IrV6TX/E2M3uvpAiqE3
         eHR3gRp4Pogu2/fVmZ/KelcCgmoNC9CgyeGF+FdkXmgPgWSzejDDhK85Wyl/Y3Y0s0kG
         gv1QS7u4roBX2bA9qlRHjVJubVPL2EgWubnsFXWZxgIuNoVNZ4pvw+RefqUSVbt2Ko9S
         uPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442053; x=1792046853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=mUXG8pHLxfJ9pQgPfivv/1TU2XUbdHD2nHpKmaxnuGK7WHixdertWB5YllAEd221hJ
         JrvsAU7cbHj6C4Moch2o1WemNjUiXVV5Hqcjyghpv87vQTH+imAyv47iqyeJ2w+PZb/g
         ppqampHpPF8Aqlnkdo6M7iyX4ZjaY4g43c38W/6qs2XwAQsW3mmD/lIKNv82QiQw0sYP
         9jA96eWS1OCQoC7BO0LeOX8h3obUPaHVhZyu2ZVGIFzUfwrDtSbI5f6EJkQlbHYBuzvt
         Zl1jWOSvJi4OC3Kg9ZPWKXN+DKb8gwb4b1IcDTFpN50nk2P5vVIBFY6297EkDdnACSSR
         E+pw==
X-Forwarded-Encrypted: i=1; AKwUvBxHg+jHWf1/tjnQ5i3BXctgLRSOwMdXy8tU5LPWkunx/kylXFZ+BxzmHipO5o+gGadJPsryQ6i1dZ1MCKA4n/Ja@lists.infradead.org
X-Gm-Message-State: AFq9FYLd7EMyTHuXeH5oSH/rHfnm41qi1Le8hyZJJyVwBKcXmU2qd4xk
	2Ngq/+yScj68Xr9Wpd4jF1tgHXh/wWM1Ra+XXnBChpzUMretz6R8P7q2aHD+h0tE88L93Z9oaMn
	986JscNtUI44YvGPZRE/rZOJ2AqF1fZnXVgfEkdYDMuGg4DhGFVrxu9fd19GucWZF26E9euBZXf
	iPZA==
X-Gm-Gg: AYBFou0LLMrxjpkqniZDU7/V7gYQ/hfrZMIUERBKv6Ys5aa15Ei7y1Hgpx4it2s9Gh0
	7DpKY7w87omITcK0bk3ujlwpFFrCDc0gu0vVQ6BYWCa1reVtSSYYTReDuSo0UAbTaLK03pYla3w
	KGGBRKI1Qc5X1acsn0cubgtQnBcVWgtn+kDK3e+vUij5Z1+3gHHe7X6upuExGw7j3M0ZFz5VHt0
	LIaAVrPFZnzSPvz/f9UG+LJFYyCKzIt6SbwRm/MHyrQk65ZcbRq9+J5U94QDjU4POWQYaKBWLyJ
	MR7qh65DfZZRaxpXm9SKKaYB1SHkNqrcCXsWmVSdcsSTfhn5RSBJVdThE4rfNmcHpfs/xYb7PGc
	MP9BuA5e4AJnYUPVf80iBYaJtEz86OFZmWImVlBfGDK7HSrcozDxPyXY=
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138298a91.10.1791442052710;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138265a91.10.1791442052227;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:31 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:11 +0800
Subject: [PATCH v3 2/8] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-2-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442021; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=+oEui8TWP9g+43keyW0RGKQR6one1M7JZqzaByeLJ26nfwJu/nWDLI2OcGMGJDG+gftRieh+t
 2ePmuc/bBELDbzzZnDigIUCwoY0oUrx1oo5x6KBw/akurJKSrEEEgwy
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: RuaP29hWX7eRSgCdK8SwlMoQjc_urh_Z
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73c85 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX+TZ7F0oPJJKQ
 NJMFzYh+DXEN7L+oefB08QMUOMJkQcw682hEwnNFNQkWgfvtxYOaQYodwIUCtSIwQbwnG9cqFeM
 cgtCpSbrZWaLAvifdlvdxbTeVfmosow=
X-Proofpoint-GUID: RuaP29hWX7eRSgCdK8SwlMoQjc_urh_Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXxAoI6HUFsTfd
 U9WXSRu3dl640XoanZMQxy64brmF3VNIkut8GgEd+yBJdUl1J4TfqGDjTiCjfYOgyPuqs2CpeeU
 A1oi0C59fRZWGVq3v7JBnG31sivoVSwdGKaiHi0aOKyAlzBniL7AB84d7BBr/FngLDn8t5FQWTf
 tBFL95KTwayEs7SQwOZF2i3452jeyCx7LVkG0+JkK14ciXwm7wcsNOsyx6R1kAC6g3ZEwlJ49ru
 rGNYirtnZVvt9zQ5dM1kNxzqPAHdcUvEbFWRFA+e13lysWPTVfkPQCNJ2Ij6Jc97739lpP3VgiB
 L5aB1KdczCJgmzXrwT1CpeJqUUgDKHlJVR1h1Pea1NYpNC+Zkm7fBCBekeYryzMJlM7YPLTK9Nw
 lRmeWxJVeRKfr4uATu0W7AbDOamIlsToW3RDM8p6PDr99yC6gE3Y4RZ45Imem9dX20CcnGL8PcM
 //g0CE/eQZuLYbSPjXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234733_870842_C59CAA86 
X-CRM114-Status: GOOD (  17.95  )
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

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6da217abf689..c68135ee0ffc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1


