Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1693CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=; b=Gb/5HC7XKz+YWO
	/aMU3BLA2zRcc5baIkBCReqqJlvbm8CfLZz/Q0iZCkmFaage9OCS2d1Go9K2WCSsFdDIG4PmKIEqD
	gTxG0Y1tMnLSxJyoYlgzm2ZzzWow1ekv6iEdNjvFzGA45aXHxL8i+f2mX85lEjpy48YmnnZNeAqOi
	MQ6vvwshktFYJdJYSu8HDYb/PdAiarKHFluJAx7lwMf4jDVIoFygDU349nFNVhq91VTTOlPWoTp5d
	xWQQ7jc672YCqZZK290jgo7o9ZVGvx/Zc4O2BJ/IOTpvxgGpLIgthYhS+TkaXmwje/aK1MrMihVdN
	gjYqUkKvRU5CW2wdjxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRf-00000005vAt-2q6X;
	Tue, 09 Jun 2026 15:32:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWyRc-00000005v9q-3U67
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 15:32:50 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CmmM42700902
	for <linux-arm-kernel@lists.infradead.org>; Tue, 9 Jun 2026 15:32:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LR7pUiOtXdsZWwJIp+kELZ
	Y/b8Vn5ylhhfHllSjIREM=; b=F5N99VhWOmRfo8hYr4nXO4+1hNWbXfeop7oRQx
	ppyC73YrnQKMgNylTj8fVLDZwuYe4hcelmZwhSmEoKLXljzvra/OLTo67sf0CIzS
	D0HigTpmC+zFvATysi8Eac/MInIvreUIeWX0J1aV1dBRY8BHKtT7ir3irlMX9SOQ
	nuLA5I94llii8zin02SlRhvfJjpxTlC3zpNO2TCWOUCu0TlqK97TyHJce7q4Lv65
	N4Vad5dHv1guKNv6h9A5znEaJf2oMXhiPuNAL6pKaO0ZHqEx7BxBM3ACOFxxlEYd
	sEQMfpp74ftFJ+MIeg8PjNnnPcRhRd7MU0D7hThhyTJInEKg==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epeeat7ns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 15:32:46 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e6b5976d74so10488788a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781019166; x=1781623966; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=gRyhwU1xsAXSCNyFkoFqhJ9jcirGFXT64xNqrCDeB4sfG3PJR5U3oCiPxFFhtgbX4V
         zGQv/Cuz3zccU/ZeRvz9osLbtEII1K1eVfA1YtCvIWsar6iewNfQSKHqwTmZIOk3nM6Z
         mgCdOtH4pjlSpP5pyGAB9Mo/PUKmmwZGa69xfn88P3Rb4fMtE1z2Hg6Gq3ftIRkfQgfM
         5iG4NRuuI0Ua/vfsIQxjKpg8nlbu0459fnheGANT7FyiXFwlR2eycjSerVCoI6ZGeRpd
         wdAjRVQ/DvEkPrQp3OP6nB12TgHxoujl6EWuNNc/SpKaCxFpB6V+nmt3AW75xIEAcxQH
         9ZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781019166; x=1781623966;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LR7pUiOtXdsZWwJIp+kELZY/b8Vn5ylhhfHllSjIREM=;
        b=N6gL5N/OmoY6md65ETiS/GZc7dChAklXIvyOqMPu1c1g+cIYxisRIcGn4yf9nROw68
         NrnPYsrA3n0G37i0gykMemXHENKrl2EAmEw2ssBfEn6KDTCJ+xjbsYNA4mtLkfk914qy
         U3/U/HuaE4aHqFt5oFTesmEtJwiKkLhHXUQ7U+wlKXsDEvmqMW98mQs8bmgCmOw8X4nu
         2aqkqoOvWTWpQIxYrVbxaDPrOjN317VuPcwfdLx+eHnop8ONDkkEkuEd9I+WnOlPodL1
         T8+fNTMvus2LWjB9rHSVk3cxM8ptozRKgsXCa5os/C/g5HzLoN418GmE2gLym7e4Yqp+
         nwyA==
