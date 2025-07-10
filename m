Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83750C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 10:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JHDq4xNymeRQPJylCbaS/K0qseIZK5kd41UanSbGBs=; b=4dzvU8ObbxDKdXIwTyRDkxIfGv
	/9iBfzjTQmRkmrFdI8tov21t7z7CwVh3H2vJsOSX5uqWacMNCTfe8rfSX4TULAzywOfcUEx+1RhJf
	5XdA0Kv294oNRfS+AmteDMP/Bp0SFbnOWjZ80ft5Ct32ZLW2aiwxX5LdqcU6JTcLFhp19YwH4H+x+
	yfbQjuAlVDbS30aUPurlarauZMzd+g7wHNhPPrPkO5ANBqV3rmeUczzmoIn/e/q35QsIULhAc/k9+
	qBZQ6V/HklNo7AHLvhdC0o4Dc0vDQGahqyNDb7pAI2x5e7PZJd0lneai5y6vyzrz6gbZS+8B6rKn3
	rPreGhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZoQq-0000000BTDN-2I9l;
	Thu, 10 Jul 2025 10:23:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnOi-0000000BJYl-0XP7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 09:16:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A8Ursg011029
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3JHDq4xNymeRQPJylCbaS/K0qseIZK5kd41UanSbGBs=; b=NBeaEdjdL1iocVeu
	/rYDdybPhTfaKd04D1Ltrm02Fx08mFrP8+Y/le3PKMA4E6Yn7JRUshnex1oLmzO4
	V17upqXQFqIWJW0VC2elJMT6XUKi+D6UCEpKt4Cnf5Dma+uw99D57W+ke5kFMZAO
	RZskEFFLo9fkAQzAEv/tQkbxDBDoMomQG3H75Tb8LgpktM7xhfI/Ecb3qclcxFy8
	hWOhYUJLNH2lqiMKsnz8McR/KxxeV0M8+ukKzBtIgWgadj+51FAihBM5uLeIVOzV
	GXb8SVOKU7QRsZW7Q2+WK8Bryx+WBb0Ifr1WrlTIWvq6wS78CokNJ7xx1x1abvlJ
	z2a13Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7vfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:16:55 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23632fd6248so8555325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 02:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139014; x=1752743814;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3JHDq4xNymeRQPJylCbaS/K0qseIZK5kd41UanSbGBs=;
        b=TcEUnZ2swJH/xos6VNBpPwf+ZuUCVQNMzJ9U1xPxLuae0UR8KDEv1Z1xRo7dm39aLx
         i9QgPsSBRlLE+Efv42qnr5f+u2WcaP8WvviIJNDsDeFq0eNTrYVsDPmBeI6srdyWR7+N
         udIhb5PdKpEOhZnUZeNZrV9KgNzuPXEK4XugajwkeaWftU/bCu0hIN46DGv0AqZV7V1K
         t9ZF+pwQXRG6jpg87ZHv/KcFiLbfBFC5xktlmxDbG+iXdIyJnZCnI77eqDSoM95kOYx9
         hbjD+6Ou9VfmMB3ayByCFbBTEKepL3j1+cVoyd+w1xAwp+8S+SU8ALofbked+gw0lDr0
         5btw==
X-Forwarded-Encrypted: i=1; AJvYcCW6c6TJCrZl9WOUMpm0OECBOFvDb1NjL4itn9LsW8fW6vSuDDHeTi669fyX7WrW7y8e2if7y90XS6WlGUX55Lie@lists.infradead.org
X-Gm-Message-State: AOJu0YywUvSp4UNa3ZFVmHFYbdZpBzhrVL29yUiFzWTvsHSGkR/zEAQn
	CpV2YyGLQMNIXGUFa2TWqgfv/RotrrTSIy2GqwDo6MCHOtxaMw6tieYoarsdgvm93SYPYWcpOtg
	5PfCxJ8L9aq574mmzfH3zeMN4jaer7xF4qIjJcO8/l5vQtGso9ztMfUIbSrGKs24CWZ+i/pm74z
	fgzw==
X-Gm-Gg: ASbGncuMxIjeW1PXc1xPnK1DWIAx0KJrd5fNmJMNSp1D4eZWDOTkhS60VFf9m2LHigB
	vdDTNhzqnylcVROn6qXgqJdjEzxlgsWRzQohC91u133wp0/Nwc6UxmKdqo3UayhDAuw01D6RJcV
	FGS8Vf9hp8cFuHbKkuodlbkVjVTSpOoRBJApCrygsaiS1fmm+erS6mt0DzdFld7qwEs+G66T74B
	77iuQ+CKi+li+9IUYQnxcE4KPCkCjcl9tlvgpeyNPLMyKAzJ+WKCWM99L9c6wsSvt7NPU1UDbIN
	XHtXs1MDMw23CWIEu51vsoLL6ruQAB0WBkRWp36UTspYfFuNZVYQ/DCM8A4=
