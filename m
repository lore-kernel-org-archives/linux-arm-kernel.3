Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4037AEA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=vdbO/Mi8TfM5o+DeGVvzpoqRgz
	T06xApjr5NLBxnD92p6mpDKyElgKjUzGALQzqa+HngIL3csCjTNDFiZSrWFjKmhdouAzVpLJgHMmc
	NyTd6gC8sSYaMRbPyrd0T0kJIm/e3xe82t9E/C0RD0iRd9fid1Z7Dc4gW+xnBwxEkRn98kcyIG4ND
	Eza0fzb2I3jswW2eELc/jJX9+GJiJf6h3E07LO5ExwCgwxPStwb4w6iIL6sN4FyZH3EqWs4fsoxp6
	rECPxTIJEw/Og8icSYtpfsZpZmLQfeMj8eyDMghHLMDrcOYmBU8HYeR1YUSMiu3ZLrGEvTRn8j4MF
	NdO+P8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ea-0000000DQ1U-3TCj;
	Mon, 02 Mar 2026 15:57:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eZ-0000000DPzn-2frf
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=OyEXZKHVZRvBq78Krv74t0LxLP
	KpAkqKB9/Rsv9CjXLI4l3zjwID1yo6PdM8UyJohDHShUgyzIZYyjQN53v9DrAMlPnEMRKcx5ODxYX
	tskfYY9AHd0eW4XchxA71GLOlxUg8/tzka3IzW3BGfa1u5+XYeSbB637l4/5DST+OCAoIVh7f6/Sb
	vXTTzofD2L1iHYPlJ1Psap+yz8bO1fM7s0Ner1owH3ExCS19vKW47lRoKiv31rlSD7NX9B4Ot29XS
	d1r4zoC0nybF+EjnU7pWBQG6RnX22C42jg9YAi3Zn8tulmH8FnqBYxvODCgekuPa4JYJDSrTSDwTx
	92rrgOWA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eW-00000000VAm-291o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:50 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622DpHZU057664
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=h7To7dNlo0bGxp+Q
	EZJpBC37c5uNiXjvM/ABPGgFm08JcRapbDq4bokRXb2hoj1+cklRuVsyaS7TL156
	M/8H1nbIJmx9JxeZoDi0BYnXlHVGFxT2dz+peEgtrCHYHM+8bgOUz77LOSRIvys0
	/2wQ+cwmzHI8+2DbALliOV8hMwAMLE6FBbq4X8mznMBlNLj9/baRnuntqWXKAFfZ
	hqbeqqx+d1/JiTNeGv4WIrMiQS6jv7ejE9lDLg2ArU3tllwtya/tmbSv9fiE1vZJ
	mTqRtBXTROex5jkFZWmFmaIcuA1SNJuSY4lm2sTO03jwF800HNLxptonmIYYXs4Y
	rGlcbQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64b1vf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:46 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3fae6f60so4138756985a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467065; x=1773071865; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=atMGEk5j0sQnhqjEtccI8QFb2l+C5TJTsQUx7y8zF90P4CrnKdX4yvklXzx7SY1/+y
         bZfPzhenH4on91yUyTXbkBWJ3scqrqFkCLdOo4lOdw99NzxzT2pkf0xQA+p1fNKPEXKi
         DvoQMzKP/qwaYyJvukvGBNdfculQcV4EH2pU/mzD9zPgbNCJzdXEVC8H7j+2uYPudb/z
         qh2AwfONahC0m+RKbDYgEWmm+aGj2/0i5LjBrDx1o8vYNzZeyA4MLfZ7NIAvQUDs0O7Z
         uQ2iK/5GGEm3FJC5czAVnP+hhbGQ1dFYAdGQWerfyIid1g/sweJ4wIC9PODLKYF2i8js
         WG6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467065; x=1773071865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=TSoBis/8xx3WFvtfv35Fd/0meZlzhoVzUicuC5tv/yWAtmsQQRtJlGqbYMrSxYJ5jh
         1h8z260YXoUx7jEEpAjLlr+nErF/CkEW2wgpXS3fkGiVBEsF1lqjf+xPb7sKWVjJy/jw
         TAKLZiac7OPEDd/GQHe0jwBsOFnCjEl+ufut5lZoQZiZMfLZ8zF+GDIFxjwSwg/VSEfB
         r+3V/hkgF+A8wkdlR/U3pX3LP7wymsBWGOcEpqjG+R/06Wc58UnxsN2p88Nw/Ulw38Fu
         dIwRyN5qomPqrES7owhsY1DTUSbKrWACNhPAcfAororxTBtVqORDw4KwuebY4dh9GfsP
         305g==
X-Forwarded-Encrypted: i=1; AJvYcCW4+KfkaRbdNiqaCplDd8eLkKq7o541MKcpBuXtuJRJmRdAisAa9/Zjvu9k8Wu/mw8HfD4KwgT/RQDns3itr5vM@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZg8Na4HoTamPT1IBdXvoOY2eT1nXIQpdWAOGQPx4P9aFtXwN
	LC+kWJyj7Fadg3L6/aup3iVJvQRslLh+XIsGabzRUKwteDtNRgKCCDXHE6Cilo1XCiEJW+pBPC0
	3uMtnGWRde6v9Wkp1fHkJnSKz7yq9D7SCfxBib2PHCZYmGsVXkXTVnOyrMLc2IjnFt91InpfwKv
	TLOA==
