Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAA2CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sSkmZYTIXecruKnIHKGbRC08I5nsUev4oLNdqPbSV30=; b=kzhiAEddOTgOZY
	ZO8aEINxtZEe/RE+7x51l7Vm79YDG9rF40gofA5xGYFovrqTMdWS6AUPCZmusBVWtpkKp3RO8ZZsr
	+gZzTrzyIXs5OLrmQURUZ4GDe6ndVK4r6vPAeBbVkuzOxBLtYqw/CiPVsztNn7AaXYxYYFKZFOy7u
	Cgub7SXyCGcEbFHvrYoL46NyjpxEPG6QyZiWJCINgAP+WRTqljk7p1R1GxwIpxFOHmQfMD3gLPJQK
	xQV5JFcow1ZRMUm9IGZmdHV9iq7O7oUY25WoIuEEwiovHBbfzqYjjU1qJLUsGdytOIi5Z3yFGGysa
	5Lk8oGm2wmeepNKX1TlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO4-00000008HtF-3I7Y;
	Fri, 15 May 2026 12:11:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNrO1-00000008HrU-0qTJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 12:11:26 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBgtOQ3197651
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sSkmZYTIXecruKnIHKGbRC
	08I5nsUev4oLNdqPbSV30=; b=bomZHud0JkdOHRFEvU87X9Zgqe2H2ONXINNV5g
	kmVBvv5r25s+s2mkfaVLx2uL2H4/sV7RPFh9x+pjpqVr4Z8UtxFrL0tvD54OcPNG
	0vkFBkpGhZjpOMfCQm2ZCol9dI8CLTBSO3FKADLKvdksjsRx9mKu37TPbxYmfUU2
	5P4pzmm531mEDJkgvuwHpbciQQbGDksee9GGRoUVx+pLmmWCF84aa46t/siUfVrB
	m7whUbVSyWikDx0cFy4QPBn07VB/42kK52jInNAKgHDnMbLcRljBKZcRIL7zHxYc
	1C7ugaCtFlD5yvNi/f8FKL5UfL/BkPzw5S1LKXACie/AhqsQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qb5r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 12:11:23 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95cc77982c5so965701241.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 05:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778847083; x=1779451883; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sSkmZYTIXecruKnIHKGbRC08I5nsUev4oLNdqPbSV30=;
        b=C5UY5kgDZA9QlfonTWeqybgmi/WNTd02nS5u0A1vh66BhrY7RoBJOiUg5bI0dFfxWP
         8YIesrQetRgbfoM5hkMjrA1ZSDRA4IblaZP2rE+dxko2oidY40Hs93KMC04AwvXOMJOC
         WBRs7trbrrC606PeGqBMQ5FH39a5E/saMq468nFCJMq76OT9leEfAPuOb2ptOXhVe7J0
         +nsqXJLU4g4c4xlc1POkJ/WVElaTdVk1KMkuqHWwGQHU1Q20TLD5sml+Qy1xCG+VJea2
         CmX8q3QbZjw025L+cX6g5eTdlFLkKomEv3dUMEcvdMQcx0K4c4T87x1Dgs5t76BY62wE
         ueyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778847083; x=1779451883;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sSkmZYTIXecruKnIHKGbRC08I5nsUev4oLNdqPbSV30=;
        b=OTLS+vRlDH6StX4cXnoWTQ0nCH6A26A+qVn1Wl9JxjTwQdV6ANIMoXupFhRQnL8aVX
         zKaHffnZnJU9olmvyYaZIX8p7LeiGWOYXgA2KO3Yb0k8+Tpm1MwOVY7ANj7EeVyA6WQO
         vIieRlJrHNecKuBQ+LF6pcP2orsr5HLpSO8iVDr8gxFIMDRRX+69ASYOeVKZe3P0ZkDE
         BslAwbHopXhKPhH9onf4aMCBR50ynabZsG5DfvTqZxFVTe057+gX74LYi4t7EUlQ5j7p
         SfPtx5lpK/3UrJ24lLJVIe2ce8pWOlMJ+4KRD+mPCSzppytMmzjsNEmCWO97buB8ODY+
         7vMg==
