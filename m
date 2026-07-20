Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01171C44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 08:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsnnJBE7dAk=; b=OcFWgMFO91ODlx9TGlDaNKrhhL
	QY3yuV+N7D93lE4FI7Z/ZO5Z83FI86FuUswTllGG7m4Ym68u/uulsv4eigy8CvOCZVOJwSHQhKvr5
	AIBrZ2ztbLyhyC+tzeS5abSMjucEpjgcYa/tHW53VtXTecRjoLBxFjtXS3dmG073p4lOQ8F2oypuE
	wdV/dZYkRbgn6/809hBLGURrrJqedJ6J4WNA3EQZygojDYB9gKqYIBjlib2gj458GQwdIb9Szdrts
	AAxsgo3nehy3GBUfMREm8z+WdAUQEd09e2QCG9A7vSY8jVOks9vMqiSiZ+miZ1V20f4Bzm0gYRFvP
	tDC/w0uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEO-00000006B1W-075q;
	Mon, 20 Jul 2026 08:20:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wljEL-00000006B12-1Q08
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 08:20:06 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RiaL1713657
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsn
	nJBE7dAk=; b=N9SMOOoj2Mm0hUmIxeJ329kLUXKUlRm6qCARhXiWTSWz8BCGbRH
	5VlukN1qdTpTyTaUs1NreDG9b9YtAxC+6iis7af4bWIocsS2voFCHYCGvziyhp2A
	yxac23Siy/KAYuKnsbX14PwJ8vw6JWcNVihwll3VNdZHoVs2kP7Kiqn19vfFEL/+
	iSiNv6Tf+idp73fZxyUEqukK0QoOtWGFiVKATveIC46FQ31LYVUAqIrM4uBEViNy
	qMJNDA0K3lZ4D8FuIFzi9gwfkmkoyMzgIXYcJwHaBvBsiMVE23YMM/49QmWkCXdO
	3NGNyQbreWAUGdAjzse9v0m7JdAbXslMToQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc56eg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 08:20:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811d5ecf66so2974583a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 01:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535602; x=1785140402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsnnJBE7dAk=;
        b=dAMOMH9dtsjqFoEPysdihTmHq9uEexncmP0iq/IBG3UW1B71bLDMrd/yUbFyUAeOnY
         2B84dHa/+5rneMT+BmfHjUGbU5nuN/gcFjQ9+pVmh1cYQEI87E/6UFOpf3QK5PP8RHd/
         Lg/mZp6qo6UJkEvdgoFeqp82ub9bL99tRNfiWCPGuwqXbfmUFy+KNKMvXtpOJAf4+2aU
         VRShH1dJOZ1jXuou/0ysDlu5y4loYDNBgQptN6QUYoRNEUqoNrgPfv2I34hI28tXrTdi
         d/3iYHuouawHpucK21ZXReJRAunhGxqrs9hw/cOGA37FJOYVdS/bCUjnK1068NR8HpzU
         eOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535602; x=1785140402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oywFt15nTUechSp1jVDxMiDTZuPB3zyGHsnnJBE7dAk=;
        b=QyvsLX+GRdFSOlYcE66Ow8agh2U3j30Jq86G2/ldbr2/VMb1ZaS6bZGvAX3BOgPTT8
         jY07QwTVaFdYyoRqvuxORCaisvCw7q0fSVC5mYkGVL+nFR3iEMNMuF+oSLCOtLELhkbl
         QQMNYyMsqxdYLxn4tkvHb5qs1OlkThu+5yrO1wxWXzQQLfl6gIKVy1B53/1ucJFKh5L7
         BHn3OUg8TBABbkfoG2z/9tF1LaOV/rkLu25tfkf1TGTKK4tJL0RfIGRKc20t38U5WfGz
         F02O60aFc/OxqCHCBavwpQhxy1qYELzQ3c6Hd2XE6Geq7VwPsyPeuXdM+CowL55eIKdM
         KutA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1mGEbx9uxuIDj8wBb2+G0bPfD15i1691b26g8ohi5iCb/tkK0wkgLop1P/8MyZahQYNEcWDlPcnMhNtHjOnYk@lists.infradead.org
