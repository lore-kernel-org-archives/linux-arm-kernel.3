Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804C9EB1060
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=WzAw2aeV5tlGNBXLC5H9v/h22F
	lVehCNlAY8MwXP0NNzmjftIO/8l/nS4Ch21uON+9Xb5TqzQefBDEaQe9PKkUIP8o6DCmpxxXeO5Ww
	CAKK75YC1sAv4lX+j4O2HkONmJd4lrxNmPKzd5GBWBgcW5FZgywrRP2Nd3ITNUPwdsseUQRJixnl3
	wyIJk9q2fFCbZgZboNvCwXi2b30E9OtYovxO7AGajEWoHNTNCRwFoCGJaiAx+60C0lSglmV2yM+6E
	A0HzE/xw55FZ+dfrKVtmfcAJHpqfPHNmoprvmLGBzagSHbuhq4f0neMSmSnWXjo4A+VWlWXw6jK49
	UNujSrpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGU-00000009pwS-0mve;
	Tue, 10 Mar 2026 15:44:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGQ-00000009puw-3qas
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaoZW790189
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=HtrgX3KNvok6O1zO
	YYb5Crv4wn3Cn6uNb9zTYtGG0zKYOZcU7sU7jz9HZEpPJ8BLFypzpONFlEQbB6o5
	/souV9nw0YFxQBzYmf/X0DXCepud2rf6ogRtK4/qgJX/Z9iUEfQkd6hXl5KdoSwj
	ul8p06M+dIla/etKBvsZtAnNoqlOTJv7qAvk0ehywaqQ/XRM9mNqWilgKbIZ0W2S
	w754hgn3K1KVxXF4e1DUMW2pChn/SKSNlmixv2Y2UKHX2yG82Y+ZYTafVkHed01a
	7i14uSnCIvijgP3FPUOCl19dBXHcvR8udZ5Dhkg3sq6iQHkUsEpYCi1PdAwAcsg8
	R1aPBg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekvkn7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7de0e161so1684382085a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157493; x=1773762293; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=AQY9TeS10JNtTdzF4dWeklauSz/gQXPTfixYGcGM111GdKeX7CCrxbjRXNdkuaQtay
         KjaJdcri+z5fcYESMrTd4N7SmU035NGmaZFwEUmIe2BSl7ytD80/cGz5D8hp3s7uyPO3
         eQbc3UY+fCsZUXFqtW4GpdzLoFEkzhGN6Fo1Phz/aT7t2VFLnes0L02vpP0ANhBpJAbK
         fjfEq8K3S3XSd9WH6m2SS5OEGEjPpt3QoxtqjQq/blGmCx5qxUCCOhEekHBijOyGoaEv
         FyLpJYlgitogdgH3+sB4MsYS8ioOPQkkHCHFFZf/rv2O0x62w8IHcEq+ADMnvqm0Tdl0
         HEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157493; x=1773762293;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=DIca3Yk3RvEAwIFv6cQzmFReVg6vsXoCs8Wz3s6jmQLUBXV4i8MPQoLh+VtMtK55qT
         QT3jbWwyY3hK7qTzU7+6BJCEof2empYheacre1GIXh36CeFDdKOHU6K1huZfgjbQQM7+
         WQ3lqleyckgxb9424CHYt7Kzh2XquX+3AmV7FSfMMuqZwTYdUTCPCz0rPd/FjArIcrmn
         rbSQP4oNYLImzgkPF69Q+Y8UKFbDA/Cn9wZwa+UU77fo30/P56R47Baqjh7FYokubOhY
         e75rAqdbyyKNv6jfXXRNRAHNfoP7jEv0b1uqpJH5fA7Qnkm+Sq+bp8ResShisw/4/0rd
         XoWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCylb1Z0fFNfKQg1dk7Fo3O+UvX6ZKZ2wXtsU1GATYmzgRyPQOmb1CJVzezftbylqT5f3BvXBj+5IEhZgflnpL@lists.infradead.org
X-Gm-Message-State: AOJu0YxRTuco2/cThhVF0/Q5841XTxkY6VBZgTdOvh0ACdTXhiItqrJ0
	BMoPcKAzM8Vz6ZLNkYa6ARHQfqaaLr1B1P1FVPFWdjMEkUMz49GB5RBLAuLKk55oDpUgNiNZ7oo
	EQW7n3g/YLHrffIlclpKTm37cn21OyZSYSMsOKvXLoPexpvQDIkYlaGOBDEDw1MnvXWefbhmtvi
	W8hg==