X-Forwarded-Encrypted: i=1; AFNElJ/b1jvCtsQD+itoAKNpVnSnlVGdwmu0plti2dv0CJeznEttqPkgnT2CkSE+WETvOe6QM55mJFQ2hhllRNJb7yL3@lists.infradead.org
X-Gm-Message-State: AOJu0YzV6Tg2HHObmxjlaDVPj1P8R0uHwLSaa01SxkevXkhBHrgsvDXT
	FE2AnCBfVMlOujyBCOpD+VG+w0Mfoe+0KmUfjMwaslrVyTTKHwP7NfiidY2EaAvmczyTr4wH5pG
	JIxfuVu4gkJtny1PYEuNcZ5bTES35XqK6GTfo2u0MExOaWUvjNomxEUGuzZnnyJv7Jb6Guj+PeX
	9B/zcfMb/ESw==
X-Gm-Gg: Acq92OHcFHzXQShQHv3NkEV/Ri9HfKsM2agMo/7tpw+3Gi9fnKEsDOY5QZvPcUvqe5/
	ltv0V0Vw7cmk7tcvB8naXWQetWJvZKqcv9OGXAy04jDy3hk0n25yT2A6OK3O65HNgWLiiRhZa/A
	f4CUXPf/PcKh/yI9+tpjSxwehtJHizONvQKXuVj0vYvUsvypnmFsXh2Bahd2AlGr3+28F7pgGqS
	X8MZqn45NRTZdaJWjS/0+amcHx09vFC+Lj570recy5OU53WlJYLhgzfItUFweha/I6YOuHl1HYt
	0iIIGylzBqFZkCCY55RxC7wW2t6ZT5XHSyedy5G5BhteAxFJh1ARdLtPH2smo37C0lPL4n0QHy/
	8vmcUDxhEPXqhHm/oPcSLcefxIxFfE3mgY5DKDoUErUix
X-Received: by 2002:a67:c490:0:b0:643:80f1:350f with SMTP id ada2fe7eead31-643812e4be5mr107678137.21.1778847082807;
        Fri, 15 May 2026 05:11:22 -0700 (PDT)
X-Received: by 2002:a67:c490:0:b0:643:80f1:350f with SMTP id ada2fe7eead31-643812e4be5mr107661137.21.1778847082312;
        Fri, 15 May 2026 05:11:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe57944c1sm66855685e9.7.2026.05.15.05.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 05:11:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/3] interconnect: qcom: Some defconfig/defaults
 cleanups and improvements
Date: Fri, 15 May 2026 14:11:05 +0200
Message-Id: <20260515-interconnect-qcom-clean-arm64-v2-0-adeebc73596d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkNB2oC/42OUQ6CMAxAr0L2bQkbiMQv72H42EaRGthkBaIh3
 N2BF/CnyUteX7sKxkDI4pqsIuBCTN5FUKdE2E67BwI1kYXKVJkVqgJyEwbrnUM7wWj9ALZH7UC
 HoSxAo220lnjOpRGx8QrY0vvo3+sf82yecXeP7kZHPPnwOR5Y5O79e2uRkAGWxubtpcpVY26eO
 R1n3UdzSOMQ9bZtXyNi9CLjAAAA
