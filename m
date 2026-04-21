Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2C2F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l4XZv915+OD8fVF5ebPBbORlRX1ourZsFmrSJpVSODU=; b=4v+T409VYGkTGS
	MddWQMobT1CjaXfoxEUmXuUiYQzi2t+Z6dw/UqyXUMzzpO4ELkGyJLKc5PnHAMTgEQokN7nwSm9A+
	gU7lfyo0uDmOsEqAeWviuUUVlxj86SwuD7hxc5sDjvA2NNy/UkFfZ7H/Htszs2PeMSKiVtufL9ZEg
	iBgO7AWA/qBEsjpn2byHO/nal72fN++Arb4XxtY23VCMGREJC+EcnHMyDBMwy0P6IxttAjgENK2sM
	53DTn1f8VOJvf7fYSgGk+OjPi+kUiSlUOYKK7BjhOt8o7ZJAkRI+Mi1insofl1GINIzv79Q5XRxQQ
	d7R2S74OfLj5vylTCzKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mY-00000008TgE-1GdS;
	Tue, 21 Apr 2026 10:56:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mS-00000008Te2-2sx9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:38 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L9XN1v3164516
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l4XZv915+OD8fVF5ebPBbO
	RlRX1ourZsFmrSJpVSODU=; b=bpO3vNKry4FXrSO5meDczYqrxOQQ7jRu3jdIju
	f6xbW92P/sqZaJlwbjPZhhNcqMOHlT24SmS94tSTuMVvWzxc5OhMQAbcL/Jell8X
	ArC7qp1r/pHLXdkA4trcXTxbK7kzqp19zzhOdYC9H6GEUoP/ipKz9o9Zq5zsx3A2
	xZJRZuq47fWmrlrVtcXI3xiIE2MPga7IwTqGGAlYGGtjGjYR6Liq+ykEWQduOklU
	w6HOroqFZ6qonGK5yJDlzRKzvkIRH20caATpnJ6HbScL7ERnyVVMfyjJgrkoMhh1
	F4hdPh/xMFmvW7kuz6U+coG/cD/tf4A/YZW3x4sL1OanGRYg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp6q8099e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c798fc1a426so777232a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768994; x=1777373794; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4XZv915+OD8fVF5ebPBbORlRX1ourZsFmrSJpVSODU=;
        b=aGr8ZJ2xTlzRpXk6rU3jNBcUPDUajf7rc46o8SC8ONZW2OEWrva6hIvmUrzXgp1SKr
         ZcLxpPrR4CG7a7MmS83KFvXL7yV1nALmvaK51LH4nuXBXl6n0aQk2KzDduuxhJcAjF3s
         WjyI2BSwrSFt0CrxLZYil4GeG8yfpA9TbJv7jBMGKGZ6oWJq4GZsOmyWKNIRPBI4Gt8j
         sAhBzdoD5FgSvtSwG0b4zIkNFuDSuTm31EyxGR3HMSqitYvAIX2/sf4EQJO0ya7AmkXv
         r/keiDQVh1y15wlfhG3Ux/N0+e23zq9nS6PDOfDli58fzUki25AcTrYxPLy5u0gpZ3+7
         +R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768994; x=1777373794;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l4XZv915+OD8fVF5ebPBbORlRX1ourZsFmrSJpVSODU=;
        b=nH9WymXbIBoiv9lIKDvilG6OQnOs1ju/iuygiN14+4AlGhlFzKJCCWat28aZ9NDRWC
         bro4UQZxciJHt0aXqWcGubDngG9goqsKNWdvfPCpTXDUiD0KRdXR+naICtZWnnqZVo7H
         0nj2EjddCmZT7tQ6WP9Pg7cpUaCrmNw2/OHl2vyE2bEA+DSpM9p1RRaebxcREmAUwY4C
         kz8HuOM6JHqRIpdxqH0RBI0X6YYhtxyr5EGHt/zkkKKwXCAL/GCZPdTwpuJGb+I3TBgv
         vu+zJqtOnkmFTsLR+TmI4vQ9y9vEMDxkbJ6jl2e3WgpQgROlJdb38o7DUtE0URYEtKU5
         EsrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9TcpiF8UIUo18gjnnMAcwF3v9+R1zfW3XnA5yaBsKZ29DuuAI5UAXSVqM91wFzKKOnqxrTDrAvQzU1++v5M3UX@lists.infradead.org
