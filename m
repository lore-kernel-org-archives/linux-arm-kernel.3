Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED0B8CC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=; b=GTZ767idBmSAe3
	j9OYJCnYhU67lKYmsCvZaG4Cg8Zsn7temh0vS2pcQTQ+U67eP4yYb1gQn+KQqKaCchXUQzbFGIxGP
	L127luK2IYnvVuhVd/vLqaZfChxJ+I4D5h2FIHHKIfH7+A4NfTnPiNojLFb9/LtWCWj92FZpmHnc1
	FowV0CscXNMglj4EvLxU4PnAd8eWFpsV0Cy3qY9K/FjUHfNgbhRPeJrvYISMPWNtTWR+ki2zYHqCy
	qARkBWaLPbCbHvT4Dfme+IMRQfqMsaZtUWCeZCLQ0F4gNo9IDQxm8VcYa7o5/e8Vg95ixZhOYLqJL
	zi6Y0AnWuEuGeaRz/E9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBR-0000000HM3p-2Ogx;
	Thu, 15 Oct 2026 09:55:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIBP-0000000HM3G-1XFu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:55:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kHZO1507238
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WyvZ8qBRw7K7we48lMPQ8H
	aYJ/8IJebU4K4q+EbfVCs=; b=CjuldHekRcv4/AMdaWpM6X8dp+Ef3pepSuvN6/
	piLKWiI1puXpU0TwZ7XLU7BSnVe8q2BwAHGiPWzhccsxHxVqR2HLXaUKhWSMMAri
	E3vt/zpLAKru1qTx4E2RYx+LgMb0SpxOPwMuqK8K6uEt7T2ZWyDDETNbmLsp6MUq
	dkVNsH3ImuRT/H/jBdij1ajJHjZ0IhCDgLUPGDawxFkBsWWuP/PgZFbrPeFzWLg9
	v+CjU5qp+vsp4L9siWAhMuByH1NCRs7/0aY2sAaFeLhRnnWB6VLkBpJq+N1K/HJR
	0qoY31BG33rRYg15D+eQuevIqUqFqoxdpMxeArRhVWJ4U7TQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7bpcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:55:29 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1663fb7e005so6516001c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058129; x=1792662929; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=Sd6MFW4HlnbENgQTdWtXtkEJcy1qkgqlmeVBBvyGfn7tVN5heAVHHrbwUorX44jkk1
         O2DYOXkZ22XQFAK6AeVnnuNA5nsSqUh1xaOvtAMmDgfPmYWvITNHmjwt8KQrc1HqyRwT
         xrJULt8siefPnkjftqtSQ9DhlHUlFdthJifcCPTKslkN4690eVwQV92j2iJu2OjXz7YE
         DnRoEwBoCX5PvkEWIJAldkPymgf1C0CUfjgkWQIvOkzSUr4eg22iJIIxC7Jkn2KXaJwo
         9kA6n9NjBCFAhKDgefazdKS8g7I28Wj3EgEkgOgkXbgY0pkwgQ0YNYiCdRHDIka2TNXS
         stxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058129; x=1792662929;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyvZ8qBRw7K7we48lMPQ8HaYJ/8IJebU4K4q+EbfVCs=;
        b=R/DQryovFSqPXO1zDAFkEO58vhOeWOq/41khb9ijxBpSW+4OdDfffQy+0wsW+j+7m4
         ET5pVFw++TEM8eQYQV4FX6iuuDNMTb79JGlz5T4yAmf9lUE8omTdVllV/7635NU/yCDD
         xvQQnb6/bZ4bbcZrM0zoxdfWqc/8n5XSIYnr6E53vtAWtPQvDi0SF8qo2jlGD1q4LZnw
         oCpKzNWj2eGz9yE0SdvT1If7oJv3HPrI93sL6LpWS7toALNCLf3xCsz2YDXkrWPTWph7
         soUw1d8Y1uTjDZvXsUQJW2eJ32rNAX8G87rnU53nqSpoNLLoUhHEZXEYBmMOpZ+EIoCt
         G4zQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5ZmR/mF8v5m+o2yUgBTGBAx19Gg/wBpP8sm80dqSLMnjFCGDkYtHMUKcbGi8heCJ1SPGEckgcu5+IkNwY2rZO@lists.infradead.org
