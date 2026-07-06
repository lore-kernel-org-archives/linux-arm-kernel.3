Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F307C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2uOsjtBXo=; b=WbfHiyIjbq76eoGsMCPD2nnhUF
	GP1YZT2z2hbm0by/0saGmZYx02h38txSR9lW1X+ApfI4akQ5grDFpqAdfIF0dEQuVau1QoD6T/dyy
	Chmj4A6PAj9HMmuUHco71583QBnTYTBAbuTN0POFUK9kQknpHGcb8JycnVAVr3zHPRUiQata887Ef
	ugnDx9xQ0eSTdXg+CRRymmt0yhdL6nYxMwn4C9ZNFXlfjuy2k1gFTbVqdpB9kxEGYpUqfcCHIcMPz
	eAcqTJiSem2k56JjeZv4J/jVOQD7WPPnm9YhdCJ+2pQ2HJbOUpoizt5Ne9yWdWZx4Bn02q8alkfMb
	I4f2tURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPe-0000000CBDq-1BEs;
	Mon, 06 Jul 2026 10:18:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wggPZ-0000000CBBL-3hln
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 10:18:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669Gxu2160086
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 10:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2
	uOsjtBXo=; b=f1HIVtM244Pr6HM7TfEqk24DmmYcryykdJc4wXFn+LmVf+3O86V
	IC36YzS1AS4b6I/MQ2rS6xElR4HrMFzp7IJgwgjdQbohIg3Hp4qmRv36xMB7m/wa
	ESi979mEWjFh7dMeJwLhps9Ry71BFA5vHJhAyrvfU6FqnvpUG23wpEs9QfRA3m8B
	qc3KaP4ivIwJgv5NA41w5DxyjIqkUADSe7kOwUIHIA6BkaCEfd5MP8Zk0XRjUbw9
	z+TxVaEOZFSHY78elccBPHICeYVwEjKBJK7dYCEdwzQwVWBaq63wkhGHlv/hVU3d
	KCtFc3QxMY3OtttT7QAYFQCs45nViVTC8JQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgr82a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 10:18:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92da6f3cc81so352233285a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 03:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333128; x=1783937928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2uOsjtBXo=;
        b=TvETBQobvhXNdXUVAIjXOyJCkv1IPBDhFhYJSELtRdn2LcAFeuvmkLDuCc4JJmHncY
         nGu3+Xb3P7X75u2Zd6/vYyS4K6LEjaPbUzF7ueERBJOTmVFr2+V/vmEfmxmXhw9A07Wm
         6tH5SLa+fk6kpYbAVt2f8E1PGK8V9dF5NbEhN5VfDGZH/LwyHvtEvuxRrpo0Xm1+y90G
         VcXewtYq7+SnbKN2KIubsC+0Bl/tD46kAL5PpjcEsmZWC4icqmSwMXGCGSjmeMqIw/bV
         a7gDqq1jO37ID0/YA2qfuDPwcgdEbsrAkrga7LEnrfzzbipbKDXd0cu5oPet2b+02RHR
         r05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333128; x=1783937928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+klEALvJFKzDoWGHsoX1WsdmENQ4du6xsI2uOsjtBXo=;
        b=QG5/cYnOVONUDpJOPuq0HBf0xq0Nf8cUF/Zk9LLp/CD8rnmCuENH0mFt1s4tdfHktB
         RWljVrwWE7nF83OVlzGyZ/Gb1D/MGW8E0ddUkv2Y9I7oAjfcIsPxKYoIZVMq5Hp+w/XV
         oMXiNe4jBFoFN8pv1GVRIiYMvO7V1uBcyomzx+RezkNrItskbsOfmI+1j+GTXGXamZHZ
         YEK3ZQojgulFuSyClpPnPWu3nC2xv3z5Tf+m2e5JgKSVd+ZILl3uT0sl0uwcOfVfuCor
         kU3AWtRfZTOW1kH2CL9jDIa0jSkO/+BZh3S1LRnfz+WTVMx5FJhEwt6qg3HFNWf/AleB
         HbyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro4ZdEg0C7vBKn0YsMBiE1oJ5t/AWX1/p1ACruuIIHHAEVZt7RWawqeJLHkoOuNiiA5MpmuzlP6nNhNqR2qLYrx@lists.infradead.org