X-Gm-Message-State: AOJu0YyLGetlzCpKxJJ5fuSbQ+LRmiOpls5JDYMo+doB6boFZ4LeICJ2
	sLWDErYFYf9s2Fk0WhxM5Rkb32M2ufmSD6eqtRzLFd88DV84iQM0R6z+R0TfbrXCvanA/dbNp9j
	P0oGVHh+ZbvYJqfvFVKXSw8cuwVIiIYLuJwX+/r7tBlJoIjjkzHAJYQFDfOJ+Izx+lJCEPVu8XA
	TVyA==
X-Gm-Gg: AfdE7ckC0mYgrhfV6j+4yxBAQaRtXJAiYaNpvk5GV4yVXjseDDE9ojQUeQMoblyxWrL
	Q7I+pn71lH9buNB6lQObzCr/SyXHhh+CSyVPQ5qVkrWfxj0SOtk4UlVBW/Z1vhwPBp9T2yNhGRt
	G5MII2cIcNtTRr1bSmSvfVZkkM+1iqJH9E6YdCRQur1F/q9xSeof5PJbHoqUyA7XnRYCqirKMa/
	SJEIKE1LlHOqycR8xreh3CRKAFff9PzH5+QmqdB3Cs6XlG4PaQAkxovnctIvspPr4IeA0vHaMYZ
	aGyxb2bzIdMOZ+WDt6J4GeGUlsnRdJ1eluIgJdTnNs1jHOWCXPkHJnU5zezJoIg/uAyIymx9rKX
	AC6WG2wg4/DzSuQOZVRNH11YqZSud0pQ=
X-Received: by 2002:a17:90b:4c0f:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38e89ec53c6mr600789a91.7.1784535602416;
        Mon, 20 Jul 2026 01:20:02 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:38e:89ec:5254 with SMTP id 98e67ed59e1d1-38e89ec53c6mr600761a91.7.1784535601850;
        Mon, 20 Jul 2026 01:20:01 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39e0531asm7233688a91.5.2026.07.20.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:20:01 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ruidong Tian <tianruidong@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        faruque.ansari@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com
Subject: [PATCH v2 0/4] arm: ras: Add DT frontend support for ARM RAS
Date: Mon, 20 Jul 2026 13:49:50 +0530
Message-Id: <20260720081954.1858180-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX+nFTPr887HsH
 NKDXQCFY2fpcqi9a/XPEcWesVLIujjpKO+UVFJN23/P/MxgOgY9KXxgNbmd182TyRgKMRwmqneN
 dWNq/d4satgXT4v6ozFPwCuMMG0KRto=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MCBTYWx0ZWRfX2H22GRE+v+VN
 p+fbaU/bTMHK29/LxuvABlk6X9/KEQSOuWg/B7jh2GSB1tkv4ql5ZWmHHRvzV/X9WWBgqozNDsB
 P9KtttUKzZh3tTpw0aL2kIvkQJLVkFTYgziAQcMjz/cOpHib8eSIqkEMqlmYXZ/jwGe057tNBnp
 CN5qgw7oFOdJaTx2L+lABZW9RffD6fDMZ/dj0De1PBZwXdZTnoRmEVLouif0M9uTPYsDwPRymZw
 OGMNXGwrUBr2PkSia8KMvqzcQep7UvceZguox+g612B6DnboSXov6XhruvkH/gipR7I1jYPDpuP
 X9ApfA1s65CxCRpCWRRwHvq8PJ907NZnM9PJRUOiIK4gYtdL/fmDkxn/oMOHj5da+TcZuSgoPo1
 hbpeWiNT3APgZD8slGpYX6fT+FnnIyEGdP+duAxRpVGoEC0uxC2EU9FysEyJH3c/qwp4yqjs1/i
 wifmdjc5o+m6XIkAJ+Q==
X-Proofpoint-ORIG-GUID: Ll3sFkPx_lD7I00U6jeEPf2oZCoQ9mzB
X-Proofpoint-GUID: Ll3sFkPx_lD7I00U6jeEPf2oZCoQ9mzB
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5dda33 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=SRrdq9N9AAAA:8 a=tHe252CdNFHeNeq8tAEA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_012005_521778_52F3BF98 
X-CRM114-Status: GOOD (  20.21  )
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

This series adds Device Tree support for the ARM64 RAS driver
introduced by Ruidong Tian [1]. The existing driver supports ACPI-based
platforms via the AEST table, this series extends it to DT-based
platforms without any changes to the core driver.

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

     CONFIG_ARM64_RAS_EXTN=y
     CONFIG_RAS=y
     CONFIG_ACPI_AEST=y
     CONFIG_ARM64_RAS_DRIVER=y
     CONFIG_ARM64_RAS_DT=y

