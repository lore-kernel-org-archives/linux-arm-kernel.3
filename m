Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9BFC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=; b=xmZokVO1m4VA0KhPr1ckkeOCsd
	M++wpbQhIvDrE06MnybbKM0K0FuEWzqT2FWJbb9QjizVV16eNAD2b8C+efDvhfrq+kqi497FUn8S3
	pKkJsr3fmkNSSaY9C05IzgSebEfNGFCyd5gdujIi/JnKU29vJJFFbSTIvEp4pgHqfnZUsx6WG/4Yt
	qGoSE2jvieEcQlAe5VDFFiG/UKWFjCSDkdqgsJtDB0QdMLVoV5fVmAjvoOodCpnOPbiVg9os/tZOy
	RZosi+EfaHGpjagY5Axe9o+MIbdYo6kOwkL/8hWVpls5ci//Z1ISlacTOTBGzViaHun80NXI9YLi7
	NMUZNk7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznQ-00000006TGE-3uLY;
	Mon, 17 Aug 2026 16:02:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvznN-00000006TFJ-20Kr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 16:02:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYkAX3082133
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 16:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdK
	z5MjuJng=; b=PosSKHKv5Wk14m5PM6r3+D+7nUkYhx8jJ8e9DVlT6gx8JSle5Mk
	LGVFcaraXw4j/vw8ezxa4tFzbdA8gxMczUe8gqGTt/D1Dmf+d+eEzd4JfGSgJA9d
	cA+gIMqf/XbtebnBfHODSLV2XS7zsaSFKGemeQuSBEAiFEoWGj/Ww7g2ZIw87VKv
	E9LMKF9lPg8Vd46HHHaw31rpt6mT7ats6te6hFV7CcdDOqiMv1AcJwESaBvVA2My
	iFbp8wt3aF8B8CmMYws57xwSAGd5xtWbrokw4xLi5TDvrSRAp8VlUvoygFGeIB7Y
	yU1g6aV4nVt8+MBtUtiClIwN3gJV+jiGLWw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y779psw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 16:02:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84857446424so6189963b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 09:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786982559; x=1787587359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=CkUmMe6IFDnu7RPdt0B38wUtq8uIoxbhkWNYJXc4oSocPPlZQBh5r8FcfEX+jAT5vb
         tHrrLltZiLMMQ5vgNsOTw3Gd8+ablW3NNlIIO5ppTHNkufSHp00/1lLc2oB6wsNWwxcc
         7OKzDYtjX6jwJ1WcHqR9SL/Hw0WD8ZnWBCtdr3k6gUSC0PP2xl0kJZ/++3wcooyIxb2A
         Fg1Dhnwr+BH0v1WyeyAmhUn5am+NBefB/5LLvx/7FxiIt+esmEmqXTkb9IXzzB4IQ1LZ
         XT6wHRep6Mm0lVE7gBPrynxpl4Je4DMXGlLmFr55vre6JjDc9Zq4c6VLE2xQoSDEIkyB
         Nhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786982559; x=1787587359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1ydbwCOJHJXHm4fbFBs3uDl9Dggh/0McdKz5MjuJng=;
        b=YS7lH1M4Rp6XfABVsqhi630cv08fXT07Nh1/OVdKKUw9h4f+6tMHg6DTmMlU8/fbjV
         5ZZSuH1Lvcyz2qI7NQB7TfMpA9RiJOpQwTREk3QizszEOS6ioV/Hz12aKlMsBpKVmaJq
         XmFe5gh9cbEmMLxvcp1v/L5VxTJ2jBG8ZyUxXobo954RJcUagHow46mTUardTqG6xR+f
         HvYCDsJ2StuOyQp9RctcjzByok+xy4HmwLRar+88Bq88A1T9AVBni96C2n5QG/GcK4Ow
         L7DpZTDH5bY+Mtu9O1CQGXO1shyXvOw6Zeb9QWHkKi1J7K+k/rsoBcKK/UvC6QFamOei
         adVw==
