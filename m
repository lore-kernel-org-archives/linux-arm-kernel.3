Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60D5C88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=C7Sko6ysgjjz2EYLADJU5cduIe
	IsyGq1kZr2FVwX4uE3ZYBzbKzdV42w/wQ2S7wL+EkrpN8zphMqS2WVAyArGAqBZDfTmImScIXgFK9
	UlHVWbr9AWa2irK3bt1zCdYq1n6zSnaRnMqYdTe+16yJC4Z8UfeE9FvzSx+QHilDyOmJ3BAQ/jf/q
	wd6HSxA7Bb6MUrjUQB0IxiDwDM6MP5VVjEVuU14oDLytDzVe+Ie6GWg8xbZlrMbsCpbvz78DGdlMO
	QJEMe7LwjIpmRU77ia2Qh0GVcXfNRuKMEiUB+fH/80jj91bovDZJqkePqUDJwcJ/CNrdWmJQUQVAg
	zofVUeLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AJ-00000002zC9-1SWg;
	Mon, 14 Sep 2026 09:39:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AB-00000002z9T-3JgW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:39:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8KwPf404100
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=; b=KJwc0xs/gnV/VDUJ
	AbPpWQ3KScrRqB5m+kykYuRtCYi8CH0ADcKxgLqAD3GSjgfkqN/WacHGjllBQ27N
	Lqu7WHocHa/tadb82TF8S9emN6ojTDg252zI0ZOdI4VW8HZMSv0dkFzVD5Pfk9+D
	IybVvRN5jbYo1yae1kYDrQU+MhpTkRi89g1PEL2jwR4FJz1LUCos2LnToBZyVb85
	kk3VYBsZXtmQj2nPlGalwANd6u98BByZdM4Crx/TqsjDqSvX7uZ+bMxbawBrItyo
	rlUH7LZItb5OhqjSksgKJYWS7GlLoL5ml0dcZik0SDdxSh234Ew1aYzlwlEKDTag
	tVcH0w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r8mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:39:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dd1631d291so34727375ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378785; x=1789983585; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=jEGzAQFP3EifyWJCSfmuQC+yCiNSnRQ0h2OgeU9bx2Q2yR05q3b/SoxKe03r3U9t/W
         9SlOPdPYiKtBUeH0udHXNFObkghQhuBxuqa4PBhOoATq38WPLkO8synylbx05LQMP8EW
         7lxMaARKlNvxsSSQhqv61NzUEXZQDluq9TSUiRkx6qS0oDe3Zgy0pBUeK0n0n7ucIWUx
         QY7MYMAFNc1eNyDsz6X8NxqABRtLufpNdDlzBaJlrREnxHfcP4IVEynbZZSfMYhFrvOq
         IWTH6Bx+rXbITCqo92yOEMU1tLazCqwLMUV0FLP2Al/0YmIKYXNmYc1LWfDaTWzApmHk
         gWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378785; x=1789983585;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR/24VT+nvDX6Pu+vatSh19aprf4T0g8qioM8XND/94=;
        b=HkX6bKJNXBeRVq7uJMk7cy4l3dcJMy41FpjM1RieIKHoDYS9mZHmEA8ulmXO2c4Z/I
         u0U72k6xARlwEVjsh0zsSol+Q7od58nAazHriOV9AQVycKM1S6+vxH+fQf1sOZXTg9/p
         Mre/ynRdPxi/ywFbLy8MqUJZPJrgfYURu5JuBXtCpeVg0TYqzhV4MNZjsFoV20hZfC40
         i8zl8+OfXCa1JqnJNaGa09rd6MNHSPMC3RGyjIGgkQBcc9dfZzgDRYTX6hJjP0rEcPm4
         UP5LsT+VdWeXgllS10xeIVI00rIRaEsg+2KnU8rQWu/6I+lZwGCTJsngE1/UMcF4ZbLB
         CjpA==
X-Forwarded-Encrypted: i=1; AKwUvBzsUEuQx44onKRKzjfzfGC4p6SJ3y5MSnxp97SjB8IrWm0aQ9TFEOWl1ibJt/ciiZM/9QczhUkIr1IlLlg/NyOD@lists.infradead.org
X-Gm-Message-State: AFuF++l9dMKsJ1K9XOWTsk7LeFecpUtPfqcJtLZthdddbo8DA+RE6Cxg
	oKpq3KB0EbC+R5JjKC7+8UmQNnb/92w15Uzd1PSXQjvsKUvltpzktZyfqaQkmrOQQKuiO7qy28F
	EO8Iv3gWCYuLJ1DJbdCQayWIF2c+KIHXAzvqdOwOPOAR7EgJSpvYSSnC8q2MiOpviNMdjQsleSC
	RNxg==
