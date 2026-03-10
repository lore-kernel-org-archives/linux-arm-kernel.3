Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABCECEB104E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=; b=Sy0bdnFODmuWBo4/DVWBlil6zY
	gH5dBQpMyaYYGQhHGsWcLjrp1147SsZUpWICt+gKReikKjNCLBWhsgDCp2rNcVIRORt3742Osohl1
	n6IBT9n6vDe4rHS/R6pXDIeSEiqY5Wxd4c2dUMvP04M3Tu/ES/EtzT5JGYmm/vc2puAxauwc+fbJ8
	k9UNbwoQxtVjbidUA0hV9kGT5798ZyF9ZxNWT3R8p2Ad8sx8waDbIaYwoR/ZMC45QuDlREBNcpDgR
	DO8o71E8EcdKuKHetFcXHjSRLRkLeCdc7WxgyGLLdfMrJrtndPLsNrhBOm4w8m48l/2DhgCJoEWUR
	BlQRIYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAs-00000009HFX-2Syd;
	Tue, 10 Mar 2026 11:22:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAn-00000009HC8-38P2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:50 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8h4dF2754089
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=; b=OXC5niV/J3he/RXV
	HBpr+nDe8/aemQ6+BeRrlf6BTUhi4MbRlVL+gBPWo27/X9tFluI9FqmHL7mPKE4o
	QzY9Xkbb/ZZXBpBnn1bYiEvPn1v87+aiP0rNiRGYdB6MeAwYwa0i0BBG+FXky8E2
	1XO6IYq9lwiKR4ucnNjiXu+/bnpBs7J9/BKn4s6v9B6ngMWo2xZD0FBjynyCChYi
	nGycch2+hmCt8a4PSTN4KrdJM5Cn3imNMfIgWfhPOvYvJM3ovG+Pa3YPu6BL+j90
	vBr65LbveEQwJ1qEqtdXJTnaGL96ziMc1GFm7/CONJmAx1UxJ/k8VGQRNtTY+4QT
	JF09fw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mrmer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd80c4965aso773065285a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141768; x=1773746568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=DiCpdpA4DLV/kJfgoZUaOUmxNNNgmqRqFPknHVT5NJ6FSHJvdZXg526t7p2X9tKZDM
         SlYU8qzQojyLKzYD6DX/N2OFPY1NYalKCo+ZUth5xzIoV0qmBKyIteJLrVZv7Us5iBE2
         zhDv1i8VDwS868S4LSsNdNs92UEFjQ/mpmoTmhr9g8p/RoOFqofVUUH+gafqEklHIfXA
         vsUWN8PHp/2xoTi5HhyluatvS+hQl7QVzkTcD2LWfsOXLSBlvIW1t0+4AC7I5xhFe8wy
         NcrlEjdL6g2zKe3Rn6E1ar89V6myLcCuDbgT9QnocbaFBaEING6ZhqFRmDolez6dMw7o
         r5OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141768; x=1773746568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=20kNf6AjJi8G3MZa9GHdnqNbJyccoW/mMnIokY0W6ck=;
        b=wWxxNSq9WQgo3oBPiTLcnMacGITkygG4NRtKcqGsc/iVkWuVsYaz6CI3qCqyB++q9v
         Iq9J+zNCspL+uQhUTlDlH2MnYrr6uzur3JBrz344WcbFHHx+tjqnG0YqMOfRilzUkZSJ
         LQB3UoQdtKUgLJsXuebPntBi3DLYvvW5d0dvcLpEnEhmExrthReNNjndN0Qd9uDi2yol
         DH3CdW2bEM/WbkiUGZWwHSTT+js2Db08kBoeTO2DvPO41sZ2W2K1fTQlcUXJ0ag0BDTH
         ZEn3eZ+h6Zcimr+Bod8Sj3n2bcq+tMUWcFYBHMR4k33/kmw9C7n4m71Z+uOOruVIDMzK
         4L1A==
X-Forwarded-Encrypted: i=1; AJvYcCXa6B+o+AAAO+D2K2riQzpWGJTBNeT3om7nD42BMw3yPJ/zILd6Lxr3bJm17kTV+mKQb2TeYPJxQX2NQPbW4LZb@lists.infradead.org
X-Gm-Message-State: AOJu0YwT4vHH6xgsSBqQPcVyIOVmFzceVvbtcI9HW9agRWzyktZItws7
	ctUvkZgAe8JyGpc0mk5ku/wL2n66KM3PYc3ajuka0Aiu/eXJp4do0EFTFiHHGLq4p4xve6mp8/7
	/dgfP/oTBkoQftK3BKGKpRegQZ3LeWUpeXeit02OeQdwoEybyomivSJDO9BZLs3ee3LmM5MaFFf
	Kcfw==
