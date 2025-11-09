Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8065CCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 14:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=; b=HY7f/xPHn8BemXip+BHzz+htJa
	lGnd99g4KGLnRMXmcLUwaQS0QWtsADH3GqTJLkMZyeEexAazW70Tuq9UIL9eXs22wbV092d7jKjTL
	y6ADF/uAyifvgbyk7epGtVA3FrX27ZYchpNva0HrYuBF5VTiVONk5aasF0WWpNOMApKqNkAeF6OGT
	mTjSJ+kfGd+ZqhohjP3NI856vBS35JhEH3lZh2/+xX0DySTbj+g+iVL5P4zqjmtpCdtaWiJvx2dIu
	7S0/xAOl9ryEalCJi8+lyCqOcJHUuJi8OhrNfP8zxP3eRoJH9ljqNsuuFMxshh97W7J5bpYqYMUN2
	2FbQp1PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zm-000000045Uw-36lE;
	Sun, 09 Nov 2025 14:39:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI6Zg-000000045QG-28r4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 14:39:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9BEgxq096721
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Nov 2025 14:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=; b=Qulzs5RIIcnCNQvw
	3YASa0XskvbnqqKy9Et5ewjLMICObYe5WyY4Dp9KLZDrt1fKTRPPJEVoF+hKdhnt
	1nVtb5sLIeeEsMQQs+OWfbBzB2L8tzmb9g3O+ega2uaFOsQq/GL0G0CrXp0NUdmE
	CU0hQj4rvUY69jpAJzSa14a5JbXYJt909h1ZPYHQTz0Lmb52KCiToZkj8gG/6ufp
	ueLmRn13RSa+g6vU/HD72oV0TCUjkXUWnjkwQPTU2PgtKwVJUKmTAGO7gVmtgkHe
	H0wZejM89vC7pojazs4Rq8swLhC/zCNkrxchus3j37ug7KIgNnp3YLDsW57qCyr+
	Ij4Iqw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9y1h27fe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 14:39:24 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-340ad9349b3so5696703a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 06:39:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762699163; x=1763303963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=;
        b=MvFSM5YFueJSXFClDSykRhA+e2+DLwQyYOeeTXswkALRCYVpuILlJ5DgG8thxg0sU4
         Xmkvh3b4tNtwf7w9hG5U3cxk2/JUkrvxAxYnO+oxRWpsZx5SjOFu4QnNMA+g1Wk9NQBo
         QcjEe/Drieu9vV7S04n1OWx5NfFHHnnybbOVGtlX3oSQV5wtKb16AX4LwFvVjkEAIRXw
         G2GFN+PjacBo3Xw2Amre89T9yg6eBpBJOoZIKeMSmxYZRdsL+7XaPZeQbGNi7byfCe8t
         4P4g+No1cdepmyy7D8beeslNXLpwVWZcJ9i5JGTqkoUrzcWD0icoMEXqUFoTz9EQGVgw
         NRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762699163; x=1763303963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kca6TC9CdzvVOcI/VsKM/bsiay1QMyWDYIKPAfu3ShE=;
        b=LcKsAq/YgT5F+Y7gXNyJJ36bpg3Usi7Jo0cTlBqakzLRcP3nbbeM5ylFA6pwv17nKf
         Xl3gdqgFV5iciTSnI3yTAgQe3zliXMzp0rB8zQbSFDZtbtZOmI/qLYmDimrJJp9piFP9
         APcTNDC8C7iZGLa3RC3UEK8YnCsQs9yjD808sE4jyIZV1z+quHgeHxrHqUXqbJ+JV4E+
         0mnKu6T+nWoxMK0dA+gMGVEobhfHiWl2qy/vjd1hYibcQlDEfRv0Vd+3y1m2VkggCkr2
         0F+/lgsGWzUbx/YsxpibaKJ5Lpv032z1H5MuUk4uqr3/BuBV4qzcZ1sU0EyzO92GoslR
         yTUw==
X-Forwarded-Encrypted: i=1; AJvYcCUyXFl/Wwe3QyjZLSVjUIDBUZ0r/S9CU6Goj/C7ogVlsAezxwyyxo297st04B8UnY2xw/cWNEX+9ewA+jclRPsQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwF4B67lgV8g9SWYyqPuT17rKzzln768/Ncu9ehBViNGeD8cIlR
	ZVRPR6oIBOGb/9epXO+mEsrWPACfFJIKgncmBI4IGSRPa+pVjzHK7VcNhsVXZgJbxiuaXfgXewz
	x7oAzobSFlWOK4t3keSqic5S4gyrj0N23XaGHoNe03xbJIQ0HxXxEPjUEZHxirUrMStdjg9T98t
	92HQ==