X-Gm-Message-State: AOJu0YwviUWkF/JRcKbWuGAPWXStVt2y7g1xGw0ylwA9Igaw8xXtLYe7
	Sh+orbk2+PovgzD91DRtqaZoq6zI62KhAkYLYpUdGXjHcjGM5mNBauddGh4oO89Lq910erPx8RB
	FLiuz66iYJBAXsVY1Ojtq6j+ZjifX2yJggpPY9v2CnMe7e+1uLef9fAURQxj+qxLHYTC01ELEeH
	/w0g==
X-Gm-Gg: AfdE7cmW7SMlSaBsu0p7sIISx8DJOFbn97gP4s5hCZlCRRB9nURtvMH1TTdtMd2hiSk
	U1XQhLGrPxPdfcWxiKdK5ok1XcTTrfqkvrHs6fPwjx15gmTqo5VihAYwTBOyWI4/8014CEV7jbg
	m+rs8+0+EDfYDJZnXPiVNS551b/xeSUaGHwIVMTW6pP8FZJV/F2+Vdy7OQ3o0hYxdJRCVp5GriI
	hukr7eAPdIyvPTS3exwoq37v7mupKB+IvA0h2hBd8hBud3+aGfC93xBJtQGBK2/zOqrvHZdgBdI
	wXArNV5aQIbZWSjQrez11rVQNy5GEJn7i22AGdegJ5T8kswN+u7WIXOjhPOrt7w/TYrH6o7vUQC
	kTN18h+ssdiZUJRsMdnjgtjn6Fa4=
X-Received: by 2002:a05:620a:4112:b0:92e:8c50:24dd with SMTP id af79cd13be357-92e9a4d35cfmr1252304985a.55.1783333128395;
        Mon, 06 Jul 2026 03:18:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4112:b0:92e:8c50:24dd with SMTP id af79cd13be357-92e9a4d35cfmr1252302385a.55.1783333127960;
        Mon, 06 Jul 2026 03:18:47 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e785sm23318427f8f.8.2026.07.06.03.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:47 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: microchip: at91: Correct indentation
