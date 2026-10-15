Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AF0CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 12:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=; b=jR3Qlh6B3eyu4mHA5nhEe5G7Up
	U4E1I6kwnegi6W+1BycYRvW///cmn8mAypsnZm1zzSLnG/+s//KwnnqVqY/4HI6/FGycYc+03U6iX
	rOZBtTdoJLrq28RgDfZ7QOeZrtFfeMP85N6IOWL8EbbEat37TloB7GARMrmviDJFyild7pI0G2IvK
	oDye++DoDfjaa2u4Sf9VSu528J2hP5vHteNigypHy1nOzToMK/Asf4lai9DVaT9r/DZw+ABb01BjS
	1J5ZmAjlAjfDLWDQKBJ/fSguD2o8eNW+L58kQAhPChtsJ5CWaS6vG6oBaPhhwHaTrRvplbgi/zYLQ
	sgaVq2HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL31-00000000BzI-3P77;
	Thu, 15 Oct 2026 12:59:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHL2x-00000000BwP-3gKg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 12:59:01 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jHsq4077455
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=; b=R33TJxhr9jNjXlaM
	ZlAkymb3LdVxZWYyu5glml/gQFZBgYVAL1WNE/QIabtRi8geFH3Z9ZrNQ0OEMiq4
	gDzfu8E6n4ifDtkycbiC4+DhU04xnLD2HQ/QYeffDKuAh9hPk7Q1aDe7fmF1Sb+R
	e7uanS19PfOB6HLcUzoVaRtAwyr9+qfL66FTNTT0kuHw9RiW4ZRbeku4HCjhYDtx
	nciDCc5oopJHMH+UftFQ9ep42x57wWMhu1ykpjWSCMbaQGJfIU1Sz9XwkH5jN33j
	tQJjA8xjd1hF9UxBzMGWI5gmrRf1/4ngqaX3AuYm3u47SYwyQKiqVR8o/Zy3jae7
	84AQDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0sq5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 12:58:59 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso19950585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 05:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069139; x=1792673939; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=;
        b=YpzzyLGYdA4wzPg15qROEcxVpOOt28OttHAkmMqHiLapVamdHyzSpkqjU0TXkaaxxX
         iBiII3vR+RtS2WpY3JyDAX/aHBd3d4NfqzCi70ktI0mutgoqXn9ZJBcWZI8jrpyJUYsG
         pChVB/phalETZ5uomth4fl3xlqrzNYIxRE7qujPQ/rXnxda9vL7Bv+XxZYUDAAfdB6ye
         ilQAWSZiASCwMPNpYAQQVAF46a+raeT1PpRqBniJgYAL3Or8xV26zJYsseZe4X7qZb9S
         mOBjgyWWO1V908VWdg+Rvma9MXpZAlN3QbvvC2N0QDwIheUtHehlSCh2a2rThpyl63k6
         UmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069139; x=1792673939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cdafT9IpEe/qFVZ9tLxGA53KW5ipDMs+AxnCUnfifFg=;
        b=nCk4TLm+3dapJLUMFT4D5GGzrWnRc+Qlb+sVu7jtDaqm8i+9jmf91GZw39uZ5XQsR7
         omjoNtm+GGMC7FkLeBIBV4SNILLQYrFEXV0HlR2c63CS+v1Jz2stzLHgdqDViE3lyBaL
         9kI8Bur0lIgDgoJq/vY6JsPadvNgpL6+mpSr1lSEhwbRmT9vQV+Yoazm72CciooRyqFu
         7SDueo7SmkwV8VgsDB8KjIAf5dgmjQWjj8c9Rf2eakO5T0IHP6RyFFe8RYq+j+zy4Fgi
         bNXB/wNOJPTl6ACrBT9jQ0/ze2G+mvKdaRRMCGRcHDgYpaqZU7UZjURoCJaECPZDETYA
         HMNw==
X-Forwarded-Encrypted: i=1; AKwUvBzOqPudmGfLaR85XSOzUm1BAWiRtUsVgXLE2OrvbXGt1tHFh1tikLlhPgO2H9yTRjykeAdQ5OhHM8JmpYd76Nh/@lists.infradead.org
X-Gm-Message-State: AFq9FYLiJunpodmlOvP6voiLbQG8yIQr+gk6jF3QIuVFNhB0G+rBaNDX
	sUPOzFbJcFKQqmL/+O6h1Ke/pvShfj91w8u0PxNpBruYaTZ20/wnmdplx1NO0+uHy19Dm1jhqcO
	mIjyVIvrVpL7tC1xvKQNvdszEcxepJrQhGqAVTRm+pJfva9Fy1bBmsel9HfvSqfiN7o3x59yu7j
	4U4w==
