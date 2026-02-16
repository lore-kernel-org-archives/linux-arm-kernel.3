Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2F4EF48C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/CenaQjYJmbPE=; b=mFGg44nTEQ20KLWlJkYURY4d/R
	P4BdOabZ9TglL/q9LYYXDvodmhiS4hduJTZlCymaO3LV/htPNIQ3m7c/EOQ2qC900qyLB32YjOYfy
	ggXq1zElP3jSeA4ibydvfKnfEBVcw72xfp/do8gMfWKZ4KGx1Jd8t98wVz37P+JP97VQBmsZSL/oK
	MO+XCulkSwOnn5NPBHJ4RYL5BTTIn/EC660GUYxAsXmrCc/t3NG7l/rC7JWk8mqHHVcizaw2KQ2Cm
	FGdEbcBmCqGeniZ3gUHRx/evs1EgZ1ECKUT4+UMb8wr8J9xDBak+mBQDOzY3KiVIMsQaUUFs3RXnF
	uNOwjASw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruR0-00000006Ci4-2bFy;
	Mon, 16 Feb 2026 08:58:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vruQx-00000006ChX-2ObS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 08:58:24 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FNQAti3662197
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/Cena
	QjYJmbPE=; b=ULX1z3fasCSlAzu68vxdEiljLMsObjj12fNzu2uI57lGWTonId/
	q5IEtNWrfRy0fVRMG5astktZrdT1eaxZtm5Iqlbu6mNW4e94xoagm8TD3O+splTm
	ApKl0vQOQ9/e/Sj1aJrmJ5jg+ngOCDNicpzRERTBEJALN+cSn1bhIywtAAyrOerK
	QnZwa/2AeaGrlWbBaNTyltKBIgbBMpWen/vm39smIJ7uU00r/8zgu7e79q1Zd3oh
	U+Yow8fnVJzciwxHIpYiBrEPMT8aoUxuFAEIjguaKrHajxT6SGE/M/R+xh66UeYD
	KmkOL2dgEUJfzweq3e7G5E97T6cZ2z2qh6A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cag24c1qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 08:58:21 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71655aa11so2338851485a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 00:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771232301; x=1771837101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/CenaQjYJmbPE=;
        b=gwo1YsXmRiW6RvCzqPIo2XKW/swA0wnNvqQDBDd1ozxWWSZO2o5sCuiFonV2BQP72P
         ZBTzUY2pGgKf1610HH4cKolY4E/yRLvdnxD0JPXSyl9tVxxwBlGp7LGP+CVyMCVn1ZGw
         ri+D0iA5qfWRON+PzHnntKk+NiVlwRW/crx75qNs2tB4tSTCaWGKdF4o6MWuMvPp++OS
         bQaverE2H/P0YCj1vAL6BNU+hFOy0JyzRaURUVMd8iNpYw9FRSOXDleejBjsUA8ob4SH
         Me3pIn5IcxouEe3GM7z4LgpoYilJDt5XDgTa8c+BVdvjFl1AFGIYqFrA0vcHOG8f8Vf6
         kZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232301; x=1771837101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4grS4vDw5dv2fIpfBzaeHOn9ObfDze/CenaQjYJmbPE=;
        b=LI2lp+VBrSYVZzvRGe2eqr9WNzf4saf5lfYy2pDYv/jOrk1z95xLWUA+bnthKq+NNh
         cFEBgtJIMVoabjMQ4qGNopgX4Um0LFp2VL75sdBcH4S/1uXb4A45w86oqPnatKKCsy20
         56PC9J8Zv0YTq9+URU3ZgbUOrc6q/qNMbhfhOeXOOUc0yAyPjydnPOYFVK25MFhxPTpd
         tdwF69lTAeiZwFPjyhp3e+rqo/NNeM0hFUo6tD8VKDPtcpOxPQr/7rJ0hAqXtAzgKydp
         HOrJitKulXJ6a/mCNFmGg/sZ/RFzRCdtabdzTF53mzK1oHz2cJJFnp5EPDPo7qDqGODS
         FVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMR+f9OoZY1p+juPQ6Q9H/R7E3HMOzp8aVSzjli6oAxPi3mGcbjVriSofEsDv4eQbN6u+QYKztp9oUrFXZHZX7@lists.infradead.org
X-Gm-Message-State: AOJu0YxTIit4EiXAeninmYlFl0ekbQ6EgpR8z0VZuFbT2Xxh36MYMnGx
	1oLlJB024sy2OFUpW9omj2F5C5u20inz+VvrbR508iBmbWs+kIvAcXiq5XslXvoyY+OEtGn2p0Z
	tw4x4WidnDrNpZPUFe4Bczk31Sv9Z11qPHF4ooA0S1kWHCsjD0Hx93RYS3EYpXoigwI9sjF928E
	yZKA==
X-Gm-Gg: AZuq6aJDxYHA8FCYCr89SYCyr47s3dzEvgcb7wlSxcBXePXgu+pl7BEmvRTCQWqAhxo
	eyhmJA8xPxfXHWn+v1eaZ85WO36JR2qxLQ23XkWeqS/eA4dhCXi8LIxWWNZWfJWzNZM2Q+Nu7Mc
	+xTLH9F6u7pIRP0G8rylNKe4aOxxXTym4klq/7sWDyno4+n1RR5plMJA2qVtaE4SKTBaup3xJGF
	QvjWIdYfEdOCYoB8+sLGTF69RPrV+eHIbF/NNQuL/yXs6URCjUICgYA0fYZOQluRhZXXqHNGR3o
	T3+/IpBG5K1YQlaZkBqk9jHvzJIrJ3dt/IPkb/Q/9GdL1c/UWMg+jsVxm/+zgnlySHlWYJKjiRg
	BR/L+98qsS5q1eZxfdi/6m0XX1ntdPDIal4Gedw==
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1046447985a.4.1771232301333;
        Mon, 16 Feb 2026 00:58:21 -0800 (PST)
