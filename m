Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CD6CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zM9ocX8JV1Cv5KtYnJWxIRFrysMjsRiAcB0T3nYcVGA=; b=rkFi344P65tHwy
	RuvZVNdkwdlmXkJgoxe+frvT4451k+tTU1s8G0ZDJOlkM6feV+APrnJuWlBaxXzfOEKWx0undYp3u
	cNzZkJ3HInPObRhL1LtMQ2SIqMNshlq4dQ5vCAQN+1VLt+pHMBDwwUSM1RvEX8yTU1KqR+QQevMRa
	wE4g7slXsbvZZi50mgQDV5O6mjiLjW2GuUhyACuUjaAU/JJgfG2NaE0LsscXK2rzI+ktyaDo9DZHJ
	Pc9abCSNcyJyJLLgJX8zs8Ao6rD0M/ec26mPebc/jsaKY2QbCTc7nlpICXXtxmiqoLnSHJsk0KVRF
	wZ/z/7EOP7WYt89EeTWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpd-0000000GATZ-2CoO;
	Tue, 05 May 2026 12:24:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpa-0000000GASb-2YR4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:24:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595XBL4028230
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zM9ocX8JV1Cv5KtYnJWxIR
	FrysMjsRiAcB0T3nYcVGA=; b=jfpLIXglJKaJ8OuOjhw51F2WyyUpJkJWM9Kvb2
	O/+ud7JRATo/qtWtNQpz34sRpyifkQjME0B+S0jSvzMtSvIhZVemUKcZe+g5n34L
	5QpP+OG+ysHwtK3a8BjM+Gd25ocJD05gcvUyeV/z82/hkt4HhmDjsU+eoPWGgnrZ
	IUXCO0XLEFgSVKCPDsJ7O7X+RQuwTKWqmtGMN/q+wyxUe4RQHIUvN//2hvr/NCkq
	o64jCIj7ITZ53uwCglWQq8w9r5BGBWwILGNVdgeZWxDuAS2fhhTB8FUwWjK9sAIb
	3thq0PDAjGDCuj08vvCLkLwK0DwuZn5ZHJKcYat+wXjyg3bg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6rrcg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:24:53 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-364c6c8e1b4so1908934a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983892; x=1778588692; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zM9ocX8JV1Cv5KtYnJWxIRFrysMjsRiAcB0T3nYcVGA=;
        b=e7jdayux7HbxreVGuu3xMlQdQVc5ojUHvknk3LDbgdaJxgLMjgxmMBiuNNudlWa1eU
         j5fZKoCg71GybT9WPBkzHPIU6Pr9xo4LguaDAAN3MWVUaB7g6w8awC07qLCPx7mk9OCQ
         Dh+2Svq71wfBnBAiPA27SxygcjXtTi39FiQgQUiV6a2ysJ0QZgEp6FKe9jLZF/hRmI3i
         kso5/61tFKRpPSfT5unUg3gAwNcXKseVAREUK8gMCgRgUTJeTLl2Jq5X2mmZVVo83KCv
         KmE95R9cPmeNilryqUWIE+9auFjRiKUVFDrQU3aGfWreI9Tsz4rFuMmfFia6EBGgC/jG
         3q1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983892; x=1778588692;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zM9ocX8JV1Cv5KtYnJWxIRFrysMjsRiAcB0T3nYcVGA=;
        b=COcU9KFKEJBmtLMRo32G9m8WF6DMIcBlUNrPsuvaKXmCJxj2XgmQ+fU2eEUU55CFUK
         R3YgQ1NBcSMu9FyZMyR30mznOdX+kV9+yhkEn+sQN7OcsZgoI1j6mCHTAUO1rsHu3SiP
         ZEkOqD+NHROoq06SyhTEafYG060u5d2ZD6cZMmBUBve48llQs8aXU16N7cb0SV9xJkWE
         d5HoJlqD+4WME2klRytEKg9K3Yipieb6p8mdCv8wr4aF5qbAb3IoZYFxQX2ElSF/Gtbd
         Bpvblz909mCoppz1UieBd4hey+yKH4GPlXBYpscK4jGyt/R0XRpU0tcbzhrZtghqG4Nd
         ZBxg==