X-Forwarded-Encrypted: i=1; AFNElJ/aZjE6WPj+A1Xa035ooE466R8j5+QMjEY+zCQ991nvHCW0w4b92PTyPOJaFBaux8gGECRPE2dbiNx9MRzeNtzV@lists.infradead.org
X-Gm-Message-State: AOJu0YyrzRu3ejJ0p7eCc91n2iuY8k9BNYTyD/k0aaM9AW8iUJTsAF0Q
	0qU/LBEx+1RVjrpNtZAZ1eRNKO18wFqSkvwxmoPovmwXbYFYvZIDGEzy8k2ayK49PkMteDRxoXi
	7nShDkWJqePo7daZmZW1y4QJLKOcnr7MExDtLevnOpLn2MtmZKaLhPntU1TxzaalEvIS4M/hc+u
	zdMWeFM3wCxg==
X-Gm-Gg: Acq92OGH3MueHxcTic5Eb2AQlz5Z2dz3t8Axov2WsQjNTMtbSMofNt7Avo09peyYh1S
	T3IPh6iwae3tKb/Swf5Kp4Hz5BPTiHfGl2IWYEHHgGwe7JtYRiMUqI+WvOI8pZy4GfkogxCvEUg
	TSDnZzigbxqPs6mlFxOaH9YMKEWkBbohUgxar5msXWV0UoQ/z9nj/FsmzwvjOwMHHJOdsRaEbmE
	jnvXLypG2rTkx8mowqEQogY88A7CZpZYYauhRQN5U3kRY+QleoK7laGVqKHhJAn6YRCUiz/Y3uC
	64k8Kify3Td3kOJY5qao/+aFpKCo4/rJEMstOLX5ValEQXM7dtnCRcUgOxHp0skbk6XDBXL0nfU
	OtPS4QQsJTogTZoBWbd/xfBKy80iVP0qwJd771UHEoKKl+5MaDPo5wsRV
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303932a34.20.1781019166130;
        Tue, 09 Jun 2026 08:32:46 -0700 (PDT)
X-Received: by 2002:a05:6830:4990:b0:7e6:ce35:4b11 with SMTP id 46e09a7af769-7e70ca611d6mr14303885a34.20.1781019165679;
        Tue, 09 Jun 2026 08:32:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f368e9fsm60938203f8f.37.2026.06.09.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 08:32:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 0/7] clk: qcom: Add sane defaults and drop defconfig
Date: Tue, 09 Jun 2026 17:32:34 +0200
Message-Id: <20260609-clk-qcom-defaults-v2-0-0c67c06dca11@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NzQ6CMBAGX4X07JJCKD+efA/DAbZbqSKVLhAN4
 d0tePeyySTzza6CyVticY5W4WmxbN0QID1FArtmuBFYHVikMs1lluSA/QNGdE/QZJq5nxhKLHW
 lctNK1CLsXp6MfR/Na/1jnts74bSHdqOzPDn/OZ4uye796y8JSFBFRYXCDA2pi2OOx7npg/aMw
 xH1tm1fz+PPscsAAAA=
X-Change-ID: 20260416-clk-qcom-defaults-8c8d956fb0cd
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A7GoQjWhXQ7RHWuKuc9bRKN88zKtGeMVd+Z9hFoM7hU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqKDIUNEZUAwYJ/GEmRW5xyUdgf5U4Wc9gtJxLs
 wTmKqzs3GOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaigyFAAKCRDBN2bmhouD
 1+OnEACKy72HGcg6UVD/PLQ22Yc8fvpcEZR+fOK6OGFnbp/d7ZmOTh2mqm8iAhkh0o/a50CujSO
 FCQDHuOzRAfxvS5S7doPFrjPXvES0uqQV/CykC5mlg4JiCW19tYiL9x8DSp7cMabSgOWZeGpQu4
 5VIiGZ1UZjiO5mNN/UP7riOYSgAfDEV1S2jCrtQYi6HLoHRXJZrOp07wYeuyIXyL8eCZev7fNP1
 4jEVw+QX2ObuRyYmXRGgNtRD6TmtV39aFvnLpbLWthQaloxj6d3tolvg737enSD1ohTnPi4lU5k
 iZGo7O3NNRyXCfa2F7BN9EGwcG+FpeinNwcO6R5FVQmKmvw8d46xjZp936MxZypIIwBDSTuzY04
 5pkXD39UBVW9MZ244of5roC8dNfICdR7bd0wEU2G0rXGH2rKIvoOl1T9Tjh2j5C8OaQhMefmhra
 T7AtKgnp3nR1iLQG0/IcWHmEFUwSs4xFisuRvjM9KaKeN0iqRVriG0YsqsTXD3N+NMQQP1LP4Yi
 LTscdd5IGyqoKwJMcyk/fZrawJhbMjB4MxA/4VGlSfsgpY/1om80F/fDY60XOE5DpXzhOPk4ou7
 2CdTEnySEw0jrWGrarVlAIVQkIpJlw5zpahFA9CtR/cWlCD6NvUCnuNPeLJUMEEZkEp8Oh9FrQX
 oohsHQUzuv8hiJA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: xVgDsXnAW0hx_T584T5-kfaodBIbyfYN
