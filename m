Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E69E6FE24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 17:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=v3rUIku2rSkTEg1gYjUjn56Tpv
	XEPR2e+FKhyG95nw03ap4WJ2LLin6b+jZh8WxNtSAm+ld5yFczKp/EkVf7fnO/LsjDR4ScT7a+1Xw
	5T///L9b9Wf4nPpFf/lAM2PFqaRWGsO68onXhVgdShQgA8GeBpGouUfNz8m09yAogbHUg9EdsNerL
	VsyLE5QOO5nmc8vuBeeRH5ZNW2+jyZ3un8bJ55aWfresXzsm7RGDwTW+nlLR5KkG5OfIzddm4IrlH
	8S/8LF9d/PWJI42Rg9QwB0MZSIM3dOsdrGq3nL/MSJHUbjz1+HDcxiSRxAwJw9uQsW5o99ISIyj9J
	an6HXbNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sS-0000000Fnjz-0uJj;
	Tue, 23 Dec 2025 17:08:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY5sP-0000000FnhE-4Bc6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 17:08:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNFcEV94044261
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=; b=KXVpmBMFRvDzraWy
	FbO4NFJq2kfKoyUZpreawPEnEJn9egJWvU3Kk+tgbfjL0vxV9pHMj7ul5sDX+I/I
	PkZYsLHGz5CUv4+f3T94zQ1loDaG1ZH54vuANduNpY5hHZStDt3B745rrAkp1Daw
	rcVnEN1PK+jK4gSuNwlZFkWnrd2vix+Roq2koaqMmZrN0z8uwIxrkVMtZIDfbESv
	actDg2pJKGVMpzamXrpFyBOe0gJ4L4BQKJdA56AZTRHeZ5jH7hKaiU3kP/sGKRXA
	J16LGO5mr4FvTXNwCteCLFkTl0UZn75kmaJ3J1lGFhyh1rdqeaw9iYPjZbDnSxdw
	jHToVA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhbecq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 17:08:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0e9e0fd49so60598175ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 09:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509729; x=1767114529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=YZwDIDwWviIw+TmO+uVWP4Uv1ioguN9q8De37ww8y8fuO2LJZp1Z3Arvefv9TD88WG
         XuUD/KwkySo5ALwOKaED74EGdW4jE8lb5t4FW3pqFe1isd90z8knxxLjizSvHN4CUDJU
         Soz56gWG0pOzmeqfzb7eDHLGP0iX4z9B43Mewuy5dWEbkjxCQ6i1JY5kXGAZbEJ/u7mT
         NnIbo3PYNVXrbsrE3XFs3JOqUOLhZuzJLNJU6qBUkokFyj9HbSLsMnp4kLh6yeXkXXzP
         1ajVbUgbTpq5SxiDfkbgXjNP85pVb3PCasEFiYm7Ga/gYEDj6RzQKx3AU509S0ZONlef
         Asmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509729; x=1767114529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pQNl6k9FVRxiRZu36Ul1H7qw6ya4whFcoD1DtYOJAek=;
        b=hWMssJysNsw8qRhR3H47bImD9Z1QQb9Zi4OkBkHB5Wq/csaEomLO/vhsRTPlN+TGQL
         cVbeYNW9g2limyNiE09BbeQpDghtcM4X7YIf6T6VDJVgBUIpQ1nSru5iR53Q9bB2VHPP
         //G4ZUXVUa+BmoFnKMTfPGN14w+p5M5Ii/NaGtuEjtXOgdl0vFs0ELSqvYcpIzHKaW9n
         J6dY/wDhVQiWw2LwC3Z5BU51eJ6CANmJrPKy9ml32d951mNhK5Z/e1sMQbboEHvsAdZg
         frQqWSkYjFA41qqpwubeU5bdTRcITAOGENU4vMNAD7EgNm1UmnOXjDFxQGdTrwkGYgj7
         Wd1w==
X-Forwarded-Encrypted: i=1; AJvYcCXw7c2UqODxx/sllQZdV0v4LaoxDkV6LKwjjg1PiyYpRcMDlpud81l2YxUwxy9IICeZ7fTRAqCSEZ9CJxIEERGP@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ8LC200oxKwlaCECWbhQMUna1jSMaBqxngCT8R3apYmM5e2Jh
	zIuWxJb3Xdf8k0Knyju57pSR9M/6f9i1NGIk6ci1ojr0gsthPweVRXVmvgCWDzKFiw0OvngJqsn
	C30Sja9jh3z7Wzx3c7WIMqiU33gbmaTzYgUlGM8iUqlhjo1YCSgBEboC+lupauzVi2/QrcGAcXL
	6dwQ==
