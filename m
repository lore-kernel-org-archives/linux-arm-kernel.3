Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D36B7EFCD73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=; b=di2CS06J31+yjChxkR4pcJX3bg
	WsqVI3+1e03WPl7bDguIoB00HTfTPt0IzAjaYFB91IwwbCRjqkxySIETEvlp2L2aBc3B3fdv3/k4J
	1Jf5BAmBd6AzCVdmszEmdMbFNFvaK7b39aO1por8AVPbzSYH98uxDcFYVQhyT7uRc3oxnD4s5BmDA
	Mn0XhCRSrA4ZjMCfyP54OLZOZDifjmnUtSO5sKUUgNUFToA5ZlW0k+UQCk2eMW7eHERiOSD3z4imk
	WEO8IbOEQVJEWdqRj2hmKRPwxeXnHy8ZDammObHFaPcOLY9Aa7887DkMB32cxAO/Rsc1SmychT/a3
	aieENWdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXE3-0000000710r-0IXr;
	Mon, 09 Mar 2026 09:48:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXE0-000000070yi-0yrw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298AbXj3016718
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=; b=BhUnyAjaLEdiIxpL
	jvTrmaziZsrGUESQ24yWUDhSw0n+/nxKNUZyBXj5Z3vL0raJ/TyDAvOfGFMoO7fD
	oECwOB8zXIBfMYL+bFgOfMP6W5DxqimYpKDyM70cH95O/Li6i8HiQt6RcuPiGVeL
	DQV1Mehy0okpQ/rK67uJ8o7DfFeywOx2jr34169dMM70a5kJeIXj77juF0h4Jc1i
	tMI9Us9lWU+/nMMM+hgU2I2SdGhFzZj8CqW6J6gdItRyVJNiPFKNW3iVpG8YaXym
	+F/ULQWIa1a/DQAwU19YiHn+jiYVyTAzFIvAjpeEuyQjD4oaZ0t8XoF/23aV0R/A
	t4Q9LQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crbkxvvb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae66ee7354so58065215ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049710; x=1773654510; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=;
        b=OTWxx2MfjAES0/HomwiD9BGeSs+MFUZ4IpEOCnUQrUC+3HdRM4klZpGoDl19XXI+PD
         LzrdIn2H8vSMF+DBk94zBJOIK+Vt4kQ6yGeUnLpRozMw3GuRH6pFqf6rYPW5ZpNvaoCr
         f/HgYnEW/kpGyyUIhvPZ9T6HRRbj8FiLOmMRDs9bDXjsfOa+2hdHPzJDsjhE3WceLwPL
         nX+wNg8k0KdzodssGva5PZwpeSmuyBaa7o4/FUjes58MpyJ3L/6oJOii0I7GFjzZfoEJ
         RaqGxSJwIh9L7bwW+aKVfeB7HQzIuUPvgC79Jsaw+7EFtASdz2KPCTpQPkD1RdpcZr/Z
         RyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049710; x=1773654510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ni0/4keecpjX5VSQGHRPGLdHSb1TkQhd8WAcXKlEV5w=;
        b=W/53CArhdpe9FUpRVWnNiMrqqMgen2iE0mCRVk7QZCtDX8gCFQGOjMExBttf2K9kly
         lR+OSuIjlOD263l1jkJDMuMQeGWgUbOxLcHSPmgcTv6U4UliilAVE1k5dMdS+SbJdE8I
         acYOsoxBMfy+ZrinB8er6fsvRYDyqjiZiNGdzRXi+jUx3vy9pDSI20P457sD5CAJlcwI
         QJZUNvwnnb6Ld4qbepAUkdkk036slBRlvt0cH3VHoPwqIS5Pc+AYrAZhgXWScfHD9HNB
         FsK0P7HzzsqvBr1vOt54ucRUBz/+weVwVsoNgO/1jNG9JOFdNaYpZF2nnhj40HkOMnU+
         DwlA==
X-Forwarded-Encrypted: i=1; AJvYcCV2UB4hBY/NvsUvUCXhS0gKj3Q5pmYgdoZMr1Z1lrPs+SlmEBmwtJARacVP3JoompIJaG8x5v93/A+dXUm0yupY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1R7SwhUemDV0b/Qrx4MmlLdoQnIvH+xTF6Cx9InWpNhnFhNAF
	eFJ/B8DPaGvPutxt+SuTlxMznpOdDCi2VUzTf3GmicUYSva+icGtAMzLok0LeG4anbw7nA+RXOJ
	gYIfn7pjfZBEl3l5AKFv+jlPPdcisV9WOS/ppN/X5dbPz7o7d24M0WvgFTfsHgxRtUpw/gnmfMx
	5I2w==
