Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4CA3FA3741
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 12:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=; b=XKWLXZOPWdV02x3eNgS3fx3t3D
	6ZBDkCjFhoEd+R6A9n8fw3dhK4sQMt+YDAy+NBJ0S7wgVqQksVERuBtQ0JJmtiB3Cw1s9oWM59dX3
	h719mY0NBOu197rSiDZQU65bwieEoQIngPdHQILRUtOjFAG0o9YxbEYo3vFYoMtzu2oI73e+7lG24
	wa2a2mjE0S4A6B7FeBmo1coXdpY0tB8Z+Rc2jGQ8lZPwOkvoq27mLnHh68Oys0OU2LlMAoK6vJ/DF
	8OMOlLr4Lohsi0TV1mxEtpZiyBYjsYUetmJoJaMXNtFftiKMu/mzvfIvPX7+7G43kUzHyoKteU/cw
	650xNQUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecI-00000008FJ5-1Nqc;
	Fri, 02 Jan 2026 12:50:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecG-00000008FHz-3hwK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 02 Jan 2026 12:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=; b=MSblkzsVvFn/EWmW4kQhnajs/A
	jEuJWK0xnextos8nvGxCi+ln9m+Wx62vzJcG6nKuJi0oVlaaNHxjI2yrI2f5vr1joeFHF6MbOrZGX
	KF/pc0vYnbprhgXMcUEdtgpvVDKT+pephYu6X52kSA6slhlX5bsc7K4URHbhAksorEYZPtqZmo+3i
	M8kdgszuiV2/VaTU3XVsChZq1tTmKfkcIoMNeT6FNabySUM3Zjd/QXeSaWpX7sMzOkSlVr0d3qZaK
	UCZ+TJ3TGgHz8cTuiT5Yefo68Uwd62rNKUnTTqCOSfg4E7JMZQX9LFKuNN2I2m80psHBjCdEUjHXK
	yl0jp7Jg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbecD-00000005qxM-1vM3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 12:50:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029Vxaw426633
	for <linux-arm-kernel@lists.infradead.org>; Fri, 2 Jan 2026 12:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9Ihq
	QvOvA0YY=; b=i+FcXJaRoiSiRNNGV86Khuqm1BEf9vijAMGsTzZh9iW+xEzsWbO
	s9JCY4QxCOA4Vkowmt/cFMUkV+gVFJAxmpNFxFXJcO6852p9cfywX4cnvQUWY6mp
	NRW+0+DIuPXjTp93yAovMGEL96LAHL87q3y/V92SDIVxzbJMss3JHRJvHJ+Zzt7M
	GFUZIQqjsR9FrNhZOH3eCbjhB8KjmdH8lvgIZk3bkt0fUSurAdj32r2JVz5volno
	3TI8WFUQJRCfwkDzq3G12JTnVAx9o2UDhyNnx/6zguRhu0mJS87IkhWzgk5TC4SU
	44R4jzu4qEZ2ILc+/tC/D2bHTyqOG+uiw6A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4be6fjrxsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 12:50:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ee09693109so248533331cf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Jan 2026 04:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358246; x=1767963046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=;
        b=FvJEaztiuvcGmNBty08MU5GbBexyVnkzWsFAe2aZ9GP91FuSk1kQmgNcq0MT3KqXWC
         7u9Z4jCXJp6JO/ZIbLdjKMmdDBJenO9n81jQdBosB3vGEc19dikRSxRzE4O5J16SXtuo
         fjkmzKTdeYJsZm7qvavvg4CqjTYHidoOULeXNPHS7CP5GDfI+du0uQK3S8QnQ/7pOlIx
         hPqwfE13UnkcvvR6X8Spxwka0UVlNPVW9Ns3GDJ6zEKS87awmRiJCa/Qn2pmvyfhJxWd
         gk5LKbXdJHkRqJjLqWIb6XlddKHgXFAi++hTMuQN8UTET/1GA93l0vWRtXWz6T88XX6Y
         KUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358246; x=1767963046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNQ3dB0qjMdF3sPcFxLBfd7x75qLiik9IhqQvOvA0YY=;
        b=WxStDPv0dIhLcpG0wnpttADNLcu6lE7ItCIsaQMInBFl+Z5Dny5FhdRVR/8UyoslNc
         TMFCkxd6Qlvb3dyKLCi/cf7hXEu1dkr/8hUKvaD1S6cft4dT7naopEviB5ylLsTAbQfu
         tEPrx4t07JaxE0fZTQ2MMjl8JB4Td8LXtGscgmta3lc2p0wONmEcNg6p1ppAGkQ6wLdj
         3nDP4UGKKvwGGAxWHiDEWOjv0qSQIKi2Qod15pM0XNB2TMCxHAnI+bkl6dtxL0CHlylz
         TBQlJIefV43FWczPIQq8g6p9JZoh6G/yzVXWbNjgH/92aae8Lq1SqkHBCw7qZH2Z1Cak
         3o3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWG3kucW5FusUFbBxeHSpj8+aU0vM+qYIobL5HP29RJ1j2QrbjbeGtkQBShEXNJ/cls1OCvrNpiPtzszOHbVMN8@lists.infradead.org
