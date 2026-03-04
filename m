Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D28EFCE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTTNZDsVcxtX1XnLnS05CMFNUc+dltAX8MCcE9nX8jo=; b=djcpA9h1dB/xqNf5CDOESD1hhz
	I4lBeNrvg+UzNZokj/sudThKvPyUpXBFtiwkq7Fk8immpKELj5E4B0FXiXvb3Nw0mNFU2c45KxGrc
	0S0dDB6vDkpZe7axMnKvl/d4Xazb5t+Zy/XW3dis+8KGoyu9QLpG9rcShqAU5/4YsVTI2KQW+AnSb
	KrWk48SL0mWR23JVMpAwE1PGJc0tT90Qpf0k+CmFUDMQz49eSua3vebvExEjQIlzL/JFKGlq5KrBe
	yLLGiCK1nf+jxhFuRmpUsIqaURolxh1UP+8kzUbvdPK/CVWIIEW6IKKiLxnXZmrLjQZdD+j+5KZaG
	fpyL+xvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaY-00000000IUh-3OaN;
	Wed, 04 Mar 2026 18:04:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaX-00000000ITb-1j1F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 18:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=kTTNZDsVcxtX1XnLnS05CMFNUc+dltAX8MCcE9nX8jo=; b=aBfeCVv55dh3VHbpzWSCGKJ1XH
	l6wg0eMx+DjxFt10sC99PEZ7SrS2KQsYnstNA9OY7D3gbYt9q5cXYSyTfGvQaJ4Qqzy4BaAk2FtI7
	+ff9njkXAotVW3g3FsMc1n8z5H2V4gCjwaRJ/8V+YcaWtKTlUiSg7yKqzJ4qv78tfk+ZiB/A4xXLe
	sGeFNVixQHIfmd6XvLeSPxGy6X6xJ21QBdW9woBntwcp3UbRjg4dnwZLQTrrU2mo8Nyb/nNzmRKMu
	aBomjsD3PWp/G4FHMPnXPdQx0BFy9neVW1151+yqQSqICDh/ogrnKz3o21SDM69wH5tzf7HC/7zyA
	ZPz8M4Fw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxqaU-00000005IEE-1Gth
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 18:04:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624G2Bvd035620
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 18:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kTTNZDsVcxtX1XnLnS05CMFNUc+dltAX8MCcE9nX8jo=; b=UPeSScBH9jwnA4bR
	Ni03xOurnQYCwd56akYIQPKVvob6IqeVx8eE7xEnfrYQ9ACfVbgbXbLd+7mqoX9D
	p7b5GBqXXg/D0x8ZL3xkLi90jOTXARtsOvqzP/hM0JANggQ2Ue1sdtrNR4KLOE8n
	MH7WgUCGJ3FvZbo92NFsd0Bb5s5URXXzTGQcqmVgLuAyPgWWKZSXABzKvaT9y6bT
	H3AH/uk3IqKd64UgqzZ2V3RRdFW7iwd5hRwK3WL35WYN8noduI/AYJsv3zq0JKZK
	qH0eypK4kOS7H692C8CmJ13WnwN0/KwfiZh02Z5bwx0yRjceeiayUAjoXj9JZSxh
	4UdWog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpqwg8e7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 18:04:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3598c05c806so3517177a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 10:04:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772647484; x=1773252284; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kTTNZDsVcxtX1XnLnS05CMFNUc+dltAX8MCcE9nX8jo=;
        b=IsnGcP+XWCXTjhBMDuQ6+lqe2tLpXH9kK2mYBg0hlWws1lqMme21x2++lUjMaamJyV
         a2T15SOAA1+2BrFrQVpWz8AX7CWxSPOxHHYgJxK9K4EUBcPu3z3UTZ80OBfMQiYPm3xw
         fx+apF7pjRI2kz+mFhtMqCc+h3Csm65duA4jaOqxHMZzZfUkbWWsRXy6MjYVW0xsSHgv
         CgqnIsunIlNLGkGxXHdtuNh1HOSahEyQjUe/NiNHMwBEinB5KU53Q/bpe5NFPEnGmRK2
         0Tfeg7M/PA723B7KoTUtl9N5+BLSSxDKQwaVFhx8Nwg8RHQgmjLEL1wSzoFxE7CsEx7+
         Aptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772647484; x=1773252284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kTTNZDsVcxtX1XnLnS05CMFNUc+dltAX8MCcE9nX8jo=;
        b=AzaISs1NBZHa5sSqFtqyex2WqLGh52/OCfVZSuv0c3CaeKyQSKe3qSZxr4izqjQozE
         T2FHzQAdW8FHq9DsFVE6UOAHtzivK4SfgC7gnW+Ij1auFuLo/55eQkSsPsv7EeST1Nc+
         RrOvKJdrmW4QWFGX7z0L6QUiAENYhFaGgnoo0gnpc9LXMN3yAEiXzcw6fUoVp1vUzJCk
         BhPDY3gtYFHqlrN6QOQN6Fvp+NtI4cdcc08geIF3SbampUoIt7SP6PJkF9eQUqoKZh3Q
         tPbO6HKsZlIaEPItKYb1LQUvul7WM9GPa27Bm2WldrtaOfovnC5ZN/EMdgdllhCEWRvN
         50Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUUj6VULFm1MuyHfI6tu2Jfgnx0o4wxa6+R1xATaTPAkd4Wfa4qsPJ9aRG3ujbMG9DVlX1xWy0+EuipNqJnevES@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd0v7cl+DsLozMVnYOo7fKBxQRVVgMD1Oh7oOtdkriYeALvt1s
	6Fzbkurb/x7FHBk4nbWWkx+0v0riNt+s7J+u5+ifwTz5z78LyCTPJ2MaBBsh2mwpdz6xmfwHSjL
	AZQtAsCgxcrnnh0yPX9N02m3RYtwA3xFL9tTY3Iwm3OvKj24oVO814tC8TdziR9QSrlVRPNJxHx
	iGdw==