X-Received: by 2002:a17:903:19d0:b0:234:f580:a11 with SMTP id d9443c01a7336-23de245ff1fmr43550665ad.19.1752139013946;
        Thu, 10 Jul 2025 02:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhuu3BMPy6+m8LotTax4Q3myhPb72nZbkwXLoKvQavuh7mNiBOrFXL2YDf4RnsCd1Y59kqaA==
X-Received: by 2002:a17:903:19d0:b0:234:f580:a11 with SMTP id d9443c01a7336-23de245ff1fmr43550425ad.19.1752139013557;
        Thu, 10 Jul 2025 02:16:53 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:16:53 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:44 +0530
Subject: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode
 cookie
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=1990;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=viCb3VHco50oE5St3/+zoJqA55BoCRGQlTkgrUYg/Ls=;
 b=+tAQXKo/oQadh3EVPYHeqksr67cJmLufTnVdZiv/vcBJ0BqSY+aKThnGkD+4p/OYWNsrrETxS
 MZV5O05idFJChRAtYALBJlBTh7VUYG0QMDDrgODlWIE2AZJ0ZArgeR3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f8507 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=vfvPc3r3pdiY9V1EK2IA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: quaiEZo6t74l-qiirqKXLcApBCgbDIdt
X-Proofpoint-ORIG-GUID: quaiEZo6t74l-qiirqKXLcApBCgbDIdt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfX5NMiu1WbFo7F
 BQ9rllnYG77pdmG7jxd/uCSrPYy9CBw++dqDIWpLRC0qvZa2w9RxcfFmFRGggqxeVjJ3afH07vO
 jLDDXC90CT6qJSu801tGGRd5IjcpaHSpaOhznQOCnmo0PtWBm9/7ZaaLKtUlokd2VlB13Fi8HfQ
 ODg/yyV5E1Lb+1ZwQMKHmlJstMzMHd/yhfPiV+i34ROZHNval9/ns9ZcZ8+VOpQoIjkyp/yQeP0
 Gr8koR20s2jHp7jsvQXUQKlcTBELkUJLIcYwAMW3YkR7Mzn+XF3SwA+hCfBIsIUaILL+R+89ehP
 IaCCVgkL4XrKdTkW2Q98NjmTsuVhTqlQl56S6k0LS7bPlrQv9mEE9YgzMBkVfj0V5ClDG7Bik2h
 cUbRLz4fxqaCMuvfWTm2Bgk7lBqpWAJEmB/YEqYY35stgffCGA7mOTJOwk9KltI8fdLKCvKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1011
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_021656_276936_220211A9 
X-CRM114-Status: GOOD (  17.77  )
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

Update the reboot-mode binding to support an optional cookie
value in mode-<cmd> properties. The cookie is used to supply
additional data for reboot modes that accept two arguments.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 .../devicetree/bindings/power/reset/reboot-mode.yaml         | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
index 3ddac06cec7277789b066d8426ea77d293298fac..a4d2fe1db51e0c1f34ebefddaad82b8cc0b1b34a 100644
--- a/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
+++ b/Documentation/devicetree/bindings/power/reset/reboot-mode.yaml
@@ -10,14 +10,15 @@ maintainers:
   - Andy Yan <andy.yan@rock-chips.com>
 
 description: |
-  This driver get reboot mode arguments and call the write
-  interface to store the magic value in special register
-  or ram. Then the bootloader can read it and take different
-  action according to the argument stored.
+  This driver gets reboot mode arguments and calls the write
+  interface to store the magic and an optional cookie value
+  in special register or ram. Then the bootloader can read it
+  and take different action according to the argument stored.
 
   All mode properties are vendor specific, it is a indication to tell
   the bootloader what to do when the system reboots, and should be named
-  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
+  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
+  non-zero value, cookie is optional).
 
   For example, modes common Android platform are:
     - normal: Normal reboot mode, system reboot with command "reboot".
@@ -45,5 +46,6 @@ examples:
       mode-recovery = <1>;
       mode-bootloader = <2>;
       mode-loader = <3>;
+      mode-edl = <1 2>;
     };
 ...

-- 
2.34.1