X-Gm-Message-State: AOJu0YxDdf6IML0+7Rpf5BAKTORso+SgcbB3nghFNodXpO4fgT5Sg6ER
	tEqpu+J9rCj70GswPMav5fo9qhS/NTHUebYMhX9f85y9cFm+57Irkp8Uq7nzzVc5ZOYAWN0fZjV
	AcpVQMGkGT1AfGTgU2OzLiXiDuXlk6pp7yDFAYdG00MIEniUIiWWfy5nFLubEC/LXBWwsaeldCM
	8FOA==
X-Gm-Gg: AY/fxX4zgvJ6HpTMuj5WvP20axNH8YKCAoso1Bz4Kbvur8g5S4VDxEwFbkxU3Tr+YJ8
	3b+vMOqJHg+SUwYtQl9vlMiJAbTdpSP8KZEugvLyUun+q6mqY05p/W+2QN0mG6SHwEwXEggTMqY
	cj5fQOe/eKEE+bIgnJ7j9TcEpjJmswouaU8ynSEDF2kdloD7oQfpHMIoAvJZLF7av6U+V3r3ATY
	txnrmOnee6XfFnjz6f+T6G/1/MVLk0laMPBMIzD8ZOBDglzk0pSIbOXYUR0APjywA4LFtdtzIme
	8YleU/iURHRypuwTCTyNswlZbhngtfOfvzp3AqYP8j+dA38d7UXTMaHYLu+cQK5j9IwEkFI2Bmy
	oWrQDp+wxrVZba79RHHxHAFlRMQ==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr589485731cf.26.1767358246472;
        Fri, 02 Jan 2026 04:50:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/YCPL0+UNOHn9nZVMaYS8i6WyQ4Wfeniq2uQe1ZvEyhVOJTJwFUgj3aklQn1hgwDpKla7Bg==