X-Received: by 2002:a05:620a:19a4:b0:8b2:e9e1:400f with SMTP id af79cd13be357-8cb4224b5bfmr1046447085a.4.1771232300958;
        Mon, 16 Feb 2026 00:58:20 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371a420b1sm75752145e9.28.2026.02.16.00.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:58:20 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Mark Brown <broonie@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] spi: stm32: Use NULL instead of 0 for pointer
Date: Mon, 16 Feb 2026 09:58:17 +0100
Message-ID: <20260216085816.69888-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=900; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=XQCnyPJQzVxYvr61i18j/+QbSb66ztJhWd78xIkKraY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktwoPLSuKARQ8bypqMLbyogxrTd1SpNDCK4Xa
 k3um/HtrEKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLcKAAKCRDBN2bmhouD
 1zhYD/954EhXNOna/XkOpCBJvRV7QyNkhRrlgOHPdpM2QLVLp/rOFm5BZTGoW1DGy813qm+wzMM
 gioGdxgx3GOPwCl5Af/p/AptAaVRZhCKmwNoKM1ARR59d4cIVPPHXQQ5YEu13ED2rvbNvxyo2YU
 TRm/Z7Y6mMTBGxDMGUS9UEzKBQp+IiTUnLIHDff1wnFJoeYg7F/+HMq3/8WDHL7VksBqxUYe9xw
 p00D7WSmxdjKL6ZZ58TfHBSmrRBbMWJIa/gqVxkJh2lNom3ztADtDUwZXpGvMtfk1JOfAF9iwOr
 4ZWRrdM3H0lMU9soWgu7Mzz9EFJ0UUXX5MmkQtQmYlrctq7gPscTzQImkbiAZUyQJTj255Ya3Vg
 TeoTz04pPt3Xs0/wOXz46Tn9T+fFN7jf0UUGS5k1DvMjRxvcR0h2wIQmjcovMQZ28Mf/ghra1Tl
 BTjiJlg1YDl1N3b51r/8ydnE2a2UiZDw6ObUnB6JLytV9RJhveAmRlTw939l0SsjrM+dDuHBdDz
 fIKydXp6fVT8umyE0gjb7+Mww2/HU32dNNxHWTf/FEW8ZUj/ThWtag+9F97ELx6+sdtg26ensrX
 5v9l2syWdlkJcZUHhEYjvhFLf0x7KW1Udi0yY02EaiR1+k3S40FG/QKHL4KP7ifBx6FniWAznGJ cBtjk4LkSmenVTg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bMDJqVdweNePOs3M-KpHxCvhUgxVPaj4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA3NCBTYWx0ZWRfX7gXCtiENcy3d
 PJ/xmNYxWFqbUCbpj6KO9QNuinANoh0Q86YiJWrze9x8i0JKdbUYc8/m/Spcb4qONJHcrV49Whf
 kGB4UWOzHRFtmnsqMXxbccFuzmm6NG4Y89S5ABcE9tFWSv8RtQnzwX0wedpkC2kF5SNoMnpwAiL
 oOlFRW0B6jIvY/0quMAzBDH05lV77EuAH0i9mui7D8SZXKtuTDGDALd5xkxY2lZklyacz8CnyTA
 zTjsslhX92e+sVTiQjLGR9WM1rzuc17HrmDXfD3XWzbEGEMK6w7rF0FmWL+P6H+29fARB/czrZm
 LxPVofW0xvsnttFQMNioQ+0KElncPdUCsbBXW/1ziJ0GZYVpnH9Yu+sNcprs9bEA4W+Yn22h/wL
 7vqKpUSsx92k1r+sprlzZoPuu5w4ESmnQsY8E9IVTra5xN1fpDAeGacrXaSK4+eE64M3PZmYmWF
 8v/JGFZ6Z/xAvnsUeEg==
X-Proofpoint-ORIG-GUID: bMDJqVdweNePOs3M-KpHxCvhUgxVPaj4
X-Authority-Analysis: v=2.4 cv=aetsXBot c=1 sm=1 tr=0 ts=6992dc2d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=S3UOEAcGOv3Q9y8fZdcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_005823_732520_45B35889 
X-CRM114-Status: GOOD (  14.67  )
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

Pointers should use NULL instead of explicit '0', as pointed out by
sparse:

  spi-stm32.c:1659:65: warning: Using plain integer as NULL pointer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/spi/spi-stm32.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
index b99de8c4cc99..38f6bba38b07 100644
--- a/drivers/spi/spi-stm32.c
+++ b/drivers/spi/spi-stm32.c
@@ -1656,7 +1656,7 @@ static int stm32_spi_transfer_one_dma(struct stm32_spi *spi,
 			ret = stm32_spi_prepare_rx_dma_mdma_chaining(spi, xfer, &rx_dma_conf,
 								     &rx_dma_desc, &rx_mdma_desc);
 			if (ret) { /* RX DMA MDMA chaining not possible, fallback to DMA only */
-				rx_dma_conf.peripheral_config = 0;
+				rx_dma_conf.peripheral_config = NULL;
 				rx_dma_desc = NULL;
 			}
 		}
-- 
2.51.0


