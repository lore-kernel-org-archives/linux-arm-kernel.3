Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F784D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Nov 2025 12:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=jxDhqY3+f5BD1wjazuDPCmS/KO
	QaFuAsK1FZBTBjau/7oqibN68gkSjqTubxias+GyyqvoilQj2d1BzRE7Lacu5kLHEzzy9r/XA6EYX
	D1EKeLFsw3mg0mumi5qkszQuS6El5OHg8/4S4CyF2AOeevw/4J/jDSaj9MASnzeTLxx4cmSmM5aer
	dOKiJMN33D2Xm0+becUfcTRj82nn5H1GtOis3CSnrFAtfLboKpL9ZiCl4MXPGzECWpl2rmYov/MP3
	d8iRxBDk8sgoGVlVNadOGFFyulOr32Xri7S9v+0YIqfe9RcaQZTxzi+uFBk4OvfqqI1YNgrAwDVL6
	1Sd05ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgfH-00000002I1t-1aNu;
	Sun, 30 Nov 2025 12:36:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPgf7-00000002Hv8-12Xl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Nov 2025 12:36:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AUCAPVh1455326
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=; b=TpxT7ZCnor5T2yg3
	AKgmBbRB5Pt+U1lPauoLJS0xDRXqqO93uwhjmP1g6U+ru+mDj19cHM5kXCpC8xkb
	/DN69xmHIx9y04/TtZbcu1pxjRkSuucpZ9iiwmkGW1hHgIi0UInB/FM5GCtajS8l
	TanJTGLjX57AHO7tDv6nG7LBnQEh+QEQbTR1m39m8bY3G9NaHZFEgiuBVZQrnhTO
	XwmXHfV8aZ6TyHXrKZxwkYVQb/aXqogQMz1Jv/TEApwBm3Ix/XcKOAc5eSMNmOI3
	leAWHVHZ1o6DZK8hoTcfOOKkZqFLsquuCNVbm1E3hTiPQ0e+MFomBCu2X+R4SAbh
	/NR0sw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqskf2413-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 12:36:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b30b6abb7bso627117285a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Nov 2025 04:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764506178; x=1765110978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=LAcutG65fPzz0Afcw/zs83tg8tbttGKOkmRBFQvN2nmSv1t3VHE5qGhFggz48hvien
         QGSkL+RYqtf+UxKLZQTj+WwMazBmz7lm6HazZ6WxqK9JJYRTghlXOPxK5Z+ljAEkVmfI
         eN6x+270ULSc9vY+YL27YdOzGdGhK41knOJUI+SHMlEMmfXFrWf8BCfN7PzyYxT25X1i
         s4kdT08NLDpNJ8g0aCd1GAgT6X4Tduc9YjNjiHKb2IMCWfEp6YsfxeraWBdZSUbYYuXP
         IoPaqpC29OG+GdHZ/RNm5jNrWOFerICOgqC2lyzBB1Nbhsca7RF2MHnnVAHQth2gyZmX
         t5yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764506178; x=1765110978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e4n62F7hOmaFjnTCj5sDtBY7XKAle/kgKH/bYoDqk94=;
        b=QFN5dt4WSemNC8Rf5QewNVJ/Bp+AfNwCtWrqeRZgYDkB25YrnXY37A1p0PbmuJjMmX
         wsYANUqiOlh4urCA0xq6ltCnCvUm7jAItu9NyMR0Itixxk46gr2vtpbtaj31JMXVJg+n
         To0CuZZHF+n9IbT6my0Uqx1jxYQgeNXwrIQhUaxoDRv8UBWxC5ru0XMdON5c8yS0uy7F
         S5H6ls+9t3covKP1tsgu2h2H630TVwPzQI2qhXQ8S+VLfMwTITvWq49JtC3TmzoLMCnB
         8wPEGo8+kapo3ih2e/7+u/BAB78ih3FR3Ld8tkAX1uK4X9ygjeviMCV5LkxQhQcYmElG
         3ZHA==
X-Forwarded-Encrypted: i=1; AJvYcCX+N0X9CmPFmPi15C1obvoTltloi2lTma5Np/4oT1XfwvbHk/AtZD/SZP4j1zcJvQtQ3167k0sjgGJxF9VLh6lw@lists.infradead.org
X-Gm-Message-State: AOJu0Ywy6J9mFnqqH1T5JwuiF1kkr8u4e6bTlRyxYL3+kxhGDHT102Nu
	gcXXGiQlSt9DpIFuJKHbo2OvgSK5EiuNrKdP4qjAM1TnjNriSntitnyz4d66TGoSr5L837Bfps/
	UXwtF567mE4XRzYLPmznyhJ9zsdmFp8S2Vqdu3vEWnXBc8Reyv7HtWZFtKBxxA7SuPEByeC5JLI
	lOgA==