X-Gm-Gg: AYBFou33/9IreH91eLJwNPM2NWyi8Xtm6iEkx8iEX2rwgBTu5qjjOWZAbgxY+WYfW2b
	iDkeiNhgqZP4/lYXVJrFgy9M8fyTNrSTed31ZZcON7Op1Uuq9F2nLCPon+lMJZr9igvTXW+letv
	BytQBL0PV0510psrnozrrnitPokihVLEMgZWMwnZhsE0q5/dnNEXXT2Gw2S42Uris7sC+wOE8SV
	2Uqk+lLd63bp20o/jarI4OHGNhNcCm4W5y6jQm3ehnVESlKTaC0/uxEP6HBivIEr6wI64cMeWO9
	UvGEinIGO4QX0CLvX3TO7sieE60WoaXhGbUAXDICetbSsJyNVR1ddXSu7XWwgN1+Adnl/kZeTPL
	4ekChbfd/En0dM8UdZfpwFUZwqVdP7094742jJJNBGPy/LIeMJ+CSJbSm
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679912a91.6.1789378785523;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
X-Received: by 2002:a17:90b:35d0:b0:39d:efb1:dccf with SMTP id 98e67ed59e1d1-39defb1ddacmr2679850a91.6.1789378785086;
        Mon, 14 Sep 2026 02:39:45 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:39:44 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:49 +0800
Subject: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378758; l=1084;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Jy14sVbtBOA4INaXpzyNkK/bT7ygjH1r3zg1u0X4N9o=;
 b=8qVts8kvOfruxq59KFcdjO9xhhSgezIyTV0q1/20EcQF+DfUllQOZoPY0Owrd4E15wWT9eUt0
 Aa/3hS1ds/7BuqTY+P0ocnYLZ9q7OxXK12q95t3cvNkvuz4MnkRAN+f
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX3jw8bDafQlao
 EYvqSgZIRlkDcINKWwDkYAqTU1pgvdfic1v1Ji4J7ealPc8hCZ68JGoSK1HpskxlhijrzsPtdAC
 9zZe7Nwj0NPE1wnLphGOTyJbuxFs7lM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX1jGvsLD/4/Nn
 zUmo4+mqQVtYYej4j8EsKoh7wOAQH7UoUGCTBmxckbjrbtTLWXs79eyd91hkaol9PUNf+RE8YdW
 7dRUYvHwyuXgdto/955hoklv5+q3kRzQE+CH5iw7kAja0nGdsaNVFEPBsqbWuHXukk3TSRSylQ8
 FWyDqF8I+DwolazwriPOpcb5miikAsMtiwEn031IYdm3CdquqxSKBmEQJzDj+xmJJbXFUr7WzNM
 Wsg3KTkELZtxEY25TXJfNg/tQ4WYHFueGRcQ4Ow9X32XAAtNy5p3871vdTLj7XRmSXDDEPdZmd4
 w2n7pK4UzIxwS0s+jAiWfBCdPNisfmcydSoONkqkT9Ihm6/xBVdI4BkBa3X7foh8sq9UwOY/rj4
 Qnjie7jn+vh/40HGlgtvLdXLAjkwlPUuNmhLM7ebsS4n1p2hwrNEjCFlqQ1d+/+7sgp+6Opl1g/
 4J7xAsiY7WH9gT0kibg==
X-Proofpoint-GUID: WXiwx_lmcVIKjSlx_2kWOuUzgskH1s80
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7c0e2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=cxiLKowE09Ysm4E8lmYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: WXiwx_lmcVIKjSlx_2kWOuUzgskH1s80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_023947_953555_98902708 
X-CRM114-Status: GOOD (  16.23  )
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

The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
is defined as 16, so the check should use >= to reject index 16 and
above. The previous > check incorrectly accepted index 16 as valid.

Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index dd422c56fbb1..6da217abf689 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
 
 	lockdep_assert_held(&mpam_list_lock);
 
-	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
+	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
 		return -EINVAL;
 
 	if (test_and_set_bit(ris_idx, &msc->ris_idxs))

-- 
2.34.1