X-Forwarded-Encrypted: i=1; AHgh+Rp9UvIvdwE5Id2uMFMToZ6WvBF4GfYvDUIRsPDO67gwbP/3pPlupE0iO40KX0J0S/dr9+zY9h/Tqs7Ywtg1raSc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2WKzA08Wr4l0yZK+2GJfUkwpTsJaaxTxOT55c3vDfM6f0Y8Pk
	GICkDce0jLFMLmiNxMRLCsf5OdrO1UrN+C6Rgf+igBLocERagBc6e4qWbAW5ARBdoE9jBGJxSWB
	vFgPWU/lOLhE1V0unIXsCCX+nS9K7j2g+/VsDDhSIQlPc9Jp9jfgcFtzeZC9//7a3xyDk5zsL2y
	ooZg==
X-Gm-Gg: AR+sD10oG/NY7uJRVZzeOJG+IoWHMsEo37N013wgi9Id0F7dLf4Q3mPwDC6a3roWv0i
	lmWLy5M//gfWn4zry3XzeE1Yda5+A02tzq2z/WebM+2DQFXLDSkWPZTPYOCdggaGNFmaRp6zm36
	Qk+x8Q+9+uDTkOsBwBOHrSFU+oJgs+Bz5aq9AWGUcw7PjO1py1b7+UTc2+04XsYj+hM/rghlLW2
	xXgyNhRE6+0wlL+4mZ6TZyRfJCa/bsStXaJ1qcQSDKNDZQ5q8w+g4mwvERuMbcUQtdz5hnsOZHz
	GL/Px5v1Z8JPOJooGUuoi4UY/aaa8FIHCRLu55csXFKQsGJxCWispJtoLV7T/V9AJZiq91y9618
	hDbUh1N8umqHPgRGtVfhRgfP4cuMEhgsgUmbksz1U7V7cfvmpdBSkgGvvQOvC/wUqSroKGj3skv
	fwwXyUMEQLCapfqwLEQ5GNeJ7RNg==
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464888b3a.35.1786982559211;
        Mon, 17 Aug 2026 09:02:39 -0700 (PDT)
X-Received: by 2002:a05:6a00:a219:b0:848:4c0c:9482 with SMTP id d2e1a72fcca58-84fde2bb2camr25464810b3a.35.1786982558539;
        Mon, 17 Aug 2026 09:02:38 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-851b6f8b189sm562883b3a.34.2026.08.17.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:02:37 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Chiu <andybnac@gmail.com>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
        Conor Dooley <conor+dt@kernel.org>, Deepak Gupta <debug@rivosinc.com>,
        Guodong Xu <docular.xu@gmail.com>, Guodong Xu <guodong@riscstar.com>,
        Hui Wang <hui.wang@canonical.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
        Rob Herring <robh@kernel.org>, Sergey Matyukevich <geomatsi@gmail.com>,
        Thomas Huth <thuth@redhat.com>, Will Deacon <will@kernel.org>,
        Xu Lu <luxu.kernel@bytedance.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: [RFC PATCH 0/3] RISC-V Sspesa: Linux perf precise sample attribution
Date: Mon, 17 Aug 2026 21:32:16 +0530
Message-ID: <20260817160222.3313295-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfX31yG1Tcmsb1K
 4o0+kjRNxQ4xG2DTlwMnquPvP8sgHPtdfOqwk8WoDHZFkRbXpElAGmt6v8ST4I+Hg9Ra8tMb+z3
 dd2yN4x7xl9MXLNU+Mp/QyuRqAnO48zDDYFEq4akqpSDhoATeqVRI2rVmweFrhqiq8Tk2uQK/9z
 5WhKo2dM4W4VzGlTAWx5UeAj9C7GJVa25j/Zsbz/JcgwqIwfmPHJ8M0OgRKsKgb3IfL25dceC9f
 VwcOBVoIgPdjX3KBv5zJOvt8WYeCN3FoUSEjFuEqQwrYFTOyjXMxRaVF2TX7eck8Ld0GT+0rV3o
 xSOol/mWLlj2z9iP++f8r3KCk9W32H4ckZ4Svfv7ojYWW3LHJXSaz1jKMpyjNcB3/7fy+XNjGQI
 SiCngV4080WMhcnpFFGsd5ou0mch6ltc+xPzujGM9lrAhIvR178sjQGYrkakayQ4bdV5l6icr02
 ewV5dyW1zY9FbqUvT+Q==
