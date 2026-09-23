Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B07C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 01:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=; b=N3DXY/nTThNrk+kbhdrgFhEyDG
	5zOhbHt5ih6YCagidyyizEBCiBDWHJVjuf+XAfORD4aouNTAkPGP0slG144T3KNJd6Hbo+7q42ztS
	NL2kV7tRQTmKZyJxBw2UsbL/JvZe6d8lWg7qGbMk8oVOApBSmtfzxHLlO4kRVdKy1crSVlUBaSBRD
	fR78BgL3iF0Z+UwpI8AO/nZFpf0grfXsl4F5sf/W6K4lHF4ubfyLQ/jokP5xRvoToNjcQ0OWn3EVA
	w3TlCH2ZCC16fGYcgTISA69TQk00ZCANbSNDCgrFbHR7CgW3QkSwOhmjYRew4B8AASnAUqjV0abaq
	PqTaX/VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTi-00000006pTX-3yf4;
	Wed, 23 Sep 2026 01:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9BTg-00000006pS3-3bWi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 01:08:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MN8G9S1402749
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=; b=GBE+kOSK/CqNAn+o
	9BjNRHLqUPyaS9JsxcDhjZWVYqYJAdisIGuTVTfe8PUgeYWg7tFfBp/+xJnseghN
	wUUcYOCb1b+Iu8goskOlo0NoP/JqjnDQ/G4trRGeMlG+yt58Z7SushnAChxq3lOx
	2pG9iDsSShi1o94GOE/pLkm9hLq9edFJpsKxlSQDKV+zPoutoq/qrEodfxT4P4ht
	hK9keksXyJVwAHD4ISEV12QPlrtukFOGvdQ8OHzotsnnUcn2wKXqvgric4LYdrbH
	Vfvtj79m+tJ2LpHeZcfwXZTrIlaiV9kbwn1hXedhQjW/Fs9AopcGhrUx85t+nD2j
	iKhnoA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv3318ams-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 01:08:51 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-143803143c4so702217c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 18:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790125731; x=1790730531; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=gElRV6nYEVfcvxCPeiYfD6QSD4MpQ3j9cmKGDdgNhTKLl6pWwP0WxUTk0VzOGsOUfo
         yJViAyumal6RqY6zPKwdqIDhp+zI5N5xtMOl1KcEEklJAWCsneS4eSNnWm6Y+68KrJG4
         o42jrh9bC/4SghVPmei/cPXvXgRVPhbzgml6qJ1cotVo1EYDj4NFIqpsmtoYr0YwwA6U
         Ptfj3OJzGJOpcQOwfZwxROJ1W8tlxTBx2cApVkROPO7ipo3kt79TqfIlH0JVDBiCZIvl
         k/f0iuOzgJqb9yeI2LkXA0FNR6MtmPXkY/5jxeuY9nEXKbqD2GCqknwSzGwAWV4h0+Pf
         xjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790125731; x=1790730531;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ZerBeCGevQF6T0uEUCwyz6GqwStMRN5JeVph55bb08=;
        b=v0peSkn9SM4ZCFLlEIct/fk1bVxJIa3WL/i59XzgTUODN91BXvKYZmP8687NImEVlb
         56nj2nR1xLQVnpC78RjdriIxhP2c7VlDiDaiHnz1NMFeNU5kBMoYXG6HYRwh5x2RfCEh
         v/skxoRGxWNsKpM4k4wNaNSuR/0Ht5UXSFK8z1TS+T2HeS0bVmDwSw3fFwplNvFWq12y
         kIBdSjjXHp+z+Y2uSo23JxulzfnCcaTRpEhy8Zakr/pSde4CWNewF8oqFsLfJ42VQEtf
         nH2srihuHBzEqk0VaCS8IoNFPErpszrBWcUKVeWu6f0jIhlGlX3nDn2CmVpwLpk3Kl2X
         u+bQ==
X-Forwarded-Encrypted: i=1; AKwUvByZ6XZz9vdIYouQIsBINHPrCLzpOHVaDJXeYq0r9OTja9mZ5ChxjuXZo9hRuWTrhs074qeBj5qAcN0MXNYydz6T@lists.infradead.org
X-Gm-Message-State: AFuF++loiVMciH55mycw36bjZwIusP24gkAUX+KUQidLb2ETW5CK78Tt
	qjbWTK/9Fpww3KKvZzSRjBQW9zEc02g+c3O75DO/75inND2BcNRgOYLntRI1x0EunYXGVa0T5Xf
	vp/SjiPNt/ivYj67LWZpwklSAgwveitCdVjvQ+Rkpd5DROqxt5tivH9WRboxm8O32u5wmXqHh9s
	Ul9g==