X-Received: by 2002:a05:622a:312:b0:4e8:aee7:c55a with SMTP id d75a77b69052e-4f4abd02696mr589485441cf.26.1767358246063;
        Fri, 02 Jan 2026 04:50:46 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm84491369f8f.7.2026.01.02.04.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:50:45 -0800 (PST)
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
Subject: [PATCH 1/3] ata: ahci-dwc: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:50:41 +0100
Message-ID: <20260102125040.65256-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1360; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=VqwBxy8XYcU5QNpyDWii4kc8lsFQn+uB7jr4u0TFrb0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV78gkLRi/ij6HD+pORAra8irvuUDfnaiYR8he
 QSPIHHh1yOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe/IAAKCRDBN2bmhouD
 1zh1D/4jn2PFeyojebR9apQNrt0zOd38aGoQnQmhw+d60/iPQ7SsnfwDvpdHHYesOAvjS6nKSTF
 bwee5ROqrJxWj6OGKTA4bXX287VEFogf9JyAtejUrefW4NcpiRx47yhAMAGrABcdvoZ3Pu+RoNs
 nJVd59fqABzCpnJ62EOgzL+oX53+ejsxt/bzKBKcH9LUapbh21+ZNuFMc/MUSxU6npQCNyQHYD6
 vRAQjck2ol0e0ZZkEqHd07mFJmoHDp32+MMiIl0zdLx2N4+/NRLrsobUSDFa6NE9fv9pGL3qG2S
 0Stn30U3Lnv+Pe0fSSRw8C2qv1s8rbQXhdjycztw24EYv/ZGGcBbeDzqIqG80IIOEZbGSQ5RWJk
 RkArRTFQ5Qy2+TW452GwDnpx7vKofpmxYZPYGdlFXS3fWIPmz1xfQojd+bS54iQneC6Hnj+ANuR
 6/yB68IB0jiMd+WQayC2VxySQeMUtUxdDDgiJnp4PlGmp6MXNs23ZnxaaU6rfwv856zPT62rNyl
 oZNh8fWpanng2WdHj4r9FJ4t9+smikxfVxLWEGdhXZhvNZCEQaNlfAMhrh5i3PNbm+r55hn1mBJ
 btjRk75NXo/7g3HWMir8wllZsipsg02MFIertSaDH3TCC27v4zYOQ4ZqAKO1vgsKuyGvc1xYOdS 7VILipyVJ3AFWtg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Av7jHe9P c=1 sm=1 tr=0 ts=6957bf27 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sw2bo_H_5zbN9pJnse8A:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: GnrhNhbk1hY0ut5xjm67xxfnmpOCzeSr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExNCBTYWx0ZWRfXw7tHN0ZQhUFa
 lYA9qiVkZus1rlPz8q7Nt3ZbUxoMnSBsECUqT49KiN5Eqr708vfbTtrEyxP62zDjR1Lk1a1m0p9
 d84KYeGol899ili90SOKK3/zoDWXTV8CoMdyusvTYbna788IkEqyLs8RFKsTmm+lHD7Kq78MJW3
 4PJIAk52v/LB8cYb25MWW0Jz6+bhXsWLtcZSStMJxCTqc3LTBUpch96wWROxZKUHQEQ/zYT0xhn
 +dNJUflL2H4Pz9oMzoAQVXKemyzHm5TYoy1WQChfTmUyIQIrbpPiQ8/08vQbv+mBBQziCslU4M/
 3aUmMPn6TyTI0mEFci1T792NQ8mXQ6kHhp0ZpEiqQ5jW8jbJXZ8xWiMc8XyppDh3E+DLrjh+rzw
 uK8UEJRTvWXG4bta+wlAyotoXXna4nFfIdQk3xo28vxwslxr6q1jGr+9mSXmmgs64CDmNB+V92O
 ABeAFzg+ru7AxhMFDUQ==
X-Proofpoint-GUID: GnrhNhbk1hY0ut5xjm67xxfnmpOCzeSr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_125050_208179_4383ADD8 
X-CRM114-Status: GOOD (  15.80  )
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

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/ata/ahci_dwc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/ata/ahci_dwc.c b/drivers/ata/ahci_dwc.c
index aec6d793f51a..bfd24772ee67 100644
--- a/drivers/ata/ahci_dwc.c
+++ b/drivers/ata/ahci_dwc.c
@@ -260,7 +260,6 @@ static void ahci_dwc_init_timer(struct ahci_host_priv *hpriv)
 static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 {
 	struct ahci_dwc_host_priv *dpriv = hpriv->plat_data;
-	struct device_node *child;
 	void __iomem *port_mmio;
 	u32 port, dmacr, ts;
 
@@ -271,14 +270,12 @@ static int ahci_dwc_init_dmacr(struct ahci_host_priv *hpriv)
 	 * the HBA global reset so we can freely initialize it once until the
 	 * next system reset.
 	 */
-	for_each_child_of_node(dpriv->pdev->dev.of_node, child) {
+	for_each_child_of_node_scoped(dpriv->pdev->dev.of_node, child) {
 		if (!of_device_is_available(child))
 			continue;
 
-		if (of_property_read_u32(child, "reg", &port)) {
-			of_node_put(child);
+		if (of_property_read_u32(child, "reg", &port))
 			return -EINVAL;
-		}
 
 		port_mmio = __ahci_port_base(hpriv, port);
 		dmacr = readl(port_mmio + AHCI_DWC_PORT_DMACR);
-- 
2.51.0