X-Forwarded-Encrypted: i=1; AFNElJ9bbB2Pq6gAIPdVUVMrA6rvmDj/L86V0uTw6bZhQUhYsqlHPnkBBSw/ZA2FRVab/Sl/B6UPf+HjSfahfa4ODYcr@lists.infradead.org
X-Gm-Message-State: AOJu0YxK3h5gG7VE5EMIplZ3eivJnvfs7o7hng8X96IZWwDmoUC2L9CZ
	mLYXQtXTfiIrp3lnXBpydWgwC6nmRhBh0Ft+okHoIs8fRfGYPZf+qUyPQe4CY8XOEy6e1t+6PKu
	GyGjDm7GbubEhcop9pKFqvHqXUqZcv6MmIYEiElm2YFvxR17KhVz+f4Ov8Y8lih7p6bQ6NELpAz
	ycnw==
X-Gm-Gg: AeBDiesuHJpavwBQjlroEC/SIgmuPfpjgxpO1WR2enUz2JrtOeJcgAFjO8jhLR9n4Jm
	AQoWtGL/xYafgKbGgWC3A6cboa01cBz4e81Yk6xldpaSFfoReuHEe/+IdmfrIZcbR1aTDVLZnHm
	drR4x9F4QbSiMNYpNbATDu2uC0CuhU7BVyqqyRLAAPrvwRkizP8xEKBgAcmH6mnWfetukIVUz0/
	GAHzBH0YMuMgI7HhRVXOecsBHtb6EV9xJYcDtCdLfa9wSbvdKcag9L2pwvow+4dCNQBSU1L/XF/
	1xT0K99VlY/72rAQHW3cdJNfMnWDd86t2y+OrJuiBeIvDZtYdYLnW2RVrYaQru3m+B/2OVJKWAN
	hBlmvY9g8sWg1Xygweny2PN90fmtOULulqaFXW26eDHMbmqHIWgyiGCeC69wUte4=
X-Received: by 2002:a17:90b:52:b0:362:bac0:1f64 with SMTP id 98e67ed59e1d1-3650ce6a50emr7493685a91.5.1777983892314;
        Tue, 05 May 2026 05:24:52 -0700 (PDT)
X-Received: by 2002:a17:90b:52:b0:362:bac0:1f64 with SMTP id 98e67ed59e1d1-3650ce6a50emr7493658a91.5.1777983891762;
        Tue, 05 May 2026 05:24:51 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:51 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Subject: [PATCH 0/8] ras: aest: extend AEST support to Device Tree frontend
Date: Tue, 05 May 2026 17:53:44 +0530
Message-Id: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFHh+WkC/y2Nyw6CMBQFf4V0bUkpFlJijP9hWJRywWukxT4MC
 eHfreBykjlnVuLBIXjSZCtx8EGP1iQoThnRD2VGoNgnJpzxigkmqAIfaJ9MDcEBUB/n2bpAVVl
 z3ksGxSBIWs8OBlz253t7sI/dE3T43f0NB++YkuHQyATeqz3ZZJe9WHDO5LkSVV6XpZS0oAGVc
 RF7a8bbC01ccvXCTnUq13a6knbbvpxIDjDUAAAA