X-Gm-Gg: AYBFou0hRmhUwRPFeUJj+WURFUiBl/0AHMQk1oalkANaz8GD9BDJN6Uq1FRb+qMqZ5d
	4FRZ7BTOVIzdMrKgXE1EWvuhUCbdaM6qXbGXFGUmnPCOUIPgxBK/MTaO50Q/wI8no8Gvlcwr0aA
	yGbWktqcsOac5Zjotxoz50pDS+55vor9Lg2UtmxtNBZq4zkHTddnVCZTgDxPo9oYz4iS85iDLRu
	gIaNCdxnErJWQ+3G78kHahD6vCUeOfjdmseqrdJE7XBzy1V8lOCX5Uzzr6uxN1KnZDaAp3Za5vP
	i3fd1gPOylL8aDRlnbXHHL6+qH2DV2buyVhWOIl20YWGAulQ8Zx4SxvUmZ/B1gwpGiYIBzfDc01
	lQr45Mdv/Jj47NSxTggnq0zsCWAJc
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248775c88.14.1790125730652;
        Tue, 22 Sep 2026 18:08:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8d:b0:143:4710:a888 with SMTP id a92af1059eb24-144f90c3714mr1248735c88.14.1790125729855;
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98ca0edsm1651831c88.15.2026.09.22.18.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:08:49 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 06:37:31 +0530
Subject: [PATCH RFC net-next 5/9] net: pcs: xpcs: initialize runtime PM as
 suspended
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-qcom_xpcs_nord_emac-v1-5-4b1c682af70f@oss.qualcomm.com>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
In-Reply-To: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790125674; l=1703;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=6L0tBYyplIQ6seGPWW4VFRe9yuGstOvOQquYgeMV1tk=;
 b=z3cMy7Tu8YHBAgVXBHBIIhABLigrMPxhWRGWgadww+VwRWN+w7Titd/SaYgoc53VgWiAjo5Ar
 wlhZvZF5Eb2C7XVC7uM3dKyoY9gjV2ZuDMXUWq4G02oNKHRWgzghSxL
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-GUID: X-ZDgY8c0kWmyu7ucZ88dL_GonnKmb_P
X-Authority-Analysis: v=2.4 cv=HdaB3SE8 c=1 sm=1 tr=0 ts=6ab326a3 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_2kQZa-5yrNbEit3ZwwA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: X-ZDgY8c0kWmyu7ucZ88dL_GonnKmb_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfXzWOXp0Ewfrzx
 gBmAHRPHgHHngBAaQpG8GV2I+Ant3MXv/xR5rXTsDWuMja9Kp+6hd66LKbf7pX2XMKi9zBy3u4I
 vqZW3YhrfKsHts1npXSCVE5M8jlkWQyR9rLFa+ef/h4jhbcL32IsAxiTfbIJkrLjb23VLdF/Tf/
 SY5VlUYCk4u/pKOrf1UpiJ4szFzAENExX2k3bpgSyCmH3hQGAWk2nslz44E3MuZLkTbL+XaH63V
 A/0hUkLu5OifPpjmgwhHljy2hHlQCY4KWmLFOTLa1Yl5CpF7JTpn39FnZpm0W888bZfeAIp+xNy
 hihRD2J16w8aGp10oP5QTZOWDUo4ro6vcrLBDE2+89y2cc0pNQiQf98FARVESe9W16XZIaHH4a+
 2jP1vnccYgGR03giy41PfDIt7HB+HT3xi/VrGKGDBmDA3k+IpiKNPG9keRZ/Wc3qxoR4lIqBvqs
 9MqwuaVqovp1eXAhl5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAwNCBTYWx0ZWRfX8aWIsqwBecTT
 /FJEopSHY4laE7itUZ943C4zHlCX/j5+WkT9cnSW8fOw4UFMUzISZNFl9hxgT1FkrYOy22vvmuU
 D/CJD3ED98T9UIOlvrqTMR2wU037XtY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230004
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_180853_023573_21174DAD 
X-CRM114-Status: GOOD (  17.50  )
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

xpcs_plat_init_clk() acquires the optional CSR clock but does not
prepare or enable it. Marking the device runtime-active at that point
makes the PM core assume that the hardware is already powered.

On Nord, once the XPCS CSR clock was described, the first
pm_runtime_resume_and_get() accessed XPCS registers without invoking
runtime_resume() to enable the clock. The matching runtime put then
invoked runtime_suspend() and attempted to disable a clock which was
never enabled, producing an already-disabled clock warning.

Initialize the runtime-PM state as suspended instead. The first
register access now runs the resume callback and enables the CSR clock,
while the subsequent suspend callback performs the matching disable.
Check and propagate the state-transition error as part of probe.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 drivers/net/pcs/pcs-xpcs-plat.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pcs/pcs-xpcs-plat.c b/drivers/net/pcs/pcs-xpcs-plat.c
index e013a5253a22651220e62352d03faabc3a3c3658..328c50940d46eb8e7bea06ecd1a20214e3cde61c 100644
--- a/drivers/net/pcs/pcs-xpcs-plat.c
+++ b/drivers/net/pcs/pcs-xpcs-plat.c
@@ -322,7 +322,11 @@ static int xpcs_plat_init_clk(struct dw_xpcs_plat *pxpcs)
 		return dev_err_probe(dev, PTR_ERR(pxpcs->cclk),
 				     "Failed to get CSR clock\n");
 
-	pm_runtime_set_active(dev);
+	ret = pm_runtime_set_suspended(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to set runtime-PM suspended state\n");
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret) {
 		dev_err(dev, "Failed to enable runtime-PM\n");

-- 
2.34.1