X-Change-ID: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b
To: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XU+CHlOt5PhDYuZibmrNgNvf5AfVAj8geaBn/seH7SE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqBw1fnQN2uhVGsdrXzzWL3kI11Nw4R5g4iLmrp
 +q3qgumbo6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCagcNXwAKCRDBN2bmhouD
 16GFD/kBR9A7nnTyl5hGs+7KbFU0oSLm9bfu5Z4ddAgbWejcuDPTCNsv31UXfqZe00Cqtg5V/pB
 4cbri1iSDhMcFlt6ysA/WFKljgxtM+MJJyVbRaLS8nMSIVlJ/d53jLrsMRLp76JOSCDVFlylQJ9
 zQnYS8Jh1xouIzRw7oqxsk2+hGQpaYYOuoGvn1LIwz24WqMvconuIcs6xHRr07RK3kTsA8CSbYo
 QGdpQ5hHWyWAAYK31x4Aa+kPzi4tyaj3qCo5pPnkRP+Iqf0tzh80ZA4RLNp5K/zfDPU8FUx/Hsp
 nyUjZ5zk4PG5DrBUfb7socXqOPUxPSO9JoKbiqdGSwiSRqrg5TewyXUCCIs9Ft6RK67hLCkZYfA
 CSVQ7Q6L6apYGoQll+5HdAXVGE9XczIgCRYYcb10hcWaJX84JFiezRenCefmD3TC0dvquBK9xPI
 aJv/2f9azbiQWOaxRXoIrhaOtOBXGj47t2RxjvYjAN8hJ9RoyFs8UHkoG0LK/Yh+pxP2124N7zi
 UNmdaapBoFva26d00DCVcbdtfMgkHIwd6ycQ8+Dd3dxDvUt68tOZhfSwT8A1ImE5Nu0YM6jjjgK
 pc+dpCejuzJIqUxrlJvTd0ZZY21NZfzqhDbjiLhZEib6aODrwWtGw1YTSMwC9nx5UVvGTtIXQNn
 PxZVBOBPpdco9OA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: aeL-ryUUXnVLh6BHyvBziQYcoT7CbTyz
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a070d6c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=baCi81C_hZCJqKNWviwA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEyMyBTYWx0ZWRfX/2ZkvKiDdRza
 sYe97rvmIJKtTvFHim6VPKN8w+cFR44XURUdR8x6CbOUx8C5+FdqbK7tbj/Jjq+PbF7fwdbQCln
 1cfv81o8WbRqPXT319v1FFdUKpDJ2MyVoinN5cVijbnxrYk3HESGiweYXOrf6Mhuu+OgAn1ZTQO
 Yh3x6uhXLBzNR6fZyma/2EIRKgSJUDo6RhZ1mS4fG5LRwsdKx+FNL2Su0Jbzuw5/LznHIc1qLUw
 eXJJ5+B2sfiAGbWJBKrGADvCU/RnUrP0RJJexuFbfHajo1yo+zROCSzQ29r9tENyEO7eSEo+mNh
 nZy8a/77qFuc0iJHciZh5y1NCTeWP2oO2FvpNLDwXNS6bZAcrtd1ri6RzMNeQlCShuUdRtrZyM4
 eDqmFKGdwohRn1ClymaPCR4FjqgCuuOPEsS6+m8TkVOu6hL/6TBUytBfkqyA9fi/7F/jHrA5y0c
 MzuTWejzVUENy7Gd6/A==
X-Proofpoint-ORIG-GUID: aeL-ryUUXnVLh6BHyvBziQYcoT7CbTyz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_051125_369097_F933AECE 
X-CRM114-Status: GOOD (  10.24  )
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

Changes in v2:
- Patch #3: Switch to built-in for everything, with explanation in
  commit msg.
- Tags
- Link to v1: https://patch.msgid.link/20260428-interconnect-qcom-clean-arm64-v1-0-e6bc3f7832db@oss.qualcomm.com

Similarly to clocks and pinctrl, interconnects should not be a user
visible choice.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (3):
      interconnect: qcom: Fix indentation
      interconnect: qcom: Restrict drivers per ARM/ARM64
      interconnect: qcom: Make important drivers default

 arch/arm/configs/qcom_defconfig   |   3 --
 arch/arm64/configs/defconfig      |  31 ------------
 drivers/interconnect/qcom/Kconfig | 103 ++++++++++++++++++++++++++++++++------
 3 files changed, 89 insertions(+), 48 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260428-interconnect-qcom-clean-arm64-aecdaa1e531b

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