X-Gm-Gg: ATEYQzxqqHZKbq/9HmDqjtV+0e6fDeLLDue3RetuQTW0EAp9GGAbZTmeiRRvPRV3cRS
	ZUFdlh7MpySY2Oh8rKG3kpIfXej7jAr23A+YpC3G/TcimgUIDPCTOwaJSpdSLRgDsLYHe2sCfnZ
	oSIsWwvzcEBRlo29vkfDYjIVUX1xecajrisAjVI3H7narbDmXoFW2xAN4Qt0y+AuridlkPWF2lI
	ashc+YRX2Mv5YJJPrA063vHqinxL4HX0ONRBqVrM8Xhz53Qc+Hr4b1iI4t1XMmN9sexupC6GUb7
	52xN96CYYn2v6eoILDgcyog3mx5vzaZN6onx8Kl7KlYl16h5x8JV/egSSBjIdJLX1/kTevP666g
	NH7K2jgRbJIny0DA9MX9S4zGvoT/8VCxOD2pRdXb3bAJv
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298331685a.10.1773141768252;
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:8cb:4d46:7a6e with SMTP id af79cd13be357-8cd93b5aa5fmr298328485a.10.1773141767852;
        Tue, 10 Mar 2026 04:22:47 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:35 +0100
Subject: [PATCH v2 1/5] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-1-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4kCGFUerd9XjwVun1nTUlYZGlcZap7SHC0pIvgPDfIc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7+Tx0V/XsD3XPBcWawLv/UH+qV9b41Eo9mZ
 PhOc+cPamCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/gAKCRDBN2bmhouD
 17siEACHdzjRE+5UXVUKCQjtmsjXeQ1XmAMVe185ibjnPxGTUlZVM7o6brVwHHjW5yQlxXVhnE9
 OiEkttDjUGuvEOi3/umPRm/llumQaTLU7hYxz72No2AU0ED+Dra5FJ2C54Uk3BL7ADo9RaGezym
 Dat5knmeLz+H/9HwFjkHVHS1qJwa29wO/X3O3eMBRaagrF/UTZm9zyU8+LVQOWkYDg9wezZWy/y
 uCrOBXO9Bk03hDhoWqnXO8IxB5dmgazfpQjflf0TgE874HJG7CnqMcHC998DsEtytNTLjByOW2n
 zo/3UDqiGLTbo5tLK0NU+dbbaAc+yXcF6uQ4IVh/T9Ox+CugW1eLlJWSU0wiPBEOwuQSyt/J0yh
 XoFLHbdnwJ4ShgTKT8qKV0VRZAsifHzQTtHT0IJWEqaxarseoCA/JZjEjVewt0/oaIiMmwaBGev
 c6s+HtAvQafDzV9b/w215PsFPi+NLjNqWZiRxcFKJJg2SodeJBjdDTnjQvjC04VuRdu7t8q+go4
 H2AdknxoAgj+yomEIbt25lm9IazxGEr33WRfKSjwR9gBiFUBBleKgpl4Fsuhf63WBAbgekWdtHm
 7wPD5hlMrxKgl/MeBE4iz7oJigEgFmEmwEWEnQ/cNPE3iq3tuUX34v/RNn2diRcHHFolSvLtOib
 9luiHafINMvBsOA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69afff08 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: AzLDQH87nco2wtyFYgoDZdrnolPaXS34
X-Proofpoint-GUID: AzLDQH87nco2wtyFYgoDZdrnolPaXS34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfXxA2ZE5U6zYpk
 L5XXl0LNs3aOokZ94u0AF4foEWbVa2Xu5t62rL3EVc/F6kq5D4Miv0B8s6t0Qt5w3SwW5nkmESh
 Edi04F6nteu4zHM7zQWfEWE7XJiuy7GG1fV8HrGHHDorrU76CrUXZz+WswhIarMIJPm1d6RIMgw
 hrKu3y8kS03mYxUUjojd+A0F6Sdvttbn/A/vRzrou78VIIubrbRDIQJuNsNPKkU9QFHfaDK+79B
 evaMFMy0bj9HwPIHJVZOlV4ezLw/o8nc2iDRxdHoMEfiWro463oWdMVc+kSEQS8GXHnxDIzbTrX
 VP+6RlYE/ckkoHwbie3MhLtbdPorSbbxDegaVLrYll29L6nWxdkhS5Tb5MldcetZpU4NvBX4bex
 Nd19VsOMPSosH2NdT+1Z5Vqav9VcSnajV8Sy0caBuwbH8XGBJJg0Q5XADZCWDXQpmqd9MHOh/xG
 7vLG8lxddOVDHo/QfOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042249_897424_0765F12A 
X-CRM114-Status: GOOD (  16.44  )
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

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0


