Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8D0CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 09:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=Kci84t0FXQTrRJ0S2t+AUH0BVm
	TrBK74BEXmISp63EY41nvH9PmXghMfgQs9rYOX0fjqcoyVx7ugERYWV3jQwGLRSQmz9ULIeo4wv4T
	jpYu9Txw84hRiiPkVhD6rmDDKCSTn/kffminF6mkaBdFVFuiOOwCgpXioWB+rXL2EjP0TosIr5YlQ
	eXUTGNcJEHEvTbAW5x1MbjzOxO9U+liq5wFg2ZKRca3/IwxHqpAPUMEihEjWPHWgv3Y/wNg/TRlIh
	9cShmCbkDOAoO9ie5sViWgVgUuNWRF9TSIUFEZLDZ87x2z4ojPz7PUXcWt8pz2UgWZFyE7wUXJEtv
	v0ZrGK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zr-00000004dd2-0rE8;
	Sat, 17 Oct 2026 09:46:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI0zn-00000004dbF-22b4
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 17 Oct 2026 09:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=qMFd66hWwTQiAAdGVp6vq8J9tA
	ICRO1vRsD0811OVPK/GeOTQL4E2UsWPrwtT31sq5LS47tvIYR2OWAjv+euB0GB5q74NlDeGiFdN8i
	UuElfHMFjW6kNuPAnHPTZIM1joO16nii7Py4oVFJp330IAsmuccLSdyJvtbnVNQdP39xvfO3nVLGP
	efzOJs18lcDiQ9st/wqLXXQQobv1BTjxEcnQ0s9kgN96iN401tQQbyCYnjCVSrl+B00FEcNsn0xgH
	MCnWw3XIL3ajHDZPKhll2Tp3gqKe0IR1zbkqA0Kg7Uz4KHdmm/vKDyJOxxaJhogYEMdi9Br+K8Q7/
	XA6ViA8w==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xI0zj-00000002HLP-06C4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 09:46:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69H6oFSB047197
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=; b=oy7JcGWyEuzYQ3r8
	gYpKhW6DhfMXbdHV339j851MenRdV+yKSLpKD2DxeqzhPTy8ke0XdBDG7qj+KS3n
	ANukqof2EimQ0gc90Y2/8LkzgdpHVkAa26wgJSReWJHXbZXxpuWwXpK+B+Fp6/DF
	kXkWemia0zysztzlcQp0rqQR6rTJKcZOMeA3vyGlS2TOkTyxNDTjpvnH0aYyRZeS
	KPGGwCvEL0ce1N/HOdQILTcI5gee4KXR+Iw+InTFdrPTwt+QeeOougt0tM4umtHl
	luC7MZMw3ass6PuZ0QmaEodmQcJyJ05llYeAChOx27ZnaLzvoAsZfm4aff6UMq+D
	4njxXw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc0bggqed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 09:46:22 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so2509770c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 02:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792230381; x=1792835181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=Fq1ne0f606374PQNAaJxlEMWE0PcIlwf5aqX+FyeeKoamsu8UCDDrUWKO+M5vHmD++
         FBYdcRBaxEldURH2z9mu5sXBzaUXngx3oUAAW0/OQrIgW6GSp+MOqPD8A7MIBoSuhwVK
         70DfSn3Av9QLVOjNQYgLTg8eXQ0HwY/utvQI3rXh4UNUaxVwyMpYyhkCqJZAKit78jY2
         1Ze2iBEY8ebWM74ih+h3huOg52jC5TuGsEdhl0mqSTN49hdOELpVHAD6AEcV6WvMy+46
         6fmEppuJv9Sjr8NJu3V087LLYzQ0eWkFCBEJIbxVgO1xGzWFhdrIL4jp8ynnPbjnPJRb
         pSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792230381; x=1792835181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+HYeP9I0GCFZQ5ANdwKliPovJIbIMV4i61aW+Ci2/bg=;
        b=F83O0Wvyms/gyE9/A2LV8KTxlKWoUnVpy/lBa7/hV1PqMdX0+2N/a9aiwceCmgARE5
         QjAVaiDHJXBvmsJGsF/1EMAzycq+uSSZTw0I4HtlVYtcR+nV+3pGRUt4fdUAFNOSFK6i
         cZVizH5aZK5kCJ7PhKR1klSzqD0dlmpoWJ2FD0lurHe+3OPHW54lP2yoW9/V6P8CJip1
         AsXm2V0sAZBTjjqYTlbSQ9fdLG4Yd8yO5T7yh6dv3Agt6zWiZTP4mj/CtHTXXvIL8D1A
         AgKyEBaVw5tHo/AqakeLYhTzhYsPML5Vk3HuhMAjlZ3fcyFZCIX4LbT2LgQiqVDYZNo5
         Uz1Q==
X-Forwarded-Encrypted: i=1; AKwUvBzpRC7GT6N7uqq8QpqWFjCXCnnfviqv1QA9hmP/ZDRikX2u+xq2EXdi3EjkbFBHDOCY0UicFxwNtgOOFl0qmKSv@lists.infradead.org
X-Gm-Message-State: AFq9FYI0Kl0q9FSNZhZ8GRLjIYqnrE+fWTiyzYNwD/PbGqHjLf3zXPct
	4IVL51PWSb3WQkx0ZUMvtvmBF8GxgyrjQ9ccC94b+Cwfhgb1gpWCd29FdnSvhGmUP0wtlVf1ejw
	5hP++spjFTJTfOJfXUt50LLQWqROn2jD5fs3T85738Wuh5/Q2xp+QKMUFjGdT0FYjFvBD3z53Rc
	eSgQ==