X-Change-ID: 20260505-aest-devicetree-support-a3722d90e1f5
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Faruque Ansari <faruque.ansari@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=6582;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=LH5eI4O7oMmhHpNa4d3YP/b842GVrQFgBmayb5QmmyE=;
 b=3ZE7l0BmQXHEBtvIQQlZMIehnv47J5KCIJABD954SCjxyCAKrp5pFlLpT3ju9yY6mq/9BOf1y
 qBvRhcfbsmpA6NqX2NeH2CJc8ykXczxKk/rMp09Odl012fDqBiyDm0r
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfX6cYjOeE+YlWY
 Icji+4nJuX8dgkSZib98kJ7SUYqwukS6ojZhdofoK+j6siaHPkWQ0r+6M6R847yFFMcind7PLbp
 mRoghVAI+yqNHJKaG6p3H2VsFUefw1564DIbc5H3hp4LNWDUrkN5m1wacchQOuyKWQ0DvihpYNm
 vt1lMO3hvgG6b4L/t64lSBxu+DaqYSwY1Ct2dQg90uGYiq9Z9CrJEcGxLWHEele9YvVWf1qyW+/
 MFTGQ5AvItFpHrvd8prVgQrcU2MRvexCSmkpVAdEy2LLCsoOt7smKTLDV9/QOKz7V7IDsqsFBHz
 LS6bmIcBZKGeAKMLChO6BCAvqur8lTc9DlgQ/QQ103ocDAVELSOByVCTKuVP5igvzQBnemyUaYt
 +6Sl71HL3py/7WDZtWV52v9BXgfbBLVAJcGJDDXzjsxQ7f7twhuiJd69a86ARjzsbi4DG0aDRXG
 f3fNBCL6RdUlCRXVMig==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9e195 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=7CQSdrXTAAAA:8
 a=EUspDBNiAAAA:8 a=TsauJuHQFXsEoDOOOOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: oGAMM43wG45AKAW1owGf9WumaMfjNCz_
X-Proofpoint-ORIG-GUID: oGAMM43wG45AKAW1owGf9WumaMfjNCz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052454_661547_38EDEF69 
X-CRM114-Status: GOOD (  17.84  )
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

This series extends Tian Ruidong’s [1] ACPI-based AEST support series
to also cover Device Tree based platforms.

While the existing AEST driver relies on the AEST ACPI table [3], many
embedded Arm platforms use Device Tree exclusively and cannot use the
driver today. This series adds a DT frontend that mirrors the ACPI
implementation and feeds the same core driver, keeping ACPI and DT
paths functionally equivalent.

Along the way, several correctness issues were identified in the core
driver and are fixed in the first part of this series.

The DT frontend is mutually exclusive with ACPI and does not introduce
any DT-specific logic into the core.

How to test with QEMU
--------------------------
Tian Ruidong's QEMU fork [2] emulates AEST MMIO error records on the
virt machine.  To test the DT frontend:

1. Build QEMU:

     git clone https://github.com/winterddd/qemu.git
     cd qemu
     git checkout c5e2d5dec9fd62ba622314c40bff0fbecb4dfb34
     ./configure --target-list=aarch64-softmmu
     make -j$(nproc)

2. Build the kernel with:

     CONFIG_OF_AEST=y
     CONFIG_AEST=y
     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps DRAM error records at 0x090d0000 (SPI 44) and CMN
   vendor records at 0x090e0000 (SPI 45):

     aest {
         compatible = "arm,aest";
         #address-cells = <2>;
         #size-cells = <2>;
         ranges;
         interrupt-parent = <&gic>;

         /* DRAM memory node — MMIO at 0x090d0000, SPI 44 */
         aest-dram0@90d0000 {
             compatible               = "arm,aest-memory";
             arm,interface-type       = <1>;
             arm,group-format         = <0>;
             arm,interface-flags      = <0x22>;
             arm,num-records          = <4>;
             arm,record-impl          = /bits/ 64 <0x0>;
             arm,status-report        = /bits/ 64 <0x0>;
             arm,addr-mode            = /bits/ 64 <0x0>;
             arm,proximity-domain     = <0>;
             reg                      = <0x0 0x090d0000 0x0 0x1000>,
                                        <0x0 0x090d0800 0x0 0x200>,
                                        <0x0 0x090d0e00 0x0 0x100>;
             reg-names                = "errblock", "fault-inject",
                                        "err-group";
             interrupts               = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
             interrupt-names          = "fhi";
         };
	};

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT AEST"
     # Expected: DT AEST: registered 1 AEST error source(s) from DT
     ls /sys/kernel/debug/aest/