X-Gm-Message-State: AOJu0YyPJVT4KxR66PzDo4KdfvVPKrO8XBxwbGqZrc3pLjStNui1pvJL
	5LOunCoCjIq/kfEkZgA5nBrLV9CtTWVWTQ+xU8WOYACU2EDY+Rvk1E3d/e9+tLqDiIvFWVMEsWH
	P4P1V9QwvRkIcI7XbKIh1hjqN7bva7OBsbEwDPUj9dFLQrVLIBBegX+nNhWOgzz5KSP+4YJzSN3
	0vDTNZcYgf+Q==
X-Gm-Gg: AeBDievg1af2jsyOY6PIE6UE2a2Tau6yWluYAhRQL374wHExlAbkbsJ4LZ2SWzE/gA+
	dis9DS/oZTJXKAVm13KzamdrKfaxo2OmLjuNKGvPLhNAp6zSgNVWIWAnD/3ASk3fNF4yZ8DfTVk
	xG/OU9YHmredIyqx8HAxWsDNRZGMKJCqknix9SzUWNxwTUdmRy0aqVERN8B4xdNe88gvOU/w5aN
	aekfj2sdvOXJr5kbs+OAyKWuQL5LGKfmN3fWsM/Vx/JoSLn++9TBWMSdeJlpOeyEtCv5XWwrft9
	NsdIkJeqkluxIj2aPEftMKM37kQlQw1mC+RD5E3MI76nUWXKwxZglhgITInhD4KCK38MMycvN4i
	mIkCd0PQn2bYE3yqg0y3u6aF6JFAGn9/sYfsMxeKZhHpgM41TWv2Fx37nfIAUPW3YafWIkj9muQ
	D9LPDvaVjyvFsQoBlUZ00=
X-Received: by 2002:a05:6a00:2191:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-82f8c9ed41emr18208322b3a.49.1776768993898;
        Tue, 21 Apr 2026 03:56:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:2191:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-82f8c9ed41emr18207760b3a.49.1776768982524;
        Tue, 21 Apr 2026 03:56:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:22 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v17 0/7] coresight: ctcu: Enable byte-cntr function for TMC
 ETR
Date: Tue, 21 Apr 2026 18:55:49 +0800
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALdX52kC/43NwQ7CIAwG4FcxnK2hsAHz5HsYD4wVJdGhsC0as
 3cXPXlQ46XJ/6f9emeZUqDM1os7SzSFHGJfAurlgrmD7fcEoSsFE1woLnkD1Nv2SNDeBgLXDwl
 8TOAGN4L3RpHCxrTas3J/TuTD9YVvdyUfQh5iur1+TVg963/YsgocHDdGSKqtIbWJOa8uoz26e
 DqtymBPfsL6jUT5k6wLiVprjxV1EptvpHojxW9SFVLbCmUnEFvTfSDneX4A/nD5l3IBAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=12973;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Vx/6zMoZ67at0R9rGbckd2Bbimfp8nN6trPQFzaFmoQ=;
 b=6xuUf+QMgfun9VRU2HhezJR3AkLNWTOJsKHg1GmazRnm8PphCxFshax4jgP+F998I171EFmzK
 WrlBdSdXhmoBCHQqq6w4w0UWd3TbJgPqPxsLS63SsNWxDyh9gsHLUzC
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX8p7kpw8Fagjp
 INbCqtLRoZpXSuoYLbG9+5xCJkuoYxJA/NhtqTTslV70wI0UrMmjNgCjG7ZfXOKindbfejtRI2/
 jERWzfJoXtuG8Xs8kl7X5jpT61xPWJzgWC3TjVuApjhTjrxqncoXzfWkXgmEaCpc42usb9QWNyR
 MfWBHrc9IeOA92VOG2NwtnBlqGKgmJa34UCwjat/5xvnNrurORbAt6tvfNEqeBVfZLSFiiIuzmU
 l2Wj/AS01dkf9R9qw53j7EctM4kWHJFYYnrsOr+UZIcioFjUG14Opm9JKE2fg3nAHdu0IJPsyPW
 BgdJ283z6kWVA5pEQfWJa91kzBKxPXaLqzge/R84b3jkuRlwhxhKI5ORYIlAOUfCqGCv8in6rLt
 D/cir7OqO8W2A2IFqKrA5uOpXz4EB2UNbI6pglGW1ce34ufSkYffjdcUcYvgzDDQRhkMDOfXRjJ
 RJqH86Qhow21km6Aqtg==
