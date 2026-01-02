Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B5DFA3744
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUcD6pb0PVlZ39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=; b=d68ytJt9pdcURfIh+6ewc9J2Up
	1K429J5dFO921qpcg+hA1MYL5pyMzPffet6pr6QMbf1++YM5nSdR15JDfGw+eCg/N9g5+1IxdGxXA
	Ugvoavu+E5A51Kw6dizUrHuj5rviutAcSSWXjhdYIdx+pUofAPVskp2g5U30wYaW8Dgfzx0bFbAC8
	gGiSa8W1+VeYaEQuSNHdcqnJKAGVCvBQXOQRcrI+olplaCw5iB0zwR+BcJWn61WzkR/30xTuRHeBB
	OonUW6Zhk8n9KhcT80SOh7c2HEoWft0l9qH3rXh/AT1p0T333VGkZupQKnsMp2unARH6+TI5firmy
	9Uu+APRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecP-00000008FOc-0KNr;
	Fri, 02 Jan 2026 12:51:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecD-00000008FGa-281U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 602C02xo314674
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nUcD6pb0PVl
	Z39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=; b=lPsT48SGumWSYeYLa9JC9HNNgaW
	4tkT81SK3bG69TQVI9+jNnhST4lXfdbVwlFdHUb9ydRTqO1slc/lN0m4mUthbYiX
	X24ImfTWNqtIvSRjMirxBxWYpEZZinjkjfQgCXWKjSbQywkm7/cBUCumCUl/qlF7
	yGEo3xTFPJfJ4cp3pdeo/u2cdg0G7calDrldsVxVLxZOAqavtr0xOzKM90zf0WFq
	nRXjLErqpX99Qlu4Iz9Af0LYEMIIkDZ/LTkNrv3NJL8eLRWzsPRTHdqmTBL2TaJz
	wGZkcO+DTSiAPOyeqwOw3V/GjttYjl1gIHUh0N6kW71A/wEgysrotduNvNQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bedmxr2u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f4ab58098eso300373341cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358248; x=1767963048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nUcD6pb0PVlZ39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=;
        b=XbEY+cM88Kv5rsh6MMTCSS7PtsokHQen/n0ewh2jgTYzTFCysWfBXIV9XkzpzgqN+W
         MERUliSn46SKvB4rg/tEnxYQundetVpzr6c34whY7RhvJknnGRAuRk0aQ4XyCW0R4KaJ
         zqmJejVlaiasrJ2msL5a5O38huQjHpoaO60v8r8qaSIk0E6tnMc01TRRphz4Q7xxsxp6
         JIWv1eBRwv8SCelZYWLn6PXATZXpVEy14iyFFkoeCr6OCvCtEwMs9UIBWWUXDFnqE6yD
         ljnmEjOWfezHYbz6/X0Qd11dflPeeNe5/I2PRnfPY3XC904oFOA5ARNhv5ZifUPB7sDb
         Yhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358248; x=1767963048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nUcD6pb0PVlZ39xOW5NFx+GBSd4bs/4hPrMvTVDDLMY=;
        b=KRJk7Rs9iQkMJMp5nQ3tUPqgwxmL018AXTjH2n2JxGkIwyuEaLb9tuQVIbGHieJK8c
         hyOIFdc5oXBDHVWpC43UgDL5iSoCyVL9V2poE3W4EE/XB2Zb511YfpxelQvq1Ympr66s
         J9+JLRgiLdqViddo3eLQkPsR/VCKhSUIluncj9ioz2qHkCo/CdcNIxv8QEcokINaOsWh
         iVGbTs5ZDM/DotEBvIxuP+wpxJFzFcicXdAocJda25psmbDM/7HOoj6s+n8BX2QBSvMd
         F5U5OfKTyjRyyeUEHQ2wo30vCJCy6eRfGBeI/3QONxNPmM/7BOQ6IoawqHXN9fHtoJ9c
         GiLw==
X-Forwarded-Encrypted: i=1; AJvYcCVZGS/ZL9gsf8tUs9/LVMUYBnFusvPwFxE8/MeQuDTUjz6SQPY/yXPq88JwlU+Os2tGqjgORX1tmPUKDFDrlgXt@lists.infradead.org
X-Gm-Message-State: AOJu0YwAhSXbQA0R/kFTxGbaA9ClwJnL2izYXex3V/D2p4oiuAQqBw2a
	Dodgp0Sajo1cLmhACYHVKHPmAvrowp0NiSAfuZvXYdDw9o4SfnTTv8Jgxasr2qckylR+Kh9V6Nc
	WQSKw4APBxTUkKCyVYwSFSC2Alhzw8/8KHkGtoMwprtsubq0rMBOKIG9k66PUgKtcQN1htFqaPa
	RXxg==
X-Gm-Gg: AY/fxX6I292wEQNb8YGwUDlTI2sbs0M4KewFbHtJ7A8wYPwZMsjj97JYWrIhimw1roN
	hPwesWm62ADJcgFnkxdN8ZUu0+IGQaMafGEepLO7E28Wjvnuf/OTGi3HGJKeGdORrPdfVFrfvoT
	UW5fUh66cAgbb+gOYTPfjzHuGJJHbyZSq8QGSB817+nLkUX9Bl778LK7rVVznsC3uMkhRAQ2l2f
	VfYy2vggAZ4sRiGtohEYZysgm2izTBBF/x19odvyCvpu1YZa0K1bvycOyxkcj33kln2yomjqHoI
	D6ZcgrVxKNEgiiz65Tc7C0EOmJUCSpPo97mTSwS/pdecsN4WkkuPT0RQ+hVqGdK9FJKcaSyOTBJ
	f2YdEytCGySvdqOYDGks0ZPMs5w==