6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

     devmem 0x090d0808 64 0x80000040   # CDOFF | CE inject

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

     AEST: {1}[Hardware Error]: Hardware error from AEST memory.90d0000
     AEST: {1}[Hardware Error]: Error from memory at SRAT proximity domain 0x0

Testing
-------
- Validated on Qualcomm's lemans-evk and monaco-evk board with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Tested ACPI path is unaffected: ACPI boot continues to use
  drivers/acpi/arm64/aest.c unchanged.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record 
[3] https://developer.arm.com/documentation/den0085/0200/

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Umang Chheda (8):
      ras: aest: Fix shared processor node handling and error log messages
      ras: aest: Fix CE/UE error counts not incrementing in debugfs
      ras: aest: Skip unimplemented records in debugfs
      ras: aest: Add panic_on_ue module parameter
      dt-bindings: arm: ras: Introduce bindings for ARM AEST
      ras: aest: Add DT frontend for ARM AEST RAS error sources
      arm64: dts: qcom: lemans: add AEST error nodes
      arm64: dts: qcom: monaco: add AEST error nodes

 .../devicetree/bindings/arm/arm,aest.yaml          | 406 +++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  41 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi               |  41 ++
 drivers/ras/aest/Kconfig                           |  15 +-
 drivers/ras/aest/Makefile                          |   2 +
 drivers/ras/aest/aest-core.c                       |  63 +-
 drivers/ras/aest/aest-of.c                         | 673 +++++++++++++++++++++
 drivers/ras/aest/aest-sysfs.c                      |  27 +-
 drivers/ras/aest/aest.h                            |  15 +-
 include/dt-bindings/arm/aest.h                     |  43 ++
 10 files changed, 1310 insertions(+), 16 deletions(-)
---
base-commit: a67b7fd0dd1f6ccf3d128dc2099cdb07af1f6a09
change-id: 20260505-aest-devicetree-support-a3722d90e1f5
prerequisite-message-id: <20260122094656.73399-1-tianruidong@linux.alibaba.com>
prerequisite-patch-id: c5a7c6431c6c1e6351241e694ee053800039d41d
prerequisite-patch-id: 1f6e2c20829eee41a210dd8a538f1e8efcc65872
prerequisite-patch-id: 5556287e3f46c2ed2c0431c53c7782e87bcbd866
prerequisite-patch-id: 2edae0a136d7779b8f686181720e71d044a73311
prerequisite-patch-id: b5190b2844dcb01e72f87a59f3a29548795fdb82
prerequisite-patch-id: 7ba848583708b2ae776a7ce847bb056e3de7f77b
prerequisite-patch-id: 397e5b22802b67942435f4f2968f0b1e210ba0e8
prerequisite-patch-id: 2169f4b65537eecbd0ccbd2ad6b28c64ec44655d
prerequisite-patch-id: b626f85d98747595b3240bc49e6ad9c9dd5c0fa9
prerequisite-patch-id: 1323dfd2eebad2ef6514dbbce58ba08e8859f894
prerequisite-patch-id: 95b826e5e329408437a3ef336c4f45d4d74f82bb
prerequisite-patch-id: b60ff489a5a33c5d5220fa8144af7b7511769cba
prerequisite-patch-id: 43f35a52b8a3d13c938ff08083403c1d3bd0df8b
prerequisite-patch-id: c55d4e9117ca36d3c2cba82d550a618cb82bb745
prerequisite-patch-id: 3885e10f318ae8101d6909b35d92a976cc359e3c
prerequisite-patch-id: 92958cde05577f069c5659018a274bb39cfb6b24

Best regards,
--  
Umang Chheda <umang.chheda@oss.qualcomm.com>