X-Proofpoint-ORIG-GUID: pR4Bz5AshKYTWn2X48xQJKtIqW8dE6HI
X-Authority-Analysis: v=2.4 cv=eOYjSnp1 c=1 sm=1 tr=0 ts=69e757e3 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=7CQSdrXTAAAA:8
 a=KKAkSRfTAAAA:8 a=QyXUC8HyAAAA:8 a=JfrnYn6hAAAA:8 a=sQzbMOkpazfUrT1JE7AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=cvBusfyB2V15izCimMoJ:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: pR4Bz5AshKYTWn2X48xQJKtIqW8dE6HI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035636_847529_FB4FD5D7 
X-CRM114-Status: GOOD (  22.15  )
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

The byte-cntr function provided by the CTCU device is used to count the
trace data entering the ETR. An interrupt is triggered if the data size
exceeds the threshold set in the BYTECNTRVAL register. The interrupt
handler counts the number of triggered interruptions.

Based on this concept, the irq_cnt can be used to determine whether
the etr_buf is full. The ETR device will be disabled when the active
etr_buf is nearly full or a timeout occurs. The nearly full buffer will
be switched to background after synced. A new buffer will be picked from
the etr_buf_list, then restart the ETR device.

The byte-cntr reading functions can access data from the synced and
deactivated buffer, transferring trace data from the etr_buf to userspace
without stopping the ETR device.

The byte-cntr read operation has integrated with the file node tmc_etr,
for example:
/dev/tmc_etr0
/dev/tmc_etr1

There are two scenarios for the tmc_etr file node with byte-cntr function:
1. BYTECNTRVAL register is configured and byte-cntr is enabled -> byte-cntr read
2. BYTECNTRVAL register is reset or byte-cntr is disabled -> original behavior

Shell commands to enable byte-cntr reading for etr0:
echo 1 > /sys/bus/coresight/devices/ctcu0/irq_enabled0
echo 1 > /sys/bus/coresight/devices/tmc_etr0/enable_sink
echo 1 > /sys/bus/coresight/devices/etm0/enable_source
cat /dev/tmc_etr0

Reset the BYTECNTR register for etr0:
echo 0 > /sys/bus/coresight/devices/ctcu0/irq_enabled0

Test Report:
=== Module setup ===
  CONFIG_CORESIGHT=y (built-in, no action needed)
  CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y (built-in, no action needed)
  coresight-ctcu: not loaded, running modprobe...
  coresight-ctcu: loaded
CTCU byte-cntr test
  CTCU   : ctcu0
  ETR    : tmc_etr0
  source : etm0
  chardev: /dev/tmc_etr0
  module : coresight-ctcu

=== T1: device presence ===
  PASS: CTCU device found: ctcu0
  PASS: TMC ETR device found: tmc_etr0

=== T2: irq_enabled sysfs attributes ===
  PASS: irq_enabled0 attribute exists
  PASS: irq_enabled0 readable, value=0
  PASS: irq_enabled1 attribute exists
  PASS: irq_enabled1 readable, value=0

=== T3: irq_enabled write/read round-trip ===
  PASS: irq_enabled0: write 1 -> read back 1
  PASS: irq_enabled0: write 0 -> read back 0
  PASS: irq_enabled1: write 1 -> read back 1
  PASS: irq_enabled1: write 0 -> read back 0

=== T4: byte-cntr read with active trace ===
  [step] cleanup: byte_cntr_disable
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] byte_cntr_enable
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  [step] cat /dev/tmc_etr0 > /tmp/tmc_etr0.bin &
  [step] sleep 5 (accumulate trace data)
  [step] byte_cntr_disable
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  PASS: T4: cat exited naturally after source disabled (EOF delivered)
  PASS: byte-cntr read returned 35333968 bytes -> /tmp/tmc_etr0.bin
  PASS: no kernel warnings/oops after: byte-cntr read

