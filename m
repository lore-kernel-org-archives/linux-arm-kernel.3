Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4932C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 20:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=; b=S2CNw/SxanLdaG9bmZXf6l99Ib
	TUVRlo2J9sH/Ck/GVtS5GgocMmS0YSpaJ4ztXKgatoixYnmmLpplEyYOO+OiEBcnUieE7hGmJCPiM
	hFtGHqOItWR/Vlvo7WokyELxHuWyply+0WP51Uff9Th6cp/dKWGVl5Vktl3Vvx/PnMcIYsKA5et1/
	zu3L8tlTj8z3mrLb9sUbx3tNig9P0Wbhti6CcllUk4okzJroYwcz/qitpGaSczPmDrw4HbpUVlowO
	6PfGNJTRP1CPUbdF9KlH4IOBMySnHxdwUSohXUZGeTU+Pl1+8GI5KJLSyWsSOXyzQNL3ntoFNq6KB
	28Ihk5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcc-00000007sNx-2x5U;
	Fri, 03 Jul 2026 20:36:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfkcX-00000007sKc-1EmW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 20:36:25 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPRni1039948
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 20:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=; b=NJ8mtjsQ5uk3031c
	1sHML28nZjDSTULG5cmU9dYBC52+Up47/RZ8EGa74eXGgGXlHkX1mRPa8fKIcB9J
	kR8IoDLwnkQisdxw+Ong7g0TWTtOxA8GLTXhi2VEMpEr12KUPnC3fG43yrkiCaoo
	on7VFUEktt8FnhCPil5kln5tE8FFOKp9GOSLkjWwhz+ZDjrKGlk4VVw8W8o8b7yP
	bkxo/wD8LklfrJ04RgY1ktF8i5vEj7f4+BELFuXzWhc4cgJPdAdNiqeGhx1NgcYs
	1eusB7Up1EI1OmFDAnGb1h4rdFaiwZGIaVD4lrqak95amlcOwWoprQX+T4IKzTpb
	C8Gefw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6a84a9dp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 20:36:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88da04b719so692137a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110980; x=1783715780; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=MPAxPkOht6b3IzwkFYIpQJ2UXBR02cVFWV+IekzUOUESRCiPjMPENFHLF9C5iKCvBP
         WevYLQ1ejKiRjRr8GjtODDnMWWRVgD7gOV1RYJo7SaAbVUDDekRJfjZ7BWhtjZF6ORxY
         GTlZpmUYaKSeztFPu0sFDgGWWNESfFP05qHC51Dot8sI+7VAgfAsrem6L6Vb+OAkK0qr
         mFiKhaeqrgiQmgf6Z/s/lGqpMsQIEmiUfQ3xnA9Vm6YkDZzGQB3HXjb0snt02oDxsUoR
         1rEDEvQQToB2kx/xewpDcZFPN1ZvCWEvkLbbmnirFanqnudnSAYbXjcM2WmyLc/w+Bth
         rx7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110980; x=1783715780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dOV6SNjFzG9X2tjzVk0oMjUqNu3RuI4o/7x3sDqaJQ=;
        b=nSErM3pV9qDQmMXua+9WWbH9SSR924Ynos+9trnN9AGue5BydgLJnapx0EtGoqVZmg
         GBDVkyZAQ8Xl3PplltqXy/LZFdELiV6/1nXh5YujMHIQ61rwSiPfAk0p5j8WJ3WpMuvs
         6cmyHuRgge9PjzxCZH1jQJefBYR9BXOsgZyrIVoOR3KtoaQXM+Pt9deO5qLeYzUqDyOE
         0oJoIKdHDRm6LlwqYXy8wGcIVskr3yYBlzHFq1fS0S6ug+hlnowMwfwxzLuhKeRGFczP
         zWlipPHUX6GlTkMxVvNq6swWn65Abop/KTnERPTh7S9a3yTF72qQXy+OsrK8s6nnjRxA
         dgJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+9WUbyW9uNe9RCQtrKSYLdJuzeKOwYlHB3WP/Pr/CeSQ+L8clvTRFsIT3gMP8xl4wp13ufRxD4E4vSEGldxiAh@lists.infradead.org