X-Gm-Gg: ATEYQzwf8pLlIVq/BE4krbmC0EqoemBcc3cMzBt7F2KOYi5P/AtdIOLoeXcRyFpfgm/
	DUSB6boVZbt5qitnIqr0jLt5BVdE3PGsKPMc2gcPd2Nqjr0IzGVklI1kghY4+FRYbRspJ4WmP5X
	lzy+mk07zS8uvAg+e72fHyP5d4+Zhv9UC0+M4SS8P4oeyqN7KYFZJNZnt9zkWy+C0Qlhoxtz1MM
	5NnlmJvX4ZQiciscINE5TJ3JdsMI1jpfGYIJrovgp253UMwJu8OTyPhRmjHs5U8i1QoX53xQWMm
	YvDg7C61Mfphfh92N46/4iuwAA/j0J6ZpFWJfMJZt8+62QwpLeWDbybd1pU6IRS4VszCls4Grv9
	4MIbKW1RYALXFJ2ImgasOixI76v+hQn5neNLHRdoLUZcy1pR1YCv6bJixtHkz9Cl7kh/VloXdZl
	4n2g4wAOIA
X-Received: by 2002:a17:902:f54e:b0:2ae:5b64:12d6 with SMTP id d9443c01a7336-2ae8250bf7cmr106451215ad.44.1773049710263;
        Mon, 09 Mar 2026 02:48:30 -0700 (PDT)
X-Received: by 2002:a17:902:f54e:b0:2ae:5b64:12d6 with SMTP id d9443c01a7336-2ae8250bf7cmr106450885ad.44.1773049709754;
        Mon, 09 Mar 2026 02:48:29 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:29 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:43 +0800
Subject: [PATCH v14 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-4-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=llmH4e6V3hO6E83982AsOxGjOSWUtW0WJVedEVEMywU=;
 b=ZWwvjevBRuD/l0uekFO+E3V0xCFxTSow6u0fcDJPRW/fuMwYDlO4ra1VdbrW0jw8FnH5JfkuW
 /Fsg2B2btOHCX/vyFjPgGVmo2b+UJ8qqqOk+hMQtjgHLukNIAOBhn31
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX18F/SfIyLOTH
 HSZUk0yU5ACCKD+q5LTm6ETO7o0uLfQJOi+ttsQ7LM1LQUV3YFTYVYCkDjvXGqah8eGVT2EEJol
 a6uDo7PlbbceY5XG/Cuy2WC69Jnb3OcC5Wvr76nfihTnhYlQJ1WTzbFNR5X3Odnl7gUAiSgz5zX
 +MtA6faIhLC+DrlBDc5YI2PjrwBZjCreJMyeASzf8qTvoD60ucvpXv3+aF/UawxDUZLMMX+X7sg
 AHz0CIMuQBbpEEskJtXRrxBoRndrT/NqLRBPDf3FpMhaSc0YxawmMi7r3/eGvqVfLz3JyCCesF0
 NVXl9AATsgAufYoQH1K69HcLjVCyMHkrSFcQ7L12CRrwPyVfDS5DfCCR41vLhFN8AB0tVDmD3fH
 F+HxvF8SLDdGHPiRfBBxekn/WxBnsjQN6qB2pS+3JWn1HIYsG3PqaOJrs5Rk2VfwvAxrNrtKro8
 PKG5Pfy/HlAIJweIKDA==
X-Proofpoint-ORIG-GUID: 0jKx9Gi55WqIi1ROXSJ-OtJ8Doqp4nim
X-Proofpoint-GUID: 0jKx9Gi55WqIi1ROXSJ-OtJ8Doqp4nim
X-Authority-Analysis: v=2.4 cv=LOprgZW9 c=1 sm=1 tr=0 ts=69ae976f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024832_397800_D398BDFF 
X-CRM114-Status: GOOD (  17.74  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 15c0874ff641..f4223215ef8d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 69d55ee3895f..aaa443abe8e9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