X-Gm-Message-State: AFq9FYIat8Vk4TlMMIKNuuvGTeseQ7Jke4edGKiGkO5yyC0Y3vGKJE12
	9ureNsoTVknRaSjS2NEO33+5tzr60681TmnLh8vVY+R7r7H50lA+XZ61ZRC/eVJwqMt+e7EfWQQ
	b+gCuefrAW6F1doojo9uiQBJ4mEqx0vqDc8QrkAFgXSDbsGqYgBqL1c8SB7dXWvXse1I3DeA0nM
	4BEA==
X-Gm-Gg: AYBFou31CSRlI0ahiMgbzIwE809Z6L4eVMy3IBDVWg/u5XMEiGWGZCmN9RFh4QMV50p
	dWVUfZKV9R9mjmtv97A5CIuLIAbVvBhKXWsFgDSwjPmqwxJ/XjZafCACi60V8To0w9C/LfCvozt
	FiYQh8vvK1E3DCok0tFe/hVRkuBHtD3vN1jO6UHWqEk+g0MepZg+Ky54BZoEi1SaLZRN64CA8CK
	Ogsy2RsOVmJcvfZcF5BDIh/8+tNPxvK9/TdIMWVnUHROQBvgbreWD4AqJCFc4Pe7n+iCP51gMZb
	N67Ub0865TKEb44Zt7u5aJH8Ry4dQL2L52iLOF33mG/tIz2MJbtBfwySsWjn/2p5aUsU5/qM8lq
	+A9RAwKY2p3BqS2VkWXBOsmUVTWsf
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478710c88.24.1792058128734;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34478673c88.24.1792058128170;
        Thu, 15 Oct 2026 02:55:28 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:55:27 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Subject: [PATCH v2 0/9] Add fallback method to handle RPM notification in
 MPM driver
Date: Thu, 15 Oct 2026 15:25:16 +0530
Message-Id: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAASj0GoC/3WNyw6CMBREf4V0bQktCOjK/zCE9HErNwLFXiQaw
 r9bce1mkjPJnFkZQUAgdk5WFmBBQj9GkIeEmU6NN+BoIzOZyTIrRcV1wanDe1BtPw2tshbnOOG
 FOmlTS60cAIvjKYDD1y6+NpE7pNmH9/6ziG/7U1Yi/6dcBM94butjbZ00WruLJ0ofT9UbPwxpD
 NZs2/YBUE4ZIMMAAAA=
X-Change-ID: 20260617-b4-shikra_lpm_addition-4a9bc82bafee
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=3659;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=zuvXFCHS/nhMByhn2p8KGe6GFveXurDavEHYPA7bF4M=;
 b=WTrWPEBOlhihxP5STVHc3U/9SmT+/GsHtaqtSGhtK5ss4NjY4PwYW3OHGhtEapOyWneHym7vl
 VgOrUS5UeqmA5+3bw5BKAmxpZ/fDLIZXaGuUKDGttS66p9mNmd7mwxa
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad0a311 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ag1SF4gXAAAA:8 a=EUspDBNiAAAA:8 a=-g7Su3eQ9jgtFDl0TfQA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-GUID: haqYpWiiI7l-5kfZKf2-xXnoO6WtoxLp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX2PZKwofyursU
 WMizxT8599cMZFeLO25uGcaOz8bY52OH57FMFKPdjgHOvmiwefKwCdpWKHi5qOe8sDpBTqU2QRT
 v8hSyqp140nusQ9EIlg3bZV3xBTo7ETAjAmKATABygYKomJmx7agiQ2piBy2raaEN8NPED8iY4L
 gqIntJKfzsId3WWvA8Exwp67yRAuaXUpt9NQ8aNpINVu2uTJW0JlAXLo/2bWjnJ8pFQhfe2ZOTB
 VECh+2wtSB+/Of7AFp8u87Su33Xn7GhW2riFAHhBUJhe6+hAqkC/2RP1n+EkywYBbAqBAmonHUj
 u4I03PW0WQ52d2170pjc7wb9PNTbKcDcRXhhqJTML5un5Id4/76nM5m2cPRL2TRi90mK4UyJLQ5
 B901OJeKPLA3M6KWki5bAPSwA8LljR1aVj57nCMx+Dl+Ngxa64Ez5SR5k61THUiX100QObHPQJB
 BYa3oDRQNHfduA3Pd3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfXz2zueHxVXNgR
 ix8/Mlo31dpSMeLw/OMS5gVr2qCYAamGfaud1hJoCFkTgJEXh5kXECXfojoyz4p4ZnYFGoeuvpR
 92fGHChHHcgohCVoi2C6ucCPcpJ9G1U=
