Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B378DCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=fRygP8luCU+WDroSPxqJt9YxHZ
	iUsCtTGoOvy4MuiPsZjcaVXifPSvIly2ZCmYg0WZYMRzr4I6w9MMjCJsR/xu6o8MUWBE1SGQBZODE
	hgXQhvgC+CoxFL1BRJYAn2SB9tMzucKVHJaU/JvsaoIpEtj05BFsIlsHQ5oEp25j19npCIOHNY0hC
	VZ1EazqXF8AqD6cQTXbtsNtZfCjJAmoZsBDDfqbLIqVU4B1rq+oSVo2z87DT6PIvlwrz5aqrHVhHo
	+xrt9P9+nWKl1xjz/lSfBs4BRmXW0mLUWjBG4MpizCTCt4OwJfwkHQn92iq6Hd4WUjQNzzUEIue+x
	ju4xG8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuy-00000003f2y-0jE6;
	Thu, 08 Oct 2026 06:47:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhuv-00000003f1g-3vrv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:47:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BWCG1157678
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=nllrtFmYxX0K4LxO
	opRde25RZOXQpTiWhKsra0U1rovwhlB2fBW0igQUgaWB2cxV3pVEH3pNKFhi8S5S
	8MlqNg+QqKVnoHbCRIP1ad7PJ+5B1lvgHCDhF3etz9STYjSaxLxJZ8UgUYTFf23w
	2lvpb8SICblKu2ZddsrCFFR6MGqq12ZD7uYMkAWXmccComSBfomwbTGjq6lPdGme
	MTDkRSMQJKu3h+ECr8GF0mntrKkZqOQ42s4r3ASZgsa615ZoEoxzCOdxneX+fIAn
	oP8Gs/et04veczNvi9y42zVjBfymkj7/IGr53XuoLqRz1N+dMWedeqMHDJDtP+8G
	UFMScA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51hg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:47:49 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso6246368a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442069; x=1792046869; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=MW/BO0wKJA4zmfbwKf1JnWk0PJQFq3DZ1repWy4j7w7nZbpCkzbXDak9kYlUncbWkd
         ZqUe2ufzYGLvsm1qauPw6k5Kv07QTqKdN1hRmgi2+VR7nZ+8k6amLHomk+wsh2mFDVlq
         30nQhIVNM+2uAvmg7pc/bPEbZIo359rIb3LVmVLBGpOrLg1BTz0Wu036sYzNtlW/dt7i
         TfNjj02uZoEkwtJ3X9YTEhrOwNDsXP240x6SWrborxOha4+tKxQnpYaHPi9gLcgq+U7O
         uTgocgsC6WwwUCNl+YIBiUGYBnbse4ysbgRdk44H54LMfsYFpWlcebbPM+E0nnJ5d1FV
         DKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442069; x=1792046869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=YdrHi2XEIHTatM6dbMXxR/OlzUJOMPn9/pAnd4oT1lvcGfZFqtz6H3trymk4Nj+lSX
         jhftOzZ4PxV0CGGy5xcKBilChoHEUu8OoNEabx5cpQxNsd7Og68qR3w/NgzmblgfEo1d
         dI43djrXeZINpeN7mJF5Ehu/VeAe1cI5ghF2Ngl3kxfRINuzfGWpzNzXlcfeExbARRKN
         Fr/I0Jsqxojq9TpZRioj/CV5ArGryhmzc3du3ioafr5+aSbeqNfqB2eiPy+QZHbSJL/Z
         R9jiyQFQSAdvott+/UJb3NyNY5KG7af40KfYjqsQIH7WZtSX2lwtfqms9JS9AVHgnDzE
         +/5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxLcmb3cQ7xh0ph6t8OBr0f8PWKh2yVRbOYmv79mRIrowyrBd8NLido0GeVV3OH2wygUVzzyx2I5GriILICPZuT@lists.infradead.org