X-Authority-Analysis: v=2.4 cv=Iey3n2qa c=1 sm=1 tr=0 ts=6a28321e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=jO6dYz2E5lbJ9Xj+xBc9tQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=KTTc6GEDVJjevZXz-osA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDE0NyBTYWx0ZWRfX8ZubSqq1/hge
 P7BYS0ZBl+bd9M7/BkNdLD3AUGbE5MmPwQpNHqMjAvGrzDEnAH7H2xSwWBD5jVJ3fkuk8knLq1C
 P/EtpzCpiMp2VC3q68KXY8c36zaThHq0O4SkOG6wYX/fjnPJqiWjB9YgYXMbTuXXefN5NkUr9nj
 UjyI74Kj2w2/4GWzK3jOHtNCFgLgpniHYy65UKN0G0Pgt5tvCJfV4XS9fzMJtnnUDQLEE/5wZvF
 gfWqHKfUer5pfNaCHZOYunNmWXEUY8sTHEs6NEcBQzeGCUB3c+EpLl8Pw4d1DWXvX3eFhgfI0JE
 Y9IkafgWFcr8KWVatcqH3uKvACT1tn9YvE6KyxxJ1oGySEmDnX4sjLzZEvFP0OSzRuXOrkztmvp
 Pn4DnjymxmBWdewKq6vee0rnsXRH2lyre0ltj6BOkwsLgfVpSUHm0Bw+kE0LYoMpB0aCZtWmLOi
 t++eRDwT+sjGnJfjmlg==
X-Proofpoint-GUID: xVgDsXnAW0hx_T584T5-kfaodBIbyfYN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_083248_991195_8DB81446 
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

Changes in v2:
- Significant rework:
- Add more commits, also for arm32 drivers
- Split defconfig changes to separate commits, so clock can still go
  this cycle and defconfig later. Also, less conflicts.
- Link to v1: https://patch.msgid.link/20260416-clk-qcom-defaults-v1-0-579e75c4cfe5@oss.qualcomm.com
- Dropped most review tags, due to changes.

We should not be really asking whether to enable clock controller
drivers. This is obvious choice.

And if it does not seem obvious, then consider [1].

[1] https://lore.kernel.org/all/CAHk-%3Dwhigg3hvOy7c1j1MXFy6o6CHp0g4Tc3Y-MAk%2BXDssHU0A@mail.gmail.com/

If the approach is fine, I will do similarly with inteconnect and
pinctrl (and maybe others).

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      clk: qcom: Restrict IPQ5424, IPQ6018,IPQ9574, QCM2290 and others to ARM64
      clk: qcom: Restrict A7PLL and IPQ4019 GCC to ARM
      clk: qcom: Make important ARM64 drivers default
      clk: qcom: Make important ARM32 drivers default
      clk: qcom: Add defaults for desired arm64 drivers
      ARM/arm64: defconfig: Drop redundant Qualcomm clock entries
      arm64: defconfig: Switch Qualcomm SDM845, SM8150 and SM8250 drivers to modules

 arch/arm/configs/multi_v7_defconfig |   9 --
 arch/arm/configs/qcom_defconfig     |  14 ---
 arch/arm64/configs/defconfig        | 119 -----------------------
 drivers/clk/qcom/Kconfig            | 186 ++++++++++++++++++++++++++++++++++++
 4 files changed, 186 insertions(+), 142 deletions(-)
---
base-commit: 6eeab89909ff9d44745e884b65c8e0964a9355ca
change-id: 20260416-clk-qcom-defaults-8c8d956fb0cd

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