3. Add the following DT node to your virt machine DTB.  The QEMU
   fork maps GIC error source at 0x017a00000 (SPI 0x0d).

   ras-gic-dist@17a00000 {
       compatible = "arm,ras-gic";
       reg = <0x0 0x17a00000 0x0 0x10000>;
       reg-names = "err-group";
       arm,group-format = <ARM_RAS_GROUP_4K>;
       arm,num-records = <1>;
       arm,record-impl = /bits/ 64 <0x1>;
       arm,status-reporting = /bits/ 64 <0x0>;
       arm,gic-ref = <&gic>;
       interrupts = <GIC_SPI 0x0d 0x04>;
       interrupt-names = "fhi";
   };

4. Boot QEMU with acpi=off:

     ./qemu-system-aarch64 \
       -machine virt,accel=tcg,gic-version=3 \
       -cpu cortex-a57 -m 2G -smp 4 \
       -kernel Image -dtb virt-aest.dtb \
       -append "console=ttyAMA0 acpi=off earlycon" \
       -nographic

5. Verify probe:

     dmesg | grep "DT RAS"
     # Expected: DT RAS: registered 1 RAS error source(s) from DT
     ls /sys/kernel/debug/aest/


6. Inject a CE error via the QEMU MMIO fault injection registers.
   The QEMU device accepts 64-bit accesses only (use devmem with
   the 64-bit width flag):

   devmem 0x090e0808 64 0x40000001

   This triggers QEMU's error_record_inj_write() which sets
   ERR<n>STATUS.V=1 and asserts the IRQ.  The kernel driver's
   aest_irq_func() fires, reads the status, and logs:

   arm64_ras: {2}[Hardware Error]: Hardware error from AEST gic.90e0000
   arm64_ras: {2}[Hardware Error]: Error from GIC type 0x0 instance 0x8005
   arm64_ras: {2}[Hardware Error]: ERR0FR: 0x48a5
   arm64_ras: {2}[Hardware Error]: ERR0CTRL: 0x108
   arm64_ras: {2}[Hardware Error]: ERR0STATUS: 0x40000001

Testing
-------
- Validated Processor error nodes/sources for L1-L2 and L3 caches error
  on Qualcomm's lemans-evk and monaco-evk boards with DT boot.
- Validated CE and UE injection via debugfs soft_inject.
- Validated GIC and SMMU error sources on QEMU.

[1] https://lore.kernel.org/lkml/20260122094656.73399-1-tianruidong@linux.alibaba.com/
[2] https://github.com/winterddd/qemu/tree/error_record

---
Changes in v2:
  - Rebased on top of Ruidong Tian's v7 RAS driver series and reworked
    the DT frontend to match the new driver architecture.
  - Moved RAS error source nodes to the DT root, removed the arm,aest
    container node as suggested by Rob Herring.
  - Dropped arm,processor-flags and arm,resource-type properties, these
    are now inferred from the interrupt type and cache phandle
    respectively.
  - Renamed compatible strings from arm,aest-* to arm,ras-* and the
    dt-bindings header from aest.h to arm-ras.h to avoid ACPI terminology
    in DT bindings.
---
Umang Chheda (4):
  dt-bindings: arm: ras: Introduce bindings for ARM RAS error sources
  arm64: ras: Add Device Tree frontend
  arm64: dts: qcom: monaco: add RAS error source nodes
  arm64: dts: qcom: lemans: add RAS error source nodes

 .../bindings/arm/arm,ras-error-source.yaml    | 330 +++++++++++++++
 arch/arm64/boot/dts/qcom/lemans.dtsi          |  30 ++
 arch/arm64/boot/dts/qcom/monaco.dtsi          |  30 ++
 drivers/ras/arm64/Kconfig                     |  25 +-
 drivers/ras/arm64/Makefile                    |   2 +
 drivers/ras/arm64/ras-of.c                    | 383 ++++++++++++++++++
 include/dt-bindings/arm/arm-ras.h             |  11 +
 7 files changed, 806 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/arm,ras-error-source.yaml
 create mode 100644 drivers/ras/arm64/ras-of.c
 create mode 100644 include/dt-bindings/arm/arm-ras.h

--
2.34.1


