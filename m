Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0480EC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=jM9/GEFyxEu3uTcn7N737oEYOn
	s9WJsW2EJ/KYK8HNJ3Ipv+Vr3jbDwFexXRRHL41TYtNP13D03BvD7lqe5JETo2XdzH3OpRnWRvIFo
	9oA+GiWwBmC6B6NcHNSJiPDyd2kvwU1sLYFWkGo/MNkyor49RjQsCMG6TT4mYohAE8vibHXIlWLno
	fpwkmg56Epwm9bxmNrEvNOxcU+yQVIcF7c/JH0Q80MBGa/QRraOED/3pXRSY46hZgmNfwb74BDMfU
	JOetL+IG0vH+eBvAtzX/J9GAk+r9XI2zWSN27M/OtnZ6yZkyBRukO8UrYTfl3GzxzD1ejQYcMcxPO
	Zd3FxZOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4d-00000001gI2-3t5n;
	Fri, 17 Jul 2026 08:37:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4H-00000001fuE-0mZn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:14 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cG5A1065334
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=; b=OSgaqMl0aKmYC9ET
	UbqKG9pNbuwso9D3mvZDHBxo2m7qGmHqLgImz+Sqgv3GXyOUSROtsPOpM4mi9Oeg
	BYKlwl8JcTwRLUEJi8InijrIUFRjfMYNxD3V3D0M0DwMMmezMsCmc+sL3KIZNb82
	JrOITn0dr+g3UIu0+8WCT7K2xg+z126ncS25QzmCit2/ap5sM2Z+NFLc7I3/vAsd
	2osiJEwYvCe7lXSNO90bw2ZuOvmjZ9OV9ebuT3WOYdseBs9TMCHcJW69EsZJay+o
	t4QOlBO8AHBTiJIq1YRM8m6gAQdb3QjwOyWk27BXEsLGpLdIjYR9Ns1C+5ii7XD0
	7MXYoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbquh7ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so130072831cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277432; x=1784882232; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=jECEUy4HFFyv/5DD5UrENmOwhUqzevpp+zH7FLtmm/LuyW3NGG4uE4pXNebfvrJNSq
         xPk/YDyjDJMHKIw9+Lr2QWZoyZPTVHszMFc+lSP123osC6n0sWwReLUmyMlWEFbHpdrs
         Bnq6Lmsi9/do/Se5iS4cK5rreZMKHe0i6N5d2g1zpyeY41N12jBb40WSOIDKfMwQ8/is
         itpERLenC2X2F9/znMyddD/e7wk2gNmD0kljbzzqRwpyO8/btEQasX/i8iRirxHcwzmC
         CwYrGbDr/q3/cM3jNFheSJ3/SIPFtHhO2ahfwaHehBqA/Ye0wTxrWrvq+eMGEwn2MUPB
         J/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277432; x=1784882232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twry+rQD67k4KXlgASz4DIRuOCwVvltNp8BQTuA56nA=;
        b=pO7gRLVeYJKeAgJHcbkriXO69jrRXvtSdzWlzZK384AUWz0YJa3RBzkuJtnJFsqxF7
         /4YzTGx0qebwqQZjaCx4fmYXL9Ygp8/ipqT5ydG7+CTj0xWXf99fADQdvRvcQxxzgl7F
         4Sir75I4K8QUtUmt9nq6SyetmZkS/e+gKCvJ37oYPH+GpYXaNSuPq20bs4RFu8Dyzxk+
         jTCOW4ZvWfBvsDDgvXBSlbWi0Kzhtai7jSvvCEp3Jnjur+0fNnSt0mWyVj95Be8i5pjc
         WWYMXo0iWTV1zgkITN4MVJqldWzh6w3Etv4w8zPnsxtbcoovm/4uTJS7uMF6hxFX+NYK
         th8w==
X-Forwarded-Encrypted: i=1; AHgh+Ro0g4UkbV1uD0m3jnYcKSViNcofQiPCAMjhKnWl8FOcy0Vx6oZSGf5DH6cg6ctTYNvoz+AaDdfuaZkUDblq0ONu@lists.infradead.org
X-Gm-Message-State: AOJu0YwXxbcosa2KCkjWN5IohLtUy0V3CPcQGWacbui98LqN7RPfOmMc
	qr0Sz3WD55t3snx33Rzj8O2b8sceJXxTeGSMRDW5hfpgh5bCqm/hRnB6j8zNk9yqYv/7LO/hXsI
	Aq12zOMMI+DU7CoecLGRd+oKyOprFsYzkdG1tXLFPDqaCXnRUocek6waam2Bt3SScrHdnrqlNJ9
	FG1g==