X-Gm-Message-State: AOJu0YzDVH3u6nUcC7EJTBCSQJh4AzpckQzvK1fQUY9ObqKi6glRJ94w
	Iwlur5/uP7d4mHWlketghl6tw1wIlHhIl1culRO1b7SUo2DemnVZY7IhJsB40+4/R9blPX+YyWQ
	dsv/Wm+MoxUmvzQmrvOfkv6LEgZzJlg4PBoOXfBmxLa7087jHZqJBqfKOp0wrvFr0kOXQ06tjHw
	ifOg==
X-Gm-Gg: AfdE7cmHZv70rg4094GDSt1eTaV5dIBzZCDd5hEy+GSD50IyEWbjKFnNyI6QNf8GCNi
	TiRq+RAfsh7zHdweho42ZIcqdNZRg6vJlmSgsERqu33cm5DDijLWvGlHjsqvUB79pt9BH5dDPt6
	cSxfE1yuqvxzDo1S3+2mp00PwPSn1MxYydvkMG2DeOMc1gh5MPCNfNdzvPkUANi/U/Tvcb3cE8k
	xk+IAhoMwMpqv1znAOhDxtn7OmrncDNTw6c/aZEGTVQcv/wXCERAbeb2ugEx0Fogy7WEohe74Yi
	TCpsTdnk5JSE4EmQnaH8HqSqQf2WpdOEEndnpBO4hAd0Grk37TzOA5yCsg/qI9pULmjCaWorouq
	1Zic/Lw0/KssoFLOnG5VX5QIjDovL7KGDUH8=
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781908637.49.1783110979716;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:2983:b0:3bf:aa1a:d303 with SMTP id adf61e73a8af0-3c03e5941eemr781871637.49.1783110979257;
        Fri, 03 Jul 2026 13:36:19 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:18 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:33 +0530
Subject: [PATCH v4 7/9] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-7-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=894;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=sXVW7HyYn+zboxV3uVHhdySY2TiXHDOOKyfpwcYtiUI=;
 b=wYeDLz1Q3es0EoxTF9BBwaEzt+JV7f7Dw9TzAL+RcikJnuzjboL+RivQ+2cjiKzDhlI1C6Fhp
 /ea/aVQfkA4BAyda+/hRZFvmLi52/KE7U9JGNJ4rGuOGiA+uglghbOd
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Cs7vYzHQobRwCwq09WUhNKWDIfwPFgSa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX5b7yA+O4QlCh
 mx6hIoY2ZKjZhqur28WKcRcnh2I7wnaVkwecZRhDnKB0Pr7CGEUuG+ynrkX6zHONjRw9Noi299V
 fv4oM7OV85vloaYKv3qE0eYNX+kF4dI=
X-Authority-Analysis: v=2.4 cv=a6QAM0SF c=1 sm=1 tr=0 ts=6a481d44 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JW4bpjJLMT2bmMDKeKQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX/3P19ASp8GhH
 eGx8ZUouhxOSOmRxhzbUd6FsGVd5gTuAy+svUBNI0Ct6JJBeGW1ELtlDsMeyRDSvR1d0IB0zPR/
 7SIxC2LW/G4PtFci6EJQIuWToALRpcvQj4qyor5z+Q2wyoVXZydoS0ciS4AmXEk0kN1p0WbXX9C
 IrB/Gj6KTXWdNSJ986ml7PgN1S3q6TYp4TIgceBUBe1PbkDRkVlFbt52jFjrVudOP6aeWQZmWwl
 KH1p7Du57FyFSror/v5Sb8f8n+B890BYBoySq9TfMYC5YmpAZ0+7NfSGc5DFLo+n7wQsDtV5+NE
 1X50Z6+gsllRht399+yyLsmXlchA2/E4DGHZPMKzQH//xipyS0iFGLdvo35W4cQPwmnlgtjTVt+
 ELKzo3DOTTZq037w+zW7ovQ1pEG/89jOK0N69yzsANQIznASMGVlZSfqElQekNmDYMIdirny1nL
 Ho8G+k3P7WJ5anTM04Q==
X-Proofpoint-ORIG-GUID: Cs7vYzHQobRwCwq09WUhNKWDIfwPFgSa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_133621_348620_F57C418A 
X-CRM114-Status: GOOD (  12.02  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQM EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 269e11bd44f6..8206dddcfc75 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -50,6 +50,14 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.54.0