X-Gm-Gg: ASbGncu/0hBAxq7iubN6yr6RgGyAxhYi9fOMsupqEI+wb/O0oplGiVQbFcst2XzeSDG
	GCNvr9Kfrr4ZJbSXU8P4zjQm3DpUlzkoIFx4gmtBwUDqM2p6O//p6H3cHk/Sxb77x7K7mcHy6i2
	6hq41gU33rNyMKWEU0sSNvAT3M6CzkRwqLFiA/OlLORqadZPDlnJvIIJTISnVNZshKEdEv752X2
	mmrlCLaWTPyXoySj/ZLF+I11pfqTh/QnJQgrf45bV2IXlYLmJG4MCm33h2khW9xkBNSIHys7X7C
	EpnDHG+rVeY+czw0G9NNi1/BV9IaNKxgqO9bpTqtZ3t1s6roLqqKbo6I74B1YBqFgKH4lGhE2IG
	3NMNYTfMoQLJ424V+nC3LAA5BKj1wFp3jWQ==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721866085a.49.1764506178421;
        Sun, 30 Nov 2025 04:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwd83+g8q92x1y4CWxFdCnR6Wp/D+6ypCjsLsXp/d0HHxg4TfXOyYZHiS3ejZPS6LsXDPMgw==
X-Received: by 2002:a05:620a:4509:b0:892:eeb9:4def with SMTP id af79cd13be357-8b33d4cf9d0mr4721863385a.49.1764506177949;
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f51c6c12sm920506666b.29.2025.11.30.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 04:36:17 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 13:36:08 +0100
Subject: [PATCH 1/4] remoteproc: mtp_scp_ipi: Constify buffer passed to
 scp_ipi_send()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-rpmsg-send-const-v1-1-cb11c7e0a024@oss.qualcomm.com>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1658;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pq/+nMdyC+q1ogI0/TIhIirNxNxs+pUe22DWF7lVnBo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLDo77EwKqXOJTM+99Uw/WZdDbkh4LZ6TE7MGd
 58HKTs3HPSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSw6OwAKCRDBN2bmhouD
 19GjD/4yqvoVdSiFtXLgPtSNjWBghlWA484iGQ/nvK11zYtmLSt73fjHu+ppUkACDE3Gzj+MQW3
 GDtp6bRzB1dZ3QT8+hLu/z1ccX0SfUdcsfvl8p/37dFdHApMe6rolFyGrlIn2G8TYijT3nYGyB0
 izR8XwMJza/i4Fmr7yUyAAbVxOeHbHI3TF5CozIZns+a8GS7giqH2FmroISq6Lq16y0TDHRwJqU
 A7ZLWYFUb2KyJTNwdjFO0sfjVkjqx8e/PKvM6Bzs8E3btdilFt/KcUIM6FXwFsUSUDpuuiRQPqt
 Qj5mdGUxGAffYx5dow27iCxx6uemvTGdgakcUyiQCaQuCytEbDlh8Ocm9SRF8XuTaldc8Wtagkh
 qNyDq8rMPwMzoHaW/BS0a54JrP8GZfP+40GvH+Z58mM7JNH6UoevmOFeyzT/u6PQ4QAA/4sskOK
 gapow81/rauguxhutkRhwgqWvj3E7v9wSscxUC06Tk4DILYqPcd4gzxySFbYZrqEgx7xXie2fDj
 r9mOc69XtfZRc9kYxDe15n5d6KEqv/5+uAg4SOlFfKoJjPjNu3LRCs1QldniZqnGgp33WEh3kbU
 gRIEMvf47RDpaZ/ky3EnM/viU+sU8FftAtiEPtskYBtbQqyRQD3BLdg0yLoExpWQ4Qro+t2IVvW
 Ps0SCz8LoJid2Gg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=X7Nf6WTe c=1 sm=1 tr=0 ts=692c3a43 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bWW22GgIgZmb96Hp9REA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PuJbuPirSo7kFjSEl0D2RgWGk6W7zAVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDEwOCBTYWx0ZWRfX/77dxnsMuE/K
 VlDv62B5XstMfxHD7ps6rCGVn3ZWToWacynOUm+/OHHTEZOsyDHobnhOfF1MjKMNfKIUxBFP1mT
 zR8ptC7IFpNbw+P+ZeMwIRWSxj1+tUk+gfAAMJD6iQdvBUpEKJfnoOl5jbY4Hrehm1kkAGaRVo1
 LfMs3Y/tp/aG8L81VgCbH4ZD6mMh1GPnK5kQOZ9BqHvD4yOAwb9IfSU36zZWLBKBbCFAtDOLmd4
 G7t/U6JyAGu+dMhKu2iimLXw/vy+JTrbRCHVPQdEWgEvEj1mu7n7babU5A6FSjnhnh2mgHs+Yc8
 c2AubXtNske25sudCfdEIA6QWmZ61CL6T0c9avJrGAooOvWDk47s/sazpBTekoV6bNXIa4IydnF
 1qXTZ81lkoKJEqRlfIrdT5yTgiZ3gQ==
X-Proofpoint-ORIG-GUID: PuJbuPirSo7kFjSEl0D2RgWGk6W7zAVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251130_043621_284250_43D45F2A 
X-CRM114-Status: GOOD (  15.66  )
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

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index c068227e251e..bc1ee82cff36 100644
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
2.48.1