X-Proofpoint-ORIG-GUID: haqYpWiiI7l-5kfZKf2-xXnoO6WtoxLp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025531_446736_1D892F6E 
X-CRM114-Status: GOOD (  18.26  )
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

MPM irqchip needs to notify RPM (Resource Power Manager) processor to read
the latest wake up capable interrupts when the CPU cluster is entering the
deepest idle state. This is done by sending IPC interrupt to RPM and is
implemented as .power_off() callback by registering MPM as parent power
domain to CPU cluster.

Such implementation earlier introduced a hard probe dependency between MPM
irqchip and CPU cluster power domains. That is MPM irqchip needs to finish
probe before PSCI power domains are probed.

The above problem has since been resolved after bd7f488a8e5d ("cpuidle:
psci: Fix support for probe deferral by dropping the faux device") / [1].
However, it makes sense to remodel the RPM notification in MPM irqchip due
to general consistency.

MPM is not really a power domain provider, all it needs is a notification
when CPU cluster is going to power collapse to carry out the RPM
notification. We can register for CPU_PM notifications for that purpose.
This way we can avoid such unrelated dependencies.

We cannot register MPM under CPU cluster power domain and rely on
GENPD notifications here, since that way cluster low power modes will be
blocked whenever some consumer of MPM, and in turn MPM itself, are
runtime active. This will add another unnecessary dependency for CPU
cluster low power modes.

For now as first step, register with cpu_pm as a fallback to manage RPM
notification. Trigger the RPM notification when the last CPU in CPU cluster
goes to power collapse.

Add support to program MPM wakeup timer when CPU cluster goes to power
collapse.

Enable CPU and CPU cluster LPMs for Shikra, and CPU cluster LPMs for
qrb2210-rb1 board.

[1] https://lore.kernel.org/all/20260909134240.685115374@linuxfoundation.org

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Enable Shikra LPMs in the first patch, following patches concern
  MPM driver.
- Register with cpu_pm as a fallback to manage RPM notification.
- Move USECS_TO_CYCLES and xloops_to_cycles to common header delay.h.
- Reformat qcom_mpm_offset() as per feedback.
- Avoid deleting cluster_pd node in qrb2210-rb1.dts.
- Link to v1: https://lore.kernel.org/r/20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com

---
Sneh Mankad (9):
      arm64: dts: qcom: shikra: Add CPU idle states
      irqchip: irq-qcom-mpm: Register MPM with cpu_pm for RPM notification
      arm64: delay: Move USECS_TO_CYCLES() to generic header
      irqchip/irq-qcom-mpm: Prepare common access path for timer and pin regs
      irqchip/irq-qcom-mpm: Program wakeup timer when CPU cluster goes to LPM
      arm64: dts: qcom: sm6375: Do not mark MPM as a power domain provider
      arm64: dts: qcom: agatti: Do not mark MPM as power domain provider
      arm64: dts: qcom: qrb2210-rb1: Enable CPU cluster low power mode
      arm64: dts: qcom: shikra: Do not mark MPM as power domain provider

 arch/arm64/boot/dts/qcom/agatti.dtsi     |   2 -
 arch/arm64/boot/dts/qcom/qrb2210-rb1.dts |   2 -
 arch/arm64/boot/dts/qcom/shikra.dtsi     |  93 ++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm6375.dtsi     |   2 -
 arch/arm64/lib/delay.c                   |   8 --
 drivers/irqchip/irq-qcom-mpm.c           | 166 +++++++++++++++++++++++++------
 drivers/soc/qcom/rpmh-rsc.c              |   8 --
 include/linux/delay.h                    |   8 ++
 8 files changed, 236 insertions(+), 53 deletions(-)
---
base-commit: 7777cc195ca1301a28008ca5cdb98bdb2a9d0def
change-id: 20260617-b4-shikra_lpm_addition-4a9bc82bafee

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