Date: Mon,  6 Jul 2026 12:18:44 +0200
Message-ID: <20260706101843.341339-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=zuAK/xOUfkdtwmrr2SODXpPYm7bcGSHDFYs+7j7CtFw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4EDSW22jduMDRp+zKzvnjf1SF/x4mOlnl5ho
 ZZNtBU2sYqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuBAwAKCRDBN2bmhouD
 14/0D/9a7P8v9h8m5CNjU6pHjUOvyFkjAJkkrlFFyxsa/Dg/Mm2PGjItaYNCmCZ8X1i1By1g/PD
 chXz5zsHlWxjO6oFUlstuwnGqTUlPEqOPUHEQiSxeAgK8n5V+/Tl/63xAsKr08Mpct7/hw7/uZn
 /fOS9ndMD1KWu+ep3IYFcKByfKQYaDRDu2I4P8y8GhaoH3Kh5pupKUqsRNqfL3UdOJ+zaHF9FVV
 bQmlh3TxaPR4FAWUkffSPWayvLQE7C3nOaY3kwIy19Jib7JRegjXd0gGmx8RTKhv6JkWTASQI0u
 U3qQGe5uNIJSBneH6l4OmJ5MnfKLOGHVvpcTVyZ4l4s6mCx3xc72zndj4nOnfMiGuttG1e8Qh20
 +EXH7jI9fvGDz/rhHfBIepiKX/KFbdLSJNnKlMTMbgI8Qb5BoVWQ3nyl21nIS7bD2NjER80Zca1
 ThGgB9UkAAsBhBF70MK0mByl/COV5FCfrHndvu68GZ2ICbbkSDiXeOQUAZIu/ibLV1HePUjnCDI
 hUlPGHbZWL367S4mHHJ6UIyAsLpqGgju21fcnQZCnx1K1eFZ6jYuJGlrhQZBHgmRvYGoxRLimPu
 ZHJyzbvlzqlj3o1SOaNLfuXcRpxK+YmGMVKTPh3fmJeoSX9V8w2nDs1mSLXPF/qsetbSOjzmzs0 SER9mN43Chr9kbA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TBIlMdCicrq9OdY2F3MLs2Kdme_Lgox9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX5qDha+fHE4QU
 9XFZvwxRC1aHuapii7EJ8RF18e07TTsIB5k2aSBZjQVIWqpLVORhH2cuGZsAD1dW74QFtrSxdKd
 iuejC0zQ5TP45LPxlryeMC1BoQEvTT7KuiVAnuhQK73NfuynLPEvDHrRPIiPmqjfbSfowKy16vZ
 4bTXVy6cyvZjAYRIpeIgjvOCvtRJ7KTOirx0qaepMudfTqjJCVNEbgiynjz+foRcppMMeAeIbhg
 oq4f9ZfTrPHqTzyWCPQ8a/NtPWsiV5KoZ81JLOWLHKvc7RTxGK4btTYFngjIDa6nsO+erx9kexo
 R6ry6xDC5nVg5Ce+ad65OYeLLnPqpZM05TeV293tKbfXZHVhW/C/8s/T8L3uwG+NhZJj/zLyYd6
 l+R394iYLg5porNZsyLKkQGVlZy2pivkUjjlCoSi29PUMczs94vrfF2PDKSl51+Z30JGJcCSv5u
 IvGcDnxvJHs4GyI6jdQ==
X-Proofpoint-ORIG-GUID: TBIlMdCicrq9OdY2F3MLs2Kdme_Lgox9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX1dX+qWydLZPp
 JDcNW641n4fPnW5FU2URehjWxeBCChijS97uQKs1dn4V5BhFDwaDz6ygMSuF9FaRc9293uEu4dG
 UCphC8BInrEL1VzTjZwoNeP6kUKnczQ=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4b8109 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=52rqv5wQVAuTtBApVRAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_031849_929358_88EAF606 
X-CRM114-Status: GOOD (  14.11  )
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

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts | 8 ++++----
 arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts      | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
index 45edf6214cf7..25af4ceb67b4 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_som1_ek.dts
@@ -258,10 +258,10 @@ pinctrl_i2c1_default: i2c1_default {
 				};
 
 				pinctrl_i2c1_gpio: i2c1_gpio {
-                                        pinmux = <PIN_PD4__GPIO>,
-                                                 <PIN_PD5__GPIO>;
-                                        bias-disable;
-                                };
+					pinmux = <PIN_PD4__GPIO>,
+						 <PIN_PD5__GPIO>;
+					bias-disable;
+				};
 
 
 				pinctrl_isc_base: isc_base {
diff --git a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
index fbae6a9af6c3..b7ebd8e5f0bb 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
+++ b/arch/arm/boot/dts/microchip/at91-sama5d2_icp.dts
@@ -451,10 +451,10 @@ pinctrl_i2c1_default: i2c1_default {
 	};
 
 	pinctrl_i2c1_gpio: i2c1_gpio {
-                pinmux = <PIN_PD19__GPIO>,
-                         <PIN_PD20__GPIO>;
-                bias-disable;
-        };
+		pinmux = <PIN_PD19__GPIO>,
+			 <PIN_PD20__GPIO>;
+		bias-disable;
+	};
 
 	pinctrl_key_gpio_default: key_gpio_default {
 		pinmux = <PIN_PD0__GPIO>;
-- 
2.53.0


