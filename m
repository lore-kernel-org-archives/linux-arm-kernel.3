Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4259C44533
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=IZoVgmEUeY7DpSp1QVgCXOMyzo
	xxr57h0PUx3gO2hiEwKspSrA3Vjoksp/9e8/SRTzxO01Sd7MOP56Nl1EqSbOqobFQjedWjmqHPNKd
	dKcvSuyR4vcm8vZyAOKi3bUTQ967GmDd0aDm5HGkF9i2nTMs5Wtpuzpnm7LaJ4AvGQoRG12DUTZvk
	X39816nCavCs37nh+xEty7ILZXX4U2XmHiaeV0c2ZKu1GkkgV6XUo4V5L9bpkHJZXSJP7oUdZc/I5
	nsfm6Oh6iyhueRJHlTud1ZdrRhkSdone7Lj+cXiD8pZ2bJK1FRMBe7+7Zt0qAlpFXztVcC00Q8CoB
	UyqZpnrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbc-00000009X4u-0iJI;
	Tue, 21 Jul 2026 13:33:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbV-00000009X1N-2gFl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDMBw01922897
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=ILqt+CBKyy9yRzno
	zy0v4ezY9HELP3q4XYhVQiU0KhcTuuhN34G18Cjzz07DrxxDCCGGeR7ut0jgNJOr
	bAg8/yxIjzMWUIMfkmRoYQlHp2JhKrVjS2lZiN89JjfP0LUVbD6CXxo2iIp153Bk
	b/koqsSEw2ZvbViKI0S0eAxnSSeY9wdmDn8eSuonkL5DsouAk3MBQpJcK19MxEUq
	CLL0nQn7lqabsj240ePfIQqbH4xyBRH4B2XX/NuyzXuF83AcWFsxPljBsjSgvk6T
	OqA1rUCwZJdRkNCmY5Z9NnxxZqXiQDzLc2w5s4l2fx7OjB9E3JTgjtpEYQkDBX5n
	7v05hQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj68611n1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so175990581cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640828; x=1785245628; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=ODyuI8jrJP+JhcUbLViVK+NvC12Xg1322KdBt/iSzgJfeleeosxa7h0b4CvPQ1kQPn
         MVEW8/3ksvTeZ7zCgTbEOELop8bFILLsmuSzXSSLmYJFoMuNL0bB/WOMkSlj6fR4Z9mP
         IvnKN4wqGk7iBuht4VSMTF96WzaPFqGO1/25Y1lpUpvS4TM7XnTscu+7iqj/bIxyZEkG
         DoDWeu5c6q5M37vwOhxLrjhkA9gAGrDm3m2aDkIIBvURqHqw0hNup52uh7OkrGJPLFPB
         avEIHT/X5hA3nenrS3S0eeeb6NVPw+O9/+q9G2uZBgt8+S2SxTnrpI8n6qBS/TEhjdlV
         DxAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640828; x=1785245628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=ENNYwiNTxJ0llU6osLzS1Tw0WNp/SGSoWEsIPyvzcbQyinNJ4+nIGiW8kfU7QkTSln
         f7Ka4FvyCUskRVDgJn219M9MZL5fJAo6tpgQFetZM5T71ybJT2EKobwe3mPwZzhw5Sem
         1BeLZuulKw79sVWDQhigH1szgampYPC051Diu9NZGIphyWz596Mk5m/pWy2R8tyHLGbD
         zUeCAVhQROaLs0oirB5sx4Uj2yR0/xyuLE13B3QIuHQL5IvsDmGjF1HaKM3kAKHdoev9
         YeFeR8W4CLLl84+auxljie5l0Zq03v+KLT8Z7BPYnRXXCxB2+P7vzsfb1nVet/W6/v5h
         XozQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1tvsJNho16tBUIXRWCZOoBEArTOIXWSkERvXjDnhccMzpvu5s8mOocJ3tOem4IgExXoDkol9fXMWSgCXh1skW@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt6Vexx7/Q2cQ8gdw8lWVbB1H2zZr/OMtyZw2wtbemJ1Ifeplw
	tJtbu179rHrM37n6ruSgv/79dF2v2E5J/cgZiTGYxnBC8K7H7tZGKo9r/Isuwq4R2PvnsCQAeLn
	k8sbsqtdj1e0yBRotYCB4m36RIV9k4g/p568WY59PDz9S8eLWwpRg1EQ+73caT78jrGfUqrOSlp
	C6cQ==