X-Gm-Gg: AYBFou09evhh+jBs8U2laKZEf+7Q8+1FgrQ4wNNo6QIU5ICZ+4BBLF5MOBE1Rc1NfyA
	h5mRs4KRiEWewJpIlDvqLrmOqVD8VGtsjjsdjElzDPJZ3cnpOpfhXLyT/m1Hu9Kblsgrx15S9LM
	XU103xxWltQQ5Mq779Gq7/xf/UwLkv9jbvesq5dAR1H1WZh8AOUhZul2aQOZ3fS5mVMYV0UHcPV
	kX+lus9BPJx/WcRhWWnSrcdKPwOt2rNVhRhVGBYEpbYDg8NJj3/pwxvzzlJpI20nnW/cW4oUT14
	YWLFmF0VAJMgrgsEE8FsqFqCcO6zzuQKkTxR/LVGFFeEBNQ5X5YLsj+Wug0ETfMIq+hc8WVVtZX
	Oqi1DUvypXT5dbBRRApKN5xKosR8dhyJo1A==
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr46203635ad.20.1792069138746;
        Thu, 15 Oct 2026 05:58:58 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2e9:3dd2:a90c with SMTP id d9443c01a7336-2e93dd2c030mr46203185ad.20.1792069138151;
        Thu, 15 Oct 2026 05:58:58 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:58:57 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:23 +0530
Subject: [PATCH v3 3/8] soc: qcom: geni-se: Remove OPP rate reset from
 resource deactivation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-3-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=1581;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=IfB0Yx8qIxej6QlE/yP3xJHhbwTmYhCiqc6qKYoTiIo=;
 b=Zd6cbJzhVcfg5m7L592QpSVIs3TRLPdOEmoQnflylQwBkeX2I0dQtln64gsDM/IUxq1NCdFzq
 zvQKI9Tl6pCCXzMkBBOYEO0FnTGm8FbKdcm+SuJek/e5nZsnofoLMfw
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0ce13 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dehDsB7WAhqrwfXEkZwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX2CQXlOVt6Gkd
 M8rUe6/owicMx9CShcLHXheE8YbEv13msPGh31O7u8Eu79/08/5FhLPTHlg2J4ZRy1JTaNye9rL
 kXviUCG0V0AfH+GG+xnYDSwd7m0VdHk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX8/oohSKrdBal
 MUiOQEBmOIp0L/X2mCDMKJC5WzQeqT3T9S1q2lyyYEHsGrOaAxwHptxsoIb3KF2kLfxvwpuRVN/
 nI+3tjbFawmh2EcdXNkrGnS3YKkbu/ow/SFno9za4mf3EA0fRxepOXj1Y5SNPMXRomLtGEmzaKe
 fn+QhgBheFaahrOlS1dHYIcWgdfLICWYyQ+WCSo/3YCU6vF2l/6MSeIU87p+gmzCPDBq20pDWr+
 V2PZmFCwIsARCzHwyGiBQjQGx6/YA8JKiNkPo2iIwNfAzGRiqAacEaW/gSVFb1qTvPS+rQnQ8KB
 p78TAT1otN9QL9TvsnJNcyBTlTpigwK5nNJrWm79eeWI9I9YbK8LpjfVcT96p1vdj4efI9a5w15
 BXzioTOH+iFmaF8ddwuwkWkd379srHP0Ohty9ltls3KdxiCfjd3QmwGKuYsHVE+9qhkQ1SAS7wa
 XSMBb+oR9WMQGKQpO4w==
X-Proofpoint-ORIG-GUID: zpvqZAK2Dz-181vr-i3YYfC1p4RQEEh5
X-Proofpoint-GUID: zpvqZAK2Dz-181vr-i3YYfC1p4RQEEh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055900_001491_C2CA41F5 
X-CRM114-Status: GOOD (  14.35  )
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

Remove the dev_pm_opp_set_rate(se->dev, 0) call from
geni_se_resources_deactivate().

OPP resource management should be controlled by the consumer driver.
Additionally, clocks are already disabled by geni_se_clks_off(), making
the OPP rate reset unnecessary during resource deactivation.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom-geni-se.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/qcom-geni-se.c b/drivers/soc/qcom/qcom-geni-se.c
index 97905bd6d363..6163c19c6cf8 100644
--- a/drivers/soc/qcom/qcom-geni-se.c
+++ b/drivers/soc/qcom/qcom-geni-se.c
@@ -1043,8 +1043,8 @@ EXPORT_SYMBOL_GPL(geni_icc_disable);
  * geni_se_resources_deactivate() - Deactivate GENI SE device resources
  * @se: Pointer to the geni_se structure
  *
- * Deactivates device resources for power saving: OPP rate to 0, pin control
- * to sleep state, turns off clocks, and disables interconnect. Skips ACPI devices.
+ * Deactivates device resources for power saving: pin control to sleep
+ * state, turns off clocks, and disables interconnect. Skips ACPI devices.
  *
  * Return: 0 on success, negative error code on failure
  */
@@ -1055,9 +1055,6 @@ int geni_se_resources_deactivate(struct geni_se *se)
 	if (has_acpi_companion(se->dev))
 		return 0;
 
-	if (se->has_opp)
-		dev_pm_opp_set_rate(se->dev, 0);
-
 	ret = pinctrl_pm_select_sleep_state(se->dev);
 	if (ret)
 		return ret;

-- 
2.34.1