X-Gm-Gg: ASbGnct20V1U6x+7rH78hw0FJN04BM9Q6eht/H1ITiSHkQIAdcNOoTGoOtlIxe40D3+
	4JhRsRAyApsOzXEoSitNY8dVb6n15hKjRDqgiMHMW5w8+MYkP3AbrNPhYGcw/eYJ1MGIetl8l46
	VNTLGvC8uAkXbI8BCqSmfCejWBs2SYUDwty1K4hY3Q0lGi/USG3Vh+cROsZtAZgIW/0D+q18Go5
	xqv6OvQB5o8hAf8CwTG71mWV0OyqugJUoHVzcO44E4H+//VEVC0y1ercJGjjfe712kJP29fZs3p
	R/Hsf1AnlMxiZNgfdTR1wP4gFDwO2Ft4vU33Gb0GyltUJ7IznmGVDtLttiyy8iZW2AkCowa07YX
	mO3T2g71QV4wIwWoFlaycv+ybe3wpgCMFYTE=
X-Received: by 2002:a17:90a:e7ca:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-3436ccfa18amr6671654a91.24.1762699163444;
        Sun, 09 Nov 2025 06:39:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvyQ7Ie5qv51GMyMWvjT+5IIfkhTgU5ORFWh8Z2JxruCZKThIUurXvRJ2KKFN2TNS6U0/pA==
X-Received: by 2002:a17:90a:e7ca:b0:343:66e2:5f9b with SMTP id 98e67ed59e1d1-3436ccfa18amr6671612a91.24.1762699162859;
        Sun, 09 Nov 2025 06:39:22 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-341a68a68e6sm14845401a91.4.2025.11.09.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Nov 2025 06:39:22 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 09 Nov 2025 20:07:22 +0530
Subject: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762699073; l=1185;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=aXB/ZtnzKwJgS2fh5ZS7UmEMWdC2tYWUu81bgPi7sZA=;
 b=cGRfGGTemz5mYMnHzcIsN7x+3Xmr9GhPgiiKRvGsHEkgcZwXovPN8MabUz5/JPID3VZvw/NR1
 ZRO8BE+Wor7ATT2oXZpYWQAGPs+8aDB6Tz4FhHXDk06RqE5h7lgvJnC
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: AYvE2hCKa3282e7pKeHV2TkfXjJkmkj1
X-Proofpoint-GUID: AYvE2hCKa3282e7pKeHV2TkfXjJkmkj1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyOSBTYWx0ZWRfX4YADoi+JjOGE
 VlyKhxkKokZJyxzJTNfDv+O0oghgJ5tOExNjZ++f3HbCKkqpECAOqHQt4Kp0FVRqS+RDzt9jfYB
 XF5YQkii46IFdp7VU4gFnXUsUOdo3bV6JqU7zrYc2zwTj5hAHYuyga7XCL+EHxwq5ABUzbqr81n
 AmnReutM+cSxVQmjIdmETSC6lIIoHhH+hIdDhlwl/H+gtanTCrJEsboY1NPPhHkadtK/FWxeFuS
 1SHzlPPrugq7vaUQEUb6YXIk/6mATP22iU5UT+Uxsks61uTwpJjP8xN3T4ivwQG93TSERLNJtnQ
 1tRtBthOy3ZzZvzXt41lfhuv5oxNf7J5cT1oPN40Znv+UgKon4W86Z6p8+RkdgfS9me008kWCmR
 0sgaYJF390RE/BfHVwxKBcC/rXW7bg==
X-Authority-Analysis: v=2.4 cv=Xuj3+FF9 c=1 sm=1 tr=0 ts=6910a79c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=w06kbW2hXDg5FjFnD0gA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511090129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_063924_578420_F704AE51 
X-CRM114-Status: GOOD (  14.07  )
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

From: Elliot Berman <elliot.berman@oss.qualcomm.com>

Add support for SYSTEM_RESET2 vendor-specific resets in
qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
"bootloader" will cause device to reboot and stop in the
bootloader's fastboot mode. "edl" will cause device to reboot
into "emergency download mode", which permits loading images via
the Firehose protocol.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -935,6 +935,13 @@ &pon_resin {
 	status = "okay";
 };
 
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x10001 0x2>;
+		mode-edl = <0 0x1>;
+	};
+};
+
 &qup_uart7_cts {
 	/*
 	 * Configure a bias-bus-hold on CTS to lower power

-- 
2.34.1