X-Gm-Gg: ATEYQzz/S9TyAKqH9/kvUz9KXM6r+kwWmfAtemFPCINo86RHk7UFepE8QNoYURowd7k
	kVOHhi43WoUmWpGvMgJiE8R4GEGrNaHGIvZ9XuKb7aLUr1+dI5hc/hxy0e96NYaP9Uuhp2y0OGE
	0qv7lj3EPC+/KczRxwlWNrpFhDJptPp3dlzsPlXj7m2yoGSJA72w3qvzpc5lC1KA9EmWvCFvxQ8
	J+US+9Q5kaz7RDwFBlqOudgcIeBdeVbpzEc/iHIxKgjIAL8S/o2qG5umbli9arSlO4QHeiVssVk
	QjJgIdHAWeEO7xaFvZvjMQTLvUv7z5JC3o5WkeEbEdkHhovB+7wCB1JxG6an7fAfFjYPS1/TDPp
	cbYMv1qxDeuMmK4Zcz8v3ME2eSzLT290YYuGmrFtyOYMkDsHqVbc2
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1857931285a.21.1772467065325;
        Mon, 02 Mar 2026 07:57:45 -0800 (PST)
X-Received: by 2002:a05:620a:489b:b0:8c8:82cd:1a85 with SMTP id af79cd13be357-8cbbf3cf0c4mr1857927985a.21.1772467064814;
        Mon, 02 Mar 2026 07:57:44 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:44 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:17 +0100
Subject: [PATCH RFC v11 04/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-4-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNn4Ew/vxQqWEKjOV5+kouN3wqG17yKI1J4F
 U5nB8f/UuiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzZwAKCRAFnS7L/zaE
 w98MEACqc+YM2pKSB+KOfm67CXPbkWg/mT5lZOTSPM1ntmS/L1MfDMb60c+eQecJ4lEeV3FCsC/
 ZVM7g+eaXqaj1RP8KdY1UW8Ri0uOi8aMV2YMb9IV3nLnCTAagMc3zVeCB7qLxz+lIFF2a4n5tvk
 ONg71SWGZUfjhsYi0MDvjnU3xbkyrTXdokdHOqA3LkZTD5MzoHW3sEZYDC6Y2UsaJ4DVyoO0GoJ
 uueMwVDz+OO3UALvNpGAstuCIzF8Y+GhEte0Gifb5APDDFtvhWKas4CyRcm75IHpVhO/Ra+Ev9W
 3/JkWtSAG5uN9hwqvf/hE7CLU6ZsX1EzobcgR8ye5GhsK263n8yOpwWVYHMUDXNCr1fbSQjmVPE
 MjK7aiIzipzUSe0LDA3Vrvz8DkKftmas7bb8bUmW2AFpKYniRVt70waSfjh90OduCZpAYJkdeLG
 LaX9oWPLblAVEqTuINU+Y7k5TVTpzPgIfvlZ2zYYcTcl2E8aIFHDw3rIA5WkPCjJwPpqaozxAsg
 ZOvvGuVn4Kw3MKXbPUHIPQDezgKyOpcnSyIPn4KJGGT9buX5tCyNBcJiGyZatojxqsTPI+z0/Lm
 Rv+88mriwxosWTA2Y0oakM2rlOwyQHRezuWe4NRpidvjrs/IfjjKqxpvK9H+5WcPMyZFimZqKOg
 E4IxnzBW1z1uh3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 9SCEh0fU0O0hai7DGs69qExTXOUpB9xG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX6Jy/AvBYHj51
 YEXWh9TJHPU7114TB3QvdnZ7gdN3YxE82r5uOJz65699vfctoK4GIyraBfdJ0uYIOE1lzDjB8Pa
 It60selNIbuieYxH7nKEuThsTMSQ4Zjj0R3pqUASZ9+4OD14k3Ie5uXer5sKSlHLE1sCsdCdl9B
 5ajthb/fZs29DBoE48VFi0XmcwrwcDAFm5wLvIXmFzhqRNhmi1phgKed/WJ7Lt8HsUG/NQIDvG2
 5urf+GTc0QzPbufCrRMZ7YdAMNrwZ3eKK2rfrYks4Uu63lWOCOf6ZHFnLTyO1migYl3e75Dkbjj
 jlaO1XV3eLQUVsbj8iSrlcoJWhUrM8qLJfmD/YxOi4jB1YlAF7D9Gy1c4lAvM9cXkDmepzo0d6/
 D4PDRa6cdx/TjrSR//qJeTdHurBpVR8CaJKhb0rqZDQoNdSPHLwSrqVOHBH/RWdVd/j7IQrBhnx
 OtiiI46lszf+J5p8Yfw==
X-Proofpoint-ORIG-GUID: 9SCEh0fU0O0hai7DGs69qExTXOUpB9xG
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5b37a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155748_930236_2FB38564 
X-CRM114-Status: GOOD (  15.25  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