X-Gm-Gg: AY/fxX7iypcX7IPQObCornUST17fPxRYdqDikHShSMZPptPfNCNQsoHPpjacB3hlVxI
	q7nAWe0IMdG7YNfSogMmav+p62iVSomB1ZKCRgJdSrPmsg+LbbeY2FQdcio2kLrAzFCXw1wTNGJ
	bsu47QgELytRyW7clwryCgr4tiTATRHm6ZTKhdOQyClXmiQYgxC0VMlxfizs+/q60oeknOndrCg
	Tt322BUdZ1GKZ9pZKLJvSCN+QLL8NmSodYWjb4U5UVXunpF6mwDm7WJePoT7ViyAFjKbaNmV6nq
	csIiQwuH50zBrUm3/IKdmZQWwM6MpmGkluaqNyFAmNWddlAWxqHp1b6NQhXuqp1++zGDOvY4CBT
	jUzM9lbAsVcEcgWdot6z8diGkAtsaqwSlkc6zgTQmsxYOQg==
X-Received: by 2002:a17:903:94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a2f0caa70amr189654615ad.5.1766509728818;
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnGtVcBotVXJAPKzHeYTY5P1Q/ScCn+k8fMmJH94TyRGtDjnZNOLRhMrDflhFYB1wXqlZYtQ==
X-Received: by 2002:a17:903:94c:b0:2a2:b620:12d9 with SMTP id d9443c01a7336-2a2f0caa70amr189654225ad.5.1766509728309;
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:48 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:40 +0530
Subject: [PATCH v18 09/10] arm64: dts: qcom: monaco: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-9-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=1066;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=djZF5UFBEvnca6xGc5FxK/x9Ur59exsc3OaeKnFwerY=;
 b=fmzIoBglPR6F2b9xO27gFGHEzXk6aliiIcIYRLz28MY/i0vm6glGgNgEGEYz0Cax97UIEIO9P
 coj/ZXRR+w3CIw5VLyIQLGln2qGDYB9897apH0CN3f9wWSXNzpmz9ZN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: 7jNPnf6MvBmn-jAUFswCU1tQZlA1idG4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX9ZchAfMvvHGa
 c9/Vb1MwvZ61NPO6Dxeb5J1vD/8jnzq1l+SvUHqw9aXxFU4UxVaOLJlylBXGoFxrRZ4V6VFAJJw
 hnEb6nSq1xUXBhJaja6gLJlShP/3xfQlkcLg90ERC1aBSApqQi2wRmkssKPq/4ErOYlhuu4xACr
 Z4Qwx4uNiB1IRiM3MGBCmSuB6KkDmTSFuu/QIk++BIWIT9Dff7fnFT8vOp20GAH8QSo2JI4VwNK
 GiJzp7ercQk1hD686o3AG5yEgMQLU0C9Wji+qPoIqsj/0aMrqI4xHBBio19ak8tGoSjv8fIZrp0
 KJyLAarzEOqVONZgEwCwijSvwM7bidOMy/Hhx4blRC41h2jGzR6OpOOFGNmp3t+Eqq8oHz+k9Ze
 YYp6+lfoZdC8+oij1g6iL2ZOEkyXVC5B+GGKQo92hZealIZ6WreKFB0e73aneeSzFwIyu4122Xc
 rQsY3w3OTtLlV8FEO5A==
X-Proofpoint-GUID: 7jNPnf6MvBmn-jAUFswCU1tQZlA1idG4
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694acca1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_090850_052765_015DA16C 
X-CRM114-Status: GOOD (  13.77  )
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

Add PSCI SYSTEM_RESET2 reboot-modes for monaco based boards, for use by
the psci_reboot_mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Support for these modes is firmware dependent.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 816fa2af8a9a663b8ad176f93d2f18284a08c3d1..9c8087f870fc8889edffda63c62f4d5167729cbc 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -732,6 +732,11 @@ system_pd: power-domain-system {
 			#power-domain-cells = <0>;
 			domain-idle-states = <&system_sleep>;
 		};
+
+		reboot-mode {
+			mode-bootloader = <0x80010001 0x2>;
+			mode-edl = <0x80000000 0x1>;
+		};
 	};
 
 	reserved-memory {

-- 
2.34.1