X-Gm-Gg: AfdE7ck3e/l/OZp3TSWArNi9IbNwVCgJtSnxjQ7nIUtrpcj3U6LvJ7x1uO5w4YyyGmw
	YvLdSC5dPqbH1TtguIHMwC4Psbcuq6Kw97oTc9DAceavbWY6X7/wSgz6BxITh/Er0+8GfemmuRQ
	Pm+QMWZLP92F2g4sYeJhTuVpMrMintJfWKsqfHpoO7SXYIMwSYJMOJuTIypkmEVspvMBAF0LcF8
	IgrWa2wUtlA9EsYIMGp94DpcuqTH7gvrxiEIE8Zugcbtg1WSOxI4q6NRMdW/GgN5RjbaD+YW5zK
	oIc2MDHDbfwSSi0NEzWQVTm+LueSd/5kbuKPsY2TVynD7zu+6ZVDu90vSPSFZmy2v6udZjcyz+T
	KFNhe8kw5BDHPlIfrjCiKDkRPhPvrBQ==
X-Received: by 2002:a05:622a:590a:b0:517:98e3:d939 with SMTP id d75a77b69052e-5213f66c433mr168567201cf.49.1784640827677;
        Tue, 21 Jul 2026 06:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:590a:b0:517:98e3:d939 with SMTP id d75a77b69052e-5213f66c433mr168566431cf.49.1784640826894;
        Tue, 21 Jul 2026 06:33:46 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:09 +0200
Subject: [PATCH v23 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-4-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UghmSwXVyq7m59vzKyg99glRgu3BNXPoypi
 QuoxOzsaSSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91IAAKCRAFnS7L/zaE
 w0END/9iwC64NYoCh05aYDKdo6yuya3P/ckHPS2e82lbnAvVMEoQky/EnQxtBDFPPD0x5skWCrI
 1KPqHdM/YtfO5MSQCVST0YtYoYdMDJN//zS9J+pJz2a+YceuP+Cg3xAKhM9va6B5zXaoPvBfBFo
 oypgIQWmg1vrhUlXgx9Qp1Ju8Sq/iryvv8NZba3CwsqL+U/iw/ER0zwESeiDAR4mJj12PJqAG8e
 HaDfsbo9t27mPvckcUx/k+GdRE6YwKsunBgq4UpyxhibYzZJiMPbB9QCMOqd73mYkJdSZ+TtsWu
 id9tVbMovuNEb/va9mikIxWZhr5ycBHcArZeTcDFn+1Rx3jzq8iAOR/WVsRYKFJWZnBoqV2Ag3t
 q7r78wyCUP/amC+2S3OCF+K7NEf5FZ25sVyFVnaz49AQOH26o2OeIvrfbyGu/JH2WZpoziCimxK
 8AkMFm0QypYc4z9LSheKtNxveOcTD6H6+px7AAS9qDBeyCi2l0ow/HWEyU3JPF9PwyI31Ktwas8
 QHOBB4j+DeEWhk3sIb2rW6usqoKM9yOqC8/c5xXjBJigG0JFgboRIrER1fATFg4OKhBzAFM3q+3
 ZgxkDIzGk0xNRtp2PH+Coniqn/N7G/OBvC2iMYhl9yZtj9PpsW/ckRpej8dNm8hEROaX/95Hmtf
 OM8PlqAXsoJE2og==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4FVWGXkpBlFP
 sBKp24foJNGdbX9LFT1JzoBM2R3kJAK9rIbt+6QbRx4Z5/PIydq5UxdJZkACNsFYkNXQB0S5mAO
 iG9WsfWxdsOEpPNE1A53i7NLWanz0ZQ=
X-Proofpoint-ORIG-GUID: DBNlHWrvLN6dvxpbfuTJw4sN95524Moj
X-Proofpoint-GUID: DBNlHWrvLN6dvxpbfuTJw4sN95524Moj
X-Authority-Analysis: v=2.4 cv=X75i7mTe c=1 sm=1 tr=0 ts=6a5f753c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXxcGYTVJ7HY/t
 t2udD9ZHYeRNIq+kwA5dVU9qOfAskyelmHb6iD6zUJmRAVnh9hfExdu7cRdB97KpG6FoEgMwJqy
 7SFFT4ZkOqYZcybO/kwNREEcXyIX2P0Oj4yZ1AUrQwCcSAsjYMm+9gOFTfdDiTP63CrJvHF0W3g
 5smFUEwaw6JcywCwSE5ORotvA39CTw5pMhwFFHb02cF6srjKWj3a9LcU8TRmkuI0V4BSZ5plpER
 2XH2wFhQ0d7rAuwwbEXBXSglJ6j/Oin4EzsRTUa09jND7a2rdGHdxA7WF+JJn8+6oKFCowWpf4r
 2Zhg4rqqRWihV2vwEa4ufx+Pfq8rflUi3Xh7ceOKBQi/rG5RbSVGcSPGW8oHSVpGsh9gJa1Aa2Q
 9IntGkDGRQAWqFLxnBgeDd4a+Xq4MfsJ3vpD3UhwuItu5ntlym49FmzWkXtkICoRqzY3cORtVIg
 TJE4+Rz2LfmyyymNbFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063349_803828_400C4055 
X-CRM114-Status: GOOD (  19.50  )
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

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