X-Gm-Gg: AfdE7cnFamiEXiPAdldLDBCV9T8dBOxOSdFi8pG6PtsuNnd00dOw0ArbxlEtBEQ8Ahh
	AMbFNTHgmQztZW6Ts3TGgMLBubc6d8pDEFkkDaYz+xd6JxhbljzGCtj65hC7n+U12xDapFnRbn/
	m1Y9yX7bxzh0myV1P1fdPiymutijeUvNnEpXe4sQz3ufOEctlXB2MQMc+7pX/VHqOn6Aqqg5EOh
	ukxGb1jN0A5pixyrtpMj2/1WhP0jtXdrWSOyvpedzjp8/AJuBvN2jpTGMo4BCCv8SJv+8mh8PoT
	F5EpoT8w5MSdn8Gnt708NSfieyZA9SK+x47XHo3evEYawVHqViIOX7tEHZUsV7mgmQVpP22zwR9
	641j/ZPQiHRW2QHJMaHe1HVg1RClUfg==
X-Received: by 2002:a05:622a:418b:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-5213daa1d9bmr13282121cf.46.1784277431754;
        Fri, 17 Jul 2026 01:37:11 -0700 (PDT)
X-Received: by 2002:a05:622a:418b:b0:51c:4fba:5b12 with SMTP id d75a77b69052e-5213daa1d9bmr13281651cf.46.1784277431284;
        Fri, 17 Jul 2026 01:37:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:35 +0200
Subject: [PATCH v22 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-9-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=j6XY4tGbVrzzivRLNBnBuYRESnCKLFI7yXVP5haQkuk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemdczVwU/9nvIx55Hfh4Ky/83k3YY3NS2RzZ
 cZ4fCqSkwaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpnQAKCRAFnS7L/zaE
 w3AxEACbwrBfC7Esgs6dcpgEttXqReVrfPK8KOLqhWJv3vEhN6UF+PBYdph8VDwqqjoxDcmjMyj
 Jbocfq01pM/8TUD8iP9LX/TaZX0g8HhyuYj3elcOWBCo+jGKSVKHxMwhhzyBcLPNsISdUcd3Oev
 5my5qUJ02IKNTio9C0c+oM3jxs2nbnCiEEWUl0FKjHvZI4mHBJetvCxYRcI47CyGyeAvpF/dPir
 6bCpnHS0YARlyHS4INg1iSnB+/znQvoYBa9mPSjagwPCdLOOdH+qTMolHOzfmJt+7L+T5LH6Ta7
 tDBTxFUQU5Ue4Ck61F015+E5/MW7upXQgfDkCGZPJRAcirhKb9ax6y7Ni8c7YcC4YWpVO07f+Et
 1KmrSPdek0+o9pRBF1rYHDkdHgWNvbJ0ZOgOr6nBNJQBw1ioiZsYtcCQ9p3VaXeegEf/DOeYgrR
 KKpZMDIXPRfrkjSoxun5bpQGmaBgVrmz1eDCfZVU5i2Yvex4l4XpvSaYMyOmjFHj1wfAOKjZRoW
 pEKh5QuWS7CYT/I1eONqiua/+kaZkFGKUDkcUn+Kjxsdt4dmqNtMFat1j26LdpgRg0Tckqm3Uzu
 j2JH+Ix9/7G8sj1leK0myV7tX2UCcRSWtXqMaaOGnB29S3HN81ME03rMIPLbHfiAF2kvft5sS7u
 5lX/ZtjrOoUvq4g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 17wDjGR8ZqcVyA_6LcdPXhDaJnOlBy9Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX7m4tBC4qBS0w
 vNflkDZDdIsRauTW7LQchIluhgG1vffSdiRv5gQYxVCLIag0opS8hRkx4ZDITM1TfsLKlKFk+7m
 LXKnlOX3guOypT0yDAs1QNMLkzlzPXL59kNJ7kOkhXtVtOODQC60MZtaNeHNIIMPBwuJ4u9CECO
 JRogtPoFf8ZkPPZsaMS1BNyb+fYTNC/6/JjLzheuJo+YdATBWUVu+irqoatoa/UikpUugJVkcBj
 o9uW9/t+iTVk6Ogb/Bk+1VLs9nCBRJKtfmjptSahZRGCAg6cj6XSs6qWzdrBTmxGXgN5T9YpAtp
 8gjSUZFs5O6n/NEd/WUbHYAU53kKM8YB4XnCNjNx3o3KSFKgUirsp0ridEjoVni6G0goQScvUWo
 Oy4FRLDpCsW4XCWwFz6ePmkkQBzpVYSDZyTNG4dVJn2wcLKa+X5j3XPyETlmn4lEwEXEhgVgIKv
 4Ze8kQEQBkOu/yfi5Xw==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a59e9b8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 17wDjGR8ZqcVyA_6LcdPXhDaJnOlBy9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX/srxNS98xcBe
 uUQeyRCE3Ayb4ePs/GzsfQHbHWsapVVjJIhTnXpa9JytCWcQIus/IJLsAqPfzYCEf7x2dN7myv9
 FgpKGlDVQuuoFq6gHjlL6F700Fgr6HQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013713_276353_ADB6CA45 
X-CRM114-Status: GOOD (  17.47  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 7ec9d72fd690fb17e03ade7efe3cc522fb47e1ac..d1daa229361aa74da5d3d7bfe1bc8ab189761e38 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -43,8 +45,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


