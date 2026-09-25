Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21912C9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 07:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=; b=ThCbAiDjW63VnK2hML4LnOogtV
	EWi3VEWkd5ydX/9C09iU5CX7E6Zxo45CcCEm74AQMV6UqNM/VYU7S/nflmVJr+cmP0Qn9mDRaFShg
	xrCZIWaFKFaeZ4FTv5kHwvQNEdMfvPx0Sil8SO/sI2vNVyKJnnPp50RexiPMkwrqkb0xOVFB+TD3x
	PYIwsjbyJBMc6Ds9XrQTMn0W/fdWMHfb6/Uh1Ild0kd/igUz37GTH2855djewL0f17YG/BN//t6Qk
	5lDmWg0OOarWFrzFHkDi63zxbInXAM3lJy7Pj6zcYjCxGxkl4DeIjTwdUTVcx6h7MZjLoLWBfr3tm
	JCGAgXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0iw-0000000CriP-2Lql;
	Fri, 25 Sep 2026 07:52:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0it-0000000Cri5-41zq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 07:52:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YvhW290278
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jjQ+Wd3BPLE4CT4u7BQxTB
	OzgDPlmy4zTCF9SWKHlA0=; b=hlzI11XQkkrlogl8W9KfpSealGn3H7Ya97ev37
	Uvpnqpm9DxzyGiZUD//py/m8Cey2y0WhksoWA1i8F2c+A6wyTxnrysQ6ePQ29DWa
	S/VY6FcGpF5lJGAwhlFTeND0wzOmogRzwwHmv7RTp2WGcbKHBfZ72ZExqNuvBHub
	lTixoTHk1bwwFvh2TxEq8569krrb15XIuruqeKe+H3STOtA+YhkRLO7y7oLjidOX
	fCjmSaJ/ed/6Kj60i2C86lSCdagwlqQUjEwplkcJjEB0/nPsCXlWIjphg6tWyiqr
	X7yTCb3W8dap2Dw3gD0vSwZDDk5bP20KzfqE1So2mDsFVadw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw881tkd8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:51:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5328dae1305so20074031cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 00:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790322717; x=1790927517; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=fjiyrlqFzMrE8gt23puVEyUeLUqAqFrL2a5ATAWljgU77RUqtp4Ygzpk0VEw3oPo0F
         Al6C0Z1npH/xXy4+Om4V4yuGpHARUVJYkrH0W5OwqONStwkjvuAcKeyiv69bi1B72/QN
         02xTn34BKjwejPlcGggbqz1EcdjZuqL7XApiL4w/si9qhe5dYPziF8OTEp/Y0sE4KCu1
         TZITnyuE1rQrZ2kAqKGc8DGVyuXhz6YTmzwHCvgV/i+bqHy8SniNp/dhIK4Rx8dhuqP0
         X/l6OY0oPwJ/q+9m77hu7m46EJM6Iv97NkbrnCI23lvJa69bBMSWWp6Ammv8YeqPqJ4J
         T8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790322717; x=1790927517;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jjQ+Wd3BPLE4CT4u7BQxTBOzgDPlmy4zTCF9SWKHlA0=;
        b=VFKJ7+asSbuvwrGnXqIy5YM8lCOesdKXi8aY9kVMnYvP6H7/iV6WwecUxKZqyt+iJh
         xgZiC00CmR6ahOY1I0cmeER5NUj3lzZQYiVY92ujL/dIPhcSg6rcEMJ6kq7WvwnETtwt
         YRaFnrPpIYw3mXsT8uSaXEA8ZESu8bltLRKRt11kBppPhcMzN7uhuGQi8xk9e9ri2Ph+
         rR9FYVX8/G7jDEfpNb40xK1elyaNm0QRlh7Qh5O2qCq0WCk4A7z15ou75VVF+HRjpIfx
         QjVEJOxuorVjSQBPVcMGCKrRR8o2cskQjwijf9ZqDUw5ZQBkI8smdhJNynkreAMj/mYW
         NKyw==
X-Forwarded-Encrypted: i=1; AKwUvBxOTL2SPTMcaU3sh6tqpdhmDrK6KDNRltuB7+iOgc5VSthUuSmT3RyZoLi1BSQDMqEDwhKbt4P9K9TlJ6pHY9P6@lists.infradead.org
X-Gm-Message-State: AFuF++kFAhHwgWWjuWBbfhbfzkj59ldc/rV2G+4w4OPiBUePjFfdvr+E
	0qS1ULjUff+1akYMaykOdmdzMYtuRGXRCwQSDLFsODiEUUW46VXrSVI0tZkPmhT9hHYalNPkTQQ
	ouE8n6Mb/G4jqZXh6oPvUqtYHSYhg0x1rNas15SH2MivXGBCJk7B22mgoXwdc317hLDFNVr1tj6
	9wpw==