X-Received: by 2002:a05:622a:2b43:b0:4ee:15af:b938 with SMTP id d75a77b69052e-4f4abdb9888mr636639631cf.70.1767358248090;
        Fri, 02 Jan 2026 04:50:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgMLeHLiaApDhr4y+t46crL0OCq2r5fx6YzaQIeAPiktL/EPDH+eFPWsNm9PgPDb379iiEJg==
X-Received: by 2002:a05:622a:2b43:b0:4ee:15af:b938 with SMTP id d75a77b69052e-4f4abdb9888mr636639121cf.70.1767358247588;
        Fri, 02 Jan 2026 04:50:47 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:47 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-ide@vger.kernel.org,
        linux-kernel@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/3] ata: ahci-imx: Fix Wvoid-pointer-to-enum-cast warning
Date: Fri,  2 Jan 2026 13:50:42 +0100
Message-ID: <20260102125040.65256-5-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=bF6I3Il5StjpcdVfuPvLmyNYtVe2Yc4DUSHgz9j7Kc0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78htTPTsLhXFjjjfDr74HmSdB3AHf42Z5Y8+
 c1TGemZXLWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IQAKCRDBN2bmhouD
 16n1D/4pE1qzGL1s8HEKW7GRJAes9KGNCUeOwpOsXUDMiez4dAEYFZhEy46nbNa5OMSgone+q9h
 yrZ8uiKuxnkXHDAOXKLpMWFByOe6oLQveIr/8nhyuDQcSDJtiYGXQARD8rrHNhyajEYXHoo0xNy
 2HhL6FHPA9t5cHJZ6yRFqlax3bogb/yaWfk3WAmZF8rZE/2lrSt2Prs9uuO7C8rq0wlnuqXu6Zb
 2/M0eJSJkkt9nv8BgLYYVRXnSFxzfeCIHh3wqRFRDYERcnTfh56xYZ+6n0J2iTPufvt/JNsjzR4
 DCjmaN0hnlgsVXaae5MZGbTql8qCwp957eS6EpUu1WIQ+HBXnR2dESKNPm3+olmAMTODlNLxG1T
 o9pttb+XTBJ+wQb25WVA++EKFElhU6qE6v7fxRqe2Jf+gxFuLdpHiSZQnmDx1euYkm7SYF9AtK1
 /VpX4wqa+NSmv9QNCaSrjxzqnUTfzIusIOOQolhuDOl/N1lMu4ZxzQ1vt0GNtAoCggXyb3LG672
 EGfA2BlognhlEtOIyR2VPms7t9G6jM+br3Ek4U2GB7qYdjCOxsI/WfV2BqfPG8lpo3dt++PpxiF
 yQsOyAwt6i/AACbE4f5wsRpGpIAawtWaqnfER33Y3I9gh2Cjx0TrYY/8H8Gpl1urFlgt8Z4eHET 7k3nYo5wutjTiVg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GupPO01C c=1 sm=1 tr=0 ts=6957bf29 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=7zQf0MV6msiRB6oW4MAA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXzcmMsk/afSLw
 /1WBi+SQEtiBwrDA+IjfMmWj+cReu45tezRC4EF91wTDZ9Kv2zx0p6mcgo3NBHN42A2zhu2kj14
 RVb6eZi34xk/H2c90wk2Y6kA3MnbuoKQCMTldWstBXOHeN3G8/kn7AEZkF0GRzbGVUVhcakro1b
 qD1wrhcorZzSd2wi2wwrcq0WRqpD01KjrDl4QwMn2LDGU75wKiBv2EFotBpYbG7hHbQvRARSiOU
 GjDhS2tU6PvuK6Mp0rq0upuZfHbMbMUXDj4GCeL9JqPgieVuNQ2L4e3QI2d6nqy8bUvJfkru2LP
 3Sq3Hmwni0V16rb2/75hw+MfXeAYOKZnP04nix8aa45hrRss+1iooQmfZRVtxxpio4IzjdZ3DWE
 MitiSpzx9K3c/YVjxpbQGSP+hACq4j6TtPaHISD8VOCu6H+S206cnRoLbf8JD5v1aevwTiKWcDL
 19a35UkftPl/982+LQQ==
X-Proofpoint-GUID: uYrR1LXCBi0pwtMRDTYzhI6iUYzgrpoh
X-Proofpoint-ORIG-GUID: uYrR1LXCBi0pwtMRDTYzhI6iUYzgrpoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_045049_567128_24C686F0 
X-CRM114-Status: GOOD (  15.47  )
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

"imxpriv->type" is an enum, thus cast of pointer on 64-bit compile test
with clang W=1 causes:

  ahci_imx.c:872:18: error: cast to smaller integer type 'enum ahci_imx_type' from 'const void *' [-Werror,-Wvoid-pointer-to-enum-cast]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ata/ahci_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ata/ahci_imx.c b/drivers/ata/ahci_imx.c
index 86aedd5923ac..3d26595524d3 100644
--- a/drivers/ata/ahci_imx.c
+++ b/drivers/ata/ahci_imx.c
@@ -869,7 +869,7 @@ static int imx_ahci_probe(struct platform_device *pdev)
 	imxpriv->ahci_pdev = pdev;
 	imxpriv->no_device = false;
 	imxpriv->first_time = true;
-	imxpriv->type = (enum ahci_imx_type)device_get_match_data(dev);
+	imxpriv->type = (unsigned long)device_get_match_data(dev);
 
 	imxpriv->sata_clk = devm_clk_get(dev, "sata");
 	if (IS_ERR(imxpriv->sata_clk)) {
-- 
2.51.0