X-Gm-Gg: ATEYQzxvwA+4d5qlBRouDpAZGWEVDlDXbsyfwkMDBsn6+5b4TX9FCfTzmM5iABc/wbx
	t7o2BsRK0/r2x7ztmk1RK8YUNRxXU//aze7O34X5n6Xxakkl0/R7IiBKscPhm29k+IuOZIgaIcR
	auEmgfS5r+2lcxIfOqK4l3mE7qVanf2JlcsyyQEJTU2AbbnqvAs0soTHjoawl3IhYQN0qlFbnnu
	J3bDGqxJNHFC2UcIG6vLZk0sS+PGc+nMhL0Q4m21zVIW9q/cUrZEWrJNKtMckTG1M7OHxQf6rnh
	fwmGn5Jlws61JEuoGbWyydaZPmmYp5m0H+AY6SSJNILhghCJTcPUdrxkOkPkbS4lVUotyJ1MNgq
	24uPj8OAfylKloM0euDjUtvA2ef/NOVo1EGJ+4g2TtS/eJpDEGTxCUv+psw==
X-Received: by 2002:a17:90b:1d51:b0:359:8d2e:6f79 with SMTP id 98e67ed59e1d1-359a69e4ceamr2610465a91.14.1772647483924;
        Wed, 04 Mar 2026 10:04:43 -0800 (PST)
X-Received: by 2002:a17:90b:1d51:b0:359:8d2e:6f79 with SMTP id 98e67ed59e1d1-359a69e4ceamr2610419a91.14.1772647483396;
        Wed, 04 Mar 2026 10:04:43 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359a8f22062sm1080606a91.1.2026.03.04.10.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:04:42 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 04 Mar 2026 23:33:09 +0530
Subject: [PATCH v20 09/10] arm64: dts: qcom: monaco: Add psci reboot-modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-arm-psci-system_reset2-vendor-reboots-v20-9-cf7d346b8372@oss.qualcomm.com>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
In-Reply-To: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772647398; l=1066;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Padqu+PvS9ADlI3cueabj4f23ybpQ0vF53i2fpuD/lw=;
 b=qRU8pwtXB6YToHNyc5AW6gfYjLZkEIrjxg1hQxmiDTVXZEto3zgV6elR626vGLihxk595WpII
 cfyi/8WtGvtA1BOjl70TJ/Ijiozz76laP0WmYq4RdUc2G/RypRpHdNU
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=bdlmkePB c=1 sm=1 tr=0 ts=69a8743c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=_PJuSq69R3b4qrRYkJAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: oOi_tVAxQxwLXUqjFUcpSkVSAr9gGYSZ
X-Proofpoint-ORIG-GUID: oOi_tVAxQxwLXUqjFUcpSkVSAr9gGYSZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE0NyBTYWx0ZWRfX4yY5wxumpMX4
 K2/dyb4stt85IEt3Tlnira/g4XfaZO+gDl8P4HPI+afL7bA/MgjqzTxD2PfzG59jIbkf+1uHIsG
 1fz9u3epEdNLT8rGSzJsZ4J9FEoJs/G/Hbcvzx11biq9uH0uIZUEmHWBnayvbpXEjy3t1NvCDo/
 hRNdRUNGfr31/LtT1AW585b7nIVzMkgvl4KrJFYGiHhrz10bgWoD7v1HW90+VPN59a9qy/imdhh
 2qwHmqPPSpnaB4jLYCzo8KtVWQ6QLDZXt0r1h1syT1Y8vQBmqYcFT+0styQn1asPrLnZDNuyXHV
 whQXezM6DGUgDICwGbu1O47jUuUln6sl0++otSZR24VdkMFhXlrlVppE52va92G3XWxQSHZYV13
 v76WxrQ/mPQM9LHNKiLHsk+FTZZL7KC4XTZcsF667w73GX68+fmInmiDdcOOLwKe2v9xGmCAtPA
 AuIRd1OBtBQpUoZwbNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_180446_740045_B56CA3F2 
X-CRM114-Status: GOOD (  15.38  )
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
index 5d2df4305d1c1c450c7be53614da9d8c08123e66..a3542a300a27715eecc46da9b2a82ac7e76e6232 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -740,6 +740,11 @@ system_pd: power-domain-system {
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