X-Gm-Gg: AYBFou2N/8IYan6ty5EONEi9HCCMlmA2vjwySsn8Gu7xgif7eVzKFGMziRVT/iBtIsA
	vcEPRmt/blI/TrfrM0Xx5z0BT6QuAIivmgv9KLoL1zuamWC+W4X413ZMrwKzbvlB5PCj0qq3+cF
	cIjaKIewTaJjxpdpn65LUyz+DdYOpEwDhs1+UEefUgk3mDtipt4Z2iqCI0ej+IDVZCQE665epg3
	UzG8VY27UWEi6Irn9RecxDk1GpI1Huij2YwdOp7KlRDL3/7kL2tEYJbjML/tHzIKRhMui8aOT1g
	diQAy7aBEmdvZj4npLOxtqjfoqy8it2ob1rJrb/soXIfbB8dRL7JPwJ8+AbUOMVNtS78qB6CCb/
	IWs3uDdVvcIPFCJtTaNIovc13seP3NIs31QH9ze2CAPmTcBwtzOaVisVqFl2dzjH5oYw8goPI+Z
	CPUypr8yhiMQRr17Mng2HtQtumcgSVjVS0nuTl+p+6ZQ4YCB0iG4Q=
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287273185a.61.1790322717573;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:93b:d79f:d948 with SMTP id af79cd13be357-93c43eb2a12mr287270885a.61.1790322717113;
        Fri, 25 Sep 2026 00:51:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm4797443f8f.9.2026.09.25.00.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 00:51:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:51:55 +0200
Subject: [PATCH] arm64: defconfig: Enable EMC2305 and PCA963x drivers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-config-ventuno-v1-1-800c19c1d33a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABootmoC/x3MQQqAIBBA0avErBPMIrSrRAuZpprNGFoSSHdPW
 r7F/wUSRaYEU1MgUubEQSq6tgE8vOykeK0Go82onRkUBtl4V5nkuiWo3lm05NA7tFCjM9LGzz+
 cl/f9APxHsLhgAAAA
X-Change-ID: 20260924-config-ventuno-398c8e9ca9c8
To: linux-kernel@vger.kernel.org
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=TptzFzXh c=1 sm=1 tr=0 ts=6ab6281e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=kvZKKbouJESGLE6z1NwA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX+9vTRLwmwvZF
 SwoK5u7AQh5g1DRfrmRqcW+G/3hJClvPzEqn7POrD+FTPcrp2v3aKkOh1rp+o9LpjQaXW0FX+pA
 qFg4Y80oLDdxxvMMgatGwNNLvZxja2LrIK/4l0qmiIOnCn8XpVDnSNYrYtSvANZVHbqPVyc109o
 Ifyys8HLUxLFrlNs5kioY2IPZ9TMrCkcse1twTFNE4wosMhBnTkk9wPKXy/Z/ctb5K3T6dVM4uz
 1OFww7X9oXMXWjfcue37y11E8KeFL/6aLYFvrlufwiVrO5GqAMETshvRBQVRb0m9Vvq51BdVzN7
 XArhW5WiZHRVYMepEKgE3k2JvoXHyzJ25Bryov6ESJ31qSvhHP5P1gGypB0WaGoUBeTt6l3bjac
 FWQBSAm4ishosQQuxEf50YVU4vWo0dokhwFffTnqGlljvnIO5i0ZhzLv5I6iIMM22El1Bbj1gIR
 SIn6uNaMZLwjg6siJRw==
X-Proofpoint-ORIG-GUID: tvjpyXhb1qRJOhpmnE4zEGCQ6q8Hw0N0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMSBTYWx0ZWRfX70Er8azzHXNX
 b5ummCYO6kj/aHwXKmKABxq7wCFewqcMJ1g4VS1pWGI92wugphMZ/ASCLUzAGitcrLIcj2wUK86
 gicaXVO4a4A6ygWjPz9mNKbFeuoIptk=
X-Proofpoint-GUID: tvjpyXhb1qRJOhpmnE4zEGCQ6q8Hw0N0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_005200_144798_DE21CFF1 
X-CRM114-Status: GOOD (  12.64  )
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

Enable drivers for the EMC2305 fan controller and PCA963x LED
controller present on the Arduino Ventuno Q board.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
To: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..012bd0cb1bf6cb130c92012748a90ebe76534854 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -769,6 +769,7 @@ CONFIG_SENSORS_PWM_FAN=m
 CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_SHT4x=m
+CONFIG_SENSORS_EMC2305=m
 CONFIG_SENSORS_AMC6821=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
@@ -1323,6 +1324,7 @@ CONFIG_LEDS_CLASS_MULTICOLOR=m
 CONFIG_LEDS_LM3692X=m
 CONFIG_LEDS_PCA9532=m
 CONFIG_LEDS_GPIO=y
+CONFIG_LEDS_PCA963X=m
 CONFIG_LEDS_PWM=y
 CONFIG_LEDS_SYSCON=y
 CONFIG_LEDS_QCOM_FLASH=m

---
base-commit: b9bb4134a9583a388704433eef22c82c49963585
change-id: 20260924-config-ventuno-398c8e9ca9c8

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