=== T5: EBUSY on concurrent open while byte-cntr reading ===
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  PASS: T5: second open correctly refused (EBUSY)
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  PASS: no kernel warnings/oops after: concurrent open test

=== T6: rmmod while byte-cntr read is active ===
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done
  [step] set irq_enabled0 = 1
  [step] set buffer_size = 0x2000000
  [step] enable_sink = 1 (tmc_etr0)
  [step] enable_source = 1 (etm0)
  [step] byte_cntr_enable done
  PASS: T6: rmmod returned non-zero (device busy), no panic
  PASS: no kernel warnings/oops after: rmmod while reading
  [step] enable_source = 0 (etm0)
  [step] enable_sink = 0 (tmc_etr0)
  [step] set irq_enabled0 = 0
  [step] byte_cntr_disable done

=== T7: insmod after rmmod and re-probe sanity ===
  [step] module still loaded after T6, retrying rmmod
  PASS: T7: modprobe coresight-ctcu succeeded
  PASS: T7: CTCU device reappeared: ctcu0
  PASS: no kernel warnings/oops after: insmod / re-probe

===================================
===================================

Results: PASS=20  FAIL=0  SKIP=0
---
Changes in v17:
1. fix race issue during allocat buffer.
2. fix user after free issue observed when remove module.
- Link to v16: https://lore.kernel.org/r/20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com

Changes in v16:
1. Remove lock/unlock processes in patch "coresight: tmc: add create/clean
   functions for etr_buf_list" because we are allocating/freeing memory.
- Link to v15: https://lore.kernel.org/r/20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com

Changes in v15:
1. add lockdep_assert_held in patch "coresight: tmc: add create/clean
   functions for etr_buf_list"
2. optimize tmc_clean_etr_buf_list function
3. optimize the patch "enable byte-cntr for TMC ETR devices" according
   to Suzuki's comments
   - call byte_cntr_sysfs_ops from etr_sysfs_ops
   - optimize the lock usage in all functions
   - remove the buf_node parameter in etr_drvdata, move it to
     byte_cntr_data
   - move the tmc_reset_sysfs_buf function to tmc-etr.c
   - add a read flag to struct etr_buf_node to allow updating pos while
     traversing etr_buf_list during data reads.
Link to v14: https://lore.kernel.org/r/20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com

Changes in V14:
1. Drop the patch: integrate byte-cntr's sysfs_ops with tmc sysfs file_ops
2. Replace tmc_sysfs_ops with byte_cntr_sysfs_ops in byte_cntr_start
   function and restore etr_sysfs_ops in byte_cntr_unprepare function.
3. Remove redundant checks in byte‑cntr functions.
Link to V13: https://lore.kernel.org/all/20260223-enable-byte-cntr-for-ctcu-v13-0-9cb44178b250@oss.qualcomm.com/

Changes in v13:
1. initilize the byte_cntr_data->raw_spin_lock before using.
2. replace kzalloc with kzalloc_obj.
Link to V12: https://lore.kernel.org/all/20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com/

Changes in v12:
1. Add a new function for retrieving the CTCU's coresight_dev instead of
   refactor the existing function.
Link to v11: https://lore.kernel.org/r/20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com

Changes in v11:
1. Correct the description in patch1 for the function coresight_get_in_port.
2. Renaming the sysfs_ops to tmc_sysfs_ops per Suzuki's suggestion.
Link to v10: https://lore.kernel.org/r/20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com

Changes in v10:
1. fix a free memory issue that is reported by robot for patch 2.
Link to v9: https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com

Changes in v9:
1. Drop the patch: add a new API to retrieve the helper device
2. Add a new patch to refactor the tmc_etr_get_catu_device function,
   making it generic to support all types of helper devices associated with ETR.
3. Optimizing the code for creating irq_threshold sysfs node.
4. Remove interrupt-name property and obtain the IRQ based on the
   in-port number.
Link to v8: https://lore.kernel.org/r/20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com