X-Proofpoint-ORIG-GUID: RMgOgrEZjzuEVKCKoMkQ2AR9pjxWA70j
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyMyBTYWx0ZWRfXzgokx8nlQbl7
 EkDpJ9RI508YiLXrsxM3BeJZA07NTfEPNOFdMspqztCg0ZRHlQabcesHsYvLtqSok3lcCSmVIWs
 DpCDFPG4tI4/Y4sIb+iT2aFLk385UZw=
X-Proofpoint-GUID: RMgOgrEZjzuEVKCKoMkQ2AR9pjxWA70j
X-Authority-Analysis: v=2.4 cv=WNhPmHsR c=1 sm=1 tr=0 ts=6a8330a0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=NEAV23lmAAAA:8
 a=8ilw5EQWc8m46JC1U7oA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_090241_632121_B2E1B4AF 
X-CRM114-Status: GOOD (  13.58  )
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

This Linux series adds kernel support for the RISC-V Performance Event
Sampling extensions Sspesa (Precise Event Sample Attribution) and
Ssplcofi (Precise Local Counter Overflow Interrupt).

The first two patches add the DT binding and ISA-extension detection
(Ssplcofi depends on Sspesa). The third patch uses shpmspc to report the
sample PC via PERF_SAMPLE_IP in the SBI PMU overflow handler, and
exports shpmsdata as PERF_SAMPLE_RAW.

Reproducing the full setup:

Sspesa support requires three projects: OpenSBI, Linux and QEMU. The
matching branches are:

  OpenSBI: https://github.com/mdchitale/opensbi/tree/riscv_sspesa_rfc_v1
  Linux:   https://github.com/mdchitale/linux/tree/riscv_sspesa_rfc_v1
  QEMU:    https://github.com/mdchitale/qemu/tree/riscv_sspesa_rfc_v1

To test Sspesa, build OpenSBI, Linux and QEMU from the branches above,
then boot Linux with:

  qemu-system-riscv64 -nographic -machine virt -smp 2 -m 2G \
    -cpu rv64,sscofpmf=on,sspesa=on \
    -bios /path/to/fw_dynamic.bin -kernel /path/to/Image \
    -drive file=/path/to/rootfs.img,id=hd0,format=raw,if=none \
    -device virtio-blk-device,drive=hd0 \
    -append "root=/dev/vda rw console=ttyS0 earlycon=sbi"

With all three in place, a counter overflow (e.g. 'perf record -e
cycles -c 1000000 -- <workload>') is attributed using the
hardware-provided sample PC (shpmspc) and counter ID (shpmsdata)
instead of falling back to epc.

Mayuresh Chitale (3):
  dt-bindings: riscv: Add Sspesa and Ssplcofi extensions
  riscv: Add detection for Sspesa and Ssplcofi extensions
  perf/riscv: Use Sspesa for precise sample attribution

 .../devicetree/bindings/riscv/extensions.yaml | 19 ++++++++++++
 arch/riscv/include/asm/csr.h                  |  7 +++++
 arch/riscv/include/asm/hwcap.h                |  2 ++
 arch/riscv/kernel/cpufeature.c                | 12 ++++++++
 drivers/perf/riscv_pmu_sbi.c                  | 29 +++++++++++++++++++
 5 files changed, 69 insertions(+)

-- 
2.43.0