X-Gm-Gg: ATEYQzz6lqHKWGKd7/ObU8W+9d4IS0pVap1TDbPNkngQgmQIyPg6Rn38s5jnUZQ7YZX
	s2+m4AWa8eYwhX/+ziYSvDfYV6hv4yA7/zOOEI4nM9v9O7rKAYiyslphrLWDa9IpsoQUX64Uq1p
	hbN5SD9/rfuWMGuX3mrH/TVrw76g/0lOPggWyoCC14aZsJei/ECr4awZWaE1KP2pcKBpf1l8nhS
	+TVRSz/IdoIEqxV2LglLxHGf+WeNDr3A1OlsdpCDqI8TzxzCYY8zAApnnsjWh/F6dCoWipcRrbQ
	Y/5s8n7ziIEdmS9M+pQAXJwpwXi/40+KTJdIRNEoqeEtU6O4+AOJMp2G3Gemq49QgrU0E5u7Vt9
	kk+42HlaVeL1PRpe/qNd31CQ6wW/Xyvh++fdD557i2u/k4erndZDE
X-Received: by 2002:a05:620a:2952:b0:8cd:7fac:a2a4 with SMTP id af79cd13be357-8cd7faca5cbmr1210911185a.0.1773157493339;
        Tue, 10 Mar 2026 08:44:53 -0700 (PDT)
X-Received: by 2002:a05:620a:2952:b0:8cd:7fac:a2a4 with SMTP id af79cd13be357-8cd7faca5cbmr1210907485a.0.1773157492878;
        Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:18 +0100
Subject: [PATCH v12 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-4-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfl+Fn+ISpyM/izQ226zR5pAGJiHs0gWIagW7nCmNI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxjl0oBLVkyovFs0XMRxCMKg/HdAQsoHdoH/
 d//6ZZzKNmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YwAKCRAFnS7L/zaE
 wxRtD/4ud0b8pFCkZb+ljYaNfLtENTl6pz3RRlsXW8S98lIHlWvV5/g0rTiZLMZ/nhZJIHcx/dy
 dT/fFdxCu+wF/DQiBke2EvOr0EYGitPlJvKek2niuutIa5S52uV3GqneZM42CysPGjoSuh/WFjc
 3Ju0MkiATjx3kZnh3vpH+ppCGTLpVOwHCciHGWP5mPqc5NmGUgqSeqy0I7D40dIB7vJGsSSNI8h
 F7FPb4w8WZl8W3yzmCSVfMLOj7CiQMTPW0qYA7Ugwb3K6tWtwieLGjueg8Bd4yjGAAAIPXyUlEQ
 VDLAilh/F6icPirmWtb5Lbdvm7x/RyDwhTyGJqo88y3z7jZK5dPx5lGo260pn8b8Mr0iqzWFxe+
 sqqZJOCP+wYTDrhxxvXhXDwdAqf3fn3/D2dQEJRNzTEpHRcSVULQqoQcb9wizvIj/fxzHGBRZOI
 un0Qwp8Csbnf9Fq3/md0VaVuFT0SoHQSWJpYxWF6L2t0wKW96kibt6xzfcJbM/3tFyIiQiOtHOn
 Jzxu6vCnZNMy/NIET7BQnf9HZ5ne8P/bAYKMPlRvPg3FJuw68Xy1s9MFcv0oa2NH+aasSTEqaIF
 QefClOPcX2zN1Yumo7lbDQWr0fPFzSixnzt6j8faXsWZeUygWqFI8VhBzz3eY6cqXc6Vo7Ht4le
 OPNzAobYJS//T6Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: 0-9KaJ5SPWHUma7szrHqD-ASFroL8tcM
X-Proofpoint-ORIG-GUID: 0-9KaJ5SPWHUma7szrHqD-ASFroL8tcM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX4i52aJJl4aUZ
 MaZs+fIgljU40FvKgyxlj0J9q1IPIJl28Hn6gbMXFz+IbXd2fGq3TmCFy7FfcmaiQAKCPbNryei
 fZROU4us0Wktqd3xY+yAUBwIPLZt5eVltMySdBRneq+Y801iUA6vkyYrIMacLAPc9ivba32QC9g
 keiuYhKjeM1Vyz6bL2Mh+FhIA+AfIjluRDlGI9LWrrohewsKNa1IJ/W01qm0Dh/7nRdyMA9FXwP
 EflL2fsg9xv+9K/2f58/sd6lhxypIXi0Dr910b20EaDI/R+re6i3C3oTTDFqgIAMieBkr7AcpMc
 WLnpHysZpqu0e0kSDcZ7jknXqbb5Tk54ecBPfi1D+fsXyxVU1J4vjIL6po0mTaXepEZ8cfrP/5f
 82vkt8rD6Ex+WHSQqzoouPvLdz/yNVCDe27x1NB7phhj/jQLkomc0oEQQYG28DjIdZ9cvV8QEZH
 85iW4OS8UnGVou0cgPw==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b03c76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084454_973070_74ED3D48 
X-CRM114-Status: GOOD (  15.81  )
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

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