X-Gm-Gg: AYBFou0cgCPsj/N7xKo2KyzcOMrwoPcbuaUklBZpbGCJnSGKaO+002CSx60Sn3OhgGt
	Q9Bk48rD/lb8MmtdUxL2hE46Mdv4msNjLonMgL6azZwQafqCeNwd8gKMZoyCsZuwiMLQeje7DXD
	ydkMpR8KHU1+y95judFs8Ig8q0CVNo4Ch9F4G4msoPwPWylBgcOzby5NyahjmOQUYT65K7aqglo
	LCJ0VmElfc6ikt6berBEb8NC3LgNu1j0YJJKBNOzP2YBPtRz4dkEzmm+7ieKR0n1Jmmipnxiw3a
	eiWx//uuLsOTzuukl1CnYo2WLBkhx5UzU71m7XVy4QFqJrMGYnH7/YqPJ5uwjlI1CkGr26eE6UC
	66Nrj1zB1Zthel9zg6jJsNd2C9hLqHQ==
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139779c88.37.1792230381168;
        Sat, 17 Oct 2026 02:46:21 -0700 (PDT)
X-Received: by 2002:a05:7022:ea50:b0:184:ad2a:d1fd with SMTP id a92af1059eb24-1851434f3a6mr3139733c88.37.1792230380448;
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831a6f58c2sm19450327c88.11.2026.10.17.02.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 02:46:20 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 15:15:16 +0530
Subject: [PATCH net-next v3 5/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-shikra_ethernet-v3-5-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
In-Reply-To: <20261017-shikra_ethernet-v3-0-26a8beb44b8f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andrew Davis <afd@ti.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792230324; l=1435;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=OvmGJXWTrtFVyiq8kkMO2myxFyrf9kt4/dp6hHNffZ4=;
 b=ZnbcXm8Z2hi1B/lA4I2DjR/FLx1XW9n3Nru6ekJc69aowa7T3fWHXOPwCuPq/FxiJ/AKG4EC8
 Xn8j+raOiQ3A23k87poAvNp7QKPVaWHVZfXDNKxbKGRYZMUyb3vkDZc
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX793WCR32LD/A
 MIgnabOYRoDjHHNLOfHpExhOTsHszeggSwzXsXuBU/Gb1t7h8zezbQ+ob7uf/rzso8+QBCFm1H8
 s2iIMEdkfj///DqbjjInERBx+q5hAI4=
X-Authority-Analysis: v=2.4 cv=FayiV5+6 c=1 sm=1 tr=0 ts=6ad343ee cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=VSm8jR0bnqFplKljzc0A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDAzOCBTYWx0ZWRfX5VEuITBpMOoE
 uMjm9eMQ5uM/BsvMg502OGBQSBVIqkXSfC7HQN3OabZ7VsKdE1Qa0ck0yviGsQOU9FvMerBePEC
 d6L4HqOP3l/EnkdHAJW+WRZ5a+zc+Rc15/Z6l+/P4LSh1hyBcnmE1VULukdGINll9VtNLrHaam0
 EpNqw8QDapDm2eyN1HgJf/Xa6HDp7nHnMaX9iSr+Z6YNk8HNaSxgR1BVcEknSY/P+9OfifL4Zs+
 m3FRlGDaJ8/ztOMAh37H5mNUcizI0tsPVOz0hwEZvoIAaOb+899sYZ1JFGecpF1vmP49junXLTo
 QPVLBcNI7vhk0aOUlNIGjm0YyDgE4k8ua5McIY/uOZmmJyylhrvnFQ7PIXx2IAw1a+OgewFQ+XI
 NornHp3H9PPq9mqGhgQAMmBwpzJBH9RerSyeDRO+zeUJHbFasCFmZKPLFRa2TVophbTFvo8PzgL
 Ca+nFT0u2FnIcYKKKhQ==
X-Proofpoint-ORIG-GUID: LvxiMsm-a7x28S5ntDrnilcTIiBuLO8D
X-Proofpoint-GUID: LvxiMsm-a7x28S5ntDrnilcTIiBuLO8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_104627_808693_63D08FB2 
X-CRM114-Status: GOOD (  16.49  )
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

The qcom-ethqos driver is moving towards using "rgmii-id" together
with PHY-provided delays. However, existing DTBs use "rgmii" and
"rgmii-txid" and must remain supported for backwards compatibility.

Warn when either of these legacy PHY modes is used to encourage users
to migrate to updated DTBs using "rgmii-id".

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 53fb9de4d92c7f1b3c51c183064024f06150444d..a92bf4a6a2dbd987893bd4a3890df770bb7a7e56 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	ethqos->phy_mode = plat_dat->phy_interface;
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
-	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
+		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");
+		fallthrough;
+	case PHY_INTERFACE_MODE_RGMII_ID:
 		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:

-- 
2.34.1