Changes in V8:
1. Optimizing the patch 1 and patch 2 according to Suzuki's comments.
2. Combine the patch 3 and patch 4 together.
3. Rename the interrupt-name to prevent confusion, for example:etr0->etrirq0.
Link to V7 - https://lore.kernel.org/all/20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com/

Changes in V7:
1. rebased on tag next-20251010
2. updated info for sysfs node document
Link to V6 - https://lore.kernel.org/all/20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com/

Changes in V6:
1. rebased on next-20250905.
2. fixed the issue that the dtsi file has re-named from sa8775p.dtsi to
   lemans.dtsi.
3. fixed some minor issues about comments.
Link to V5 - https://lore.kernel.org/all/20250812083731.549-1-jie.gan@oss.qualcomm.com/

Changes in V5:
1. Add Mike's reviewed-by tag for patchset 1,2,5.
2. Remove the function pointer added to helper_ops according to Mike's
   comment, it also results the patchset has been removed.
3. Optimizing the paired create/clean functions for etr_buf_list.
4. Remove the unneeded parameter "reading" from the etr_buf_node.
Link to V4 - https://lore.kernel.org/all/20250725100806.1157-1-jie.gan@oss.qualcomm.com/

Changes in V4:
1. Rename the function to coresight_get_in_port_dest regarding to Mike's
comment (patch 1/10).
2. Add lock to protect the connections regarding to Mike's comment
(patch 2/10).
3. Move all byte-cntr functions to coresight-ctcu-byte-cntr file.
4. Add tmc_read_ops to wrap all read operations for TMC device.
5. Add a function in helper_ops to check whether the byte-cntr is
enabkled.
6. Call byte-cntr's read_ops if byte-cntr is enabled when reading data
from the sysfs node.
Link to V3 resend - https://lore.kernel.org/all/20250714063109.591-1-jie.gan@oss.qualcomm.com/

Changes in V3 resend:
1. rebased on next-20250711.
Link to V3 - https://lore.kernel.org/all/20250624060438.7469-1-jie.gan@oss.qualcomm.com/

Changes in V3:
1. The previous solution has been deprecated.
2. Add a etr_buf_list to manage allcated etr buffers.
3. Add a logic to switch buffer for ETR.
4. Add read functions to read trace data from synced etr buffer.
Link to V2 - https://lore.kernel.org/all/20250410013330.3609482-1-jie.gan@oss.qualcomm.com/

Changes in V2:
1. Removed the independent file node /dev/byte_cntr.
2. Integrated the byte-cntr's file operations with current ETR file
   node.
3. Optimized the driver code of the CTCU that associated with byte-cntr.
4. Add kernel document for the export API tmc_etr_get_rwp_offset.
5. Optimized the way to read the rwp_offset according to Mike's
   suggestion.
6. Removed the dependency of the dts patch.
Link to V1 - https://lore.kernel.org/all/20250310090407.2069489-1-quic_jiegan@quicinc.com/

To: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>
To: James Clark <james.clark@linaro.org>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

---
Jie Gan (7):
      coresight: core: refactor ctcu_get_active_port and make it generic
      coresight: tmc: add create/clean functions for etr_buf_list
      coresight: tmc: introduce tmc_sysfs_ops to wrap sysfs read operations
      coresight: etr: add a new function to retrieve the CTCU device
      dt-bindings: arm: add an interrupt property for Coresight CTCU
      coresight: ctcu: enable byte-cntr for TMC ETR devices
      arm64: dts: qcom: lemans: add interrupts to CTCU device

 .../ABI/testing/sysfs-bus-coresight-devices-ctcu   |   9 +
 .../bindings/arm/qcom,coresight-ctcu.yaml          |  10 +
 arch/arm64/boot/dts/qcom/lemans.dtsi               |   3 +
 drivers/hwtracing/coresight/Makefile               |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |  24 ++
 .../hwtracing/coresight/coresight-ctcu-byte-cntr.c | 298 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 143 ++++++++--
 drivers/hwtracing/coresight/coresight-ctcu.h       |  79 +++++-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  55 ++--
 drivers/hwtracing/coresight/coresight-tmc-etr.c    | 237 +++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h        |  42 +++
 12 files changed, 832 insertions(+), 72 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260309-enable-byte-cntr-for-ctcu-ff86e6198b7f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