X-Gm-Message-State: AFq9FYKLjPsoVG7MoW4dg7+bEqd9a7AgK1yaxHbv2VzhXcVVsra5kgxl
	5qxTO9nDyambmj+MeFfsnhO0cWK+CprJumLtUYixLDOzVk6KwQuHJe/yXpwqZc/61TV1VLrH1AV
	YPGBUJSercxSeLyn9GAEEgAT/szAQ0aJ/JNhornP4qA4SrRJPDoQT/tjWriEZZxiA19pasGIZoG
	ii9A==
X-Gm-Gg: AYBFou2p0gt/Eg+EV6iYzw+1UjWi+QgOPRi9mBiUiwi+xIETsB9zFvA+8gZ1PDD1FLu
	fhuRwZ/EuzKYKvplNJtuK+lFWE6dfVFMSYOakBT/XcdVAeNDUi4kuTDpmcbSVtd9lfJLtOr2A0I
	gc5I9HC7wiK+AkIQoQv1B2pIZP2yjlLYO4Sm0jfyaI8uw2FK5/2TMeRkTFp3f6Yr9G4Ii/Jc6jD
	O+3OeJlnXTPiIMwRogwqyvRuanMch8PI7zUo8S+ZwQlgBoiFKkydD+Wc8tACf3HaoLqcltWUCyD
	KoPlwQi20elwBgosi0+qCcUSWqvewF73yGNOLsmomcANh0zcd7mAb/MDFiI8iQSWJdF60Miz0VQ
	FwV5fBpkBKbPmCijdZzduhRpTxQMLkELPEA0tzqZ6ohBrZgFQO2IE4eA=
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245381a91.60.1791442068722;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245366a91.60.1791442068213;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:13 +0800
Subject: [PATCH v3 4/8] cacheinfo: Expose the code to generate a cache-id
 from a device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
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
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442023; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=treBZjfgVIBmtiVlLTsGxNxSnTktJbBCCAsYZ43ZZlE=;
 b=3SxhVsOuGeNgSvPZ92pETLYV0aGE3Lrja1mLwS8TGb1jJE+U8AFQP9fekEsXMRiNzDPorHWcu
 NsTLPixLPkKAmXzZ9LTTdmipd90gcTa2KYFnIBj5anxhOUkg4ybZpuZ
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: Vs4DFxTXTnWf_YCjhIHRSdLhBag-QAy_
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73c95 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX3LN0/b/ZC6Nz
 2GloJ2/8gVIUUG5EbRkjHji2LbU5O8eh6oYytmPUG+AfF1gT6tuDKhgGnOLpHzkh/V4At4gz77q
 4ZW9p4r8axHcST0JikuBDrYloOOZMEw=
X-Proofpoint-GUID: Vs4DFxTXTnWf_YCjhIHRSdLhBag-QAy_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX5oq7a04JXUXF
 y9ix3uoCIdCQyxTiKOVIAfDTcPdZr8ss60E3eGkovN249Wz/APknoPUaxKgkEmoeW2N5xO0+yFM
 TCkwqajr4qG63nf4il3bF3p5G7RgPeHjr/2B/rRd4lOlSNDkKnGuUCyV5brSwG6AoWsB1dHYk1E
 JDv/z+CuT5mpupzkNnbfUDIXbKzXk5iAfuOjT2+quqobQ67PgMO653rR0HSE3dDkhNrua/i1eVf
 78Ku0JdzqXJNh6Pne+k0EXqj6dQYktPFFR223p7SgFykODmL4IQqCKfkO9S2PTuAhiWT7wJZl9v
 P8fHjX5r3ls8Ouf4XH1AHMJaxrqUZsvTgwArUhNGYh219Y7zxVuypGo+vOcGciqSKwGKf8W4zOB
 2NujofuLzycEXsKXA11eYNNPrzRm/YjFifcROQpEjOgFK5q+qNFv4yG2BGYLWUysRsm84mK3eQa
 LKYhybFhht8kMcGROmg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234750_005748_81F3F36B 
X-CRM114-Status: GOOD (  19.47  )
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

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index c4394baa7e53..5187535c8338 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


